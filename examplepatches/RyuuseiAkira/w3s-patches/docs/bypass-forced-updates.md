# Bypass forced updates

- **Patch name:** `Bypass forced updates`
- **Default:** `true` (enabled)
- **Dependency:** `pairipLicenseBypassPatch`
- **Source:** [`BypassForcedUpdatesPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/update/BypassForcedUpdatesPatch.kt)

## What It Does

Prevents the client from locking out older APK builds via `versionConfig.minimumClientBuild`, and disables Google Play in-app review prompts (`[in-app-review]`) on sideloaded installs.

## How It Works

1. Scans `assets/public/_next/static/chunks/*.js` for `W3SAppUpdateProvider`.
2. Matches `MIN_CLIENT_BUILD_GATE_REGEX` (`!e.bypass&&Capacitor.isNativePlatform()&&r?.currentBuild&&t.versionConfig?.minimumClientBuild`) and rewrites `!e.bypass` to `!1`, bypassing the `"Please update to the latest version to continue."` blocking screen when W3Schools raises `minimumClientBuild.android` in remote config.
3. Matches `IN_APP_REVIEW_PREPARE_REGEX` in `prepareChapterReview` (`if(a()&&!h)`) and rewrites `a()` to `!1` so chapter completion never triggers Google Play's in-app review flow.

## Error Handling

Throws `PatchException` if `W3SAppUpdateProvider` is missing or `MIN_CLIENT_BUILD_GATE_REGEX` fails to match.
