# GTA Mods: Morphe patches (San Andreas DE and Chinatown Wars)

[Morphe](https://morphe.software) patches for two Rockstar games on Android, no PC and no root needed:

- **GTA: San Andreas – Definitive Edition** (`com.rockstargames.gtasa.de` **1.87.0**, arm64): the AML mod loader and
  PC mod ports. The mods are built in
  [GTASA-DE-Android-ModLoader](https://github.com/RAZORRZR0/GTASA-DE-Android-ModLoader).
- **GTA: Chinatown Wars** (`com.rockstargames.gtactw` **4.4.243**, arm64): a cheat menu, and a loader for HD texture
  packs and replacement radio stations. See [GTA: Chinatown Wars](#gta-chinatown-wars) below.

The sections up to *GTA: Chinatown Wars* are about San Andreas.

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
> **[v1.5.0](https://github.com/RAZORRZR0/gtasa-de-morphe-patches/releases/tag/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;12 patches total
<details open>
<summary>📦 GTA: SA&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
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
| [Add online co-op](#add-online-co-op) | Adds SA:COOP DE, which lets two to four players play the story together over the network. A phone joins a PC or phone host and hosts other phones; the SA:COOP button at the top of the screen opens it. Installs its animation packs in Android/data/com.rockstargames.gtasa.de/coop/packs/. |  |
| [Fix prop physics](#fix-prop-physics) | Adds GTA Prop Fix, which restores the original game's physics for knocked-over props: lamp posts, traffic lights, signs, bins and hydrants fall and roll with world and car collision instead of DE's physics, and broken pieces land on the ground instead of falling through the map. |  |
| [Load pak mods](#load-pak-mods) | Loads Unreal .pak mod files from Android/data/com.rockstargames.gtasa.de/paks/ when the game starts, above the game's own paks, so PC Definitive Edition pak mods work as-is. Copy the .pak files there and restart the game. |  |
| [Play loading screen music](#play-loading-screen-music) | Plays one of the game's eight loading-screen themes while a save loads, like the PC SALoadingMusic mod. |  |

</details>

<details open>
<summary>📦 GTA: Chinatown Wars&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.rockstargames.gtactw`

**🎯 Supported versions:**

| 4.4.243 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add cheat menu](#add-cheat-menu) | Adds a MOD button that opens a cheat menu over the running game: god mode, infinite ammo, never wanted, one-hit kills, money, weapons, a vehicle spawner sorted by class, indestructible vehicle, nitro, time, weather, traffic and pedestrian density, freezing mission timers and teleporting to the map waypoint. |  |
| [Download HD texture pack](#download-hd-texture-pack) | The first time the game opens without the HD textures, offers to download them (965 MB, AI-upscaled 3D world and 2D art, from github.com/RAZORRZR0/ctw-packs). Interrupted downloads resume. |  |
| [Load texture and radio packs](#load-texture-and-radio-packs) | Loads texture packs (DXT.bin, CTWHD.bin) and radio stations (radio/*.mp3, names.txt, station logos) from Android/data/com.rockstargames.gtactw/files/ when the game starts. With the cheat menu, its Packs tab imports radio stations from a zip or folder, converting the PSP version's .AT3 files on the phone; the GTA IV radio mod for the PSP version also gets its station names and logos. No music is included. |  |

</details>

<!-- PATCHES_END -->

Project Props downloads its placements from [user-grinch/Project-Props](https://github.com/user-grinch/Project-Props) while patching (pinned commit, needs internet) and builds `ProjectPropsDE.dat` like the mod repo's `build_props.py`, so this patches file ships none of them.

*Add blowing litter* needs a model pak made from the game's own `GTASA_ModelData`. Instead of shipping it, `Boot`
builds `paks/904-Rubbish-DE_P.pak` from the installed game (its `pakchunk0`) at the first start after patching, in
about 2 seconds; it depends on *Load pak mods*, which loads it.

## GTA: Chinatown Wars

For `com.rockstargames.gtactw` **4.4.243** (arm64), the full single APK (about 960 MB).

1. In Morphe Manager add this patch source: `https://github.com/RAZORRZR0/gtasa-de-morphe-patches`
   ([add](https://morphe.software/add-source?github=RAZORRZR0/gtasa-de-morphe-patches)). It is the same source as for
   San Andreas.
2. Select GTA: Chinatown Wars 4.4.243, tick the patches, patch, install.
   **The first install replaces the Play Store game, which deletes the game's folder in `Android/data`, including
   your saves (`savegame0`, `savegame1`…)**: copy `Android/data/com.rockstargames.gtactw/files/` somewhere first and
   copy it back after installing. Later re-patches are updates and keep everything.
3. Optional: radio stations from other games or mods: make a radio folder (see [Packs](#packs)) and import it from
   the MOD menu's **Packs** tab.

| Patch | What it does |
|---|---|
| **Add cheat menu** | A **MOD** button at the top of the screen opens a menu on the left, over the running game (it does not pause it). Player: god mode, infinite ammo, never wanted, one-hit kills, health, armour, wanted level up/down/clear, money (+$10K, +$100K, +$1M), drug stash. Vehicle: spawner for all 103 vehicles grouped by class (cars, bikes, boats, helicopters, tanks) with search, put me in the spawned car, indestructible vehicle, nitro. Weapons: the four weapon sets, any single weapon, explosive pistol. World: freeze the clock and mission timers, traffic/pedestrian/cop density (off, normal, high), fast clock, time of day, seven weathers. Teleport: to the map waypoint, save and return to a spot. |
| **Load texture and radio packs** | At each start, loads the packs present in `Android/data/com.rockstargames.gtactw/files/`: `DXT.bin` (3D world texture sheets), `CTWHD.bin` (HD cutscene panels, portraits and menus), and the `radio/` folder: station MP3s, `names.txt` (station names), `ss_radio.png` and `radio_menu.png` (station logos of the car radio and the pause menu). Any of them can be left out. With *Add cheat menu*, its **Packs** tab imports a radio folder and removes it again. |
| **Download HD texture pack** | The first time the game screen opens without `DXT.bin` and `CTWHD.bin`, offers to download them (965 MB) from [ctw-packs](https://github.com/RAZORRZR0/ctw-packs/releases/tag/v1), with a progress bar while you keep playing. An interrupted download resumes; files already there (also your own packs) are kept. Restart the game afterwards. |

### Packs

**HD textures** come with *Download HD texture pack*: no PC needed. To make your own instead, see
[tools/ctw/README.md](tools/ctw/README.md) (`ctwtex.py`).

**Radio stations are not shipped** (the music belongs to its labels and Rockstar); the game imports them on the phone.

**GTA IV radio** (the mod for the PSP version by [AshleyVT92](https://www.youtube.com/@AshleyVT92), 22 GTA IV
stations in two parts of 11):

1. Download its zip to the phone:
   [GTA CW (PSP EDITION) MOD IV FULL RADIO STATIONS ASHLEY VER.zip](https://drive.google.com/file/d/1yNyH9afA7Jfxg9J8drI_d8Bnlaae5yAA/view)
   (1.3 GB). No need to unzip it.
2. In the game, open **MOD → Packs → Import radio (.zip)**, pick the zip, then **Parte 1** or **Parte 2**.
3. Wait while the phone converts the PSP's `.AT3` audio to MP3 (a few minutes; the game keeps running). The station
   names and logos of that part are added too.
4. Close the game when asked and open it again.

**Other music:** stations as `.mp3` (or `.AT3`) named `radio1` … `radio5`, `khalil`, `tortoise`, `wonderwheel`,
`anvil`, `chinese`, `dfa`, in a folder or zip; import it the same way (**Import radio folder** for a folder). For other
formats, station names and logos, `make_radio.py` makes such a folder on a PC (see
[tools/ctw/README.md](tools/ctw/README.md)).

**Packs → Remove radio pack** goes back to the game's own stations. To switch between parts or sets, import the other
one.

### FAQ

**Which APK works?** The full `com.rockstargames.gtactw` 4.4.243 APK for arm64 (one file, about 960 MB). Other
versions are refused because the mods use this build's code addresses; patching with *force* builds an APK whose
mods turn themselves off when a function is missing, but untested.

**My saves are gone after installing.** Android deletes an app's `Android/data` folder when the original is
uninstalled to make room for the patched one. Copy the `savegame*` files back into
`Android/data/com.rockstargames.gtactw/files/` (the game must have been started once, so the folder exists). With a
Rockstar account the cloud save also works.

**I don't see the MOD button.** It appears once the game screen (not the Rockstar sign-in or the legal screen) is
showing. Check that *Add cheat menu* was ticked; logcat tags `CTWMenu` and `CTW Mod Menu` show what failed.

**Does the menu work in missions?** Yes. Cheats behave like the game's own cheats (the same functions); freezing time
also stops mission countdowns. Spawning a vehicle takes about 2 seconds while its model loads.

**The radio plays static.** The MP3 starts with a tag (ID3). Import drops it; if you copy files by hand, make them
with `make_radio.py`, which writes files without one.

**A radio station is shorter / not replaced.** Station files must be named `radio1` … `radio5`, `khalil`,
`tortoise`, `wonderwheel` (or `toth`), `anvil`, `chinese`, `dfa` (`.mp3` or `.AT3`). Missing stations keep the
game's own. Stations can be hours long.

**Can I change the station logos?** The GTA IV radio import adds them. For your own,
`make_radio.py --logos LOGO_DIR --apk GAME_APK` builds `ss_radio.png` (car radio) and `radio_menu.png` (pause menu)
from one image per station. Anvil, Sinowav FM and DFA have no text name in the game, only the logo.

**Import says "no stations found" or "cannot read the zip".** The zip or folder must hold station files named as
above (in any subfolder). A zip has to be on the phone itself: download it first rather than picking it from Google
Drive in the picker. The Packs tab only shows when *Load texture and radio packs* was ticked.

**How long does the GTA IV import take, and how much space?** About 2 minutes per part on a recent phone, about
700 MB per part. Remove the 1.3 GB zip afterwards if you like.

**The textures don't look much sharper.** The game draws the world from far above and without mipmaps, so 2x
textures mostly sharpen signs and close walls. Roads and pavements are not texture sheets the packs can replace.

**The radar is a blue disc.** That comes from radar map tiles in a `CTWHD.bin` made by other tools; `ctwtex.py
sidecar` skips them. Rebuild the pack with it.

**How do I turn a pack off?** Radio: **MOD → Packs → Remove radio pack**. Textures: delete `DXT.bin` and
`CTWHD.bin` in `Android/data/com.rockstargames.gtactw/files/` (with *Download HD texture pack* the game then offers
them again at the next start; patch without it to stop that).

**Does this need root, Frida or a PC?** No. The patched game loads the mods itself (AML, see *How it works*), and
imports the GTA IV radio on the phone. A PC is only needed to turn other music formats into stations.

**Space needed.** The patched APK is about the size of the original. HD textures: 965 MB. A GTA IV radio part about
700 MB.

## Credits

- **Rubbish-DE**: the PC mod by **H4V3NART**, ported here to Android (AML mod and on-device pak builder).
- **Project Props 4**: [user-grinch](https://github.com/user-grinch/Project-Props).
- **AML** (Android Mod Loader): RusJJ.
- **AMD FidelityFX Super Resolution 1** (FSR in *Add PS2 graphics*): AMD, MIT license.
- **SA:COOP** (*Add online co-op*): the original co-op mod and its animation packs by
  [Karimov-Akbar](https://github.com/Karimov-Akbar/sa-coop) (MIT); Definitive Edition port:
  [sa-coop-de](https://github.com/RAZORRZR0/sa-coop-de).
- SkyGfx, GTA Prop Fix (prop physics), CLEO, SALoadingMusic: ports of the PC and Android mods of the same names; see the
  [mod loader repo](https://github.com/RAZORRZR0/GTASA-DE-Android-ModLoader) for each one's origin.
- **Chinatown Wars**: cheat menu, pack loader, HD texture pack and pack tools by RAZORRZR0 (this repo). The HD pack
  was upscaled with [4x-UltraSharpV2](https://huggingface.co/Kim2091/UltraSharpV2) by Kim2091 and
  [1x DXTDecompressor Source V3](https://openmodeldb.info/models/1x-DXTDecompressor-Source-V3) by josephthekp. GTA IV
  radio import: the radio mod for the PSP version by [AshleyVT92](https://www.youtube.com/@AshleyVT92) (its audio is
  converted on the phone; its station names and logos are recreated here). The converter uses
  [FFmpeg](https://ffmpeg.org)'s ATRAC3plus decoder (LGPL 2.1) and [LAME](https://lame.sourceforge.io) (LGPL 2),
  built from source by `native/ctw/ctwpacks/build_codecs.sh`. GTA: Chinatown Wars and its art, text and music belong
  to Rockstar Games; GTA IV's station logos and music to Rockstar Games and their owners.

## How it works

- Every mod patch depends on the hidden **mod loader** patch: it adds `lib/arm64-v8a/libAML.so` and the
  `gtade.boot.Boot` extension, and calls `Boot.start()` in `GameActivity`'s static init right after
  `loadLibrary("UE4")`.
- Mod patches put their library in `assets/gtade/mods/`, their config/data files in `assets/gtade/configs/`, CLEO's
  scripts in `assets/gtade/cleo/` and SA:COOP's animation packs in `assets/gtade/coop/packs/`.
- At the first start after a (re)patch, `Boot` copies them to the same folders of
  `Android/data/com.rockstargames.gtasa.de/` (an existing `.ini` is rebuilt from the new one with the user's values
  kept), builds the Rubbish-DE pak when that patch is included, deletes mod libraries, SA:COOP packs and paks of the
  previous patch that are no longer included, then loads AML, which loads the mods. Logcat tag `GTADEBoot`.
- Chinatown Wars uses the same `Boot`: its hidden loader patch calls `Boot.start()` in
  `com.rockstargames.oswrapper.GameNative`'s static init right after `loadLibrary("Game")`, so AML and the mods load
  before the game initialises and their hooks are in place before any texture, sound or text is read. *Add cheat
  menu* also calls `ctw.menu.Menu.install()` there, which shows the menu (a WebView) when `GameActivity` resumes;
  `libctwmenu.so` registers the menu's natives and runs its actions on the game thread. `libctwpacks.so` hooks the
  game's asset opening (`NvFOpen`), its texture-override lookup (`TryDXTSize`/`GetDXTData`, also for the pause-menu
  station logos) and its text loading (`InitGlobalText`). *Download HD texture pack* calls `ctw.packs.Packs.installHd()`
  there; the menu's Packs tab copies a picked folder (Storage Access Framework) to `files/radio/`. Sources:
  `native/ctw/`, `extensions/extension/src/main/java/ctw/`.

## Build

```sh
./sync-mods.sh <path to GTASA-DE-Android-ModLoader> <path to sa-coop-de>
# after loader/build_aml_arm64.sh and mods/build.sh in the first, android/build.sh in the second
native/ctw/build.sh   # Chinatown Wars mods -> patches/src/main/resources/ctw/
GITHUB_ACTOR=<user> GITHUB_TOKEN=<token with read:packages> ./gradlew buildAndroid
# -> patches/build/libs/patches-<version>.mpp
```

Test on a PC with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):
`java -jar morphe-desktop-<v>-all.jar patch -p patches/build/libs/patches-<v>.mpp <game.apk>`.

## License

GPLv3 (see `LICENSE`). Bundled: AML (RusJJ, MIT), AMD FSR 1 shaders (MIT) and the mods from the mod loader repo (MIT).
No game files, game art or music are bundled.
