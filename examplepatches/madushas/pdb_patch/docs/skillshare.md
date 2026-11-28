# Skillshare patches

**App:** Skillshare (`com.skillshare.Skillshare`) · **target 5.4.81**
(versionCode 7706, minSdk 21, targetSdk 36) · single signed APK
(signer `CN=fuze.cc`, SHA-256 `da279592…b83aaf4`).

Auth is **Auth0 OIDC** (WebAuthProvider + CredentialsManager) with a legacy cookie session;
there is **no PairIP** and **no ad SDK**. Full static recon lives in
`docs/phase2-analysis.md`; the failures and fixes behind it are in
`docs/phase2-devlog.md`.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Unlock premium (client-side)** | ✅ | Forces `AppUser.isMember()` → true and `VideoMetadata.isLocked()` → false, so the paywall CTAs, premium badges and locked-lesson chrome are gone and every lesson row is playable/downloadable in the UI. |
| **Remove ads** | ✅ | Force-disables any ad-SDK auto-init provider and strips the advertising-ID / ad-services permissions. The build ships no ad SDK, so this is the defensive pass. |
| **Disable trackers** | ✅ | No-ops Sentry's init, Singular's init and the app-owned event sink. Firebase push/install-ID are kept. |
| **Disable Blueshift engagement SDK** | ⛔ | No-ops Blueshift's SDK init and app-open event. Off by default — Blueshift also drives rich push and the in-app inbox. |

## Entitlement model — what is client-side and what is not

Three surfaces that are usually conflated, kept apart in this app:

1. **Local membership flag** — `AppUser.isMember()Z` returns `subscription != null`.
   16 call sites, all paywall/checkout/lesson/list/settings chrome
   (`LessonsPresenter`, `CourseDetailsPresenter`, `CourseDetailsActivity.setupPremiumCta`,
   `DownloadsActivity`, `ProjectsFragment`, `SettingsPresenter`, `SplashActivity`, …).
   It also decides the lesson-tap branch: `!isLocked()` → play, `else !isMember()` →
   checkout, `else` → play. So forcing it true makes **every** lesson take the play branch.
2. **Per-lesson lock flag** — `VideoMetadata.isLocked()Z` returns `videoHashedID == null`.
   The API omits `video_hashed_id` for lessons the account may not watch, so this flag is
   **derived server-side**, not computed locally.
3. **The media itself** — playback is `GET /sessions/{session_id}/stream`, which returns
   the HLS/DASH `type`/`url` pairs parsed by `GetVideo$getRemote$1`; downloads are
   `GET /sessions/{video_id}/download` via the system DownloadManager. Both are requested
   from the app's authenticated backend (Auth0 interceptor).

The decisive detail: **`session_id` is `VideoMetadata.id` — a plain integer that is present
for locked lessons too**. Only `video_hashed_id` is withheld. So after the patch the client
*will* request a premium lesson's stream; whether the backend serves it is a server
decision. The Cloudflare variant (`videoHashedIDCf`) is stored in Room but never used to
build a URL, so there is no local signing to exploit.

**Honest classification:** this patch removes the paywall UI and the client-side refusal.
It does **not** grant access to premium media. The patch description says so; a profile
with no subscription should still expect premium lessons to fail to play.

## Telemetry inventory (verified)

| SDK | Size | Init anchor | Fate |
|---|---|---|---|
| **Sentry** | 934 classes | `SentryAndroid.b(Context, AndroidLogger, OptionsConfiguration)V` from `Skillshare.onCreate()` | no-op |
| **Singular** | 168 classes | `Singular.init(Context, SingularConfig)Z`, keys `skillshare_518a9fdc` / `1e406bb6b13688b03362cdad39634dfa` | no-op (returns false) |
| **Blueshift** | 228 classes | `Blueshift.initialize(Configuration)V` + `trackAppOpen(Z)V` | no-op, **off by default** (it serves rich push / in-app inbox; 13 manifest components) |
| **Firebase** | messaging 114, installations 81 | `FirebaseInitProvider` (auto) | **kept** — push delivery + the Blueshift token resync depend on it |
| **App-owned events** | — | `MixpanelTracker.a(MixpanelEvent)V` → `POST /events/track` | no-op |

Two corrections worth remembering, because both are easy to get wrong:

- **"Mixpanel" is not the Mixpanel SDK.** There is no `com/mixpanel` package (0 classes);
  the app's own event sink is named that way and posts to its own `/events/track`.
- **537 Facebook classes are Stetho**, a debug inspector with no manifest provider and no
  analytics — not a tracker surface.

## Ads: there are none

Zero ad-network classes (no GMS Ads display, AppLovin, Unity, ironSource, Vungle, Pangle,
ByteDance, MoPub, InMobi, AppsFlyer, Adjust, Amplitude, Segment, OneSignal, Sentry-free
ads). The six `com/google/android/gms/ads` classes are the deprecated
`AdvertisingIdClient` identifier — an ad-tracking surface, not a display SDK, and it is
covered by the permission strip. The `cast_ad_label` strings are Google Cast media-router
resources, not app ad inventory.

## Verification (2026-11-19, Morphe CLI on the real 5.4.81 APK)

Patched with `--exclusive --validate` on the unmodified base APK:

- `Unlock premium (client-side)` → `isMember()Z` patched body is
  `const/4 v0, 0x1` / `return v0`; `isLocked()Z` is `const/4 v0, 0x0` / `return v0`
  (original bodies remain but are unreachable — the repo's `returnEarly` idiom).
- `Disable trackers` → `SentryAndroid.b` is `return-void`, `Singular.init` is
  `const/4 v0, 0x0` / `return v0`, `MixpanelTracker.a` is `return-void`.
- `Remove ads` → all three declared ad permissions (`com.google.android.gms.permission.AD_ID`,
  `android.permission.ACCESS_ADSERVICES_ATTRIBUTION`,
  `android.permission.ACCESS_ADSERVICES_AD_ID`) are absent from the patched manifest.

Static verification only: the CLI's DEX verifier flags ~1,949 pre-existing
`androidx/compose/compiler/plugins/kotlin/**` references (the Compose compiler plugin
classes the app bundles reference Kotlin compiler internals that are absent at runtime).
Those are artifacts of the original build, not of this patch, and no other verifier
findings appear.

## Device verification (2026-11-20, physical Android 15)

Device `LZ0A56LKDD8007166` (Z2473) running `/tmp/build/skillshare_patched.apk`, signed in
profile "Madusha Sandaruwan". The question the section above left open — *is full-course
playback obtainable?* — is now answered: **no, it is a server-side gate.**

### Stream / download API paths (traced in `smali_classes2/...` of the decoded 5.4.81 APK)

| Call | Signature | Path | id used |
|---|---|---|---|
| Play (local first) | `GetVideo.b(J)Single` → `CourseDownloadService.c(J)Maybe`, then `a(J)` | — | `VideoMetadata.id` |
| Play (remote) | `video_metadata/Service.get(J)` → `Single<VideoUrls>` | `GET /sessions/{session_id}/stream` | `VideoMetadata.id` |
| Per-lesson metadata | `CourseVideoMetadataApi$Service.show(I)` → `ShowResponse` | `GET /utility/video/metadata?class_sku=<I>` | `VideoMetadata.id` |
| Download | `systemdownloader/AndroidDownloader.b(J, String, Z, String, String)J` | `GET {endpoint}sessions/{id}/download` | `VideoMetadata.id` |

- `session_id` is a `J` long built by `int-to-long` from `VideoMetadata.id`
  (`LocalVideoPresenter.smali` ~1027 and `GlobalCastPlayer.smali` 853-860 both read
  `Lcom/skillshare/Skillshare/core_library/model/Video;->e:I` = `VideoMetadata.id`).
  `videoHashedID` is **never** used to build a URL — only `Video.d` is read by
  `BaseVideoPresenter.u(I)Z` for the auto-advance decision (below).
- `VideoUrls.streams` (Gson `@SerializedName("streams")`) must contain **both** a `dash`
  and an `hls` entry or `GetVideo$getRemote$1$1.invoke` throws
  `Throwable("VideoURL API response missing dash or hls URL")` — an explicit, citable
  client-side failure string.
- `videoHashedIDCf` (`video_hashed_id_alt`) and `isCloudflareReady`
  (`is_cloudflare_ready`) are read **only** by the Room DAO
  (`core_library/data_source/video/download/VideoMetadataDao_Impl*`). The playback and
  download paths never touch them, so there is **no Cloudflare media path** in this build
  to exploit — media always comes from `/sessions/{id}/stream`.
- Downloads use the *same* integer id: `CourseDownloadManager` builds
  `DownloadQueueItem` with `c:J = VideoMetadata.id` and `d = "{parentClassSku}-{id}"`
  (which is also the local filename prefix `skillshare-<n>-001.mp4` seen in
  `/sdcard/Android/data/com.skillshare.Skillshare/files/Movies/`).

### A/B probe (local files deleted so playback cannot be served from disk)

Both downloads in `.../files/Movies/` were deleted (`skillshare-1389260458-001.mp4`
27.8 MB complete, `skillshare-1607370408-001.mp4` 37.8 MB partial) so every tap had to
resolve over the network. Results from `dumpsys audio` player events for uid 10529:

| Tap | AudioTrack created | `event:started` | Outcome |
|---|---|---|---|
| 1. Trailer 2:31 | 13:47:32.102 | 13:47:36.725 (+1.8 s = network fetch) | format 44100 Hz / stereo → device 3 (speaker), played to 13:48:07.624 |
| 3. How to Begin 13:17 | **none** | — | nothing plays; surface stays idle |
| 2. Introduction 12:09 | **none** (after its local file was deleted) | — | nothing plays |
| 2. Introduction 12:09, *with* its 37.8 MB local file present (13:06:27.733) | created | 13:06:28.423 (0.7 s) | played 78 s — **from the local file, not the network** |

So the trailer streams from the server; a full-course lesson does not stream even though
the app builds the same request with the same integer id. Earlier local-file playback was
what previously looked like "lesson 2 works".

**The failure is silent by design.** `LocalVideoPresenter` subscribes the stream Single
with an error consumer that only reads `Throwable.getMessage()` and returns
(`androidx/activity/compose/a.accept`, case `0x1c`, in `smali/androidx/…`), so a refused
stream shows no toast, no dialog, no logcat line and no accessible-surface change — the
player just sits blank. Sighted proof that the player really ran came from a screenshot
(`vision-check`): a player surface with the course title card and no error text.

### Second client gate found (does not explain the failure, but is real)

`BaseVideoPresenter.u(I)Z` returns *true iff the video at index `i` has a non-empty
`videoHashedID* (`Video.d` + `StringUtil.a(String)Z`). It is read by
`LocalVideoPresenter.c(I)V` (the video-completed handler) and `BaseVideoPresenter.o()Z`,
and it decides whether the player auto-advances to the next lesson (`r()V`). Consequence:
after the patched trailer finishes, the client refuses to roll into lesson 2 **because
lesson 2's `videoHashedID` is null** — a second, unpatched client-side effect of the
withheld field. Forcing it would only enable auto-advance into a lesson that the server
still refuses to stream, so it cannot restore playback.

All remaining `isMember()Z` sites are already neutralised by the patch and are UI/flow
gates only: `LessonsPresenter.smali` ~2057 (`if (!isMember && index != 0) →
PlayState.g`, i.e. the "first lesson only" state), `CourseDetailsActivity$setupVideoPlayer$1.smali`
~525 (fullscreen entry, `!isMember() && !course.isFree()`), `LessonsPresenter.j(Z)`
(download gate). Between the lesson tap and the stream request there is **no** entitlement
check: `CourseDetailsPresenter.c(IZ)` → `GetCourseForUser.a(I)` (a local Room read) →
`CourseDetailsPresenter$load$2` → `CourseDetailsPresenter.e(Course,Z)` →
`VideoPlayerInput(course, currentUser)` (stores fields only) →
`ICourseVideoPlayer.e(VideoPlayerInput,Z)` → `VideoPlayerPresenter.s/u` →
`LocalVideoPresenter` → `GetVideo.b(VideoMetadata.id)`.

### Verdict

**Full-course playback is not obtainable by any client patch.** The client already sends
`GET /sessions/{VideoMetadata.id}/stream` for locked lessons (the id is an integer that is
always present, so the "null id can't build the URL" hypothesis is disproven); the backend
simply does not return playable `streams` for those lesson ids for this account, while it
does for the trailer. The unpatched client-side work the patch does — `isMember()` and
`isLocked()` — removes the paywall chrome, the tap refusal and the badge; the remaining
block is the server's response, which `LocalVideoPresenter` swallows silently.

Side effect of this probe: the two local download files listed above were deleted to force
network playback. The "Download all" toggle is still on, so the course will re-download,
but the download DB may report a stale "downloaded" state until it re-runs.