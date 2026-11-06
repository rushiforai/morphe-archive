# GTA SA DE Mods: Morphe patches

[Morphe](https://morphe.software) patches that add the AML mod loader and PC mod ports to
**GTA: San Andreas – Definitive Edition** for Android (`com.rockstargames.gtasa.de` **1.87.0**, arm64).
No PC and no root needed. The mods are built in
[GTASA-DE-Android-ModLoader](https://github.com/RAZORRZR0/GTASA-DE-Android-ModLoader).

## Use

1. In Morphe Manager add this patch source: `https://github.com/RAZORRZR0/gtasa-de-morphe-patches`
   ([add](https://morphe.software/add-source?github=RAZORRZR0/gtasa-de-morphe-patches)).
2. Select GTA: SA 1.87.0, tick the mods, patch, install.
   **The first install replaces the Play Store game, which deletes its saves on the phone**: keep them in
   Rockstar's cloud save or back them up first. Later re-patches are updates and keep them.
3. To add or remove mods, patch again with a different selection. Settings are in the game (ModMenu); a mod's
   `.ini` is only written when it does not exist yet (new settings sections are added to it), so re-patching keeps them.

> [!WARNING]
> **Patch the single full APK (about 860 MB), not a split APK set** (`.apks`, `.apkm`, `.xapk`, or the game as
> installed from the Play Store, which is a base APK plus asset/config splits). Morphe Manager merges a split set
> into one APK first, and for this game the merged file is larger than 4 GB, which a zip cannot hold. Patching then
> fails with:
>
> ```
> java.io.IOException: Failed to read zip file '…/merged-….apk'
> Caused by: java.io.IOException: File exceeds size limit of 4294967295.
> ```
>
> This is a limit of the APK format, not of these patches, and choosing other patches does not help.

> [!NOTE]
> Patch names follow Morphe's naming guideline since v1.2.0 (for example *SkyGfx* is now *Add PS2 graphics*), so
> Morphe Manager shows the patches as new: check your selection once before patching.

<!-- PATCHES_START EXPANDED -->
> **[v1.2.3](https://github.com/RAZORRZR0/gtasa-de-morphe-patches/releases/tag/v1.2.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 GTA: SA&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `com.rockstargames.gtasa.de`

**🎯 Supported versions:**

| 1.87.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add CLEO script support](#add-cleo-script-support) | Adds CLEO Android 2.0.1, which runs CLEO scripts with the swipe-down CLEO menu. Installs 14 GTA SA scripts in Android/data/com.rockstargames.gtasa.de/cleo/; the .csa ones, such as invincibility and regeneration, always run, so delete the ones you don't want. |  |
| [Add PS2 graphics](#add-ps2-graphics) | Adds SkyGfx: PS2 colours and timecyc, radiosity, distant lamp coronas and post effects, the PC graphics settings the phone menu hides (draw distance, shadows, anti-aliasing and more) and AMD FSR 1 upscaling. |  |
| [Add blowing litter](#add-blowing-litter) | Adds Rubbish-DE by H4V3NART: loose litter on the streets that blows around when vehicles pass. Builds its model pak from the game's own files at the first start, so no game files are shipped. |  |
| [Add extra map props](#add-extra-map-props) | Adds about 16,000 map props from Project Props 4 by user-grinch. Downloads the placements from github.com/user-grinch/Project-Props while patching, so it needs internet. |  |
| [Add mod menu](#add-mod-menu) | Adds ModMenu, an in-game menu that changes the settings of the other mods while playing. |  |
| [Fix prop physics](#fix-prop-physics) | Adds GTA Prop Fix, which restores the original game's physics for knocked-over props: lamp posts, traffic lights, signs, bins and hydrants fall and roll with world and car collision instead of DE's physics, and broken pieces land on the ground instead of falling through the map. |  |
| [Load pak mods](#load-pak-mods) | Loads Unreal .pak mod files from Android/data/com.rockstargames.gtasa.de/paks/ when the game starts, above the game's own paks, so PC Definitive Edition pak mods work as-is. Copy the .pak files there and restart the game. |  |
| [Play loading screen music](#play-loading-screen-music) | Plays one of the game's eight loading-screen themes while a save loads, like the PC SALoadingMusic mod. |  |

</details>

<!-- PATCHES_END -->

Project Props downloads its placements from [user-grinch/Project-Props](https://github.com/user-grinch/Project-Props) while patching (pinned commit, needs internet) and builds `ProjectPropsDE.dat` like the mod repo's `build_props.py`, so this patches file ships none of them.

*Add blowing litter* needs a model pak made from the game's own `GTASA_ModelData`. Instead of shipping it, `Boot`
builds `paks/904-Rubbish-DE_P.pak` from the installed game (its `pakchunk0`) at the first start after patching, in
about 2 seconds; it depends on *Load pak mods*, which loads it.

## Credits

- **Rubbish-DE**: the PC mod by **H4V3NART**, ported here to Android (AML mod and on-device pak builder).
- **Project Props 4**: [user-grinch](https://github.com/user-grinch/Project-Props).
- **AML** (Android Mod Loader): RusJJ.
- **AMD FidelityFX Super Resolution 1** (FSR in *Add PS2 graphics*): AMD, MIT license.
- SkyGfx, GTA Prop Fix (prop physics), CLEO, SALoadingMusic: ports of the PC and Android mods of the same names; see the
  [mod loader repo](https://github.com/RAZORRZR0/GTASA-DE-Android-ModLoader) for each one's origin.

## How it works

- Every mod patch depends on the hidden **mod loader** patch: it adds `lib/arm64-v8a/libAML.so` and the
  `gtade.boot.Boot` extension, and calls `Boot.start()` in `GameActivity`'s static init right after
  `loadLibrary("UE4")`.
- Mod patches put their library in `assets/gtade/mods/` and their config/data files in `assets/gtade/configs/`.
- At the first start after a (re)patch, `Boot` copies them to `Android/data/com.rockstargames.gtasa.de/{mods,configs}`
  (an existing `.ini` is kept and only gains missing sections), builds the Rubbish-DE pak when that patch is
  included, deletes mod files of the previous patch that are no longer included, then loads AML, which loads the
  mods. Logcat tag `GTADEBoot`.

## Build

```sh
./sync-mods.sh <path to GTASA-DE-Android-ModLoader>   # after its loader/build_aml_arm64.sh and mods/build.sh
GITHUB_ACTOR=<user> GITHUB_TOKEN=<token with read:packages> ./gradlew buildAndroid
# -> patches/build/libs/patches-<version>.mpp
```

Test on a PC with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):
`java -jar morphe-desktop-<v>-all.jar patch -p patches/build/libs/patches-<v>.mpp <game.apk>`.

## License

GPLv3 (see `LICENSE`). Bundled: AML (RusJJ, MIT), AMD FSR 1 shaders (MIT) and the mods from the mod loader repo (MIT).
No game files are bundled.
