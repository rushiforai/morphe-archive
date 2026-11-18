# Startup animation

The frozen iOS reference enables startup animation when `startupAnimation` is ON and returns native values when it is OFF (`YTAfterglow.x:1263–1265,1295–1302,1339–1344`). The preference defaults OFF. Android follows this additive policy; it is not a disable-animation switch.

YouTube 21.43.523's `MainActivity.onCreate(Bundle)` has two native eligibility decisions before it obtains `Lrtt`, the animation controller:

1. Code offset `0x0553` calls `Lafnm.B(I):Z` on startup state 264. Its successful branch at `0x0557` reaches the startup-type decision at `0x0565`. A different earlier call to `Lafnm.B` belongs to unrelated startup work and is not changed.
2. Flag `1073815427` (`0x40011f83`) allows all startup types. Its true branch at `0x056c` reaches the controller provider at `0x05b0`; otherwise the native path checks startup-type flags/masks and may skip the animation.

`StartupHooksPatch` matches the complete local sequence and verifies both branch destinations before passing only those two boolean results through `StartupHooks.animationEligible`. The helper requires the selected `startup` owner and the preference; OFF, an absent owner or unavailable preferences preserve each native value. No global flag implementation is rewritten.

The animation controller, style flag `1074339245`, native Lottie/vector/Rive assets, low-memory renderer fallback and lifecycle cleanup remain native. The controller's optional injected override is supplied by the sole native factory as `Optional.empty()` and is left intact. The legacy path calls `AnimatedVectorDrawable.start()`, the Lottie path calls its native play method, and Rive retains its own native start path. This hook applies when Android executes the native Activity creation path; it does not recreate an existing Activity just to animate a simple task resume.

Focused Kotlin compilation against patcher 2.1 and full extension Java compilation against Android 36 pass. `python3 tools/check_startup_hooks.py` runs 22 checks for owner isolation, live OFF/native passthrough, preference failure/recovery, selected-page routing, external link and shortcut preservation, Afterglow's separate startup route, and Lite Mode Home/restoration policy. Strict APK application and device animation recording remain separate release gates.

Runtime validation should compare cold launcher startup with the setting OFF and ON, exercise a native launch that otherwise fails one eligibility check, confirm normal rendering and cleanup afterwards, and retest Shorts startup, external video links and Lite Mode. With diagnostics enabled, a formerly false gate records `native animation eligibility enabled`; seeing the same native animation in both cases alone does not demonstrate an override.
