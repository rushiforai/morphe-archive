package db

// trashSchema is the one table version 2 added, kept in its own constant because
// two callers need exactly this text: a fresh database (through schema below) and
// the in-place upgrade of a version-1 file (upgradeV1toV2). Duplicating it would
// let the two paths drift into different shapes.
//
//   - There is deliberately **no** foreign key to `collections`. The trash must
//     outlive the folder it came from: with `ON DELETE CASCADE` a deleted
//     collection would quietly empty the trash, which is the opposite of what a
//     recoverable delete is for.
//   - `id` is the primary key, not `tweet_id`: saving and deleting the same tweet
//     twice must record two events rather than overwrite the first. A live
//     bookmark is free to reuse a `tweet_id` that the trash still mentions,
//     because the trash is a log, not a claim on the id.
//   - `collection_id` is copied rather than resolved, so restoring a row needs no
//     lookup and the original folder is still recorded even after a move.
const trashSchema = `
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
`

// schema is the whole database, version 2. It is one CREATE batch executed in a
// single transaction by applySchema.
//
// Design notes:
//
//   - `collections.slug` is the public key: it is what the extension sends, what
//     the gallery URL carries, and what a reader sees. It is unique because two
//     categories whose names collapse to the same slug are the same collection.
//   - `collections.id` is a surrogate key so the bookmark foreign key stays an
//     integer and a future slug change is a one-row update instead of a rewrite.
//   - `collections.name` is stored rather than derived: the extension knows what
//     the user actually typed ("Chibi Art", not "Chibi-Art"), and keeping it means
//     the database is readable without the application.
//   - `bookmarks.tweet_id` is the primary key, which is what makes the global
//     "one tweet may only be saved once" invariant a database constraint instead
//     of application bookkeeping.
//   - `bookmarks.media` stays a JSON array in a TEXT column, byte-for-byte the
//     value the extension sent. Normalising it on the way in would lose the
//     malformed-but-harmless cells the read path is built to tolerate.
//   - Timestamps are RFC3339 UTC strings, so they sort and compare lexicographically
//     and stay readable in a plain `sqlite3` shell.
//
// `bookmarks` holds exactly the live set: a deleted bookmark is *moved* to
// `deleted_bookmarks` rather than flagged in place, so every read path —
// the reader, the index, the counts, the covers, the cursors — stays correct
// without a `deleted_at IS NULL` filter that a future query could forget.
const schema = `
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
` + trashSchema

// v1Tables is the exact table set version 1 defined. upgradeV1toV2 requires it
// before altering a file, because a version stamp is not evidence of shape.
//
// Ordered by name, which is what `userTables` returns: the comparison is
// element-wise, and "bookmarks" sorts before "collections".
var v1Tables = []string{"bookmarks", "collections"}

// expectedTables is what verifySchema insists on finding. The indexes are not
// listed: they are a performance detail, and a database missing one still returns
// correct answers.
var expectedTables = []string{"collections", "bookmarks", "deleted_bookmarks"}
