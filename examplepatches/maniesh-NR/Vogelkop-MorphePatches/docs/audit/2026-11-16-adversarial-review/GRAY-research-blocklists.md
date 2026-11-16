# GRAY — Blocklist updater research & live verification (v12 maintainer-direct fetching)

**Date of live checks:** 2026-11-15 (from HTTP `Date:` headers)
**Method:** plain `curl -sS -L --max-time 30` from this sandbox (Node.js/curl environment; no browser). Magic-byte check via `od -t x1 -N 2`. All evidence files in `/tmp/gray/` (scratch).
**Inputs:** `/home/z/my-project/patches/adblock/updater_map.json` (37 entries — `"id"` count confirmed = 37; **zero** `http://` entries — all TLS).

---

## 1. The uBlock model (short)

uBlock Origin's default lists are static files in the **uBlockOrigin/uAssets** GitHub repo (`filters/*.txt`), fetched as raw.githubusercontent.com URLs. Live-checked with curl today:

| URL | Status | Size | First lines |
|---|---|---|---|
| `https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt` | 200 | 469,901 | `! Title: uBlock filters` / `! Expires: 5 days` |
| `https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt` | 200 | 185,907 | `! Title: uBlock filters – Privacy` |
| `https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt` | 200 | 274,481 | `! Title: uBlock₀ filters – Badware risks` |
| `https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/quick-fixes.txt` | 200 | 86,333 | `! Title: uBlock₀ filters – Quick fixes` / `! Expires: 8 hours` |
| `.../filters/full.txt` | **404** | — | does not exist |
| `.../filters/ads.txt` | **404** | — | does not exist |

⚠️ Naming note: the actual canonical set is **filters.txt / privacy.txt / badware.txt / quick-fixes.txt**. Files named `full.txt` / `ads.txt` (mentioned in the task briefing) do **not** exist in uAssets and return 404 — verified live above. The map's single `ublock` entry → `filters/filters.txt` is a real, live file. So the v12 model (fetch maintainer raw files directly) matches how uBO's bundled list URLs behave.

## 2. Live verification — 12 mapped URLs

Required inclusions all covered: EasyList, EasyPrivacy, one uAssets file, Fanboy cookiemonster, AdGuard Mobile, plus regionals from raw.githubusercontent.com and other hosts. `gzip/plain` from first 2 bytes: `1f 8b` = gzip, anything else = plain text.

| # | List (map id) | Mapped URL | Status | Final URL (redirect?) | Size (bytes) | gzip/plain | Verdict |
|---|---|---|---|---|---|---|---|
| 1 | easylist | `https://easylist.to/easylist/easylist.txt` | 200 | same (no redirect) | 2,069,962 | plain (`[Adblock Plus 2.0]`, `! Version: 202611151656`) | **correct** |
| 2 | easyprivacy | `https://easylist.to/easylist/easyprivacy.txt` | 200 | same | 1,517,129 | plain (`[Adblock Plus 1.1]`) | **correct** |
| 3 | ublock (uAssets) | `https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt` | 200 | same | 469,901 | plain (`! Title: uBlock filters`) | **correct** |
| 4 | fanboy-cookiemonster | `https://secure.fanboy.co.nz/fanboy-cookiemonster.txt` | 200 | same | 906,528 | plain (`[Adblock Plus 2.0]`, `! Title: Easylist Cookie List`) | **correct** |
| 5 | adguard_mobile_ads | `https://filters.adtidy.org/android/filters/11.txt` | 200 | same | 638,532 | plain (`! Title: AdGuard Mobile Ads filter`, Diff-Path patch header) | **correct** |
| 6 | regional_germany | `https://easylist-downloads.adblockplus.org/easylistgermany.txt` | 200 | same (Akamai) | 281,371 | plain (`[Adblock Plus 1.1]`, `! Version: 202611151651`) | **correct** |
| 7 | regional_hungary | `https://raw.githubusercontent.com/hufilter/hufilter/master/sections/ads.txt` | 200 | same | 54,117 | plain (`!` comment header, cross-blocker compatible) | **correct** |
| 8 | regional_poland | `https://raw.githubusercontent.com/MajkiIT/polish-ads-filter/master/polish-adblock-filters/adblock.txt` | 200 | same | 344,994 | plain (`[Adblock Plus 3.13]`) | **correct** |
| 9 | regional_vietnam | `https://raw.githubusercontent.com/abpvn/abpvn/master/filter/abpvn.txt` | 200 | same | 46,234 | plain (`[Adblock Plus 2.0]`, UUID header) | **correct** |
| 10 | regional_arabic | `https://raw.githubusercontent.com/easylist/listear/master/Liste_AR.txt` | 200 | same | 61,726 | plain (`[Adblock Plus 2.0]`) | **correct** |
| 11 | regional_estonia | `https://adblock.ee/list.php` | 200 (after **cross-host 301**) | `https://ubo-et.lepik.io/list.txt` | 15,487 | plain (`! Title: Eesti saitidele kohandatud filter…`, `! Homepage: https://github.com/sander85/uBO-et`) | **redirected-but-equivalent** → recommend **should-change** (see §5) |
| 12 | regional_norway | `https://raw.githubusercontent.com/DandelionSprout/adfilt/master/NorwegianList.txt` | 200 | same | 162,344 | plain (UTF-8 BOM `efbb`, `! Title: 🏔️ Dandelion Sprouts nordiske filtre…`) | **correct** |

**Score: 12/12 HTTP 200, 12/12 valid ABP filter syntax, 0 failures.**
**Redirects: 1/12 cross-host** (row 11: `adblock.ee/list.php` → HTTP 301 → `ubo-et.lepik.io/list.txt`, confirmed via `-D` header dump: `HTTP/2 301`, `location: https://ubo-et.lepik.io/list.txt`). All other 11 resolved with no redirect.
**gzip: 0/12.** Every maintainer payload in this sample is plain text (magic bytes: `2120` = `! `, `5b41` = `[A`, `210a` = `!\n`, `efbb` = UTF-8 BOM). None began `1f 8b`.

## 3. Fetch-risk notes (confirmed vs assumed)

**Confirmed live (headers captured in `/tmp/gray/hdr-*.txt`):**
- `raw.githubusercontent.com`: HTTP/2 200, `strict-transport-security: max-age=31536000` (TLS-only enforced), `cache-control: max-age=300` (5-minute CDN cache), `content-type: text/plain`, served via Fastly/varnish (`x-served-by: cache-hkg-…`, `via: 1.1 varnish`). No auth required, `access-control-allow-origin: *`.
- `easylist.to`: HTTP/2 200 behind **Cloudflare + varnish**, `cache-control: max-age=7200`, plain text.
- `filters.adtidy.org`: HTTP/1.1 200 behind **Qrator.CDN** with an S3-style backend (`x-amz-request-id`, `rg-cache-status`), plain text.
- `easylist-downloads.adblockplus.org`: behind Akamai (`.sig` probe → `Server: AkamaiNetStorage`).
- **No detached signatures:** `https://easylist-downloads.adblockplus.org/easylistgermany.sig` → **404**. No transport-level content authentication observed on any of the 16 payloads (the `! Checksum:` lines inside files are legacy ABP informational fields, not fetch-time auth).

**Confirmed from the map:** all 37 URLs are `https://` (no non-TLS entries).

**Unconfirmed / assumed (say so honestly):**
- raw.githubusercontent.com **rate limits for mobile-app traffic**: no rate-limit headers were returned during this session's 6 raw.gh fetches (all 200), and I could not access published docs (search engine returned a bot-challenge). Whether/how GitHub throttles an Android app IP hitting raw.githubusercontent every TTL cycle is **unconfirmed**. The 5-minute `max-age` cache and Fastly edge are the only hard data points.
- OkHttp redirect-following in the patched fetch path (relevant to row 11's 301): assumed default behavior (follows redirects); the patched code path was not re-read here.
- The 37 build-time "verified live" claims are consistent with this sample (12/12 fresh 200s today), but the other 25 URLs were not re-checked.

**The structural risk (patch design):** the checksum gate is disabled, so **any 2xx body is trusted** and stored under the manifest hash. Protection therefore reduces to: TLS + HSTS on the maintainers' hosts, plus the maintainers' own repo integrity (GitHub account security). No pinning is possible (hosts sit behind rotating Fastly/Cloudflare/Qrator/Akamai edges). Compromise or hostile takeover of any one repo → silent filter poisoning on next TTL refresh. This is the same trust model as uBO subscriptions; it is accepted, but worth stating in the report.

## 4. Opera CDN findings (`blocklists.operacdn.com`)

- **No public documentation found.** Web search via DuckDuckGo HTML endpoint returned a bot/anomaly challenge page (`duckduckgo.com/anomaly.js…`, HTTP 202) — no indexed docs obtained. Nothing public that I can cite; treat as undocumented beyond what probing shows.
- **Direct probe (confirmed):** `GET https://blocklists.operacdn.com/` → **HTTP 200, XML `ListBucketResult`** (bucket name `blocklists-prod`, keys = bare sha256 hex, `IsTruncated=true`, sample key `00233f48fd1ca46cd3bf9306a6d8484d5f62850d0c545a806388cbb2a150af12`, Size 56662). I.e. the CDN is an S3-compatible bucket with **public object listing left on**.
- **Content-addressing confirmed:** `GET …/426183deb25ca9d50a3fcb2c0daae9a16d108e97e3d80ba71db78ed1ff54a882` (EasyList's manifest hash from the map) → 200, first 2 bytes **`1f 8b` (gzip)**, and `sha256sum` of the body = `426183deb25c…1ff54a882` — **exactly the manifest hash**. A bogus hash → 404 `NoSuchKey`.
- Implication: CDN blobs are **gzipped bytes** and the key = sha256 of the gzip. Since every maintainer payload I fetched is plain text, the v12 gzip-normalizer is **mandatory**, not optional — without it no mapped fetch could ever pass even the old gate. Design assumption verified.

## 5. URL-change suggestions for `updater_map.json`

| Map id | Current URL | Suggested change | Evidence |
|---|---|---|---|
| `regional_estonia` | `https://adblock.ee/list.php` | **should-change → `https://raw.githubusercontent.com/sander85/uBO-et/master/list.txt`** | Live 301 cross-host redirect to `ubo-et.lepik.io`; the list's own header names `! Homepage: https://github.com/sander85/uBO-et`; fetched both — **identical sha256** (`3c66cad9e9cec0f9…72e6ae9657`), same 15,487 bytes. Removes a small third-party redirect host from the trust chain. |
| all others sampled (11 rows) | — | **no change** | 200 + genuine ABP content + no redirects. |

Minor non-URL hardening ideas (out of scope for the map, noted for the report):
- Map pins mutable branch names (`master`/`main`); a maintainer renaming a default branch silently 404s the entry — TTL scheduler should surface non-2xx per-list instead of swallowing.
- The public S3 listing on `blocklists.operacdn.com` is Opera's exposure, not v12's — unmapped hashes keep CDN fallback, which still works today (verified above).

---

*No files outside `/tmp/gray/` and this report were created or modified. `github_token.txt` was not read or printed.*
