# Videoland Android TV 1.117.0

Experimental candidates implement separate `Hide ads` and `Disable tracking`
controls. Both default on in the dev prerelease so Simple mode includes them as
normal controls. The combined APK is installed on the target TV,
startup/account pairing was observed, and the user confirms Premium playback.
Ad-supported playback still needs community feedback. Publication is authorized
on dev; main receives documentation for finding/testing that prerelease only.

## Inspected input

| Property | Seen in supplied artifact |
| --- | --- |
| Package / application | `nl.rtl.videoland.v2` / `nl.rtl.videoland.tv.Application` |
| Version / code / minSDK | `1.117.0` / `1622` / `24` |
| TV discriminator | Required `android.software.leanback`, TV launcher activity |
| APKS contents | Base, armeabi-v7a ABI split, xhdpi resources split |
| Publisher certificate SHA256 | `6c7782ca5cabbaaf0546c31b63b7a5ed112ef6a00a5422fa263c2516dee2c141` |
| Original APKS SHA256 | `f3ceb9e7a87552d51f37e1bfe2b5c8d7d21e337e8e7564835a4891b92732bbdb` |
| Original base SHA256 | `86b891e101c30b2c5588ff1e285d37a68e574a9e005f574844fc1b4df3760298` |
| DEX inventory | 4 DEX files, 33,169 classes, 140,770 methods |

**PairIP:** no PairIP classes, `VMRunner`/`SignatureCheck` references, VM assets or
PairIP library were found in the supplied split set. Base assets contain only
baseline profiles. The sole native library is
`lib/armeabi-v7a/libandroidx.graphics.path.so`; its bytes are preserved in the
candidate. There is no identified PairIPFix target, so no startup bypass is added.
The installed combined candidate reaches account pairing without a PairIP fix;
the user subsequently confirmed Premium playback. This is bounded runtime
acceptance, not proof that every re-signed application feature works.

## Ad paths and edits

The app uses Bedrock's native player and ad engine. `res/raw/applaunch.json` has
`playerAdsLoaderEnabled=0`, `playerPauseAdEnabled=0`, disabled VAST pause config,
and enabled NPAW/Snowplow/Tealium settings. Remote configuration can override
bundled values. An ad-loader-only patch would leave the legacy queue path.

| Seen symbol / behavior | Implemented boundary |
| --- | --- |
| `AdEngineAdRequester.a(Lbv/c;)` delegates cuepoint HTTP/VMAP loading; `b(JLze/n;)` returns video-ad lists | Return the shipped Kotlin empty list synchronously from both methods. Both the legacy queue and optional Media3 loader consume this requester. |
| `AdsQueueAdItemTransformer.a(Object)` and `AdsLoaderAdItemTransformer.a(Object)` cast their input to `List` | Preserve the list contract; no abandoned continuation or wrong null result. |
| `LBannerAdRequester.a` provides cuepoints, `b` returns a nullable banner item; `ze/p.c` handles null before transforming | Empty cuepoints and null item; no request is opened. |
| `AdEngineConfigImpl.a()` supplies nullable VAST pause config | Null config; `GetFirstPlayablePauseAdItemUseCaseImpl.a` also returns its existing `J9/d` typed `Empty`. |
| `TvReplayControl.U()` schedules/shows the legacy pause ad | Return before scheduling or overlay display. Other pause/resume/control methods remain. |
| `PlayerConfigImpl.d()` consumes `playerAdsLoaderEnabled` | Pin off at consumption, including cached/remote config. |
| `YospaceDaiResourceCreator.a(of/a)` creates a Yospace resource and appends targeting query parameters | Return null at the optional creation boundary. |
| `LiveQueueItem.u()` checks the DAI predicate, then the nullable resource; for `De/b` and supported playback mode, null selects the supplied fallback | Preserve this complete caller, the DAI predicate, source URL selection, DRM and track preferences. No guessed origin URL. |

**Inference requiring playback evidence:** skipping client requests should remove
the inspected client video/banner/pause ads; the Yospace null result should select
the server-supplied live fallback where that branch is available. A DAI-only
manifest or fallback containing stitched/broadcast ads can still show ads. No
manifest/segment rewrite or complete SSAI-removal claim is made.

The follow-up source-selection audit traces `CreateMediaContentUseCase.a` back
to the server's `Media.assets` list. After codec, DRM and quality filtering, it
constructs `De/b` only when a distinct, non-DAI alternative survives selection.
Its fallback selection uses the `SOFTWARE` DRM type; the chosen stream can therefore
have different quality/DRM characteristics from the main asset. `LiveQueueItem.u`
switches that wrapper only after a DAI resource returns null and the wrapper has
not already selected its fallback. Ordinary non-DAI sources and an already selected
fallback remain unchanged. With no alternative, the original DAI source remains;
this does not prove it is ad-free or playable without Yospace session handling.

## Tracking paths and edits

| Seen symbol / behavior | Implemented boundary |
| --- | --- |
| `ConfigImpl.g(String)` supplies Tealium activation, NPAW v7 and Snowplow player flags | Force exactly those three keys false; every other/null key delegates to the unchanged original body. |
| Tealium activation observer `Hj/f.accept` initializes the SDK when true | False activation prevents that initialization; `TealiumTaggingPlan.o0` and `s0` also stop event/view scheduling before attribute collection. |
| `SnowplowTracker.<init>` constructs an emitter and sends `InitEvent` regardless of the later player-session flag | Keep Object initialization and all three dependency assignments, then return before emitter creation. Tracker/session fields stay null. |
| `CreatePlayerAnalyticsAdapterUseCaseImpl.a` returns null when NPAW v7 is disabled | Use the original disabled branch, preventing plugin construction and offline event replay. |
| `GoogleAdvertisingIdSource.a` returns `x6/b` when advertising is limited/unavailable | Return the same typed limited result without a Play Services call. |
| `Vo/b.onCreate` starts New Relic separately from its startup provider | Gate `NewRelic.start(Context)` and remove only `NewRelicAppContentProvider`. |
| `A3/T.e(Br/h)` is the dedicated CCT HTTP method on an R8-merged class | Return its real `A3/X(403, null, 0)` response before opening a connection. Other methods on the merged class remain intact. |
| The original `Uploader.a` maps 403 to fatal status, deletes the processed batch and completes | Preserve the uploader and avoid transient retry/redirect behavior for persisted telemetry. |

Remove exactly five advertising/AdServices permissions. Set nine automatic
Firebase/Facebook analytics, advertising-ID, performance, crash, session and
messaging-metrics flags. The original manifest already disabled several consent
defaults and analytics collection. Preserve all other manifest content, including
Firebase initialization/configuration/messaging, functional components, the real
OneTrust flow, account/progress requests and media services.

AppsFlyer-named configuration/Tealium attribute helpers are present; no standalone
AppsFlyer SDK was found in this input. Blocking Tealium activation/event sinks
covers that inspected export path. Bundled SDK presence alone is not evidence of
live collection. Functional provider requests still disclose information to their
operators. Complete traffic silence and anonymity are not claimed.

## Reference patch research

KIJK's hosted WebView bootstrap does not fit this native player. NPO's optional
ad-loader path, typed result handling, exact original-input guard and independent
whole-method verifier supply the local conventions. No NPO PairIP recovery is copied.

The supplied `atv-patches` checkout was inspected at
`10bf0c94d93d8bb92ab0efe4cee2826d92f589bb`. In particular,
`patches/.../paramount/ParamountPatch.kt` records why empty DAI requests were replaced
when they broke playback and how a real native skip branch differs from merely
disabling an SDK. MLB's notes distinguish suppressed SDK calls from still-fetched
stitched segments. Videoland's edits use its own inspected contracts and preserve
the explicit live fallback; reference-app endpoints and registers are not copied.

## Verification

- Android bundle build succeeds with JDK 21 and the installed Android SDK. Build
  credentials/maps key were loaded from existing private files without source edits.
- 152 host tests pass. The verifier rejected the unmodified stock tree before
  implementation; mutation tests reject empty/missing contracts and unrelated
  method/root/component/metadata changes.
- Ad-only, tracking-only and combined FULL-mode candidates each pass all 140,770
  original-method contracts. Only the owned inserted instruction blocks differ;
  complete original tails, branches and exception targets are retained.
- Recursive manifest comparison permits exactly two split root attributes and five
  distribution metadata removals by Morphe's merger, plus the selected privacy
  flags, permissions and provider. Other manifest nodes/attributes are preserved.
- APK archives differ between selections only in the manifest and changed DEX
  entries. Other archive entries and the original native library are identical.
- All three APK signatures verify and use the same Morphe signer SHA256
  `d11fc1c983f0b234ccc12e9090c396b219d716d8ddbc364502729e694d821e17`.
- Attempting to patch the re-signed candidate is rejected with `Untrusted or missing
  Videoland Android TV signer`; original publisher input is required.
- On the connected API 34 G17, isolated `app_process` probes execute the actual APK
  methods: **13 ad cases**, **14 tracking cases**, **27 combined cases** pass. They
  check real return types, unknown/null config delegation, CCT response fields and
  initialized Snowplow dependencies with no emitter/session. Stock fails the ad
  probe with the expected null-backing-config exception. The harness uses unique,
  read-only temporary APK/DEX files and removes them afterwards. No Videoland APK
  was installed or application/account data accessed. These probes establish method
  behavior, not application startup or network/playback acceptance.
- Four additional ad cases execute the original `LiveQueueItem.u` source decision
  with synthetic assets and the real patched Yospace gate: DAI with a fallback,
  ordinary non-DAI, an already selected fallback, and DAI with no fallback. They
  check source identity, the fallback state, factory call count and retained DRM
  object. Each fixture deliberately stops at its absent player configuration
  immediately after the decision; no media resource, real preferences, player,
  DRM session or network is opened. These cases do not establish full live playback.
- Fresh independent review found no critical/important patch defect. Its manifest
  coverage and incomplete-inventory findings were addressed with regression tests.

| Candidate | SHA256 |
| --- | --- |
| Ad-only | `659ae1761ccf67a752cdfbf7b923cf09c30cd4d0171b8ff800c06012776b0d1f` |
| Tracking-only | `2fe111c86f668ba240a42ad08c29042a71ca836db3354813fb64159bf618450d` |
| Combined | `d0c6e622c932a2cc626f491418a8e1e286031267ba1d1add79a11f0b3c507f2f` |

## Reproduction and user acceptance

Build with `python3 scripts/build.py :patches:buildAndroid` and the normal private
build environment. Use Morphe Desktop 1.19.1 with original APKS, the new bundle,
`--exclusive --validate --bytecode-mode FULL`, and `-e 'Hide ads'`,
`-e 'Disable tracking'` or both. Both controls are recommended/default on; use
`--exclusive` for isolated single-control checks. The initial private candidate
used explicit selections while its metadata defaulted off. The user requested
normal defaults after confirming Premium playback; only selection metadata and
descriptions changed, not the emitted application edits.

Decode outputs using Apktool, then run:

```sh
python3 tests/verify_videoland_atv.py ORIGINAL_DECODED CANDIDATE_DECODED --ads --tracking
python3 tests/run_videoland_atv.py --serial DEVICE --apk CANDIDATE.apk --ads --tracking
python3 -m unittest discover -s tests -p 'test_*.py'
```

Use only the corresponding selection flags for individual candidates. The ART
harness installs no app, opens no account storage and supplies synthetic inputs.
Its Android SDK/JDK paths can be overridden.

Delivery directory: `/Users/jneerdael/Desktop/Videoland-TV-1.117.0-test/`.
Private extraction/evidence: the system temporary directory's
`re/videoland-atv/`; APKs, decompiled code and keys stay outside Git.

Test the combined candidate with an **ad-supported paid account** on a title that
normally serves preroll/midroll ads. Verify startup/sign-in or pairing, content
start, seeking across a midroll, subtitles/audio, pause/resume, completion and the
next episode. Check live playback across an ad break separately. If a failure
occurs, compare the ad-only candidate to isolate the privacy selection. Record the
title, playback type, approximate time and visible error without sharing credentials.

The Morphe signer differs from the publisher signer, so Android cannot update an
official installation in place. Initial delivery made no installation or account
changes. The user later explicitly authorized stock removal. All three installed
publisher splits were pulled and hash-verified against the original APKS before
uninstalling stock and installing the combined candidate. Publisher app data was
not backed up; replacement cleared local sign-in/preferences. No purchase or
subscription/entitlement modification was performed.

After replacement, the installed APK SHA256 matched the combined candidate above.
`am start -W` reported a cold start with a 2,267 ms splash-activity launch, and the
app subsequently reached its real account-pairing screen in HomeActivity. The
process remained running. Pairing-code screenshots were removed after inspection;
no codes or account credentials are included in evidence.

The user then reported **"playback works"** and **"all looks fine"**, while
clarifying that the account still has Premium. This accepts the reported Premium
playback behavior with both controls; it does not establish ad-supported preroll,
midroll or live-SSAI removal. The user authorized a dev prerelease and main-branch
documentation that explicitly asks for ad-supported testing and explains Morphe's
per-source prerelease toggle. Stable patch contents remain unchanged.

Private delivery evidence includes `stock-backup/manifest.json`,
`device-install.json` and `acceptance-status.json`. Future installed updates must
retain the candidate's signer and app data; do not automatically restore stock.
