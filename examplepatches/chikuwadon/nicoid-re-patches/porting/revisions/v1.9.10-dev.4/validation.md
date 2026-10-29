# v1.9.10-dev.4 verification revision

The reported crash is a main-thread ClassCastException in FrameLayout.onMeasure: native LinearLayout.LayoutParams assigned after the direct Service player was reparented into a FrameLayout. MiniViewport237 preserves the native LinearLayout parent contract and fits the same player to the mini viewport during measurement, including delayed native size updates. Decoder, SurfaceKeeper and Service ownership are unchanged. Teardown detaches the video from the viewport and returns it to its original parent. Normal restoration still uses the existing Service-to-normal transfer; hardware continuity remains unverified.

Popup speed/quality text slots have independent wider widths; bitmap/icon drawing and the accepted dev.3 popup geometry, drag and resize paths are unchanged. Accepted tab sources and resources are unchanged.

PatchVersion237 is generated from build.py VERSION. PatchInfo uses it for the runtime summary, and decorated ModernShorts labels are updated too. DebugHeader237 adds patch version, installed app package/version/code, manufacturer/model, Android/API/security patch, ABIs, locale and time zone to the in-app debug export. CrashDiagnostics stores that metadata with a bounded Java crash trace at failure time and logs startup metadata to logcat. Existing account/session/device identifiers are not collected. The previous crash handler is still delegated to.

Validation: 72 Robolectric tests passed on SDK 28/34 using runtime helpers regenerated from candidate DEX. New regressions exercise delayed legacy layout parameters, full measurement of the direct mini host, restore to the original parent, stale settings values, widened popup text slots, idempotent diagnostic headers and retained crash metadata/handler delegation. Existing 60 tests retained. 49,376 invocation arity checks and 11,805 defined-target dispatch checks passed. All 800 PNG entries and 28 bitmap icon families retained. Extension/input-hash/translation payloads and accepted tab source code unchanged. PlaybackRulesTest (139 checks), RankingRules190Test and ContentHistoryRulesTest passed.

Not physically verified on a device. No official release or main-branch update.

Rebuild: stage helpers/native/executor and resources from the preceding dev.3 MPP, convert its helpers DEX to helpers.jar, retain helpers-overrides, run build.py, regenerate runtime-helpers.jar, and run verify.py with Maven Robolectric 4.13/JUnit 4.13.2 dependencies and SDK 28/34 instrumented JARs.

MPP SHA256: 34ac92b81250a93167bf717d35d786ca15cebfa02fc18e7f5f3771bda82fc66e
