# Addon protocol (BitChord-compatible)

What the extension and the phone app send to and expect from a music addon. It is BitChord's protocol as of v1.9.2 (a2d886e6), so BitChord addons, including our three TorBox addons, work unchanged. Source: `research/BitChord.md` part 2 in the comparison folder, checked against BitChord's code. Where this file and BitChord differ, the difference is marked **(ours)**.

An addon is an HTTP(S) server with three GET endpoints that return JSON. Parse leniently: ignore unknown keys, allow nulls, coerce values.

Regular expressions here are JavaScript's: `\s` matches Unicode white space, while `\w`, `\d` and `\b` are ASCII only. A port in another language must match that. In Java/Kotlin, `\s` is ASCII unless `UNICODE_CHARACTER_CLASS` is on, and that flag also widens `\w`, `\d` and `\b`; so spell out the Unicode spaces in place of `\s` instead.

## 1. Requests, all endpoints

Headers:
- `Accept: application/json`
- A browser User-Agent, never BitChord's **(ours, the user's call)**. The developer of tidotido blocks every request whose UA contains "bitchord", at Cloudflare and in the addon, on all his addons; any other agent is fine. On PC nothing is overridden and there is no setting for it (the user's call): the extension's background fetch sends Firefox's own UA. Where a client must set one (the phone), use a browser's, e.g. the BitChord fork's presets: Firefox `Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:159.0) Gecko/20100101 Firefox/159.0`, Edge `Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0`. Cloudflare may still refuse node by its TLS/HTTP2 fingerprint, so judge an addon from the browser, not node.
- Nothing else: no Origin, no Referer, no cookies (`credentials: omit`), no `bitchordAuth` headers.
- The audio file request sends only the headers the `/stream` answer supplies (§4 `headers`, without any `User-Agent`, `Range` or `Accept-Encoding` of the addon's: one fixed UA, and ours), plus our `Range` where one is used (the probe; a ranged download), always with `Accept-Encoding: identity` (a compressed answer's sizes would be the compressed ones). The Fetch standard adds that header to every request with `Range` (browsers and node alike), so on PC nothing sets it by hand; a client outside fetch (the phone's OkHttp) sends it itself.
- Links hold their owner's token. Wherever a link could show (logs, errors, health, the popup, what the page gets, test output), only its host appears.
- `https` only. Plain `http://localhost` and `http://127.0.0.1` links are allowed on PC for the local mock server in tests; the phone and release builds accept `https` only.
- **Redirects** (2026-11-27): every hop goes to `https` and never to this machine. The phone follows them by hand (at most 5) and checks each hop before it connects. Firefox checks each hop before its request is sent (a blocking `webRequest` cancels it, `fx-headers.js`); the Chromium build can't, so its fetch checks the final URL before any of the answer is read. A hop that passes keeps the addon's own headers (§4 `headers`), since an addon's CDN may need them; the browser drops `Authorization` on a cross-origin hop.

Every search and stream request carries these query parameters, percent-encoded, in this order:
1. Each declared setting default, `key=default`.
2. `quality=`:
   - lossless tier (the best): the user's pick if the manifest still lists it, else the first option;
   - Hi-Res or CD tier **(ours)**: the first option whose value or label names it (`hi-res`, `24-bit`, `192 k`, `96 k`; `CD`, `16-bit`, `44.1`), else (CD) an option called `lossless`, else the first option;
   - other tiers: an exact option match, else the first option containing `low|96|128|min` (LOW) or `high|320|normal|standard` (HIGH), else the first option (LOW: else the HIGH one, else the last option **(ours)**);
   - no quality setting declared: the tier name `LOSSLESS`, `HIGH` or `LOW` (Hi-Res and CD send `LOSSLESS`).
   This overrides any declared quality default.
3. `atmos=`: not sent. The extension and the phone app play stereo **(ours)**. An addon that declares an `atmos` setting (NullBeat: a toggle, default true) gets `atmos=false` in its place, overriding the default **(ours)**. Phone only: with its Dolby Atmos switch on (off by default, shown only where the phone lists a Dolby decoder), the search and an Atmos row's `/stream` send `atmos=true`; a stereo row's `/stream` still sends `atmos=false`. See §3a. The extension never sends `atmos=true`.

Timeout: 45 s for the whole call, connect to last byte. That is the one that ends a slow request (BitChord also sets a 60 s read timeout, which the 45 s call limit always reaches first). TorBox-backed addons can take 20–32 s on a cold cache.

## 2. `GET {base}/manifest.json`

| Field | Type | Default | Meaning |
|---|---|---|---|
| `id` | string | required | Blank means "not an addon manifest". |
| `name` | string | `id` | Display name. |
| `version` | string | "" | Shown as "name vX". |
| `resources` | string[] | [] | Case-insensitive. Usable when empty or it contains `search`. Non-empty without `search`: unsupported. |
| `settings` | `[{key, default, options:[{value,label}]}]` | [] | Values are JSON primitives, sent as strings. |
| `settings[key=quality]` | | | Its options are the quality picker, shown only with 2+ options. A pick that is no longer listed falls back to the first option. |
| `allowDownloads` | flag | true | false: never used for downloads (phone only; the PC doesn't download). |
| `limits` | `{streamsPerMinute, uncachedPerHour, cachedMarker}` | 5, 60, `cached` | Optional **(BitChord fork)**. See 4a. |
| `checkValidLossless` | flag | false | Ignored **(ours)**: no output-device check, the addon is asked like any other. (BitChord asks it only while a lossless-capable output is connected.) |
| `bitchordAuth` | flag | false | Unsupported: it needs the official, signed BitChord app. Such an addon can't be added ("needs official BitChord"); one already in the list is skipped with that reason, which is not a failure, so there are no retries. |

Flags: a JSON boolean as is; `"1" "true" "yes" "on"` true, `"0" "false" "no" "off"` false; other numbers true when non-zero; anything else the default.

Base URL: trim, strip a trailing `/`, drop a final `*.json` segment, keep everything else including token path segments (`https://host/{token}`). Two addons are the same when scheme and host match case-insensitively and the path matches exactly.

Discovery from a pasted URL: if the path ends in `.json`, try it, then `{base}/manifest.json`; otherwise `{url}/manifest.json`, then the URL. A body with a `resources` array, or `id` plus `name`/`version`, is a manifest. Last resort: `GET {base}/search?q=music`; on success use `{id: base, name: host, resources: [search, stream]}`.

Cache the manifest 10 min and re-read its policy fields before each search and stream.

## 3. `GET {base}/search?{settings}&title=…&artist=…&q={query}`

- `q`: the trimmed query; a blank query sends nothing.
- `title`, `artist`: the queue item's raw title and artist, trimmed, each sent only when known, when matching a known song (v1.9.2; BitChord upstream 7203588d, v1.10: `q` mixes title and artist, so an addon can't tell two recordings of one title apart). Not sent for a typed search. An addon that doesn't read them ignores them.
- Queries, tried in order until one matches (see 7): `"{searchable title} {primary artist}"`, then the title alone.
- Response `{"tracks": [ … ]}`, row order kept. Keep the first 15 rows for matching.

| Row field | Notes |
|---|---|
| `id`, `title` | Required. |
| `artist`, `album` | |
| `duration` | Seconds, may be fractional. |
| `artworkURL`, `albumArtworkURL` | |
| `format`, `audioQuality` | Text the tier is read from: FLAC/ALAC/WAV/hi-res/16- or 24-bit → LOSSLESS; low/128/96/64 → LOW; 320/MP3/AAC/Opus → HIGH. |
| `audioMode`, `audioModes[]`, `atmos`, `isAtmos`, `isAtmosOnly` | Atmos when `atmos`, `isAtmos` or `isAtmosOnly` (NullBeat's flags) is true or the text matches `atmos|dolby|eac3[_-]?joc|ec-?3`. We skip Atmos rows **(ours)**: a different mix from YouTube's stereo track breaks the alignment, and Firefox can't decode E-AC-3. |
| `explicit` | Optional; used by matching when present. |
| `isrc` | Optional, not BitChord. When both sides have one, an equal ISRC is the match **(ours, from Mornye)**; see §7, ISRC first. |
| `streamURL` | Optional fallback when `/stream` fails. |

## 3a. Dolby Atmos on the phone (ours)

The extension stays stereo: Firefox can't decode E-AC-3, and nothing in this section applies to it.

The phone app has a Dolby Atmos switch, off by default. It does anything only where `MediaCodecList` lists a decoder for `audio/eac3-joc` or `audio/ac4`. With it on:
- Searches send `atmos=true` (§1). Rows read as Atmos (the §3 table) are no longer refused. They go through the same §7 rules (ISRC first, the matcher, the length slack, previews) as a list of their own, at most 1 per addon (with 3 stereo rows that is 4 `/stream` calls, inside the default 5 a minute). The queries go on until the stereo rows match too, so an Atmos row that fails still has a stereo fallback.
- Atmos rows go first: every addon's matching Atmos rows in priority order, then every addon's stereo rows in priority order as before. A stereo row from the first addon therefore comes after an Atmos row from the third.
- An Atmos row's `/stream` sends `atmos=true`. An Atmos answer (the §3 pattern, or a `codec` of `eac3` or `ac4` alone) is taken and marked Atmos; the probe treats it as lossy (64 kbps floor). A stereo row's `/stream` sends `atmos=false`, and an Atmos answer to it is still a miss.
- Before the probe, the stream's codec is matched to a decoder: `eac3_joc`, `eac3`, `ec-3` → `audio/eac3-joc`; `ac4`, `ac-4` → `audio/ac4`; no codec stated → any Atmos decoder. A codec the phone can't decode is passed over with "no decoder on this phone", and the next row is tried.
- Playback is the same as for any file (§8). The file is fetched, decoded by the decoder that plays it, fitted to YouTube's audio and levelled. Samsung's `c2.dolby.eac3.decoder` gives its Atmos render as 2-channel 48 kHz PCM, so the fit, the gain and the mix decks read it unchanged.
- An Atmos file is usually its own mix, so its fit to YouTube's audio finds no match (Blinding Lights: coarse score 0.65, under the 0.8 bar). It is not refused. Its decode is kept while the stereo rows are tried (one at a time: a later addon's Atmos row is passed over while one waits), and the first stereo row that fits places it:
  - The fine fit (the 1 kHz waveform) scans ±0.11 s around the stereo file's offset, in 4 windows of 20 s spread through the song. Where the 4 agree within 5 ms, their median is the Atmos offset; otherwise the stereo offset is used as it is. The envelope's coarse fit is skipped: across two mixes it lands tens of ms off.
  - The Atmos file is still refused for its length (the slack, against the offset it gets), and then the stereo file plays.
  - The stereo file is deleted and the Atmos one plays. When no stereo row fits, the Atmos file is deleted too.
- Our player plays our own decode, not the addon's file. The 2-channel render the fit read is written as a 16-bit WAV with the gain in its samples, and that WAV is what plays (a saved Atmos download is decoded to a WAV in the cache when it loads). YT's player decoding the E-AC-3 itself played it 41 to 59 ms ahead of that decode (a different amount after each seek) and 6 dB quieter (S21 FE, recorded), so the hand-overs to the mix decks jumped and stepped in level. From the WAV, the player, the fit and the decks read the same samples.
- Level: the gain comes from the Atmos file's own loudness. Atmos mixes are mastered far quieter than YouTube's audio (Blinding Lights: 13.5 dB under).
  - **[phone only]** An Atmos file's boost goes up to +14 dB, under a look-ahead limiter, in the WAV.
  - **[PC only]** No Atmos plays on the PC. Its boost, for every addon file, is at most +6 dB, kept at or under -1 dBTP (`src/addons/offset-fit.js` `MAX_BOOST_DB`, `CEILING_DBTP`, `sourceGainDb`; offset-map.md, Level).
- The quality badge reads "Dolby Atmos" when the renderer's input format is `audio/eac3-joc` or `audio/ac4`, or when it is PCM from our WAV of such a decode. Plain E-AC-3 without objects is not Atmos. The badge's icon is BitChord's `ic_dolby_atmos` (the double-D).
- Switching it off hands Atmos audio back to YouTube's player at once. Prepared Atmos files are dropped, and the songs are asked again in stereo. Downloaded Atmos files stay.
- Downloads: the popup's quality row gains Atmos (only with the switch on). It asks for Atmos rows only (`atmos=true`, the addon's best quality) and checks the bytes for an MP4 with an `ec-3` or `ac-4` sample entry. When no addon has it in Atmos, it steps down to Best, then Hi-Res, then CD. An Atmos file is never reused for a stereo download of the same ISRC, or the reverse.

## 4. `GET {base}/stream/{trackId}?{settings}`

`trackId` is percent-encoded as one path segment.

| Field | Notes |
|---|---|
| `url` | `https` only: any other link is a miss (`not https`) and is never probed. (PC tests: plain `http` to 127.0.0.1 or localhost.) |
| `format`; `quality` / `streamQuality` / `audioQuality` | Quality text. |
| `codec` / `fileCodec`; `container` / `containerFormat`; `mimeType` | |
| `manifest` / `mediaType` | `none`, `hls`, `dash`. |
| `encrypted` | Refuse unless false, `"none"` or blank. |
| Atmos | Refuse a stream whose `codec`, `audioMode`, `format` or `quality` reads as Atmos (same pattern as the rows): an addon may answer Atmos for a row that didn't say so **(ours)**. Phone with the Dolby Atmos switch on: an Atmos answer to an Atmos row is taken (§3a). |
| `sampleRate` | Hz; under 1000 means kHz. |
| `bitDepth` | |
| `bitrate` | Over 3000 means bit/s, else kbps. Absent: 320 for HIGH, 128 for LOW. |
| `headers` | Optional object of header name → string (a number is sent as text). Sent with the audio file request (and its probe), and nothing else is. Invalid names, other values, and `User-Agent`, `Range` and `Accept-Encoding` (any case) are dropped. |
| the `cachedMarker` field (default `cached`) | A true flag: the file came from the service's cache and doesn't count against the uncached limit (4a). |
| `error` | Logged; the answer is a miss. |

Transport: from the URL's path extension and the answer's format fields only (`format`, the quality text, `codec`, `fileCodec`, `container`, `containerFormat`, `mimeType`, `manifest`, `mediaType`), never from words inside the host, the query or a token. HLS when the path ends in `.m3u8` or a field has the word `hls` or `m3u8` or contains `mpegurl`; DASH when the path ends in `.mpd` or a field has the word `dash` or `mpd` or contains `dash+xml`; else a progressive file (so `/Dashboard.flac` and `?t=…mpd…` are files). Missing numbers are read from the quality text: `([\d.]+)\s*kHz`, `(\d{1,2})\s*-?bit`, `(\d{2,4})\s*kbps`.

Codec, first that applies: stated codec; container (flac/wav/mp3/aiff); MIME subtype; `flac` if the text says lossless; the URL's extension when it is an audio one (flac, mp3, m4a, aac, ogg, oga, opus, wav, aif, aiff, alac).

HLS and DASH: played by all three apps (§8.1.5). Such a row gets no range probe (§7): a playlist's size says nothing of the song's length.

On a 404, a blank `url` or an `error`: use the row's `streamURL`, else the next source.

## 4a. Stream limits (BitChord fork)

TorBox-backed addons allow about 5 `/stream` calls a minute and 60 uncached an hour. Per addon, the client counts its `/stream` calls over the last minute and its uncached answers over the last hour, against the manifest's `limits` or those defaults. A call over either count is not made: the row is skipped with "stream limit, free in N s", which is not a failure (health untouched). On the phone, a song that gets no file while a limit was hit is tried again after 60 s, not after the 10 min a failed song waits **(ours)**. A cached `/stream` answer (6) costs nothing.

A 429 on `/stream` is not retried. The client learns from it: from then on the per-minute count is the number that got through before it (at least 1), and no `/stream` call goes to that addon until `Retry-After` (default 60 s) has passed.

So `/stream` is never spent on speculation: the look-ahead for the next song is search only (8), and `/stream` is called just before the song is needed: from 25 s before the transition (§8.1.3).

## 5. Status codes

| Answer | Meaning |
|---|---|
| 2xx with a body | OK. A blank body is an error. |
| 404 | A miss, not a fault. Not logged; next source. (A manifest 404 is an error.) |
| ≥ 500 | Down for now. |
| 429 | Wait `Retry-After` (seconds, may be fractional), else 500 ms << attempt, clamped to 0.5–8 s. After 2 retries give up. Every later request to that addon waits out the same quiet window. On `/stream`: no retry, see 4a. |
| other 4xx | Permanent error. |
| 200 with `error` | A miss. |

## 6. Caching

Identical calls in flight share one request (optional for a client whose cache already covers repeats). Manifest 10 min, search 10 min (key `query|params`, so title and artist are part of it), stream URL 5 min. Empty `tracks` are cached; failures, 404s included, are not, nor is a `/stream` miss (an `error`, a blank or refused `url`): it may be asked again (PC: `client.js` stream, audit 2026-11-24). At most 128 entries. "Upgrade quality" clears a song's search and `/stream` entries, empty ones included (§8.1.7). The audio itself goes to the persistent addon cache (§8.1.6).

## 7. Matching a YouTube Music song to addon rows

Port of BitChord's TrackMatcher (v1.9.2 web port: `web/app/src/data/match/trackMatcher.ts`). `spec/addons/matcher-cases.json` holds cases with the answers BitChord's own matcher gives; our ports must reproduce them (`scripts/addon_matcher_fixtures.mjs`).

Title:
1. NFKC, lowercase, `&` → "and", CJK brackets → `()`.
2. Up to 3 passes over bracketed asides: neutral (`album version`, `original mix`, `radio edit`), versions (remix, live, acoustic, instrumental, karaoke, cover, edit, version, mix, sped, slowed, part, pt), or context (other words over 2 letters, minus noise: official, video, audio, lyrics, remaster(ed), explicit, deluxe…).
3. Up to 3 passes over ` - ` and `|` tails; keep the head unless the head is just the artist.
4. Strip `feat|ft|featuring|with …`. Drop trailing noise words; trailing instrumental/karaoke/acapella/remix/rmx/nightcore move into versions.
5. Core: CJK titles without spaces and punctuation; otherwise the words joined and folded (`ı` → `i`, NFD, combining marks dropped). Artists are folded the same way.

Score of a row (null = refused):
- Title must match: equal cores, equal romaji, a translation match, or one core containing the other when both are over 3 characters.
- Version sets must be equal (album no-vocal markers count: instrumental, karaoke, acapella, backing, stems).
- Artist: names split on `, & / ; · | 、 ， ×`, and, x, vs, feat, ft, featuring, with. Two names match when one is a contiguous word run of the other. Exact set +25; any shared name +10; none: −30, allowed only when the target is not a video and the lengths agree within 2 s.
- Length: within 3 s +40, within 30 s +15. A row with a shared artist may be up to 90 s off at 0 points (a music video's intro and outro; YouTube doesn't flag videos reliably, so this holds for every shared-artist row). Otherwise refused. Unknown length: 0.
- Album equal after normalising: +35. Explicit flags both known: equal +20, unequal refused. A shared context word: +20. Base 100.
- Ranking: if any accepted row shares an artist, rows without one are dropped. Sort by score; ties keep the addon's order.
- **[all] Mashups (ours, 2026-11-24; not in BitChord a2d886e6).** When the YouTube title is a mashup or medley, the "one core contains the other" branch doesn't apply (the cores must match by one of the other ways) and the credit override doesn't either (the row must share an artist). A mashup: a `mashup`, `mash-up` or `medley` word anywhere in the title, or, in one part of it (bracketed asides and ` - ` parts apart, a part that is just the credited artist skipped), two or more pieces joined by ` x `, ` × `, ` vs `, ` vs. ` or ` / ` (spaces around), none of them the credited artist. A piece that is the credited artist makes it a credit ("Sigala x Ella Eyre - Came Here For Love" by Sigala x Ella Eyre), not a mashup. A title taken for a mashup by mistake ("Generation X Anthem" style) only makes its match stricter, never lets a wrong row in. Found on the phone: YouTube `6Edmp3yHv1s`, "LET ME LOVE YOU x GATA ONLY" by Moonshine, 172.7 s, took Tidal 445741450, "Let Me Love You" by Bonnie X Clyde, by substring and the credit override; the fit refused it (0.21) only after the download. PC: `src/addons/track-matcher.js` `isMashup`. Cases: the three `(ours, mashups)` cases in `matcher-cases.json`.

ISRC first **(ours, from Mornye; in every match since 2026-11-20)**:
- **[PC, and BitChord] only.** The phone has no ISRC source: its lyrics come from Morphe, so it has no lyrics lookup to learn one from, and it sends no request just for one. On the phone the rule never applies and the title/artist/length matcher decides, as for a song without an ISRC below.
- **The song's ISRC.** YouTube Music's answers (player, next, browse) carry no ISRC. A client uses the ISRC it already learned for that song from its lyrics lookup: a recording match (BiniLyrics identify) or an ISRC-filed lyrics document (lrc.red). It keeps them in memory, per video id, for at least the last 100 songs. It sends no extra request just to get an ISRC.
- **When ISRC-first applies.** In every match made for a song: the race at the song's start, the upgrade pass, a replay and a download. It applies when both the song and the row have an ISRC. Both are normalised to 12 characters, upper case, separators dropped. Rows whose ISRC equals the song's are opened first, in the addon's order. An ISRC match still answers to the length rule, so a wrong-edit lyrics match can't open a file of another length.
- **No ISRC.** If either side has none, the rule is skipped and the title/artist/length matcher decides as before. The race at the song's very start can run before the lyrics lookup has finished; it then matches without an ISRC, and the upgrade pass that follows has it.
- PC: the lyrics lookup hands the ISRC of an accepted lrc.red document (and a BiniLyrics hit's `isrc`, when its answer has one) to the background by video id (`VIVI_ADDONS_ISRC`, the last 200 songs, `src/addons/bg-addons.js`). The look-ahead's search (FIND) uses it when it is known; when it was learned after FIND and before OPEN, OPEN searches again with it (the search answers are cached 10 min, so no addon is asked twice and no `/stream` is spent). The upgrade pass after OPEN (8.2.1, 8.6) matches with the song as OPEN had it, its ISRC included.

Then, before playing a row **(ours)**:
- Length within the user's slack (default 5 s, 0–10) of the YouTube song for playback, ±2 s for downloads. Rows within 3 s are preferred.
- Preview check: refuse a row ≤ 35 s when the song is > 45 s (Mornye), and probe the stream with `Range: bytes=0-0` (4 s timeout; a progressive file only, not an HLS or DASH row, §5). From `Content-Range` or `Content-Length`, max length = bytes·8 / (floor·1000), floor = 200 kbps for lossless, else min(stated kbps, 64). Refuse when that is shorter than the song minus the slack. An unmeasurable file is not refused.
- Open at most 3 rows.

These rules, and the tier, kbps, probe, parameter, stream-answer and base-URL readings, are data in `spec/addons/pick-cases.json`, which every port's tests read.

## 8. Playback

BitChord's addon model is the rule (decided 2026-11-20, the user), with the phone's measured additions. Each rule says who follows it: **[all]** (the phone, BitChord, the PC), **[phone only]** (with BitChord where it says so), **[PC only]**. The PC doesn't stream for now (decided 2026-11-20): it keeps its whole-file deck (below) and takes every rule that doesn't need streaming. It is measured (time from song start to deck take-over, peak memory) and streaming is revisited if the take-over is typically over about 10 s.

### 8.1 Getting the audio

1. **[phone only], and BitChord: progressive streaming.** The file is read in 1 MB ranges through the disk cache (rule 6), 8 MB ahead of the play position; playback starts once 500 ms is buffered.
2. **[PC only]: the whole file.** The background fetches the opened row's file (at most 300 MB, 120 s) and hands the page its bytes; the page decodes it all (Web Audio) for the deck, the full fit and the measured level.
3. **[all] Read-ahead: only near the transition.** The next song's addon is searched as soon as it is known (FIND: manifest, search, pick; no `/stream`, §4a). Its `/stream`, probe and audio are fetched only from 25 s before the transition (the mix-out, or the song's end), never earlier. The playing song's are fetched when it starts.
4. **[all] Race the addons.** The ranked addons are asked in parallel, each with its own rows in its own order (§7); the first acceptable answer wins, and when two are ready together the higher-ranked addon wins. Then the losers stop: an addon still searching sends no `/stream`, because each `/stream` can add the song to the user's debrid account (TorBox showed one entry per addon). A `/stream` already sent runs out; neither app aborts it. (BitChord: `SourceResolver.bestAcross`, the losers cancelled once one wins; 13.6 s one at a time in upstream's log.) **[all] A refusal doesn't end the race:** a won answer refused at any later check (the PC's fit, the phone's window check) passes to the next ready row or lane, the refused row's addon keeping its other rows; YouTube's audio plays only when none passes. "Refused" is per row and per song: that row isn't opened again for the song, its cached file included (rule 6), and other songs aren't affected. YouTube's audio plays meanwhile, until a copy that passes takes over. (Phone: `AddonClient.race`, test `raceGoesOnPastARefusal`, 2026-11-24.) A file in the persistent cache (rule 6) is ready at once, so it wins even over a higher-ranked addon that isn't cached; when it is below what that addon may offer, the upgrade pass (8.2.1) still runs.
5. **[all] HLS and DASH** rows are played (decided 2026-11-26, the user). The phone and BitChord play them through their players' HLS and DASH support. **PC:** the background puts the stream together into one file and hands the page its bytes like a progressive file's (rule 2), so the fit and the decks are the same (`src/addons/stream-assemble.js`; `addon_stream_tests.mjs`):
   - HLS: from a master playlist, the best audio rendition, else the best variant (audio-only first, then by `BANDWIDTH`); then its media playlist. fMP4 segments: the `#EXT-X-MAP` init and the segments, joined in order (a fragmented MP4). MPEG-TS segments: the audio stream taken out of them, ADTS AAC (`.aac`) or MPEG audio (`.mp3`). Packed ADTS or MP3 segments: joined without their ID3 tags. `#EXT-X-BYTERANGE` is read.
   - DASH: the best audio Representation by `bandwidth`; its segments from `SegmentTemplate` (`$Number$`, `$Time$`, `$RepresentationID$`, `$Bandwidth$`, with or without `SegmentTimeline`), `SegmentList`, or one file (`SegmentBase`, or a `BaseURL` alone); the init and the segments joined.
   - Dolby codecs (`ac-3`, `ec-3`, `ac-4`) are passed over: a browser can't decode them.
   - Every request: the stream answer's headers only (§1), no credentials, 30 s each, 4 at a time. The whole download keeps rule 2's limits (300 MB over all segments, 120 s).
   - Refused like a bad fit (8.1.4), so the next row opens: encrypted (an `#EXT-X-KEY` or `#EXT-X-SESSION-KEY` not `NONE`, SAMPLE-AES, `ContentProtection`), live (no `#EXT-X-ENDLIST`, an MPD of type `dynamic`), more than one init segment or `Period`, Dolby only, segments it can't read, and a link or a redirect off `https` or to this machine (§1, as the file download).
   - **(2026-11-27)** A malformed manifest is refused the same way, never failed (a failure would end the song's rows): an empty or backwards byte range (`#EXT-X-BYTERANGE` of length 0, a DASH `range` whose end is before its start), an `#EXT-X-MAP` without a `URI`, a `SegmentTemplate` that makes no segments, a character reference past Unicode (over U+10FFFF), and any other error thrown while reading the manifest.
   - **(2026-11-27)** One segment that fails or is refused stops the others still in flight at once, rather than each at its own 30 s limit.
6. **[all] A persistent addon cache** of audio across plays, with a size setting (default 512 MB), least recently played dropped first. A replay reads it, with no `/stream` call. **PC:** the background keeps the fetched files in it (Cache API), keyed by addon, row and quality, never by the file URL (it holds a token).
   - **[all] Never a manifest.** An HLS playlist or a DASH manifest never goes through the audio cache: it is never kept in it, and nothing in the cache answers a manifest open (Laya 33a710d1: a DASH manifest read through the song's cache key came back as the Opus copy Automix had cached, and the DASH parse failed). Two cases, kept apart:
     1. **A row announced as HLS or DASH** (§5, its transport): an app that plays such a stream opens it from its own URL, never through the cache. **PC:** the file put together from it (rule 5) is not kept either: such a row is fetched from its URL on every play.
     2. **A file answer that is a manifest** (a row announced as a file whose answer's `Content-Type` is an `mpegurl` or `dash+xml` one, or whose first bytes are `#EXTM3U` or an `<MPD` tag in any case, after an optional BOM, XML header, comments or doctype): **[all]** it is refused like a bad fit (8.1.4), never played, never kept, and never replayed from its URL as if it were audio; the next ready row or lane opens, and YouTube's audio plays meanwhile. **PC:** `bg-addons.js` fetchFile answers it with `refused`, and the page passes to the next row (`crossfade.js` prepareAddon, up to 4); the cache keeps no such file and drops one it finds instead of serving it (`src/addons/file-cache.js` `isManifest`; `addon_file_cache_tests.mjs`). **Phone:** the same refusal. **BitChord:** said to replay it from its own URL; asked on 2026-11-24 to align with this rule or explain.
7. **[all] "Upgrade quality"** (a per-song action) clears that song's cached search and `/stream` answers (§6), and its empty answers too, then asks again. **PC:** its files in the persistent cache (rule 6) go too, or the replay would bring the same file back.
8. **[phone only] Network quality.** Two settings, Wi-Fi and mobile data, both default Lossless. A tier below Lossless means addons are off on that network (YouTube's audio plays). **PC:** none; a browser can't tell mobile data (Firefox has no `navigator.connection`).

### 8.2 Choosing what plays

1. **[all] A lossy floor.** An addon copy replaces YouTube's only when it is lossless (or Atmos, phone only), or lossy at 96 kbps or more over what YouTube plays now. A lossy copy that plays is followed by a lossless pass: the addons are asked again for a lossless row, and a lossless copy found replaces it the same way.
   - **The upgrade pass after a cached copy.** A copy that won because it was cached (8.1.4, 8.1.6) and is below the tier asked is followed by the same pass, asking only the addons ranked above the one it came from (**PC:** after first looking in its persistent cache at any rank for a better kept copy, 8.6). Quality order: lossy < lossless up to 16-bit/48 kHz < Hi-Res (over 16-bit or over 48 kHz); "below the tier asked" means lossy for Lossless/CD, and anything under Hi-Res for Best or Hi-Res. A copy found replaces it only when it is higher in that order, through the window check; it then goes into the cache under its own key. A cached copy at the tier asked is kept, so a replay spends no `/stream` call.
2. **[PC, and BitChord] ISRC first** (§7; the phone has no ISRC source) in every match: the race at the song's start, the upgrade pass, a replay and a download.
3. **[all] The window check** (`offset-map.md`) before any copy replaces YouTube's: no match, the song stays on YouTube; a match, its offset is applied. A full fit counts (the PC).
4. **[all] Level:** `offset-map.md`, Level (the phone and BitChord: YouTube's `loudnessDb`, nothing measured; the PC: measured before its deck plays, on top of the element volume that carries YouTube's `loudnessDb` cut).

### 8.3 The swap

1. **[phone only], and BitChord: the audition.** At the current position, the client warms 1 MB of the copy, then buffers 12 s and at least 1 MB, and checks the decoder's MIME against the stream's. The 12 s are the window the check reads. Then it swaps at the same position, plus the offset, with a short cover crossfade; then it watches the copy's length for 10 s: a copy whose length breaks the slack (§7) hands back to YouTube.
2. **[phone only] Mix decks** come from YouTube's copy; after a mix, the hand-over to the streaming addon player is 250 ms.
3. **[PC only]: the deck.** Below.

### 8.4 The addon list

1. **[all]** Each addon: on/off, reorder, its manifest name and its health. Never its link or token (§1).
2. **[all]** A quality picker per addon, from its manifest's `quality` setting (§2), shown when it lists 2 or more options.
3. **[phone only] Downloads:** Wi-Fi only by default (a setting); the search asks at the tier that will be streamed. Downloads also follow the addon "Off on mobile data" switch, as playback does: while it is on, no download goes to the addons over mobile data.

### 8.5 By design

A browser User-Agent (§1), Atmos off by default (§3a), and the music-video length slack (§7) stay.

### 8.6 The PC as built

- **[PC only]** YouTube-first with a deck switch only (decided 2026-11-17). There is no Direct mode: swapping the `<video>`'s source would break YouTube's player (it plays through MediaSource; seek, next and history depend on it). Instead:
  1. YouTube starts the song as always.
  2. The picked row's file is fetched (FETCH: by the background script, which holds the host permission and the file URL; at most 300 MB, 120 s) and handed to the page as bytes (8.1.2).
  3. Its timeline is fitted to YouTube's own audio (`offset-map.md`, Full fit, which counts as the window check). A row that doesn't fit (another edit or master) is refused and the next row or addon is tried.
  4. The addon deck (`src/addons/buffer-deck.js`, below) plays the file on YouTube's clock, YouTube muted underneath, and takes over with a short crossfade. Its level is YouTube's element volume times the source gain (`offset-map.md`, Level).
  5. On any failure mid-song the deck hands back to YouTube, which is at the same spot.
  HLS and DASH rows are put together into one file in step 2 (8.1.5). The fit reads YouTube's audio of the song from Automix's download, so on PC addons need Crossfade and Automix on (`src/automix/crossfade.js` addonTick).
- The PC deck (`src/addons/buffer-deck.js`): the whole file, decoded at the audio context's rate (on PC the output device's rate; `decodeAudioData` resamples a 44.1 or 96 kHz file there, the one resample on the way out), played by buffer sources. Every start is on a whole output frame and a whole file sample, so the output is the file's own samples (measured: −152 dB residual against the decoded file).
  - Its place comes from YouTube's output: a tap records what YouTube plays on exact frames, and its last 0.25 s is matched against the file (±0.35 s around YouTube's time). YouTube's time (plus the lead learnt from the last match) is a last resort only: after a seek the lead changes (measured 144 → 31 ms), so the time alone can be 0.1 s off.
  - **(2026-11-27) The take-over from YouTube's sound** happens only where YouTube's output is matched on the file (the tap): a take-over by YouTube's time can be ~0.1 s off what is heard, a small cut or repeat that nothing later puts right. A quiet stretch (nothing on the tap to match) is waited out; no match in 20 tries, 0.25 s apart (5 s), hands the song back to YouTube. Only a muted YouTube (nothing heard) or no tap at all takes over by YouTube's time (`anchorAndStart`, `TAKE_TRIES`).
  - After a pause, a seek or a stall, the sound goes back to YouTube, the deck waits for 0.4 s of YouTube's new sound in the tap and tries the match up to 4 times, 0.25 s apart, then crosses back (50 ms). Nothing is silent meanwhile.
  - Started by a mix (a take-over), it starts at the mix's schedule (a song position at an audio time) and keeps it: until 1.5 s after the take-over the player's state doesn't move it (the mix seeks and holds the player meanwhile).
- Automix on addon audio (extension): the analysis and the plans stay on YouTube's audio. What plays is the addon's file wherever a copy is ready, every song time mapped through the offset map:
  - the outgoing song's tail is cut from the file; when the deck plays the song, the tail goes on from the deck's own sample at the hand-over (not from where YouTube's copy was found), so deck → tail is sample-exact;
  - the incoming deck of a blend, and both loop decks of a loop mix (a copy that arrives after the loop mix was loaded is loaded into its deck before the mix), play the file;
  - the take-over hands the new song from the incoming deck to the addon deck at the schedule's song position.
  - Filters that are part of the graph at rest (the player's and the tail's high- and low-pass) rest at 0 Hz and Nyquist, which pass the samples through unchanged, and the mix's filter curves end there. 20 Hz / 20 kHz still filtered every song (measured −15 to −30 dB residuals).
  - The loop decks and a glide stretch time, so what they play is the file's sound, not its samples.
- A refusal (8.1.4) on the PC: when the fit refuses the opened file (`src/automix/crossfade.js` `prepareAddon`, "no match"), the file doesn't decode (an error page, a codec the browser lacks: "decode failed"), the file is a playlist or manifest (8.1.6), or an HLS or DASH row can't be put together (8.1.5; both `refused` on the FETCH answer), the page asks the background for the next row (`VIVI_ADDONS_NEXT`, `src/addons/page-addons.js` `nextFor`, `src/addons/bg-addons.js` `next`): the refused row is kept per song ticket, its file dropped from the persistent cache (8.1.6), and left out of the cache lookup and the race, which runs again over the rows left (`/stream` answers already given come from the client's cache). The new file is fetched and fitted while YouTube's audio plays; at most 4 more files per song (`NEXT_ROWS`: each is a whole download), then YouTube's audio stays. Tests: `addon_file_cache_tests.mjs` "NEXT" (2026-11-24).
- The race (8.1.4) on the PC (`src/addons/client.js` race): FIND asks every addon at once and lists them in priority order; OPEN and a full resolve run each addon as its own lane (its search, then its rows in order); the first playable answer wins, and of answers ready in the same turn the higher-ranked addon's. Then the losers stop: a lane makes no further `/stream` call or probe once the race is decided (before 2026-11-21 they ran on to fill the cache, §6, and each added its own TorBox entry); `tried` holds each lane's misses in rank order, as far as they got. A lane makes no `/stream` call while its addon is at its limit (§4a: per minute, 5 when the manifest gives none, or uncached per hour): `stream` answers "stream limit, free in N s" without asking, so the race can't push an addon into a 429 lockout. So only the playing song and the next one inside the last 25 s (8.1.3) are raced.
- The persistent cache (8.1.6) on the PC (`src/addons/file-cache.js`): the Cache API, an index in storage.local (`addonsCacheIndex`: size, last played, the stream's facts; never a link, token or file URL), keyed by the addon's list id, the row id and the quality asked. Sizes Off, 256 MB, 512 MB (default), 1 GB, 2 GB (popup: "Keep played songs"); a smaller size drops the least recently played at once, a file over the size isn't kept. OPEN looks in it first, in rank order and each addon's rows in order: a hit needs no `/stream` call and no download, and wins the race (it is ready at once). A file the browser let go is dropped from the index and the song is opened again.
- The read-ahead (8.1.3) on the PC: the next song's FIND runs as soon as the queue shows it; its OPEN, probe, file, fit and decode start 25 s before the transition (`page-addons.js` openDue, called from `crossfade.js` addonTick): the planned mix-out when Automix has one, else the song's end. A copy not ready by the mix (a slow OPEN: up to 30 s measured) leaves the mix on YouTube's copy of the next song, and the addon deck takes over once it is ready; one ready before the blend is loaded onto the incoming deck in place of YouTube's.
- The lossy floor and the pass (8.2.1) on the PC (`pick.js` qualityRank, floorVerdict, upgradeWanted; cases in `pick-cases.json`): the floor is part of the race (a lossy answer under it doesn't win, the next row or addon does) and of a cached hit (a cached copy under it is passed over). YouTube's bitrate is what its player decodes now (`ytAudio`); for the next song, the last one seen; unknown: 160 kbps (the usual Opus 251). Once a copy plays (`crossfade.js` playAddon), the page asks the background for one pass (UPGRADE): after a lossy copy, when the tier asked is lossless, every addon again with the playing row left out, for lossless or better; after a cached copy below the tier asked, only the addons ranked above it, for better than it. Before asking any addon, the pass looks in the persistent cache at any rank for a kept copy better than the playing one (the playing copy left out): an earlier pass may have kept one that a lower-ranked cached copy beats at OPEN; it is ready at once and needs no `/stream` call (`bg-addons.js` upgrade). A better copy becomes the song's: the next tick fetches and fits it, and its deck takes over from the playing one; a copy that doesn't fit leaves the playing one as it is. Meanwhile the playing copy keeps its quality badge (`page-addons.js` badgeFor), and an upgrade that fails on the way, by a refusal or by an exception (YouTube's audio missing, the file's full decode), gives the playing copy back: its ticket (`VIVI_ADDONS_KEEP`), its badge and its prepared copy. Once per song.
- "Upgrade quality" (8.1.7) on the PC: a click on the quality badge (the bar's art and under the big art; its tooltip says so; not while it shows "Upgrading Quality"). The background forgets the song's search answers (by its title and artist) and the `/stream` answers of its rows (`client.js` forget), drops its rows' cached files and its ticket; the page forgets the song, and `crossfade.js` readies it afresh: FIND, OPEN, the file and the fit, then its deck takes over from the playing one.
- The quality picker (8.4.2) on the PC: a select in each addon's row of the popup, from its manifest's `quality` options (read when the popup lists the addons; labels without links), shown with 2 or more. The pick is kept on the addon (`addonsList[].quality`; its first option is kept as none) and sent as the addon's `quality` parameter when "Best" is the tier (`paramsFor`; a pick no longer listed falls back to the first option); it is part of the persistent cache's key.
- Every rule of 8.1-8.4 that applies to the PC is built (2026-11-20). The "deck starting at `loudnessDb`" item is dropped: the PC measures the level before its deck plays (offset-map.md, Level).
- **[PC only] Why the PC doesn't stream (decided 2026-11-20):** it keeps the whole-file deck. Measured on 5 songs (dbd117e): the take-over came 4.8-32 s after the song started (3.7 s for a song being prepared ahead), and the slow ones were all the addon's OPEN (1.6-30 s). From OPEN to ready always took 3.6-5.4 s, of which the file fetch was 0.9-2.3 s, so streaming would save only that. The race (8.1.4) and the persistent cache (8.1.6) go after the OPEN. A decoded copy holds 101-135 MB, 3 at most are kept.
- The phone's player as built before 2026-11-20 (phone commit 5f16dfe: the whole file fetched and fitted during the previous song, StepClock, a 200 ms crossfade in and 30 ms out, the gain capped at 0 dB) is replaced by 8.1-8.3.
- Quality badge (both apps), always by what is actually decoded and played:
  - an addon copy playing: "Hi-Res Lossless" (over 16-bit or over 48 kHz), "Lossless", or "High Quality" for a lossy copy at 256 kbps or more;
  - while a copy is being found or fitted for the playing song: "Upgrading Quality"; but while a better copy is fetched and fitted over an addon copy that plays (the upgrade pass, 8.2.1), the playing copy keeps its badge (2026-11-27);
  - otherwise YouTube's own audio, by the format its player decodes now (PC: the itag from stats for nerds, its bitrate from the player response): "High Quality" at 256 kbps or more (Premium's Opus itag 774, AAC 141); no badge for the usual ~130–160 kbps (Opus 251, AAC 140).
- Downloads (phone only): only addons with `allowDownloads` not false; a lossy row must be over 256 kbps; Wi-Fi only by default (8.4.3).
