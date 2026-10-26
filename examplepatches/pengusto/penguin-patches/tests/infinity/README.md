# Infinity custom OAuth acceptance

Use the original official Infinity+ 8.3.4 APK, package `ml.docilealligator.infinityforreddit.plus`, versionCode 232. SHA-256: `826d6f20476c78c52ce7a53b47d83c67e6f850be13e6eb89074fe2592f933ac6`. Obtain it from the upstream v8.3.4 release, not a repackaged mirror.

1. Build the normal Android patch bundle. Apply only Configure custom OAuth for Infinity+ to the original APK with a synthetic public client ID, custom-scheme redirect and user-agent. Do not use this synthetic configuration to log in.
2. Decode original and output with apktool (`d -r --no-debug-info`). Run `check-infinity-billing-state.py ORIGINAL_DECODED OUTPUT_DECODED`, `check-infinity-oauth-redirect.py OUTPUT_APK OUTPUT_DECODED AAPT REDIRECT_URI`, and `check_custom_client.py OUTPUT_DECODED CLIENT_ID USER_AGENT`.
3. Check missing options, blank client ID/user-agent, malformed/query-bearing/credential-bearing redirect URI. Patching must fail rather than silently choosing a shared client.
4. Sign the output using a disposable test key, install in an isolated emulator, verify no subscription gate, and use a legitimate registered client for consent -> account import -> authenticated feed -> app restart. Never log passwords, cookies, authorization codes or tokens. Verify settings preservation separately on a same-key update.
5. Repeat using Morphe Manager on a physical device before release. Desktop validation does not prove Manager execution or long-term refresh-token behavior.

Current status: steps 1–4 pass (full Gradle Android bundle build, decoded-contract and invalid-option checks, and live OAuth, account import, feed and restart on an API 35 ARM64 emulator). Step 5 is pending. No account data/screenshots are included in this repository.
