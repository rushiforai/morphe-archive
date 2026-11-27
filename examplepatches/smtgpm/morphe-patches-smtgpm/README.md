# 🧩 smtgpm patches

Patches for **Belote.com** (`com.gameduell.mobile.belote`), for use with [Morphe](https://morphe.software).

## ❓ About

Quality-of-life patches for the Unity card game Belote.com: the daily bonus is claimed for you,
collection packs open by themselves and fast, the forced ads are gone, and the game loads
reliably behind a VPN. Google sign-in keeps working through MicroG-RE.

Every patch can be selected on its own in Morphe Manager.

| Patch | What it does |
|---|---|
| Claim daily bonus automatically | Claims the free daily wheel spin in the background when it is ready; the chip counter counts up. |
| Auto-collect daily wheel | Opening the daily wheel with a free spin spins it, collects the chips and closes it. |
| Auto-open packs | Opening "My packs" opens every unopened collection pack one after another. |
| Fast pack opening | Shows all cards of a pack at once and skips the pauses between packs, star packs included. |
| Remove ads | Removes the full-screen ads before Solo games. Optional reward videos stay. |
| Fast startup on VPN | Stops the loading screen from hanging when a download stalls, e.g. behind a VPN. |
| Rotate in both landscape directions | The game turns with the phone when it is held upside down in landscape. |
| MicroG-RE support | Allows Google sign-in through MicroG-RE (needed after patching). |

### Supported version

**Belote.com 2.12.9 (versionCode 2216), arm64-v8a.** The game logic is compiled native code,
so most patches change instructions at fixed addresses of this exact build. The patches check
the version and the native library's SHA-256 first and stop with a clear error on any other
build. A game update needs the addresses to be derived again (see [docs/belote.md](docs/belote.md)).

## 🚀 How to use

1. Install [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases) on your phone and sign in
   to your Google account there (needed for "Login with Google").
2. Add this repository to Morphe Manager: tap the button below, or add
   `https://github.com/smtgpm/morphe-patches-smtgpm` as a patch source.

   <a href="https://morphe.software/add-source?github=smtgpm/morphe-patches-smtgpm">
     <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
   </a>

3. Get the original 2.12.9 split APK, either as an `.apkm` from APKMirror, or from a phone
   where it is installed:

   ```bash
   adb shell pm path com.gameduell.mobile.belote   # lists base.apk and split_config.arm64_v8a.apk
   adb pull <path>/base.apk
   adb pull <path>/split_config.arm64_v8a.apk
   zip -0 belote-2.12.9.apkm base.apk split_config.arm64_v8a.apk
   ```

4. In Morphe Manager, select the APKM, pick the patches you want, and patch.
5. The patched app has a different signature, so **uninstall the original first**. Link your
   progress to Google or Facebook before you do, then sign in again after installing.

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.1.0](https://github.com/smtgpm/morphe-patches-smtgpm/releases/tag/v1.1.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**8 patches** across **1 app**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Belote.com**](PATCHES.md#belotecom-comgameduellmobilebelote) | 8 | `2.12.9` | [`com.gameduell.mobile.belote`](https://play.google.com/store/apps/details?id=com.gameduell.mobile.belote) |
<!-- PATCHES_END -->

## 🛠️ Building locally

- Run `./gradlew buildAndroid`. The bundle is written to `patches/build/libs/patches-*.mpp`.
- Patch with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other bundle:

  ```bash
  java -jar morphe-desktop.jar patch -p patches/build/libs/patches-<version>.mpp belote-2.12.9.apkm
  ```

- The native hook code lives in [native/belote](native/belote). After changing it, run
  `python3 native/belote/build.py` (needs `clang-18` and `ld.lld`) to regenerate
  `patches/src/main/kotlin/app/smtgpm/patches/belote/shared/NativeData.kt`, and commit both.

How the patches work, the addresses they use and how each one was tested are described in
[docs/belote.md](docs/belote.md).

## 🧑‍💻 Releases

Work happens on `dev` with [semantic commits](https://www.conventionalcommits.org/)
(`feat:`, `fix:`, `chore:`). `feat:` and `fix:` commits publish a pre-release from `dev`
(enable pre-releases for this source in Morphe Manager), and merging `dev` into `main`
publishes a stable release. Releases are created by [release.yml](.github/workflows/release.yml) only.

## ⚠️ Disclaimer

This project is not affiliated with GameDuell or the Morphe project. Patching changes the
game client and may break the game's terms of service. Use it at your own risk.

## 📜 License

smtgpm patches are licensed under the [GNU General Public License v3.0](LICENSE).
