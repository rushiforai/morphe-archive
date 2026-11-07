#!/usr/bin/env python3
"""Builds the Lichess Puzzles offline packs from Lichess's puzzle database (CC0).

The app downloads them from the lichess-puzzles release of ImNoammm/Noams-Morphe-Patches:
lichess_offline_puzzles_{20k,50k,100k,500k,all}.csv.gz, each with the columns
PuzzleId, FEN, Moves, Rating, Themes. Needs curl and zstd.

Usage: build-lichess-puzzles.py [output folder]
"""
import csv
import gzip
import os
import subprocess
import sys

SOURCE = "https://database.lichess.org/lichess_db_puzzle.csv.zst"
PACKS = [(20_000, "20k"), (50_000, "50k"), (100_000, "100k"), (500_000, "500k"), (None, "all")]


def main():
    out = sys.argv[1] if len(sys.argv) > 1 else "."
    os.makedirs(out, exist_ok=True)
    curl = subprocess.Popen(["curl", "-fsSL", SOURCE], stdout=subprocess.PIPE)
    zstd = subprocess.Popen(["zstd", "-dc"], stdin=curl.stdout, stdout=subprocess.PIPE, text=True)
    curl.stdout.close()

    files = [gzip.open(os.path.join(out, f"lichess_offline_puzzles_{name}.csv.gz"), "wt", encoding="utf-8", newline="")
             for _, name in PACKS]
    writers = [csv.writer(f) for f in files]
    for writer in writers:
        writer.writerow(["PuzzleId", "FEN", "Moves", "Rating", "Themes"])

    # Lichess's columns: PuzzleId,FEN,Moves,Rating,RatingDeviation,Popularity,NbPlays,Themes,...
    reader = csv.reader(zstd.stdout)
    next(reader)
    count = 0
    for row in reader:
        if len(row) < 8:
            continue
        count += 1
        pack = [row[0], row[1], row[2], row[3], row[7]]
        for (limit, _), writer in zip(PACKS, writers):
            if limit is None or count <= limit:
                writer.writerow(pack)

    for f in files:
        f.close()
    if zstd.wait() != 0 or curl.wait() != 0:
        sys.exit("downloading or unpacking the database failed")
    print(f"{count} puzzles")


if __name__ == "__main__":
    main()
