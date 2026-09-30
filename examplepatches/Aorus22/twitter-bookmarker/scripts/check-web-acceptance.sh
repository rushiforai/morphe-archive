#!/usr/bin/env bash
# check-web-acceptance.sh — real-browser acceptance run for the gallery SPA.
#
# Complements scripts/check-gallery-acceptance.sh (HTTP-only, PRD §80). This one
# boots the production Go server against a seeded storage directory and drives
# the real SPA in headless Chrome through agent-browser, so the claims jsdom
# cannot make are verified for real: the applied theme and its persistence, live
# masonry column counts, real key events, focus restoration, filter popover vs
# sheet, decoded images, and screenshots for visual review (PRD §81, §82;
# HARD-03/04).
#
# Fixture = the shared gallery fixture (a tw-bookmarker.db seeded by python3's own
# sqlite3 module) plus a `bulk` collection of 70 posts so infinite scroll has more
# than one page; `design` stays empty for the empty-state check.
#
# Usage: scripts/check-web-acceptance.sh [--out DIR] [--keep]
#
# If port 43121 is already taken (e.g. a developer's own `make run`) this
# re-execs itself in a private network namespace, exactly like
# check-gallery-acceptance.sh, so the two never fight over the port.

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PORT=43121
MEDIA_PORT=8899
BASE="http://127.0.0.1:$PORT"
SERVER="$ROOT/backend/bin/twitter-bookmarker-server"

OUT="$ROOT/artifacts/browser"
KEEP=0
while [ $# -gt 0 ]; do
  case "$1" in
    --out) OUT="$2"; shift 2 ;;
    --keep) KEEP=1; shift ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
done
mkdir -p "$OUT"
OUT="$(cd "$OUT" && pwd)"
# Screenshots are numbered per run, so clear the previous run's files: a stale
# image from an older check list is worse than no image at all.
rm -f "$OUT"/*.png

port_busy() {
  (exec 3<>"/dev/tcp/127.0.0.1/$PORT") 2>/dev/null && exec 3>&- && return 0
  return 1
}
if port_busy && [ -z "${TWBM_BROWSER_NS:-}" ] && command -v unshare >/dev/null 2>&1; then
  echo "port $PORT is busy — re-running in a private network namespace (unshare -rn)"
  echo
  TWBM_BROWSER_NS=1 exec unshare -rn bash -c 'ip link set lo up 2>/dev/null || true; exec "$0" "$@"' "$0" "$@"
fi

for bin in agent-browser jq curl node python3; do
  command -v "$bin" >/dev/null || { echo "missing required tool: $bin" >&2; exit 2; }
done
[ -x "$SERVER" ] || { echo "server binary missing — run 'make build' first" >&2; exit 2; }
[ -f "$ROOT/web/dist/index.html" ] || {
  echo "web/dist is not built — run 'make build' (or 'cd web && pnpm build') first" >&2; exit 2
}
# HARD-04: the accessibility audit runs the real axe-core inside the browser.
AXE_SRC="$ROOT/web/node_modules/axe-core/axe.min.js"
[ -f "$AXE_SRC" ] || {
  echo "axe-core is missing — run 'cd web && pnpm install' first" >&2; exit 2
}

STORAGE="$(mktemp -d)"
SLOG="$(mktemp)"
MEDIA_LOG="$(mktemp)"
SERVER_PID=""
MEDIA_PID=""
SESSION="twbm-acceptance-$$"
SHOT=0
PASS=0
FAIL=0

cleanup() {
  agent-browser --session "$SESSION" close >/dev/null 2>&1
  for pid in "$SERVER_PID" "$MEDIA_PID"; do
    if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then kill "$pid" 2>/dev/null; wait "$pid" 2>/dev/null; fi
  done
  if [ "$KEEP" -eq 1 ]; then
    echo "kept storage: $STORAGE"; echo "kept server log: $SLOG"; echo "kept media log: $MEDIA_LOG"
  else
    rm -rf "$STORAGE" "$SLOG" "$MEDIA_LOG"
  fi
}
trap cleanup EXIT

# --- fixture ----------------------------------------------------------------
"$ROOT/scripts/seed-gallery-fixture.sh" "$STORAGE" --fresh >/dev/null || {
  echo "failed to seed the gallery fixture" >&2; exit 1
}

# Write to the database from outside the server. `foreign_keys=ON` mirrors the
# server's DSN; the CLI defaults it OFF. `.timeout` waits out the server's own write
# lock. Every mutation below is what the extension's POST /v1/bookmarks would do,
# minus the HTTP hop — which is the point: the SPA must pick up data that appeared
# behind its back.
DB="$STORAGE/tw-bookmarker.db"
dbq() { sqlite3 -cmd '.timeout 5000' -cmd 'PRAGMA foreign_keys=ON' "$DB" "$@"; }

# bulk — 70 posts so the collection paginates (limit 30), and every 5th row matches
# "needle" so a search can be proven to actually narrow the result set. Media points
# at the local stub over plain HTTP (see media-stub-server.mjs), so no TLS is tried.
python3 - "$DB" <<'PY'
import json, sqlite3, sys

conn = sqlite3.connect(sys.argv[1])
conn.execute("PRAGMA foreign_keys = ON")
cur = conn.execute(
    "INSERT INTO collections(slug, name, created_at) VALUES('bulk', 'Bulk', '2026-04-01T00:00:00Z')"
)
cid = cur.lastrowid
for i in range(1, 71):
    n = (i % 3) + 1                      # 1..3 media, never text-only
    needle = "needle" if i % 5 == 0 else "straw"
    day = 30 - (i % 28)
    tweet_id = f"3000000000000000{i:03d}"
    media = json.dumps(
        [f"http://pbs.twimg.com/media/bulk{i:03d}_{k}.jpg" for k in range(1, n + 1)]
    )
    conn.execute(
        """INSERT INTO bookmarks
             (tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
           VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)""",
        (
            tweet_id,
            cid,
            f"https://x.com/bulkuser/status/{tweet_id}",
            f"Bulk Author {i % 7}",
            f"@bulk{i:03d}",
            f"2026-03-{day:02d}T10:{i % 60:02d}:00Z",
            f"2026-04-{day:02d}T11:{i % 60:02d}:00Z",
            f"Bulk post {i}: a {needle} in the haystack.",
            media,
        ),
    )
conn.commit()
conn.close()
PY

# The shared fixture's own media URLs are https; rewrite them to http so the stub
# is reached without a TLS handshake.
dbq "UPDATE bookmarks SET media = replace(media, 'https://pbs.twimg.com/media', 'http://pbs.twimg.com/media');"

# --- servers ----------------------------------------------------------------
node "$ROOT/scripts/media-stub-server.mjs" "$MEDIA_PORT" >"$MEDIA_LOG" 2>&1 &
MEDIA_PID=$!
TWITTER_BOOKMARKER_DIR="$STORAGE" "$SERVER" >"$SLOG" 2>&1 &
SERVER_PID=$!

for _ in $(seq 1 80); do
  curl -fsS -m 1 "$BASE/health" >/dev/null 2>&1 && break
  sleep 0.25
done
if ! curl -fsS -m 2 "$BASE/health" >/dev/null 2>&1; then
  echo "server did not become healthy on $BASE" >&2; tail -20 "$SLOG" >&2; exit 1
fi

export AGENT_BROWSER_SESSION="$SESSION"
export AGENT_BROWSER_ARGS="--host-resolver-rules=MAP pbs.twimg.com 127.0.0.1:$MEDIA_PORT"
export AGENT_BROWSER_MAX_OUTPUT=2000

# --- helpers ----------------------------------------------------------------
js() { agent-browser eval "$1" --json 2>/dev/null | jq -r 'if .data.result == null then "null" else .data.result end' 2>/dev/null; }
count() { js "document.querySelectorAll($(printf '%s' "$1" | jq -R .)).length"; }
shot() { SHOT=$((SHOT+1)); agent-browser screenshot "$OUT/$(printf '%02d' "$SHOT")-$1.png" >/dev/null 2>&1; }
pass() { PASS=$((PASS+1)); printf '  \033[32mPASS\033[0m  %s\n' "$1"; }
fail() { FAIL=$((FAIL+1)); printf '  \033[31mFAIL\033[0m  %s — %s\n' "$1" "$2"; }
chk()  { if [ "$2" = "$3" ]; then pass "$1  ($3)"; else fail "$1" "expected [$2], got [$3]"; fi; }
ne()   { if [ "$2" != "$3" ]; then pass "$1  ($3)"; else fail "$1" "expected anything but [$2]"; fi; }
open_url() { agent-browser open "$1" >/dev/null 2>&1; }

# Poll a JS expression until it equals `want`. The masonry column count follows a
# ResizeObserver, so a single sample right after a viewport change can still report
# the previous width's count.
poll_js() {
  local expr="$1" want="$2" tries="${3:-15}" got=""
  for _ in $(seq 1 "$tries"); do
    got=$(js "$expr")
    [ "$got" = "$want" ] && { printf '%s' "$got"; return 0; }
    sleep 0.3
  done
  printf '%s' "$got"
}
cols_expr() { printf '%s' "document.querySelector('[data-testid=\"gallery-masonry\"]').getAttribute('data-columns')"; }
goto_collection() { open_url "$BASE/collections/$1"; agent-browser wait 900 >/dev/null 2>&1; }

# Poll a DOM count until it reaches `want` (used by the focus-refetch check,
# which is inherently asynchronous).
poll_count() {
  local sel="$1" want="$2" got=""
  for _ in $(seq 1 20); do
    got=$(count "$sel")
    [ "$got" = "$want" ] && { printf '%s' "$got"; return 0; }
    sleep 0.3
  done
  printf '%s' "$got"
}

# --- HARD-04 accessibility helpers ------------------------------------------
# axe-core is injected into the live page as a classic script source through
# `eval --stdin` (a 580 KB argv payload exceeds the exec argument limit and
# fails with "Argument list too long"; --stdin has no such limit). `axe.run`
# returns a promise and agent-browser awaits it, so the async IIFE can read the
# violations directly.
inject_axe() { agent-browser eval --stdin < "$AXE_SRC" >/dev/null 2>&1; }
axe_violations() {
  agent-browser eval "(async()=>{if(typeof axe==='undefined')return 'AXE_MISSING';const r=await axe.run(document,{resultTypes:['violations']});const bad=r.violations.filter(v=>v.impact==='serious'||v.impact==='critical');return JSON.stringify(bad.map(v=>v.id+' ('+v.impact+') x'+v.nodes.length+' @ '+v.nodes.map(n=>n.target.join(' ')).join(' | ')))})()" --json 2>/dev/null \
    | jq -r 'if .data.result == null then "AXE_NO_RESULT" else .data.result end' 2>/dev/null
}
axe_check() {
  inject_axe
  local found
  found="$(axe_violations)"
  if [ "$found" = "[]" ]; then pass "axe: zero serious/critical violations — $1"; else fail "axe: zero serious/critical violations — $1" "$found"; fi
}
# A keyboard-focused element must paint a real ring or outline.
FOCUS_RING_EXPR='(()=>{const a=document.activeElement;if(!a)return "none";if(!a.matches(":focus-visible"))return "not-focus-visible";const cs=getComputedStyle(a);const shadow=cs.boxShadow.replaceAll("rgba(0, 0, 0, 0)","");const ring=/0px 0px 0px [1-9][0-9]*px/.test(shadow);const outline=(parseFloat(cs.outlineWidth)>0)&&cs.outlineStyle!=="none";return (ring||outline)?"visible":"no-visible-ring"})()'
focus_ring() { js "$FOCUS_RING_EXPR"; }
active_testid() { js "(()=>{const a=document.activeElement;return a?(a.getAttribute('data-testid')||('tag:'+a.tagName.toLowerCase())):'none'})()"; }

echo "=== production server (pid $SERVER_PID) + media stub on $MEDIA_PORT ==="
echo

# --- homepage and theme -----------------------------------------------------
echo "Homepage"
open_url "$BASE/"
agent-browser wait 1200 >/dev/null 2>&1
chk "hero renders" "true" "$(js "!!document.querySelector('[data-testid=\"gallery-hero\"]')")"
chk "My Collections section header" "true" "$(js "document.body.innerText.includes('My Collections')")"
cards=$(count '[data-testid="collection-card"]')
if [ "$cards" -ge 3 ]; then pass "collection cards rendered ($cards)"; else fail "collection cards rendered" "expected >=3, got $cards"; fi
chk "card meta shows posts/media/last-saved" "true" \
  "$(js "(() => { const t = document.querySelector('[data-testid=\"collection-card\"]').textContent; return t.includes('posts') && t.includes('media') && t.includes('Last saved'); })()")"
chk "footer line present" "true" "$(js "document.body.innerText.includes('No cloud, no algorithmic feed')")"
chk "collection covers have real geometry and a decoded image" "true" \
  "$(js "(() => { const c = document.querySelector('[data-testid=\"collection-cover\"]'); if (!c) return false; const r = c.getBoundingClientRect(); const i = c.querySelector('img'); return r.width > 100 && r.height > 60 && !!i && i.naturalWidth > 0; })()")"
shot "homepage-light"

echo
echo "Theme (WEB-06, PRD §64)"
pref0=$(js "document.querySelector('[data-theme-preference]').getAttribute('data-theme-preference')")
chk "defaults to system" "system" "$pref0"
chk "applied class matches resolved theme" "true" \
  "$(js "document.querySelector('[data-theme-preference]').getAttribute('data-theme-resolved') === (document.documentElement.classList.contains('dark') ? 'dark' : 'light')")"
agent-browser click '[data-theme-preference]' >/dev/null 2>&1
chk "system -> light" "light" "$(js "document.querySelector('[data-theme-preference]').getAttribute('data-theme-preference')")"
agent-browser click '[data-theme-preference]' >/dev/null 2>&1
chk "light -> dark applies dark" "dark" "$(js "document.documentElement.classList.contains('dark') ? 'dark' : 'light'")"
shot "homepage-dark"
agent-browser reload >/dev/null 2>&1
# The inline pre-paint script applies the stored class before first paint, but the
# toggle itself only exists once React has rendered. Poll for it instead of
# sampling a fixed delay, so a slow reload cannot look like a lost preference.
poll_js "!!document.querySelector('[data-theme-preference]')" "true" >/dev/null
chk "dark preference persists across reload" "dark" "$(js "document.documentElement.classList.contains('dark') ? 'dark' : 'light'")"
chk "the reloaded page still knows the stored preference" "dark" \
  "$(js "document.querySelector('[data-theme-preference]').getAttribute('data-theme-preference')")"
agent-browser click '[data-theme-preference]' >/dev/null 2>&1
chk "dark -> system" "system" "$(js "document.querySelector('[data-theme-preference]').getAttribute('data-theme-preference')")"

# --- collection route -------------------------------------------------------
echo
echo "Collection route (PROD-03, PRD §82)"
goto_collection bulk
chk "direct deep-link renders posts" "true" "$(js "document.querySelectorAll('[data-testid=\"post-card\"]').length == 30")"
chk "toolbar present" "true" "$(js "!!document.querySelector('[data-testid=\"collection-toolbar\"]')")"
shot "collection-route"

agent-browser set viewport 1440 1100 >/dev/null 2>&1
agent-browser wait 500 >/dev/null 2>&1
chk "masonry reports 4 columns at 1440px" "4" "$(poll_js "$(cols_expr)" 4)"

# --- media rendering --------------------------------------------------------
echo
echo "Media rendering (a broken CDN must not collapse the layout)"
chk "images use the stored CDN URL" "true" \
  "$(js "[...document.querySelectorAll('img')].some(i => (i.getAttribute('src')||'').includes('pbs.twimg.com'))")"
chk "images decoded" "true" "$(js "[...document.querySelectorAll('img')].some(i => i.naturalWidth > 0)")"
chk "no image fell back to the error placeholder" "0" "$(count '[data-testid="media-placeholder"]')"
shot "collection-media-rendered"

# --- the stored handle keeps one sigil --------------------------------------
echo
echo "Stored handle (real CSV shape)"
chk "no doubled sigil anywhere on the page" "false" "$(js "document.body.innerText.includes('@@')")"
handle=$(js "[...document.querySelectorAll('[data-testid=\"post-card\"] p')].map(p=>p.textContent).find(t=>t.startsWith('@'))")
if printf '%s' "$handle" | grep -Eq '^@bulk[0-9]+$'; then pass "card shows one sigil for the stored handle ($handle)"; else fail "card shows one sigil for the stored handle" "got [$handle]"; fi

# --- search, sort, filter ---------------------------------------------------
echo
echo "Discovery (DISC-01/02/03/06)"
agent-browser fill '[data-testid="collection-search"]' "needle" >/dev/null 2>&1
agent-browser wait 900 >/dev/null 2>&1
chk "search narrows server-side" "14" "$(count '[data-testid="post-card"]')"
chk "search writes q= to the URL" "true" "$(js "location.search.includes('q=needle')")"
shot "collection-search"

agent-browser fill '[data-testid="collection-search"]' "" >/dev/null 2>&1
agent-browser wait 900 >/dev/null 2>&1
first_before=$(js "document.querySelector('[data-testid=\"post-card\"] [data-testid=\"open-on-x\"]').getAttribute('href')")

# The sort control is a Radix listbox, so `agent-browser select` (which needs a
# native <select>) no longer applies. Drive it the way a user does, and assert
# while it is open that the popup is the theme's own surface: a native select
# opens an OS-drawn list that ignores the palette, which is the whole reason the
# primitive replaced it.
agent-browser click '[data-testid="collection-sort"]' >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
chk "the sort control is not a native select" "true" \
  "$(js "!document.querySelector('select[data-testid=\"collection-sort\"]')")"
chk "the sort control opens a themed menu" "true" \
  "$(js "!!document.querySelector('[data-slot=\"dropdown-menu-content\"]')")"
chk "the open menu paints the theme's surface (not an OS-drawn popup)" "true" \
  "$(js "(() => { const c = document.querySelector('[data-slot=\"dropdown-menu-content\"]'); if (!c) return false; const p = document.createElement('div'); p.style.backgroundColor = 'var(--surface)'; document.body.appendChild(p); const want = getComputedStyle(p).backgroundColor; p.remove(); return getComputedStyle(c).backgroundColor === want; })()")"
chk "the menu offers all four sort modes as radio items" "4" \
  "$(js "document.querySelectorAll('[data-slot=\"dropdown-menu-content\"] [role=\"menuitemradio\"]').length")"
chk "exactly one sort mode is marked as checked" "1" \
  "$(js "document.querySelectorAll('[data-slot=\"dropdown-menu-content\"] [role=\"menuitemradio\"][aria-checked=\"true\"]').length")"
chk "the menu control is labelled and expanded" "true" \
  "$(js "(() => { const t = document.querySelector('[data-testid=\"collection-sort\"]'); return t.getAttribute('aria-label') === 'Sort' && t.getAttribute('aria-haspopup') === 'menu' && t.getAttribute('aria-expanded') === 'true'; })()")"
shot "collection-sort-open"
# The open state must be audited, not just the closed one. Radix's Select — the
# obvious primitive here — marks everything outside itself aria-hidden via
# hideOthers() and offers no `modal` prop to disable it, which axe reports as
# serious `aria-hidden-focus` with the sort list open. This check is what keeps
# that from being reintroduced; `ui/dropdown-menu.tsx` passes `modal={false}`
# precisely so it does not happen.
axe_check "collection sort menu open"

# Clicked by selector, not by text: `find … click` drives a Radix *button* (the
# filter presets use it), but a Radix menu item only commits when the pointer
# sequence starts on the item itself, and the selector path is the one already
# proven against the kebab menu's items.
agent-browser click '[data-testid="collection-sort-option"][data-value="tweet_asc"]' >/dev/null 2>&1
agent-browser wait 900 >/dev/null 2>&1
chk "choosing an item closes the menu" "true" \
  "$(js "!document.querySelector('[data-slot=\"dropdown-menu-content\"]')")"
chk "sort writes sort= to the URL" "true" "$(js "location.search.includes('sort=tweet_asc')")"
ne "sort reorders the first card" "$first_before" \
  "$(js "document.querySelector('[data-testid=\"post-card\"] [data-testid=\"open-on-x\"]').getAttribute('href')")"

agent-browser click '[data-testid="collection-filter"]' >/dev/null 2>&1
agent-browser wait 500 >/dev/null 2>&1
chk "filter opens a popover on desktop" "true" "$(js "!!document.querySelector('[data-testid=\"filter-popover\"]')")"
shot "filter-popover"
agent-browser find text "Last 7 Days" click >/dev/null 2>&1 || agent-browser find text "7 days" click >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
agent-browser click '[data-testid="filter-apply"]' >/dev/null 2>&1
agent-browser wait 900 >/dev/null 2>&1
chk "applied filter writes a date range to the URL" "true" \
  "$(js "location.search.includes('saved_from') && location.search.includes('saved_to')")"
agent-browser click '[data-testid="filter-reset"]' >/dev/null 2>&1
agent-browser wait 700 >/dev/null 2>&1 || true

# --- infinite scroll --------------------------------------------------------
echo
echo "Infinite scroll (SCROLL-01..05)"
goto_collection bulk
chk "first page is capped at the page limit" "30" "$(count '[data-testid="post-card"]')"
agent-browser scroll down 4000 >/dev/null 2>&1
agent-browser wait 1500 >/dev/null 2>&1
chk "scrolling the sentinel appends the next page" "60" "$(count '[data-testid="post-card"]')"
shot "infinite-scroll"

# --- lightbox ---------------------------------------------------------------
echo
echo "Lightbox (LIGHT-01..06)"
# Open a tweet that owns more than one image, so the media-arrow checks below
# have somewhere to step to. bulk cycles 1..3 media per row, so the
# `data-media-count="3"` card is deterministic.
LT_SEL='[data-testid="post-card"][data-media-count="3"] [data-testid="post-media-trigger"]'
# Identity of the open tweet, for the post-navigation checks below.
lt_href() { js "document.querySelector('[data-testid=\"lightbox-open-on-x\"]').getAttribute('href')"; }
agent-browser scrollintoview "$LT_SEL" >/dev/null 2>&1
# §82.21 needs the card's own tweet URL to compare against; capture it before
# the click, from the article that owns the media tile.
agent-browser eval "window.__twbmClickedUrl = (() => { const t = document.querySelector('[data-testid=\"post-card\"][data-media-count=\"3\"] [data-testid=\"post-media-trigger\"]'); const card = t && t.closest('article'); const link = card && card.querySelector('[data-testid=\"open-on-x\"]'); return link ? link.getAttribute('href') : ''; })()" >/dev/null 2>&1
card_media=$(js "(() => { const t = document.querySelector('[data-testid=\"post-card\"][data-media-count=\"3\"] [data-testid=\"post-media-trigger\"]'); const c = t && t.closest('article'); return c ? c.getAttribute('data-media-count') : ''; })()")
agent-browser click "$LT_SEL" >/dev/null 2>&1
agent-browser wait 700 >/dev/null 2>&1
chk "dialog opens" "true" "$(js "!!document.querySelector('[data-testid=\"media-lightbox\"]')")"
# PRD §82 integration scenario, browser steps 16-21 (HARD-05).
chk "§82.16 clicking an image opened the lightbox" "true" "$(js "!!document.querySelector('[data-testid=\"media-lightbox\"]')")"
chk "§82.17 the lightbox shows the clicked tweet's media" "true" \
  "$(js "(() => { const i = document.querySelector('[data-testid=\"lightbox-media-area\"] img'); return !!i && i.getAttribute('src').includes('pbs.twimg.com'); })()")"
# The indicator is dots counted over the *open tweet*, not the loaded archive.
# `data-media-total` must equal the tweet's own media count, and there must be
# exactly that many dots — the old text counter reported the position in the
# flattened sequence of every loaded media, which read as "1 / 39" for a tweet
# with one image.
lt_total=$(js "document.querySelector('[data-testid=\"lightbox-counter\"]').getAttribute('data-media-total')")
lt_dots=$(js "document.querySelectorAll('[data-testid=\"lightbox-counter\"] > span[aria-hidden=\"true\"]').length")
if [ -n "$card_media" ] && [ "$lt_total" = "$card_media" ]; then
  pass "the dot indicator counts this tweet's media ($lt_total)"
else
  fail "the dot indicator counts this tweet's media" "card=$card_media indicator=$lt_total"
fi
chk "one dot per media in the tweet" "$card_media" "$lt_dots"
chk "the indicator keeps the exact position for assistive tech" "true" \
  "$(js "(() => { const c = document.querySelector('[data-testid=\"lightbox-counter\"]'); return /^Media [0-9]+ of [0-9]+$/.test(c.getAttribute('aria-label') || ''); })()")"
chk "the two navigation axes have four distinct accessible names" "true" \
  "$(js "(() => { const names = [...document.querySelectorAll('[data-testid=\"media-lightbox\"] button')].map((b) => b.getAttribute('aria-label')); return ['Previous media','Next media','Previous post','Next post'].every((n) => names.includes(n)); })()")"
# Geometry, not DOM containment: the post buttons are siblings of the media area
# by construction, so `area.contains(button)` is false no matter where they are
# actually painted — an assertion that passed while the post button sat exactly
# on top of the media arrow and hid it. What matters is that the two pairs do not
# overlap and that at 1440px the post pair is clear of the media area.
chk "the two arrow pairs do not overlap" "true" \
  "$(js "(() => { const r = (s) => document.querySelector(s).getBoundingClientRect(); const ov = (a,b) => a.left < b.right && b.left < a.right && a.top < b.bottom && b.top < a.bottom; return !ov(r('[data-testid=\"lightbox-next\"]'), r('[data-testid=\"lightbox-next-post\"]')) && !ov(r('[data-testid=\"lightbox-prev\"]'), r('[data-testid=\"lightbox-prev-post\"]')); })()")"
chk "the post controls sit outside the media area at 1440px" "true" \
  "$(js "(() => { const a = document.querySelector('[data-testid=\"lightbox-media-area\"]').getBoundingClientRect(); const p = document.querySelector('[data-testid=\"lightbox-prev-post\"]').getBoundingClientRect(); const n = document.querySelector('[data-testid=\"lightbox-next-post\"]').getBoundingClientRect(); return p.right <= a.left && n.left >= a.right && n.right <= window.innerWidth && p.left >= 0; })()")"
chk "lightbox shows the stored image, decoded" "true" \
  "$(js "(() => { const i = document.querySelector('[data-testid=\"lightbox-media-area\"] img'); return !!i && i.getAttribute('src').includes('pbs.twimg.com') && i.naturalWidth > 0; })()")"
chk "three meta lines present" "true" \
  "$(js "!!document.querySelector('[data-testid=\"lightbox-posted\"]') && !!document.querySelector('[data-testid=\"lightbox-saved\"]') && !!document.querySelector('[data-testid=\"lightbox-collection\"]')")"
chk "dialog has an accessible name from the author and handle" "true" \
  "$(js "(document.querySelector('[data-testid=\"media-lightbox\"]').getAttribute('aria-labelledby') ? document.getElementById(document.querySelector('[data-testid=\"media-lightbox\"]').getAttribute('aria-labelledby')).textContent : '').includes('@')")"
chk "Open on X is a safe new-tab link" "true" \
  "$(js "(() => { const a = document.querySelector('[data-testid=\"lightbox-open-on-x\"]'); return a && a.getAttribute('target') === '_blank' && /noopener/.test(a.getAttribute('rel')) && /noreferrer/.test(a.getAttribute('rel')); })()")"
chk "§82.20 Open on X points at the canonical x.com status URL" "true" \
  "$(js "(() => { const a = document.querySelector('[data-testid=\"lightbox-open-on-x\"]'); const href = a && a.getAttribute('href'); return typeof href === 'string' && /^https:\\/\\/x\\.com\\/[^/]+\\/status\\/[0-9]+$/.test(href); })()")"
chk "§82.21 Open on X targets the same tweet the card linked to" "true" \
  "$(js "(() => { const a = document.querySelector('[data-testid=\"lightbox-open-on-x\"]'); const href = a && a.getAttribute('href'); return !!window.__twbmClickedUrl && href === window.__twbmClickedUrl; })()")"
shot "lightbox-open"

# §82.18/§82.19: Right Arrow advances the media *inside this tweet*, Left Arrow
# returns. The media axis is clamped inside the tweet, so this is a statement
# about the tweet's own images, not about walking into the next tweet.
lt_media0=$(js "document.querySelector('[data-testid=\"lightbox-counter\"]').getAttribute('data-media-index')")
agent-browser press ArrowRight >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
ne "§82.18 ArrowRight shows the next media" "$lt_media0" "$(js "document.querySelector('[data-testid=\"lightbox-counter\"]').getAttribute('data-media-index')")"
agent-browser press ArrowLeft >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
chk "§82.19 ArrowLeft returns to the first media" "$lt_media0" "$(js "document.querySelector('[data-testid=\"lightbox-counter\"]').getAttribute('data-media-index')")"

# The post axis is the other pair: ArrowDown leaves this tweet for the next one
# that has media, and lands on its first image. Identity is taken from the tweet
# URL rather than the author name — bulk reuses `Bulk Author {i % 7}`, so two
# consecutive posts can share an author and the check would pass vacuously.
lt_post0=$(lt_href)
agent-browser press ArrowDown >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
ne "ArrowDown moves to the next post" "$lt_post0" "$(lt_href)"
chk "the next post opens on its first media" "0" \
  "$(js "document.querySelector('[data-testid=\"lightbox-counter\"]').getAttribute('data-media-index')")"
agent-browser press ArrowUp >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
chk "ArrowUp returns to the previous post" "$lt_post0" "$(lt_href)"

agent-browser press Escape >/dev/null 2>&1
agent-browser wait 500 >/dev/null 2>&1
chk "Escape closes the dialog" "true" "$(js "!document.querySelector('[data-testid=\"media-lightbox\"]')")"
chk "focus is restored to the originating tile" "post-media-trigger" \
  "$(js "document.activeElement.getAttribute('data-testid')")"

# --- states -----------------------------------------------------------------
echo
echo "States (PRD §31/§33)"
goto_collection design
chk "empty collection shows its own state" "true" "$(js "!!document.querySelector('[data-testid=\"collection-empty-state\"]')")"
shot "collection-empty"
open_url "$BASE/definitely/not/a/route"
agent-browser wait 900 >/dev/null 2>&1
chk "unknown client route renders the app (SPA fallback)" "true" \
  "$(js "!!document.querySelector('[data-testid=\"gallery-hero\"]') || document.body.innerText.length > 0")"

# --- live write + window-focus refetch (HARD-06, PRD §80.22/§82.22-24) ------
echo
echo "Live write + window focus (HARD-06, PRD §80.22/§82.22-24)"
goto_collection design
chk "§82.22 design is empty before the append" "0" "$(count '[data-testid="post-card"]')"
# §82.22: a new row is written to the live database, exactly as the extension would.
dbq "INSERT INTO bookmarks(tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
     VALUES('4000000000000000001',
            (SELECT id FROM collections WHERE slug = 'design'),
            'https://x.com/freshapp/status/4000000000000000001',
            'Fresh App', '@freshapp', '2026-09-26T00:00:00Z', '2026-09-27T12:00:00Z',
            'appended while the server was running', '[]');"
chk "the new row is not shown before anything asks for it" "0" "$(count '[data-testid="post-card"]')"
# §82.23: the user returns to the gallery / the window regains focus.
js "window.dispatchEvent(new Event('focus'))" >/dev/null 2>&1
chk "§82.24 the appended row appears after window focus, without a restart" "1" "$(poll_count '[data-testid="post-card"]' 1)"
chk "§82.24 the fresh card is the appended tweet" "true" \
  "$(js "[...document.querySelectorAll('[data-testid=\"post-card\"]')].some((c) => c.textContent.includes('Fresh App'))")"
shot "live-write-focus-refetch"

# --- responsive -------------------------------------------------------------
echo
echo "Responsive (HARD-03)"
goto_collection bulk
cols() { agent-browser set viewport "$1" "$2" >/dev/null 2>&1; agent-browser wait 400 >/dev/null 2>&1; poll_js "$(cols_expr)" "$3"; }
d=$(cols 1440 1100 4); shot "responsive-desktop"
t768=$(cols 768 1100 2); shot "responsive-tablet-768"
t=$(cols 900 1100 2); shot "responsive-tablet"
m=$(cols 390 900 1); shot "responsive-mobile"
chk "desktop 1440px → 4 columns" "4" "$d"
chk "tablet 768px → 2 columns" "2" "$t768"
chk "tablet 900px → 2 columns" "2" "$t"
chk "mobile 390px → 1 column" "1" "$m"

# HARD-03 wordmark defect: at 390px the `truncate` span rendered `Tw…`. The fix
# hides it (keeping the logo) instead of truncating mid-word.
chk "wordmark is hidden at 390px" "none" \
  "$(js "getComputedStyle(document.querySelector('[data-testid=\"app-wordmark\"]')).display")"
chk "no truncated wordmark text is visible at 390px" "false" \
  "$(js "document.body.innerText.includes('Tw…')")"
chk "brand link keeps an accessible name at 390px" "Twitter Bookmarker" \
  "$(js "document.querySelector('header a[aria-label]').getAttribute('aria-label')")"
chk "the logo is still rendered at 390px" "true" \
  "$(js "!!document.querySelector('header a[aria-label] svg')")"

agent-browser click '[data-testid="collection-filter"]' >/dev/null 2>&1
agent-browser wait 600 >/dev/null 2>&1
chk "filter becomes a Sheet at 390px" "true" "$(js "!!document.querySelector('[data-testid=\"filter-sheet\"]')")"
chk "desktop popover is not used at 390px" "false" "$(js "!!document.querySelector('[data-testid=\"filter-popover\"]')")"
shot "filter-sheet"
agent-browser press Escape >/dev/null 2>&1
agent-browser wait 300 >/dev/null 2>&1

# Back to desktop: the same control is a Popover and the wordmark returns.
d2=$(cols 1440 1100 4)
chk "back to 4 columns at 1440px" "4" "$d2"
chk "wordmark is visible at 1440px" "true" \
  "$(js "getComputedStyle(document.querySelector('[data-testid=\"app-wordmark\"]')).display !== 'none'")"
chk "wordmark is not truncated at 1440px" "true" \
  "$(js "(() => { const el = document.querySelector('[data-testid=\"app-wordmark\"]'); return el.scrollWidth <= el.clientWidth + 1; })()")"
agent-browser click '[data-testid="collection-filter"]' >/dev/null 2>&1
agent-browser wait 600 >/dev/null 2>&1
chk "filter becomes a Popover at 1440px" "true" "$(js "!!document.querySelector('[data-testid=\"filter-popover\"]')")"
chk "mobile Sheet is not used at 1440px" "false" "$(js "!!document.querySelector('[data-testid=\"filter-sheet\"]')")"
agent-browser press Escape >/dev/null 2>&1
agent-browser wait 300 >/dev/null 2>&1

# --- theming: the scrollbar belongs to the palette ---------------------------
echo
echo "Scrollbars (themed, not OS chrome)"
# Two independent claims, because either alone can pass while the other is
# broken: the standard properties (what Firefox and Chrome 121+ actually honour)
# must be declared with a token colour, and the WebKit pseudo-elements must
# exist for the engines that still need them. Asserted through the CSSOM rather
# than by reading a rendered pixel, since headless Chrome does not always paint
# a classic scrollbar.
#
# `css_has` descends into nested rule lists. That matters: these rules live in
# `@layer base`, and a CSSLayerBlockRule's own `selectorText` is empty while its
# `cssText` serialises the whole child block — so a one-level `cssRules` scan
# finds the *declarations* (inside the layer's cssText) but never the *selectors*.
# The first version of this check passed the two declaration assertions and
# failed the two selector ones for exactly that reason, which looked like the
# stylesheet had dropped the rules when it had not.
css_has() {
  js "(() => { const out = []; const walk = (rules) => { for (const r of rules) { out.push(r); if (r.cssRules) walk(r.cssRules); } }; for (const sheet of document.styleSheets) { try { walk(sheet.cssRules) } catch (e) {} } return out.some(r => $1); })()"
}
chk "scrollbar-width is declared thin" "true" \
  "$(css_has "/scrollbar-width:\s*thin/.test(r.cssText || '')")"
chk "scrollbar-color uses the theme tokens" "true" \
  "$(css_has "/scrollbar-color:\s*var\(--border\)/.test(r.cssText || '')")"
chk "the WebKit thumb is themed and rounded, not a default grey bar" "true" \
  "$(css_has "(r.selectorText || '').includes('::-webkit-scrollbar-thumb') && /background-color:\s*var\(--border\)/.test(r.cssText || '') && /border-radius:\s*var\(--r-pill\)/.test(r.cssText || '')")"
chk "the WebKit track is styled too (not left transparent-white)" "true" \
  "$(css_has "(r.selectorText || '').includes('::-webkit-scrollbar-track')")"
chk "the resolved computed scrollbar-width reaches the page" "thin" \
  "$(js "getComputedStyle(document.documentElement).scrollbarWidth || 'UNSET'")"

# --- HARD-04 accessibility: axe-core on every surface, both themes ------------
echo
echo "Accessibility audit — axe-core serious/critical (HARD-04, PRD §67)"
agent-browser set media light >/dev/null 2>&1
agent-browser set viewport 390 900 >/dev/null 2>&1
open_url "$BASE/"
agent-browser wait 1200 >/dev/null 2>&1
axe_check "homepage, light, 390px"
agent-browser set viewport 1440 1100 >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
axe_check "homepage, light, 1440px"
agent-browser set media dark >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
axe_check "homepage, dark, 1440px"

goto_collection bulk
axe_check "collection page, dark, 1440px"
agent-browser set media light >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
axe_check "collection page, light, 1440px"
# The desktop Filter control is a Radix Popover with role=dialog: audit it open
# and with an active preset, because the open popover is a distinct surface and
# the active pill is a distinct state.
agent-browser click '[data-testid="collection-filter"]' >/dev/null 2>&1
agent-browser wait 600 >/dev/null 2>&1
agent-browser find text "Last 7 Days" click >/dev/null 2>&1 || agent-browser find text "7 days" click >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
axe_check "open desktop filter popover with an active preset, light, 1440px"
agent-browser set media dark >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
axe_check "open desktop filter popover with an active preset, dark, 1440px"
agent-browser press Escape >/dev/null 2>&1
agent-browser wait 300 >/dev/null 2>&1
agent-browser set media light >/dev/null 2>&1

agent-browser scrollintoview '[data-testid="post-media-trigger"]' >/dev/null 2>&1
agent-browser click '[data-testid="post-media-trigger"]' >/dev/null 2>&1
agent-browser wait 700 >/dev/null 2>&1
axe_check "open lightbox, light, 1440px"
agent-browser set media dark >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
axe_check "open lightbox, dark, 1440px"
agent-browser press Escape >/dev/null 2>&1
agent-browser wait 300 >/dev/null 2>&1
agent-browser set media light >/dev/null 2>&1

# Mobile filter Sheet (the narrow-viewport surface), both themes.
agent-browser set viewport 390 900 >/dev/null 2>&1
agent-browser wait 600 >/dev/null 2>&1
agent-browser click '[data-testid="collection-filter"]' >/dev/null 2>&1
agent-browser wait 700 >/dev/null 2>&1
axe_check "open mobile filter Sheet, light, 390px"
agent-browser set media dark >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
axe_check "open mobile filter Sheet, dark, 390px"
agent-browser press Escape >/dev/null 2>&1
agent-browser wait 300 >/dev/null 2>&1
agent-browser set media light >/dev/null 2>&1
agent-browser set viewport 1440 1100 >/dev/null 2>&1

# --- HARD-04 accessibility: keyboard, focus, alt, dialog semantics -----------
echo
echo "Keyboard, focus and dialog semantics (HARD-04, PRD §67)"
goto_collection bulk
# Keyboard reachability: Tab from the top of the document. Chrome matches
# :focus-visible for every Tab-driven focus, so each stop must also paint a ring.
agent-browser press Tab >/dev/null 2>&1
chk "first Tab stop is the brand link" "Twitter Bookmarker" \
  "$(js "document.activeElement && document.activeElement.textContent.trim()")"
chk "brand link shows a visible focus ring" "visible" "$(focus_ring)"

seen=""
ring_bad=""
for _ in $(seq 1 24); do
  agent-browser press Tab >/dev/null 2>&1
  # shadcn Buttons use `transition-all`, so `box-shadow` is still interpolating
  # immediately after focus. Let the 150ms transition settle before sampling.
  sleep 0.25
  tid=$(active_testid)
  ring=$(focus_ring)
  seen="$seen $tid"
  [ "$ring" = "visible" ] || ring_bad="$ring_bad $tid($ring)"
done
for want in collection-search collection-filter collection-sort post-actions-trigger post-media-trigger open-on-x; do
  if printf '%s' " $seen " | grep -q " $want "; then
    pass "keyboard reaches $want"
  else
    fail "keyboard reaches $want" "not in the 24 Tab stops:$seen"
  fi
done
if [ -z "$ring_bad" ]; then pass "every Tab stop paints a visible focus ring"; else fail "every Tab stop paints a visible focus ring" "no ring on:$ring_bad"; fi

# Media alt/name must be derived from the author/tweet context, not the URL.
chk "media tiles carry an author-derived accessible name" "true" \
  "$(js "(() => { const b = document.querySelector('[data-testid=\"post-media-trigger\"]'); const l = b && b.getAttribute('aria-label'); return !!l && /^Media( [0-9]+ of [0-9]+)? from @/.test(l); })()")"

# Dialog semantics: opening the lightbox moves focus in, Tab is trapped, arrows
# navigate, Escape closes and restores focus.
agent-browser scrollintoview "$LT_SEL" >/dev/null 2>&1
agent-browser click "$LT_SEL" >/dev/null 2>&1
agent-browser wait 700 >/dev/null 2>&1
chk "opening the dialog moves focus inside it" "true" \
  "$(js "document.querySelector('[data-testid=\"media-lightbox\"]').contains(document.activeElement)")"
chk "dialog image alt is author/handle-derived (not the URL)" "true" \
  "$(js "(() => { const i = document.querySelector('[data-testid=\"lightbox-media-area\"] img'); const alt = i && i.getAttribute('alt'); return !!alt && /from @/.test(alt) && !/^https?:/.test(alt); })()")"
trap_ok=true
for _ in $(seq 1 12); do
  agent-browser press Tab >/dev/null 2>&1
  inside=$(js "document.querySelector('[data-testid=\"media-lightbox\"]').contains(document.activeElement)")
  [ "$inside" = "true" ] || trap_ok=false
done
chk "Tab is trapped inside the open dialog" "true" "$trap_ok"
c1=$(js "document.querySelector('[data-testid=\"lightbox-counter\"]').getAttribute('data-media-index')")
agent-browser press ArrowRight >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
ne "ArrowRight navigates media inside the dialog" "$c1" "$(js "document.querySelector('[data-testid=\"lightbox-counter\"]').getAttribute('data-media-index')")"
agent-browser press Escape >/dev/null 2>&1
agent-browser wait 500 >/dev/null 2>&1
chk "Escape closes the dialog and restores focus" "true" \
  "$(js "!document.querySelector('[data-testid=\"media-lightbox\"]') && document.activeElement.getAttribute('data-testid') === 'post-media-trigger'")"

# --- curation: the per-post menu, delete and move ---------------------------
# The four behaviours this section locks down, named so the checks, the unit
# tests and docs/MANUAL-TEST-CHECKLIST.md can refer to them without restating
# them. They are labels for this gate, not requirements in an archived
# milestone (scripts/check-requirement-traceability.sh reads only the archive).
#
#   CUR-01  a removal is local: the card and the header counts update in place
#           and nothing is refetched, so scroll position and loaded pages stay
#   CUR-02  the kebab is reachable — revealed on hover *and* on keyboard focus —
#           and opens a menu of exactly two labelled items, including from
#           inside the lightbox, where it must not escape the dialog's trap
#   CUR-03  delete is confirmed and cancellable, is locked while in flight, and
#           is soft: the row moves to deleted_bookmarks with its payload intact
#   CUR-04  a move targets an *existing* folder only, and any failure changes
#           nothing on screen and says so
echo
echo "Curation — per-post menu, delete and move (CUR-01…CUR-04)"
goto_collection bulk

KEG='[data-testid="post-actions-trigger"]'
MENU='[data-testid="post-actions-menu"]'
CONFIRM='[data-testid="confirm-dialog"]'
PICKER='[data-testid="move-post-dialog"]'

chk "every card offers the per-post menu" "$(count '[data-testid="post-card"]')" "$(count "$KEG")"

# The reveal has two triggers, and both matter. Pointer hover is what was asked
# for, but it is wrapped in `@media (hover:hover)` by the Tailwind build, so on a
# touch or headless device it is deliberately inert — and a hover-only control is
# unreachable without a pointer anyway. So the pointer half is asserted against
# the delivered CSS, and the focus half is exercised for real.
chk "the menu trigger is hidden while its card is idle" "0" \
  "$(js "getComputedStyle(document.querySelector('$KEG').parentElement).opacity")"
chk "hovering a card is wired to reveal its menu trigger" "true" \
  "$(js "(()=>{const all=Array.from(document.styleSheets).map(s=>{try{return Array.from(s.cssRules).map(r=>r.cssText||'').join('')}catch(e){return ''}}).join('');return /group-hover.:opacity-100[^}]*opacity:\s*1/.test(all)})()")"
agent-browser focus "$KEG" >/dev/null 2>&1
sleep 0.5
chk "focusing the trigger reveals it (a pointer-only reveal is unusable)" "1" \
  "$(js "getComputedStyle(document.querySelector('$KEG').parentElement).opacity")"

agent-browser click "$KEG" >/dev/null 2>&1
agent-browser wait 500 >/dev/null 2>&1
chk "the menu offers exactly two actions" "2" "$(count "$MENU [role=\"menuitem\"]")"
chk "the menu names the move action" "Move to folder" \
  "$(js "document.querySelector('[data-testid=\"post-action-move\"]').textContent.trim()")"
chk "the menu names the delete action" "Delete bookmark" \
  "$(js "document.querySelector('[data-testid=\"post-action-delete\"]').textContent.trim()")"
shot "curation-menu"
axe_check "open card overflow menu, light, 1440px"
agent-browser set media dark >/dev/null 2>&1
agent-browser wait 300 >/dev/null 2>&1
axe_check "open card overflow menu, dark, 1440px"
agent-browser set media light >/dev/null 2>&1
agent-browser press Escape >/dev/null 2>&1
agent-browser wait 300 >/dev/null 2>&1

# Delete asks first, and cancelling must not touch the database.
target="$(js "(document.querySelector('[data-testid=\"open-on-x\"]').getAttribute('href')||'').split('/status/')[1]")"
[ -n "$target" ] || fail "the first card exposes its tweet id" "no /status/ id in the first card"
cards_before="$(count '[data-testid="post-card"]')"
counts_before="$(js "document.querySelector('[data-testid=\"collection-counts\"]').textContent.trim()")"
trash_before="$(dbq "SELECT COUNT(*) FROM deleted_bookmarks;")"
live_before="$(dbq "SELECT COUNT(*) FROM bookmarks;")"

agent-browser click "$KEG" >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
agent-browser click '[data-testid="post-action-delete"]' >/dev/null 2>&1
agent-browser wait 500 >/dev/null 2>&1
chk "deleting asks for confirmation first" "Delete this bookmark?" \
  "$(js "document.querySelector('$CONFIRM [data-slot=\"dialog-title\"]').textContent.trim()")"
chk "the confirmation says the bookmark is recoverable" "true" \
  "$(js "/kept|restore|recover/i.test(document.querySelector('$CONFIRM [data-slot=\"dialog-description\"]').textContent)")"
shot "curation-delete-confirm"
axe_check "open delete confirmation, light, 1440px"
agent-browser set media dark >/dev/null 2>&1
agent-browser wait 300 >/dev/null 2>&1
axe_check "open delete confirmation, dark, 1440px"
agent-browser set media light >/dev/null 2>&1

agent-browser click '[data-testid="confirm-dialog-cancel"]' >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
chk "cancelling closes the confirmation" "0" "$(count "$CONFIRM")"
chk "cancelling writes nothing" "$trash_before" "$(dbq "SELECT COUNT(*) FROM deleted_bookmarks;")"
chk "cancelling keeps the card" "$cards_before" "$(count '[data-testid="post-card"]')"

# Confirm: the row moves to the trash table and leaves the grid.
agent-browser click "$KEG" >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
agent-browser click '[data-testid="post-action-delete"]' >/dev/null 2>&1
agent-browser wait 500 >/dev/null 2>&1
agent-browser click '[data-testid="confirm-dialog-confirm"]' >/dev/null 2>&1
agent-browser wait 900 >/dev/null 2>&1
chk "the confirmation closes once the delete lands" "0" "$(count "$CONFIRM")"
chk "the deleted card leaves the grid" "$((cards_before - 1))" "$(count '[data-testid="post-card"]')"
ne "the header counts drop with it" "$counts_before" \
  "$(js "document.querySelector('[data-testid=\"collection-counts\"]').textContent.trim()")"
chk "the row is soft-deleted, not destroyed" "1" \
  "$(dbq "SELECT COUNT(*) FROM deleted_bookmarks WHERE tweet_id='$target';")"
chk "the row is gone from the live set" "0" \
  "$(dbq "SELECT COUNT(*) FROM bookmarks WHERE tweet_id='$target';")"
chk "the trashed row kept its whole payload" "1" \
  "$(dbq "SELECT COUNT(*) FROM deleted_bookmarks WHERE tweet_id='$target' AND url<>'' AND author<>'' AND username<>'' AND tweet_date<>'' AND saved_at<>'' AND media<>'' AND deleted_at<>'';")"
chk "one row moved from live to trash, net" "$((live_before - 1))" "$(dbq "SELECT COUNT(*) FROM bookmarks;")"

# Move: the picker lists the other folders (never the current one) and changes
# the row's collection.
# Index 0 on purpose: the loop below clicks the *first* card's kebab, so the id
# and the menu must come from the same card. (A previous card was deleted above,
# so "index 0" is not the card that was deleted.)
mv_target="$(js "(()=>{const c=document.querySelectorAll('[data-testid=\"post-card\"]')[0];const a=c&&c.querySelector('[data-testid=\"open-on-x\"]');return a?a.getAttribute('href').split('/status/')[1]:''})()")"
from_slug="$(dbq "SELECT c.slug FROM bookmarks b JOIN collections c ON c.id=b.collection_id WHERE b.tweet_id='$mv_target';")"
agent-browser hover '[data-testid="post-card"]' >/dev/null 2>&1
agent-browser click "$KEG" >/dev/null 2>&1
agent-browser wait 400 >/dev/null 2>&1
agent-browser click '[data-testid="post-action-move"]' >/dev/null 2>&1
agent-browser wait 700 >/dev/null 2>&1
chk "moving opens a folder picker" "1" "$(count "$PICKER")"
chk "the picker is titled for what it does" "Move to another folder" \
  "$(js "document.querySelector('$PICKER [data-slot=\"dialog-title\"]').textContent.trim()")"
chk "the picker excludes the folder the post is already in" "0" \
  "$(count "$PICKER [data-testid=\"move-post-option\"][data-slug=\"$from_slug\"]")"
chk "the picker lists at least one destination folder" "true" \
  "$(js "document.querySelectorAll('[data-testid=\"move-post-option\"]').length > 0")"
shot "curation-move-picker"
axe_check "open folder picker, light, 1440px"
agent-browser set media dark >/dev/null 2>&1
agent-browser wait 300 >/dev/null 2>&1
axe_check "open folder picker, dark, 1440px"
agent-browser set media light >/dev/null 2>&1

dest="$(js "document.querySelector('[data-testid=\"move-post-option\"]').getAttribute('data-slug')")"
agent-browser click '[data-testid="move-post-option"]' >/dev/null 2>&1
agent-browser wait 900 >/dev/null 2>&1
chk "the picker closes once the move lands" "0" "$(count "$PICKER")"
chk "the moved card leaves the folder it was in" "0" \
  "$(dbq "SELECT COUNT(*) FROM bookmarks b JOIN collections c ON c.id=b.collection_id WHERE b.tweet_id='$mv_target' AND c.slug='$from_slug';")"
chk "the row now belongs to the chosen folder" "$dest" \
  "$(dbq "SELECT c.slug FROM bookmarks b JOIN collections c ON c.id=b.collection_id WHERE b.tweet_id='$mv_target';")"
chk "moving never duplicates the row" "1" \
  "$(dbq "SELECT COUNT(*) FROM bookmarks WHERE tweet_id='$mv_target';")"

# The load-bearing portal rule: a menu opened from inside the lightbox must mount
# *inside* it, or it lands on document.body and Tab escapes the dialog.
agent-browser scrollintoview "$LT_SEL" >/dev/null 2>&1
agent-browser click "$LT_SEL" >/dev/null 2>&1
agent-browser wait 800 >/dev/null 2>&1
chk "the lightbox panel offers the per-post menu" "1" \
  "$(count '[data-testid="media-lightbox"] [data-testid="post-actions-trigger"]')"
agent-browser click '[data-testid="media-lightbox"] [data-testid="post-actions-trigger"]' >/dev/null 2>&1
agent-browser wait 600 >/dev/null 2>&1
chk "a menu opened from the lightbox mounts inside it" "true" \
  "$(js "document.querySelector('[data-testid=\"media-lightbox\"]').contains(document.querySelector('$MENU'))")"
chk "it is not on document.body instead" "false" \
  "$(js "document.body.contains(document.querySelector('$MENU')) && !document.querySelector('[data-testid=\"media-lightbox\"]').contains(document.querySelector('$MENU'))")"
menu_trap=true
for _ in $(seq 1 8); do
  agent-browser press Tab >/dev/null 2>&1
  inside=$(js "document.querySelector('[data-testid=\"media-lightbox\"]').contains(document.activeElement)")
  [ "$inside" = "true" ] || menu_trap=false
done
chk "Tab stays inside the lightbox while its menu is open" "true" "$menu_trap"
shot "curation-menu-in-lightbox"
axe_check "card menu opened from inside the lightbox, light, 1440px"

agent-browser click '[data-testid="post-action-delete"]' >/dev/null 2>&1
agent-browser wait 600 >/dev/null 2>&1
chk "the confirmation opened from the lightbox mounts inside it" "true" \
  "$(js "document.querySelector('[data-testid=\"media-lightbox\"]').contains(document.querySelector('$CONFIRM'))")"
axe_check "delete confirmation opened from inside the lightbox, light, 1440px"
shot "curation-delete-from-lightbox"

# Confirming from the lightbox removes the post, which closes the lightbox by
# construction (its position is derived from the loaded posts).
lb_target="$(js "(document.querySelector('[data-testid=\"lightbox-open-on-x\"]').getAttribute('href')||'').split('/status/')[1]")"
agent-browser click '[data-testid="confirm-dialog-confirm"]' >/dev/null 2>&1
agent-browser wait 1200 >/dev/null 2>&1
chk "the lightbox closes when its post is deleted" "0" "$(count '[data-testid="media-lightbox"]')"
chk "and that post is in the trash too" "1" \
  "$(dbq "SELECT COUNT(*) FROM deleted_bookmarks WHERE tweet_id='$lb_target';")"
chk "the page is still usable, not blanked" "true" \
  "$(js "document.querySelectorAll('[data-testid=\"post-card\"]').length > 0")"

# Recovery is a documented manual step, so prove the documented statement works.
recovered="$(dbq "INSERT INTO bookmarks (tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media) SELECT tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media FROM deleted_bookmarks WHERE tweet_id='$target'; SELECT changes();")"
chk "the documented restore recipe re-inserts the row" "1" "$recovered"
chk "and it is live again" "1" "$(dbq "SELECT COUNT(*) FROM bookmarks WHERE tweet_id='$target';")"
chk "the trash keeps its copy as the audit trail" "1" \
  "$(dbq "SELECT COUNT(*) FROM deleted_bookmarks WHERE tweet_id='$target';")"
agent-browser reload >/dev/null 2>&1
agent-browser wait 1200 >/dev/null 2>&1
chk "the restored post is back on the page" "true" \
  "$(js "!!Array.from(document.querySelectorAll('[data-testid=\"open-on-x\"]')).find(a=>a.getAttribute('href').endsWith('/status/$target'))")"

# --- console ----------------------------------------------------------------
echo
echo "Runtime health"
console_out="$(agent-browser console 2>/dev/null)"
errs=$(printf '%s' "$console_out" | grep -ciE '\b(error|uncaught|exception)\b' || true)
if [ "${errs:-0}" -eq 0 ]; then pass "no console errors"; else
  printf '%s\n' "$console_out" | grep -iE '\b(error|uncaught|exception)\b' | head -5
  fail "no console errors" "$errs console line(s) mention an error"
fi

# --- summary ----------------------------------------------------------------
echo
echo "=== browser acceptance: $PASS passed, $FAIL failed ==="
echo "screenshots: $OUT"
[ "$FAIL" -eq 0 ] || exit 1
