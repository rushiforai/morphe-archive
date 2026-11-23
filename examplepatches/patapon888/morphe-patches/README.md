# Patapon888's Morphe patches

Patches for [Morphe](https://morphe.software) for Google Daydream, Nova Launcher, Bejeweled Classic and Fruit Ninja Classic.

## Use

In Morphe Manager or Morphe Desktop, Press [Here](https://morphe.software/add-source?github=patapon888/morphe-patches) or add this repository as a patch source:

```
https://github.com/patapon888/morphe-patches
```

Or download the `.mpp` file from the [latest release](https://github.com/patapon888/morphe-patches/releases/latest).

## Patches

| App | Package | Version | Patches |
|---|---|---|---|
| Google VR Services | `com.google.vr.vrcore` | 1.23.265693388 | DuskDream (VR Services) |
| Daydream | `com.google.android.vr.home` | 1.23.190812026 | DuskDream (Daydream) |
| Daydream Keyboard | `com.google.android.vr.inputmethod` | 1.23.190812016 | DuskDream (Keyboard) |
| YouTube VR | `com.google.android.apps.youtube.vr` | 1.28.63 | DuskDream (YouTube VR) |
| Nova Launcher | `com.teslacoilsw.launcher` | 9.0.0 | Enable Prime, Open in bubble (requires root) |
| Bejeweled Classic | `com.ea.gp.bej3` | 4.0.0 (19300) | Unlock game modes, Remove purchases and ads, Remove boosters, Classic mode layout, Language setting and more |
| Fruit Ninja Classic | `com.halfbrick.fruitninja` | 3.39.3 (89972000) | Remove Halfbrick+ check, Offline mode, Skip startup video, Remove rating prompts, Disable debug logging, Disable tracking, Loop events |

The full list with descriptions is in [`patches-list.json`](patches-list.json).

### DuskDream

Runs Google Daydream on any arm64 phone without root. Patch all three Daydream apps and YouTube with the same bundle: they must share a signature. Google sign-in goes through [MicroG RE](https://github.com/MorpheApp/MicroG-RE). Re-signed apps cannot be installed over Google-signed ones, so uninstall the originals first (this deletes their data).

### Fruit Ninja Classic

Makes the paid Fruit Ninja Classic play like the original offline game: no Halfbrick+ pop-up or video, no sign-in, privacy or rating pop-ups, and it works without network access, also on a first start. The save stays on the phone; it isn't synced to Halfbrick's servers. Disable tracking takes away the network access altogether, so no analytics or crash reports are sent. Events come from the calendar bundled with the app; with Loop events it starts again once it is over, so events keep rotating offline (patch a newer app version to get its newer events). The weekly leaderboards are online only and are hidden. The patches edit the arm64-v8a game library, so patch the full app (base and splits, as an APKM) for an arm64 phone. Re-signed apps cannot be installed over the Play Store one, so uninstall it first (this deletes the save; back it up if you can), unless signature checks are disabled on the phone (CorePatch, for example), in which case it installs over it and keeps the save.

### Daydream catalog

The Daydream discovery and store pages read [`store/store.json`](store/store.json), with pictures in [`store/icons`](store/icons). Each collection is a row in discovery; each app needs a `package`, `title`, `icon_url` (foreground) and `background_url`. Changes go live for everyone as soon as they are pushed to `main`.

## Build

```
./build.sh <version>
```

Needs a JDK 17+, python3, the Android SDK (build-tools 36.0.0, platform android-36), kotlinc and `morphe-cli.jar`. Set `ANDROID_SDK`, `KOTLINC` and `MORPHE_CLI` to their locations. The script writes `build/patches-<version>.mpp` and regenerates `patches-list.json` and `patches-bundle.json`.

## License

[GPLv3](LICENSE)
