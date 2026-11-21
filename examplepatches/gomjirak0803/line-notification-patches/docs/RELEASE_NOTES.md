Independent experimental Morphe patches for LINE 26.16.0 (`versionCode 261600106`). Requires Morphe Patcher 2.3.0.

- Features: `Not Too Much Silent` (local quiet mode + complete hide), `More Chat Info` (Android `MessagingStyle` conversation preview + native total unread count), `No reply` (hides smart-reply chips while keeping manual inline reply), `Mark as read` (marks whole regular chat read via LINE's native chat-list updater), and optional `Restore push registration`.
- **0.1.11-dev**: Displays sender profile avatars inside expanded `More Chat Info` notifications—reusing LINE's original notification icon for 1:1 chats and reading LINE's local Glide cache only (`onlyRetrieveFromCache(true)`) for multi-sender group chats with zero additional network requests. Also moves trailing 400ms active-notification refreshes to a background worker thread.
- Verified on Samsung Galaxy S10e (Android 12 / One UI 4.1) for real-device expanded avatar rendering, plus 1,075 static APK contract assertions (ARM64 & Universal, including 11 Glide cache-only bindings). See `docs/DEVICE_TESTS.md` for full verification scope including Android 16 (API 36) emulator and Galaxy S22 Ultra (One UI 8.0) diagnostic results.
- `Restore push registration` is an optional, default-off patch that overrides only the `X-Android-Cert` header on Firebase Installations requests.
- Original/patched LINE APKs, APKMs, and signing keys are never distributed. Provide your own official LINE 26.16.0 APKM.
- Licensed under GPL-3.0 with `NOTICE` and `THIRD_PARTY_NOTICES.md`; corresponding source archive and build scripts are included.
- Bundle publisher signatures are not yet enabled; `SHA256SUMS.txt` is provided for file integrity comparison.

Add via **Sources → + → Remote**: `https://github.com/gomjirak0803/line-notification-patches`
Enable **Pre-release patches** and **Experimental app versions**, then patch your official LINE 26.16.0 APKM in Expert mode.
