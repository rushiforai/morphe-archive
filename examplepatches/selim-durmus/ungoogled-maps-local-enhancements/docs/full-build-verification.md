# Complete build verification

Verified 2026-10-05 with the preserved Windows x64 toolchain.

- Stock Maps 26.36.04.973607363 input SHA-256: 8d1850e3ab3656e271258c3782a8573d4c2a63a90fea1aca134564e479920fcd.
- Upstream source: 35421159e2149d1ca972ffd0f16b79666569035c (v1.3.0).
- Original upstream MPP SHA-256: 72c1e94d736b3214f560414bb8c700f551d28ff9d3d5800a79abd6207f982e80.
- Morphe Desktop 1.18.1 successfully applied all 32 selected upstream patches in FULL mode.
- build-all.py ran with portable Python 3.11.9, JDK 21, the preserved Android SDK and a fresh Morphe cache.
- Java socket permissions were denied throughout both stages. The negative-control probe confirmed that denial before patching.
- All Home/Work ownership, marker geometry and label matching checks passed.
- Output signature matched the preserved signing identity. APK entries outside the guarded enhancement changes were preserved against the newly generated upstream APK.
- Complete APK SHA-256: a51f4c8aa0cd1d885c42c33f1229d17a723d003873de5d59011f932334ed4f2b.

The rebuilt APK installed as an update on the API 36 emulator, retaining its public test fixtures. Home/Work chips appeared, local label search opened the correct place, the native Add label action opened the existing local label editor, and dark-map marker captions were visually checked. Work opened its route preview and Back returned to the main map with an empty search field. The working Pixel installation was not replaced during this preservation task.

This validates building a complete APK from the original APK and archived compiled upstream bundle. It does not claim an offline Gradle compilation of the upstream bundle from source, byte-identical APK packaging on every run, or compatibility with another Maps version. The test-only network guard is a scoped Java restriction, not an OS-wide network firewall.
