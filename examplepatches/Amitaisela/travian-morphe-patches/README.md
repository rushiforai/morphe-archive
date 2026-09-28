# Travian Tools

**Travian Tools** is a [Morphe](https://morphe.software) patch for the **Travian: Legends** Android app. It sends you alerts about your game even when the app is closed, and adds a second app icon, **Travian Tools**, with extra screens and optional automation.

## Features

**Alerts**
- Build or troop training finished, with the building or unit, level and village.
- Incoming attacks and raids: who, from where and when they land, a second warning about a minute before, and a message if the attack is called off.
- Warehouse or granary almost full, and crop running negative.
- Hero: new adventure, back home, died or low on health.
- Reinforcements and your own troops arriving.
- Tap any alert to open the game.

**The Travian Tools app** (its own icon: the game's icon with a bell)
- **Village**: your buildings, what can be upgraded next and what is missing, a build queue, and what is building and training right now.
- **Alerts**: switch each kind of alert on or off.
- **Activity**: recent alerts and a log of every action.
- **Oases**: find oases near you and send your hero.
- **Silver**: auction alerts, a sell advisor and a deal finder.
- **Settings**: automation switches and quiet hours.
- **Home-screen widget**: next attack, next finish time, storage full time and last check.

**Automation (off until you turn it on)**
- Auto-build from your queue, troop escape to an empty oasis before an attack, and automatic silver bids.
- A master switch, a practice mode (logs what it would do, sends nothing), quiet hours that stop every automatic action, and a pause while an attack is about to land.
- It never spends gold.

## How to install

1. Install **Morphe Manager** and add this patch source: <https://morphe.software/add-source?github=Amitaisela/travian-morphe-patches>
2. Get the Travian: Legends APK bundle (see below).
3. In Morphe, tap **Travian: Legends**, choose **"I already have an APK"**, pick the bundle file, then patch and install. Keep both patches on.
4. Open the game, log in as usual, and allow the notification and battery prompts.

> [!NOTE]
> Android will not install the patched app over the Play Store version (different signing key), so uninstall the Play Store version first. Your account lives on Travian's servers, so nothing is lost. A patched app doesn't update from the Play Store: when Travian releases a new version, get the new bundle and patch again. Morphe shows an **Update** badge when a new patch release is out.

### Getting the Travian APK

The game's APK isn't included here (it is Travian's app), and Travian isn't on APKMirror. Two ways to get it:

- **Download a bundle.** Travian is a *split* app, so download the **XAPK** of the latest version, not a single APK, from [APKPure](https://apkpure.com/travian-legends/com.traviangames.travianlegendsmobile) or [APKCombo](https://apkcombo.com/travian-legends/com.traviangames.travianlegendsmobile/). These are third-party sites; use your own judgement.
- **Export it from your phone.** Install Travian from the Play Store, then export it as a bundle (`.apkm`, `.apks` or `.xapk`) with an app-export tool, or with `adb`: run `adb shell pm path com.traviangames.travianlegendsmobile`, `adb pull` every path it lists, and zip them together as a `.apkm`.

**Supported versions:** 4.0.0, 4.0.1 and 4.0.2. Other versions are allowed as experimental, but the game refuses to run versions older than the current one.

## How it works

- **No separate login.** The patch runs inside the game and reads the login the game already saved, so it never sees or stores your password.
- **Light background checks.** It asks Travian's servers the same questions the game asks, every 4 to 7 minutes, plus a check shortly after something is due. During quiet hours it only checks attacks and queues, every 20 to 40 minutes, and while the game itself is open it sends nothing. If the server says no or is busy, it waits longer instead of retrying.
- **Quiet.** You only get a notification when something happened; there is no permanent icon.

## Known limitations

- An incoming attack can take up to about 7 minutes to show (about 40 during quiet hours). The "about a minute left" warning is exact.
- Android decides when background work runs, and some brands (Xiaomi, Huawei, Samsung) stop background apps more aggressively. Tested on one Xiaomi phone.
- Google-login accounts should work but are not tested yet.

> [!IMPORTANT]
> This project is not affiliated with or endorsed by Travian Games. Automatic actions use the same requests as the game and are off by default. Whether third-party tools are allowed is up to the game's rules, so check them yourself.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.26.5](https://github.com/Amitaisela/travian-morphe-patches/releases/tag/v1.26.5)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Travian: Legends&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 4.0.0 | 4.0.1 | 4.0.2 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Travian Tools](#travian-tools) | Alerts for finished builds, incoming attacks, full storage and your hero, plus a Travian Tools app with a build queue, oasis finder, silver helper and home-screen widget. Uses your existing game login. |  |
| [Travian Tools setup](#travian-tools-setup) | Required by Travian Tools. Registers its screens and widget. Keep this on. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Travian Notifier Patches are licensed under the [GNU General Public License v3.0](LICENSE)
