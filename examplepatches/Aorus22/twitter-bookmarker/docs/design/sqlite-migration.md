# Storage: the SQLite database

**Status:** current storage design. Supersedes the per-category CSV layout and the
derived `index.json` described by `phase2-design-spec.md` and the v1.0 PRD.

**Consumers:** `internal/db`, `internal/storage`, `internal/gallery`,
`internal/api`, `extension/src/shared`, `web/src`, and the migration scripts that
live in the *data* repository (`twitter-bookmarker-csv`, `Scripts/`).

---

## 1. What changed, and why

v1.0 stored one CSV per category (`linux.csv`, `ai-llm.csv`, …) plus an
`index.json` derived from them. That layout had three structural problems:

1. **Two sources of truth.** `index.json` was a cache of the CSVs. Everything
   that touched it needed a rebuild path, a staleness story, and a "what if the
   index disagrees" story. It existed only to avoid re-reading every CSV on every
   request.
2. **The filename was the primary key.** A category's identity *was* a path
   component (`linux.csv`), so a rename had to move a file, and every consumer
   needed the same filename-validation logic to avoid path traversal.
3. **A row was a CSV record.** Media was a JSON array crammed into one CSV field,
   so a malformed cell could only be tolerated, never rejected, and "is this row
   valid" had to be re-implemented identically in Go, TypeScript and Python.

SQLite removes all three: one file, one schema, a real primary key (`tweet_id`),
a surrogate key for collections (`collections.id`) with a friendly unique `slug`,
and validity enforced by column types plus application checks at the one place
rows are written.

### Non-goals

- SQLite is **not** becoming a query engine for the gallery. See §7.
- There is **no** implicit migration. See §9.
- There is **no** export/import round-trip. The database is the artifact.

---

## 2. The storage contract

| Thing | Value |
|---|---|
| Directory | `$TWITTER_BOOKMARKER_DIR`, else `~/.twitter-bookmarker` |
| Database file | `tw-bookmarker.db` (`config.DBName`) |
| Directory mode | `0o700` on creation |
| Database mode | `0o600` when this process creates it |
| Schema version | `2` (`db.Version`, stored in `PRAGMA user_version`) |
| Journal mode | `DELETE` |
| Synchronisation | `FULL` |
| Foreign keys | enforced on the writer |

The database is the **only** file the server owns. It never reads or writes
anything else in that directory — not a `backup/` folder, not a stray CSV, not a
stray `index.json`. A directory may contain any of those; they are inert.

The `0o600` mode is applied **only when this process creates the file**, never to
an existing one, so a mode the user set deliberately always wins. It matters
because the database holds the same personal data the per-category CSVs did, and
those were `0o600`; the directory mode is the primary boundary, so this is defence
in depth for the case where the storage directory already existed with wider
permissions.

### 2.1 Schema

```sql
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

-- Added by version 2; see §2.2.
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
```

Load-bearing details:

- **`tweet_id` is the bookmark's primary key, globally.** The same tweet cannot be
  in two categories. This was already true of the old index and the old
  cross-collection duplicate check; the schema now *enforces* it, so the check
  becomes a friendly 409 instead of the only defence.
- **`collections.id` is the foreign key, `slug` is the public key.** Renaming a
  category changes `slug` (and therefore creates a *new* collection, because the
  slug is derived from the name); it never renumbers `id`, so no bookmark row is
  rewritten.
- **`media` is stored verbatim as JSON text.** It is not a join table. The gallery
  parses it per row and tolerates malformed JSON, so a bad cell degrades one card
  to a text card rather than failing the request or the whole collection.
- **Timestamps are RFC 3339 UTC strings** (`2026-09-27T01:05:00Z`), not integers.
  They sort lexicographically in exactly chronological order, and the wire format
  is unchanged.
- **`created_at` is informational.** It is written on insert and never read by the
  API. The migration sets it to the collection's earliest `saved_at`.

### 2.2 `deleted_bookmarks`: a soft delete that moves the row

Deleting a bookmark does not destroy it and does not set a `deleted_at` flag on
`bookmarks`. It **moves the row**: `INSERT INTO deleted_bookmarks (…) SELECT …`,
then `DELETE FROM bookmarks WHERE tweet_id = ?`, in one transaction.

The reason is an invariant, not nostalgia. Moving the row keeps

```text
bookmarks == exactly the set of live bookmarks
```

true by construction. A `deleted_at` column would instead make every read path
responsible for filtering, and there are a lot of them — the row reader, the
`/v1/index` listing, the per-collection `post_count` and `media_count` aggregates,
cover media, and cursor pagination. One missing `WHERE deleted_at IS NULL` is a
deleted bookmark reappearing in the gallery, and no test would necessarily catch
it. Here there is nothing to remember, so there is nothing to forget.

Three further deliberate choices:

- **No foreign key to `collections`.** `bookmarks.collection_id` cascades, so
  deleting a folder deletes its bookmarks. If the trash shared that foreign key, a
  folder delete would erase the record of deletions too — precisely the history
  worth keeping. `deleted_bookmarks.collection_id` is therefore a plain integer
  that may reference a collection that no longer exists.
- **`id INTEGER PRIMARY KEY`, not `tweet_id`.** A tweet can be saved, deleted,
  re-saved and deleted again; each deletion is its own event with its own
  `deleted_at`. Keying on `tweet_id` would collapse that history to one row.
- **`deleted_at` is a server-side RFC 3339 UTC stamp**, like every other timestamp
  in the file, so the trash sorts in the same lexicographic order as everything
  else.

Recovery is deliberately manual SQL rather than a UI affordance:

```sql
INSERT INTO bookmarks (tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
SELECT tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media
FROM deleted_bookmarks WHERE id = <the trash row's id>;
```

The trash row is intentionally **not** removed by that statement, so a restore
leaves an audit trail. Re-saving the same tweet through the extension also works:
the trash never claims the tweet id, so `bookmarks.tweet_id` is free again.

---

## 3. Versioning: five cases, one of which writes twice

`db.ensureSchema` classifies the file on every writable open:

| case | `user_version` | user tables | action |
|---|---|---|---|
| fresh | 0 | 0 | create the schema and stamp version 2 |
| current | 2 | — | verify the expected tables exist |
| upgradable | 1 | exactly `bookmarks`, `collections` | **upgrade in place** to version 2 |
| foreign | 0 | > 0 | **refuse** — an unrecognised file |
| other | ≠ 1, ≠ 2 | — | **refuse** with `ErrUnsupportedVersion` |

Refusing is deliberate for a file we do not recognise. An implicit upgrade of an
*unknown* shape would have to decide what to do with rows it does not understand,
and the only safe answer is "not my file".

The `upgradable` case is the one bounded exception, and it is narrow on purpose: the
stamp must be exactly `1` **and** the table set must be exactly the two version-1
tables. Anything else at version 1 — a missing table, an extra one, a renamed one —
falls through to `other` and is refused, because a version stamp is not evidence.
The upgrade runs in a single transaction: create `deleted_bookmarks` and its index,
then `PRAGMA user_version = 2`, then commit. It **rewrites no existing row** and
adds no column, so an interrupted upgrade rolls back whole and the next start
retries it from a still-version-1 file.

The distinction between *fresh* and *foreign* is why the version is stamped inside
the same transaction that creates the tables: a crash mid-creation leaves a
version-0 file with no tables, which the next startup correctly treats as fresh
again.

`verifySchema` exists because a version stamp is not evidence — a truncated or
hand-edited file can keep `user_version = 2` while missing a table.

---

## 4. Durability: `DELETE`, not WAL

The storage directory is a git repository that the user commits. WAL would put
committed rows in a `-wal` sidecar that a `git add` would not include, so a
committed `tw-bookmarker.db` could be missing the rows that were only in the
journal. `journal_mode = DELETE` keeps the directory to *one complete file* at
every quiescent moment.

| pragma | value | why |
|---|---|---|
| `journal_mode` | `delete` | one self-contained file, git-safe |
| `synchronous` | `full` | fsync at commit, so an acknowledged 201 is on disk |
| `foreign_keys` | `on` | the `ON DELETE CASCADE` must actually fire |
| `busy_timeout` | `5000` | tolerate a concurrent reader/writer briefly |

Two consequences worth stating out loud:

- **`foreign_keys` is per-connection.** External tooling (the `sqlite3` CLI, the
  migration scripts) must set it explicitly. The CLI defaults it **off**, and with
  it off a collection delete silently *orphans* its bookmarks instead of cascading;
  SQLite then reuses the freed rowid and can hand the orphan to the next
  collection created. The acceptance scripts set `PRAGMA foreign_keys=ON` for
  exactly this reason.
- **Pragmas belong in the DSN.** `db.dsn` renders
  `file:<escaped-path>?_pragma=…` so they apply to every connection the pool ever
  hands out. Executing them once after `sql.Open` would silently drop
  foreign-key enforcement as soon as the pool recycled its connection. The path is
  percent-encoded because the URI ends at the first `?` and a storage directory may
  contain spaces.

---

## 5. `slug`: the new public key

A collection is addressed by a **slug**: lower-case, no extension, no dots.

```
SlugPattern = ^[a-z0-9][a-z0-9-]*$      maxSlugLen = 255
```

`linux.csv` → `linux`. The pattern forbids `.`, `/`, `\`, `~` and `_`, so a slug
can never express a traversal, and `ValidateSlug` additionally rejects empty,
over-long, NUL-containing, untrimmed and `..`-containing values. There is no
filesystem path involved any more; the validation exists because the slug reaches
URLs and the database, not because it reaches a path.

### 5.1 Name

A collection carries the **name the user typed**. The extension sends it with
every save and the backend stores it. `model.DeriveName(slug)` is only the
fallback for a save that arrives without a name: split on `-`/`_`, upper-case the
first rune of each word, and map the exact tokens `ai`/`llm` to `AI`/`LLM`.

### 5.2 Wire rename

`filename` → `slug` everywhere: the JSON field, the storage DTOs, the gallery
DTOs, the URL path segment (`/api/gallery/collections/{slug}/posts`), the web
route (`/collections/:slug`), and the extension's persisted `Category` field. The
`SaveRequest` gained a `name`.

The extension's stored schema moved from version 1 to 2 with **no version-gated
migration code**, and this is safe for a checkable reason: the old derived value
was exactly `slugify(name) + ".csv"`, and `normalizeStore` already recomputed any
stored value that failed validation. So recomputing the slug from the name
reproduces the old filename minus its extension, and `normalizeStore` never
inspects the stored `version` at all. `constants.ts` documents this, and
`storage.test.mjs` proves it mechanically (``${slug}.csv` === old filename`).

---

## 6. Write path

One `*sql.DB` with `SetMaxOpenConns(1)` — SQLite wants a single writer, and one
connection makes the pragmas trivially predictable.

`storage.Store.Save`:

1. Validate the slug.
2. `NormalizeURL`, then trim and validate author / username / dates (RFC 3339).
3. Derive the name if absent; `json.Marshal(NormalizeMedia(…))`.
4. Under a mutex, in one transaction:
   - duplicate check on `tweet_id` (→ `DuplicateError`, HTTP 409);
   - `INSERT … ON CONFLICT(slug) DO UPDATE SET name = excluded.name` — an upsert
     so re-saving into an existing collection refreshes its display name;
   - `SELECT id` for that slug;
   - insert the bookmark.
5. Commit, then answer 201.

`Index()` (for the frozen `GET /v1/index` contract) reads the same tables and
builds `map[tweet_id]{URL, Slug, SavedAt}` in Go — a `JOIN`, not a JSON file.

---

## 7. Read path: the query engine stays in Go

`gallery.Reader` opens a **fresh read-only connection per request** and closes it.
That is what preserves the PRD-2 freshness property (§80.22): a row appended by
another process while the server runs is visible on the next request, with no
restart and no cache to invalidate.

The database supplies one collection's rows; **filtering, sorting and the cursor
stay in Go**:

```sql
SELECT b.tweet_id, b.url, b.author, b.username, b.tweet_date, b.saved_at,
       b.text, b.media
  FROM bookmarks b JOIN collections c ON c.id = b.collection_id
 WHERE c.slug = ?
 ORDER BY b.saved_at, b.tweet_id
```

Search deliberately does **not** become `WHERE text LIKE ?`: SQLite's `LIKE` and
`lower()` are ASCII-only, while the existing behaviour uses Unicode-aware
`strings.ToLower`, so pushing the filter into SQL would silently change which
posts match for non-ASCII text. Date-range filtering and sorting are equally cheap
to do in Go on a single collection's rows, and doing them in one place keeps
`sort`/`cursor` semantics identical to the frozen v1.0 behaviour.

`Reader.Collections()` returns an **empty list** (not an error) when the database
is absent — a fresh install has no data, which is not a failure. `Posts()` returns
`ErrCollectionNotFound` in the same situation, because "give me the posts of a
collection that does not exist" is a 404.

Reads are tolerant per row: a row whose URL does not normalise, or whose author or
timestamp is unusable, is skipped with a warning and does not fail the collection.
A malformed `media` cell becomes `[]`. `sum(CASE WHEN json_valid(media) THEN
json_array_length(media) ELSE 0 END)` guards the same tolerance when counting.

---

## 8. How the schema is kept honest

The DDL exists in two languages, so drift is the real risk. It is guarded three
ways:

1. **`db.verifySchema`** refuses to start against a current-version file whose tables do
   not match — the loud, production-facing guard.
2. **`TestSchemaColumnContract`** in `internal/db` pins the exact column list of
   both tables, so a Go-side change cannot pass unnoticed.
3. **The data repository's `Scripts/verify_data.py`** independently validates the
   database it produced, including columns, `user_version`, row-level rules and
   media totals.

The acceptance fixture takes the same stance from the other direction: it writes
its database with python3's own `sqlite3` module rather than with the Go code under
test, so the backend is always being asked to open a database it did not create.

---

## 9. Migration: not a backend concern

**The backend has no CSV awareness.** There is no `--migrate-csv` flag, no CSV
scanning, no `backup/` handling, no startup guard that refuses to run while CSVs
are present. It opens `tw-bookmarker.db` and nothing else. `grep -rn csv` over the
non-test Go sources returns nothing.

The one-time migration lives with the data it migrates: the data repository's
`Scripts/migrate_to_sqlite.py`. It

1. validates every CSV row with the same strict rules the old pipeline used and
   aborts before writing anything if any row is invalid;
2. builds the database in a temp file and `os.replace`s it into place, so a crash
   cannot leave a half-written database;
3. sets `user_version = 2` and the identical schema (the script and the backend
   share one schema constant, so a fresh migration is never born a version behind);
4. asserts row and media counts per collection before committing;
5. moves every CSV and `index.json` into `backup/` and writes
   `backup/MIGRATION.json` with per-file SHA-256 digests;
6. refuses to run twice.

Two orderings matter:

- If the server runs first it creates an **empty** `tw-bookmarker.db`. The
  migration accepts that state (an empty, current-version, schema-matching file)
  and proceeds; it refuses a non-empty one. Its emptiness test counts the trash
  table as well as the live one: a schema-2 file whose live rows are gone but whose
  `deleted_bookmarks` still holds deletions is not "the empty file a server
  leaves", and overwriting it would destroy the archive's deletion history.
- After migration the directory holds `tw-bookmarker.db` plus a `backup/` folder.
  `backup/` is a frozen archive: the server never reads it, and the migration
  scripts only read it to verify the archive.

---

### 9.1 Upgrading an existing database is the backend's job

The one-time CSV migration is finished; the *schema* will keep moving, and that is
the backend's concern. A version-1 database is upgraded in place by the first writable
open (§3) — no flag, no script, no manual step. That split is the point: the data
repository owns getting the rows *out of CSV*, and the backend owns the shape of the
file it reads.

Because the upgrade is automatic, the version stamp is the contract between the two:
`Scripts/verify_data.py` accepts `user_version` `2` or `1` and validates each stamp
against its own table shape, so a directory can be verified before the server has ever
touched it. It reports a still-version-1 file as an informational note rather than a
failure.

---

## 10. Alternatives considered

| Alternative | Rejected because |
|---|---|
| Keep CSVs, add a database as a cache | Reintroduces two sources of truth — the original problem. |
| WAL journal mode | `-wal`/`-shm` sidecars break the "commit one file to git" property. |
| Store `filename` (`linux.csv`) as the collection key for compatibility | The key would still be a filename, keeping the path-shaped identity the migration exists to remove. The web and extension were renamed to `slug` in the same change. |
| Migrate implicitly on startup | The backend would have to know CSVs exist, and a wrong guess is unrecoverable. The migration is explicit, user-invoked and one-way. |
| Push search/sort/filter into SQL | `LIKE`/`lower()` are ASCII-only and would change which posts match non-ASCII queries. |
| A `media` join table | Media is an ordered list of at most 8 URLs with no identity of its own; normalising it would add a table and a transaction for no query the app makes. |
| Cache the reader's parsed collection | Breaks the freshness property (§80.22) that the gallery depends on. |
| `INTEGER` epoch timestamps | Would change the wire format for no gain; RFC 3339 strings sort correctly. |
| Flag deletes with `deleted_at` on `bookmarks` | Every read path would then own a `WHERE deleted_at IS NULL` filter — the row reader, `/v1/index`, both per-collection aggregates, cover media, cursor pagination. One forgotten filter resurfaces a deleted bookmark. Moving the row keeps `bookmarks` equal to the live set by construction (§2.2). |
| Hard-delete the row | A misclick becomes unrecoverable. The archive is the product; a destructive action with no way back is not one to ship. |
| Foreign key from `deleted_bookmarks.collection_id` | It would cascade, so deleting a folder would erase the deletion history — the part of the trash worth keeping. The column is a plain integer on purpose (§2.2). |
| Key the trash on `tweet_id` | Save → delete → save → delete is four events. Keying on the tweet would collapse them into one and lose the timeline. |
| Put curation under `/api/gallery` | That prefix is the read-only gallery API by requirement (API-07). Adding a mutation there would weaken a guarantee the acceptance script re-asserts; the bookmark resource is where curation belongs. |
| Auto-create the target folder on move | Folder names come from the extension, which is the only component that knows where a folder came from. The API refuses an unknown slug (`404`) rather than inventing a name for it. |
| An undo affordance in the web UI | It implies a session-scoped stack the backend does not have, and would create a second answer to "what does deleted mean". Recovery is one documented SQL statement instead. |
