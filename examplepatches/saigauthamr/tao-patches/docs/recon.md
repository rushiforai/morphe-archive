# Recon: FanFiction.Net 66.5 (build 918)

Decompiled from `base.apk` into `decompiled/jadx` and `decompiled/apktool` (both gitignored).

## Layout
- App code: `com.fictionpress.fanfiction` (about 3,000 classes). Activities are obfuscated as `_exposed_.A*`.
- Packages: `networkpacket`, `packet`, `realm`, `service`, `startup`, `thread`, `util/glidesupport`.
- Two dex files (`smali`, `smali_classes2`).

## Third-party libraries
- **Firebase:** Analytics (AppMeasurement), Crashlytics, Sessions, Installations, datatransport/CCT.
  Removing these cuts telemetry requests and startup work.
- **ML Kit barcode** (`libbarhopper_v3.so`, about 5 MB per ABI) plus CameraX, likely for QR login.
- **Realm Kotlin** (`librealmc.so`, 12 MB) as the local DB, alongside Room and DataStore.
- **Glide** with AVIF/WebP decoders. **zstd-jni** is probably used for compressing network payloads.
- **WorkManager** and an `androidx.startup` chain: ContextInitializer, WorkManager, EmojiCompat,
  ProcessLifecycle, Realm, ProfileInstaller.
- No ad SDK found, but the manifest still requests the AD_ID, AdServices, and install-referrer permissions.

## Hosts
- `https://m.fanfiction.net`
- `https://v3.geolb.com` and `https://v3d.geolb.com`, likely the app API
- Hard-coded IPs `69.67.149.83` and `100.124.223.4`, probably fallbacks
- `fanfiction-29199.firebaseio.com`

## Candidate patches (to verify)
1. Disable Firebase Analytics, Crashlytics, Sessions, and Installations.
2. Strip the AD_ID, AdServices, install-referrer, and READ_PHONE_STATE permissions.
3. Trim or defer the startup initializers.
4. Network: response caching, deduplicating repeated requests, refresh intervals.
