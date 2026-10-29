# Runtime compatibility investigation

The first prerelease's resource and bytecode checks passed, and its Settings card behavior was observed in an emulator. Real-phone Graph and Radar were not verified before that release. On the user's OnePlus, both failed.

## Baseline and observed failure

- The working Play Store installation is also 4.32.0 (3723). All three DEX files are byte-for-byte identical to the original supplied APK. Bundled weather sources, network security config and preference XML also match.
- The Play Store signer is SHA-256 `057057399eda86a88f79726f9686cd224aa2ca98761a380deebb7d1df9e462b4`, SHA-1 `f46ce96bfd42f6d2ceae38e40e39a9b7e1d0b26a`. The older supplied standalone APK has a different certificate and minSdk.
- The re-signed phone build logged Firebase Installations HTTP403 `API_KEY_ANDROID_APP_BLOCKED`. It also repeatedly failed DNS resolution for `cdn.buienalarm.nl`, an endpoint still present in the APK's bundled fallback configuration.
- Both Google and Cloudflare DNS returned NXDOMAIN for that hostname during the investigation. The app reads `api_sources` from Firebase Remote Config in `com.meteoplaza.api.android.a.d()`.

These observations support a signing/configuration compatibility issue rather than different app code. The HTTP403 response is not a TLS certificate-pinning error. The production network security config trusts system CAs for most hosts; rejecting an HTTP Toolkit user CA is explained by that trust policy without proving app-specific pinning.

## Implemented fix

`Fix Google services` adapts the existing Morphe shared-library pattern also used in the local Heval collection. It routes the 50 bundled `PackageManager.getPackageInfo` calls through an extension that restores the original input certificate only for Buienalarm's own returned `PackageInfo`. Other packages' metadata and the platform's actual APK signer remain unchanged.

The certificate is read from the input signing block, validated against the verified app certificates, and embedded as public certificate data. Both legacy and `PackageInfoFlags` overloads are handled. Extension-generated D8 API-outline classes are excluded to prevent recursive wrappers. No TLS trust changes or hardcoded replacement weather URL are added.

This covers bundled Firebase Installations, Remote Config and the separate certificate calculation in `zn`. Static rewrites alone cannot cover new code loaded later by the Maps Dynamite module.

## Maps and full-screen ad follow-up

On the physical phone, HTTP Toolkit's VPN remained active and caused untrusted-certificate failures. After stopping the capture VPN, the user confirmed Graph worked. The white Radar base map remained. Maps had reported the real repack certificate SHA-1 `656ad32064f0bafe3a239888d2c4a165c030629c` in its authorization error, while the embedded original Play Store certificate was correctly `f46ce96bfd42f6d2ceae38e40e39a9b7e1d0b26a`.

Prereleases dev.4 and dev.5 attempted an app-process PackageManager delegate for dynamically loaded Maps code. The first attempt could not resolve the private mPM field on the OnePlus. The second reported the expected original certificate in Maps' authorization error, but Google still rejected the request. Those hooks and their hidden-API dependency have been removed.

The current patch instead changes only `google_maps_android_api_key` to the shared community Maps key that the user authorized for this project. It leaves Firebase's `google_api_key` unchanged and retains the bundled certificate wrapper for Firebase. The key was extracted from `app.template.patches.shared.BuildSecrets.SHARED_MAPS_API_KEY` in the user-supplied Doom's Morphe Patches 1.23.0 bundle (SHA-256 `d0fa5dd1f82d56a6977162ea7d55cafbc5bb19cc0f3433c577f1b4213740b772`). Its value is kept out of tracked source and supplied through the `SHARED_MAPS_API_KEY` GitHub Actions secret or an ignored local file. An Android Maps API key must be embedded in the delivered app; secret storage does not make the compiled key inaccessible.

At the user's explicit request, a separate disposable app using Android Maps SDK 20.0.0 was installed on the OnePlus to test this key. It requested no location access and used a fixed Amsterdam camera. The SDK reached `MAP_READY`, and the user confirmed a Google map was visible. This verifies the key can display maps through the Android SDK on this phone without an OAuth client ID or secret. The probe alone did not establish Buienalarm's radar behavior. After repatching with v1.0.0-dev.6, the user subsequently confirmed everything works and requested a stable release. This is the acceptance evidence for the Radar fix on the OnePlus; it is not an independent measurement of every overlay or animation mode.

The user also observed a full-screen video/playable ad. A separate app-owned interstitial coordinator (`ms3.a`) loads lazily and was started before the weather banner decision, so startup-provider suppression did not block it. Hide ads now returns its normal Unit completion before it creates the request/deferred or displays the interstitial. It does not remove a callback-bearing SDK load and leave a suspended caller waiting. Live Remote Config ad-enable flags do not bypass this coordinator guard.

## Verification

- Actual Play Store base/ARM64/density APKs were extracted and archived locally, outside Git.
- The new bundle patched that unmerged APK set successfully with fingerprint validation and FULL bytecode mode.
- Independent apktool output verification confirms the exact Play Store certificate, 50 wrapped SDK lookups, intact weather configuration and intact production TLS trust.
- The resulting APK installed and launched in the disposable Android 14 ARM64 emulator. Firebase fetched and activated 22 live configuration parameters. The activated weather sources include `https://imn-rust-lb.infoplaza.io/v4/nowcast/ba/`, the corresponding global route, and the existing Meteoplaza fallback. Thus configuration can update through the normal backend again; the retired default was not edited.
- The original Play Store APK set is preserved locally and in the phone's Download folder. The user confirmed Graph works with the capture VPN stopped and full-screen video ads are blocked. After the shared Maps-key update in v1.0.0-dev.6, the user confirmed everything works on the phone and authorized promotion to stable.

## Privacy and onboarding changes

Separate Disable tracking and Skip consent screens patches implement the requested privacy work. Screen skipping depends on tracking suppression and ad suppression. No acceptance or rejection is written automatically; manual Privacy settings and Didomi consent-storage APIs remain unchanged. See `TRACKING_AUDIT.md` for the inventory, controls and functional boundaries.

The initial privacy runtime check exposed an unconditional Facebook event-logger constructor in MainActivity's dependency graph. Suppressing SDK initialization alone caused an exception. The final change keeps a non-null inert logger facade and disables each inspected consumer, rather than re-enabling the SDK. The clean-install flow subsequently reached Ready and MainActivity's normal Manage locations state without cookie/ad-choice screens. These are development observations, not physical-phone validation. At the user's request, further agent-run runtime testing was stopped; subsequent prereleases are for the user's real-world testing.

HTTP Toolkit's phone VPN was stopped at the user's request. No decrypted network capture is used as evidence. REA's Android provider was attempted but is unavailable because the caller-supplied JADX MCP JAR is not configured. Static findings above come from local apktool/smali and exact artifact comparisons, not a successful REA provider result.

## Upstream attribution

Signature-wrapper source is adapted from Morphe's GPLv3 [signature compatibility implementation](https://github.com/MorpheApp/morphe-patches-library/tree/main/patch-library/src/main/kotlin/app/morphe/patches/all/misc/fix/spoofsignature) and its Java extension, also inspected in the local Heval port. Upstream copyright and the repository LICENSE/NOTICE are retained.
