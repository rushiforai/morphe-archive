# Gboard offline voice typing and telemetry reduction

**Supported APK set:** Gboard `18.5.4.993608717-release-arm64-v8a`

**Package:** `com.google.android.inputmethod.latin`

**Version code:** `176049702`

## Patch behavior

- Rewrites the core speech-recognizer selector to use only the on-device providers. Jetson Lite uses its local recognizer. If the provider/model is absent, unavailable, or fails to return a recognizer, the method returns no recognizer; it never chooses the original S3/Speech-IME route.
- Disables the Agentic Dictation server/batch retry entry point and forces its two configuration holders false.
- Disables Gboard's MetricsManager sampling gate and Clearcut queue/activation methods; keeps Primes on its built-in no-op instance.
- Sets Cronet's `EnableTelemetry` metadata false, disables Android backup, removes the backup-agent and backup API-key declarations, and sets the managed defaults `enable_user_metrics`, `user_enable_federated_training`, and `config_agentic_dictation` to false.
- Leaves `INTERNET` and other network permissions/features alone. Telemetry suppression is best-effort and does not promise zero Google or Google Play services communication.

## Important limitations

- A compatible offline speech model/provider must already be installed and available. Without it, voice typing is unavailable by design; there is no cloud fallback.
- Agentic Dictation is disabled. Other Gboard network features are not intentionally disabled.
- The patch targets the version above only. It has not been installed or runtime-tested on a GrapheneOS device; Android version and offline-model availability were not provided.
