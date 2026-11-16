<div align="center">

<img src="patches-bundle.png" alt="Jo's Patches" width="128">

# Jo's Patches

Patches for Android apps, for use with [Morphe](https://morphe.software).

[![License](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](LICENSE)
[![Release](https://img.shields.io/github/v/release/Jo-Patches/jo-patches?label=release&color=2ea44f)](https://github.com/Jo-Patches/jo-patches/releases/latest)
[![Patches](https://img.shields.io/badge/patches-5-8957e5)](patches-list.json)
[![Apps](https://img.shields.io/badge/apps-2-1f6feb)](patches-list.json)

**[Add this source to Morphe](https://morphe.software/add-source?github=Jo-Patches/jo-patches)**

</div>

---

## Apps

| App | Version | Version code | What the patches do |
|---|---|---|---|
| **Memorize Pi Digits** | 11.01 | 11010 | No home-screen ads, no cross-promotion, no license block |
| **Material Capsule** | 17.3 | 173 | Pro features, no Firebase Analytics, no license block |

Both apps are `arm64-v8a` only and are patched from the original XAPK.
All patches are enabled by default and only offered for the versions above.

## Patches

| Patch | App | Default | What it does |
|---|---|:---:|---|
| **Remove home screen ads** | Memorize Pi Digits | on | Returns early from all four AdMob banner entry points, so no banner view is created and no ad request is sent. |
| **Remove cross-promotion (Prime Button and game icons)** | Memorize Pi Digits | on | Disables the Prime Button and the six side-panel game icons inside the Unity scenes and scales them to zero. |
| **Disable Firebase Analytics tracking** | Material Capsule | on | Sets the documented Firebase switches in the manifest and removes the advertising-ID and Privacy-Sandbox permissions. No DEX change. |
| **Unlock Pro features** | Material Capsule | on | Makes the Pro entitlement report active, so gestures, widgets, card colours, the full mode player and app search work. |
| **Bypass PairIP license check** | both | on | Disables the Play PairIP check that would otherwise send a re-signed build back to the Play Store. Needed for a normal sideloaded install. |

## Install

1. Install [Morphe](https://morphe.software) (Manager or Desktop).
2. Add this source:
   [morphe.software/add-source?github=Jo-Patches/jo-patches](https://morphe.software/add-source?github=Jo-Patches/jo-patches)
3. Get the original XAPK of the supported version (see [Apps](#apps)).
4. Select the app in Morphe, keep the patches enabled and start patching.
5. Install **from Morphe's installer** (not from Chrome, Downloads or a file manager).

> The patched APK has a different signature than the Play Store build.
> Uninstall the original first (back up your data) and turn off automatic
> updates for that app.

### Play Protect

Play Protect can stay **enabled**. Morphe's installer stages the APK as a local
file, which is why the strict "App blocked to protect your device" dialog does
not appear on that route.

- Material Capsule declares an accessibility service and a notification
  listener. Google blocks such APKs automatically when they are opened from a
  browser, a messenger or a file manager - so do not install it that way.
- If the APK is already on the device: install it with `adb install -r -d`,
  or temporarily turn off "Scan apps with Play Protect" for that one install.

Full background and the exact Google rule: [`docs/Play-Protect.md`](docs/Play-Protect.md).

## Compatibility

| App | Package | Version | Version code | ABI |
|---|---|---|---|---|
| Memorize Pi Digits | `com.unknownprojectx.pi` | 11.01 | 11010 | arm64-v8a |
| Material Capsule | `com.pryshedko.mtisland` | 17.3 | 173 | arm64-v8a |

The declarations pin these versions and version codes. Morphe shows a warning
for other versions, and a patch aborts cleanly instead of producing a broken
build.

## How it works

- **DEX patches** use Morphe fingerprints on stable, non-obfuscated framework
  glue and replace method bodies with `return-void` (or `return true` for the
  installer check).
- **Unlock Pro features** works on the entitlement itself, not on the UI - the
  only place where the Pro state is produced. The fingerprints match the
  obfuscated classes structurally (collector interface, `"yes"` literal, AES
  decrypt helper, `SecretKey` factory), so a re-obfuscated build fails loudly
  instead of patching the wrong method.
- **Disable Firebase Analytics** only edits `AndroidManifest.xml`; no DEX entry
  is touched.
- **Remove cross-promotion** parses the `UnityFS` container, decompresses the
  LZ4 blocks, edits `m_IsActive` / `m_LocalScale` in the `SerializedFile` object
  table of the `level*` scenes and verifies the result with a full decompress
  round-trip. Object sizes stay unchanged, so all offsets remain valid.
- The bundle is self-contained: the LZ4 block codec is implemented in this
  project, no third-party compression library is shipped.

Deeper notes (German): [`docs/Technische-Doku.md`](docs/Technische-Doku.md),
[`docs/Material-Capsule.md`](docs/Material-Capsule.md).

## Build from source

```powershell
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.13.9-hotspot"

# release bundle (adds classes.dex) - always run last
.\gradlew.bat clean :patches:generatePatchesList "-Pversion=1.6.2"
.\gradlew.bat :patches:buildAndroid "-Pversion=1.6.2"
# result: patches/build/libs/patches-1.6.2.mpp
```

Integration tests against the original base APKs:

```powershell
.\gradlew.bat :patches:runBundleTest "-Pversion=1.6.2" `
    "-PapkFile=C:\path\to\com.unknownprojectx.pi.apk"
.\gradlew.bat :patches:runBundleTestMaterialCapsule "-Pversion=1.6.2"
```

The tests check the patched DEX entry points, the Pro entitlement, the
resulting manifest and every Unity scene target. With
`MORPHE_SCENE_REFERENCE=<data.unity3d>` the scene test also compares the
patched object bytes against a reference bundle.

## Releases

The current release is **1.6.2**. GitHub is the only active source; the GitLab
repository is **archived** and no longer updated:

| | Download |
|---|---|
| GitHub (active) | [releases/download/v1.6.2/patches-1.6.2.mpp](https://github.com/Jo-Patches/jo-patches/releases/download/v1.6.2/patches-1.6.2.mpp) |
| GitLab (archived, v1.6.2 only) | [gitlab.com/JoPatches/jo-patches](https://gitlab.com/JoPatches/jo-patches/-/releases/v1.6.2/downloads/patches-1.6.2.mpp) |

`patches-bundle.json` points at the release asset, `patches-list.json` is
generated from the patch classes. Both are regenerated on every release - do
not edit them by hand. Commit messages follow
[Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`,
`chore:`).

## Legal notice

This project is not affiliated with the developers of Memorize Pi Digits or
Material Capsule, nor with the Morphe project.

The patches modify apps you must own a license for. The **Bypass PairIP license
check** patch circumvents a technical protection measure, and **Unlock Pro
features** bypasses the paid Pro entitlement of Material Capsule. Distributing
these patches may be unlawful in some jurisdictions (for example § 95a UrhG in
Germany) and may violate the app store's terms. Both are published for
interoperability and personal use; you are responsible for how you use them.

Morphe and its maintainers do not review or endorse third-party patch sources.

## License

[GNU General Public License v3.0](LICENSE), with the additional conditions in
[NOTICE](NOTICE).
