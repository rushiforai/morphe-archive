# Twitter Bookmarker

A single-user Chrome (Manifest V3) extension plus a small local Go server that
turns X bookmarks into one durable local SQLite archive.

Open `https://x.com/i/history`, click a category on a tweet, and the extension
extracts the tweet metadata and writes it into
`~/.twitter-bookmarker/tw-bookmarker.db`. Optionally, the tweet is removed from X
Bookmarks **after** the database write is confirmed.

The storage design — schema, pragmas, the `slug`/`name` rules, the read path and
the CSV→SQLite migration boundary — is specified in
**[`docs/design/sqlite-migration.md`](docs/design/sqlite-migration.md)**.

---

## What this is — and what it is not

**It is** a categorizer: X Bookmarks → one category click → durable database row →
optional unbookmark. The SQLite database is the durable source of truth; nothing
else is a copy of it, and the backend keeps no cache that could disagree with it.

**It is not** a dashboard, sync service, or general-purpose database. The gallery
is read-only and adds search, filtering and sorting; curation adds exactly two
mutations, move-to-folder and a recoverable delete
([Curation](#curation)). There is no undo button, import/export, cloud sync,
authentication, or X API usage. The extension works off the rendered DOM only.
See `.planning/PROJECT.md` for the full out-of-scope list.

---

## Architecture

```text
┌────────────────────────── Chrome ──────────────────────────┐
│  Content script (x.com/i/history)                        │
│    route watcher → single MutationObserver → organizer UI  │
│    save controller ──message──▶ MV3 service worker ──HTTP──┼──▶ 127.0.0.1:43121
│  Popup: categories, colors, order, settings                 │      (Go server)
│  chrome.storage.local = categories + settings (only)        │         │
└─────────────────────────────────────────────────────────────┘         │
                                                                        ▼
                                          <storage dir>/tw-bookmarker.db
                                          the only file the server owns ← source of truth
```

- The backend binds **loopback only** (`127.0.0.1:43121`) by default. It can be
  moved onto the LAN for a phone client, and a non-loopback bind then requires a
  bearer token — see [Where the server listens](#where-the-server-listens). It
  never stores categories or settings — those live in `chrome.storage.local`.
- The content script never calls the backend directly; every HTTP request goes
  through the service worker (PRD §53).
- One `MutationObserver` per page entry, one index fetch per page entry, O(1)
  saved-tweet lookups via an in-memory `Set<TweetID>`.

The phone is a second client of the same API rather than a second backend: X has
no hook for this, so the app is patched with Morphe, and the patch adds a save
button beside the native bookmark action. It sends the same payload the extension
does, which is why nothing in `backend/` changed for it. The button is a 48 dp
target with a gap so it is not hit by accident, and a tweet that is already in a
collection is marked — see [Already saved](morphe/README.md#already-saved) for how
that mark is kept fresh. Sources, build and the device runbook live in
[morphe/](morphe/README.md), and the LAN bind it needs is
[Where the server listens](#where-the-server-listens).

### Where the database lives

`<storage dir>` is `~/.twitter-bookmarker` by default and can be relocated with
the `TWITTER_BOOKMARKER_DIR` environment variable, which the server reads at
startup. `make run` passes it for you, so nothing has to live in your shell
profile — put the path in a gitignored `.env.local` at the repo root:

```make
# .env.local
TWITTER_BOOKMARKER_DIR := $(HOME)/Personal/twitter-bookmarker
```

`make run` then prints and uses it (a `make run TWITTER_BOOKMARKER_DIR=/tmp/x`
on the command line wins; with no `.env.local` the default applies):

```text
==> storage: /home/<you>/Personal/twitter-bookmarker
... msg="Twitter Bookmarker server started" listening=127.0.0.1:43121 storage=/home/<you>/Personal/twitter-bookmarker
```

A leading `~/` is expanded, a relative path is rejected, and the directory is
created with mode `0700` if missing. Running the binary directly
(`./backend/bin/twitter-bookmarker-server`) bypasses the Makefile, so export the
variable yourself in that case.

The data-cleaning scripts in the private data repository read the same variable,
and `make clean-storage` uses the resolved value too. The directory may live
inside a git working tree: the server opens exactly one file,
`<storage dir>/tw-bookmarker.db` (`config.DBName`), and never reads or writes
anything else there. A `backup/` folder left by a completed CSV→SQLite migration,
a stray CSV, or a stray `index.json` are all inert to the server.

### Where the server listens

The default is `127.0.0.1:43121`, which only this machine can reach. That is the
right default: the API is the whole bookmark database, and nothing else on the
network should be able to read or write it.

A client on another device — a phone on the same Wi-Fi, for instance — needs the
server to listen on an address that device can route to. Two variables do that,
and `make run` passes both from the same gitignored `.env.local`:

```make
# .env.local
TWITTER_BOOKMARKER_ADDR := 192.168.1.13:43121
TWITTER_BOOKMARKER_TOKEN := <a long random string>
```

Both are required together. The server **refuses to start** on a non-loopback
address when no token is set, so a mistyped interface can never publish the
database unauthenticated:

```text
twitter-bookmarker-server: refusing to listen on 0.0.0.0:43121 without a token: set TWITTER_BOOKMARKER_TOKEN, or bind 127.0.0.1:43121 so the API is never reachable without authentication
```

With both set, the rule is about the *peer*, not the request:

- Requests from **loopback** need no token. The desktop extension and a browser
  on this machine keep working with no configuration, exactly as before.
- Requests from **any other address** must send `Authorization: Bearer <token>`
  on `/v1/*` and `/api/*`, and get `401` without it. `/health` and the built web
  app stay open, because neither answers with bookmark data.

```bash
# from another device on the network
curl -s -H "Authorization: Bearer $TOKEN" http://192.168.1.13:43121/v1/index
```

The address must be `host:port` with an explicit host: `:43121` is rejected
because `net.Listen` reads it as every interface. `0.0.0.0:43121` is accepted,
since asking for every interface is a deliberate thing to type. A relative or
malformed value is reported by name, and `-h` prints the resolved address.

Two things the Makefile cannot do for you: open the port in the host firewall
(`sudo firewall-cmd --add-port=43121/tcp` on Fedora, `ufw allow 43121/tcp` on
Debian), and give the machine a stable address. `make run` prints the resolved
`==> listen:` line and a reminder whenever the bind is not loopback.

### A tunnel is a third way in, and what covers it

An SSH forward or a Cloudflare tunnel keeps the default loopback bind and needs
neither the address nor the firewall rule — and because `cloudflared` runs on
this machine, it connects from `127.0.0.1`, so the server sees a loopback peer and
the bearer token never comes into play.

What covers that path is `TWITTER_BOOKMARKER_BASIC_AUTH`. Anything arriving
through a proxy must present those credentials — which a browser asks for in its
own dialog, with no page of ours involved — or the bearer token, which is what a
client that cannot show a dialog, such as the phone patch, sends instead. The line
between public and local is drawn by the headers a tunnel adds (`CF-Connecting-IP`,
`X-Forwarded-For`) rather than by the peer address, because the peer address is
loopback on both sides of it. The direction is what makes that safe: a request is
exempt only when it carries neither header, so forging headers can only make a
request stricter, never looser, and removing them takes a process already running
on this machine — which can read the database directly anyway.

`/health` stays open under both rules: it answers with no bookmark data and it is
how a client checks reachability before it has proved anything. Leave the variable
unset and the tunnel URL is open to whoever has it.

A named tunnel with a stable hostname also beats a quick `trycloudflare.com` URL,
which changes on every restart and would have to be re-entered in the client each
time.

---

## Requirements

| Tool | Version |
|---|---|
| Go | ≥ 1.22 |
| Node.js + npm | ≥ 20 |
| Browser | Chrome / Chromium (MV3, Dev mode for unpacked loading) |
| `sqlite3` (optional) | for database inspection and the manual checklist |
| `python3` (optional) | for JSON inspection and the manual checklist |

---

## Setup and first run

### 1. Build

```bash
# From the repository root:
make build
```

This builds `backend/bin/twitter-bookmarker-server`, installs the extension
dependencies (`npm ci`) into `extension/dist/`, and builds the web app into
`web/dist/`.

`make build` and `make backend` compile the server with `CGO_ENABLED=0`: the
SQLite driver (`modernc.org/sqlite`) is pure Go, so the binary needs no cgo and
links no C SQLite.

<details>
<summary>Equivalent commands without <code>make</code></summary>

```bash
mkdir -p backend/bin
cd backend && CGO_ENABLED=0 go build -o bin/twitter-bookmarker-server ./cmd/server
cd ../extension && npm ci && npm run build
cd ../web && pnpm install --frozen-lockfile && pnpm build
```
</details>

### 2. Run the server

```bash
make run
# or directly:
./backend/bin/twitter-bookmarker-server
```

To keep the database somewhere else (for example the private data repository that
also holds `Scripts/`), add `TWITTER_BOOKMARKER_DIR` to a gitignored `.env.local`
and just use `make run` — see [Where the database lives](#where-the-database-lives).

```make
# .env.local
TWITTER_BOOKMARKER_DIR := $(HOME)/Personal/twitter-bookmarker
```

The same file takes three optional keys — `TWITTER_BOOKMARKER_ADDR`,
`TWITTER_BOOKMARKER_TOKEN` and `TWITTER_BOOKMARKER_BASIC_AUTH` — when a device on
the network has to reach the server. The address and the token are needed
together; see [Where the server listens](#where-the-server-listens), and
[A tunnel is a third way in](#a-tunnel-is-a-third-way-in-and-what-covers-it) for
what the password adds.

Expected startup output (structured `slog` text):

```text
time=2026-09-28T09:04:54.777+07:00 level=INFO msg="serving built web app" web_dist="/repo/web/dist"
time=2026-09-28T09:04:54.777+07:00 level=INFO msg="Twitter Bookmarker server started" server=twitter-bookmarker-server listening=127.0.0.1:43121 storage=/home/<you>/.twitter-bookmarker collections=3 bookmarks=13
```

The storage directory is created automatically (mode `0700`), and the database is
created on first start. Stop it with `Ctrl+C`; shutdown is clean because writes
are synchronous per request and the commit is fsynced.

> The server honours `$HOME`, so `HOME=$(mktemp -d) ./backend/bin/twitter-bookmarker-server`
> gives you a throwaway storage directory.

### Or run it in Docker

One container, because one process serves everything: the Go server answers the
API *and* serves the built SPA out of `TWITTER_BOOKMARKER_WEB_DIR`. There is no
second web container and no proxy to keep in step.

```bash
cp .env.example .env   # then set TWITTER_BOOKMARKER_DATA_DIR
make docker-up         # docker compose up -d --build
```

The app is then on <http://127.0.0.1:43121/> — the same address as `make run`, so
the extension, the phone patch and a tunnel keep working unchanged.

`.env` holds the absolute path of the data directory, and **the container mounts
it at that same path**, so one variable is the whole mapping:

```dotenv
TWITTER_BOOKMARKER_DATA_DIR=/home/you/Personal/twitter-bookmarker
```

A startup line shows both halves agreeing on one file:

```text
msg="serving built web app" web_dist=/app/web
msg="Twitter Bookmarker server started" listening=127.0.0.1:43121 storage=/home/you/Personal/twitter-bookmarker collections=9 bookmarks=3191
```

**Why host networking.** The server decides whether to demand a token from the
peer address, and trusts loopback. Publishing a port would destroy that: the
connection is NAT'd, so the server sees the Docker bridge instead. Measured on
this machine with a published port, the peer was `172.17.0.1` — meaning every
client would need a token, *including the gallery in the browser* (a web page
cannot be given one; only the extension's popup has a **Token** field).
`network_mode: host` keeps the address the server sees, so the rules
in [Where the server listens](#where-the-server-listens) and
[A tunnel is a third way in](#a-tunnel-is-a-third-way-in-and-what-covers-it)
apply verbatim. It also means the port keys below are real host ports, not
mappings.

**Why the uid matters.** The storage directory is mode `0700` and owned by you, so
the container runs as that uid (`TWB_UID`/`TWB_GID` in `.env`, defaulting to
`1000:1000`). A mismatch is not subtle in the logs: the server cannot open the
database.

| Command | What it does |
|---|---|
| `make docker-up` | Build and start the container (reads `.env`) |
| `make docker-logs` | Follow the log |
| `make docker-down` | Stop and remove the container; the database is untouched |
| `make docker-build` | Rebuild the image only |

To update: `git pull && make docker-up`. The image build runs `pnpm install` and
`vite build`, so the first build needs network and a few minutes; later ones reuse
the layer cache. `restart: unless-stopped` brings it back after a reboot or a
crash, and `docker compose down` sends `SIGTERM`, which the server drains cleanly.

> `.env` is Compose's file, with `KEY=value` lines. `.env.local` is the Makefile's,
> with `:=` assignments, which is why the same path is configured in both places
> when both are used.

### The public URL

<https://tw-bookmark-e41fc2b5.nadif.dev> is served by the `cloudflared.service`
that was already running on this machine — nothing in this repository starts it,
and nothing in it has to change for the address to keep working:

| Piece | Value |
|---|---|
| Tunnel | `Laptop` (`4d98de66-…`), remotely managed |
| Ingress rule | `tw-bookmark-e41fc2b5.nadif.dev` → `http://localhost:43121`, first in the list |
| DNS | CNAME `tw-bookmark-e41fc2b5` → `4d98de66-….cfargotunnel.com`, proxied |

The rule sits **at the top** of that tunnel's ingress deliberately: the tunnel also
carries a `*.nadif.dev → http://localhost:444` wildcard, and cloudflared uses the
first matching rule, so an entry placed below it would never be reached.

Handy consequences: it is HTTPS, which removes the cleartext warning the phone
patch has when you point it at a LAN address, so use this URL for both the
extension's custom mode and the patch — each needs the token, below.

It asks for a password before serving anything. That is
`TWITTER_BOOKMARKER_BASIC_AUTH` in `.env`, in `user:password` form, and the
browser renders the prompt natively — no login page exists in this app and none is
needed. The password only guards clients that arrive through the tunnel; a request
from this machine's loopback is exempt. Two credentials, deliberately:

| Client | Credential | Why |
|---|---|---|
| Browser at the public URL | the `user:password` value | it can show a dialog |
| Phone patch, extension, curl, scripts | `TWITTER_BOOKMARKER_TOKEN` | they cannot, so they send `Authorization: Bearer` instead |
| Browser or extension on this machine | none | no forwarding headers, so nothing is asked |

Both are configuration steps, not code changes: paste the token into the patch's
token field, and into the extension popup's **Custom** panel (**Token**) when it
points at something other than loopback. Aimed at `http://127.0.0.1:43121` the
extension sends no credential at all, because it does not need one.

Leave either variable empty in `.env` and that credential stops existing — no
password means the public URL is open to whoever has it. To remove the address
entirely: drop the one ingress rule from the `Laptop` tunnel and delete the DNS
record. Both live in Cloudflare, not here.

### 3. Load the unpacked extension

1. Open `chrome://extensions`
2. Enable **Developer mode**
3. Click **Load unpacked** → select `extension/dist/`

### 4. Create categories

Open the extension popup and add e.g. `AI`, `Linux`, `Design`. Pick colours,
drag to reorder, and choose **Popover** or **Inline**. Under **Backend URL**, keep
**Localhost** for the default `http://127.0.0.1:43121`, or pick **Custom** and enter
another base URL plus, if that backend asks for one, its **Token** — both are saved
by the same **Save** button. Everything is saved to `chrome.storage.local`
immediately and propagates to open X tabs without a reload.

### 5. Use it

1. Open `https://x.com/i/history`
2. Each tweet gets an organizer (`[Organize]` in popover mode, category chips in
   inline mode) on **its own full-width row directly above the native action
   bar** — it never shares the row with X's reply/repost/like/bookmark buttons
   (PRD §31, XI-08).
3. Click **Linux** on a tweet → success toast `Saved to Linux`, controls become
   `✓ Saved`
4. Inspect the result:

```bash
sqlite3 -header -column ~/.twitter-bookmarker/tw-bookmarker.db \
  "SELECT tweet_id, author, saved_at FROM bookmarks ORDER BY saved_at DESC LIMIT 5;"
curl -s http://127.0.0.1:43121/v1/index | python3 -m json.tool
```

---

## Database schema

One SQLite database per storage directory:

```text
<storage dir>/tw-bookmarker.db      (config.DBName)
```

Schema version `2` in `PRAGMA user_version`. `journal_mode=DELETE` (deliberately
**not** WAL, so the directory holds one complete, git-safe file at every quiescent
moment), `synchronous=FULL`, `foreign_keys=ON` and `busy_timeout=5000`, all
applied through the DSN so they hold on every pooled connection. A database the
server creates is `chmod 0600`. The full contract, the durability rationale and
the alternatives considered are in
[`docs/design/sqlite-migration.md`](docs/design/sqlite-migration.md) §2–§4.

```sql
CREATE TABLE collections (
  id         INTEGER PRIMARY KEY,
  slug       TEXT NOT NULL UNIQUE,   -- public key: ^[a-z0-9][a-z0-9-]*$
  name       TEXT NOT NULL,          -- display name the user typed
  created_at TEXT NOT NULL
);

CREATE TABLE bookmarks (
  tweet_id      TEXT PRIMARY KEY,    -- Tweet Status ID, globally unique
  collection_id INTEGER NOT NULL REFERENCES collections(id) ON DELETE CASCADE,
  url           TEXT NOT NULL,
  author        TEXT NOT NULL,
  username      TEXT NOT NULL,
  tweet_date    TEXT NOT NULL,
  saved_at      TEXT NOT NULL,
  text          TEXT NOT NULL DEFAULT '',
  media         TEXT NOT NULL DEFAULT '[]'
);

CREATE INDEX bookmarks_by_collection_saved ON bookmarks(collection_id, saved_at, tweet_id);
CREATE INDEX bookmarks_by_collection_tweet ON bookmarks(collection_id, tweet_date, tweet_id);

-- Added in schema version 2; the two tables above are unchanged from version 1.
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

CREATE INDEX deleted_bookmarks_by_tweet ON deleted_bookmarks(tweet_id, deleted_at DESC);
```

| Column | Meaning |
|---|---|
| `collections.slug` | Public collection key: lower-case, no extension, no dots (`linux`, formerly `linux.csv`) |
| `collections.name` | Display name (`Linux`); the extension sends it, and a save without one derives a name from the slug |
| `bookmarks.tweet_id` | Tweet Status ID — the global duplicate key |
| `url` | Canonical `https://x.com/<handle>/status/<id>` (tracking query removed) |
| `media` | JSON array of canonical media URLs; `[]` when the tweet has none |
| `author` | Display name as rendered |
| `username` | `@handle` |
| `tweet_date` | Tweet timestamp, UTC (`...Z`) |
| `saved_at` | Backend-generated UTC save time (`...Z`) |
| `text` | Parent tweet text only; empty for media-only tweets; quoted text excluded |

Timestamps are RFC 3339 UTC strings, not integers: they sort lexicographically in
exactly chronological order, and the wire format is unchanged from v1.0.

`media` is normalized identically by the extension and the backend (PRD §14):
only `https://pbs.twimg.com/...` survives, the `?format=…&name=…` sizing query is
dropped (an extension-less path gets `.` + `format`), card/avatar/banner paths
are rejected, duplicates are removed, order is preserved, and the list is capped
at eight entries. A video or animated GIF stores its **poster frame** — X only
exposes a `blob:` playback URL in the DOM, so mp4 URLs are deliberately not
recorded. The array is stored as JSON text in the `media` column, not as a join
table; the gallery parses it per row and degrades a malformed cell to a text card
rather than failing the request.

Read the newest rows by hand — this works against any install and against the
fixture created by
[`scripts/seed-gallery-fixture.sh`](scripts/seed-gallery-fixture.sh):

```bash
sqlite3 -header -column ~/.twitter-bookmarker/tw-bookmarker.db \
  "SELECT c.slug, b.tweet_id, b.author, b.saved_at
     FROM bookmarks b JOIN collections c ON c.id = b.collection_id
    ORDER BY b.saved_at DESC LIMIT 5;"
```

`GET /v1/index` is built from these same live tables in Go — a `JOIN`, not a JSON
file — so it can never disagree with what the gallery serves.

> The `sqlite3` CLI defaults `PRAGMA foreign_keys` to **off**. That is fine for
> reads; before any manual `DELETE` from `collections`, run
> `PRAGMA foreign_keys=ON` in the same session (or pass
> `-cmd 'PRAGMA foreign_keys=ON'`) so the `ON DELETE CASCADE` actually fires.

### Soft delete: `deleted_bookmarks`

Version 1 → 2 adds exactly one table and one index; the `collections` and
`bookmarks` DDL above is **unchanged**.

`DELETE /v1/bookmarks/{tweet_id}` does not destroy the row, and it does not flag
it in place with a `deleted_at` column on `bookmarks`. It **moves the row** into
`deleted_bookmarks`. The point is the invariant that keeps every reader simple:

> `bookmarks` is exactly the live set.

So *no* read path — the SQLite reader, `/v1/index`, collection counts, cover
media, cursor pagination — needs a `WHERE deleted_at IS NULL` filter that a
future query could forget. There is nothing to remember, so there is nothing to
forget. `scripts/check-gallery-acceptance.sh` re-checks that every read path drops
the deleted row immediately and that the collection summary still agrees with the
live row count.

Two choices in that DDL are deliberate:

- There is **no foreign key** from `deleted_bookmarks.collection_id`. Deleting a
  folder must never erase the deletion audit trail, and an `ON DELETE CASCADE`
  would quietly empty the trash instead.
- `id` is a plain autoincrement primary key, not `tweet_id`. Saving and deleting
  the same tweet twice must record two events rather than overwrite the first, so
  the trash is a log, not a claim on the Status ID.

**Upgrading is automatic.** Starting the server against a version-1 directory
upgrades it in place on startup: one transaction that creates the table and its
index and stamps `user_version = 2`, rewriting no row. The upgrade is narrow on
purpose: it runs only for a version-1 file that really holds the version-1 table
set. A database whose shape does not match its stamp is refused rather than
guessed at — a version-1 file with unexpected tables is not upgraded, and a file
that claims version 2 while missing one of the tables fails to open.

Restoring a row is a manual SQL step; the recipe is in
[Restoring a deleted bookmark](#restoring-a-deleted-bookmark-manual).

### Migrating a CSV-era directory

v1.0 stored one CSV per category (`linux.csv`) plus a derived `index.json`. The
one-time migration lives with the data it migrates: the data repository's
`Scripts/migrate_to_sqlite.py` (`hehenugas/twitter-bookmarker-csv`, private). It
validates every CSV row, builds `tw-bookmarker.db` atomically, sets
`user_version` to the current schema version (the same schema constant the
backend uses, so a fresh migration is never born a version behind), asserts
per-collection row and media counts, moves the CSVs and
`index.json` into `backup/`, writes `backup/MIGRATION.json` with per-file SHA-256
digests, and refuses to run twice.

The backend has **no CSV awareness**: there is no migration flag, no CSV
scanning, no `backup/` handling, and no startup guard that refuses to run because a
directory still contains CSVs. It opens
`tw-bookmarker.db` and nothing else. See
[`docs/design/sqlite-migration.md`](docs/design/sqlite-migration.md) §9.

---

## Backend API

Base URL: `http://127.0.0.1:43121` by default. The extension popup's **Backend URL**
setting can point the same API at a custom base URL (`192.168.1.10:8080`, or
`https://server.example/tw-bookmarker`). CORS is granted only to extension origins
(`chrome-extension://…`); arbitrary web origins are never allowed. Extension pages
and the service worker reach the API through their `host_permissions`, so a custom
host needs no CORS change.

One caveat follows from [Where the server listens](#where-the-server-listens): a
base URL that resolves **off loopback** — another machine, this machine's own LAN
address, or the [public URL](#the-public-url) — is a challenged peer, so that
server must have a token or basic auth and the request must carry the token. The
popup's **Custom** panel therefore has a **Token** field: paste the backend's
`TWITTER_BOOKMARKER_TOKEN` there and every request from the worker and the popup
carries `Authorization: Bearer …`. Leave it empty (the default) for a loopback
server, which is never challenged; it is ignored in **Localhost** mode.

### `GET /health`

```http
200 OK
{"status":"ok"}
```

### `GET /v1/index`

Every saved tweet, keyed by Status ID (one `GET` per Bookmarks page entry). It
reads the same tables the gallery does, so it cannot disagree with them.

```http
200 OK
{
  "items": {
    "123456789": {
      "url": "https://x.com/foo/status/123456789",
      "slug": "linux",
      "saved_at": "2026-09-27T01:15:32Z"
    }
  }
}
```

### `POST /v1/bookmarks`

```json
{
  "slug": "linux",
  "name": "Linux",
  "tweet": {
    "url": "https://x.com/foobar/status/123456789?s=20",
    "author": "Foo Bar",
    "username": "@foobar",
    "tweet_date": "2026-09-27T01:10:42Z",
    "text": "Example tweet"
  }
}
```

The backend derives `saved_at`, the tweet id, and the canonical URL. `name` is
the collection's display name; when a save omits it the backend derives one from
the slug (`linux` → `Linux`, and the tokens `ai`/`llm` → `AI`/`LLM`), so an older
extension that sends only a slug still produces a readable collection.

| Status | When | Body |
|---|---|---|
| `201 Created` | New bookmark inserted | `{"status":"saved","tweet_id":"…","url":"…","slug":"…","saved_at":"…"}` |
| `409 Conflict` | Tweet id already exists **anywhere** in the database (global duplicate) | `{"status":"duplicate","tweet_id":"…"}` — no second row, no unbookmark |
| `400 Bad Request` | Invalid slug, invalid URL, missing author/username, invalid date, malformed payload | `{"status":"error","reason":"…"}` |
| `500 Internal Server Error` | Database/internal failure | `{"status":"error","reason":"internal error"}` — the extension never unbookmarks on this |

A duplicate is keyed by **Tweet Status ID**, not URL, so it is detected across
all collections.

### The gallery API is read-only

`GET /api/gallery/*` is strictly read-only and **GET-only**. No gallery route
mutates anything: the route table contains only `methodGate(http.MethodGet, …)`
entries for that prefix, and any other method is answered with `405` and an
`Allow: GET, HEAD` header.

```text
GET /api/gallery/collections
GET /api/gallery/collections/{slug}/posts
```

`scripts/check-gallery-acceptance.sh` re-asserts the guarantee *after* curation
has run — `POST`, `PUT` and `DELETE` against a gallery path all answer `405`, and
the data is byte-for-byte unchanged afterwards. Curation was deliberately put on
the bookmark resource under `/v1/` so that this did not have to be carved into;
see [Curation](#curation).

---

## Curation

The archive has exactly two mutations beyond a save, and both live on the
**bookmark** resource under `/v1/`:

| Route | Effect |
|---|---|
| `DELETE /v1/bookmarks/{tweet_id}` | Moves the bookmark into the trash (`deleted_bookmarks`) |
| `PUT /v1/bookmarks/{tweet_id}/collection` | Moves the bookmark into another existing collection |

They are deliberately **not** gallery routes; putting them next to the `POST`
that created the bookmark is what keeps
[the gallery's read-only guarantee](#the-gallery-api-is-read-only) whole instead
of turning it into a list of exceptions.

> **Vocabulary.** The web app's UI copy says **folder**; the API and the database
> say **collection**. They are the same thing, and `slug` is the key either way:
> a "move to folder" is `PUT …/collection` with `{"slug":"…"}`. Expect both words
> in the same conversation.

### `DELETE /v1/bookmarks/{tweet_id}`

```http
DELETE /v1/bookmarks/123456789

200 OK
{"status":"deleted","tweet_id":"123456789","recoverable":true}
```

`200` with a body rather than `204`, for two reasons: the web client parses every
successful response as JSON, and the body can state the one thing that makes
offering a delete safe at all — the row moved to the trash and is still
recoverable.

The delete is **soft**: the row leaves `bookmarks` and is copied verbatim into
`deleted_bookmarks`, stamped with `deleted_at`. See
[Soft delete: `deleted_bookmarks`](#soft-delete-deleted_bookmarks) for the design
and its rationale.

### `PUT /v1/bookmarks/{tweet_id}/collection`

```http
PUT /v1/bookmarks/123456789/collection
Content-Type: application/json

{"slug":"ai"}

200 OK
{"status":"moved","tweet_id":"123456789","slug":"ai"}
```

The target collection **must already exist**. The web app never creates a folder
— the extension owns folder names, and a display name cannot be invented from a
slug — so a slug the database does not know is a stale picker and answers `404`.

| Status | When | Body |
|---|---|---|
| `200 OK` | `DELETE`: the row moved to the trash; `PUT`: the row changed collection | `{"status":"deleted",…,"recoverable":true}` / `{"status":"moved",…,"slug":"…"}` |
| `400 Bad Request` | Empty, non-numeric or over-32-character tweet id; invalid slug; malformed JSON body | `{"status":"error","reason":"…"}` |
| `404 Not Found` | The tweet is not a live bookmark — unknown **or already deleted** — or, for a move, the target collection does not exist | `{"status":"error","reason":"tweet is not saved"}` / `{"status":"error","reason":"collection does not exist"}` |
| `405 Method Not Allowed` | Wrong method on either route (for example `POST`) | plain-text `method not allowed`, `Allow: DELETE` or `Allow: PUT` |
| `500 Internal Server Error` | Database/internal failure | `{"status":"error","reason":"internal error"}` |

The two `404` causes share a status on purpose: a caller that asks to delete a
tweet nobody saved and a caller that asks to move it into a folder that does not
exist both requested a change that did not happen.

Deleting an already-deleted post is `404`, not a second trash entry. Re-saving a
tweet whose earlier copy sits in the trash succeeds (`201`): the trash is a log,
not a claim on the Status ID, so the earlier deletion stays as its own audit row.

### The web UI

Every post card shows a kebab (⋮) at its top-right on hover — and also on keyboard
focus, since a hover-only control is unusable without a pointer. The same kebab
sits in the media lightbox's info panel, to the left of the `×`. It opens a menu
with **Move to folder** and **Delete bookmark**.

- Delete asks for confirmation first, and the confirmation says the bookmark is
  kept and can be restored by hand. There is deliberately **no undo button**.
- The folder picker lists every folder except the one the post is already in,
  each with its post count.
- After a successful delete or move the card leaves the grid and the header counts
  drop, **without refetching**, so the scroll position and the already-loaded pages
  survive.
- On failure nothing changes on screen and a `role="alert"` banner says so
  explicitly (`… Nothing was changed.`).
- Deleting the post that is open in the lightbox closes the lightbox.

### Restoring a deleted bookmark (manual)

Recovery is a documented SQL step against the database, not a UI feature. The
trash row is intentionally **not** removed by the restore, so every restore leaves
an audit trail.

Find the row first:

```bash
sqlite3 -header -column ~/.twitter-bookmarker/tw-bookmarker.db \
  "SELECT id, tweet_id, author, deleted_at FROM deleted_bookmarks ORDER BY deleted_at DESC;"
```

Then re-insert it by the trash row's `id`:

```sql
INSERT INTO bookmarks (tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
SELECT tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media
FROM deleted_bookmarks WHERE id = <the trash row's id>;
```

The row returns to the collection it was deleted from: `collection_id` is copied
into the trash for exactly that reason.

---

## Invariants (PRD §71)

```text
The SQLite database is the durable source of truth.

One Tweet Status ID may only exist once globally.

Backend never owns extension category configuration.

Rename never rewrites old bookmark rows.

Deleting a category in the extension never deletes stored bookmarks.

Never unbookmark before database persistence succeeds.

A failed X unbookmark never rolls back saved database rows.

Previously saved tweets must be identifiable before user clicks them.
```

Supporting guarantees:

- The backend binds `127.0.0.1` only — never `0.0.0.0`.
- Slugs must match `^[a-z0-9][a-z0-9-]*$`; the pattern forbids `.`, `/`, `\`, `~`
  and `_`, and the validator additionally rejects empty, over-long, NUL-containing,
  untrimmed and `..`-containing values. There is no filesystem path involved any more.
- The database is the only file the server owns: `journal_mode=DELETE` keeps the
  storage directory to one complete file at every quiescent moment, so a
  `git add` of the directory never misses committed rows in a `-wal` sidecar.
- `saved_at` is generated by the backend, in UTC.
- `GET /api/gallery/*` is GET-only; every mutating route lives on `/v1/`
  (`POST /v1/bookmarks` and the two [curation](#curation) routes). A wrong method
  on a known route is `405` with an `Allow` header, never a silent fallthrough.
- `DELETE /v1/bookmarks/{tweet_id}` moves the row to `deleted_bookmarks`; it never
  destroys a row, and no read path consults the trash.

---

## Development

```bash
make build          # backend binary + extension dist/ + web/dist
make test           # go test ./... -race, then npm test, then pnpm test
make lint           # gofmt check + go vet + extension tsc + web tsc
make fmt            # gofmt -w backend
make clean          # remove backend/bin + extension/dist + web/dist (never user data)
make clean-storage  # DESTRUCTIVE: delete ~/.twitter-bookmarker (database + backup/)
```

Extension-only scripts (`cd extension`):

```bash
npm run build       # one-shot esbuild bundle into dist/
npm run watch       # rebuild on change
npm run typecheck   # tsc --noEmit
npm test            # node --test test/*.test.mjs (158 tests)
npm run verify      # post-build dist/ verification
```

### Phase 2 workflow (backend + web gallery)

The SPA in `web/` is a second, optional surface: the extension still writes the
database and the Go backend still serves it. Develop the SPA with Vite HMR in two
terminals — the dev server proxies `/api` to the backend, so no CORS setup and no
rebuild between edits:

```bash
# terminal 1 — the Go API + web/dist (also picks up a rebuild of web/dist)
make dev-backend
# terminal 2 — the Vite dev server (http://localhost:5173, proxies /api → :43121)
make dev-web
```

For a production run, build everything and use the single origin:

```bash
make build   # backend binary + extension/dist + web/dist
make run     # http://127.0.0.1:43121/ serves the built SPA and the API
```

- Gallery home: `http://127.0.0.1:43121/`
- One collection: `http://127.0.0.1:43121/collections/linux`
- Health: `http://127.0.0.1:43121/health`

Web-only scripts (`cd web`):

```bash
pnpm test           # Vitest + Testing Library
pnpm run typecheck  # tsc --noEmit
pnpm build          # one-shot production bundle into web/dist/
```

Acceptance gates (`make build` first, so `web/dist` exists):

```bash
make verify          # every gate below, in order
make verify-http     # scripts/check-gallery-acceptance.sh — PRD §80 + §82 + curation over HTTP (116 checks)
make verify-trace    # scripts/check-requirement-traceability.sh (82/82 requirements)
make verify-web      # scripts/check-web-acceptance.sh — real browser (agent-browser), 146 checks:
                     # responsive 390/768/1440, axe-core a11y, keyboard/focus,
                     # lightbox, the curation card menu and both curation dialogs,
                     # and the live-database window-focus refetch
make verify-extension # extension/dist verification (extension `npm run verify`)
```

The full manual test procedure — every PRD §68 scenario with exact steps,
expected observations, and disk checks, plus the PRD §82 end-to-end scenario —
lives in **[`docs/MANUAL-TEST-CHECKLIST.md`](docs/MANUAL-TEST-CHECKLIST.md)**.

---

## Troubleshooting

### Popup says Disconnected / toast says `Backend unavailable`

- Is the server running? `curl -s http://127.0.0.1:43121/health`
- Check the address printed under the status dot: it is exactly what is being
  probed (`/health` appended to it is the tooltip). If **Backend URL** is
  **Custom**, that address — not `127.0.0.1:43121` — is the one that must answer.
- The extension probes `/health` with a ~4 s timeout, so a stopped backend
  shows Disconnected without hanging. The ceiling is that high because a custom
  target behind a tunnel measures ~1–1.7 s per warm probe; on loopback a refused
  connection still fails instantly, so this only waits when the server is silent.
  The very first probe after a browser start pays DNS + TLS + tunnel setup and can
  exceed even that, which is what **Retry** is for.
- **Connected is not proof that the token is right.** `/health` stays open on
  purpose (it answers with no bookmark data), so a custom target with a wrong or
  missing **Token** still reads Connected — while every `/v1/*` call fails, which
  shows up as the error toast and *Failed* on the tweet. Re-paste the token from
  `TWITTER_BOOKMARKER_TOKEN` in `.env`, or `curl -s -H "Authorization: Bearer
  $TOKEN" <base>/v1/index` to check it directly.
- Nothing is lost: the tweet stays bookmarked and no bookmark row is written.

### Port already in use

The server exits non-zero with `port 43121 is already in use`. Find the holder
with `lsof -i :43121` (or `ss -ltnp | grep 43121`) and stop it — only one
backend may run, because the port is fixed in `backend/internal/config/config.go`.

### `tw-bookmarker.db` is missing, or startup refuses to open it

A missing database is normal: the server creates the schema (and stamps
`user_version=2`) on first start, and a fresh install legitimately has no data.
A version-1 database is **upgraded in place** on startup — one transaction that
creates `deleted_bookmarks` and its index and stamps version 2, rewriting no row.
It **refuses** to open a file it does not recognise — a version other than 1 or 2,
a version-2 file that is missing one of the tables, or a version-0 file that
already contains unrelated tables — rather than guessing at an upgrade. There is
no index to rebuild and no `--rebuild-index` flag: the database is the only
artifact. See
[`docs/design/sqlite-migration.md`](docs/design/sqlite-migration.md) §3.

### A bookmark vanished after `Delete bookmark`

It was not destroyed: the row moved into the `deleted_bookmarks` table. The UI has
no undo, but the row can be put back with the documented SQL recipe — see
[Restoring a deleted bookmark](#restoring-a-deleted-bookmark-manual). The trash
row deliberately stays behind afterwards, so the restore itself is audited.

### Saved tweets no longer show `✓ Saved`

The saved state comes from `GET /v1/index` at page entry. Confirm the backend is
running and `/v1/index` answers (it reads the same database as the gallery, so it
cannot disagree with it), then reload the Bookmarks page. If the entry fetch
failed while the backend was down, the extension re-fetches once when a save next
confirms the backend is reachable.

### Organizer controls stop appearing (X changed its route)

X moved the Bookmarks timeline from `/i/bookmarks` to **`/i/history`**. The
accepted paths live in two places that must stay in sync:

| File | What it controls |
|---|---|
| `extension/src/content/route.ts` → `BOOKMARKS_PATHS` | when the organizer activates |
| `extension/manifest.json` → `content_scripts[0].matches` | when the script is injected at all |

`/i/bookmarks` is still accepted as a legacy alias so an old link or a
client-side redirect does not leave the page without the organizer. If X moves
the timeline again, add the new path to both files, then
`cd extension && npm run build` and reload the unpacked extension.
`npm run verify` asserts the two lists agree.

### Organizer controls stop appearing (X changed its DOM)

All X selectors and every attribute the extension writes are in one file:
**`extension/src/content/selectors.ts`**. Each anchor has an ordered fallback
list, so a single X change is usually a one-line edit there (add/replace a
fallback), then `cd extension && npm run build` and reload the unpacked
extension. Do not hardcode X selectors in other modules.

### Permissions

The extension requests only `storage` plus host access to `https://x.com/*` and to
`http://*/*` / `https://*/*`. The two wildcards exist so the popup's **Backend URL**
setting can point at any user-chosen host; the extension only ever fetches the
configured backend base URL (loopback by default) and never any other host. It never
requests `history`, `downloads`, `bookmarks`, `tabs`, `notifications`, or `scripting`.
