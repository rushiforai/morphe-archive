# Getting the YouTube VR APK

The patches need a copy of the app. Meta has no public APK feed for Quest apps, so this has to
come from your own headset or from a downgrade tool — and there is a trap that sends most searches
to the wrong app.

## First: there are two different "YouTube VR" apps

| package | what it is | where you find it |
|---|---|---|
| `com.google.android.apps.youtube.vr` | the old **Daydream / Gear VR** build | on APKPure, e.g. [1.10.63](https://apkpure.com/youtube-vr/com.google.android.apps.youtube.vr) — and the [Gear VR Vault](https://vault.gearvr.net/app/youtube-vr) page itself warns *"If you have a Quest, don't use this version"* |
| **`com.google.android.apps.youtube.vr.oculus`** | the **Quest** app — the one these patches target | [Meta Quest Store](https://www.meta.com/experiences/youtube/2002317119880945). **Not on APKPure or APKMirror** |

So "YouTube VR APK" searches land on the Daydream build, which is not what the patches match.
Check the package name before anything else.

## Route A — extract from your own headset (recommended)

### 1. Morphe Manager's "Use installed app" (easiest, if Manager is on the headset)

If YouTube VR is already installed from the store, Morphe Manager needs no extraction step at
all: at the APK-selection step of the patch flow it offers **Use installed app**, which takes
the installed APK itself — splits included — as the patching source (confirmed in the Manager
source: `LocalApkSources.kt` reads the app's `sourceDir`/`splitSourceDirs`). With
**Settings → Storage management → Keep original APKs** enabled, that copy is kept afterwards
and can be exported or shared from the **Original APKs** list — that is your backup.

Two caveats:

- "Use installed app" patches whatever version the store installed — which is exactly the trap
  the [version rule](#the-version-rule-this-is-the-one-that-bites) below describes. A just-updated
  headset may hold a version the bundle does not list yet.
- This gets you the *current* build only. For an older one, see Route B.

### 2. On-device APK backup tool

If you use an on-device utility such as **Quest Games Optimizer (QGO)**, you can back up the
installed YouTube VR APK directly to the headset's storage. This requires no PC or USB cable, making
it the easiest route — especially if you are patching directly on the Quest using Morphe Manager.

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
APK; if `pm path` prints several paths (a base plus config splits), pull all of them — the patcher
needs one APK.

## Route B — a specific version, via a downgrade tool

The store only serves the *current* build, and these patches are pinned to one version. To get an
older one, [DownQuest](https://github.com/ptrpaws/DownQuest) is a browser extension that
downloads and downgrades Quest/Rift/Go apps through your own Meta session — a third-party tool that
authenticates as you, so treat it accordingly.

## The version rule (this is the one that bites)

`patches/src/main/kotlin/app/ytvr/patches/shared/Constants.kt` declares the supported version
(`AppTarget`). A build of a different version does **not** fail — the patcher **skips** the patches,
exits 0, and produces an app with none of the fixes. So:

- Pull a build of the **supported version** (DownQuest can fetch older ones), or
- wait for the fingerprints to be re-derived for the version you have — see
  [FINGERPRINTS.md](FINGERPRINTS.md), which records what has to be re-anchored.

To check a build before installing it, apply the bundle and read the result:

```bash
java -jar morphe-desktop-all.jar patch --patches patches-<version>.mpp \
  --result-file out.json -o out.apk youtube-vr.apk
# look for "Applied: Extension", "Applied: Hide ads", … and no "FAILED:"
```

`scripts/patch-and-install.ps1` does this for you: it asserts that the expected patches were
*applied* (`-RequirePatches`) and refuses to install a build where they were skipped.

Note that the patched app is installed as a **clone**, with its own package name: a re-signed APK
cannot update the store app, and Horizon OS asks for the tampered app to be removed if you try.

Patch your own copy. This repository does not ship or mirror the APK, and a third-party upload to
a mirror site would just be removed — their submit forms are for developers' own apps.
