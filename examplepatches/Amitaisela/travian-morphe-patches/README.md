# Travian: Legends notifier for Morphe

Patches for the **Travian: Legends** Android app that notify you about what's happening in your game, even when the app is closed:

- **Build and troop training finished**, with the building or unit, level and village.
- **Incoming attacks and raids**, with who is attacking, where from and when they land, plus a second warning about a minute before they arrive, and a message if the attacker calls the attack off.
- **Warehouse or granary almost full**, when a village's storage will be full within about 30 minutes at its current production.
- **Your hero**: a new adventure is available, the hero is back home, or it died or is low on health.
- **Reinforcements and your own troops arriving**, with where they came from and how many.
- **Tap a notification to open the game.**
- **A "Travian Tools" app** (its own icon, the game's icon with a bell) where you switch each type of notification on or off, see how many of each you got in the last 24 hours, check how the background checks are doing, see what is building and training in each village with the time left, and look through your recent notifications. More tools are planned.

It uses the session you are already logged in with in the game, so **no password is ever entered or stored by the patch**, and it works the same whichever way you log in. There is no permanent notification icon: checks run quietly in the background (about every 5 minutes, and again right when something is due), and you only see a notification when something happened. On first launch it asks once for notification permission and for a battery-optimization exemption so Android doesn't stop the background checks.

## How to install

1. Install **Morphe Manager** and add this patch source: <https://morphe.software/add-source?github=Amitaisela/travian-morphe-patches>
2. Get the Travian: Legends APK bundle (see below).
3. In Morphe, tap **Travian: Legends**, choose **"I already have an APK"**, pick the bundle file, then patch and install.
4. Open the game, log in as usual, and allow the notification and battery prompts.

> [!NOTE]
> Android will not install the patched app over the Play Store version (different signing key), so uninstall the Play Store version first. Your game account lives on Travian's servers, so nothing is lost. A patched app doesn't update from the Play Store: when Travian releases a new version, get the new bundle and patch again. Morphe shows an **Update** badge when a new patch release is out.

### Getting the Travian APK

The game's APK isn't included in this repository (it is Travian's app, not something to redistribute), and Travian isn't on APKMirror, so Morphe's "help me find an APK" ends in a web search. Two ways to get the file:

- **Download a bundle (easiest).** Travian ships as a *split* app, so download the **XAPK** (bundle) of the latest version, not a single APK, from [APKPure](https://apkpure.com/travian-legends/com.traviangames.travianlegendsmobile) or [APKCombo](https://apkcombo.com/travian-legends/com.traviangames.travianlegendsmobile/). These are third-party sites, so use your own judgement about trusting them.
- **Export it from your own phone.** Install Travian from the Play Store, then export the installed app as a bundle (`.apkm`, `.apks` or `.xapk`) with an app-backup/export tool, or over USB with `adb`: run `adb shell pm path com.traviangames.travianlegendsmobile`, `adb pull` every path it lists (the base APK and all splits), and zip them together as a `.apkm`. This gives you exactly the version on your phone.

Pick the resulting file in Morphe with **"I already have an APK"**.

**Supported versions:** 4.0.0, 4.0.1 and 4.0.2 are tested against; other versions are allowed as experimental, but the game refuses to run versions older than the current one. Tested on one Xiaomi phone. Patched code is plain Java, so it should run wherever the game does (Android 8.1+), but some brands stop background apps more aggressively than others.

## How it works

- **No separate login.** The game saves its own login on your phone. The patch runs inside the game's process and reads that saved session, so it works with whatever login method you use, and it never handles or stores your password.
- **Light background checks.** It asks Travian's servers the same questions the app itself asks. A normal check is a single request; a full sign-in only repeats about every 2 hours. It schedules a check for just after each build or training is due, so completions are reported within seconds, plus a regular check every 5 minutes to notice things started elsewhere.
- **Quiet.** No permanent notification icon. You only see a notification when something happened.

## Known limitations

- Incoming attacks and arrivals are noticed on the regular 5-minute check, so the first alert can come up to about 5 minutes after the enemy sends the army (the "about a minute left" reminder is scheduled precisely).
- Android decides when background work runs. Some phone brands (Xiaomi, Huawei, Samsung and others) stop background apps more aggressively than stock Android. It has been tested on **one Xiaomi phone**; results elsewhere may differ.
- Troop training notifications say "N units" rather than naming the unit.
- Accounts that log in with Google are expected to work (the game saves the same kind of session) but this has **not been tested yet**.
- The Travian APK has to be obtained separately (see above), and a patched app must be re-patched when the game updates.

> [!IMPORTANT]
> This project is not affiliated with or endorsed by Travian Games. The patch only *reads* your own game data using the same requests the app makes, and it never performs actions in the game. Whether third-party tools are acceptable is up to the game's rules, so check them yourself.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.12.1](https://github.com/Amitaisela/travian-morphe-patches/releases/tag/v1.12.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Travian: Legends&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 4.0.0 | 4.0.1 | 4.0.2 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Build/troop queue notifications](#build-troop-queue-notifications) | Notifies you when a building upgrade or troop training queue finishes, with the building/unit name, level, and village, and warns you about incoming attacks and raids (who, from where, and when they arrive) with a second warning about a minute before they land, tells you when an attack was called off, warns you when a warehouse or granary is about to fill up, tells you when your hero has a new adventure, is back home, died or is low on health, and tells you when reinforcements or your own returning troops arrive. Tapping a notification opens the game, and a second "Travian Tools" icon opens a home screen where you switch each type of notification on or off, see what is building and training, and see your recent ones. Uses the session you're already logged in with in the game — no separate login, no password ever handled by this patch. Checks run quietly in the background: one is scheduled for just after each build/training is due to finish, plus a regular check every 5 minutes (Android may delay background work slightly). Nothing is shown unless something actually finished. The first time you open the app it asks once for notification permission and to exempt the app from battery optimization, so the background checks aren't killed by the system. |  |
| [Travian notifier manifest entry](#travian-notifier-manifest-entry) | Adds the permission needed to ask for a battery optimization exemption, and the Travian Tools screens. |  |

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
