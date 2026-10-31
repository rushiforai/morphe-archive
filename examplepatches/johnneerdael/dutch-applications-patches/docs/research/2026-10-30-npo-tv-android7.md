# NPO Start TV Android 7+ port

The supplied APKMirror APKM is NPO Start **Android TV** 1.48.2-2405,
version code **245497937**, package `nl.uitzendinggemist`, with an actual
publisher manifest minimum of **API 24**. Its publisher certificate SHA-256 is
`7bfd84443c8e1fefc1b9cd8b5d0fcf18c922a2d4b778e2d109427d2cc418b1f2`.
The base APK SHA-256 is
`e0fa9f908d9a768c21baba988b290f6433327474067ec256911afee2cdf32671`.

## Implementation

The catalogue now declares API 24 as the lowest supported Android version.
The NPO resource guard also explicitly accepts the existing API 32 manifest
variant. Other SDK values remain rejected, and package, version name, version
code and publisher certificate checks remain mandatory. Other applications
retain their existing exact minimum-SDK checks.

No advertising, privacy or PairIP restoration instructions needed changing:
the supplied build passes every existing exact method-shape precondition and
the startup asset hash checks. Both advertising and tracking controls still
include the full startup, network/audio receiver, AppAuth discovery and token
request restorations.

The APKM was staged as a complete split set and merged by Morphe Desktop
1.19.1 before patching. All ten native libraries from both `arm64-v8a` and
`armeabi-v7a` splits are present and byte-identical to the publisher inputs.
The output retains minSdk 24; it does not lower an API 32 manifest. All four
output DEX files use version 037, and the APK signature verifies for API 24.

## Validation

The local APK is
`build/validation/npo-api24/NPO-Start-TV-1.48.2-2405-Android7-ads-privacy.apk`.
SHA-256: `e04dd933380ce50e620b3069ab9f4d8c542629000166ef1705c0312c222c39fc`.
All three public patches applied without failures. The local NPO-only patch
bundle is under `build/validation/npo-api24/gradle/patches/libs/`.

| Check | Result |
| --- | --- |
| Regression against the previous bundle | API 24 rejected by the old guard, as expected |
| Production original-input guard | 25 assertions pass, including API 24/32 acceptance, other SDK rejection, missing/ambiguous SDK rejection and invalid/mixed signer rejection |
| Full decoded-method comparison | 107,858 original method contracts pass, including retained method tails and unrelated methods |
| Startup restoration | Emitted constants match the existing restoration data; lifecycle helpers match the DEX extracted from the supplied publisher asset |
| Manifest privacy and functional components | Pass |
| API 24 emitted receiver/discovery tests | 12 cases pass |
| API 24 emitted token-request tests | 17 cases pass |
| API 24 actual-APK privacy gates | Six cases pass, including typed CCT HTTP 403 and queued telemetry boundaries |
| API 24 actual-APK advertising gates | IMA factory returns null for both boolean inputs; all five preroll getters return null |
| API 24 installation and startup | Installs successfully; onboarding and home content render; force-stop/restart succeeds; crash buffer empty |
| Host regression tests | Eight NPO manifest/control-flow tests and six original-input staging/certificate tests pass |

Runtime validation used a dedicated local **Android 7.0/API 24 ARM64 Google
APIs emulator**. Tests compile their probes for API 24 and now permit local
emulator serials. The user then requested a clean replacement on the physical
Android 14 TV at `.12`. ADB uninstall and installation both succeeded; the
installed APK SHA-256 matched the candidate above, package metadata reported
minSdk 24 and `armeabi-v7a`, and MainActivity cold-started successfully. The
user subsequently reported that it **works** and authorized stable publication.
This confirms the Android 7+ variant on that ARMv7 Android 14 TV; it does not
establish physical Android 7 TV behavior, a particular account entitlement,
long-duration playback or complete network silence. The existing limits concerning
broadcast/server-stitched ads and remote Cast receivers still apply.

The public original input is [npo-start-atv-android7.apks](https://buzzheavier.com/1s5dezsqvxbq).
It contains the five unchanged publisher-signed APKs from the supplied APKM.
Archive SHA-256: `605f895ca8b41e150ab5739ab4f8ad05cd2c2dabdbab959828c4db8532a0d787`.

## Reproduction

Use the complete supplied APKM as input, not its base alone. Select `Hide ads`,
`Disable tracking` and `Fix PairIP startup`, with FULL bytecode mode. Do not
use `--force` to bypass compatibility checks.

Run the production guard regression with:

```sh
python3 tests/verify_npo_input.py --bundle PATCHES.mpp --original ORIGINAL_BASE.apk --untrusted PATCHED.apk
```

After decoding the resulting APK, run the existing full-method verifier with
the startup restoration JSON and the independently extracted embedded helper
DEX. Runtime checks on the local emulator use:

```sh
python3 tests/run_npo_runtime.py --serial emulator-5584 --decoded PATCHED_DECODED
python3 tests/run_npo_token.py --serial emulator-5584 --decoded PATCHED_DECODED --helpers-decoded ORIGINAL_DECODED
python3 tests/run_npo_privacy.py --serial emulator-5584 --apk PATCHED.apk
```

The local evidence directory retains patch/signature reports, decoded-method
verification results, ART logs, the additional actual-APK ads probe, UI
captures and the scoped Gradle build configuration. Release automation owns catalogue, version and changelog updates. The
publication PR changes support and documentation without manually editing
those generated release files.
