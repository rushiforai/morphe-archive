# Gboard offline voice typing and telemetry reduction

**Supported APK set:** Gboard `18.5.4.993608717-release-arm64-v8a` and `18.5.4.993608717-release-armeabi-v7a`

**Package:** `com.google.android.inputmethod.latin`

**Version codes:** `176049702` (arm64-v8a), `176049701` (armeabi-v7a)

## Patch behavior

- Rewrites the core speech-recognizer selector to use only the on-device providers. Jetson Lite uses its local recognizer. If the provider/model is absent, unavailable, or fails to return a recognizer, the method returns no recognizer; it never chooses the original S3/Speech-IME route.
- Disables the Agentic Dictation server/batch retry entry point and forces its two configuration holders false.
- Disables Gboard's MetricsManager sampling gate and Clearcut queue/activation methods; keeps Primes on its built-in no-op instance.
- Forces the clipboard feature flag false, and hard-disables the voice flags that bind Wi-Fi during recognition, request contact access, or use the Bluetooth voice setting.
- Sets Cronet's `EnableTelemetry` metadata false, disables Android backup, removes the backup-agent and backup API-key declarations, and applies privacy-safe managed defaults for metrics, federated training, Agentic Dictation, clipboard, Scribe, voice widget/direct-to-dictation access points, hybrid writing tools and default layout/theme overrides.
- Leaves `INTERNET` and unrelated network features such as translate and OCR alone. Telemetry suppression is best-effort and does not promise zero Google or Google Play services communication.

## Disable Bluetooth voice routing

The separate **Disable Bluetooth voice routing** patch treats every Bluetooth audio device as an unusable car device. Gboard voice typing then keeps using the built-in microphone instead of switching to a Bluetooth headset microphone. It is intended for users who do not want dictation audio routed over Bluetooth.

## Important limitations

- A compatible offline speech model/provider must already be installed and available. Without it, voice typing is unavailable by design; there is no cloud fallback.
- Agentic Dictation is disabled. Other Gboard network features are not intentionally disabled.
- The patches target the versions above only. The current changes were verified to apply to the armeabi-v7a APK; the arm64-v8a XAPK shares the same obfuscated shapes but was not re-applied in this session. On-device runtime behavior has not been tested on every OEM build.
