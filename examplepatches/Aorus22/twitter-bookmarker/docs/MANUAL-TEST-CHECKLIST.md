# Manual Test Checklist — Twitter Bookmarker

Executable checklist for the PRD §68 test scenarios (plus the §64 edge cases and
the popup/toast scenarios automation cannot prove). Every row has exact steps,
an observable expected result, and what to inspect on disk.

> This file is the manual half of Phase 6. The automated half is
> `go test ./... -race` (backend, PRD §65 items 1–20), `npm test`
> (extension, 158 tests) and, for the gallery, `cd web && pnpm test`
> (46 files / 496 tests) plus the two acceptance scripts described in §4.
> The curation feature has its own scenario, §5 *G1*. Anything automated
> there is **not** repeated here.
>
> A literal `~/.twitter-bookmarker/...` below is the **default** storage path. If
> you started the backend with `TWITTER_BOOKMARKER_DIR`, substitute that
> directory — see [Disk locations](#disk-locations-and-inspection-commands).
>
> Storage is one SQLite database (`tw-bookmarker.db`). The schema, the pragmas
> and the read path are specified in
> [`design/sqlite-migration.md`](design/sqlite-migration.md); inspect it with the
> `sqlite3` CLI (see the table below).

---

## 1. Prerequisites

| Requirement | Check |
|---|---|
| Go ≥ 1.22 | `go version` |
| Node ≥ 20 + npm | `node --version && npm --version` |
| Chrome / Chromium | any recent stable |
| `sqlite3` (database inspection) | `sqlite3 --version` |
| `python3` (JSON inspection) | `python3 --version` |
| A signed-in X account with at least 6 bookmarks | `https://x.com/i/history` |

### Build and run

```bash
# From the repo root:
make build                     # backend binary + extension/dist
make run                       # starts the loopback server (Ctrl+C to stop)

# Extension only (already covered by `make build`, shown for reference):
cd extension && npm run build
```

### Load the extension

1. Open `chrome://extensions`
2. Enable **Developer mode** (top-right)
3. Click **Load unpacked** and select `extension/dist/`
4. Pin the extension so the popup is one click away

### Create the categories used below

Open the popup and add, in order: **AI**, **Linux**, **Design**.
Set display mode to **Popover** first; switch to **Inline** only for scenario B9.

### Disk locations and inspection commands

Everything below uses `<storage>`: `$TWITTER_BOOKMARKER_DIR` when that is set,
`~/.twitter-bookmarker` otherwise (PRD §15). With `make run` the value comes from
`.env.local` or the command line, so mirror it here:

| What | Path / command |
|---|---|
| Storage dir | `ls -la "$STORAGE"` |
| Database | `$STORAGE/tw-bookmarker.db` |
| Schema version | `sqlite3 "$DB" 'PRAGMA user_version;'` |
| Collections + post counts | `sqlite3 -header -column "$DB" "SELECT c.slug, c.name, count(b.tweet_id) AS posts FROM collections c LEFT JOIN bookmarks b ON b.collection_id = c.id GROUP BY c.id ORDER BY c.slug;"` |
| One collection's newest rows | `sqlite3 -header -column "$DB" "SELECT b.tweet_id, b.author, b.saved_at, b.text FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux' ORDER BY b.saved_at DESC LIMIT 5;"` |
| Health | `curl -s http://127.0.0.1:43121/health` |
| Index over HTTP | `curl -s http://127.0.0.1:43121/v1/index \| python3 -m json.tool` |
| Gallery collections | `curl -s http://127.0.0.1:43121/api/gallery/collections \| python3 -m json.tool` |

```bash
export STORAGE="${TWITTER_BOOKMARKER_DIR:-$HOME/.twitter-bookmarker}"
export DB="$STORAGE/tw-bookmarker.db"
```

> The `sqlite3` CLI defaults `PRAGMA foreign_keys` to **off**. Reads are
> unaffected; before any manual `DELETE FROM collections`, run
> `PRAGMA foreign_keys=ON` in the same session (or pass
> `-cmd 'PRAGMA foreign_keys=ON'`) so `ON DELETE CASCADE` fires. The server's own
> connections always have it on because it is set in the DSN
> ([`design/sqlite-migration.md`](design/sqlite-migration.md) §4).

> **Isolated smoke run (never touches real data):**
> `TWITTER_BOOKMARKER_DIR=$(mktemp -d) ./backend/bin/twitter-bookmarker-server`
> An explicit env var wins over `$HOME`, so the database lands in the temp dir.
> Use this for the pure-backend scenarios (A1–A5) if you do not want to touch
> real data. To seed a disposable database with known contents instead, run
> `bash scripts/seed-gallery-fixture.sh /tmp/twbm-manual --fresh`.

### Reading the UI

| Where | What |
|---|---|
| Row directly **above** the tweet action bar | organizer root: `[Organize]` (popover) or category chips (inline) — its own full-width row, never sharing the native tools' row |
| Popover panel | AI / Linux / Design rows, each with its colour dot |
| Saved tweet | `✓ Saved` replacing the category controls |
| Toasts | bottom-right stack, auto-dismiss ~3.5 s, click to dismiss |

---

## 2. Scenario index

| ID | Scenario | Layer |
|---|---|---|
| A1 | Normal save | Backend + browser |
| A2 | Second save same tweet (duplicate) | Backend + browser |
| A3 | Backend offline | Browser |
| A4 | Auto-unbookmark enabled | Browser |
| A5 | Auto-unbookmark fails | Browser |
| B1 | Rename category | Browser (popup) |
| B2 | Delete category | Browser (popup) |
| B3 | Browser reload shows `✓ Saved` | Browser |
| B4 | Backend restart (no derived index) | Backend + browser |
| B5 | Stray CSV/index sidecars ignored | Backend + browser |
| B6 | Popup live reorder without reload | Browser (popup) |
| B7 | Popup Connected / Disconnected | Browser (popup) |
| B8 | Double-click category → one request | Browser + backend log |
| B9 | Inline category display | Browser |
| B10 | Custom backend URL | Browser (popup) + backend |
| C1 | Multiline tweet | Browser |
| C2 | Emoji author | Browser |
| C3 | Quoted tweet (parent text only) | Browser |
| C4 | Image-only tweet (empty text) | Browser |
| D1 | SPA navigation away/back | Browser |
| D2 | Infinite scroll | Browser |
| D3 | DOM re-render (no duplicate controls) | Browser |
| E1 | Toast visuals / stacking / click-through | Browser |
| F1 | PRD §82 end-to-end gallery scenario (24 steps) | Backend + browser |
| G1 | Curation: delete, move and restore (17 steps) | Backend + browser |

---

## 3. Scenarios

### A1 — Normal save  ·  PRD §68 *Normal save*

**Steps**
1. `make run` (the server logs `listening=127.0.0.1:43121` and the storage dir
   as structured `slog` text, plus `collections=N bookmarks=M`).
2. Open `https://x.com/i/history`; wait for organizers to appear.
3. Click **Linux** on any tweet.

**Expected**
- Success toast `Saved to Linux`.
- The tweet's controls are replaced by `✓ Saved`.
- Server log shows one save; no error.

**Inspect on disk**
```bash
sqlite3 -header -column "$DB" "SELECT b.tweet_id, b.url, b.author, b.username, b.tweet_date, b.saved_at, b.text, b.media FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux' ORDER BY b.saved_at DESC LIMIT 1;"
curl -s http://127.0.0.1:43121/v1/index | python3 -m json.tool
```
- The `linux` collection holds exactly one bookmark row for the tweet (and the
  `collections` table has one `slug='linux'`, `name='Linux'` row).
- The row's `saved_at` ends in `Z` (UTC) and the URL is canonical
  (`https://x.com/<handle>/status/<id>`, no `?s=` tracking suffix).
- `media` parses as a JSON array. On a tweet with a photo it holds
  `https://pbs.twimg.com/media/<id>.<ext>` (sizing query stripped); on a tweet
  with video/GIF it holds the `amplify_video_thumb`/`tweet_video_thumb` poster;
  on a text-only tweet it is exactly `[]`:

  ```bash
  sqlite3 "$DB" "SELECT b.media FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux' ORDER BY b.saved_at DESC LIMIT 1;" | python3 -c "import json,sys; print(json.load(sys.stdin))"
  ```
- `/v1/index` has one `items["<id>"]` entry with `"slug":"linux"`.

> **Prerequisite for existing installs:** a directory from the CSV era must be
> migrated before the server can see its data, because the backend no longer
> reads CSVs at all. Run the data repository's
> `Scripts/migrate_to_sqlite.py` (see
> [`design/sqlite-migration.md`](design/sqlite-migration.md) §9); it moves the
> CSVs and `index.json` into `backup/` and leaves `tw-bookmarker.db` in place.
> Save a fresh tweet afterwards to prove the database path end to end.

---

### A2 — Second save same tweet  ·  PRD §68 *Second save same tweet*

**Steps**
1. On a tweet already saved to **Linux**, click **AI**.

**Expected**
- Info toast `Already saved` (not a success or error toast).
- The tweet shows `✓ Saved`; **no** new row anywhere.
- Server log records a duplicate `409`.

**Inspect on disk**
```bash
sqlite3 -header -column "$DB" "SELECT c.slug, c.name, count(b.tweet_id) AS posts FROM collections c LEFT JOIN bookmarks b ON b.collection_id = c.id GROUP BY c.id ORDER BY c.slug;"
sqlite3 "$DB" "SELECT count(*) FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux';"
```
- The `linux` post count is unchanged.
- There is no `ai` bookmark row for that tweet id, and no `ai` collection was
  created (the duplicate check runs before the collection upsert; the duplicate
  key is global, across collections, enforced by `bookmarks.tweet_id` being the
  primary key).

---

### A3 — Backend offline  ·  PRD §68 *Backend offline*

**Steps**
1. Stop the server (Ctrl+C in the `make run` terminal).
2. On a bookmarked tweet, click **Design**.

**Expected**
- Error toast `Backend unavailable`.
- Controls are **restored** (the tweet is not marked `✓ Saved`).
- The tweet remains bookmarked on X — no unbookmark is attempted even if
  auto-unbookmark is enabled (PRD §4.2).

**Inspect on disk**
- No new `design` collection or bookmark row; the database is byte-identical
  (compare `ls -l "$DB"` before and after).

---

### A4 — Auto-unbookmark enabled  ·  PRD §68 *Auto-unbookmark enabled*

**Steps**
1. In the popup, enable **Unbookmark after save**.
2. Save a **new** tweet to any category.

**Expected**
- Success toast `Saved to <Category>` first.
- The database row is committed, then the tweet disappears from X Bookmarks (or
  its native bookmark icon turns back to the un-bookmarked state).
- No warning toast.

**Inspect on disk**
- The new row is present and complete **before** the tweet leaves X:
  ```bash
  sqlite3 -header -column "$DB" "SELECT c.slug, b.tweet_id, b.saved_at FROM bookmarks b JOIN collections c ON c.id = b.collection_id ORDER BY b.saved_at DESC LIMIT 1;"
  ```
- `/v1/index` contains the id (the endpoint reads the same tables).

---

### A5 — Auto-unbookmark fails  ·  PRD §68 *Auto-unbookmark fails*

**Steps**
1. Keep **Unbookmark after save** enabled.
2. Force a verification failure — e.g. save a tweet whose native bookmark
   control X has already detached, or block the click by pausing the tab at the
   moment of the save.
3. Observe for ~2 s (the verification timeout).

**Expected**
- Warning toast `Saved to <Category>, but failed to remove from X bookmarks`.
- The database row **remains**; `✓ Saved` remains; nothing is rolled back.
- The tweet may still be bookmarked on X — that is the accepted outcome.

**Inspect on disk**
- The bookmark row written by this save is still present after the warning:
  ```bash
  sqlite3 -header -column "$DB" "SELECT c.slug, b.tweet_id, b.url FROM bookmarks b JOIN collections c ON c.id = b.collection_id ORDER BY b.saved_at DESC LIMIT 1;"
  ```

---

### B1 — Rename category  ·  PRD §68 *Rename category*

**Steps**
1. Save one tweet to **Linux** so the `linux` collection exists.
2. In the popup, rename **Linux** → **Linux Stuff** and confirm.
3. Save a different tweet to the renamed category.

**Expected**
- The old `linux` collection and its rows are untouched; new saves use the new
  slug `linux-stuff`.
- No toast error; the popup shows the new name and the new slug.

**Inspect on disk**
```bash
sqlite3 -header -column "$DB" "SELECT id, slug, name FROM collections ORDER BY slug;"
sqlite3 "$DB" "SELECT count(*) FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux';"
sqlite3 "$DB" "SELECT count(*) FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux-stuff';"
```
- `linux` still has exactly its original row.
- `linux-stuff` is a **new** collection row with the new bookmark. Renaming
  changes the slug (which is derived from the name), so it never rewrites the old
  bookmark rows.
- `/v1/index` maps each tweet id to the slug used at save time.

---

### B2 — Delete category  ·  PRD §68 *Delete category*

**Steps**
1. With the `linux` collection populated, delete the **Linux Stuff** category in
   the popup.
2. Confirm the native dialog: `Delete category "Linux Stuff"? Existing CSV data
   will not be deleted.`
3. Save a different tweet to another category (e.g. **AI**).

**Expected**
- The category disappears from the popup.
- No backend request is made for the delete (no server log line).
- The database is untouched; `/v1/index` entries for deleted categories are
  untouched.

**Inspect on disk**
```bash
sqlite3 -header -column "$DB" "SELECT slug, name FROM collections ORDER BY slug;"
sqlite3 "$DB" "SELECT count(*) FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug IN ('linux','linux-stuff');"
```
- The `linux` / `linux-stuff` collections and their bookmark rows are still
  there — deleting a category only edits `chrome.storage.local`.
- Previously saved tweets still show `✓ Saved` on reload (edge case §64
  *"tweet saved in category that no longer exists"*).

> The popup's confirm text still says "Existing CSV data will not be deleted."
> That string lives in `extension/src/popup/category-manager.ts` and was not part
> of the storage migration; quote it as-is when matching the dialog, and read it
> as "existing bookmark data".

---

### B3 — Browser reload shows `✓ Saved`  ·  PRD §68 *Browser reload*

**Steps**
1. Save a tweet, then hard-reload `https://x.com/i/history` (F5).
2. Wait for the timeline and organizers to render.

**Expected**
- The previously saved tweet displays `✓ Saved` **before** the user clicks
  anything (the index is fetched once on page entry).
- `chrome://extensions` → the content script makes **one** `/v1/index` request
  per page entry (check the service worker console / network tab).

**Inspect on disk**
- `/v1/index` unchanged by the reload (it is computed from the database, never
  written back).

---

### B4 — Backend restart (no derived index)  ·  PRD §68 *Backend restart without index.json*

**Steps**
1. Stop the server.
2. `make run` again (there is no derived index file to delete first — that is the
   point of the scenario).
3. Reload `https://x.com/i/history`.

**Expected**
- Startup log reports `collections=N bookmarks=M` for the existing database; the
  server starts normally.
- Previously saved tweets show `✓ Saved` again.

**Inspect on disk**
```bash
sqlite3 "$DB" "SELECT count(*) FROM collections;"   # unchanged
sqlite3 "$DB" "SELECT count(*) FROM bookmarks;"     # unchanged
sqlite3 "$DB" "PRAGMA integrity_check;"             # 'ok'
```
- The database is byte-identical across the restart (the server only reads it at
  startup to count, and never rewrites it on open).
- `/v1/index` lists every id.

---

### B5 — Stray CSV/index sidecars ignored  ·  PRD §68 *Corrupt index.json*

**Steps**
1. Stop the server.
2. Drop CSV-era leftovers into the storage directory (this is exactly what the
   migration leaves behind, and what the fixture seeds as decoys):
   ```bash
   printf 'not json' > "$STORAGE/index.json"
   printf 'url,media,author,username,tweet_date,saved_at,text\nhttps://x.com/leftover/status/1,"[]",Leftover,@leftover,2026-01-01T00:00:00Z,2026-01-01T00:00:00Z,decoy\n' > "$STORAGE/linux.csv"
   ```
3. `make run`; reload X Bookmarks.

**Expected**
- The server starts normally and logs the **same** collection and bookmark
  counts — the backend owns only `tw-bookmarker.db` and never scans the directory
  (no `backup/` handling, no CSV reader).
- Saved tweets still show `✓ Saved`; duplicates are still rejected.

**Inspect on disk**
```bash
sqlite3 "$DB" "SELECT count(*) FROM bookmarks;"   # unchanged — the decoy row is not read
sqlite3 "$DB" "SELECT count(*) FROM collections WHERE slug = 'leftover';"   # -> 0
curl -s http://127.0.0.1:43121/api/gallery/collections | python3 -m json.tool  # no 'leftover'
```
- The database is byte-identical to before the decoys were added.
- A corrupt `index.json` cannot break the server, because nothing reads it.

> Clean up the decoys afterwards if you plan to run the migration script:
> `rm -f "$STORAGE/index.json" "$STORAGE/linux.csv"`.

---

### B6 — Popup live reorder without reload  ·  PRD §51 / §64

**Steps**
1. Keep `https://x.com/i/history` open with organizers visible.
2. In the popup, drag **Design** above **AI**.
3. Without reloading X, look at an organizer (popover or inline).

**Expected**
- The visible category controls reorder live (storage-change propagation) —
  no reload, no duplicate controls.
- Open popovers close cleanly if their tweet is removed.

---

### B7 — Popup Connected / Disconnected  ·  PRD §44

**Steps**
1. With the server running, open the popup → status shows **Connected**.
2. Stop the server, reopen the popup → **Disconnected**.
3. Start the server again, reopen the popup → **Connected**.

**Expected**
- The probe uses `GET /health` with a ~4 s timeout; a stopped backend shows
  **Disconnected** without hanging the popup. (The ceiling is generous because a
  custom target reached through a tunnel measures ~1–1.7 s per warm probe, and a
  1.5 s ceiling reported Disconnected for a backend that was answering. The first
  probe after a browser start can exceed it — DNS, TLS, tunnel setup — and
  **Retry** then succeeds.)
- The address under the status is the one actually probed (`/health` appended to
  it is the tooltip), so a custom backend can never be silently ignored.

---

### B8 — Double-click category → one request  ·  PRD §64 *Double-click category*

**Steps**
1. With the server log visible, double-click **Linux** on an unsaved tweet.
2. Watch the controls: they show a disabled/saving state.

**Expected**
- Exactly **one** `POST /v1/bookmarks` in the server log.
- One success toast; one bookmark row in the database.
- The controls disable immediately, so the second click is ignored.

**Inspect on disk**
```bash
sqlite3 "$DB" "SELECT count(*) FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux';"
```
- Exactly 1 row for that tweet (the primary key makes a second insert impossible).

---

### B9 — Inline category display  ·  PRD §32 / §33 / §51

**Steps**
1. Open the popup and set **Category display** to **Inline**.
2. Without reloading X, look at any bookmark tweet on `/i/history`.
3. Switch back to **Popover** and look again.

**Expected**
- Inline: every tweet shows its category chips directly on the organizer row
  (one chip per category, no expand trigger).
- Popover: the same row shows a single **Organize** trigger that opens the
  category popover instead.
- Both modes come from the content script that was *already loaded*: switching the
  setting must not require a tab reload (PRD §51). If the mode does not change,
  the tab is still running a stale content script — reload the extension in
  `chrome://extensions` and hard-reload the tab.

---

### B10 — Custom backend URL  ·  PRD §50

**Steps**
1. Start the server on its default port; open the popup → **Connected**,
   address `http://127.0.0.1:43121`.
2. Set **Backend URL** to **Custom**, type `ftp://nope`, click **Save** →
   inline error, nothing is persisted.
3. Type `192.168.1.10:8080/` (or any reachable host with a port), leave
   **Token** empty, and click **Save**.
4. Paste the server's `TWITTER_BOOKMARKER_TOKEN` into **Token** — including a
   `Bearer ` prefix, to check it is stripped — and click **Save**.
5. Restart the server on that same port and click **Retry**.

**Expected**
- Step 2: the error `Enter a valid http:// or https:// URL…` appears; the status
  card still shows the old address.
- Step 3: the address under the status becomes the normalized
  `http://192.168.1.10:8080` (scheme defaulted, trailing slash dropped), the
  field shows the same normalized value, and the status re-probes immediately.
- Step 4: the field shows the token without its `Bearer ` prefix, and the status
  re-probes even though the URL did not change. Note what the status can and
  cannot tell you: the probe is `GET /health`, which the server keeps open on
  purpose, so **Connected** appears with a wrong token too. What changes is
  `/v1/*`: against a server that demands the token, `GET /v1/index` and a save
  from X fail without it and succeed with it (an error toast plus *Failed* on the
  tweet's controls before, a saved row after).
- Step 5: **Connected** against the custom server; a save from X lands in *that*
  server's database, not in the default one.
- Switching back to **Localhost** restores `http://127.0.0.1:43121` while
  remembering the custom URL for next time, and sends **no** `Authorization`
  header (inspect the request in DevTools → Network).

**Inspect on disk**
```bash
# What the extension persisted (open the popup, then run in the popup's console):
#   chrome.storage.local.get("twitterBookmarker").then((s) => console.log(s.twitterBookmarker.settings))
```
- `backendMode: "custom"`, `backendUrl: "http://192.168.1.10:8080"`,
  `backendToken: "<the token>"` — one storage key only, and no second key for the
  URL or the token.

---

### C1 — Multiline tweet  ·  PRD §68 *Multiline tweet*

**Steps**
1. Find or post a bookmark whose text contains a blank line between paragraphs.
2. Save it.

**Expected**
- Success toast; the stored text stays intact (the internal newline is preserved
  verbatim — there is no CSV quoting layer any more).

**Inspect on disk**
```bash
sqlite3 "$DB" "SELECT quote(b.text) FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux' ORDER BY b.saved_at DESC LIMIT 1;"
```
- The `text` value keeps the internal newline and trims only leading/trailing
  whitespace (PRD §14).

---

### C2 — Emoji author  ·  PRD §68 *Emoji author*

**Steps**
1. Save a tweet whose display name contains an emoji (e.g. `Foo, Bar 🐧`).

**Expected**
- The text is stored as raw UTF-8; no mojibake.

**Inspect on disk**
```bash
sqlite3 "$DB" "SELECT b.author FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux' ORDER BY b.saved_at DESC LIMIT 1;"
sqlite3 "$DB" "PRAGMA encoding;"     # reports UTF-8
```

---

### C3 — Quoted tweet (parent text only)  ·  PRD §68 *Quoted tweet*

**Steps**
1. Save a quote tweet: outer comment + embedded quoted tweet.

**Expected**
- Only the **parent** text is saved. The quoted text never appears in the
  database.

**Inspect on disk**
```bash
sqlite3 "$DB" "SELECT count(*) FROM bookmarks WHERE text LIKE '%<distinctive quoted phrase>%';"   # -> 0
```
- The row's `text` equals the outer comment; the `url`/`author`/`username` are
  the parent tweet's, not the quoted one's.

---

### C4 — Image-only tweet  ·  PRD §68 *Image-only tweet*

**Steps**
1. Save a bookmark that has media but no text.

**Expected**
- The row is created with an empty `text` value (the tweet is still saveable).

**Inspect on disk**
```bash
sqlite3 "$DB" "SELECT quote(b.text) FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux' ORDER BY b.saved_at DESC LIMIT 1;"   # -> ''
sqlite3 "$DB" "SELECT b.media FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'linux' ORDER BY b.saved_at DESC LIMIT 1;"        # -> non-empty JSON array
```

---

### D1 — SPA navigation away/back  ·  PRD §64 *navigates away / returns*

**Steps**
1. On `https://x.com/i/history`, confirm organizers are present.
2. Click a tweet or a nav item to leave Bookmarks (same tab, no reload).
3. Return to `https://x.com/i/history` via X's own navigation.

**Expected**
- Leaving removes all injected controls; unrelated timelines never get
  organizers (PRD §26).
- Returning re-fetches the index once and re-injects controls; no broken state,
  no duplicated roots.
- No toast survives the route change (route-leave cleanup dismisses them).

---

### D2 — Infinite scroll  ·  PRD §64 *Infinite scrolling*

**Steps**
1. Scroll `https://x.com/i/history` to load several pages of older tweets.

**Expected**
- Every newly loaded row receives controls exactly once.
- No full-document rescans or per-tweet index requests (the sweep is debounced).

---

### D3 — DOM re-render (no duplicate controls)  ·  PRD §64 *DOM re-render*

**Steps**
1. On a tweet showing controls, trigger an X re-render — e.g. open and close a
   quoted tweet, or resize/scroll so X recycles the row.
2. Inspect the row directly above the action bar of that tweet.

**Expected**
- Exactly **one** organizer root per tweet, with one set of category controls.
- If X wipes our root but keeps the container, the debounced sweep re-injects it
  once; if X replaces the whole article node, the fresh node gets controls once.

**Optional DOM assertion (DevTools console on the page)**
```js
document.querySelectorAll('[data-twitter-bookmarker-root]').length
// equals the number of visible bookmarked tweets — never two per tweet
```

---

### E1 — Toast visuals / stacking / click-through  ·  PRD §42

**Steps**
1. Trigger several toasts quickly (a success, an error, and a warning).
2. Click a toast; then click on the page just outside the toast stack.

**Expected**
- Fixed bottom-right stack, newest below/above the others without overlap.
- Toast container has `pointer-events: none`; each toast re-enables pointer
  events. Clicking a toast dismisses **only** that toast; clicking outside the
  stack hits X normally (no dead click zone).
- Toasts auto-dismiss after ~3.5 s; the container is removed with the last one.
- `aria-live="polite"` is present on the container (screen-reader announce).

**Optional DOM assertion**
```js
const root = document.querySelector('[data-twitter-bookmarker-toast-root]');
getComputedStyle(root).pointerEvents;   // 'none'
root.querySelector('[data-twitter-bookmarker-toast]').style.pointerEvents; // 'auto'
```

---

## 4. PRD §82 — end-to-end acceptance scenario (F1)

The full integration walkthrough, in PRD order. Steps **1–15 and 22–24** are
locked automatically by `bash scripts/check-gallery-acceptance.sh` (HTTP) and
steps **16–21** by `bash scripts/check-web-acceptance.sh` (browser, axe and
keyboard); both run under `make verify`. Do this by hand only when you need to
see the pixels, or when the scripts are unavailable.

Seed a disposable storage dir first (never the real one):

```bash
FIXTURE="$(mktemp -d)"
bash scripts/seed-gallery-fixture.sh "$FIXTURE"
TWITTER_BOOKMARKER_DIR="$FIXTURE" TWITTER_BOOKMARKER_WEB_DIR="$PWD/web/dist" \
  ./backend/bin/twitter-bookmarker-server &
```

### Steps 1–4 — start and open the gallery

| # | Step | Expected |
|---|---|---|
| 1 | `curl -s http://127.0.0.1:43121/health` | `{"status":"ok"}` |
| 2 | `ls "$FIXTURE"` | `tw-bookmarker.db` present. The seeded CSV-era decoys (`linux.csv`, `index.json`, `linux.csv.bak`, `.hidden.csv`, `notes.txt`, `subdir/`) are all ignored by the server |
| 3 | Open `http://127.0.0.1:43121/` | Homepage hero + **My Collections** |
| 4 | Look at the collection cards | **AI**, **Linux**, **Design**, each with post/media counts and a cover |

### Steps 5–8 — open a collection

| # | Step | Expected |
|---|---|---|
| 5 | Click **Linux** | URL becomes `/collections/linux` |
| 6 | Look at the masonry | 8 post cards, 1–4 columns by viewport width |
| 7 | Find the 4-image tweet | Four tiles in a 2×2 grid, all decoded |
| 8 | Find the text-only tweet | A text card with no media region — it is not dropped |

### Steps 9–15 — search, filter, sort, paginate

| # | Step | Expected |
|---|---|---|
| 9 | Type `wayland` in search | Results narrow to 2 cards |
| 10 | Clear search, click **Filter** | Desktop: Popover; ≤767 px: bottom Sheet |
| 11 | Bookmark Date → **Last 7 Days** | The saved-date window is set (7 of the 8 rows) |
| 12 | Add a **Tweet Date** from-bound | Both ranges are now active |
| 13 | Click **Apply** | Results shrink to the rows satisfying **both** ranges (5); every visible card matches |
| 14 | Sort → **Newest Posted** | The newest tweet is first |
| 15 | Scroll to the bottom | The next page loads via cursor; no duplicates, no full reload; **the cards already on screen keep their column and do not move** |

### Steps 16–21 — lightbox, keyboard, original tweet

| # | Step | Expected |
|---|---|---|
| 16 | Click an image tile | Lightbox dialog opens for that tweet |
| 17 | Look at the media area | The clicked tweet's image, plus author/handle meta; the indicator is **dots**, one per image *in that tweet* (a 4-image tweet shows 4 dots even when the collection has hundreds), with the active one filled |
| 18 | Press `→` (or click the arrow inside the media area) | The next dot fills — the next image of **the same tweet**; at the tweet's last image the control is disabled and `→` does nothing |
| 19 | Press `←` (or click the arrow inside the media area) | The previous image of the same tweet; disabled at the tweet's first image |
| 20 | Inspect **Open on X** | `href` is the canonical `https://x.com/<user>/status/<id>`; `target="_blank"` + `rel="noopener noreferrer"` |
| 20a | Press `↓` (or click the **double-chevron** button outside the panel) | The lightbox moves to the next tweet that has media, skipping text-only tweets, and shows that tweet's **first** image with the dots reset to its count; `↑` (or the left double-chevron) goes back. Below 1400 px wide these two buttons sit at the media area's top corners rather than in the page gutter |
| 21 | Click **Open on X** | The original tweet opens in a new tab (requires network); `Esc` closes the lightbox and returns focus to the tile |

### Steps 22–24 — live data, no restart

| # | Step | Expected |
|---|---|---|
| 22 | Save a new tweet through the extension (or `POST /v1/bookmarks` with `{"slug":"scenario","name":"Scenario","tweet":{…}}`) | `201 Created`; the row is inserted into the live database |
| 23 | Return to the gallery (or refocus the window) | The collection list and the open collection re-read the database on `focus` |
| 24 | Look at the gallery | The new collection/post appears **without restarting the backend**; `/health` still answers from the same process |

Inspect step 22 directly in the database:

```bash
sqlite3 -header -column "$FIXTURE/tw-bookmarker.db" "SELECT c.slug, b.tweet_id, b.saved_at FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = 'scenario';"
```

**Accessibility sub-check (HARD-04).** Repeat steps 3–21 with a keyboard only
(`Tab` / `Shift+Tab` / `Enter` / `Space` / arrows / `Esc`): every control is
reachable, paints a visible focus ring, the lightbox traps `Tab` and names the
four navigation controls plus the per-post kebab — **five** controls, each with
its own distinct label (`Previous media` / `Next media` / `Previous post` /
`Next post`, where the two pairs look alike so each label is checked on its own,
plus the kebab in the info panel, which is not a navigation control and is
announced as `More actions for <handle>`; the `×` keeps its own `Close lightbox`
label) — `Esc` restores focus to the originating tile, and
images carry an author-derived `alt`. With a screen
reader, the nav, toolbar and lightbox announce meaningful names, and the dots
indicator announces the exact position (`Media 2 of 4`).

**Responsive sub-check (HARD-03).** At 390 / 768 / 1440 px the masonry shows
1 / 2 / 4 columns; **Filter** is a Sheet at 390 and a Popover at 1440; the
wordmark is hidden at 390 px (the logo and the accessible name stay).

**Scroll-stability sub-check.** On a collection with more than one page (the
browser gate seeds a `bulk` collection of 70 posts into the same fixture
database), scroll slowly from top to bottom while watching one card. It must
never change column or jump: the packing is append-only, so a new page can only
add cards at the bottom of a column. Resizing the window *does* re-pack (a real
layout change), and that is expected.

---

## 5. Curation — delete, move and restore (G1)

Curation is the post-§82 gallery feature: a per-post kebab that moves a bookmark
to another folder or soft-deletes it. It is **not** part of PRD §82 (that
scenario's 24 steps end with the live-write check), so it gets its own scenario
ID — **G1**, the next letter in the file's existing `A`–`F` scheme — and its own
numbered steps `G1.1`–`G1.17`. The automated half is covered by the Go and web unit
suites (`make test`) plus two acceptance gates: `bash
scripts/check-gallery-acceptance.sh` locks the HTTP behaviour, and
`bash scripts/check-web-acceptance.sh` locks the browser behaviour (axe, keyboard,
dialogs). That second script names the four browser-visible behaviours it asserts,
so the steps below can refer to them instead of restating them:

- **CUR-01** — a removal is local: card and header counts update in place, nothing
  is refetched, scroll position and loaded pages survive.
- **CUR-02** — the kebab is reachable on hover *and* on keyboard focus and opens a
  menu of exactly two labelled items, including from inside the lightbox, where it
  must not escape the dialog's focus trap.
- **CUR-03** — delete is confirmed and cancellable, is locked while in flight, and
  is soft: the row moves to `deleted_bookmarks` with its payload intact.
- **CUR-04** — a move targets an *existing* folder only, and any failure changes
  nothing on screen and says so.

These are labels local to the acceptance scripts, not requirement IDs in an
archived milestone: `scripts/check-requirement-traceability.sh` reads only
`.planning/milestones/`, so nothing here is registered as a traceable requirement.

Two endpoints back it. Both sit on the **bookmark** resource and deliberately
*not* under `/api/gallery`, which stays strictly GET-only (API-07, PRD-2 §36):

| Request | Success | Refusals |
|---|---|---|
| `DELETE /v1/bookmarks/{tweet_id}` | `200` `{"status":"deleted","tweet_id":"…","recoverable":true}` | unknown / not-saved id → `404`; non-numeric or >32-char id → `400`; wrong method → `405` + `Allow` |
| `PUT /v1/bookmarks/{tweet_id}/collection` with `{"slug":"ai"}` | `200` `{"status":"moved","tweet_id":"…","slug":"ai"}` | target folder missing → `404` (never auto-created); invalid slug → `400`; not-saved id → `404`; wrong method → `405` + `Allow` |

The delete is a **soft** delete: the row is *moved* out of `bookmarks` into
`deleted_bookmarks`, so `bookmarks` is always exactly the live set. There is
deliberately **no undo in the UI**; recovery is the manual recipe in G1.16.
Re-saving a previously deleted tweet succeeds (`201`) — the trash does not claim
the tweet id.

Run these steps against the same disposable fixture as §4 (`$FIXTURE`) or the
real database (`$DB`). The commands below use `$DB`; inside a §4 fixture run
substitute `"$FIXTURE/tw-bookmarker.db"` and `<tweet_id>` (the id in the card's
`Open on X` link).

| # | Step | Expected |
|---|---|---|
| G1.1 | Open any collection and let the pointer rest off the cards | Every card's kebab (⋮) is invisible while its card is idle (`getComputedStyle(kebab.parentElement).opacity` is `0`) |
| G1.2 | Hover a card | The kebab fades in at the card's top-right corner |
| G1.3 | Move the pointer away, then `Tab` to the same kebab | It is revealed again while it holds keyboard focus and paints a visible focus ring — hover must not be the only reveal, or the control would be unusable without a pointer |
| G1.4 | Click the kebab (or press `Enter` / `Space` on it) | A menu opens with **exactly two** items, labelled `Move to folder` and `Delete bookmark` |
| G1.5 | Click `Delete bookmark` | A dialog titled `Delete this bookmark?` opens. Its description names the post's author and handle and says the bookmark is kept in the database's deleted table and can be restored by hand. The buttons are `Cancel` and a destructive `Delete` |
| G1.6 | Click `Cancel`. Then reopen the menu and dialog and press `Esc` | Both close the dialog and send **nothing**: the card is still in the grid and the trash count from command block A is unchanged |
| G1.7 | Reopen the confirmation and click `Delete`, watching the dialog while the request is in flight | Both buttons are disabled, `Esc` and outside-click do nothing, and the `×` close control is gone. When the request lands the dialog closes, the card leaves the grid, and the header counts (`N posts · M media`) drop |
| G1.8 | First scroll well down the collection, then delete a card there | The scroll position and the already-loaded pages survive: the page does not jump to the top and page 1 is not refetched (the row is removed from the loaded list) |
| G1.9 | Inspect the trashed row (command block B) | Exactly one trash row for the tweet, with its whole payload and a `deleted_at` stamp; the live row is gone from `bookmarks` |
| G1.10 | Stop the backend (Ctrl+C), then delete another card | The card stays exactly where it was, the counts are unchanged, and a `role="alert"` banner appears reading `Could not delete this bookmark. Nothing was changed.` Repeat with `Move to folder` for `Could not move this bookmark. Nothing was changed.` Restart the backend afterwards |
| G1.11 | Reopen a card's `Move to folder` | The picker is titled `Move to another folder` and lists every folder **except** the one the post is already in, each row naming the folder and its post count. The loading, error-with-`Retry`, and "this is the only folder" states appear when their conditions hold |
| G1.12 | Choose a destination folder | The picker closes, the card disappears from the current collection, and command block C prints the chosen slug for the same row — it moved, it was not copied |
| G1.13 | Try to move a post into a folder that does not exist (command block D) | `404`, and nothing is created: no `ghost-folder` row in `collections` and the bookmark's folder is unchanged. An invalid slug body answers `400` |
| G1.14 | Open a post in the media lightbox and use the kebab in its info panel (left of the `×`) | The menu, and then the confirmation, mount **inside** the lightbox, so `Tab` stays trapped in the dialog. Confirming closes the lightbox as well (its position is derived from the loaded posts) and the post is in the trash |
| G1.15 | With a keyboard only: `Tab` to a card's kebab, `Enter`, `Delete bookmark`, then confirm | When the card is removed focus lands on the collection heading, not `<body>`, so the next `Tab` continues where the user was instead of restarting at the top of the page. Check `document.activeElement` in the console |
| G1.16 | Restore the deleted bookmark with the documented recipe (command block E) | The before/after counts show the row is live again, and the trash row is **deliberately kept** so a restore stays auditable |
| G1.17 | Check the schema (command block F) | `PRAGMA user_version;` is `2` and all three tables exist. Pointing the new backend at a version-1 directory upgrades it **in place on start** — it adds `deleted_bookmarks` and its index and stamps version 2, rewriting no row |

**Command block A — Cancel / Escape changed nothing (G1.6)**
```bash
sqlite3 "$DB" "SELECT count(*) FROM deleted_bookmarks;"   # before Cancel / Esc
sqlite3 "$DB" "SELECT count(*) FROM deleted_bookmarks;"   # after  Cancel / Esc — identical
sqlite3 "$DB" "SELECT count(*) FROM bookmarks WHERE tweet_id = '<tweet_id>';"   # -> 1, still live
```

**Command block B — the trashed payload survived (G1.9)**
```bash
sqlite3 -header -column "$DB" "SELECT id, tweet_id, collection_id, url, author, username, tweet_date, saved_at, length(text) AS text_len, json_valid(media) AS media_ok, deleted_at FROM deleted_bookmarks WHERE tweet_id = '<tweet_id>' ORDER BY id DESC;"
sqlite3 "$DB" "SELECT count(*) FROM bookmarks WHERE tweet_id = '<tweet_id>';"   # -> 0
```
- One row, `deleted_at` non-empty and ending in `Z`, `media_ok` `1`, and the
  other columns equal to the values the live row held. `text_len` may be `0` for
  an image-only tweet, which is correct.
- The live count is `0`: the row was moved, not flagged.

**Command block C — the move landed (G1.12)**
```bash
sqlite3 "$DB" "SELECT c.slug FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE b.tweet_id = '<tweet_id>';"   # -> the slug you picked
sqlite3 "$DB" "SELECT count(*) FROM bookmarks WHERE tweet_id = '<tweet_id>';"                                                   # -> 1, moved not duplicated
```

**Command block D — a missing target is refused, never created (G1.13)**
```bash
curl -s -o /dev/null -w '%{http_code}\n' -X PUT \
  http://127.0.0.1:43121/v1/bookmarks/<tweet_id>/collection \
  -H 'Content-Type: application/json' -d '{"slug":"ghost-folder"}'          # -> 404
curl -s -o /dev/null -w '%{http_code}\n' -X PUT \
  http://127.0.0.1:43121/v1/bookmarks/<tweet_id>/collection \
  -H 'Content-Type: application/json' -d '{"slug":"Bad Slug"}'              # -> 400
sqlite3 "$DB" "SELECT count(*) FROM collections WHERE slug = 'ghost-folder';"   # -> 0
sqlite3 "$DB" "SELECT c.slug FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE b.tweet_id = '<tweet_id>';"   # unchanged
```

**Command block E — manual restore (G1.16)**

The UI has no undo on purpose. This is the documented recovery path:
```bash
# Before: the row is in the trash, not the live set.
sqlite3 "$DB" "SELECT count(*) FROM bookmarks WHERE tweet_id = '<tweet_id>';"   # -> 0
sqlite3 -header -column "$DB" "SELECT id, tweet_id, collection_id, deleted_at FROM deleted_bookmarks WHERE tweet_id = '<tweet_id>' ORDER BY id DESC LIMIT 1;"

# Restore the row you want, using that trash row's id.
sqlite3 "$DB" "INSERT INTO bookmarks (tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
SELECT tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media
FROM deleted_bookmarks WHERE id = <the trash row's id>;"

# After: live again, and the trash row is still there.
sqlite3 "$DB" "SELECT count(*) FROM bookmarks WHERE tweet_id = '<tweet_id>';"              # -> 1
sqlite3 "$DB" "SELECT count(*) FROM deleted_bookmarks WHERE id = <the trash row's id>;"    # -> 1
```
- The trash row is **intentionally kept**, so the restore itself is auditable and
  a second restore is possible.
- The recipe re-uses the original `collection_id`. If that folder has since been
  deleted, choose an existing one instead
  (`SELECT id FROM collections WHERE slug = '<slug>';`): there is deliberately no
  foreign key from `deleted_bookmarks.collection_id`, so the audit trail outlives
  its folder.

**Command block F — schema version and tables (G1.17)**
```bash
sqlite3 "$DB" 'PRAGMA user_version;'    # -> 2
sqlite3 "$DB" "SELECT name FROM sqlite_master WHERE type = 'table' ORDER BY name;"
# -> bookmarks, collections, deleted_bookmarks
```
- Version 2 added exactly one table plus one index
  (`deleted_bookmarks_by_tweet`); the `collections` and `bookmarks` DDL is
  unchanged from version 1.
- To watch the upgrade: point the server at a version-1 storage directory (or
  restore one from `backup/`), start it, and re-run the two commands above —
  `user_version` is `2` and the row counts in `collections` / `bookmarks` are
  unchanged. A file whose version is neither 1 nor 2 is refused rather than
  migrated.

---

## 6. Sign-off

- [ ] A1–A5 pass
- [ ] B1–B8 pass
- [ ] C1–C4 pass
- [ ] D1–D3 pass
- [ ] E1 passes
- [ ] F1 (PRD §82, steps 1–24) passes
- [ ] G1 (curation, steps G1.1–G1.17) passes
- [ ] No server process left running (`pgrep -f twitter-bookmarker-server` is empty)

**Residual automated coverage (do not re-test manually):** PRD §65 items 1–20
are locked by `cd backend && go test ./... -race` (now including the curation
handlers, the soft-delete/reassign store paths and the version-1 → 2 upgrade);
extraction, quoted/media handling, slug generation, the double-click in-flight
guard, DOM re-injection, observer resilience, bounded cleanup and the
saved-index retry are locked by `cd extension && npm test` (158 tests). The
gallery's §82 walkthrough (F1) and the curation contract (G1) are locked by
`bash scripts/check-gallery-acceptance.sh` (116 passed / 0 failed, HTTP) and
`bash scripts/check-web-acceptance.sh` (146 passed / 0 failed, real browser +
axe-core); the web unit suite is `cd web && pnpm test` (46 files / 496 tests).
Axe-core reports zero serious/critical violations with the card menu open, with
each dialog open (light and dark), and with a menu opened from inside the
lightbox.
