#!/usr/bin/env bash
# seed-gallery-fixture.sh — write a reproducible Phase 2 gallery fixture.
#
# Creates <dir>/tw-bookmarker.db (plus decoys that must be ignored: a leftover
# linux.csv from the CSV era, index.json, linux.csv.bak, .hidden.csv, notes.txt and
# a subdirectory) with rows that exercise the gallery read path:
#
#   * a 4-media tweet, a 3-media tweet, a 2-media tweet, a 1-media tweet
#   * text-only tweets (media = [])
#   * an empty collection (design: a collection row with no bookmarks)
#   * a malformed media cell ("not-json") and a malformed row (empty author)
#     inside the `ai` collection
#   * searchable author/username/text mixes ("wayland", "Linux", "@linuxguy")
#   * newest tweet == newest bookmark == row 1, so every sort mode has an
#     unambiguous expected first row:
#         saved_desc / tweet_desc -> ...001
#         saved_asc  / tweet_asc  -> ...008
#
# The database is written by python3's own `sqlite3` module rather than by the Go
# code under test, so a bug in the backend's writer cannot mask a bug in its
# reader. The schema below is a deliberate second implementation of
# backend/internal/db/schema.go: it is what proves the backend can open a database
# it did not create.
#
# Usage:
#   scripts/seed-gallery-fixture.sh [DIR] [--fresh]
#     DIR      storage dir to write (default: a fresh mktemp dir)
#     --fresh  delete DIR first (accepted in any position)
#
# Prints the storage dir as the final stdout line:
#   DIR=$(scripts/seed-gallery-fixture.sh /tmp/twbm-fixture --fresh | tail -1)

set -euo pipefail

DIR=""
FRESH=""
for arg in "$@"; do
  case "$arg" in
    --fresh) FRESH=1 ;;
    -*) echo "seed-gallery-fixture: unknown option $arg" >&2; exit 2 ;;
    *) DIR="$arg" ;;
  esac
done
if [ -z "$DIR" ]; then DIR="$(mktemp -d "${TMPDIR:-/tmp}/twbm-fixture.XXXXXX")"; fi
if [ -n "$FRESH" ]; then rm -rf "$DIR"; fi

rm -f "$DIR/tw-bookmarker.db"
mkdir -p "$DIR"

python3 - "$DIR" <<'PY'
import datetime, json, os, sqlite3, sys

d = sys.argv[1]
now = datetime.datetime.now(datetime.timezone.utc).replace(microsecond=0)


def ts(days_ago):
    return (now - datetime.timedelta(days=days_ago)).strftime("%Y-%m-%dT%H:%M:%SZ")


def media(*names):
    return json.dumps([f"https://pbs.twimg.com/media/{n}.jpg" for n in names])


# The schema, mirroring backend/internal/db/schema.go (version 2).
SCHEMA = """
CREATE TABLE collections (
  id         INTEGER PRIMARY KEY,
  slug       TEXT NOT NULL UNIQUE,
  name       TEXT NOT NULL,
  created_at TEXT NOT NULL
);

CREATE TABLE bookmarks (
  tweet_id      TEXT PRIMARY KEY,
  collection_id INTEGER NOT NULL REFERENCES collections(id) ON DELETE CASCADE,
  url           TEXT NOT NULL,
  author        TEXT NOT NULL,
  username      TEXT NOT NULL,
  tweet_date    TEXT NOT NULL,
  saved_at      TEXT NOT NULL,
  text          TEXT NOT NULL DEFAULT '',
  media         TEXT NOT NULL DEFAULT '[]'
);

CREATE INDEX bookmarks_by_collection_saved
  ON bookmarks(collection_id, saved_at, tweet_id);

CREATE INDEX bookmarks_by_collection_tweet
  ON bookmarks(collection_id, tweet_date, tweet_id);

CREATE TABLE deleted_bookmarks (
  id            INTEGER PRIMARY KEY,
  tweet_id      TEXT NOT NULL,
  collection_id INTEGER NOT NULL,
  url           TEXT NOT NULL,
  author        TEXT NOT NULL,
  username      TEXT NOT NULL,
  tweet_date    TEXT NOT NULL,
  saved_at      TEXT NOT NULL,
  text          TEXT NOT NULL DEFAULT '',
  media         TEXT NOT NULL DEFAULT '[]',
  deleted_at    TEXT NOT NULL
);

CREATE INDEX deleted_bookmarks_by_tweet
  ON deleted_bookmarks(tweet_id, deleted_at DESC);
"""

path = os.path.join(d, "tw-bookmarker.db")
conn = sqlite3.connect(path)
conn.execute("PRAGMA journal_mode = delete")
conn.execute("PRAGMA synchronous = full")
conn.executescript(SCHEMA)
conn.execute("PRAGMA user_version = 2")


def collection(slug, name):
    cur = conn.execute(
        "INSERT INTO collections(slug, name, created_at) VALUES(?, ?, ?)",
        (slug, name, ts(0)),
    )
    return cur.lastrowid


def bookmark(cid, url, media_cell, author, username, tweet_date, saved_at, text):
    conn.execute(
        """INSERT INTO bookmarks
             (tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
           VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)""",
        (url.rsplit("/", 1)[-1], cid, url, author, username, tweet_date, saved_at, text, media_cell),
    )


# linux — 8 readable rows. tweet_date and saved_at both run newest(row1) -> oldest(row8).
linux = collection("linux", "Linux")
linux_rows = [
    ("https://x.com/linuxguy/status/1000000000000000001", media("a1", "a2", "a3", "a4"),
     "Linux Guy", "@linuxguy", ts(1), ts(0),
     "Wayland on Linux: a four-image thread about compositors, tearing, and HiDPI."),
    ("https://x.com/linuxguy/status/1000000000000000002", media("b1", "b2", "b3"),
     "Linux Guy", "@linuxguy", ts(2), ts(1),
     "Terminal workflows that survive a reinstall — three screenshots."),
    ("https://x.com/tilingfan/status/1000000000000000003", media("c1", "c2"),
     "Tiling Fan", "@tilingfan", ts(3), ts(2),
     "My tiling setup after two years, two images."),
    ("https://x.com/kernelnotes/status/1000000000000000004", media("d1"),
     "Kernel Notes", "@kernelnotes", ts(4), ts(3),
     "One screenshot of the new scheduler trace view."),
    ("https://x.com/linuxguy/status/1000000000000000005", media(),
     "Linux Guy", "@linuxguy", ts(5), ts(4),
     "Text-only: why I finally stopped distro hopping. No media here."),
    ("https://x.com/shellpilled/status/1000000000000000006", media(),
     "Shell Pilled", "@shellpilled", ts(6), ts(5),
     "Text-only: a short note on POSIX shell quoting."),
    ("https://x.com/linuxguy/status/1000000000000000007", media("c1", "c2"),
     "Linux Guy", "@linuxguy", ts(7), ts(6),
     "Wayland vs X11, again — but with benchmarks this time."),
    ("https://x.com/tilingfan/status/1000000000000000008", media("d1"),
     "Tiling Fan", "@tilingfan", ts(8), ts(7),
     "A single screenshot of the new status bar."),
]
for url, cell, author, username, tweet_date, saved_at, text in linux_rows:
    bookmark(linux, url, cell, author, username, tweet_date, saved_at, text)

# ai — 4 readable rows, one with a malformed media cell, plus one unreadable row
# (an empty author) that the reader must skip without losing the collection.
ai = collection("ai", "AI")
ai_rows = [
    ("https://x.com/aiperson/status/2000000000000000001", media("d1"),
     "AI Person", "@aiperson", ts(9), ts(1),
     "Local models are finally good enough for a personal archive."),
    ("https://x.com/aiperson/status/2000000000000000002", "not-json",
     "AI Person", "@aiperson", ts(10), ts(2),
     "This row has a broken media cell and must still render as a text card."),
    ("https://x.com/aiperson/status/2000000000000000003", media(),
     "AI Person", "@aiperson", ts(11), ts(3),
     "Text-only thinking about retrieval without a vector database."),
    # unreadable: no author; must be skipped, leaving AI at 4 posts
    ("https://x.com/aiperson/status/2000000000000000004", media(),
     "", "@aiperson", ts(12), ts(3), "This row has no author and must be skipped."),
    ("https://x.com/promptsmith/status/2000000000000000005", media("c1", "c2"),
     "Prompt Smith", "@promptsmith", ts(13), ts(4),
     "Two images of an eval dashboard."),
]
for url, cell, author, username, tweet_date, saved_at, text in ai_rows:
    bookmark(ai, url, cell, author, username, tweet_date, saved_at, text)

# design — a collection with no bookmarks: post_count 0, media_count 0,
# last_saved_at null.
collection("design", "Design")

conn.commit()
conn.close()

# ------------------------------------------------------------------ decoys
# None of these may ever appear as a collection. linux.csv is the interesting one:
# it is a complete, valid CSV from the era before the database, and its row would
# change the Linux post_count to 9 if anything still read it.
with open(os.path.join(d, "linux.csv"), "w", encoding="utf-8") as fh:
    fh.write("url,media,author,username,tweet_date,saved_at,text\n")
    fh.write(
        'https://x.com/leftover/status/1000000000000000099,"[]",Leftover,@leftover,'
        f"{ts(1)},{ts(0)},a leftover CSV row the database must ignore\n"
    )
with open(os.path.join(d, "index.json"), "w") as fh:
    fh.write('{"version":1,"tweets":[]}\n')
with open(os.path.join(d, "linux.csv"), encoding="utf-8") as src:
    body = src.read()
for decoy in ("linux.csv.bak", ".hidden.csv"):
    with open(os.path.join(d, decoy), "w", encoding="utf-8") as fh:
        fh.write(body)
with open(os.path.join(d, "notes.txt"), "w") as fh:
    fh.write("not a collection\n")
os.makedirs(os.path.join(d, "subdir"), exist_ok=True)

# ------------------------------------------------------- read back and check
conn = sqlite3.connect(path)
version = conn.execute("PRAGMA user_version").fetchone()[0]
posts = conn.execute("SELECT count(*) FROM bookmarks").fetchone()[0]
cols = conn.execute(
    "SELECT c.slug, count(b.tweet_id) FROM collections c "
    "LEFT JOIN bookmarks b ON b.collection_id = c.id GROUP BY c.slug ORDER BY c.slug"
).fetchall()
# The trash must exist and be empty: the fixture seeds live bookmarks only, and a
# missing table here would let a read path forget the schema grew.
tables = [
    row[0]
    for row in conn.execute(
        "SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%' ORDER BY name"
    )
]
trash = conn.execute("SELECT count(*) FROM deleted_bookmarks").fetchone()[0]
conn.close()

if version != 2 or posts != 13 or cols != [("ai", 5), ("design", 0), ("linux", 8)]:
    print(f"fixture self-check failed: version={version} posts={posts} cols={cols}", file=sys.stderr)
    sys.exit(1)
if tables != ["bookmarks", "collections", "deleted_bookmarks"] or trash != 0:
    print(f"fixture self-check failed: tables={tables} trash={trash}", file=sys.stderr)
    sys.exit(1)
PY

echo "seeded fixture:" >&2
echo "  $DIR" >&2
ls -1a "$DIR" | grep -v '^\.$\|^\.\.$' >&2
echo "$DIR"
