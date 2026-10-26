# TaobaoLingo Overlay — original APK, no re-signing

An independent Android companion implementing screen OCR and on-device Chinese→Japanese/English translation. **Experimental: Android 15 x86_64 emulator startup and Chinese OCR tests pass; the full live translation overlay and original Taobao integration remain unverified.** This is a fallback if Taobao rejects the signing certificate of any Morphe-patched APK.

- Uses Android MediaProjection (explicit screen-sharing consent) and the `SYSTEM_ALERT_WINDOW` overlay permission.
- Bundles Google's ML Kit Chinese OCR model. ML Kit translation language models are downloaded once, and text is subsequently translated on-device.
- Captures screen pixels to volatile memory at a throttled interval. **No screenshots, text or login details are uploaded by this app.**
- Draws touch-through translation labels aligned to detected Chinese text blocks; it never modifies, re-signs, or hooks into the original Taobao APK.
- Support: Chinese → Japanese and English. It translates visible text rather than dynamically replacing the original application's native resources.
- Android 10+ (`minSdk=29`), foreground service notification, stop control in app. After approving screen sharing, the helper attempts to open the original Taobao automatically.
- Screenshot-blocked/secure content, images without clear text, and changing layout can reduce accuracy.

## Usage

1. Install **the genuine Taobao APK** and the separately signed TaobaoLingo Overlay helper.
2. In the helper, select Japanese or English, enable overlay permission, and approve Android's screen-sharing prompt.
3. The helper attempts to open genuine Taobao; OCR labels appear over recognized Chinese text after the on-device translation model finishes downloading. Stop from the helper app or its foreground-service notification.

The helper does **not** authenticate with Taobao; Taobao retains its own login session and network protocols. It requires screen-capture consent and therefore cannot translate protected/black-screen content.

## Build

From `overlay/`, with JDK17/Android SDK 35/Gradle 8.11.1:

```sh
gradle :app:assembleDebug
```

The [GitHub Actions build](../.github/workflows/overlay.yml) compiles the app, instrumentation tests, runs Android Lint, and produces an APK artifact under `app/build/outputs/apk/debug/`. An [Android 15 emulator smoke test](../.github/workflows/overlay-smoke.yml) has validated install, activity launch, UI layout, and bundled ML Kit Chinese OCR. The separate Chinese→Japanese model-download/translation test is being added; see [runtime verification](../analysis/android_emulator_validation.md).

Unlike the Morphe patch, this APK is a **separate helper app** installed alongside the genuine Taobao. Screen sharing will show an OS confirmation; overlays may be disabled by a protected app view. This tool does not alter Taobao's network stack or signature.
