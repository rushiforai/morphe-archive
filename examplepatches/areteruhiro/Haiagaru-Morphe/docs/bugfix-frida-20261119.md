# 2026-11-19 fixes and Frida checks

## Fixes

- The Eddi archive search screen now reads the shifted native child positions after a divider was added: divider 3, results 4, navigation 5, and the original-site button 6. The previous code treated navigation at child 5 as a `Button`, matching the reported `LinearLayout cannot be cast to Button` crash.
- The image paging reset now clears only the direction overrides and legacy disable key, and persists `imagePagingGestures=true`. Previously it removed the enabled key; when the switch was already ON, `setChecked(true)` did not fire the persistence listener.
- Thread refresh now uses ChMate's standard conditional/Range requests by default. The optional setting to skip conditional validators remains available for boards whose update dates cause missed new posts. This reduces unnecessary full DAT retrievals on the HOME search route; the Frida check confirms the default and the option path, not an elapsed-time comparison on the reported thread.
- The conditional-refresh toggle and its default behavior are described in Update History.

## Frida checks

Frida 17.18.0 was used on Mi Note 10 / Android 11, ADB serial `d5497008`, with the isolated `reporter191`, `reporter226`, and `reporter242` packages.

- `frida-image-paging-reset-regression.js`: 7 checks passed per version. It starts with the custom image paging switch ON, invokes the reset handler used by the dialog, verifies the enabled flag remains true, direction overrides are removed, and the toggle resolves to ON after reopening. It also verifies conditional refresh defaults OFF and remains user-selectable. Test preferences are restored afterward.
- `frida-archive-search-crash-smoke.js`: all three versions opened the archive search controller; each had the expected seven native children, and Compose child 5 is a `LinearLayout` while child 6 is the original-site `Button`.
- Recent logcat inspection found no `ClassCastException`, `VerifyError`, or fatal app crash from these checks.

The Frida Java bridge was bundled with `frida-java-bridge` 7.1.0 and `frida-compile` 19.1.0; the Frida CLI/server version was 17.18.0. To prepare reusable bundles, run `scripts/prepare-frida-verification.ps1`; generated files go under ignored `build/frida-verification/`.

The target device could not be unlocked for tapping through the visible settings dialog, so the reset's dialog callback was invoked directly by Frida. The archive screen itself was opened through its real Activity.

## Candidate artifacts

- MPP SHA-256: `ed860264bcde1776557ca9cb3241b86122a3536e9225739f3cb62033fc8dcfe7`
- APK SHA-256: 191 `86ab087b75bbd1b85ade65f94e641184ebde970dd079f18e49632363ee4f2e49`, 226 `37e3d2381cdc8bab65709c5df5bc0566ba0d72be193f0cae25f55d9b78cab71b`, 242 `48d3082fb350f0aa9cfd835a177e4c8d1e6cb8c3cfff9a32fe3843f955bec3c97`.
- Signer SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`.

