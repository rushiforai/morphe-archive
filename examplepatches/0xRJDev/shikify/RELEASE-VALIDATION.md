# Release validation — 1.1.4

Compiled the bundle and applied all 25 patches to original Boost 1.14.4: register-safe hooks, native mappings and runtime references passed, along with wrapper regressions and 30 host thread-boundary checks. Applied together with Patcheddit 2.2.0 in both orders, and each patch applied alone and with each one left out.

Measured on a phone during development, on mobile data: the home feed finished loading 1.1 s after launch, down from 5.7 s before the loading work.

## Known gaps

- This release was used on a phone on Boost 1.14.4, patched together with Patcheddit 2.2.0: feeds, comments, search, the blurred header and image galleries. The on-device test tools in `tools/` have not been updated for 1.14.4 yet, so this beta relies on the bundle's own checks and hands-on use.
- A saved login was seen restoring on a device, but the background login that follows it was not confirmed. If it does not run, account details, the inbox count and moderator status can be missing, and a saved token Reddit rejects is not replaced until it expires. Turning off **Instant login** under Loading settings avoids this.
- If Reddit rejects a saved token, the first load can fail until the background login replaces it.
