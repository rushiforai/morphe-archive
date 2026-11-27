# Canvas: the moving art behind a song

What the phone app and the PC extension both do to find a song's canvas, pick and judge it, and draw what sits around it. A later BitChord fork follows the same rules.

Cases: `canvas-cases.json` (inputs and expected outputs, synthetic, no media). The PC runs them with `node scripts/canvas_cases_tests.mjs`; the phone reads the same file from its JVM tests.

## How to read this

- Each rule says **[both]** or **[phone only]** with the reason.
- Each rule cites the phone's code and the original it was ported from. Where the two differ, or the PC differs, the original is the rule. §12 lists every difference.
- Paths:
  - Phone: `FEAT/` = `yt music patches/bundle/extensions/extension/src/main/java/app/ayham/extension/music/features/`.
  - Metrolist (v14.0.1): `ML/` = `Metrolist/shared/src/`.
  - Prism: `PR/` = `Prism/app/src/main/java/com/prism/music/data/`.
  - BitChord: `BC/` = `BitChord/app/src/main/java/com/music/bitchord/`, `BCS/` = `BitChord/shared/src/jvmSharedMain/kotlin/com/music/bitchord/`, `BCU/` = `BitChord/sharedUi/src/jvmSharedMain/kotlin/com/music/bitchord/ui/player/`.
  - PC: `src/` in this repo.
- Times are in ms unless they say otherwise.

## 1. Source order

1. **[both]** The sources are tried in this order: the song's music video, Spotify's Canvas, Apple's motion art. The first one that has a clip wins. Phone `FEAT/AnimatedCover.java:467-593`. Original `ML/commonMain/kotlin/com/metrolist/shared/api/artwork/AnimatedCoverSelection.kt:28` (`defaultOrder`), `:119-143` (`selectAnimatedCoverUrl`).
2. **[both]** A source still loading holds the ones after it: nothing is shown from a later source until it answers. A clip that failed to play is skipped. `AnimatedCoverSelection.kt:139-140`.
3. **[both]** The music video and Spotify are Canvas; Apple's is an animated cover, with its own switch. `AnimatedCoverSelection.kt:43-46`. Phone: `FEAT/AnimatedCover.java:423-425` (`canvasApple`, `canvasSpotify`, `canvasVideo`).
4. **[both]** A listener's own order and set of sources may replace the default; sources left out of a custom order follow in the default order. `AnimatedCoverSelection.kt:30-33, 38-39`.
5. **[phone only: the PC has no downloaded songs]** A downloaded song's saved Spotify canvas comes first, then its saved art clip, both by video id, so they play offline. `FEAT/AnimatedCover.java:454-466`. No original (Metrolist has no offline canvas).
6. **[phone only: settle time for a touch UI]** A lookup starts 700 ms after the song shows, so skipping through songs looks nothing up. `FEAT/AnimatedCover.java:50, 428-437`.

Cases: `sourceOrder`.

## 2. Cache

1. **[both]** A found clip is kept and plays at any age, also offline. A miss is kept for 24 h (under 24 h: still a miss; at 24 h: look again). A failed lookup (network, token) is never saved as a miss. Phone `FEAT/CanvasCache.java:21, 56-72`; `FEAT/AnimatedCover.java:543, 590-593`. No original keeps a lasting cache: Metrolist memoises a lookup for 60 s (miss) or 5 min (hit), `ML/jvmSharedMain/kotlin/com/metrolist/shared/api/artwork/DirectCanvasProvider.kt:116`; BitChord keeps 64 answers in memory, `BC/data/canvas/CanvasRepository.kt:41, 54-57`. This rule is ours.
2. **[both]** A damaged entry reads as unknown (look it up again), never as an error. `FEAT/CanvasCache.java:59-68`.
3. **[both]** A saved clip whose file is gone is looked up again. `FEAT/CanvasCache.java:69-71`.
4. **[both]** What each answer is keyed on: the music video by the song's id; Spotify by title and artist; Apple by title and artist, and whether the tall (3:4) clip was asked for. Phone `FEAT/AnimatedCover.java:438, 469, 522`. BitChord keys on the song id and on the source order (`spotifyFirst`), so a changed order never reuses an answer: `BC/data/canvas/CanvasRepository.kt:89, 159-160`.
5. **[phone only: offline downloads]** `spid:<id>` and `id:<id>` keys for downloaded songs. `FEAT/CanvasCache.java:75-82`.

Cases: `cache`.

## 3. Apple motion art

Original: BitChord `BC/data/canvas/AppleMusicCanvas.kt`. Phone: `FEAT/AppleCanvas.java`. PC: `src/apple-canvas.js` with `src/plus/bg-plus.js:623-804`.

1. **[both]** Token: the web player's own anonymous JWT, scraped from `music.apple.com/us/browse` and its `/assets/index…js` bundles. The first unexpired one whose header `kid` says `WebPlayKid` or payload `iss` says `AMPWebPlay`; else the first unexpired one. A token that got a 401 is never picked again. Kept until 60 s before it expires. A scrape that finds none waits 30 min. BC `:356-396, 404-435`. Phone `FEAT/AppleCanvas.java:218-278`.
2. **[both]** Search: `types=songs`, `limit=10`, `extend=editorialVideo`, `include=albums`. The term is the artist (unless the title holds it), the title, and the album (unless the title holds it). BC `:52-67`. Phone `:56-58` (no album).
3. **[both]** Normalising: accents removed, lower case, anything but a-z and 0-9 becomes a space, spaces collapsed. Brackets are kept. BCS `data/canvas/CanvasArtwork.kt:73-79`.
4. **[both]** Artists split on `,` `&` ` × ` ` x ` `feat.` `ft.` `featuring` `with` (not "and"). BCS `CanvasArtwork.kt:86-94`.
5. **[both]** Score of a hit (BC `:178-233`):
   - rejected if its name or album holds `playlist`, `set list`, `essentials`, `dj mix`, `mixed`, `apple music`, `today's hits` or `session` (BC `:243-251`);
   - rejected unless every wanted artist is among the hit's artists;
   - start at 10;
   - title: equal +15, one contains the other +7, else −10;
   - album, when both sides have one: equal +20, one contains the other +10;
   - each edition word (`deluxe`, `expanded`, `remastered`, `remix`, `version`, `edit`, `mix`, `bonus`) as plain substrings: in both +5, only in the hit −3.
6. **[both]** Hits are ranked by score, ties in Apple's order. A hit under 12 ends the search. BC `:76-85, 171`.
7. **[both]** For each hit from the top: its inline motion art if it has some; else its album (from `relationships`, else the number at the end of its `/album/` URL; not a `pl.` id), read with `extend=editorialVideo`, skipped if the album is a compilation. BC `:92-106, 255-304`.
8. **[both]** Motion URLs: an asset's `video`, else `videoUrl`, `hlsUrl`, `url`. Primary: the square clip (`motionDetailSquare`, else `motionSquareVideo1x1`), else `motionDetailRaw`, else the tall one. Alternate: the next of square, raw, tall that differs. Tall (3:4, for a portrait player): `motionDetailTall`, else `motionTallVideo3x4`, else none. A static still is not motion art. BC `:306-330`.
9. **[both]** Storefront: the device's country, else `us`. BC `:42-44`.

Cases: `appleScore`, `appleRank`, `appleToken`, `appleMotion`.

## 4. Spotify Canvas

Original: Metrolist `ML/jvmSharedMain/kotlin/com/metrolist/shared/api/artwork/DirectCanvasProvider.kt`. Phone: `FEAT/SpotifyCanvas.java`. PC: `src/plus/bg-canvas.js`, with upstream's signed-in lookup in `src/spotify.js`.

0. **[both]** The order (since 2026-11-24; the anonymous canvas answers `null` for every track today):
   1. **The listener's own Spotify sign-in**, when there is one: the web player's token from their `sp_dc` session, the canvas asked for the matched track. A canvas found this way still has to pass rule 6.
   2. **Without a sign-in**, or when the signed-in lookup finds nothing or fails: the anonymous lookup of rules 1-7. It is cheap and may answer again.
   3. Else no Spotify canvas (the next source in §1).
   - **[PC]** The signed-in lookup is upstream's own (`spotifyCanvasForTrack`: its track match `resolveSpotifyTrackId`, the canvas over spclient `canvaz-cache` in protobuf). **[phone only]** The phone has no upstream lookup: it asks pathfinder `canvas` (rule 5) with the signed-in token, after the match of rules 2-4.
   - **[both]** The session is the listener's: they sign in on Spotify's own page (PC: open.spotify.com in the browser; phone: a sign-in screen, §13 rule 9). The `sp_dc` cookie is never printed, logged, shown (not even in part) or put in a URL; it is sent only to Spotify, in the cookie header.
   - **[both]** After Sign out the session is forgotten by the app and not picked up again (PC: the browser's own Spotify login is left alone, and not read until Sign in).
   - **[PC]** The cookie is read from the browser's default cookie store only, each time it is needed (`getSpDc`, `src/plus/bg-plus.js`), and never copied into the extension's storage: a Firefox container's or a private window's Spotify login is never read. In Firefox, `src/fx-headers.js` adds it to this extension's own requests to open.spotify.com only (never another extension's, never after Sign out).
1. **[both]** The anonymous lookup: the web player's token by TOTP (spotlib's secret, version 61, 30 s steps, 6 digits), then a client token. No account. ML `:139-149`. Phone `:44-45, 209-272`.
2. **[both]** Search: pathfinder `searchTopResultsList`, query `title artist`, 10 results. ML `:159-186`.
3. **[both]** The first Track among the top 10 that matches and has a canvas wins. ML `:187-221`.
4. **[both]** Match (ML `:397-436`):
   - words: NFKD, marks removed, lower case, split on anything but letters and digits, without `feat`, `ft`, `featuring`, `official`, `video`, `audio`;
   - the artist words equal, or the primary artist's words equal (when given);
   - title: shared words over the larger set, at least 0.75;
   - length: within 10 000 ms when both are known;
   - album: at least 0.5 the same way, when both are known.
5. **[both]** The canvas comes from Spotify itself, still anonymous: pathfinder (`POST https://api-partner.spotify.com/pathfinder/v2/query`) with the same access token and client token as the search (rule 1), `operationName` `canvas`, `variables` `{trackUri: "spotify:track:<id>"}` for a 22-character id, `extensions.persistedQuery` `{version: 1, sha256Hash: "575138ab27cd5c1b3e54da54d0a7cc8d85485402de26340c2145f0f6bb5e7a9f"}`. The canvas is `data.trackUnion.canvas.url`, taken only when rule 6 trusts it; a `null` canvas is "no canvas" for that track. ML `:224-237, 379` (Metrolist 460a3168a). Until 2026-11-24 this was the public mirror `spotify-canva.vercel.app/api/canvas?trackId=`; it now answers every request with HTTP 402.
   - **An expired session** (HTTP 401) drops the access token and the client token once and asks again. A second 401 is a failed lookup.
   - **A rate limit** (HTTP 429) is not retried: the lookup fails (never saved as a miss, §2 rule 1). ML spotlib `SpotifyClient.canvasQuery` (`rateLimitRetries = 0`).
   - GraphQL `errors` in the answer (a non-empty list), or any other HTTP error, is a failed lookup.
6. **[both]** Media is taken only from https, port 443, no user or password, host `scdn.co` or under it. ML `:378-395`. This holds for a saved canvas URL too: one that fails it is dropped, not shown (PC: `bg-canvas.js`, audit 2026-11-24).
7. **[both]** Each request times out at 8000 ms; an answer is read up to 256 KB. ML `:60-64, 124, 227`. Phone `:46`.

Cases: `spotifyMatch`, `spotifyMedia`, `spotifyTotp`, `spotifyCanvas` (rule 5: a pathfinder answer to the canvas URL). Not cased: the signed-in lookup (it needs a live session; checked live).

## 5. Finding the music video

Original: Prism `PR/innertube/MusicVideoMatch.kt`, `PR/innertube/YouTubeMusic.kt:905-927`, `PR/canvas/ClipFinder.kt`. Phone: `FEAT/VideoCanvas.java:232-347`. PC: `src/plus/video-canvas-page.js:38-112, 888-907`.

1. **[both]** A video search for `title artist`, then once more for `title artist official video` when nothing passes. The first passing result wins. YTM `:911-919`. Phone `:246-260`.
2. **[both]** Its title must be the song's: brackets, a `|` or `//` tail, a `ft.`/`feat.` credit, the words `official music video videoclip clip hd 4k hq remastered remaster visualizer mv m/v` and the artists' and channel's names (and their "official" forms) all taken out. MVM `:78-96`.
3. **[both]** Never: a title (or, for a channel not the artist's, a channel name) with `lyric(s)`, `letra(s)`, `paroles`, `testo`, `traducida`, `traducción`, `sub español`, `subtitulad`, `перевод`, `текст`, `karaoke`, `instrumental`, `reaction`, `tutorial`, `lesson`, `guitar`, `piano`, `drum`, `bass`, `slowed`, `sped up`, `nightcore`, `8d`, `fan made`, `fanmade`, `remix`, `highlights`, `edit audio`, `official audio`, `audio oficial`, `audio only`, `rebassed`, `bass boosted`, `bassboosted`, `boosted`, `reverb`, `daycore`, `speed up`, `1 hour`, `10 hours`, `loop`, `mashup`, `parody`, `ai cover`, or a frequency like `432hz`; unless the song's own title has the word. MVM `:107-119`.
4. **[both]** First choice: posted by the artist (their channel id, their channel name or its VEVO/"Official" form, or a record label naming them), within 150 s of the song's length, and not another take (`cover`, `acoustic`, `acústic`, `unplugged`, `live`, `en vivo`, `ao vivo`, `concert`, `session`) unless the song is that take. MVM `:41-47, 60-72, 121-125, 143`.
5. **[both]** A song naming a source in brackets ("SiriusXM Session"): that recording by whoever posted it, within 4 s, naming the artist. A studio song takes nobody else's upload. MVM `:48-57, 144`.
6. **[both]** Prism also takes YouTube's own song-to-video pairing first. Signed out, YouTube no longer pairs; both apps search. YTM `:906`.
7. **[both]** Not a song: podcasts and their episodes, the listener's uploads, files on the device and live streams are never looked up (why `NOT_A_SONG`, no search). `PR/canvas/ClipFinder.kt:105, 285-287` (`ClipGate.isSong`).
8. **[both]** The gate, in this order, for the video found (`tryVideo`, ClipFinder `:139-172`): its type as YouTube Music says it (the `WEB_REMIX` player answer's `videoDetails.musicVideoType`) must be `MUSIC_VIDEO_TYPE_OMV`, else `NOT_OFFICIAL`; its title must not say it is something else (rule 9), else `TITLE`; it must be playable, else `RESTRICTED`; then §6-7 (a still upload: `STILL`).
9. **[both]** A title says it is something else (`ClipGate.titleSays`, ClipFinder `:291-330`) when, as a whole word not also in the song's own title, it has `audio`, `karaoke`, `chords`, `performance`, `live`, `stage`, `cover`, `fancam`, `fan cam`, `recording`, `jukebox`, `bgm`, `en vivo`, `ao vivo`, `en directo`, or `lyric`, `lyrics`, `lyrical`, `letra`, `letras`, `paroles`, `testo`; or `full song` without the word `video` (unless the song's title has `full song`); or anywhere in it, when not in the song's title: `직캠`, `무대`, `가사`, `라이브`, `推しカメラ`, `歌詞`, `ライブ`, `歌ってみた`, `歌词`, `现场`, `翻唱`. Case is ignored. `Visualizer` is allowed (the still check decides).
10. **[both]** A first video refused for `TITLE` or `NOT_OFFICIAL` is not the last word (ClipFinder `:118-127, 201-202`): one more search, `title artist official video`, leaving out that video and any whose title says (rule 9), picked by rules 2-5; up to 2 of its videos go through the gate. The first that passes wins.
11. **[both]** None of those passed: the first video as it is (`own`): its type and title are not held against it, only what can't make a loop (not playable, no stream, a still) refuses it. So an official lyric video, a live take or an unmarked upload is the canvas when the song has nothing better. ClipFinder `:128-133`; owner's rule in Prism, 2026-11-13: "if a song has a video, Canvas should be allowed".
12. **[both]** No result of either search passes rules 2-5: a lyric video by the artist is taken as it is (rule 11): the results of both searches again, by rules 2-4 with the lyric words (`lyric(s)`, `letra(s)`, `paroles`, `testo`) allowed; the first, if any, goes through the gate as the song's own. Prism gets this from YouTube's pairing, which hands it the lyric video when that is all the song has (its `titleSays` `lyricsOk`, `ClipFinder.kt:317-319`: "if the song has a video it should have a canvas"); the apps search, so they ask for it. BitChord `ForkVideoCanvas.clip`, `ForkMusicVideoMatch.candidates` (`lyricsOk`).

13. **[both]** The artists of the song (rules 2 and 4) are its artist line split on `,` `&` ` × ` ` x ` `feat.` `ft.` `featuring` `with`, as §4 rule 4, never on "and": "The Head and the Heart" is one artist. A part left empty is dropped.

Cases: `videoArtists`, `videoMatch`, `titleGate`, `clipFind` (on a fake network: `first` is what the search finds, `others` what the second search gives, each video's type, title, status and whether it is still).

## 6. The part: BestPart

Original: Prism `PR/BestPart.kt:68-101`, used by `PR/canvas/ClipFinder.kt:183`. Phone: `FEAT/VideoCanvas.java:434-465`. PC: `src/plus/video-canvas-page.js:196-221`.

1. **[both]** The curve: YouTube's "Most replayed" markers (`MARKER_TYPE_HEATMAP`), 10 or more; the segment length is the median marker length. BestPart `:44-58`.
2. **[both]** None for a song under 60 000 ms or a curve under 10 segments. BestPart `:35, 70`.
3. **[both]** Smoothing: the mean over `round(4500 / segment)` segments either side (at least 1). BestPart `:74-79`.
4. **[both]** Trend: the median of the smoothed curve over `round(45 000 / segment)` segments either side (at least 3), leaving out segment 0. BestPart `:80-86`.
5. **[both]** Rise of a segment: smoothed / max(trend, 0.05) − 1. BestPart `:87`.
6. **[both]** Candidates start at max(5000, 2 segments) and end 30 000 before the song's end. The largest rise wins; on a tie, the earlier. BestPart `:31-33, 88-91`.
7. **[both]** None when the rise is under 0.08 or the smoothed value is under 0.03 above the trend. BestPart `:37-39, 92`.
8. **[both]** The start is pulled back over candidates whose rise is at least half the peak's, then forward to the first raw segment that reaches that half. BestPart `:93-100`.
9. **[both]** With no curve, the loop's window is chosen from the frames alone (§7.6). With no frames either: the middle 8000 ms of the video. `PR/canvas/FrameJudge.kt:72-76`, `ClipFinder.kt:175-177`.
10. **[both]** The loop is 8 s at first (`CLIP_SEC`, `WINDOW_MS`). `PR/canvas/FrameJudge.kt:13`. Phone `FEAT/VideoCanvas.java:34`.
11. **[both]** The chorus (for §7.6), from the song's time-synced lyrics: `PR/BestPart.kt:103-125` (`chorusMs`). None for a song under 60 000 ms or fewer than 4 timed lines (gaps and blank lines left out). A line's key is its text in lower case, letters and digits only; keys of 4 or more characters are counted. None when no key comes twice. The first line holding the most counted key, at 5000 or later and not in the last 30 000, starts the chorus; it is pulled back over up to 4 lines before it that come at least twice and at least (most − 1) times, at 5000 or later. The answer is that line's start. Prism never passes it to its canvas (its `ClipRepository` callers leave `chorusMs` null) and uses it only for its best part when there is no curve (`PR/BestParts.kt:91`); our apps pass it to §7.6, a deliberate addition. The lyrics are whatever the app already fetched for the song; the canvas never fetches lyrics itself.

Cases: `bestPart`, `noFrames`, `chorus`.

## 7. Judging the clip: ClipJudge

Original: Prism `PR/canvas/FrameJudge.kt` (storyboard frames) and `PR/canvas/ClipRefine.kt` (the real frames). Phone: `FEAT/ClipJudge.java`. PC: `src/plus/video-canvas-page.js:225-476, 1045-1113`.

Frames are 32 × 18 grids of grey values.

1. **[both]** Black bars: a cell at or under 24 is black; a frame is lit when a cell reaches 48. A row or column is a bar when it is black (90% of its cells) in 90% of the lit frames. Bars run in from each edge. Fewer than 3 lit frames: no bars. A pair of sides over half the picture: no bars on that axis. FrameJudge `:22-27, 97-112`. Phone `:50-89`.
2. **[both]** A still upload: in the middle 60% of the picture inside the bars, a step under 3 counts as still; 60% or more still steps is a still upload, never shown. FrameJudge `:28-31, 116-140`. Phone `:117-123`.
3. **[both]** Windows: one per storyboard frame, `round(8000 / interval)` steps long. In a video of at least 51 000 ms, windows starting in the first 12 000 or ending in the last 15 000 are left out; in a shorter one they count at half score. A window with 75% or more still steps is left out. FrameJudge `:13-17, 149-177`. Phone `:128-164`.
4. **[both]** Window score = movement × brightness × (1 − dark share) × (0.5 near an end):
   - movement (mean step inside the bars): m / 18 up to 18, then falling to 0.5 at 60 and above;
   - brightness: (mean − 16) / (64 − 16), clamped to 0..1;
   - dark share: frames under 16. FrameJudge `:34-40, 167-173`.
5. **[both]** When every window is left out, the video is a still upload. FrameJudge `:64`, `ClipFinder.kt:186`.
6. **[both]** The window (FrameJudge `:187-210`):
   - the best within −4000..+8000 of the "most replayed" peak, if the peak is at 12 000 or later;
   - else the best within 10 000 of the chorus (from synced lyrics);
   - else the best in the middle third;
   - each of these only from windows scoring above 0 and at least 0.3 of the best;
   - else the best anywhere, even at 0;
   - ties go to the earlier start.
7. **[both]** Runners-up: up to 4 other starts, 15 000 apart. FrameJudge `:18-20, 213-222`.
8. **[both]** Crop: the band of the picture holding the most detail and movement, 0.32 of the width inside the bars; the centre unless the best leads it by 1.15×; ties go to the band nearer the centre. 0 left, 0.5 centred, 1 right. FrameJudge `:41-44, 232-257`.
9. **[both]** Cut: a step whose mean change is 22 or more and at least 3 × the steps before and after (and 3 × 2). ClipRefine `:59-60, 79-91`.
10. **[both]** The loop ends on the last cut 5000 to 9000 in; else at 8000 or where the frames end. ClipRefine `:123-126`, `PR/canvas/ClipRepository.kt:260-261`.
11. **[both]** Flashing (WCAG 2.3.1): a step that moves 25% of the cells by 26 or more is a flash; 7 changes of direction within 1000 ms is flashing. While the loop flashes, it ends on an earlier cut (5000 or more); if it still flashes, another part is tried once; if that flashes too, no canvas. ClipRefine `:61-65, 94-117, 195-198`; ClipRepository `:191-205`.
12. **[both]** The loop starts on the key frame at or before its start. `PR/canvas/VideoCanvas.kt:14`. Phone `FEAT/VideoCanvas.java:130`.

Cases: `bars`, `still`, `windows`, `choose`, `cropX`, `loopEnd`, `judge`.

## 8. Display

1. **[both]** A video that is not tall fills the player. Only a tall clip (height / width over 1.2 and under 1.45: Apple's 3:4) stops at its own edge and fades into the backdrop. Phone `FEAT/AnimatedCover.java:170-174`, `FEAT/FullArt.java:447-448`. Original: BitChord's portrait clip `BC/data/canvas/AppleMusicCanvas.kt:313-315`.
2. **[both]** The clip's fade: the banner height × 0.42 over where the clip ends, clamped to 0..1 (0 when it has no end). `BCU/NowPlayingScreen.kt:288, 1548-1550`.
3. **[both]** A clip's black bars are zoomed out of view. Phone, on the playing frame: rows under grey 24 from the top and bottom, each at least 1/16 of the height, the picture at least half the height; zoom at most 1.6. `FEAT/AnimatedCover.java:190-210`. No original.

4. **[all] Readable over any art.** White text and controls stay readable over the canvas, the motion art and the cover backdrop, however light: every backdrop we draw has a scrim, and a light one is darkened until its bright tenth (90th-percentile luma) is at most 128 of 255. Why: on Taylor Swift's Fortnight (a near-white cover, with Apple motion art) the phone's white title, time and controls were unreadable (2026-11-24).
   - **Phone:** a scrim over every backdrop, plus extra darkening from the cover's 90th-percentile luma above 128, brought down to 128.
   - **PC:** our one backdrop layer, the music video behind the lyrics (`#vivi-lyrics-canvas`, `src/plus/plus.css`), is drawn at `brightness(0.5)`, so no pixel goes over 128 even on a white frame. Live in Firefox on Fortnight, 2026-11-24: the lyrics stood at about 7:1 against it for white. The full-page cover backdrop (Kawarp, `src/kawarp-bg.js`) and the pill player (`src/canvas.css`) are upstream's; their files are not edited. Upstream's pill is white glass that brightens what is behind it, so its white time and controls stood at about 3.3:1 on Fortnight. A vivi+ override in `src/plus/plus.css` darkens the pill's backing instead (backdrop `brightness(0.75)` under a 40% black tint, a faint sheen kept, the shape, rim and shadows upstream's; upstream's opaque pill kept for reduced transparency): even over white it stays near 0.45 sRGB, about 5:1. Measured again on Fortnight, 2026-11-24: the time about 8.3:1, the controls 9.1:1, the title 10.9:1.

Cases: `display`.

## 9. Backdrop: BitChord mesh

Original: `BCU/ArtworkMeshBackdrop.kt`, `BCU/NowPlayingScreen.kt`. Phone: `FEAT/ArtMesh.java`, `FEAT/ArtBackdrop.java`.

1. **[phone only: the PC draws YouTube Music's own page]** A 6 × 6 grid of the cover's colours (`MESH_GRID`), read about every 1/128 of each side, smoothly resampled to 32 × 32 texels (`MESH_TEX`), blurred by 3 box passes of radius 1. BC mesh `:536, 549, 558-559, 582, 596-646, 697-721`. Phone `FEAT/ArtMesh.java:12, 19-38, 68-97`.
2. **[phone only]** Each cell's colour is lifted before resampling: saturation × 1.12 (at most 1), lightness at least 0.045. BC mesh `:747-755`.
3. **[phone only]** Rows below the seam are mirrored and shifted by a seeded random. BC mesh `:677-691`.
4. **[phone only]** A clip's mesh is read again every 3000 ms; a new mesh fades in over 900 ms. BC `NowPlayingScreen.kt:302`, mesh `:571`. Phone `FEAT/ArtBackdrop.java:48`.
5. **[phone only]** The cover's lowest 0.42 fades into the mesh. `NowPlayingScreen.kt:288`. Phone `FEAT/ArtBackdrop.java:50`.

Cases: `backdrop` (`meshLift`).

## 10. Backdrop: Metrolist bleed

Original: `ML/commonMain/kotlin/com/metrolist/shared/ui/player/FullscreenArtworkBleed.kt`. Phone: `FEAT/ArtBackdrop.java`, `FEAT/FullArt.java`.

The bleed is phone-only because it is blended onto YouTube's own art. A player that draws its own backdrop instead (the PC redraws none; BitChord has its mesh, §9) marks this section not applicable.

1. **[phone only: blended onto YouTube's own art; not applicable to a player with its own backdrop]** The cover reaches 0.6 of the player's height, zoom 1 to 1.6, sides cropped. Bleed `:82-83, 120-122`.
2. **[phone only]** Below the cover: its bottom 18% (at least 2 rows), flipped and stretched (Catmull-Rom). Bleed `:78, 333-374`.
3. **[phone only]** Blur by depth (rows over the container width): 0 down to 0.70, then 250 × ((r − 0.70) / 0.85)^1.8 px at 1080 wide, full at 1.55; blended between the two nearest of {0, 1, 2, 3.5, 5.5, 8, 11, 15, 20, 27, 36, 48, 63, 82, 105, 135, 170, 210, 250}; 3 passes. Bleed `:51-59, 408-411, 427-429, 463`.
4. **[phone only]** Detail rows start at min(0.70 × width, art height − 48), on a multiple of 4; 0.40 of the width below that is drawn at full size, the rest at quarter size. Half size from sigma 4, quarter from sigma 8. Bleed `:66-72, 126-127, 156-163`.
5. **[phone only]** Tone: from the 10%-45% darkest pixels, saturation at most 0.5, lightness × 1.15 within 0.07..0.30; mixed in by 0.90 × smootherstep((r − 0.90) / 0.95). Bleed `:60-64, 298-327, 468`.
6. **[phone only]** The first 48 rows fade in; grain: a 64 px tile at alpha 3. Bleed `:73-74, 79, 102-106, 267-277`.
7. **[phone only]** Canvas crossfade 300 ms; the blurred art's scrim 0.12; full-screen blur 48 dp, clip bleed 24 dp. `ML/commonMain/kotlin/com/metrolist/shared/ui/player/CanvasLayers.kt:26`, `PlayerArtworkBackground.kt:970-972`.

Cases: `backdrop` (`blurRadius`, `bleedRows`, `coverZoom`, `stripRows`).

## 11. Quality badge shimmer

Original: `BCU/PlayerControls.kt:1861-1924` (ShimmerText), `BCU/PlayerChrome.kt:24-33`. Phone: `FEAT/PlayerScreen.java:987-1108`. PC: `src/plus/plus.css:467-482`.

1. **[both]** A confirmed lossless badge shimmers: the text at white 0.55; a band 0.6 × the text width each side of its centre, full white at the centre, sweeping left to right in 3000 ms, linear, restarting; the centre goes from −band to width + band. Painted SrcIn over the glyphs. PlayerControls `:1881-1922`.
2. **[phone only: the PC has no Plus-blended chrome]** Additive chrome, BitChord's PlayerChrome rule (the `chromeWhite` cases): every white is 0.15 lower, full white is 0.73. PlayerChrome `:24, 27, 32-33`. Phone `:987-993`.
3. **[phone only: phone layout]** The icon shimmers too, peaking at full white; the row sits 16 dp below the bar's middle and a third of the glyph's width left of centre. Phone `:1025, 1104, 1180`. No original.

Cases: `badge`.

## 12. Where the apps differ

The original is the rule. Each line: what, where.

### Phone against its original

The phone's 428206d (2026-11-19) brought Apple's scoring (brackets kept, no "and" split, the album in
the term and the score, BitChord's motion urls), Spotify's album and length checks, Prism's full
MusicVideoMatch, BestPart, `noFrames`, `choose`, the still refusal, the flash fallback's other part
and `cropX` to the original. What is left (line numbers from before that commit; some have moved):

- Source order: Apple runs only when `canvasApple=1` (off by default), and the music video is off whenever Spotify is (`canvasSpotify=0`). Metrolist switches Apple with animated covers and the other two with Canvas. `FEAT/AnimatedCover.java:423-425` vs `AnimatedCoverSelection.kt:43-46`.
- Source order: no wait for a source still loading; each source is asked in turn. `FEAT/AnimatedCover.java:467-593` vs `AnimatedCoverSelection.kt:140`.
- Cache key: Apple's key holds `|tall`, not the source order; BitChord's holds `spotifyFirst`. `FEAT/AnimatedCover.java:438` vs `CanvasRepository.kt:159-160`.
- Apple: the normaliser keeps non-Latin letters; BitChord's keeps a-z and 0-9 only. `FEAT/AppleCanvas.java:189-191` vs `CanvasArtwork.kt:73-79`.
- Apple: at most 3 albums read per lookup. `FEAT/AppleCanvas.java:80`.
- Apple: a fallback to the iTunes album page (Prism's). `FEAT/AppleCanvas.java:116-147`. Not in BitChord.
- Apple: YouTube's player gives no album, so the album part of the term and score is null in use.
- Spotify: the primary artist is cut from the artist line; Metrolist takes YouTube's first artist. `FEAT/SpotifyCanvas.java:100`.
- Music video: no pairing, no official-type check, no second try with other videos. `FEAT/VideoCanvas.java:246-260` vs `ClipFinder.kt:104-136`.
- No chorus source: `choose` takes the chorus as a parameter, null on the phone today.
- No face-based crop (ClipRefine `sceneCrops`, `closeUp`); `cropX` is Prism's 0.32 band. `PR/canvas/ClipRefine.kt:132-224`.
- Mesh: cells sampled every min(w, h)/96 px; the lift is applied after resampling and blur, not per cell before; rows below the seam are flipped and turned one column per row (no seeded random). `FEAT/ArtMesh.java:22, 44-61, 90-95` vs BC mesh `:605-606, 637, 677-691`.
- Backdrop: song-change crossfade 350 ms (Metrolist 300); scrim 0 (Metrolist 0.12). `FEAT/ArtBackdrop.java:43, 46` vs `CanvasLayers.kt:26`, `PlayerArtworkBackground.kt:972`.
- Badge: the band spans glyph, gap and text (BitChord: the text only); the glyph peaks at full white. `FEAT/PlayerScreen.java:1101-1105` vs PlayerControls `:1911-1913`.

### PC against the original

Fixed on the PC on 2026-11-19, so the cases pass: Apple's inline motion art without an album id and the static still (`src/plus/bg-plus.js`, a replaced `searchAndFetchMotion`); Spotify's album and length checks (`src/plus/bg-canvas.js` `matches`); the music-video match, BestPart, `noFrames`, `choose`, `judge`, `cropX` and the still refusal (`src/plus/video-canvas-page.js`, ports of Prism). What is left:

- Apple: the album is added to the term unless the term (with the artist) holds it; BitChord checks the title only. `src/apple-canvas.js:207` vs BC `:55`.
- Spotify: the length is the player's own, read by the song's id while it plays (`video-canvas-page.js` `playingLength`, passed on by `video-canvas.js`), asked for the song's id with or without the music video (the page's `length` op when the video canvas is off or already knows the song has none); the length isn't checked only when the player is on another song by then. The album is the player bar's.
- Spotify: a miss is kept 24 h in memory only, keyed `artist—title`, plus the length to 10 s when known (another version is asked again); a hit in `chrome.storage` with no expiry. `src/plus/bg-canvas.js`.
- Music video: the song's length is the player's own, by id, so lookups run for the playing song only; the PC never looks one up ahead (the page's `prefetch` op has no caller).
- Music video: no YouTube pairing (searched, as the phone). The gate, the second search and the song's own video as it is (§5 rules 7-11) are built (`src/plus/video-canvas-page.js` `titleSays`, `findOn`, `tryVideo`); "not a song" is read from the playing song's player answer (`musicVideoType` `PODCAST_EPISODE` or `PRIVATELY_OWNED_TRACK`, `isLive`), so a song looked up while another plays counts as a song. The type check costs one `WEB_REMIX` player request per video tried.
- The chorus (§6 rule 11) comes from the lyrics upstream's lyrics view fetched (`src/plus/video-canvas.js` wraps `fetchBestLyrics` and sends the lines to the page, op `chorus`); when they arrive after the storyboard was judged, that clip is made without it. No face-based crop.
- Display: bars are zoomed out by the storyboard's bars (keep share 0.5 to 0.98, no 1.6 cap); no tall-clip rule. `src/plus/video-canvas.js:56-64`.
- No mesh, no bleed. Badge: CSS only, no additive chrome. `src/plus/plus.css`.
- Settings (§13), built on the PC 2026-11-20 (`src/plus/canvas-settings.js`, the popup's Canvas panel, `content.js` hooks `VP.canvasOrder` and `fetchSpotifyCanvas(track, which)`): rules 1-3, 5-7, 9 and 10 as written. The PC's own ways: the Canvas master switch is upstream's `spotifyCanvasEnabled`, the animated covers one upstream's `enabled` (Apple Music Animated Artwork); the old two-way "prefer" becomes the order once (Apple first only if it was picked). Rule 5: the cache keeps Apple's master list, and the quality locks the hls.js level at play time (`src/plus/apple-player-plus.js`), so the quality isn't in the key and a change applies at once. Rule 6: Auto is 720p, as the PC builds its own clip from the DASH stream (no player to leave it to). Rule 7: Full video is the whole stream remuxed and looped; one over 40 MB is kept in memory only. The quality and mode are in the clip cache's id (`mv_<id>|<height>[|full]`). Rule 8: `src/plus/apple-artist-header.js` (the YT Music artist page's header: the image, then the video over it in upstream's Apple player) and `appleArtistHeader` in `src/plus/bg-plus.js` (the iTunes artist id by exact name, ambiguous = none; Apple's artist with its artwork and motion video, wide 16:9 then fullscreen 16:9 then square; the video variant picked by the quality; storage-kept 30 days, misses 7). The storefront is the browser's region and the language its first part, not YouTube's content country. The older `appleArtistArtEnabled` (on by default) is separate: it tints the player from Apple's artist colours.
- Best part (§14), built on the PC 2026-11-20 (`src/plus/best-part.js`; the part from `video-canvas-page.js` op `bestpart`, with `snap`, `bestPartShows`): no beat grid, so the snap's bar step is skipped (a second before instead); the curve is the one the music video canvas already reads (kept in memory, 20 songs), not kept 30/7 days, and the next song's is not fetched ahead (rule 7); the chorus only when upstream's lyrics view fetched the lyrics, which then moves the part (a pushed `bestpart`). The button sits above the player bar, not under a seek bar; Your best part is kept in `chrome.storage.local` `viviBestPartMine` (500 songs, oldest first out). Rule 6 (Play from the best part in the song menu) is not built. Rule 8 built 2026-11-20 (storage.local `bestPartButton`, a popup switch under the music video canvas rows); with the button off, a right-click on the seek-bar mark opens Your best part (it also does with the button on).
- One song's canvas (§15), built on the PC 2026-11-20: YT Music's song menu isn't ours, so the rows are behind a Canvas button on the player page's art (`src/plus/canvas-menu.js`); the choices are kept in `chrome.storage.local` `viviCanvasChoices` (2000 songs) by `src/plus/video-canvas.js`, which sends them with each lookup (the page's `find` `choice`, part of the clip cache's id); `content.js` hook `VP.reCheckCanvas` shows a change at once, and `VP.canvasOrder` applies the song's switches and Use. The PC's own ways: the Spotify canvas and Animated cover switches show while their source is on, not only for a song known to have one (the PC doesn't know before it asks), and Use is offered when the song has a loop and another source is on for it; a part shows its time, no still; "not a song" isn't known to the menu, so Pick another video shows for any song (the lookup itself still refuses one, §5 rule 7); Not this video leaves the old loop in the clip cache until it is pushed out (80 MB), as it is no longer asked for. §5 rule 12 is built (`video-canvas-page.js` `findVideo`, `pick` with `lyricsOk`).

## 13. Settings

Original: Metrolist's Artwork page, `ML/commonMain/kotlin/com/metrolist/shared/ui/settings/AppearanceSettingsRegistration.kt:733-866`, with `ML/commonMain/kotlin/com/metrolist/shared/settings/Settings.kt` (`Settings.kt`) and `ML/commonMain/kotlin/com/metrolist/shared/ui/settings/SettingsFeatureControls.kt:100-175` (the source list). Where a setting is shown is each app's own (the phone's settings screen, the PC's popup); what it does is the rule.

1. **[both]** Two master switches: **Canvas** (the music video and Spotify) and **Animated covers** (Apple). A source whose master switch is off is greyed out in the list and never looked up. The music video also needs music-video playback on, where an app has that switch. `Settings.kt:409-417`, `AnimatedCoverSelection.kt:43-46`, `SettingsFeatureControls.kt:127-129`. Defaults: Metrolist ships both off (`Settings.kt:409, 705`); our apps ship canvas on, a deliberate difference.
2. **[both]** **Sources:** one row per source in the current order (music video, Spotify, Apple by default; §1), each with up and down to swap it with its neighbour and its own on/off switch. Turning a source off keeps its place in the order. `SettingsFeatureControls.kt:115-175`.
3. **[both]** How the two lists are stored and read (`AnimatedCoverSelection.kt:28-39`, `SettingsFeatureControls.kt:168-171`):
   - the order: source names joined by commas; unknown names are dropped, a repeat counts once, and sources missing from it follow in the default order;
   - the sources on: empty means all on; all off is stored as `NONE` (read as none on), never as empty;
   - the ids are ours: `video`, `spotify`, `apple` (Metrolist: `YOUTUBE_MUSIC_VIDEO`, `SPOTIFY_CANVAS`, `APPLE_MUSIC`).
4. **[phone only: a browser can't tell mobile data reliably (Firefox has no `navigator.connection`)]** **Off on mobile data**, default off. When on and the network is mobile data, no canvas or animated cover is looked up or played, artist videos included. `Settings.kt:706-709`. Metrolist hides it on desktop: `AppearanceSettingsRegistration.kt:773-779`.
5. **[both]** **Animated cover quality:** 360p, 720p (default), 1080p or Original; disabled while animated covers are off. Apple's HLS master list is read and the variant picked is the one with the most pixels (ties: the higher `BANDWIDTH`) whose shorter side is at most the cap (Original: no cap); when none fits, the one with the fewest pixels. Only trusted `.m3u8` variants count. The quality is part of the cache key (with `:tall` for the 3:4 clip). `Settings.kt:713`, `ML/commonMain/kotlin/com/metrolist/shared/api/artwork/AnimatedArtworkService.kt:1195-1245, 1276-1282`, `AnimatedCoverSelection.kt:48-51`.
6. **[both]** **YouTube canvas quality:** Auto, 2160p, 1440p, 1080p, 720p or 480p (default); the music video's stream is asked for at that height, Auto leaves it to the player. Changing it looks the song's video canvas up again. `Settings.kt:722`, `ML/commonMain/kotlin/com/metrolist/shared/settings/SettingEnums.kt:143-160`, `ML/commonMain/kotlin/com/metrolist/shared/viewmodels/PlayerViewModel.kt:782`.
7. **[both]** **YouTube canvas mode:** Clips (default) or Full video. Full video plays the whole music video, muted. Clips plays the part picked by §6-7; this is ours. Metrolist's clips are 4 random 3000 ms parts of the video (`AnimatedCoverSelection.kt:12, 55-79`), which our clip picking replaces. Metrolist shows both YouTube settings on Android only (`AppearanceSettingsRegistration.kt:824-866`).
8. **[both]** **Artist images** and **Artist videos** from Apple Music, for the artist page's header: two switches, both off by default (videos follow images until set), and an artist video quality with the same choices as rule 5, default 720p. Keyed by the storefront country and language, the artist's name, both switches and the quality. `Settings.kt:711-714`, `AnimatedArtworkService.kt:275-290`. Metrolist hides them on iOS.
9. **[both]** **Spotify sign-in:** one row under the Canvas switch: Sign in while signed out, and while signed in "Spotify connected" with Sign out (§4 rule 0). No password or cookie is typed into the app. Until 2026-11-24 this rule said "no Spotify login"; that was wrong.
   - **[PC]** Upstream's Connect and Disconnect (`spotifyConnectFromBrowser`, `clearSpotify`, made disconnect-safe in a1e4144): Connect opens open.spotify.com (or brings forward an open Spotify tab that is not in a container or a private window) and waits up to 2 minutes for the listener to sign in there. The pasted-cookie field is hidden, and the row shows no part of the cookie. Sign in and Sign out answer the add-on's own pages only, never a content script.
   - **[phone only]** A sign-in screen with Spotify's own login page (a web view); the `sp_dc` cookie is read from it once the listener is signed in, and kept in the app's private storage.
10. **[both]** A change to the order, the sources on, the mode, either quality or a master switch clears the "failed" marks, so the new choice is tried at once. `ML/commonMain/kotlin/com/metrolist/shared/ui/player/PlayerScreen.kt:647-655`.
11. **[phone only]** From Morphe 2.4 stable, Morphe's own "Apple Music animated artwork" (#5082) is the phone's Apple source, and the phone drops its own Apple fetch. Our source order and switches (rules 1-3) still decide when Apple shows; there is no guard against Morphe's switch. Until 2.4 is stable, the phone keeps its own Apple fetch. (A base app's feature wins: `spec/README.md`.)

Cases: `settings` (`settingsOrder`, `settingsEnabled`, `appleVariant`).

## 14. Best part (Most replayed)

Original: Prism `PR/BestParts.kt`, `PR/BestPart.kt:103-142`, `Prism/app/src/main/java/com/prism/music/ui/player/PlayerControls.kt:395-404, 488-560` (`PC/` below), `.../ui/player/PlayerSheets.kt:236-300` (`PS/`), `.../playback/PlayerConnection.kt:636-647`. The same curve and chorus as the canvas (§6), used to jump in the song itself.

1. **[both]** The playing song's best part, in ms of the song: the listener's own (rule 5) if set; else the start of its most replayed stretch (§6 rules 1-8, the song's own curve); else its chorus (§6 rule 11); then snapped (rule 2). None for live streams, podcast episodes and local files. `BestParts.kt:52, 85-93`.
2. **[both]** Snap: the lyric line starting within 4000 before to 1500 after the target that is nearest, a line after counting 1500 farther; the answer is that line's start − 250 (at least 0). Without such a line: the bar line before the target on the song's beat grid (first beat + whole bars of 4 beats) when its tempo is steady; else 1000 before the target (at least 0). `BestPart.kt:126-142`. An app without a beat grid for the song skips the bar step.
3. **[both]** The **Best part** button, under the seek bar: up while the best part is at least 3000 ahead and the song is before min(max(30 000, the moment it became known + 15 000), 45 000). A click seeks to it; holding it (the PC: a right-click) opens Your best part. It reads **Your best part** with a filled flame when the listener set it. `PC:492-560` (`BestPartButton.shows`).
4. **[both]** A mark on the seek bar at the best part, when it lies between 1% and 99% of the song. `PC:401-404`.
5. **[both]** **Your best part**, per song and kept: it opens at the listener's own, else the automatic best part, else where the song is now; a bar to pick a moment, −5 s and +5 s, Now, Listen from here, Save; with one saved, Forget (worded "Back to the part people replay" when an automatic one exists). The saved one wins everywhere a best part is used. `PS:236-300`, `BestParts.kt:24-40`.
6. **[both]** **Play from the best part** in a song's menu (not for episodes or live): plays the song from its best part, allowing 5000 to find it; without one, from the start, saying so. `PlayerConnection.kt:636-647`, `Prism/app/src/main/java/com/prism/music/ui/components/Components.kt:725`.
7. **[both]** Curves are kept 30 days, a song without one 7 days; the next song's curve is fetched while one plays. `BestParts.kt:56-77, 118-123`.
8. **[both]** A setting, **Best part button**, on by default: off, the button (rule 3) is not shown; the mark, Your best part and Play from the best part stay. Prism `.../data/prefs/Settings.kt:1698, 2088` (`bestPartButton`), `:941`.

Cases: `snap`, `bestPartButton`.

## 15. One song's canvas (the song's menu)

Original: Prism `Prism/app/src/main/java/com/prism/music/ui/player/PlayerOptions.kt:284-340` (`PO/` below), `.../ui/player/CanvasControls.kt:82-102` (`CC/`), `.../ui/player/CanvasSongSheets.kt` (`CS/`), `PR/canvas/ClipRepository.kt:40-121` (`CR/`), `PR/canvas/ClipFinder.kt:53-62, 104-115`, `.../data/innertube/YouTubeMusic.kt:942-951` (`YTM`). BitChord: `shared/.../data/canvas/ForkCanvasChoices.kt`. What the listener says about one song's canvas, from the player's song menu. Every choice is kept per song and makes the player look at the song's canvas again at once (as §13 rule 10).

1. **[both]** **Canvas** for this song (the loop from the music video), a switch: shown while Canvas and its music video source are on, for a song (§5 rule 7) that has a loop, and it stays after it was switched off for the song (the only way back). Off: no music video is looked up or shown for the song; the next source in the order shows. `CC:89-90`, `PO:327`.
2. **[both]** The same switch for **Spotify canvas** and **Animated cover** (Apple), each shown while its source is on, for a song that has one, and kept after it was switched off. With Spotify's canvas and the loop both there, only the one that shows is checked; turning the other on makes it the song's choice (rule 7). `CC:82-83, 93`, `PO:312-326`, `CS:76-86`.
3. **[both]** **Pick another part**: shown while the song's loop from the music video shows. It offers the part playing (marked) and up to 4 others: the runners-up of §7 rule 7 at least 15 000 from the loop's start, each as a still (the storyboard frame nearest its start) or its time ("1:04"). `CR:40-50, 264-265`, `ClipFinder.kt:194`, `CS:118-145`.
4. **[both]** A part picked: the loop becomes 8000 from its start, in the same video, cut to the real frames when it is next made (§7 rules 9-11). It is the listener's: a new lookup never moves it while its video still passes. The part it was takes the picked one's place among the others; picking the part already playing only marks it as the listener's. `CR:63-83` (`pickPart`), `ClipFinder.kt:106-115`.
5. **[both]** **Pick another video**: shown for a song while Canvas and its music video source are on and the loop isn't switched off for the song, also when the song has no loop yet. It offers up to 10 videos: YouTube's own pairing first (none signed out, §5 rule 6), then what a video search for `title artist` finds, in its order, nothing judged, none the listener turned away (rule 6). Each shows its picture (`https://i.ytimg.com/vi/<id>/mqdefault.jpg`), title and who posted it; the one in use is marked. None: "No videos found for this song". `CC:101-102`, `YTM:942-951`, `ClipFinder.kt:53-55`, `CS:147-180`.
6. **[both]** A video picked goes through the gate as the song's own (§5 rule 11): only what can't make a loop refuses it (not playable, no stream, a still), and then the song keeps what it had and the listener is told "That video can't make a loop". Taken, it is the listener's: every later lookup asks it first, as it is, and the song uses its music video even where another source comes first. `CR:94-106`, `ClipFinder.kt:57-62, 106-108`.
7. **[both]** **Use** (the song's source): for a song with both a loop and an animated cover (or Spotify canvas), neither switched off for it: which of them it shows, kept for the song over the order of §13 rule 1. `CC:95-98`, `PO:336-340`, `CR:52-61`.
8. **[both]** **Not this video**: shown while the song's loop from the music video shows. That video goes on the song's list of turned-away videos for good: no lookup takes it again and Pick another video leaves it out; the loop and the files kept of it go; the song shows the next source. With the search the apps use (no pairing), the lookup that follows leaves the turned-away videos out of the results and may find another. `CR:108-120`, `ClipFinder.kt:110-112`. Prism, whose first video is YouTube's pairing, shows no loop when the pairing is a turned-away video (`REJECTED`).
9. **[both]** What is kept for a song: its switches (rules 1-2), its picked part and picked video, its turned-away videos and its Use. A song nobody chose anything for keeps nothing. The loop made for a choice is its own cache entry, so going back to an earlier choice finds that loop again. `CR:20-61`; BitChord `ForkCanvasChoices.keySuffix`.
10. **[both]** **Reset this song's canvas**: shown only while the song has any choice of rule 9 (a switch off, a Use, a picked part, a picked video or a turned-away video). It forgets them all at once: the song keeps nothing, and its canvas is looked up again as for a song nobody chose anything for (the official video and its default part come back), and the row goes away. Without it, Not this video and a song's picks have no way back. Phone: Vivimusic 4333891.
11. **[all]** The wording (the user's ruling 2026-11-26: a lone switch read like a copy of the menu's switch for all songs). The dialog's title is **This song only**. Each switch of rules 1-2 reads "<source> on this song" (Music video, Spotify canvas, Animated cover), with the line under it "Off hides it for this song only. <the switch for all songs> in the menu is for all songs." Each app names its own switch and place: the phone's menu switches ("Animated covers" for the animated cover); the PC's panel ("Canvas" for the music video and Spotify canvas, "Apple Music Animated Artwork" for the animated cover, and "in the panel" for "in the menu"). PC: `src/plus/canvas-menu.js`.

Cases: `songMenu` (which rows show), `pickPart` (the parts after a pick), `videoChoices` (the list offered), `songReset` (when Reset shows).
