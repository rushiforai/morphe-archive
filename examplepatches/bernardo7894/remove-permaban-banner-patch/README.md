# Remove Permanent Ban Banner Patch

A small third-party Morphe patch source for the official Reddit Android app, modeled after Patcheddit rather than the full official `morphe-patches` repository.

## Patch

- App: Reddit
- Package: `com.reddit.frontpage`
- Supported version: `2026.10.0` / `2610110`
- Patch: `Hide permanent ban banner`

The patch hides the persistent permanent-ban account banner whose Android text is assembled as:

`This account has been banned permanently. Check your inbox for a message with more information.`

It does not modify Reddit API behavior and does not make the app believe the account is not banned. It only skips the two UI banner render paths identified in Reddit `2026.10.0`.

## Build

```powershell
.\gradlew.bat :patches:buildAndroid :patches:generatePatchesList --no-daemon
```

The bundle is written under `patches/build/libs`.

The Manager-facing bundle copy is published at `dist/patches-0.1.0.mpp` and referenced by `patches-bundle.json`.

## Add Source To Morphe Manager

After publishing this repository to GitHub, add it in Morphe Manager from advanced/expert mode using the same style as Patcheddit:

`https://morphe.software/add-source?github=bernardo7894/remove-permaban-banner-patch`

For a local development build, use the generated `.mpp` bundle from `patches/build/libs` if your Morphe Manager build supports importing a local patch bundle.

## Apply

1. Open Morphe Manager and add this patch source.
2. Select Reddit `com.reddit.frontpage`.
3. Provide the Reddit `2026.10.0 / 2610110` APKM.
4. Enable `Hide permanent ban banner`.
5. Patch and install the resulting app.

Because the input is an APKM from APKMirror, let Morphe Manager handle the split APK bundle during patching.

## Verify

1. Log into a permanently banned Reddit account.
2. Confirm the permanent-ban banner no longer appears on the home feed.
3. Open the inbox and confirm the same permanent-ban banner no longer appears there.
4. Confirm normal browsing still works.
5. Confirm unrelated banners or notices, including non-permanent suspension or password-reset notices, are not unnecessarily removed.

## Investigation

See `docs/investigation.md` for the target analysis, resource IDs, classes, methods, and limitations.
