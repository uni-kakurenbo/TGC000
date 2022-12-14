#!/bin/bash

# rm -fr ./testcases/in
# rm -fr ./testcases/out
# mkdir ./testcases/in
# mkdir ./testcases/out

M=(
    # H W N P
    "3 5 17 1"
    "5 5 30 5"
    "10 10 120 3"
    "50 50 1000 5"
    "50 50 1000 10"
    "10 100 5000 50"
    "10 500 10000 50"
    "50 1000 30000 100"
    "50 1000 50000 50"
    "500 500 50000 50"
    "1000 1000 50000 100"
    "1000 100 2000000 12"
    "1000 1000 2000000 8"
    "1000 1000 2000000 15"
    "2000 1000 1000000 15"
    "1000 1500 1500000 20"
    "2000 2000 1000000 5"
    "2400 2400 1000000 10"
    "2400 2400 1000000 20"
    "2400 2400 1000000 30"
    "2400 2400 1000000 50"
    "2400 2400 2000000 5"
    "2400 2400 2000000 10"
    "2400 2400 2000000 20"
    "2400 2400 2000000 30"
    "2400 2400 2000000 30"
    "2400 2400 2000000 30"
    "2400 2400 2000000 50"
    "2400 2400 2000000 100"
)
# N=${#M[@]};

i=1;
for m in "${M[@]}"; do
    j="$i"
    if [ $j -lt 10 ]; then
        j="0$j"
    fi

    tmpfile1=$(mktemp --tmpdir=.)
    echo "testcase-$j $m" > "$tmpfile1";
    ./generator.exe < "$tmpfile1";
    rm "$tmpfile1"

    i=$((i + 1))
    echo $j;
done

./call_verifier.sh
