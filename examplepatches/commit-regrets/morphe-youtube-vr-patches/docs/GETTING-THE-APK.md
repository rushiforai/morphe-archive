# Getting the YouTube VR APK

The patches need a copy of the app. Meta has no public APK feed for Quest apps, so it must come
from your own headset or a downgrade tool — and a trap sends most searches to the wrong app.

## First: there are two different "YouTube VR" apps

| package | what it is | where you find it |
|---|---|---|
| `com.google.android.apps.youtube.vr` | the old **Daydream / Gear VR** build | on APKPure, e.g. [1.10.63](https://apkpure.com/youtube-vr/com.google.android.apps.youtube.vr) — and the [Gear VR Vault](https://vault.gearvr.net/app/youtube-vr) page itself warns *"If you have a Quest, don't use this version"* |
| **`com.google.android.apps.youtube.vr.oculus`** | the **Quest** app — the one these patches target | [Meta Quest Store](https://www.meta.com/experiences/youtube/2002317119880945). **Not on APKPure or APKMirror** |

"YouTube VR APK" searches therefore land on the Daydream build, which the patches do not match.
Check the package name before anything else.

## Route A — extract from your own headset (recommended)

### 1. Morphe Manager's "Use installed app" (easiest, if Manager is on the headset)

If YouTube VR is already installed from the store, Morphe Manager needs no extraction step: at
the APK-selection step it offers **Use installed app**, taking the installed APK — splits
included — as the patching source (confirmed in the Manager source: `LocalApkSources.kt` reads
the app's `sourceDir`/`splitSourceDirs`). With **Settings → Storage management → Keep original
APKs** enabled, that copy is kept afterwards and can be exported or shared from the
**Original APKs** list — that is your backup.

Two caveats:

- "Use installed app" patches whatever version the store installed — exactly the trap the
  [version rule](#the-version-rule-this-is-the-one-that-bites) below describes: a just-updated
  headset may hold a version the bundle does not list yet.
- This gets you the *current* build only. For an older build — or one your headset has not taken
  yet — see Route B.

### 2. On-device APK backup tool

An on-device utility such as **Quest Games Optimizer (QGO)** can back up the installed YouTube VR
APK straight to headset storage — no PC or USB cable, and the natural route when patching on the
Quest itself with Morphe Manager.

### 3. Pull via ADB

Install YouTube VR from the Quest Store (it is free), connect adb, then:

```bash
# 1. where is it?
adb shell pm path com.google.android.apps.youtube.vr.oculus
#    package:/data/app/~~.../com.google.android.apps.youtube.vr.oculus-.../base.apk

# 2. copy it out
adb pull /data/app/~~.../com.google.android.apps.youtube.vr.oculus-.../base.apk youtube-vr.apk
```

This is your own licensed copy and involves no third party. For this app the install is a single
APK; if `pm path` prints several paths (a base plus config splits), pull all of them — they are one
install, and patching the base alone leaves the split resources behind.

## Route B — a specific version, newer or older, via a downgrade tool

The store serves whatever build it has rolled out to your account, and these patches are pinned to
one version. For any other build — older, or newer than your headset has taken —
[DownQuest](https://github.com/ptrpaws/DownQuest) is a browser extension that lists and downloads
Quest/Rift/Go binaries through your own Meta session. It is a third-party tool that authenticates
as you, so treat it accordingly.

## The version rule (this is the one that bites)

`patches/src/main/kotlin/app/ytvr/patches/shared/Constants.kt` declares the supported version
(`AppTarget`). A build of a different version does **not** fail — the patcher **skips** the patches,
exits 0, and produces an app with none of the fixes. So:

- Pull a build of the **supported version** (DownQuest can fetch older *and* newer ones), or
- wait for the fingerprints to be re-derived for the version you have — see
  [FINGERPRINTS.md](FINGERPRINTS.md), which records what has to be re-anchored.

To check a build before installing it, apply the bundle and read the result:

```bash
java -jar morphe-desktop-<version>-all.jar patch --patches patches-<version>.mpp \
  --result-file out.json -o out.apk youtube-vr.apk
# look for "Applied: Extension", "Applied: Hide ads", … and no "FAILED:"
```

`scripts/patch-and-install.ps1` does this for you: it asserts that the expected patches were
*applied* (`-RequirePatches`) and refuses to install a build where they were skipped.

The patched app installs as a **clone**, with its own package name: a re-signed APK cannot update
the store app, and Horizon OS asks for the tampered app to be removed if you try.

Patch your own copy: this repository does not ship or mirror the APK, and a third-party mirror
upload would just be removed — their submit forms are for developers' own apps.
