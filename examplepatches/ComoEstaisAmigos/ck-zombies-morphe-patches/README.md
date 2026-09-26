# CK Zombies Patches

Patches for Glu's *Contract Killer: Zombies (NR)* v3.1.0 (`com.glu.android.zombsniper`, 2014), for
use with Morphe. They make the game run on current Android and fix what broke after Glu shut its
servers down.

## 🚀 How to use these patches

Click here to add them to Morphe:
https://morphe.software/add-source?github=ComoEstaisAmigos/ck-zombies-morphe-patches

You need three things:

- **Glu's original APK, v3.1.0.** It is the one signed by `CN=Glu Mobile`, certificate SHA-1
  `5f206863fdfd884ee45873b7688828880d221301`. Every patch but "Smooth sound" first checks both
  of its native libraries by hash, and fails if either is not Glu's, as in a modified repack or
  an already patched build.
- **The game's OBB**, `main.310.com.glu.android.zombsniper.obb` (460 MB), in
  `Android/obb/com.glu.android.zombsniper/`. The APK does not contain it and the game does not
  start without it.
- **Morphe Desktop 1.17.0 or Morphe Manager 1.32.0, or later.** Older versions fail on this
  game.

> [!WARNING]
> The game is 32-bit only (`armeabi`, `armeabi-v7a`). It cannot run on a device without 32-bit
> support. Morphe does not check this: the patched APK just fails to install.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/ComoEstaisAmigos/ck-zombies-morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 CK Zombies&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 3.1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| Modern Android compatibility | Fixes the crash at launch on current Android and targets API 25 so that Android 14 and later install the game normally. The game is 32-bit only, so the device must still run 32-bit apps. |  |
| Remove unused permissions | Removes permissions the game no longer needs, such as phone and accounts, along with the dead services that needed them. |  |
| Smooth sound | Removes the stutter while firing, caused by the game building a new audio player for every sound. |  |
| Stop requests to dead servers | Removes the 30 second wait on the loading screen and stops the game from contacting Tapjoy, OpenFeint and Glu's dead servers. |  |
| Unlimited currency | A fresh install starts with 999,999,999 Glu credits and 999,999,999 Cash. If you install the patched app as an update, your current balance stays as it is. |  |

</details>

<!-- PATCHES_END -->

## 📱 Android 4.4 and older

Morphe Manager, and Morphe Desktop by default, put the patched code in a second dex file, which
Android 4.4 and older do not load, so the game does not start there. For those versions, patch
with Morphe Desktop and `--bytecode-mode=FULL`.

## 🛠️ Building locally

```bash
./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`. Apply it with
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other bundle.

Morphe Desktop loads the patches from the class files in the bundle, Morphe Manager from the
`classes.dex` next to them, so a bundle without that dex works on a computer and fails on a phone.
`scripts/check_bundle.py` checks that the dex is there, intact, and holds every patch class:

```bash
python scripts/check_bundle.py patches/build/libs/patches-*.mpp
```

`scripts/verify_apk.py` checks a patched APK against Glu's original without touching a device,
whichever patches were chosen. It finds each patch applied wholly or not at all, and lists them
at the end. The native library differs only in the words the patches found list, plus the cave
and program headers of "Unlimited currency". The manifest targets API 25 and keeps Glu's
permissions and components, less exactly the ones "Remove unused permissions" takes out.
Every entry Glu stored uncompressed is still stored (the engine reads those through an
`AssetFileDescriptor`, and a deflated one kills the game long after launch). Each bytecode edit
is in the decoded smali, every OpenFeint class is an empty shell or exactly as Glu shipped it,
and the APK carries v1 and v2 signatures. An APK patched with `--striplibs` is checked for the
ABIs it still carries.

```bash
python scripts/verify_apk.py original.apk patched.apk
```

The native edits in `NativeEdits.kt` are generated, not written by hand. Each one carries the
word it expects to replace and the virtual address it lives at, so an edit lands correctly
whatever other patches already did to the file, and a library that does not hold the expected
word is refused.

## ⚖️ Legal

This repository holds patches and documentation. It contains no game assets and no game
binaries. Patched APKs are not distributed here.

Not affiliated with, endorsed by, or connected to Glu Mobile, EA, or the Morphe project.

## 📜 License

[GNU General Public License v3.0](LICENSE)
