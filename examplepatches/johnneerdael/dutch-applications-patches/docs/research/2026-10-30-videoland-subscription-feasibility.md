# Videoland subscription routing feasibility

**Outcome: the experimental routing patch is implemented, but it did not enable older-episode playback on the tested TV Gemist account.** The original video destination is reached; the tested layout and block routes do not supply playable media for that account. Deliver the default-off candidate and this report under the plan’s negative feasibility outcome. Do not promote it as a playback unlock.

## Candidate and pinned inputs

`Use original subscription targets (experimental)` is independent of ads/tracking and off by default. It has only the original-input resource preflight as a dependency. It unwraps one subscription target in NavigationMapper and skips subscription entries in HandleActionUseCase’s existing retained-target iterator. Null/nested subscription navigation retains its normal fallback. Other lock types, Action objects, genuine products, asset selection, token/licence processing and backend error paths remain original.

| Input/tool | Verified identity |
| --- | --- |
| Source baseline | `8f32a79fa209923fc46747ed60d728da5385bbc5` |
| Source branch | `feat/videoland-subscription-routing`; final revision recorded in handoff `checkpoint.json` |
| Target | `nl.rtl.videoland.v2`, Android TV 1.117.0, code 1622, minSDK 24 |
| Original APKS SHA-256 | `f3ceb9e7a87552d51f37e1bfe2b5c8d7d21e337e8e7564835a4891b92732bbdb` |
| Original base SHA-256 | `86b891e101c30b2c5588ff1e285d37a68e574a9e005f574844fc1b4df3760298` |
| Split inventory | base, armeabi-v7a, xhdpi |
| Publisher signer SHA-256 | `6c7782ca5cabbaaf0546c31b63b7a5ed112ef6a00a5422fa263c2516dee2c141`; original signature verified |
| Test/rollback signer SHA-256 | `d11fc1c983f0b234ccc12e9090c396b219d716d8ddbc364502729e694d821e17` |
| Patcher / Desktop | 2.0.1 / 1.19.1, FULL bytecode mode |
| Desktop JAR SHA-256 | `a51472252cd63b2eac635dbb5a154ff918bfc15268da89679feb3d760230c573` |
| Clean candidate APK SHA-256 | `4e2aaa74a59978c051710402cc7fb058cb919c8e69a0dfa43a50561c1f27a3a9` |
| Clean experimental MPP SHA-256 | `18cb6c12e233af944edc6c3bb0bc294a38122bd7c64d843a12b63882a06ee5c8` |

All research used local artifacts; no online research was performed. Native app API calls were observed on the user’s test TV. The original archive was staged rather than modified.

The full repository build requires an unrelated private Maps key. `scripts/build_videoland.py` follows the existing scoped offline-build pattern to build all three Videoland patches and their helpers from cached dependencies. It does not weaken the full build or migrate the patcher. `--diagnostic` builds separately from test fixtures; neither diagnostic patch class is in the normal MPP.

## Bytecode and isolated runtime evidence

All three contracts resolve before either functional mutation. Complete instruction-operand/reference, branch, payload and exception-handler digests supplement the exact signature, flags and measured counts:

| Method | Flags | Registers | Executable instructions |
| --- | ---: | ---: | ---: |
| NavigationMapper.a | 9 | 17 | 377 |
| HandleActionUseCase.a | 17 | 48 | 656 |
| RequireSubscriptionLock.b | 17 | 2 | 2 |

The accessor’s real field/reference type is included in its digest. No registers are added. Existing branch/coroutine instructions remain intact.

| Check | Result and scope |
| --- | --- |
| JVM production-contract regression | **23 assertions**: real original matches; same-count seam and accessor-type mutations rejected; missing/duplicate accessor abort the actual patch with context navigation unchanged; isolated identity/version/code/minSDK/signer checks; re-signed input rejected; default-off and input-only dependency verified |
| Independent decoded verifier | **140,770 original methods**: exactly the two specified additions; strict method inventory and owned manifest comparison; all unselected method graphs preserved |
| Verifier regression | **8 unit + 6 artifact tests**: bad branches/insertions, original-contract changes, unowned account/DRM edits and unselected effects rejected |
| Clean candidate ART | **131 assertions**, executing actual APK methods, not a Python routing model |
| Diagnostic ART | **147 assertions**, including real JSON parsing/selection, supplied-field visibility before classic DTO decoding, transport/body preservation and native errors |
| Independent block continuation ART | **7 assertions**, immediate/asynchronous result identity and isolated completion/gates; no requests launched by the fixture |
| Repository Python suite | **273 tests, 10 skipped**; artifact tests also run separately with the original/candidate roots |

The ART routing cases include Premium/Upsell, ordinary Play/layout/live targets, destination identity, authentication/parental navigation, null/nested fallback, empty chains, zero/one/multiple retained subscription entries, synchronous and controlled resumed replay, one queue effect, unchanged Action/media identity, and N02 authentication both directly and beneath subscription wrappers. The unmodified control fails subscription-to-Replay, showing the harness requires the patch.

Limits: controlled player resumption invokes the APK continuation’s `invokeSuspend`; cancellation and every lock subtype are not independently executed. The inherited graph verifier does not authenticate every class/field annotation or modifier. Isolated ART does not prove network authorization or decoded playback. Manager discovery, selection combinations and supported-release acceptance remain unperformed because the playback gate was not met.

## Account-connected comparison

The TCL G17 retained account data through compatible `adb install -r` updates. No uninstall/data clearing occurred. A signed zero-edit control used the same merge/sign/install path and has byte-identical publisher DEX. The TV-signed candidate has byte-identical DEX to the independently verified candidate.

The user switched accounts and confirmed when the working account played episode 2 and when the original TV Gemist account showed its subscription screen. Both actual outgoing requests were then captured. Live filtered capture avoided the TV’s small log-ring rollover. Results below use actual app PIDs, episode identity and isolated attempt windows; they are not a general asynchronous correlation framework.

| Case | Request/result | Reached boundary |
| --- | --- | --- |
| Free account, recent S1E3, shown as yesterday on 30 October | `main/video/clip_99930` → HTTP 200, network=true/cache=false, video entity, 2 assets | Media selection, token/licence entry; UI advanced 00:00 → 02:07 |
| Working comparison account, S1E2, broadcast 22 October | `main/video/clip_99929` → HTTP 200, network=true/cache=false, video entity, 2 assets | Media selection, token/licence entry, player UI confirms episode 2 |
| Original free account, same S1E2 | **Same** `main/video/clip_99929` → HTTP 200, network=true/cache=false, `frontspace/offers` | ReplayDestination constructed, then returned-layout conversion → OffersDestination; no media/token/licence entry in this attempt |
| Free account, direct native Player-block request | Genuine supplied block ID; native current-session request → HTTP 200, network=true/cache=false, G7.b0 success | Same video-item ID as working response; **raw JSON assets=[] and DTO asset count 0**; native callback success |
| Older S1E1 / expired-unavailable item | Not separately activated / no expired fixture selected | No claim |

The baseline recent episode opened playback and was explicitly stopped by the user; that was not a stall. The baseline older episode opened the TV Gemist screen. The candidate reaches its retained video target but does not receive usable older media. The direct-block observation is data retrieval only: the probe deliberately does not feed its result into playback.

The direct block ID was copied from the working response and passed intact, including its page prefix. The source’s normal block path does not split or normalize it. The trial returned the matching item successfully; no expiry error was observed. Server/session lifetime remains unknown. **The working account’s direct-block response was not separately measured**, so this does not isolate the block endpoint’s precise account-filtering policy. It proves that this tested free-session block request did not supply assets. No HTTP 403, geography denial or DRM rejection is inferred from the HTTP-200 offers/empty-media results.

Account-specific raw observations, opaque block IDs and private fixtures remain outside Git under the ignored build directory. This report contains sanitized outcomes and minimal public episode identity. No video file, stream URL, token, licence, account object or header dump was captured or replayed.

## Client branches and alternate routes checked

The selected target coordinates are preserved through:

```text
NavigationMapper → ReplayDestination → LayoutMediaPlayerItem Parcelable
→ MediaPlayerActivity → MediaPlayerImpl → CreateQueueUseCase
→ FillLayoutMediaPlayerItemQueueUseCase → GetLayoutUseCase
→ LayoutRepositoryImpl → LayoutRemoteDataSource → K7/a.f
```

There is no product branch rewriting those coordinates before the initial fetch. FillLayout checks the **returned** entity type. A non-media entity becomes a LayoutDestination containing that returned layout. The entity-layout converter recognizes `frontspace/offers` and creates OffersDestination without another NavigationMapper call. This explains the same visible subscription screen after successful original-target routing.

The VI and De Tijd precedents were checked against their actual local implementations: VI selects a shipped bundled-config app-header/request mode; De Tijd already receives anonymous full article content despite a separate wall decision. They justify inspecting more than one Videoland response, but do not establish that another Videoland route supplies media.

| Shipped route/model | Evidence |
| --- | --- |
| Generic layout, series `main/program/5771` | Free network response: 21 classic item observations; native video/media/direct asset paths absent before DTO decoding |
| Native EPG grid and `epg_grid/{programId}/modal` | TV Gids → Vorige week → 22 October → RTL 4 Bureau Groningen episode 2, 20:31–22:05; modal network HTTP 200 G7.n0, one classic item, checked raw asset paths absent. Its play action requests the same `video/clip_99929` and receives offers |
| Entity `block/{blockId}` | Native free-session trial above: matching video item, empty raw/typed assets |
| Main/kids navigation and app/search layouts | Source-traced target discovery/generic layout consumers; no separate full-media service established |
| `internal-paths?external-path=…` | Source-traced universal-link coordinate resolver, not a media-body endpoint; no alternate real episode URL supplied/tested |

No EPG date-range patch was needed: the native three-week model includes 22 October. The EPG programme click supplied the real modal ID; an Android TV watch-next ID was not substituted.

The typed paths checked are layout G7.Z.a / modal G7.n0.b / block G7.b0 → content G7.d0.d → video item G7.x0.q → J7.u.c assets. Raw `LL7/f.e` observation precedes serializer selection, so classic unknown-field loss does not hide the checked `itemContent.video.assets`, `media.assets` or direct `assets` paths. Absence statements are bounded to these native shapes, not arbitrary undocumented server representations.

Native app/device signing is already used for getJwt. Optional account/profile identity and matching session cookies affect request context; CapacityToken is packaged application configuration. No unused VI-like premium-scope/header branch was identified in the inspected client. Anonymous JWT delivery was not exercised.

An internal HandleAction → AddReplay → CreateMediaContent chain can use a genuine supplied MediaItem without refetching its layout, while retaining original entity/account state. It requires a genuine Play action, usable assets and preserved non-subscription locks. The tested free responses did not provide that input, so no speculative branch bypass was added. TV local-media alternatives are unsupported/error stubs.

## Outcome and engineering handover

This is the plan’s outcome **“routing succeeds but a downstream stage lacks media.”** Retain the experimental default-off source/MPP. A routing-only result is not successful older playback. Milestone 2’s supported integration, seven-selection matrix, Manager smoke test, full device regression and public guide/catalogue/release work are conditional on demonstrated older playback and are deferred.

The original pre-experiment APK was restored after testing; its installed hash was checked as `d0c6e622c932a2cc626f491418a8e1e286031267ba1d1add79a11f0b3c507f2f`. The free-account profile remains present, all development probes are removed from the TV, and task log readers were stopped. The clean experimental MPP excludes diagnostic patch classes.

One intermediate diagnostic build had a startup VerifyError because plain mid-method insertion did not rebase internal labels. It was promptly rolled back. The corrected label-aware version was tested on ART before further use. That rejected build is not a deliverable.

Build the clean scoped bundle offline:

```sh
ANDROID_HOME=/path/to/android/sdk python3 scripts/build_videoland.py
```

Verify a subscription-only candidate and execute actual DEX:

```sh
python3 tests/verify_videoland_atv.py ORIGINAL_DECODE CANDIDATE_DECODE --subscription
VIDEOLAND_ORIGINAL=ORIGINAL_DECODE VIDEOLAND_SUBSCRIPTION=CANDIDATE_DECODE python3 -m unittest discover -s tests -p test_videoland_atv.py
python3 tests/run_videoland_subscription.py --serial DEVICE --apk CANDIDATE.apk
```

`--diagnostic` additionally tests the test-only raw-JSON helper. `tests/run_videoland_block_replay.py` checks the independent continuation without issuing requests; the opt-in native-block patch requires a genuine supplied block ID and runs once for the inspected episode. No guessed default or account credential is embedded.

The engineering output contains the clean MPP, source patch, final source revision/hashes, this report and verification logs. Private runtime material remains under `build/videoland-subscription/`. No publication or supported release was performed.
