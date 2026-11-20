# Morphe patches for Deezer Android

Patches for **Deezer Android**, distributed as a Morphe bundle. Supported Deezer versions, Android requirements, and input file types are declared in the generated [`patches-list.json`](patches-list.json) and shown in Morphe Manager. The patched app uses `deezer.android.app.morphe` and can be installed alongside the official app.

## Install

1. Open [Add source to Morphe](https://morphe.software/add-source?github=AudioPatchLab/deezer-morphe-patches), or add `https://github.com/AudioPatchLab/deezer-morphe-patches` as a remote source in Morphe Manager.
2. Select Deezer and provide the original app archive for a compatible version shown in Morphe Manager (package name `deezer.android.app`).
3. Choose your patches and start patching.

You can get the original Deezer app archive from [APKMirror](https://www.apkmirror.com/uploads/?appcategory=deezer-music-podcast-player). Choose a version and file type supported by your bundle, as shown in Morphe Manager. Morphe also provides a download link during app selection.

For local import, download the `.mpp` bundle from [GitHub Releases](https://github.com/AudioPatchLab/deezer-morphe-patches/releases/latest). Compatibility depends on the bundle you use; a newer Deezer release is not automatically supported.

## Regional availability

**The patches do not bypass Deezer Free’s country restrictions.** If Deezer Free is unavailable in your country, you may be blocked by a subscription screen after signing in and unable to use the app with a free account.

A user in **Japan** reported this behavior: account creation and sign-in succeeded, but the app then required a subscription with no way to continue. The current bundle does not resolve that restriction. We have not reproduced it locally or verified the behavior in every affected country.

**Countries with Deezer Free:** United States (mobile only), Brazil, Germany, France, Canada, Great Britain, United Arab Emirates, Belgium, Ireland, Saudi Arabia, Turkey, and Ukraine.

This is the Free-specific list published in [Deezer’s support article](https://support.deezer.com/hc/en-gb/articles/115003749449-List-Of-Countries-Deezer-Is-Available-In). Look for the paragraph beginning “Deezer Free is available in”, above the continent tables. Those tables include countries with paid plans and do not indicate Free availability. Japan is not on the Free list. Availability may change; check that paragraph for updates.

## Patches

| Patch | Purpose |
| --- | --- |
| **Choose tracks on demand** | Select tracks in albums, playlists, artist pages, library favorites, listening history, and profile recommendations. |
| **Enable player navigation** | Previous and next controls, unlimited skips, and seeking. |
| **Manage the playback queue** | Open the queue and use “Add to queue” and “Play Next”. |
| **Search and sort playlists** | Search from playlist headers and sort from playlist menus. |
| **Block ads** | Hide banner and native ads and skip visual pre-rolls and audio ad breaks. |
| **Hide Premium offers** | Hide offer pop-ups, the Premium tab, upgrade buttons, and locked audio quality options. |
| **Open lyrics from the player** | Open the lyrics view from the player. |
| **Enable offline downloads** | Enable download actions, subject to server-side stream availability. |

## Known limitations

- Downloads and audio quality depend on the streams Deezer provides. A previous free-account test received MP3 at 128 kbit/s; hiding quality offers does not unlock higher-quality streams.
- The shared session-persistence component disables `log.listen` and `log.batch_listen`, which may affect listening history and recommendations.
- Behavior can vary with the account, region, and server responses. Not every ad format or playback scenario has been verified.

Previous investigations and test details are in [`morphe/DIAGNOSTIC.md`](morphe/DIAGNOSTIC.md).

## Development

Sources are in [`morphe/src/`](morphe/src/), with the bundle version in [`morphe/VERSION`](morphe/VERSION). The build uses a JDK, the Kotlin compiler supplied by Gradle, the Android SDK, and a [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) JAR. Check [`morphe/build-bundle.sh`](morphe/build-bundle.sh) for compiler, SDK, and Patcher requirements, and the [metadata workflow](.github/workflows/sync-community-patches.yml) for the pinned Desktop release. Use compatible tool versions rather than assuming the latest releases will work.

Place the Desktop JAR at `.local/tools/morphe-desktop.jar`, then run from the repository root:

```bash
export JAVA_HOME=/path/to/jdk
export ANDROID_HOME=/path/to/Android/Sdk
./morphe/build-bundle.sh .local/tools/morphe-desktop.jar /path/to/gradle
```

The bundle is written to `morphe/build/`. For device testing, import it into Morphe Manager. The optional [`morphe/test-bundle.sh`](morphe/test-bundle.sh) helper builds signed x86_64 APKs and applies all patches by default; it requires a compatible original archive, a local test signing key, and Android Platform Tools. Set `DEEZER_ARCHIVE` to your archive’s path. Validate changes with all patches enabled together. Keep accounts, APKs, signing keys, and session logs out of Git; `.local/` is ignored.

## Publishing

1. Increment `morphe/VERSION`, build and test the bundle, then push the sources.
2. Create a stable release tagged `v<version>` and attach `morphe/build/deezer-local-<version>.mpp`.
3. Update [`patches-bundle.json`](patches-bundle.json) with the version, accessible release download URL, UTC timestamp, and description.
4. Verify that **Sync community patches list** succeeds in GitHub Actions. It generates [`patches-list.json`](patches-list.json) from the published bundle for the [community directory](https://morphe-patches.software/?app=deezer.android.app). Do not edit that generated list manually.
