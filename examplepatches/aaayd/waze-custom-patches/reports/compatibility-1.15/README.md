# Resilient patch compatibility

Tested locally on 4 October 2026 using bundle 1.15.2. All inputs passed original Waze signature and identity checks. Unsupported version metadata was bypassed only for diagnosis; native safety checks remained enabled.

| Waze | Patches applied | APK structural checks |
| --- | --- | --- |
| 4.100.1.0 | 7/8 | PASS |
| 5.15.5.0 | 7/8 | PASS |
| 5.18.5.0 | 8/8 | PASS |
| 5.24.90.901 | 8/8 | PASS |

The 2023 release improves from 4/8 to 7/8. Its themes, icon pack and badges now apply. Native icon sizing remains unsupported on the inlined 2023 and January 2026 renderers. No diagnostic APK was installed, signed or published.

The final bundle follows synchronous resource-extraction helpers, handles direct/delegated icon streams and static/instance filename parameters, recognises badge artwork overloads, and discovers mood and badge owners without fixed class names.

Individual missing, unmapped or differently sized icons produce warnings. Compatible assets still use the selected pack. Explicit stock fallbacks replace stale custom copies from an older installation. Details appear in the patch log and Icon pack > Icon warnings. Missing badge drawables hide only that choice; missing saved choices fall back to Automatic.

An altered current APK with one removed image, one resized image and a new unmapped report image rebuilds successfully. Its manifests and warnings identify all three, preserve stock pixels for incompatible/unmapped assets, and retain every unaffected replacement. A second APK with the recognised artwork removed fails the patch for the expected schema error. These fixtures are now part of release CI.

Additional checks passed: 24 Python tests; synchronous/delegated discovery, cycle/async rejection, badge overload and PNG-canvas fixtures; all 256 patch dependency combinations; 65 settings compositions; stock-icon restoration; badge resource removal; alert-distance and camera-sound fixtures; native ELF/call/output verification and ambiguity rejection. CI also includes the 2023 APK regression and expanded nine-class obfuscation fixture.

Unmapped native report groups retain their original calls with warnings. Missing/ambiguous native helpers, broken call groups, insufficient recognised artwork, invalid profiles and output hash mismatches still fail. The native machine-code edits are not relaxed.

These are patch/build and structural checks, not device, visual or Android Auto runtime tests. The release compatibility list continues to advertise only versions passing all eight patches.

[Machine-readable results and input/bundle hashes](results.json)
