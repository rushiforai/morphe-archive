Independent experimental Morphe patches for LINE 26.16.0 (`versionCode 261600106`). Requires Morphe Patcher 2.3.0.

- Features: `Not Too Much Silent` (local quiet mode + complete hide), `More Chat Info` (Android `MessagingStyle` conversation preview + native total unread count + sender avatars from local caches only), `No reply` (hides smart-reply chips while keeping manual inline reply), `Mark as read` (marks whole regular chat read via LINE's native chat-list updater), and optional `Restore push registration`.
- **0.1.12-dev**: Adds full multi-language (i18n) support through standard Android string resources. All 39 user-facing strings—the Notification patch settings screen, chat-menu "Hide notifications completely" item and dialogs, toasts, silent channel name/description, redacted "new message" text, the "Mark as read" notification action, and placeholder names—follow the app/system language across 7 locales: English (default), Korean, Japanese, Traditional Chinese, Simplified Chinese, Thai, and Indonesian. The four canonical patch names stay in English.
- Verified with 18 Python tests, 1,179 static APK contract assertions (ARM64 & Universal), and compiled `resources.arsc` checks confirming all 39 keys in all 7 locales. See `docs/DEVICE_TESTS.md` for real-device and cross-environment verification scope.
- `Restore push registration` is an optional, default-off patch that overrides only the `X-Android-Cert` header on Firebase Installations requests.
- Original/patched LINE APKs, APKMs, and signing keys are never distributed. Provide your own official LINE 26.16.0 APKM.
- Licensed under GPL-3.0 with `NOTICE` and `THIRD_PARTY_NOTICES.md`; corresponding source archive and build scripts are included.
- Bundle publisher signatures are not yet enabled; `SHA256SUMS.txt` is provided for file integrity comparison.

Add via **Sources → + → Remote**: `https://github.com/gomjirak0803/line-notification-patches`
Enable **Pre-release patches** and **Experimental app versions**, then patch your official LINE 26.16.0 APKM in Expert mode.
