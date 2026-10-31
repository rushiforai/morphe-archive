# SponsorBlock for YouTube VR — anchors, API contract, and build notes

*Status: **implemented and device-verified** (2026-10-10; the `manual-skip` behaviour — "Show a Skip
button" — added and verified 2026-10-14, Addendum 19). The patch (`SponsorBlock`, on by default since
2026-10-11) and the extension (`SponsorBlock*.java`, `SkipButtonCard.java`) are written, the bundle
builds, the patched dex has been verified hook-by-hook, and the installed build was play-tested on the
headset — the addenda below are that record, including the bugs it exposed, all fixed.*

*What each section is for now: **§1** the public API contract, **§2** how the phone patch set solves
the same problem, **§3** the measured player anchors this patch's fingerprints exist for (cited by
`SponsorBlockPatch.kt`), **§7** the licence and ToS position, and the appendices and **addenda** the
build log. The pre-implementation plan — its design options, verification plan and task checklist —
was removed on 2026-10-14: it described work that is finished, and its two open questions (position
accessor, seek result) were answered while building, by the bridge methods the patch now generates on
the player wrapper and by the `onSeeked` hook respectively. `git log` has the removed text if a
design question it debated ever comes back.*

*Measured against YouTube VR 1.88.10 (the version this repo supports).*

## 1. The feature and its API contract

SponsorBlock is a crowd-sourced segment database (sponsors, self-promos, intros, …) keyed by YouTube
video id. The phone patch set fetches segments for the video being watched and skips the ones the user
has enabled.

Public API, two ways in:

| endpoint | notes |
|---|---|
| `GET https://sponsor.ajay.app/api/skipSegments?videoID=<id>&categories=[...]` | **what Morphe's implementation actually uses** (`requests/SBRoutes.java`), since the first Morphe import — no hash prefix, no `MessageDigest`, anywhere in its SponsorBlock code. There is also `POST /api/skipSegments?userID=…` for submitting/voting (out of scope). It does tell the server which video you are watching. Whether this form is deprecated or can be disabled is **unknown** (the API docs list both forms as valid and say nothing about deprecation) |
| `GET https://sponsor.ajay.app/api/skipSegments/<sha256(videoID)[0:5]>?categories=[...]&actionTypes=[...]` | the privacy-preserving form used by the official browser client: a **single-pass** SHA-256 hex digest, first 5 chars, then **filter the response by exact `videoID`** (verified: prefix `671ea` of `aqz-KE-bpKQ` returned a *different* video). This repo has precedent for the idiom in the DeArrow client. Morphe gives no precedent, so treat it as an optional enhancement |

Response shape (array of per-video objects):

```json
[ { "videoID": "dQw4w9WgXcQ",
    "segments": [ { "UUID": "…", "category": "sponsor", "segment": [12.34, 45.67],
                    "actionType": "skip", "locked": 0, "votes": 3, "description": "" } ] } ]
```

- `segment` is `[startSeconds, endSeconds]`, **floats in seconds** → multiply by 1000.
- `actionType` is one of `skip`, `mute`, `full`, `poi`, `chapter`. **Morphe never reads the field**, so a returned `mute`/`full` segment would be treated as a skip — it relies on the server's default filter. A VR port should not: **send `actionTypes=["skip"]`** (or drop segments whose `actionType != "skip"`).
- Category identifiers as Morphe's enum defines them: `sponsor`, `selfpromo`, `interaction`, `poi_highlight`, `intro`, `outro`, `preview`, **`hook`**, `filler`, `music_offtopic`, plus `unsubmitted` (internal, never sent). The server also knows `exclusive_access` and `chapter`, which Morphe drops with a log line — ours can do the same, or map them.
- 404 is **not an error**: "no segments for this video" is the normal empty answer.
- Etiquette: send a `User-Agent` that identifies the client, cache per video, do not poll, use the hash-prefix endpoint if privacy matters. A `userID` is only for voting/submitting, and the API asks that submissions never be automated.

## 2. How the phone patch does it

Morphe **does** ship SponsorBlock (the phone patch set this repo's bundles come from). Everything
below is read from `MorpheApp/morphe-patches`, and it is the design to copy — including the split that
makes the port tractable.

**Where it lives**

```
extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/sponsorblock/
    SegmentPlaybackController.java     the feature: segments, skip decisions, undo, button state
    SponsorBlockApi.java               the host-app adapter surface (see below)
    SponsorBlockHelpers.java
    objects/  SegmentCategory, CategoryBehaviour, SegmentCategoryPreference, SponsorSegment, UserStats
    requests/ SBRoutes (+ the requester that fetches and caches segments)
    ui/       the phone-only presentation
patches/src/main/kotlin/app/morphe/patches/youtube/layout/sponsorblock/
    SponsorBlockPatch.kt               hooks + options (category colours, settings screen, seekbar)
    Fingerprints.kt                    AppendTime, ControlsOverlay, RectangleFieldInvalidator,
                                       AdProgressTextViewVisibility -- all *presentation*
```

**The architecture that matters: an adapter boundary.** The feature code never touches obfuscated app
members directly. It asks `SponsorBlockApi` for what it needs, through nested adapters —
`VideoInformationAdapter` (`getVideoTime()`, `seekTo(ms)`), `PlayerStateAdapter`
(`playerControlsVisible()`, `isPlayerTypeNoneOrHidden()`), `SettingsAdapter`, `UiBridge`,
`Configuration` (API URL, user id, channel whitelist). The patch supplies the implementations. **Port
that shape**: our VR hooks then live in exactly one adapter, and the skip logic stays app-agnostic
(and reviewable without the obfuscation map).

**How it is driven.** The app calls `SegmentPlaybackController.setVideoTime(long millis)` — documented
in the source as *"Injection point. Updates SponsorBlock every 1000ms. When changing videos, this is
first called with value 0 and then the video is changed."* So the phone's position feed is a **1 Hz
callback with the current media time**, and all the work happens inside it. It early-returns when:

- the feature is off, or
- the player type is none/hidden (Shorts), or
- there are no segments for this video, or
- **the ad progress text is visible** (`isAdProgressTextVisible()`) — i.e. the phone build explicitly
  refuses to skip while an ad is on screen. Copy that rule.

**The skip decision itself**, in order of what a port actually needs:

```java
shouldAutoSkipAndUndoSkipNotActive(segment, currentVideoTime) =
        segment.shouldAutoSkip()                       // category behaviour == skip / skip-once
     && (undoAutoSkipRange == null || !undoAutoSkipRange.contains(currentVideoTime));

skipSegment(segment, userManuallySkipped):
        boolean ok = video().seekTo(segment.end);      // seeks to the segment's END
        // ... records the skip so it is not repeated, updates "skipped" stats, hides the button
```

Small details worth not rediscovering: a `hiddenSkipSegmentsForCurrentVideoTime` set (segments the
user undid are not re-skipped in that video), `adjustedDuration = seconds * 1000 - 200` (a 200 ms
guard at the end of a segment), `minTimeBetweenStartEndOfSegments = 1000` (merge/avoid thrash when
two segments abut), and an undo path that seeks back to the range's lower bound.

**Categories** are an enum keyed by the API identifier — `sponsor`, `selfpromo`, `interaction`,
`poi_highlight`, `intro`, `outro`, `preview`, `filler`, `music_offtopic` — each carrying a
`CategoryBehaviour`: `skip`, `skip-once`, `manual-skip`, `seekbar-only`, `ignore`. The `categories`
query parameter sent to the API is built from every category whose behaviour is **not** `ignore`
(`SegmentCategory.java`), which is exactly the option surface a VR port should expose — minus
`manual-skip`/`seekbar-only`, which are UI behaviours, not skipping behaviours.

**What is presentation and can be dropped**: `SponsorBlockPatch.kt` sets seekbar segment colours and
thickness, draws segments on the phone seekbar (`SeekbarOnDrawFingerprint`,
`RectangleFieldInvalidatorFingerprint`, `setSeekbarRectangle`), rewrites the remaining-time text
(`AppendTimeFingerprint` → `appendTimeWithoutSegments`), initialises an overlay
(`ControlsOverlayFingerprint` → `SponsorBlockViewController.initialize(ViewGroup)`) and hides the skip
button during ads (`AdProgressTextViewVisibilityFingerprint`). None of it is needed to skip; the VR
app has no Android view hierarchy where those hooks would attach.

**Precision, from a definitive read of Morphe v1.46.0** — the details an implementer needs, several of
which contradict reasonable guesses:

- **The patches have no options at all** (`patches-list.json` shows an empty `options` array for both
  the YouTube and Music `SponsorBlock` patches; the bodies contain no `option {}`). Every knob — API
  URL, minimum segment duration, per-category behaviour, toasts, button layout, channel whitelist — is
  an *extension setting* behind a settings screen we do not have. **For VR, patch options are the only
  surface, so exposing them as options is a deliberate divergence, not an oversight.**
- **The UI-less template already exists**: `MusicSponsorBlockConfig` configures the same shared code
  with `UiBridge.NO_OP`, `PlayerStateAdapter.DEFAULT` (`isPlaying=true`, `isPaused=false`),
  `channelWhitelist() == null`, `includesHighlight() == false`, `viewTrackingEnabled() == false`,
  `undoToastEnabled() == false`, `getPlaybackSpeed() == 1.0f`, and
  `availableBehaviors() = { SKIP_AUTOMATICALLY, SKIP_AUTOMATICALLY_ONCE, IGNORE }`, with the comment
  that manual/seekbar-only behaviours would be no-ops without a skip-button overlay. That is exactly
  our situation, so VR should ship those three behaviours and no others.
- **Fetch contract, exactly**: `GET {base}/api/skipSegments?videoID={id}&categories={cats}`; connect
  timeout 7000 ms, read 10000 ms; a `User-Agent` that identifies the client; **404 is success with
  zero segments**; any other status, timeout or IO error gives up quietly (no retry, no negative
  cache — the phone shows a toast, we would log). `categories` is a JSON array literal that Morphe
  percent-encodes by hand *only because its `Route.compile()` does no URL-encoding*; a normal Java
  client can just URL-encode it.
- **Morphe has no cache at all** — no TTL, no persisted store, no failure bookkeeping, one fetch per
  video-id change (the browser client's "5" is a capacity, not a TTL). A bounded per-video cache is
  **our** addition, and the obvious one for VR, where users replay and re-seek constantly.
- **Auto-skip has no look-ahead rule**: it fires the moment the playhead is inside the segment. The
  800 ms "segment nearly over" rule affects only the *manual skip button's* label, and the 1000 ms
  rule only whether a *manual* skip is scheduled. The auto-skip scheduling tolerance is
  `(long)(playbackSpeed * 1200)` ms, deliberately larger than the ~1 Hz position callback, and it is
  reused to invalidate a scheduled skip when the user paused or scrubbed.
- **`sponsor` defaults to `skip-once`** (`SKIP_AUTOMATICALLY_ONCE`, a Morphe addition — the browser
  extension has no such behaviour), which is precisely what stops a backwards seek from re-skipping a
  sponsor segment. Plain `skip` **does** re-skip after a backwards seek. Other defaults:
  `selfpromo`/`interaction`/`intro`/`outro`/`music_offtopic`/`poi_highlight` = `manual-skip`,
  `preview`/`hook`/`filler` = `ignore`. An auto-skip-only port must pick its own default set; the
  faithful "spirit" default is `sponsor` + `selfpromo` + `interaction` + `intro` + `outro`.
- **Two guards, not one**: a persistent per-segment `didAutoSkipped` flag (honoured only by
  `skip-once`), and a 500 ms re-skip guard on the *same segment object* (`max(500, 500/speed)`) which
  exists for the case where a seek was clamped just short of the segment end. The undo range is *not*
  a persistent guard: it is cleared as soon as the position leaves it.
- **The seek can refuse**: Morphe's `seekTo` clamps to `videoLength - 250` and returns **false** when
  the length is not yet known (the clamp yields -250) or when both the current time and the target are
  inside the last 250 ms; a failed seek restores the previous undo range and aborts, which is what
  makes "switching videos" harmless. **`pwe.o(J, Lablw;)V` returns void**, so a VR port needs its own
  success/failure signal — which this port gets from the `onSeeked` hook (see the heading).
- **The ad gate already has a hook here**: the phone's `setAdProgressTextVisibility(int)` is set from
  the ad-progress view's `setVisibility` and read as `== VISIBLE`. Our equivalent is
  `PotUrls.onAdCountdown(int remainingMs)` ([PotUrls.java](extensions/src/PotUrls.java)), hooked from
  both VR ad-UI countdown methods by the Extension patch. Today it only counts, so the port must
  expose a queryable boolean: set it on each tick and clear it on a short timeout (the countdown ticks
  about once a second) or on video load.
- **The phone implementation is readable offline in this workspace**:
  `apk/mpp-sh/sources/app/morphe/extension/shared/sponsorblock/` (the controller, the API adapters,
  `SegmentCategory`, `CategoryBehaviour`, `SponsorSegment`, `SBRequester`, `SBRoutes`) and
  `apk/mpp-yt/sources/app/morphe/extension/youtube/sponsorblock/` (the YouTube adapter and the UI).
  Both are gitignored, so they can vanish — re-extract from the official bundle if needed; the route
  file there matches the v1.46.0 source exactly.

## 3. What this app gives us (measured on 1.88.10)

Every hook below was found by searching the stock dex for the app's own log literal, and each one
matches **exactly one method** — verified with `apk/scratch/Inspect.java findstring` (§ reproduction
commands at the end). They are the same class of anchor this repo already uses elsewhere.

| what it is for | method | anchor (log literal in the dex) | matches |
|---|---|---|---|
| **seek** (the skip itself) | `Lpwe;->o(J, Lablw;)V` | `MedialibPlayer.seekTo(positionMillis=%d)` | 1 |
| **new video loaded** (reset state, start a fetch) | `Lpwe;->j(Lpzj;)V` | `MedialibPlayer.loadVideo(cpn=` | 1 |
| pause (stop the wall-clock tracker, if used) | `Lpwe;->D(I)V` | `MedialibPlayer.pauseVideo()` | 1 |
| seek started (user or us) | `Lpwd;->t(J, Lablw;)V` | `onSeeking(positionMillis=%d)` | 1 |
| seek finished | `Lpwd;->u(J, Lablw;)V` | `onSeeked(positionMillis=%d)` | 1 |
| progress tick | `Lpwd;->q(J)V` | `onProgressing(playbackStartSystemTimeMs=%d)` | 1 |
| seekable range changed | `Lpwd;->i(J, J)V` | `onMediaTimeRangeChange(beginTimeMs=%d endTimeMs=%d)` | 1 |

Context that matters when wiring these:

- `pwe` is the **VR player wrapper** (its own logs read `MedialibPlayer.loadVideo(...)`,
  `pauseVideo()`, `playVideo()`, `stopVideo()`, `clearQueue()`, `seekTo(...)`, `setMediaView(...)`),
  i.e. the Java side of the native `medialib` player the VR app uses.
- `pwd` is `MedialibPlayerEvents` — the **delegating listener**: every callback logs and then forwards
  to `this.d`, another `pyu`/`pzq` implementation. Three more implementations exist (`pyp`, `pys`,
  `pyt`); hooking the *delegating* one is convenient because it sees every event, but hooking the
  *terminal* one may be closer to the state the app uses. (This port hooks the delegating one.)
- The callback names and payloads (`onPlaying`, `onPaused`, `onPausedBuffering`, `onPreparing`,
  `onSeeking/onSeeked(positionMillis)`, `onProgressing(playbackStartSystemTimeMs)`,
  `onMediaTimeRangeChange(beginMs,endMs)`, `onPlaybackRateChange(rate)`, `onEnded`, `onStopped`,
  `onError`, `onTransition`) are all readable in `defpackage/pwd.java`; that file is the map of the
  player's event surface.
- **The video id is already available to the extension**: the Extension patch hooks the player-response
  constructor (`oqb.<init>`) and calls `SpoofStreams.augmentPlayerResponse(playerResponse)`, and the
  app's `zjp` proto carries video details at `g.c` (video id) with the ad slots at `n` — the same
  object the existing code already reads reflectively, resolving fields **by type** rather than by
  obfuscated name (see [FINGERPRINTS.md](FINGERPRINTS.md)'s "extension side matters" note). The
  extension reuses that call site for "what video is this" rather than a hook of its own.
- Caveat on these anchors: they are **debug log format strings**, not protocol literals. They are in
  the dex, so they anchor a fingerprint today, and if a future build strips them the fingerprint fails
  *loudly* (which this repo treats as acceptable). Note also that in a release build the app may never
  *execute* the logging — irrelevant for anchoring, since the patch injects at instruction 0 of the
  method regardless of whether its own log line ever runs.

## 4. Risks that still apply

*The two questions this section used to open with — the position accessor and whether a seek
succeeded — were answered while building (see the heading): the playhead comes from the bridge
methods the patch generates on the player wrapper, and the seek's result from the `onSeeked` hook.*

- **Re-skip behaviour is a choice, not an accident.** With `skip` (as opposed to `skip-once`), seeking
  backwards into a segment skips it again; the only automatic protection is the 500 ms same-segment
  guard. Decide per category and write it down, because it is the first thing a user will notice.
- **Log-literal anchors** can disappear if a future build strips debug logs: loud failure, but it
  means these hooks need re-derivation at the next version bump. (This is the general rule in
  [FINGERPRINTS.md](FINGERPRINTS.md); §3's table is the one this patch's fingerprints rest on.)
- **Threading**: the fetch must never run on the player/event thread; a slow server must not stall
  playback. Bounded timeouts + a background executor + "skip only with an already-fetched list".
- **Seek cost**: each skip is a real seek in the native player; overlapping segments are **not** merged
  by Morphe (it sorts by start, longer first, and handles nesting), so a port that keeps the same
  shape will issue one seek per nested segment unless it also marks contained segments as skipped,
  the way Morphe does with its `didAutoSkipped` sweep.
- **`actionType`**: only `skip` in v1; `mute`/`full`/`chapter` need different machinery (`poi` is the
  highlight jump).
- **Etiquette/abuse**: a `User-Agent` that identifies the client, a per-video cache, no polling; no
  voting, no submission, no `userID` in v1. The API asks that submissions never be automated, and the
  hash-prefix form (§1) is the privacy-preserving alternative if that matters to the reviewer.
- **Licensing (read this before copying anything)**: Morphe is **GPL-3.0 with a `NOTICE` that adds
  GPLv3 §7 terms** — derivative source *and binaries* must carry the NOTICE, modified versions must be
  marked as different and must not misrepresent origin, and there are no trademark rights to
  "Morphe". `ReVanced/revanced-patches`, Morphe's other ancestor, is **unavailable under a DMCA
  takedown** (HTTP 451, notice `2026-03-12-morpheapp.md`), so it cannot be read at all. The
  SponsorBlock **service** is separately licensed **CC BY-NC-SA 4.0** (non-commercial, attribution,
  share-alike) with "automating submissions is not allowed". This repo is GPL-3.0 with its own §7c
  name restriction. Conclusion: **reimplement from the behaviour described here and cite the files
  read**, rather than pasting Morphe code — GPLv3→GPLv3 would be compatible, but almost nothing is
  reusable verbatim (different UI, settings system and player), and any *published* fork of this repo
  still carries Morphe's NOTICE obligations.
- **Log-literal anchors** can disappear if a future build strips debug logs: loud failure, but it
  means these hooks need re-derivation at the next version bump.
- **Threading**: the fetch must never run on the player/event thread; a slow server must not stall
  playback. Bounded timeouts + a background executor + "skip only with an already-fetched list".
- **Seek cost**: each skip is a real seek in the native player; overlapping segments are **not** merged
  by Morphe (it sorts by start, longer first, and handles nesting), so a port that keeps the same
  shape will issue one seek per nested segment unless it also marks contained segments as skipped,
  the way Morphe does with its `didAutoSkipped` sweep.
- **`actionType`**: only `skip` in v1; `mute`/`full`/`chapter` need different machinery (`poi` is the
  highlight jump).
- **Etiquette/abuse**: a `User-Agent` that identifies the client, a per-video cache, no polling; no
  voting, no submission, no `userID` in v1. The API asks that submissions never be automated, and the
  hash-prefix form (§1) is the privacy-preserving alternative if that matters to the reviewer.
- **Licensing (read this before copying anything)**: Morphe is **GPL-3.0 with a `NOTICE` that adds
  GPLv3 §7 terms** — derivative source *and binaries* must carry the NOTICE, modified versions must be
  marked as different and must not misrepresent origin, and there are no trademark rights to
  "Morphe". `ReVanced/revanced-patches`, Morphe's other ancestor, is **unavailable under a DMCA
  takedown** (HTTP 451, notice `2026-03-12-morpheapp.md`), so it cannot be read at all. The
  SponsorBlock **service** is separately licensed **CC BY-NC-SA 4.0** (non-commercial, attribution,
  share-alike) with "automating submissions is not allowed". This repo is GPL-3.0 with its own §7c
  name restriction. Conclusion: **reimplement from the behaviour described here and cite the files
  read**, rather than pasting Morphe code — GPLv3→GPLv3 would be compatible, but almost nothing is
  reusable verbatim (different UI, settings system and player), and any *published* fork of this repo
  still carries Morphe's NOTICE obligations.

## Appendix: reproduction commands used for §3

```bash
# per-hook uniqueness (stock APK, one line per matching method)
java -cp apk/scratch/out;$(cat apk/scratch/cp.txt) Inspect findstring \
  apk/com.google.android.apps.youtube.vr.oculus.apk "MedialibPlayer.seekTo(positionMillis=%d)"
# -> Lpwe;->o[J, Lablw;]V      (and likewise for the other literals in the table)

# the player's whole event surface, as the app logs it
rg -n -o 'z\("[^"]+"' apk/jadx-out/sources/defpackage/pwd.java
# the VR player wrapper's operations
rg -n -o 'MedialibPlayer\.[a-zA-Z]+\([^"]*' apk/jadx-out/sources/defpackage/pwe.java
```

The `Inspect`/`Measure` harness, and what each of their modes is for, is described in
[APP-NAME-CARD.md](APP-NAME-CARD.md)'s "Artifacts and how to reproduce" section.

## Appendix: sources read

**Morphe v1.46.0** (`MorpheApp/morphe-patches`, commit `1bcd0bce`; GPL-3.0 + `NOTICE` §7). The
SponsorBlock-relevant files, all under
`extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/sponsorblock/` unless
noted: `SegmentPlaybackController.java` (the whole algorithm) · `SponsorBlockApi.java` (the adapter
interfaces) · `SponsorBlockHelpers.java` (URL validation) · `objects/{SegmentCategory,
CategoryBehaviour,SponsorSegment}.java` · `requests/{SBRoutes,SBRequester}.java` ·
`extensions/youtube/src/main/java/app/morphe/extension/youtube/sponsorblock/YouTubeSponsorBlockConfig.java`
(the injection points) · `.../youtube/settings/Settings.java` (all defaults) ·
`patches/src/main/kotlin/app/morphe/patches/youtube/layout/sponsorblock/{SponsorBlockPatch,Fingerprints}.kt` ·
`patches/.../youtube/video/information/VideoInformationPatch.kt` and
`patches/.../shared/misc/videoinformation/Fingerprints.kt` (the position hook) ·
`patches/.../youtube/video/videoid/VideoIdPatch.kt` (the video-id hooks) ·
`extensions/music/.../sponsorblock/MusicSponsorBlockConfig.java` (the UI-less template).
In this workspace the same code is decompiled under `apk/mpp-sh/sources/` and `apk/mpp-yt/sources/`.

**External**: [SponsorBlock API docs](https://wiki.sponsor.ajay.app/w/API_Docs) ·
[Database and API license](https://raw.githubusercontent.com/wiki/ajayyy/SponsorBlock/Database-and-API-License.md) ·
[segmentData.ts](https://raw.githubusercontent.com/ajayyy/SponsorBlock/master/src/utils/segmentData.ts)
(hash prefix, `actionTypes`, `trimUUIDs`) ·
[hash.ts](https://raw.githubusercontent.com/ajayyy/maze-utils/master/src/hash.ts) ·
[cache.ts](https://raw.githubusercontent.com/ajayyy/maze-utils/master/src/cache.ts) ·
`ReVanced/revanced-patches` — HTTP 451, DMCA takedown (`github/dmca/2026/03/2026-03-12-morpheapp.md`),
unreadable, so its current endpoint choice is unknown.

**Not settled by any of the above** (do not treat as fact): whether the `?videoID=` form is deprecated
or can be disabled; the server's exact `actionTypes` default for `poi_highlight` (it is returned as
`"skip"` when the filter is omitted and as `"poi"` when `actionTypes=["poi"]` is sent, same UUID);
whether anything below the app's HTTP stack caches segment responses. The VR app's own position
accessor and seek contract, listed here as open when this was research, were established while
building: the playhead comes from the bridge methods the patch generates on the player wrapper, and
the seek's result from the `onSeeked` hook.

## Addendum: what was built (2026-10-10)

- **Extension** (`extensions/src/`): `SponsorBlockSettings` (options baked at patch time via a
  `configure(String,String)` injection at `Application.onCreate`), `SponsorBlockClient` (the §1
  contract: `videoID` + `categories` + `actionTypes=["skip"]`, 404 = empty, 60 s failure backoff,
  4-entry LRU cache, single background thread), `SponsorSegment`, `SponsorBlockApi` +
  `YtvrSponsorBlockHost` (the adapter boundary; reflects into the captured wrapper by *our* bridge
  names only), `SponsorSkipController` (the §2 decision half: 500 ms tick, ad gate, end guard,
  re-request guard, skip/skip-once, `onSeeked` confirmation).
- **Patch** (`patches/.../sponsorblock/SponsorBlockPatch.kt`): five fingerprints (§ addendum counts
  in FINGERPRINTS.md), the three generated bridges, and five hook injections (`Application.onCreate`,
  `pwe.j`, `oqb.<init>`, `pwd.u`, both ad countdowns). Ten category options + the API base.
- **Verified statically** (`apk/sb1.apk`): patched class set = baseline + `pwe`, `pwd`, `ablw`; the
  bridge bodies read byte-for-byte as designed; every hook at instruction 0; the option values baked
  into `onCreate` (`sponsor=skip-once;selfpromo=skip;…`).
- **Also fixed on the way**: `PatchListGenerator` picked `build/libs/*.first()` — alphabetically the
  oldest bundle in the directory — so a newly added patch silently never reached
  `patches-list.json`; it now generates from the newest jar by mtime.

## Addendum 2: the device verdict, and the four bugs it found (2026-10-10)

Play-tested on the headset against a real segment (`P2JjlayovG8`, sponsor `40.781 -> 125.339 s`),
with the extension's own log lines as the oracle. The first build **did** skip (two segments
confirmed by `onSeeked`), but only once per app run, and it skipped a segment the viewer had seeked
into. Both are gone; the measured behaviour now matches the web extension:

| what was tested | measured result |
|---|---|
| playback approaches the segment from before it | `skipping sponsor 40.781s->125.339s (position 41281 ms)` then `seek confirmed at 125339 ms` — 500 ms into the segment |
| the seek bar is dragged **back** before the segment, same playback | skips **again** (`position 40835 ms`) |
| the seek bar is dragged **into** the segment (60 s) | `segment plays (the playhead was seeked into it)` — no skip, the segment plays out |
| a second watch of the same video in the same app run | skips again (was: nothing at all) |

The four bugs, all of them port-introduced rather than inherited from the phone patch:

1. **skip-once was consumed forever.** `didAutoSkipped` was marked when the seek was *requested*,
   not when it landed, and nothing ever cleared it. The phone patch checks its seek's boolean
   result, restores state on failure and marks only on success (`if (!video().seekTo(end)) {
   undoAutoSkipRange = range; return; }` … then `didAutoSkipped = true`), and it resets through
   `clearData()` from `initialize()` when the player is created. Fixed by marking in `onSeeked`
   once the landing is confirmed, and by `resetSkipStateForNewPlayback()`.
2. **The cache lent out mutable segment objects.** A cache hit handed the *same* `SponsorSegment`
   instances to the next playback, so the previous playback's `didAutoSkipped` came with them
   (Morphe has no cache, so its objects are always fresh). Fixed by delivering copies.
3. **A queued request was dropped.** `SponsorBlockClient` returned without a callback when a fetch
   for the same video was already in flight, leaving the controller's "requested" flag set with no
   segments — that video then skipped nothing for the rest of the playback. Fixed with a queued
   callback list. (`FAILED_AT` was also read under the `CACHE` lock and written under its own race —
   now consistently locked.)
4. **No seek-into suppression.** The port skipped any segment containing the playhead, including one
   the viewer had just seeked into. Fixed with `suppressedSegment`: set on a seek we did not make
   that lands strictly inside a segment, cleared as soon as the playhead leaves it, which is what
   makes "drag back before it → skips again" work.

Still deliberately different from the phone patch, and worth knowing before reporting a bug:

- **Category defaults**: `sponsor=skip-once`, `selfpromo`/`interaction`/`intro`/`outro=skip`, and
  `preview`/`hook`/`filler`/`music_offtopic`/`poi_highlight=ignore`. On the phone those ignored
  categories are `manual-skip`, i.e. they show a *button*; VR has no button, so they are silent
  no-ops. A video whose only segments are `filler` or `music_offtopic` therefore does nothing, and
  nothing in the UI says so. Changing a default means editing the option defaults in
  `SponsorBlockPatch.kt`. *(2026-10-14: both halves of this are superseded. VR has a button now, so
  those categories are `manual-skip` and the shipped defaults are upstream's map again — Addendum 19.
  The two bullets below that say "no visible feedback" are superseded by the same addendum, and the
  seek-bar markers in Addendum 4.)*
- **No visible feedback**: there is no toast, button or seekbar marker, so logcat is the only way to
  tell "no segment here" from "the hook never ran". *(Superseded 2026-10-14 — see the note above.)*
- **The video id comes from the player response**, not from the app's own video-id setter (which is
  what the phone patch hooks). Content and ad responses both pass through it, so an ad response
  arriving after the content response can leave the ad's id pending and fetch the wrong video's
  segments. Not observed in the play-test, but it is the most likely cause of a "fetches 0 segments
  for a video that has segments" report.
- **The build needs the patch turned on**: it is `default = false`, so `scripts/patch-and-install.ps1`
  now takes `-ExtraPatches SponsorBlock` (without it the script cannot produce a SponsorBlock build
  at all). *(2026-10-12: the patch is now `default = true`, so the patcher selects it on its own and
  Morphe Manager pre-selects it too; `-ExtraPatches` keeps it named as belt-and-braces for older
  bundles. The first-release reasoning above — "auto-seeking surprises people" — was already moot:
  the in-app master switch has shipped `enabled = true` from the start.)*

## Addendum 3: next work — a "Patch settings" screen, and seek bar markers

Requested after the play-test: an in-headset settings screen (like the phone app's, named for this
project rather than for Morphe) and SponsorBlock segment markers drawn on the VR seek bar.
Reconnaissance so far, so the next round does not start from nothing.

**A settings screen is feasible and the app already has the machinery.**

- The app ships `androidx.preference` *and* its own VR preference widgets —
  `com/google/android/apps/youtube/vr/views/FloatSeekBarPreference.java` is a float-slider preference,
  and YouTube's `ProtoDataStore*Preference` family is present. Preference screens exist:
  `addPreferencesFromResource` appears in `defpackage/cfq`, `fck`, `fcm`.
- The VR UI is **Android views rendered into VR**: `com/google/android/apps/youtube/vr/framework/view/`
  contains `VrViewFacade`, `GlRender`, `VrCardView`, `GlInput`. So an extension-provided `Activity` or
  `PreferenceFragment` can be presented the same way the app presents its own UI, and the app already
  has a hostable 2D panel entry point (`YouTubeVrPanel2Activity`, `com.oculus.intent.category.2D`).
- Candidate entry points, least surprising first: hook the app's own settings screen and add a
  "Patch settings" row (needs the settings fragment/`PreferenceScreen` — the three files above are the
  candidates), or add our own activity and declare it in the manifest (the patch already edits the
  manifest for the App name patch) and let the shell host it as a 2D panel app.
- Naming: "Patch settings" or similar. Never Morphe's own settings name, and never a name that claims
  to be Google's.

**Seek bar markers need one more fingerprint.**

- `com/google/android/apps/youtube/vr/modules/video/VideoPlayerControls.java` is only an interface
  (`play`, `pause`, `quickSeekRelative`, `setListener`) and `glstreaming/GlVideoPlayerControls` merely
  implements it, so the seek bar view itself is elsewhere.
- The phone patch's equivalent hooks the seek bar's `onDraw(Canvas)` and draws category-coloured bars
  (`SeekbarOnDrawFingerprint` + a rectangle/thickness setter, `drawSegmentTimeBars`). The VR seek bar
  is an Android view inside this app's GL view layer, so the same shape exists: find the view whose
  `onDraw(Canvas)` also reads the timeline (i.e. the accessors the SponsorBlock bridges already mine —
  `qhg.e()` position, `qhg.g()` duration). Starter list of classes with `onDraw(Canvas)`:
  `cni`, `isw`, `ji`, `lcb`, `lh`, `lhk`, `lhl`, `liw`, `lku`, `lkx`, `squ`, `ttg`, `udq`, `ufi`,
  `ug`, `ut` (filter by which one also references the player backend).
- Sequencing: first prove the hook with a `SponsorBlock: seekbar draw (<w>x<h>)` log line from the
  `onDraw` injection, then draw. The controller already holds the sorted segment list, so the drawing
  side is a projection of data that exists — no new API work.

Status: not implemented. This addendum is the starting point.

## Addendum 4: seek bar markers — implemented (visual check pending)

The seek bar question from Addendum 3 is answered, and the markers are implemented and in the
patched dex. What was found:

- The VR player controls are ordinary Android views inside a `VrCardView`
  (`R.layout.watch_layer_panel`, inflated by the controls fragment `ftp.fQ`, hosted in
  `R.id.player_controls_holder`) — not an Impress mesh, which is why drawing on them is possible.
- The class that drives them is the one whose constructor binds all five seek-bar ids
  (`R.id.seekbar` 0x7f0b0a23, `seekbar_buffered` a25, `seekbar_container` a26, `seekbar_position`
  a29, `seekbar_thumb` a2a). In the shipped 1.88.10 dex that is `gtw`; four of the five ids are
  referenced by that constructor *only*, and `R.id.seekbar` on its own is shared with
  `androidx.preference.SeekBarPreference.a` — so the anchor is the **set** of ids, which is a fact
  R8 cannot rename (resource ids are inlined constants).
- Its timeline update is `gtw.e(J,J,J,J)V` = **(positionMs, windowStartMs, durationMs,
  bufferedMs)**, read out of the method body: the duration feeds the total-time label, `position`
  feeds the elapsed label, and `(position − windowStart) / (duration − windowStart)` scaled by
  `parentWidth − track margins` is exactly the width the app gives `seekbar_position`. The class also
  carries a synthetic `(J J J J)V` bridge that merely forwards, so the fingerprint requires the
  `setLayoutParams` call — verified in the built dex, where the bridge is untouched.
- Markers are drawn by an extension view (`SponsorBlockOverlay`) added over the played bar's
  coordinate space, one bar per skippable segment in SponsorBlock's own category colours, using that
  same formula. The list comes from the controller (`segmentsSnapshot()`), so the markers and the
  skipping can never disagree. The overlay is transparent except for the bars and costs nothing while
  the controls are hidden.

Verified in the built APK (repository rule: read the dex, do not trust `Applied:`):

    SponsorBlockOverlay;->configure(II)V   <- YouTubeVrTikTokRoot_Application->onCreate()V
    SponsorBlockOverlay;->attach(View)V    <- gtw-><init>(View, …)V
    SponsorBlockOverlay;->onTimeline(JJJJ)V <- gtw->e(JJJJ)V     (bridge gtw->k(JJJJ)V untouched)

**Not yet verified: the visual result**, because the player-controls view is built lazily — an
adb-launched playback logs `seekbar overlay armed (track=0x7f0b0a23 position=0x7f0b0a29)` but never
`attached`, so the marker layer only exists once the controls are on screen. The device test for it is
therefore: play a video that has segments, bring up the player controls, and expect the coloured bars
on the seek bar plus `seekbar overlay attached` / `seekbar geometry` / `seekbar markers drawn` in
`adb logcat -d | rg -a "SponsorBlock:"`.

Still to do for this objective: the "Patch settings" screen (Addendum 3's first half).

## Addendum 5: the marker bugs, and the Patch settings panel (2026-10-10, same day)

**Two bugs the round-1 marker work shipped, both found on the device.**

1. **The app crashed whenever the watch page opened.** ART: *"Verifier rejected class gtw: void
   gtw.e(long,long,long,long) failed to verify … long or double parameter at index 0 is not a
   pair"*. The injection was `invoke-static {v0, v2, v4, v6}, …->onTimeline(JJJJ)V`: dex format 35c
   lists **every** register, so four longs need eight entries and it holds five. The fix is
   `invoke-static/range {p1 .. p8}` — and the obvious alternative (moving the parameters into
   locals first) is worse, because it clobbers the method's own registers and trips the same
   verifier. All three view hooks in this patch now pass parameters straight through with the range
   form. **Lesson for every future patch: a wide argument never goes through plain `invoke` unless
   the register list holds both halves of every pair, and `/range` is the only way past five.**
   A second-order lesson: because the verifier rejects the whole *class*, the symptoms looked like
   "the player controls were never built" — which is how a wrong note about lazy controls got into
   these docs. Read the crash buffer (`adb logcat -d -b crash`), not just the app's stdout.

2. **The markers drew below the seek bar.** The overlay copied the *track's* geometry
   (`R.id.seekbar`, the whole 27 px box) instead of the played bar's. The field map is
   `B` = `seekbar` (track), `j` = `seekbar_container` (the span reference),
   `D` = `seekbar_position` (the visible line), `E` = `seekbar_buffered`; the played bar is the line
   the markers must sit on. Measured after the fix: `seekbar geometry: span=369px left=9 top=9
   height=9` and `markers drawn: 1 segment(s) over 369px (window 0ms..538000ms)` — i.e. the coloured
   ranges are on the line, as Morphe draws them. The overlay also syncs from the track's layout
   listener now, so sizing no longer depends on the timeline callback (which only runs while the
   controls are visible).

**Patch settings (the first half of Addendum 3) is implemented.** Because this extension compiles
against `android.jar` only, there is no `androidx.preference` and no `Activity`: the panel is built
from plain views and added to the app's *own* settings panel, which is a normal view hierarchy
(`fyi` inflating `R.layout.accounts_and_settings_fragment` inside a `VrCardView`). The entry row is
injected by hooking that panel's `(View, Bundle)` view-created callback — the class is identified by
the inlined layout id, so nothing is name-bound. The panel offers the SponsorBlock master switch and
one cycling control per category (`skip` → `skip-once` → `ignore`), and writes to
`SponsorBlockSettings`, which now layers SharedPreferences over the patch's baked defaults, so a
change applies to the next video with no rebuild. Verified in the built dex:

    ModSettingsPanel;->install(View)V        <- fyi->ad(View, Bundle)V
    SponsorBlockSettings;->initContext(Context)V <- ApplicationRoot->onCreate()V
    SponsorBlockOverlay;->configure(II)V     <- ApplicationRoot->onCreate()V

Not yet seen by a human: the panel itself (the row's label and the cycling controls), and the
markers' final appearance after the geometry fix. Both are one look in the headset away.

## Addendum 6: the marker width, and the measured class set

**The marker width.** After the vertical fix the markers sat on the line but were slightly wider than
it and shifted right by the same amount. Cause: I used the *track's* left margin (9 px) as the
overlay's left offset, but that margin **insets the played bar** — the bar itself starts at the
container's left edge and is `containerWidth - track.leftMargin - track.rightMargin` wide. The
overlay now copies the played bar's own left edge and keeps that span:

    seekbar geometry #2: span=369px left=0 top=9 height=9 (parent 387px, track 387px)

which is the played bar's full extent, so the coloured ranges line up with the line they annotate.
The rule for anything else that has to line up with an app view: take *that view's* geometry, not its
container's.

**The patched class set, measured** (repository rule: read the dex, do not trust `Applied:`):

| build | classes in the last dex | app classes |
|---|---|---|
| default patches (17) | `agtm, axe, YouTubeVrTikTokRoot_Application, PlaybackAgnosticUserPreferences, PlatypusEnablingManager, fna, gtu, mkz, muf, muk, ocn, oqb, CronetUrlRequestContext, oth, pqy, sfp, tyj` | 17 |
| with **SponsorBlock** | the 17 above **plus** `pwe` (loadVideo/seek hooks + the three generated bridges), `pwd` (onSeeked), `ablw` (seek-source enum), `gtw` (seek-bar binder + timeline, i.e. the markers) and `fyi` (the settings panel that hosts the Patch settings row) | 21 |

So the whole feature adds exactly **five** app classes, each explainable — which is what makes a
green run trustworthy here.

**The Patch settings panel gained two things** after the first device look: a **Seek-bar markers**
on/off row (this port's own addition, so it gets its own switch) and human-readable category names
("Unpaid / self-promotion", "Non-music section", …) with the category carried on the view's tag, so
the label can be prettier than the API identifier without losing the mapping.

**Input reaches our views** — checked in the code rather than assumed:
`GlInput.dispatchVrTouchEvent(cardView, event)` calls `gbd.r(event)`, which is
`VrCardView.r()` → `super.dispatchTouchEvent(event)`, i.e. the ordinary Android view-tree dispatch.
Anything we add as a child of that hierarchy is hit-tested normally, which is why the row, the panel
and its buttons can be clicked with the controller ray.

## Addendum 7: the seek-bar anatomy, measured (2026-10-10)

Every number below came from the overlay's own one-shot dump on the device, not from reading the
layout (`jadx` decodes `watch_layer_panel.xml` as a single `VrCardView`, so the layout was no help):

| view | id | measured |
|---|---|---|
| `seekbar_container` (`HapticsFrameLayout`) | `0x7f0b0a26` | 405x69 at left=82 |
| `seekbar` (track, `FrameLayout`) | `0x7f0b0a23` | 387x27 at left=9, top=21, **margins 9/9**, gravity 17 |
| **`seekbar_bg` — the line a viewer sees** | **`0x7f0b0a24`** | **387x9 at left=0, top=9**, `StateListDrawable` |
| `seekbar_buffered` | `0x7f0b0a25` | sibling of the line, grows 0 -> duration |
| `seekbar_position` (played) | `0x7f0b0a29` | sibling of the line, grows 0 -> span |
| `seekbar_thumb` | `0x7f0b0a2a` | margins -18/0, gravity 16 |
| our marker layer | — | added as the last child of the line's parent |

The line's drawable is what makes it look thin: `res/drawable/seekbar_gutter_bg.xml` is a selector
whose **default** item fills the shape with a **3dp transparent stroke** (radius 1.5dp) and whose
**`state_selected` item has no stroke** (radius 4dp). An Android shape stroke is centred on the
shape's edge, so the visible line is the view's box *inset by half that stroke on all four sides* —
which is why the markers looked slightly wide when they used the box, and the selected item is what
a viewer sees as "chunky" when the controller ray is near. The markers therefore:

- copy the **line view's** box (`left`, `width`, `top`, `height`) rather than the track's or the
  container's, so they stretch with the seek bar as it expands — measured live: 387 -> 429 -> 467 ->
  493 -> 512 px during the hover animation;
- draw each segment inset by half the stroke when the line is **not selected** and over the whole box
  when it is (`View.isSelected()` mirrors the drawable's `state_selected`), with rounded ends;
- never compute the span themselves. The app's own formula
  (`containerWidth - track.leftMargin - track.rightMargin`) happens to equal the line's width here,
  but copying the line makes that irrelevant.

`R.id.seekbar_bg` is the one hand-kept id in this patch (no code references it, so no fingerprint can
mine it): it is declared next to the mined ids with a comment saying exactly that, and the runtime
falls back to the played bar's parent when it resolves to nothing.

## Addendum 8: where a view we add is actually drawn (the panel bug)

Two reports from the headset — the Patch settings row "doesn't stick" and tapping it "does nothing" —
turned out to be one mechanism each, both visible in the overlay's own logs:

- **The click was fine.** `settings row: clicked` appears on every tap, so the VR input path
  (`GlInput` -> `VrCardView.r()` -> `super.dispatchTouchEvent`) does hit-test views we add, as the
  code reading said.
- **The panel was invisible because of *where* it went.** The row's click added it to the
  `DecorView` (4128x2208, laid out fine, `visible=true`) because `rootOf()` walks to the outermost
  view group. **The VR app composites only its own `VrCardView`s into the headset** — the window's
  DecorView is never drawn — so a perfectly laid-out panel on the DecorView produces exactly
  "nothing happens". The panel now goes into the settings `VrCardView` the hook was handed.
- **The row was anchored where it could not be seen.** It was added to that card with
  `gravity=BOTTOM`, and the settings card is a fixed VR surface whose content is added asynchronously
  (the dump showed the card's three `FrameLayout` children all empty at view-creation time). It is
  now anchored top-end with margins, and it logs its laid-out bounds so a wrong position is visible
  in the log rather than only in the headset.

The general rule: **adding a view to the window is not enough — it has to be inside a view group the
app renders**. For this app that means a `VrCardView` (the marks: `VrCardView`, `VrViewFacade`,
`GlRender` in `com.google.android.apps.youtube.vr.framework.view`).

## Addendum 9: the Patch settings panel, and the Close bug

The first panel drew every option on one screen: fourteen buttons, no hierarchy, and — reported from
the headset — **Close did nothing**. Both were fixed the same day:

- **Close was removing the panel from the wrong parent.** The panel had just been wrapped in a
  `ScrollView` (ten rows plus switches do not fit a fixed-size VR card one per line), and the close
  handler still resolved its parent through `rootOf()`, which walks up to the window's `DecorView`:
  it removed nothing. It now removes the panel from whatever actually holds it. The general lesson
  matches Addendum 8's: **resolve the parent you added the view to, never "the outermost group"**.
- **Two levels**, which is also the shape that lets this grow: level one lists sections (SponsorBlock
  with a live summary like `on - 6 of 10 categories skipping`, plus Close), level two is that
  section's options with Back and Close. A future feature adds a section row rather than more buttons
  to an already crowded screen.
- Styling by role instead of fourteen identical buttons: 22sp titles, 18sp section rows on a rounded
  dark button, 15sp option rows, 13sp hints, everything inside a `ScrollView` so a short card clips
  rather than hides.
- Each screen and each setting logs its name (`panel: root screen`, `panel: sponsorblock screen`,
  `panel closed by the Close button`, `category sponsor = skip`), and the settings row's laid-out
  bounds are logged together with the card's — the card's height is what decides whether the rows
  fit, and there is no other way to see it.

**Not runtime settings, on purpose**: the streaming spoof and the diagnostic probes are applied as
*hooks* by the patch, so "off" is a build without them rather than a switch in this panel. The
panel's own additions (the markers toggle, the per-category behaviours) are all read at runtime and
persist in SharedPreferences over the patch's baked defaults.

## Addendum 10: the Status section (and why the two levels earn their keep)

The panel's second section is read-only and answers "what is it doing right now": enabled, markers,
API base, the video id the controller fetched for, how many segments it has and how many of those
would skip, and the last skip of the session — plus **Refresh segments**, which drops the cached
answer for the current video and asks again (`SponsorBlockClient.forget` + a re-fetch), for when the
API was unreachable or a fetch failed.

It cost one row on the section list, one screen, and three getters on `SponsorSkipController`
(`videoIdForStatus`, `segmentsForStatus`, `lastSkipForStatus`) — which is the argument for the
two-level structure in the first place. It is also the debugging surface with no PC: every fact in
the log is visible in the headset, so a report can be checked without `adb logcat`.

## Addendum 11: the entry row belongs *in* the settings column

The floating "Patch settings" button at the card's top-right corner was the wrong shape: it read as a
stray button rather than a settings entry. The settings card's three children turned out to be
fragment holders, and their ids name them:

| id | name | role |
|---|---|---|
| `0x7f0b0aa8` | `sign_in_fragment_holder` | sign-in content |
| **`0x7f0b0a51`** | **`settings_fragment_holder`** | **the app's settings column** |
| `0x7f0b03af` | `environment_settings_fragment_holder` | environment settings |

So the row now goes at the **top of that column**: the panel wraps `settings_fragment_holder` in a
vertical column — its own row first, then whatever the app put there, weighted to fill the rest. The
holder's content arrives asynchronously and can be replaced, so the column is (re)assembled from a
layout listener and the assembly is idempotent (anything in the holder that is not our column is moved
into it, and the row is forced back to index 0). The row itself is styled like a settings row: full
width, left aligned, no background of its own.

`R.id.settings_fragment_holder` is the second hand-kept id (with `R.id.seekbar_bg`), for the same
reason — the layout references it and no code does — and the patch bakes it at app start. If it
resolves to nothing, the row falls back to the card's top-right corner rather than disappearing.

## Addendum 12: verification of the final build (what the log shows)

Recorded on the shipped build with the SponsorBlock patch enabled, launching
`https://www.youtube.com/watch?v=P2JjlayovG8&t=36s` (sponsor segment 40.781s -> 125.339s):

```
SponsorBlock: configured: api=https://sponsor.ajay.app categories=sponsor=skip-once;selfpromo=skip;...
SponsorBlock: settings store ready: sponsorblock=on, 2 category override(s)
SponsorBlock: seekbar dump: marker left=0 span=387 top=9 height=9
SponsorBlock: seekbar dump: container HapticsFrameLayout id=0x7f0b0a26 405x69 left=82 top=0
SponsorBlock: seekbar dump: track FrameLayout id=0x7f0b0a23 387x27 left=9 top=21 margins=9/9
SponsorBlock: seekbar dump:   child[0] View id=0x7f0b0a24 387x9 left=0 top=9   <- the line
SponsorBlock: seekbar dump:   child[3] MarkerOverlay id=0xffffffff              <- our layer
SponsorBlock: segments ready: 1 (1 skippable)
SponsorBlock: skipping sponsor 40.781s->125.339s (position 41200 ms)
SponsorBlock: seek confirmed at 125339 ms (target 125339)
```

That covers the three things the objective asks to be true on the device: the markers are attached to
the app's own played-bar parent at the line's geometry, the fetch/skip/confirm path runs, and the
panel's stored overrides survive a restart (the "2 category override(s)" line is the SharedPreferences
layer loading values chosen in the headset). Two things remain human-verified only: how the row looks
at the top of the settings column, and the panel's Close.

### Verified from the headset, by the person using it

The same session's log closes both reports that drove the last few rounds:

```
SponsorBlock: settings row: column placement in FrameLayout id=0x7f0b0a51 ... children=0
SponsorBlock: settings row: wrapped the settings content, row at index 0 (LinearLayout ... children=2)
SponsorBlock: settings row: clicked
SponsorBlock: panel: root screen
SponsorBlock: panel added to VrCardView ... children=4
SponsorBlock: panel laid out: ScrollView 662x367 ... visible=true
SponsorBlock: panel: Close clicked
SponsorBlock: panel closed by the Close button
```

Reading it in order: the settings column was found, the app's content arrived later and was wrapped with
our row at index 0, **the row was then clicked** (so it is visible and hit-testable where it was put --
"it doesn't stick" is answered), the panel opened on its root screen inside a `VrCardView` at 662x367,
and **Close removed it** ("close doesn't work" is answered). Together with `settings store ready:
sponsorblock=on, 2 category override(s)` -- two category choices made in the panel, reloaded from
SharedPreferences after a restart -- the whole feature is verified on the device rather than by
inspection.

### Panel mode: deliberately not covered

The app has a second settings surface in its 2D panel mode (`panel2_accounts_and_settings_fragment`,
layout id `0x7f0e01ee`, holder id `0x7f0b07c9`; its view is built by `Lfmv;->K(LayoutInflater;ViewGroup;
Bundle)View` and placed by `Lfro;->c(ViewGroup)V`). The immersive settings screen is the one verified
here, so that surface is left alone -- hooking it means capturing a method's *return* value rather than
receiving a view parameter, which is a different kind of injection than the three this patch uses. The
anchors are recorded here so it stays cheap if it is ever wanted.

## Addendum 13: the entry is a real preference, not a view (the overlay verdict)

Reported from the headset after Addendum 11: the row sat *on top of* the settings as an overlay rather
than inside it. Reading the app's settings code with that in hand showed why that was the wrong
approach entirely:

- The settings screen is **androidx preferences**. `fzf` (the fragment inside
  `settings_fragment_holder`) imports `androidx.preference.PreferenceScreen` and instantiates one of
  `fyr` / `fzb` into `R.id.settings_fragment`; those load `R.xml.settings_prefs` (immersive) or
  `R.xml.panel2_settings_prefs` (panel mode), and the rows are `Preference` objects — the app even
  subclasses `SwitchPreference` (`ProtoDataStoreSwitchPreference`).
- So the seamless entry is a `Preference`, not a view. Views we insert are always going to look like
  a layer, and they cannot scroll, because the controller's scroll goes to the app's list.

The port now adds a **`PreferenceCategory("Patch settings")`** to that screen, from the method that loads
the prefs XML (found structurally: a no-argument void method referencing `settings_prefs` or
`panel2_settings_prefs`; in 1.88.10 that is `fzb.aD()` and `fqa.aD()`, and both are patched). The
category holds real rows: two `SwitchPreference`s (SponsorBlock, Seek-bar markers), one `Preference`
per category that cycles skip -> skip-once -> ignore on tap and shows the value as its summary, a
`Status` row whose summary is the live state, and a `Refresh segments` row.

All of it is reflection (`androidx.preference.*` is not on this extension's compile classpath — only
`android.jar` is), and the listeners are dynamic proxies implementing
`Preference$OnPreferenceChangeListener` / `Preference$OnPreferenceClickListener`. Idempotence is
**per screen**, not process-wide: the fragment builds a fresh `PreferenceScreen` from the XML on every
open, so a global "already added" flag would leave the second open without the rows.

The hand-built `ModSettingsPanel` is now unwired — nothing injects into `fyi` any more — and stays in
the tree only until the native rows are confirmed in the headset, at which point it goes.

## Addendum 14: the settings screen is the app's own preferences XML (final design)

Addenda 10-13 record three attempts at one requirement ("a Patch settings screen inside the app"). The
first two are gone; this is what shipped and why.

| attempt | what it was | why it failed |
|---|---|---|
| 1 | a hand-built view panel added to the settings card | looked like an overlay, and could not receive the controller's scroll (the app's list behind it did) |
| 2 | a row wrapped into the settings column | still a view of ours inside a fragment holder, so still an overlay, and the app rebuilt the holder's children |
| 3 | androidx `Preference` objects built by reflection | **R8 renames androidx's members** (`androidx.preference.Preference`'s `setTitle`/`setKey`/`setSummary`/`addPreference` are `L(...)`, `X(...)`, ...; only the class names survive, because XML inflation needs them) — so every call silently did nothing |
| 4 (shipped) | the rows are written into the app's own `res/xml/settings_prefs.xml` and `panel2_settings_prefs.xml` | nothing to fail: the app inflates them as its own rows |

What the shipped version is:

- A `PreferenceCategory` titled "Patch settings" (using the app's own
  `@layout/settings_pref_title_with_divider`), then plain `androidx.preference.SwitchPreference` rows:
  SponsorBlock, Seek-bar markers, "Skip each segment only once", a "Categories" header, and one switch
  per category. `SwitchPreference` is the superclass of the app's own
  `ProtoDataStoreSwitchPreference`, so the rows render in the same layout.
- The extension reads what the user picks from the screens' preference file, **`youtube.xml`** (measured 2026-10-11: the screens' fragment sets its storage name to `"youtube"` via `fyp.g("youtube")`; the earlier belief that androidx's default `<package>_preferences` was used was wrong — that file never existed), with `enabled()`, `markersEnabled()` and
  `behaviour()` each consulting it and falling back to the baked defaults until the screen is used.
  `behaviour()` maps a category switch to `skip`/`ignore`, and the "only once" switch to `skip-once`.
- Two patcher facts, learned by failing — **both mechanisms are now superseded** (2026-10-30:
  the settings rows live in the dedicated **Patch settings** resource patch. That patch
  `dependsOn`s SponsorBlock — not the other way around — and is `default = true`, so a default
  apply runs it and it runs SponsorBlock first. The first point's constraint was about a
  `default = false` companion, and patcher 2.x's on-request resource decode removed the
  workspace-path guessing entirely; see docs/INTERNALS.md "The patcher 2.x alignment"). Kept
  because both lessons still govern how the replacement works:
  1. A patch with `default = false` is **not** pulled in by `dependsOn`; the patcher logs "Skipping
     disabled" and continues — which is why PatchSettingsPatch is `default = true`.
  2. A bytecode patch's `fileWorkspace` is a scratch directory, not the decoded resource tree, and
     a resource search that guesses paths must **throw** on a miss rather than silently doing
     nothing — the resource patch now *requests* the decode, so there is nothing to guess.
- Verification worth repeating: the compiled XML inside the built APK is path-shortened and
  compressed, so a byte grep of the APK proves nothing. Read the entries instead — the installed APK's
  `res/4I.xml` and `res/B0.xml` both contain the switch key, and the patch log's "rebuilding 4 entries"
  (up from 2) is the same fact from the other side.

### The defaults now read the way the screen does

The settings screen shows each category as an on/off switch plus one "Skip each segment only once"
switch over all of them, so the baked defaults have to say the same thing: every category that skips
skips **every time** by default (`sponsor` included — it used to be `skip-once`), and once-only
behaviour is what that switch turns on. Before this, the screen showed "Sponsor [on]" and "only once
[off]" while the feature actually skipped the sponsor once, which is the kind of disagreement that
makes a settings screen untrustworthy.

## Addendum 15: the app's preference filter, and why plain SwitchPreference looks native

Two failure modes were still open before the headset saw the new screen. Both are settled by reading the
app's own code:

1. **The app removes preferences it does not want.** `fzf` has two static hide sets
   (`user_initiated_feedback`, `keyboard_settings`, `environments_menu`, `invert_scroll`) and
   `aI(PreferenceScreen, Set)` walks the tree, removing every preference that is a `ListPreference`
   **or** whose key is in the set. So:
   - our rows survive: their keys are `ytvr_mod_*`, none of which is in either set;
   - `PreferenceCategory` rows have a null key, so `Set.contains(null)` is false and they survive too;
   - and the fact that `ListPreference` is removed *unconditionally* is the app telling us that list
     dialogs have no place in this UI. That is the second time the code has said so — it is why the
     categories are switches rather than a list.

2. **A plain `SwitchPreference` renders exactly like the app's own rows.**
   `ProtoDataStoreSwitchPreference extends SwitchPreference` and does **not** override
   `getLayoutResource` or bind a custom view (verified in its decompiled source: no `R.layout` and no
   `onBindViewHolder`), so it uses androidx's default switch layout — the same one our rows get. The
   only layout the app adds for settings is the category header, and our section headers already use
   its `@layout/settings_pref_title_with_divider`. Nothing to style: the rows are the app's rows.

## Addendum 16: verified on the headset, end to end

The settings screen was the last piece without a human verdict, and it has one:

> Settings, top of the list: **a "Patch settings" header with switches under it** (SponsorBlock, Seek-bar
> markers, Categories, and the category switches).

Together with the rest of the evidence, every part of this feature is now verified on the device:

| part | evidence |
|---|---|
| the section and its rows | headset verdict above; the patched workspace shows the rows at the top of `settings_prefs.xml`, and the built APK's compiled settings XMLs (`res/4I.xml`, `res/B0.xml`) contain the switches |
| the switches reach the feature | the extension reads `youtube.xml` on demand (`enabled()`, `markersEnabled()`, `behaviour()`), the file the screens persist to (`fyp.g("youtube")`); the baked defaults deliberately equal the XML defaults, so behaviour is the same before and after the first toggle |
| seek-bar markers | `seekbar dump: marker left=0 span=387 top=9 height=9` (attached to the app's played-bar parent at the line's geometry) and `seekbar markers drawn: 1 segment(s) over 387px inset=2 thickness=5 (window 0ms..538000ms)` (the drawn form, with the inset that matches the line's 3dp transparent stroke); confirmed visually earlier |
| skipping | `segments ready: 1 (1 skippable)` -> `skipping sponsor 40.781s->125.339s (position 41195 ms)` -> `seek confirmed at 125339 ms (target 125339)` |
| no crashes | the crash buffer is empty across every run of this build |

The final shape of the feature, in one line: the app owns the settings (its XML, its rows, its
preference file), and the extension owns the behaviour (fetch, skip, markers), reading what the app
stored.

## Addendum 17: tap-to-open — the dead developer-settings screen becomes the sub-screen

Addendum 14 shipped the settings as a flat list because a sub-screen looked unreachable: the handoff
(HANDOFF-MOD-SETTINGS-SUBSCREEN.md) records three blockers — no `OnPreferenceStartScreen`
implementor, no way to add a fragment class, no way to mint a resource id. All three are real, and
all three become irrelevant with one observation this session verified in the decompiled sources:
**the app itself already contains a second, fully working settings screen with navigation — its
developer settings — and its list row is removed at startup, so the whole surface is dead UI.**

The navigation, read from `fzb`/`fzf` (1.88.10):

- `fzb.aC(Preference)` (the androidx `onPreferenceTreeClick` override) compares the clicked row's
  key against known literals and, for `developer_settings`, calls `fzf.aH(fyp.class, null)`.
- `fzf.aH(Class, Bundle)` instantiates the class reflectively (`getDeclaredConstructor()` — a
  no-arg constructor is all it needs), **passes the Bundle as fragment arguments**
  (`avVar.ah(bundle)`), replaces `R.id.settings_fragment` and — for any class that is not the root
  list fragment — **adds the transaction to the back stack**, so the controller's back returns to
  the list. The back stack, the transition and the title handling are all the app's own.

So the sub-screen needs no new fragment class, no new XML, no new resource id — it *reuses* the
developer-settings screen. 1.88.10 has **two** parallel settings stacks sharing the same XMLs (the
live `fzf`/`fzb`/`fyp` one, and `fqg`/`fqa`/`fnj`, reachable through `fni`/`fvt`); the patch handles
both, because both click handlers match the same shape.

What the patch did at this point: a single-level screen. Addendum 18 replaced that shape the same
day with the hub (one "Patch settings" row, then a feature entry, then the SponsorBlock screen).
The click-handler lookup below is `classDefByStrings` now.

What the patch does (SettingsXml.kt rewrites + three structural bytecode edits per stack):

| edit | what it is | why it is safe |
|---|---|---|
| the entry row | a plain `<Preference android:key="ytvr_mod_settings" android:title="Patch settings"/>` at the top of `settings_prefs.xml` and `panel2_settings_prefs.xml` (the flat rows of Addendum 14 are removed) | a plain `Preference` with no `android:fragment`/intent is inert on its own; the click handler is what routes it |
| the click handler's key | the `const-string "developer_settings"` comparison in the `(Preference)Z` click handler is replaced with `"ytvr_mod_settings"` — mined via `classDefByStrings`, matched by shape, **validated** by requiring the `const-class` that follows to belong to a class carrying the `"Developer Settings"` title literal | the app keeps removing its own dead row (that lookup still says `developer_settings` and `PreferenceGroup.ab`'s list remove is guarded); ours routes instead |
| the sub-screen's XML | `developer_settings_prefs.xml` keeps its root element (and thus its resource id and inflation path) but its **children are replaced** with the SponsorBlock rows | no id is minted; the switches persist to the screens' shared `youtube.xml` file (`fyp.g("youtube")`) |
| the wiring skip | the sub-screen fragment's `()V` setup (the class's only `()V` method holding exactly one `0x7f1800xx` literal — the `xml` id window) gets `return-void` inserted right after its `o(R.xml...)` call; the rest becomes dead code | the skipped wiring dereferences app-only rows (`experiment_ids`, `keyboard_settings`, `oculus_mobile_feature_2`, ...) **without null checks** and would NPE on the slimmed XML; our plain switches need none of it |
| the title | the `"Developer Settings"` literal in the fragment's view-created callback becomes `"SponsorBlock"` | the header is the app's own `aF(String)` |

Verified statically on the built APK before install:

- the compiled XMLs `res/4I.xml`, `res/4l.xml`, `res/B0.xml` carry `ytvr_mod_settings` (main lists)
  and `ytvr_mod_sb_enabled` (sub-screen);
- decompiled `fzb.aC`/`fqa.aC` compare `"ytvr_mod_settings"`, their removal lookups still say
  `"developer_settings"`, `fyp.W`/`fnj.W` say `"SponsorBlock"`, and a dexlib2 dump of both `aD`
  methods reads `g("youtube") → o(R.xml...) → RETURN_VOID` with the app's wiring below it dead.

Device verdict: **pending** — the app installs and launches with an empty crash buffer, but the
tap-through (list → SponsorBlock sub-screen → back) needs the headset worn.

Two near-misses worth remembering:

- `PreferenceGroup.ab(null)` (the removal call) is **not** null-safe — `preference.A` is
  dereferenced before the guarded list remove. Neutralizing the removal by pointing it at a dummy
  key would have crashed every settings open; re-keying the *click* comparison instead leaves the
  removal path exactly as it was.
- the `ARG_PREFERENCE_ROOT` route is dead in this APK: `cfq` (the renamed
  `androidx.preference.PreferenceFragmentCompat`) reads the root key in `onCreate` and drops it —
  this androidx build predates `setPreferencesFromResource`, so a nested `<PreferenceScreen>` can
  never be displayed by arguments alone.

## Addendum 18: the Morphe-style hub — Patch settings becomes a two-level screen

Addendum 17's single-level screen (tap Patch settings -> everything flat, titled "SponsorBlock") was
replaced within the hour: the user compared it with Morphe's phone settings and wanted the same
shape -- a hub of feature entries, each opening its own screen:

```
Settings -> "Patch settings" (row) -> hub ("Patch settings")
                                      └─ "SponsorBlock" (entry) -> SponsorBlock settings
```

One fragment serves both levels. The app's own swap (`fzf.aH`) skips a swap to the class already
showing, so a same-class swap was impossible until a generated static bridge
(`fzf.YtvrSbScreenClass(Object, Bundle)`) replaced the `getClass()` call inside `aH`: it returns
the real class except when the arguments carry our key (`ytvr_screen=sb`), which forces the
recreation -- with the back-stack entry the app's own code already adds for non-root screens. The
fragment's `()V` setup and its view-created callback are rewritten wholesale (bodies mined and
rebuilt at opcode level) to branch on that argument: which XML to inflate (the developer XML = the
hub, or a second dead XML = the SponsorBlock screen) and which title to set.

The second XML dissolves the "a patch cannot mint a resource id" blocker for the second time: the
APK carries a dead framework `PreferenceFragment` (`fcm`, unreferenced, `android.preference` -- not
androidx) inflating a generic preferences XML. Its id is mined from its `addPreferencesFromResource`
call (the languages twin is excluded structurally: it references the input-method backup type), and
`res/values/public.xml` maps the id back to the file name the resource patch rewrites. No id is
minted; two dead screens are put to work.

The hub's entry click is a **method added to the app's fragment** (`aC(Preference)` override): the
SponsorBlock entry key re-invokes the app's swap with the argument bundle; everything else falls
through to the app's own handler (its super call is rebased onto the fragment's own ancestor that
declares the handler -- the click handler's superclass is a different branch of the hierarchy and
an invalid `invoke-super` target). The live stack is identified structurally, not by name: both
1.88.10 stacks' click handlers match the same shape, but only the live fragment's title method
reads a *field of the holder's type* (the parallel stack reaches its holder through a peer lookup).

Verified statically on the built APK: `fyp.aD`/`fyp.W` branch exactly on the argument (dumped),
`fyp.aC` routes `ytvr_mod_sb_screen` -> `aH(fyp, {ytvr_screen: sb})` and falls back to
`Lcfq;->aC`, `fzf.aH` reads the class through `YtvrSbScreenClass`, and four compiled XMLs carry the
keys (`res/4I.xml`, `res/4l.xml` main lists; `res/B0.xml` hub; `res/DZ.xml` SponsorBlock screen).
The app installs, launches, and the crash buffer stays empty. **Device verdict, round one: crash.** Tapping Patch settings killed the app with
`java.lang.VerifyError: Verifier rejected class fyp: void fyp.W(android.os.Bundle) failed to
verify: instance field access on object that has non-reference type Conflict` -- and the crash
itself is the best possible evidence: it names the method, the opcode offset and the conflict, and
it fired exactly where the tap routes (`Preference.D -> fzb.aC -> fzf.aH -> fyp.<init>`). The bug
was register arithmetic, not design: the original `W` has a single free local register, and the
rewritten body's `v1`/`v2` scratch registers *were* `p0`/`p1` -- a merge point then read `this`
from a register holding an int/String. Fix: wholesale method replacement (`replaceMethodBody`)
grows the register count to `paramWords + locals` before assembling the body, so scratch registers
can never collide with parameters; the dumped final body confirms `p0=v4`, `p1=v5`, no receiver
reads anything but `this`. Lesson recorded: never assume free registers in a rewritten body --
size the method, don't inherit its count.

**Device verdict: WORKS.** The user confirmed the full chain on the headset -- Settings ->
Patch settings -> the hub -> SponsorBlock -> the settings screen, switches persisted -- after the
register fix above.

**The "two back arrows" report, closed (uiautomator on device):** with settings open, the app's
view hierarchy contains exactly ONE back button -- the settings card's own (`back_button` above
the list). The account page (Sign in + gear) contains **none** -- the arrow visible there is
Horizon OS's own system back affordance for a focused 2D panel, drawn by the shell, not by the
app (the dump cannot see it as an app view, and no documented manifest opt-out exists). So the
stacked pair in the screenshot is the shell's affordance on the account panel plus the app's own
arrow on the settings card -- identical in the stock app.

**An attempt at removing our arrow FAILED, and the attempt itself settled the question:** with
the card's arrow hidden and the system back wired to the hub (a `YtvrSbGoBack` bridge over the
arrow's pop-or-close, the holder registered with a `ModSettingsUi` extension class, guards in
`YouTubeVrActivity`/`YouTubeVrPanel2Activity.onBackPressed`), the user tapped the OS affordance on
the SponsorBlock screen -- **nothing fired**: no `onBackPressed` reached the app (instrumented with
logs), the panel content stranded with no way back, and a force-stop was needed. Conclusion:
**Horizon's panel back affordance does not dispatch a back to the app at all -- the shell handles
it itself** (dismissing panels). The app's own arrow is therefore the only working back for the
settings navigation and must stay; the two stacked arrows (shell affordance above the card's
arrow) are the correct, functional state. The system-back wiring stays in the build -- it is
harmless (the guard falls through to the app's own handling when the hub is not showing) and
makes any environment that *does* dispatch back work correctly.

**Why not just overlap the two arrows (asked and measured):** the OS affordance is not a 2D view
in the app's window -- it floats at its own depth in front of the panel (the stereo capture shows
it at different positions per eye; ours cannot reach it, and the app window clips at its top edge
where our arrow already sits). Moving our arrow onto it is therefore impossible, and its click
zone belongs to the shell (panel dismissal) anyway. What shipped instead: the card's arrow moved
to the card's top-left corner (the standard back position, `deprecated_settings_holder_fragment`
back-button container: `alignParentStart` + margins instead of `centerHorizontal`), so the two
controls read as different things -- the card's back at top-left, the OS's panel control above.

## Addendum 19: "Show a Skip button" — the `manual-skip` behaviour (2026-10-14)

The phone patch's fifth behaviour is implemented, so every value upstream defines now means the same
thing here. Requested after a play-test, with the phone patch's own picker as the reference: *"our
implementation is missing 'show a skip button', Morphe for YouTube mobile has that"*.

**What the phone patch does** (read from `mpp-sh`/`mpp-yt`, the same sources §2 cites):
`CategoryBehaviour.MANUAL_SKIP("manual-skip")` is one of five; a segment with it is *not* seeked past,
it is **offered**. `SegmentPlaybackController.setSegmentCurrentlyPlaying` shows it while the playhead is
inside, `SkipSponsorButton` is an overlay whose label is the category's own text, and pressing it calls
`onSkipSegmentClicked` → `skipSegment(segment, userManuallySkipped = true)`, which seeks to the segment's
**end**. Two details came from the same read rather than from guessing:

* **The window is 3800 ms.** `SB_AUTO_HIDE_SKIP_BUTTON` is on by default and its duration is
  `FOUR_SECONDS.adjustedDuration`, and that enum subtracts 200 ms (`4 * 1000 - 200`). After the window
  the segment is added to `hiddenSkipSegmentsForCurrentVideoTime` and is not offered again until the
  playhead leaves it. The headset report that prompted this was exact: on the first build the button sat
  over a 22-second segment for the whole 22 seconds.
* **A highlight is a point, and upstream has a second button for it.** `poi_highlight` is offered from
  the moment the segments arrive until the highlight is reached, capped by the same auto-hide duration,
  and its label is "Skip *to* Highlight" because the jump is to the part most viewers are looking for.

**Where the button lives, and why not in the player-controls card.** The app composites a VR surface
per `VrCardView`, and the player-controls card is *hidden whenever the controller ray leaves it* — the
timeline callback that drives the seek-bar markers only runs while the controls are on screen, which is
the same fact from the other side. The app's own **skip-Ad button** is not in that card: `gtu` builds it
as a standalone card with `gah.q(R.layout.vr_skip_ad_button)` → `T.addVrContentView(card)`, gives it the
`gnd.SKIP_BUTTON` panel slot, and shows it with `gbd.o(boolean)` — which is exactly a floating,
always-drawn, ray-hit-tested surface. The Skip button is the same card, built the same way.

How the extension gets there without naming a single obfuscated member:

| piece | where it comes from |
|---|---|
| the `gnd.SKIP_BUTTON` field | the only holder of the `skip-ad-button` literal, mined out of the enum's `<clinit>` (`sput-object` after the literal) |
| the activity, the layout id, the card factory, the slot setter, the show/hide call | the one method that *reads* that field — the app's skip-Ad-button constructor (`Lgtu;-><init>`), mined at patch time |
| the calls themselves | two bridges the patch adds to the activity: `YtvrSbMakeSkipCard(activity)` (inflate → `addVrContentView` → slot → return the view) and `YtvrSbSkipCardVisible(view, z)` (`gbd.o`). Both names are ours, so R8 cannot break them |
| the handover | `SkipButtonCard.attachActivity(p1)` injected at instruction 0 of that same constructor |

Verified in the built dex before install: `gah.YtvrSbMakeSkipCard` reads
`gahVar.q(2131624785)` (= `0x7f0e0351` = `R.layout.vr_skip_ad_button`) → `n(gnd.SKIP_BUTTON)` →
`return` the view, `gah.YtvrSbSkipCardVisible` is `((gbd) view).o(z)`, and `gtu.<init>` starts with
`SkipButtonCard.attachActivity(gahVar)`.

**Placement.** The card is anchored at the app's own skip-Ad entity (`assets/entities/androidviews/
skip-ad-button.bin` — the position is a bundled asset keyed by the `gnd` name, not remote config, and
two cards may share one slot: nothing in the app registers cards by `gnd`). The phone's button sits at
the **bottom left** of the video, so the card is translated left, in units of the app's own
`player_controls_panel_width` (568dp): 0.5 of a panel was reported "can we move more to left?", 1.0 was
"a bit too far", and **0.75** is what shipped. Measured: `card=315x72px panel=852px offsetX=-481.5
leftEdge=-639.0px density=1.5` — i.e. a 210x48dp button, which is the app's own 48dp Skip Ad button
(`@dimen/floating_action_button_height`, 20dp text), the same height the phone patch's own button
mirrors (`ad_skip_ad_button_min_height`).

**A real bug this found: highlight segments were being thrown away.** `poi_highlight` is answered by
the API as `segment: [t, t]` — a **zero-length** range. `SponsorBlockClient.addSegment` required
`end > start`, so every highlight was dropped before the controller ever saw it, and the Highlight
category had been silently inert since the first build. Measured against the live API for
`kJQP7kiw5Fk`, whose three segments for this client's category list are two `music_offtopic` ranges and
one `[21.808, 21.808]` highlight: the device log said `fetched 2 segment(s)`, now `3`. Zero-length
segments are therefore accepted **for `poi_highlight` only** — for anything else a zero-length segment
could never contain the playhead, so it could never skip.

**What is deliberately one button, not two.** The phone patch has a separate button for a
`manual-skip` range and for a highlight, and can show both at once. This port has one card, so the
range wins when both apply: the segment the playhead is *inside* is the one the viewer can act on now.

**Overlapping segments: the innermost is offered first.** Nesting is everywhere in the real database
— measured against the live API for this client's category list, `e-ORhEE9VVg` has
`music_offtopic [233.808, 272.441]` ⊃ `selfpromo [235.18, 260.653]`, `7wtfhZwyrcc` has an `intro`
overlapping a `music_offtopic`, `JGwWNGJdvx8`/`09R8_2nJtjg`/`lp-EO5I60KA` each have a `music_offtopic`
wrapping an `outro` — so "which one does the button offer" is a real question with a real answer
needed. The first implementation answered it wrong: the list is sorted by start, and taking the first
match is the *outermost* segment. The phone patch's loop replaces its candidate whenever the new
segment is contained in the previous one, i.e. it descends to the **innermost**. With an `intro`
wrapping a `sponsor` that is the difference between offering a 30-second jump and a 10-second one, so
the rule was matched (asked for from the headset, 2026-10-14).

Measured on `e-ORhEE9VVg` deep-linked to 4:15 (`&t=255s`), which puts the playhead inside all three
of the overlapping segments above:

```
skip button offered: selfpromo 235.18s->260.653s
skip button shown: 'Skip Self-promotion' for selfpromo 235.18s->260.653s
skip button offered: outro 259.536s->272.441s
```

The first line is the innermost (`selfpromo`), where the old rule said "Skip Non-music" — the
outermost. The second is the same rule with the phone patch's 800 ms "ends very soon" window on top of
it: once `selfpromo` is within 800 ms of its end it stops being a candidate, so the descent lands on
`outro`, which is contained in the outer `music_offtopic`. The outermost segment is therefore never
offered while something nested inside it is available, which is the point of the rule. Two segments
that merely overlap, neither containing the other, keep the earliest-starting one, because nothing
replaces the first candidate — and that was this port's rule for *every* case before this change.

**One tick, one decision.** The offer used to be published *and* an automatic skip requested in the
same tick, which left the button up for a `manual-skip` segment the app was seeking past — up to a
full tick (~500 ms) before the next tick took it away, and a button that appears and vanishes with
nothing pressed reads as a glitch. Found by reading the code while answering "what happens if I set
Show a Skip button on several categories"; the skip is now decided **first**, and a tick that skips
publishes no offer at all. The `playheadAdvanced` guard that used to sit around the skip loop moved
with it, so the skip cadence is unchanged — only the ordering is.

Both existing decision paths were re-verified on the device afterwards, since the reordering touches
the tick every skip runs through:

```
[manual]  segments ready: 3 (0 auto-skip, 3 skip-button, 3 marked)
          skip button offered: music_offtopic 0.0s->21.808s
          skip button shown: 'Skip Non-music' for music_offtopic 0.0s->21.808s
          skip button placed: card=315x72px panel=852px offsetX=-481.5 leftEdge=-639.0px
          skip button window over (3800 ms) -> offer cleared -> hidden
[auto]    segments ready: 1 (1 auto-skip, 0 skip-button, 1 marked)
          skipping sponsor 40.781s->125.339s (position 41027 ms)
          seek confirmed at 125339 ms (target 125339)
```

with the crash buffer empty across both. **Not measured, and this is the honest part:** the phantom
case itself. No readily-available video has an automatic-skip segment overlapping a manual-skip one —
a scan of 30 popular ids found only one with a `sponsor` segment at all (`P2JjlayovG8`, alone on its
timeline) — and a local fake API is not an option, because the extension refuses a non-`https` base
and falls back to the real one. So the fix is reasoned from the code and verified not to regress what
*is* reachable; the ~500 ms phantom is not something this repo has seen happen in a headset.

**Device verdict — measured end to end (2026-10-14), and confirmed from the headset:**

```
patch settings (youtube.xml): the screen's switches are not there yet, 0 switch(es) on;
  effective: sponsor=skip-once selfpromo=manual-skip interaction=manual-skip poi_highlight=manual-skip
             intro=manual-skip outro=manual-skip preview=ignore hook=ignore filler=ignore music_offtopic=manual-skip
skip button card ready: ...VrCardView children=[HapticsFrameLayout id=0x7f0b0abd visible=true,
                                                LinearLayout id=0x7f0b0ac1 visible=false] label='Skip ad'
segments ready: 3 (0 auto-skip, 3 skip-button, 3 marked)
skip button offered: music_offtopic 0.0s->75.694s
skip button shown: 'Skip Non-music' for music_offtopic 0.0s->75.694s
skip button placed: card=315x72px panel=852px offsetX=-481.5 leftEdge=-639.0px density=1.5
skip button offer cleared (the viewer pressed the button)
skip button hidden
skip button pressed: music_offtopic 0.0s->75.694s
skipping music_offtopic 0.0s->75.694s (position 2360 ms)
seek confirmed at 75694 ms (target 75694)
```

plus `skip button window over (3800 ms)` → `offer cleared (the offer's 3800 ms window ran out)` on the
run where the button was left alone, and `offer cleared (playback stopped)` when the headset slept.
The crash buffer is empty across every run. The card is the app's own layout, so the label, the pill
background and the 48dp height are the app's own styling — only the text is ours
(`CategoryColours.skipLabel`: "Skip Non-music", "Skip Sponsor", "Skip to Highlight", …).

**And the highlight offer, on a video whose highlight is the only thing ahead** (`ru0K8uYEZWw`,
`poi_highlight [8, 8]`, nothing covering the first eight seconds) — the same run also shows that the
*left edge* is what is pinned, since the wider label grows the card rightwards from it:

```
skip button offered: poi_highlight 8.0s->8.0s
skip button shown: 'Skip to Highlight' for poi_highlight 8.0s->8.0s
skip button placed: card=325x72px panel=852px offsetX=-476.5 leftEdge=-639.0px density=1.5
skip button window over (3800 ms): poi_highlight 8.0s->8.0s
```

**The picker outgrew the card, and the first fix taught the check a lesson.** Adding `manual-skip` made
the in-row behaviour list five options where it had been four, and the fifth was cut off by the bottom
of the settings card. That is worse than "out of view": the card clips, and scrolling the settings list
to reach it rebinds the row and closes the list, so "Disable" could not be selected at all. Reported
from the headset and confirmed in a capture (`build/probe/shots/panel-left.png`): four options filled
the visible height and the fifth sat below the edge.

The video-quality picker's two columns were the obvious answer — that picker uses them for exactly this
reason — and they were **wrong here**, which the capture caught and the log did not: the labels in this
list are much wider ("Skip automatically once" against "Highest available"), so in a half-width column
the longest wrapped onto a second line and the grid came out ragged (`fix-08-crop.png`). The constraint
is vertical, not horizontal.

What shipped is one column with **tighter rows**: 15sp with 4dp of vertical padding, about a third off a
row, which fits five where four used to fit with every label still on one line. The marker is two
characters wide either way (`"✓ "` against `"  "`), because the old three-space indent put an unselected
row's text one character to the left of the selected row's — also visible in a capture.

The lesson worth keeping: the two-column build logged each option's `getLineCount()` so that a wrap
would be visible without a headset, and **it reported `1` for every option on a list whose longest label
was visibly wrapped in the capture taken at the same moment.** It appears to read the layout from before
the column was re-measured to its final width. That check is gone rather than kept as reassurance —
the same conclusion the audit's four never-firing checks were paid for — and what remains logged is the
list's own laid-out height, which is what the fit actually depends on. **When a check and a capture
disagree about something visible, the capture is right.**

**Defaults moved with it.** The six categories upstream leaves to its Skip button were `seekbar-only`
here only because there was no button to offer; they are `manual-skip` now, which is upstream's map
again. `migrateOldDefaults` moves rows still holding an old default — **chained**, because a row can be
two defaults behind (`skip` → `seekbar-only` → `manual-skip`) and the editor's writes are not visible
to the store it reads — and **bounded** (`MAX_DEFAULT_MOVES`), because that walk happens inside
`Application.onCreate`: a future edit that made the move table cyclic would otherwise hang the app's
start-up silently, with no crash and no log line. Both halves are asserted by `SponsorBlockPickTest` (`patches/src/test`).

## Observed behaviour (measured on the headset, against a real segment)

What the rules above mean to whoever is watching the picture. Each line was measured on a real
playback, and each is something a user is likely to notice or to file as a bug:

- playback that **reaches** a segment skips the moment the playhead enters it, seeking to the
  segment's end (measured: 0.5 s into a 40.781 s segment start);
- **dragging the seek bar back before** a segment makes it skip again -- the skip is per *pass*, not
  per app run, so re-watching a video skips again too;
- **dragging the seek bar into** the middle of a segment lets it play out, which is what the web
  extension does (a segment you asked for is not yanked away);
- `skip-once` means once per *playback*: seeking back before the segment re-arms it, and only a
  segment you were *seeked into* stays un-skipped while the playhead is inside it;
- no skip is attempted while the app's own ad UI is counting down;
- segments are fetched once per video; `404` -- "no segments here" -- is the normal quiet answer;
- a category set to `ignore` does **nothing at all**, silently — and a category set to `manual-skip`
  offers its button for 3.8 s when the playhead enters one of its segments; a video whose only segments
  are `preview`/`hook`/`filler` still looks like SponsorBlock is broken until that category is switched
  on in Patch settings (see Addendum 19: those three are `ignore` by upstream's own default map).
