# Adebisi Patches

Patches for use with Morphe.

## 🚀 How to use these patches

Click here to add them to Morphe:
https://morphe.software/add-source?github=ComoEstaisAmigos/morphe-patches

Use the latest Morphe Manager or Desktop. What to feed it is in the table: a bundle with the
OBB when that column says required.

| Title                               | Package                      | OBB      | ABI                      | Expected input            |
| ----------------------------------- | ---------------------------- | -------- | ------------------------ | ------------------------- |
| Contract Killer: Zombies (NR)       | `com.glu.android.zombsniper` | required | `armeabi`, `armeabi-v7a` (⚠️) | `.xapk`, `.apks`, `.apkm` |
| Contract Killer: Zombies 2: Origins | `com.glu.ckzombies2`         | required | `armeabi-v7a` (⚠️) | `.xapk`, `.apks`, `.apkm` |

>⚠️: 32-bit only. Does not install on 64-bit-only devices.

When OBB is required, the file must hold the APK and the OBB together. An APK alone is not
enough. Package, version, and signature are read from that APK. Patches that edit native code
then check the libraries in it by SHA-256 and refuse a repack or an already patched build.

Required OBB doesn't mean you need to put the OBB file manually. If you provide the correct file to Morphe, it will give you a single patched APK to install.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/ComoEstaisAmigos/morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;18 patches total
<details open>
<summary>📦 CK Zombies&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>
<br>

**🎯 Supported versions:**

| 3.1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| Disable explosion shake | Stops the player fov shaking when something explodes. |  |
| Disable friendly fire | Makes civilians immune to the player's shots and explosions. |  |
| Hide Daily Deal popup | Hides the annoying Daily Deal popup that shows at every launch. The deal is still in the store. |  |
| Modern Android compatibility | Fixes the crash at launch on current Android and targets API 25 so that Android 14 and later install the game normally. |  |
| Play intro once | Plays the intro video on the first launch after installing, and skips it after that. |  |
| Remove unused permissions | Removes permissions the game no longer needs, such as phone and accounts, along with the dead services that needed them. |  |
| Render menus at 720p | Makes the menus, text and pictures full size on screens above 720p, where they are otherwise small. Menus are drawn at 720p and stretched to the screen, so they look slightly blurry. The 3D gameplay keeps the screen's own resolution and stays sharp. |  |
| Show hidden weapons | Shows the two hidden weapons, AA-2012 and Dual MP-643, in the store. |  |
| Smooth sound | Removes the stutter while firing, caused by the game building a new audio player for every sound. |  |
| Stop requests to dead servers | Removes the 30 second wait on the loading screen and the daily offline message, and stops the game from contacting Tapjoy, OpenFeint and Glu's dead servers. |  |
| Unlimited ammo | Ammo never decreases, and reloading still works. |  |
| Unlimited currency | A fresh install starts with 999,999,999 Glu credits and 999,999,999 Cash. If you install the patched app as an update, your current balance stays as it is. |  |

</details>

<details open>
<summary>📦 CKZ Origins&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| Disable telemetry | Turns off Flurry, Tune, Tapjoy, PlayHaven, Chartboost, Glu wallet, NTP, and the S3 content check. |  |
| Modern Android compatibility | Fixes the crash at launch on current Android and targets API 25 so that Android 14 and later install the game normally. |  |
| Play intro once | Plays the intro video on the first launch after installing, and skips it after that. |  |
| Remove unused permissions | Removes permissions the game no longer needs, such as phone and accounts, along with the dead services that needed them. |  |
| Unlimited ammo | Ammo never decreases, and reloading still works. |  |
| Unlimited currency | A fresh install starts with 999,999,999 Glu credits and 999,999,999 Cash. If you install the patched app as an update, your current balance stays as it is. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

```bash
./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`. Apply it with  
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other bundle.

## ⚖️ Legal

This repository holds patches and documentation. It contains no app assets and no app
binaries. Patched APKs are not distributed here.

Not affiliated with, endorsed by, or connected to Glu Mobile, EA, or the Morphe project.

## 📜 License

[GNU General Public License v3.0](LICENSE)
