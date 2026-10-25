# NuvioTV IntroDB submissions

Current target: **NuvioTV 1.1.0-beta.8 (1071)**. See [beta.8 contracts and verification](NuvioBeta8.md). The older DEX notes and artifact paths below record the beta.7 implementation; beta.8 replaces its native symbols.


The optional **NuvioTV - Submit segments to IntroDB** patch targets only
`com.nuvio.tv` **1.1.0-beta.8**. Select it when patching the original app.
It works alone and with playback button customization.

## Setup and playback

Open **Settings > Layout > Santodan-Patches > Playback**:

- **IntroDB segment submissions** enables or disables the playback feature.
- **IntroDB API key** opens an editor matching Anime Skip's native API menu:
  700dp width, single-line field, focused Card border/cursor, and a right-aligned
  **Cancel / Clear / Save** row. Save stores the entered key; Clear removes the
  saved key and closes the editor; Cancel leaves the saved key unchanged. The
  settings row displays only Configured or Not set.

The preference and key are saved locally for this app installation and shared by
its profiles; they do not sync to Nuvio's cloud settings. Submissions start disabled.
The API key can be edited in Settings even while the feature is disabled.

During an IMDb episode, a dedicated **Submit segment** button appears at the end
of the main playback row. Its filmstrip icon changes from **play** (mark start)
to **stop** (mark end) and then **check** (review).

1. Press it at the segment's start. The current native playback position is saved.
2. Press it at the segment's end. That position is saved and the review dialog opens.
3. Check the IMDb ID, season, episode and captured timestamps. Choose Intro, Recap
   or Outro in the **Segment type** dropdown inside the review dialog, then press
   **Submit**. **Submit / Cancel** share one horizontal row; Cancel discards the capture.

Times retain millisecond precision. The playback clock is sampled on each press,
using Nuvio's existing helper for either ExoPlayer or MPV, rather than a wall clock
or a composition-time snapshot. End must follow start. The button label indicates
whether the next press will capture the start, capture the end, or reopen review.
With playback customization disabled or absent, the button stays at the end of
the main row. When customization is enabled, its filmstrip entry can be hidden,
reordered or moved to More actions through **Edit playback buttons**. Its capture
callback and stage icons remain unchanged, and an open review dialog remains
composed even if its control is hidden or in collapsed More actions.
It is hidden when the feature is disabled, for live playback, and when the episode
has no consistent IMDb/season/episode identifiers. Movies and other provider IDs
are not submitted. A missing API key opens a native message directing you to Settings.

The native **NuvioDialog**, settings controls, key-entry Card/BasicTextField,
anchored segment dropdown and dialog action buttons provide the app's theme and focus style.
There are no platform AlertDialogs or key/enable fields in the playback dialog.
Stream information keeps its original action. The controls hide timer and the
full-screen pause/standby overlay timer are suspended while reviewing/submitting,
including while the segment-type dropdown is expanded. Native interaction cannot
rearm either timer until review closes. Both native schedulers resume on close;
the pause overlay still follows Nuvio's enabled/paused/first-frame conditions.
Activity pause clears the draft
and cancels further request work. A controller/profile, episode or stream-cut change
starts a fresh capture; no draft is saved to disk.

### Beta.8 standby correction

Cancelling only `Lab/mc;->T0:Job` stopped the controls-hide timer but left the
separate `d4:Job` pause-overlay timer running. Opening review now invokes native
`Lab/zf;->i(Lab/mc;)V` to cancel the pause job and clear its visible overlay.
The unique static schedulers `F(Lab/mc;)V` (10 registers) and `H(Lab/mc;)V`
(177 registers) receive an entry guard for the active foreground IntroDB draft's
controller. The guard returns before scheduling while review is open, and falls
through to the exact original method otherwise. Closing clears the draft before
calling both native schedulers; activity pause does not restart them.

These contracts are proven against `../OriginalApps/NuvioTV-1.1.0-beta8.apk`
(`com.nuvio.tv`, `1.1.0-beta.8`, code 1071; SHA-256
`7aeae6f64e9128be2c7545c50061376839e20a88d47722ac220ba40be7c182f8`).
Exact native fingerprints reject changed or already-patched timer methods.
The hooks use local `v0` and preserve controller parameters, register counts,
native branches and exception boundaries. No playback pause/resume event is sent.

Verification for this correction:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:verifyNuvioIntroDb :patches:verifyNuvioIntroDbRuntime :patches:verifyNuvioBeta8Bundle --offline
.\build-local.ps1 :patches:verifyNuvioIntroDbApk :patches:verifyNuvioPlaybackApk -PnuvioPlaybackApk=../../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-introdb-timer-signed.apk -PnuvioRequireStability=true --offline
```

Host runtime checks cover pending standby cancellation, both scheduler guards
during review/dropdown use, controller isolation, restart on close, and no restart
on activity pause. The original-DEX verifier rejects missing/changed/duplicate
timer hooks, writes/reloads them, restores their exact original fingerprints, and
checks the other timer-class methods are unchanged. The packaged standalone and
combined checks include five IntroDB calls and unchanged original hierarchy findings.
The bundle is `patches/build/libs/patches-0.13.0.mpp`; the all-sixteen-patch APK is
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-introdb-timer-signed.apk`.
No device installation or testing was performed. On device, leave the segment-type
dropdown open beyond the configured pause-overlay delay, then close review and
confirm that native standby behavior resumes.

## Submission protocol

The reference is `NuvioMedia/NuvioMobile` revision
`c78756d0cbda3337cfff36a95d8b6708f48c0d72`, particularly
`composeApp/src/commonMain/kotlin/com/nuvio/app/features/player/skip/SkipIntroApi.kt`,
`SkipIntroRepository.kt`, `SkipModels.kt`, and `SubmitIntroDialog.kt`.

The patch sends `POST https://api.introdb.app/submit` with a Bearer API key and
`imdb_id`, `season`, `episode`, `start_sec`, `end_sec`, `start_ms`, `end_ms` and
`segment_type`. Only 200/201 are success. A bounded background worker sends a single
request with 10-second connect/15-second read timeouts, no redirects and no automatic
retries. Duplicate presses cannot send concurrent submissions. Success disables
Submit in the current dialog; authentication/server failures remain visible for an
explicit retry. A connection failure or cancellation cannot establish whether the
server accepted a request; check IntroDB before retrying.

For rejected requests, the dialog displays the HTTP status and the provider's JSON
`error` text, if present. Error bodies are limited to 4096 bytes, displayed messages
to 240 characters, control characters removed and any exact API-key echo redacted.
Malformed, oversized or unreadable bodies retain the HTTP status. Response bodies
are never logged. The [provider's OpenAPI schema](https://api.introdb.app/openapi.json)
documents duration-out-of-range HTTP 400 errors, with a recap example of 5–480 seconds;
it does not specify intro/outro duration limits. No guessed minimum is enforced locally.

## Latest APK hook evidence

Input: `../OriginalApps/NuvioTV-1.1.0-beta7.apk`; manifest package `com.nuvio.tv`,
version `1.1.0-beta.7`, code 1070.

- `Lva/bd;->invoke(Object,Object):Object` is the main control-row lambda. Its
  original fingerprint is
  `2c382f8f1152d222b534cab5f4e8fc70c38cbf80515be32533ed434002e75f00`.
  There are 49 registers: `this=v46`, composer argument `v47`, flags argument `v48`.
  After the final native control call, before the Row's group closes, insert
  `invoke-static/range {v46..v47}, NuvioIntroDb.renderControl(Object,Object)`.
  Registers, original button calls, branch paths and exception boundaries remain
  intact. The feature does not wrap or alter the Stream information callback.
- The owner's `c:va.ue` leads through `Y:va.k8` to the current native controller;
  `e:va.re` contains the episode fields. Native `o`, `p`, and `q` provide the normal
  up-focus, down-key and on-focused contracts for the new button.
- `va.re.x0:Integer`, `y0:Integer`, `z0:String` mean season, episode, video ID;
  their generated `toString` proves the mapping. `i:String` identifies the stream cut.
- Static `Lva/z9;->e(Lva/k8;)Long` returns MPV's `va.b2.l()` or ExoPlayer's
  `Player.getCurrentPosition()`, and null when no player exists. The actual DEX
  references are validated. `va.k8.H0:StateFlow` contains the timeline's live flag.
- `va.k8.T0:Job` is the controls hide job; static `va.sa.F(va.k8):void` cancels and
  replaces it. Review cancels it through the existing native coroutine API; close
  calls the native scheduler. Both contracts are checked before patching.
- The key input reuses Anime Skip's `ab.n0(FocusRequester,KeyboardController,
  MutableState,MutableState,int)` branch 0 inside the same focused Card composition
  from `ab.v0` branch 0. `ab.d(2,state)` tracks focus; `ab.m0(focus,0)` requests
  input focus. Theme spacing/colors, rounded shape, focused/unfocused borders and
  native Cancel/Clear/Save button text/colors match `AnimeSkipClientIdDialog`.
  The host is `ha.m2.z(...)`, width 700dp, with the same default mask 16368.
  It has no dependency on Anime Skip's ViewModel, credentials or network API.
- Filmstrip stage icons use the native `k2.d` vector builder and `io.sentry.d2`
  path builder, following the exact constructor/brush/path contracts of the APK's
  existing icons. The three vectors are cached; each has a distinct center glyph.
- The anchored dropdown reuses `za.a.b(Modifier,String,String,String,boolean,List,
  Function1,Function1,boolean,Composer,int)`, the original Discover dropdown. Its
  `za.d(String label,String value)` options expose label in `a` and value in `b`,
  proven by the original constructor/toString. The native component handles popup
  sizing, selected-item focus and dismissal; the review dialog remains composed.
  Submit and Cancel use two `ab.uh.d` buttons within one `ab.uh.e` action row.
- `MainActivity.onResume()V` initializes app-scoped preferences; `onPause()V`
  clears transient state and cancels network work. No Activity/composer is retained.

The playback customization verifier accepts only this exact appended call, at the
final button, with registers v46/v47. The IntroDB verifier restores only known
same-register customization bridges on a copy before comparing the original
fingerprint. Both patch orders reject missing, changed, ambiguous and duplicate
layouts and preserve the existing native buttons.

When both patches are selected, the proven IntroDB call is placed immediately
before the final customization bridge in either application order. This allows
the optional `collectIntroDb(Object[])` runtime bridge to capture the button's
native arguments before the customized row renders. IntroDB remains independently
selectable and renders normally when customization is absent or disabled.

## Verification and artifacts

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
.\build-local.ps1 :patches:verifyNuvioIntroDb :patches:verifyNuvioIntroDbRuntime
.\build-local.ps1 :patches:verifyNuvioPlaybackButtons :patches:verifyNuvioPlaybackButtonsRuntime
.\build-local.ps1 :patches:verifyNuvioBeta7SettingsMenuRuntime :patches:verifyNuvioBeta7Bundle
.\build-local.ps1 :patches:verifyNuvioIntroDbApk
```

The focused verifier reads all original DEX, checks native APIs and field semantics,
rejects invalid hooks, tests both playback patch orders and writes/reloads DEX.
It validates captured millisecond JSON, timestamps, identifiers, HTTP statuses,
authorization headers, redirect prevention, timeouts and cancellation.

The production runtime runs against native-signature Compose fixtures and fake
HTTPS. It tests Settings toggle/key entry/persistence/removal, two presses using
live position reads, native review/dropdown/actions, controls timer cancellation and
restart, off-UI requests, duplicate suppression, visible errors, pause cancellation,
stale-result suppression, episode/stream isolation, live/disabled gating and balanced
Compose groups. It includes both real cancellation overloads as a regression trap,
Cancel/Clear/Save semantics, all three icons, dropdown expansion/selection/dismissal,
horizontal actions, provider validation reasons and credential-safe logging.
Shared menu checks include IntroDB alone, with playback customization,
and with all runtime patches. No test posts to the live IntroDB service.

Artifacts after verification:

- `dist/patches-0.11.2-nuvio-introdb.mpp`: verified bundle snapshot.
- `../Apps/NuvioTV/NuvioTV-1.1.0-beta.7-introdb-unsigned.apk`: rebuilt original
  package identity with only this feature and its shared Settings dependency.

Validation on 2026-10-21 passed all commands above. Standalone and combined DEX
have no additional hierarchy findings over the original's 36 optional-library
findings. The rebuilt APK retains package/version `com.nuvio.tv` / `1.1.0-beta.7`,
all 112 original native libraries, and valid four-byte ZIP alignment. Stale APK
v1 signatures are absent.

Device checks remain for actual remote focus, native keyboard entry, playback
navigation/auto-hide, profiles, MPV/ExoPlayer position accuracy and a real submission
with the user's key. Host/DEX checks do not establish device UI behavior. The APK
is unsigned, has not been installed, and has not been tested on a device.

## Second-press correction and logcat

The original DEX has two four-parameter `Job.DefaultImpls.cancel$default` methods:
one accepts `CancellationException` and returns void; a legacy overload accepts
`Throwable` and returns Boolean. The previous name/arity lookup rejected this as
ambiguous exactly when the second press tried to suspend the controls timer.
Runtime now selects the exact `Job, CancellationException, int, Object` signature.
Timer reflection failures are logged without throwing from the capture callback.
No device crash log was available, so this fixes a proven code defect without
claiming that a device crash has been reproduced or every device cause resolved.

Use this command before reproducing the problem, and Ctrl+C afterward:

```powershell
adb.exe logcat -b main -b system -b crash -v threadtime "ActivityTaskManager:I" "ActivityManager:I" "SantodanPreferred:V" "SantodanCurrentStream:V" "SantodanIntroDB:V" "SantodanMergedProgress:V" "SantodanRemaining:V" "SantodanAiring:V" "SantodanFinale:V" "SantodanSettings:V" "SantodanStreams:V" "SantodanThumbs:I" "ThumbDecode:D" "ThumbWorker:D" "AndroidRuntime:E" "DEBUG:E" "libc:F" "*:S" > logs_patch.log
```

`SantodanIntroDB` records runtime readiness, enable/disable, key saved/cleared
(configured Boolean only), captured positions, review opening, request status,
and timer/UI failures. API keys, authorization headers, stream URLs and response
bodies are not logged. AndroidRuntime and the crash buffer capture the failure
even on the previous build, which did not have the IntroDB tag.
