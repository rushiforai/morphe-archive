# Development

## Build and test

Requirements: JDK 21, Android SDK platform/build tools 36, and GitHub Packages credentials with `read:packages`.

Set `GITHUB_ACTOR`/`GITHUB_TOKEN`, or store `gpr.user`/`gpr.key` in your **user-level** Gradle properties. Keep credentials out of the repository. CI uses its built-in `GITHUB_TOKEN`.

```powershell
.\gradlew.bat :patches:buildAndroid test :extensions:extension:lintRelease
```

The patch bundle is written to `patches/build/libs/patches-*.mpp`. On Linux/macOS, use `./gradlew`.

### Real-APK validation

Apply the add-on with an official Morphe Patches bundle and run SDK DEX/hierarchy checks:

The current baseline is Morphe Patches **2.0.0**, Patcher **2.1.0**, and patches Gradle plugin **2.1.0-dev.1**. Build tooling follows the official patches template; YTM target versions and experimental flags follow the Morphe Patches release's compatibility declaration.

```powershell
.\gradlew.bat :patches:validateDiscord "-PdiscordApk=C:\path\music.apk" "-PmorpheBundle=C:\path\official-patches.mpp"
```

To also produce an unsigned APK, add `"-PdiscordOutput=C:\existing-folder\music-discord-unsigned.apk"`.

After runtime changes, check background track changes, rapid skips, pause/resume after more than a minute, reconnects, application-ID changes, and finishing browser sign-in after killing the app process. SDK checks do not replace device testing.

## Diagnostics

The in-app **Connection status** reports connection and artwork errors. To read app diagnostics:

```text
adb logcat -s DyskalDiscordRPC
```

Logs contain controlled error categories and metadata capability flags, not tokens, authorization codes, or raw server responses.

## Custom Discord application

The default application (`1559278040175878146`) needs no user setup. To use your own:

1. Enable Social SDK/public-client OAuth and access to `sdk.social_layer_presence` in the Discord Developer Portal.
2. Register the redirect URI exactly as `ytmdiscord://oauth2/callback`.
3. Set **Discord application ID** in the add-on's settings and connect again.

Authentication uses OAuth2 with PKCE. Pending sign-ins are persisted for process-death recovery. Preserve the refresh lock and epoch/revision guards when changing asynchronous code.

Authorization first uses Discord's Android route (`discord://action/oauth2/authorize`), preserving the same query and registered redirect. It falls back to a browser Custom Tab, then a regular browser. No native Social SDK is bundled.

## Releases

Develop on `dev` using semantic commits (`feat:`, `fix:`, `chore:`). Merge `dev` into `main` for a stable release.

The release workflow generates versions, changelogs, patch-source metadata, and the README patch list. Update patch declarations rather than hand-editing generated JSON. Preserve the README's `PATCHES_START`/`PATCHES_END` markers.

Keep CI release commits in branch history. Publish fixes as new commits and use normal pushes; do not amend published commits or force-push release branches.
