# Android emulator execution verification

## First successful execution (2026-10-23 JST)

GitHub Actions [run 39879100073](https://github.com/GoodLight999/TaobaoLingo/actions/runs/39879100073) completed with `conclusion: success`, for commit `e646f4dfbe850a267bc0dca974211fa5084d909d`.

| Check | Outcome |
| --- | --- |
| Gradle build of app and instrumentation APK | PASS |
| Checksum-verified Android emulator 36.6.11 binary | PASS |
| Android 15 Google APIs x86_64 emulator boot | PASS |
| Install app + instrumentation APK via adb | PASS |
| Launch MainActivity | PASS |
| UIAutomator view tree contains TaobaoLingo and translation start button | PASS |
| App process alive | PASS |
| Chinese ML Kit OCR on programmatically drawn Chinese product text | **PASS**, 1 test, 4.247 sec |
| Screenshots and UI XML collected | PASS |

The generated emulator screenshot and `ocr-test.log` are available as the workflow diagnostic artifact `taobaolingo-emulator-smoke-diagnostics`. The UI is visible and the language picker/start/stop buttons render correctly.

**What this does not prove:** Taobao's ARM64-only app cannot run on this x86_64 image without a compatible ARM translation layer. Actual Taobao login, screen-capture permission, translation model downloads, and the UI overlay on Taobao are not covered in the first passing smoke test.

## Follow-up testing

A separate Chinese-to-Japanese ML Kit download-and-inference instrumentation test was added subsequently. Its pass/failure is tracked by later Actions runs. The screenshot-based OCR test is deterministic and uses no Taobao account or screenshot.

## Reliable emulator bootstrap

The Android Emulator latest SDK package download was corrupt in CI. Fixed emulator build 36.6.11 (SHA-256: `1eade4cf2df6ea8eeead4902c635897ba12aaa32aac4389eaae0fdb498a5b830`) was downloaded, and OS libraries installed. The Android-35 system image lacked device metadata expected by `avdmanager`, so the successful workflow created valid AVD metadata (`config.ini`, `.ini`) directly before booting.

The test is reproducible using [`.github/workflows/overlay-smoke.yml`](../.github/workflows/overlay-smoke.yml).


## Chinese-to-Japanese translation verification (2026-10-23 JST)

[Android emulator run 39879605013](https://github.com/GoodLight999/TaobaoLingo/actions/runs/39879605013), commit `cd5516ee74faa6ef06eb33339810f07bb3c4f759`, **succeeded**.

ML Kit instrumentation output:

```text
dev.goodlight999.taobaolingo.overlay.ChineseOcrInstrumentedTest:..
Time: 44.511
OK (2 tests)
PASS: APK installed, activity rendered, process alive,
      Chinese OCR and on-device translation succeeded
```

The second test downloaded the ML Kit Chinese→Japanese model on the Android 15 emulator, translated Chinese product-search text, and asserted nonempty, changed output. This validates the OCR and translation engines independently of Taobao. The test still does **not** prove MediaProjection capture or position-aligned overlays over the actual Taobao app, which are being tested separately.


## Android 15 MediaProjection permission / foreground service

[Run 39880827145](https://github.com/GoodLight999/TaobaoLingo/actions/runs/39880827145) automatically granted the helper's overlay app-op, pressed the actual "画面翻訳を開始" button, selected `Entire screen` in the Android 15 system dialog, and selected `Start`.

Android's system log confirmed:
- MediaProjection start token issued;
- successful `VirtualDisplay` creation at 1080×2400, named `TaobaoLingoOverlay`;
- the helper's `CaptureService` present in Android `dumpsys activity services`;
- no fatal app crash in the collected log window.

The workflow was **marked failed by a false-negative test assertion** which expected a full Java package name while Android prints `package/.CaptureService`. The assertion was corrected in commit `1ae717269886b9e010dc10ee6f0219ebdcbbc162` and now also checks the display by name. The runtime event is confirmed, but this run is not counted as a green CI workflow.

Original Taobao login and real product translation remain unverified; the emulator does not install the proprietary ARM64-only Taobao APK.
