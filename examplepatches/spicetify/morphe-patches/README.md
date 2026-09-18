# Spicetify Android patches

Spotify Android customizations for use with [Morphe](https://morphe.software/).
This repository publishes patch source and bundles, not Spotify APKs.

<!-- prettier-ignore -->
> [!NOTE]
> This is an experimental feature currently under active development.
> The initial target is Spotify 9.1.80.2221, ARM64. Runtime compatibility is
> still being verified. See the [verification record](docs/verification.md).

## Patches

The first milestone contains two patches. Colors are optional because they
change only selected Android resources, not every Spotify screen.

| Patch | Default | Behavior |
| --- | --- | --- |
| Clean sharing links | Enabled | Removes `si`, `pi`, and known `utm_*` parameters from `open.spotify.com` links. Preserves timestamps, context, other parameters, and fragments. |
| Theme colors | Disabled | Sets selected background, accent, and pressed-accent colors. The default background is AMOLED black. Hardcoded colors and animations can retain Spotify's colors. |

<!-- PATCHES_START EXPANDED -->
<!-- Release automation inserts the generated patch catalog here. -->
<!-- PATCHES_END -->

## Try the experimental source

The [first prerelease](https://github.com/spicetify/morphe-patches/releases/tag/v1.0.0-dev.1)
is available for testing. Source download, patching, and installation work in
Morphe Manager 1.31.1 on the test emulator. Playback and real sharing still
need verification; there is no verified stable release.

Use a spare Android device or emulator for the initial tests. A patched APK
uses a different signing certificate from stock Spotify. Installing it with
the same package name requires removing stock Spotify first, which removes
its local app data and downloads. Keep Manager's signing key for future
updates; a different key requires another uninstall.

To add the source and patch Spotify in Manager:

1. Open **Sources**, select **Add**, and choose **Remote**.
2. Paste the following source URL, then select **Add**.

   ```text
   https://raw.githubusercontent.com/spicetify/morphe-patches/refs/heads/dev/patches-bundle.json
   ```

3. Expand **Spicetify Android patches** and enable **Experimental app versions**.
4. Return to the app list. Spotify appears with the target version
   `9.1.80.2221`, ARM64 build `145767611`.
5. Optional: To customize colors, open **Settings > Advanced** and enable
   **Expert mode** before selecting Spotify. The default flow applies only
   **Clean sharing links**.
6. Select **Spotify**, choose **No, I already have an APK**, and select your
   original APK or split-APK archive. Expert mode's file picker requires
   Android's **All files access** permission for Manager.
7. Read the experimental-support notice and select **Proceed anyway** if you
   want to test this build. In Expert mode, enable **Theme colors** if wanted,
   use its settings to adjust colors, then select **Proceed to patching**.
8. Wait for **Patching complete**, then select **Install**. If Manager reports
   a certificate conflict, uninstall the existing app only after accepting
   the data loss described above. Confirm installation in Android's dialog.
9. Open Spotify from Android's app launcher and sign in.

This feed stays on experimental releases. Keep your own stock APK or split-APK
archive for patching; the repository does not distribute Spotify.

## Try a local build

Build the bundle using the [development instructions](CONTRIBUTING.md), then
load `patches/build/libs/patches-*.mpp` in
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop). Select your own
stock Spotify APK or split-APK archive matching the declared target.

Keep the patcher's signing key if you use Desktop for later updates. A
Desktop-signed APK and a Manager-signed APK can use different keys.

## Development

Read [CONTRIBUTING.md](CONTRIBUTING.md) for setup, tests, and release steps.
The accepted investigation is preserved in [the plan](docs/plan.md).

This project is independent of Spotify and the Morphe project. Its repository
slug is `morphe-patches`; its display name is Spicetify Android patches.

## License

The patch code is licensed under [GPL-3.0](LICENSE), with the upstream
[NOTICE](NOTICE) retained. See [third-party sources](THIRD_PARTY_NOTICES.md)
for the template and historical implementations used during development.
