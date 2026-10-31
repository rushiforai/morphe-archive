# Flitsmeister Android Auto installation-source regression

The missing Android Auto entry after the 30 October 2026 update is explained
by the installation path. The user used Shizuku in Morphe Manager. A read-only
`InstallSourceInfo` probe on the phone reports `com.android.shell` as both the
initiating and installing package. The inspected host rejects that source for
Flitsmeister's Car App Library category. The Insider driving-crash repair remains
necessary and does not change the Android Auto declarations or callbacks.

## Released-artifact comparison

The supplied `flitsmeister.apks` has SHA-256
`da9828ce46337d62439799b886dc9219ed44858b8dfafcf2bcb0d01efba10ff6`.
REA inventory evidence `ev_2ec90ed50763461d54784e7ddc8c275b94d5336fc9c1027d9bb8253eb42ac9c0`
identifies its publisher base and three splits.

The actual GitHub bundles were downloaded and matched their published digests:

| Release | Published 30 October, UTC | Bundle SHA-256 |
| --- | --- | --- |
| v1.23.0 | 13:06:06 | `f96532557a23400f6fd66cf53208d7c7620b34dd078b4908e1816904b47c9a93` |
| v1.23.1, Insider crash fix | 15:58:18 | `6697d57386d748ee6a83edbfd29230140a4a04652919188ed15403f8d3ade35f` |

All 23 Flitsmeister patch class payloads match byte-for-byte except
`TrackingPatchKt.class`. The catalogue patch arrays are identical, including
defaults and selection metadata. Both bundles successfully patch the supplied
APKS with Morphe Desktop 1.19.1, all six controls, FULL mode and validation.

The emitted APKs have 4,928 identical uncompressed ZIP entries; only
`classes2.dex` differs. Their manifests, resources, native libraries and other
DEX files match byte-for-byte. Independent apktool disassembly compares 73,856
classes: only `Insider.enableInAppMessages()` and `disableInAppMessages()` change
behavior, becoming safe `return-void` methods. Two ConstraintLayout string
instructions change between equivalent normal/jumbo encodings. Android Auto
callback implementations remain identical.

Emitted APK SHA-256 values:

- v1.23.0: `21f916f6daf8763c566ec311cdc85c51e0038259d9de227178ee6dd81e41877b`.
- v1.23.1: `a09f2d9d73f2f6c777bd1845475cffbc6ce64c4671ba4705046f288a8f29f232`.

## Host and installer findings

The captured Android Auto 17.9.664044-release base APK has SHA-256
`a024a3c478dd01a1aecdd5cfe9b038d86a60e8b9b930e52762a781cf6b300b05`.
REA evidence `ev_544ebdeb5e70ae9ee26a874377da7739e23185df3fb69aabf3ef0d6012504906`
traces its `jem.v` validator. On Android 11+, this selects
`InstallSourceInfo.getInitiatingPackageName()`. Only when that is
`com.google.android.packageinstaller` does it substitute the installing package.
Setting ADB's `-i` field alone does not establish this path.

This host classifies `androidx.car.app.CarAppService`, including its NAVIGATION
intent category, as `TEMPLATE`. Its Unknown sources fallback excludes TEMPLATE.
Consequently enabling developer mode and Unknown sources does not by itself
admit Flitsmeister. An emulator reproduces the missing launcher entry and
`CAR.VALIDATOR: Package DENIED; failed all other checks [nl.flitsmeister]` with
those settings enabled after Shell installation.

The phone has Morphe Manager 2.3.0, version code 39899478; captured APK SHA-256
`d59f7bc835294a05814232e2cfd8bf22775434763e9a1ac26c88836b0be27dde`.
Its ordinary non-root Shizuku installer explicitly uses `com.android.shell`.
The observed phone attribution matches that path. REA evidence
`ev_33924609a20a38df729b7587a6e7bd9ec6fc87273b393cddec722c57e47f5b6f`
confirms the installer identity implementation.

## Remediation and validation boundary

Keep Fix PairIP startup and Disable tracking enabled. Updating the patch source
alone does not reinstall the app or repair its installation attribution.

For normal use, choose **KingInstaller as the external installer in Morphe**:

The bilingual [Android Auto user guide](../site/en/guides/android-auto.md) includes [Shizuku-Next setup and selected alternatives](../site/en/guides/shizuku.md), and [KingInstaller releases](https://github.com/fcaronte/KingInstaller/releases).

1. Start Shizuku and authorize KingInstaller to use it.
2. Send the patched APK from Morphe to external KingInstaller.
3. Enable **Shizuku** in KingInstaller, choose **Install as king**, and confirm
   **Update** in Android’s genuine installation screen.

Keep the existing signing key and update without uninstalling. The user
confirmed that KingInstaller works on the physical phone. Independent testing
on the emulator used KingInstaller’s actual UI, with Shizuku enabled and Root
disabled, and produced `initiating=com.google.android.packageinstaller` and
`installing=com.android.vending` from a previously Shell-initiated installation.
A fresh Android Auto Customize launcher check then showed Flitsmeister as a
checked entry. The independent UI test and source transitions are retained in
`kinginstaller-working-runtime.json`; `king-launcher-after.png` records the
launcher result. A fresh phone source check after the user’s KingInstaller
update at 23:00:33 also records Google Package Installer/Play Store.

The inspected KingInstaller 2.4 APK has SHA-256
`0ba7333690dac333ad6cd98d5db06bfa1b87a665a3118034c2d90b2962b830df`.
Its `ShizukuUtils.installApk` grants the APK URI to Shell and the Google installer,
requests the Play Store installing package, and calls
`startInstallActivityAsShell` through Shizuku to open the real system installer
with Shell as privileged caller. REA evidence
`ev_e584e6c25f2e86fdd84e7e3d5511f545785af1e6a104cdd15f6574e44c1b396d`
and `ev_ab5320a1682b854eff014966b638562a5ac9e1c3f7c717380ce2fa7a341ec4c7`
identifies those shipped implementations. This matches the independently
confirmed privileged UI repair below. Morphe’s external-installer choice is therefore
materially different from its built-in System installer or Shizuku modes.

Morphe Manager 2.3.0’s **System installer** with **Install as Play Store** is not
a confirmed repair on the tested phone. After a completed full reinstall at
22:47:34 local time, both initiating and installing package were
`com.google.android.packageinstaller`; Android Auto still denied the app.
The user had enabled the toggle. This replaces the earlier working assumption
that the toggle alone would produce the required attribution.

The captured Google Package Installer APK has SHA-256
`257e7a2486e019d700c317d0d50da021ad8748ffdcdaab1d0292a502624fe354`.
REA evidence `ev_60a8f260764c00fcfe2276258818ccf55cbbe20228cebc853ab7dc119a09eeb8`
plus exact smali identifies the permission gate in `InstallStart.onCreate`.
An alternate `INSTALLER_PACKAGE_NAME` is removed unless the actual caller holds
`android.permission.INSTALL_PACKAGES`. Manager holds
`REQUEST_INSTALL_PACKAGES`, which is different. Android Shell holds the
privileged permission. The SDK 36.0 route on this phone uses this legacy
installer implementation; the presence of a newer implementation in the APK
alone does not establish which branch executes.

The remaining in-app option, **Shizuku + Install as Play Store**, was checked
with a dedicated-emulator probe of the same backend call. It constructed
`PackageInstaller(IPackageInstaller, "com.android.vending", null, 0)` under
shell UID 2000 and mirrored Manager’s full-install session parameters. The
session committed successfully, but InstallSourceInfo still reported
`initiating=com.android.shell` and `installing=com.android.vending`. This host
selects the Shell initiator and still denies admission. This differs from only
testing ADB’s `-i` option: the probe created the session through the same hidden
framework constructor used by Manager. It did not execute the actual Manager UI.
The captured result is `shizuku-play-constructor-result.json`, using phone APK
SHA-256 `54dfed66af21b55f4def080211ab7533bb8be13ea4bf27dc6c4a9503821d8441`.

A built-in Manager improvement could adopt this same authorized
Shizuku-launched system UI while retaining confirmation and readable URI grants.
That is a proposed implementation, not a built or published Manager change;
the existing external KingInstaller workflow already supplies this path.

### Developer fallback

The [ADB repair helper](../../scripts/repair_flitsmeister_android_auto.py) is
a developer fallback rather than the normal end-user workflow. It requires Python 3, `adb` and authorized USB debugging. From the repository root,
replace `YOUR_DEVICE_SERIAL` with the phone serial reported by `adb devices`.
First inspect the installation; this is read-only and is also the default mode:

```sh
python3 scripts/repair_flitsmeister_android_auto.py --serial YOUR_DEVICE_SERIAL --check
```

Then request the confirmed installation path:

```sh
python3 scripts/repair_flitsmeister_android_auto.py --serial YOUR_DEVICE_SERIAL --repair
```

The helper pulls the installed monolithic Flitsmeister APK and opens the real
Google installation confirmation through privileged Android Shell. Confirm
**Update** on the phone. It waits up to 180 seconds and verifies the expected
initiating/installing pair, unchanged APK SHA-256, app ID and first-install time.
It does not uninstall the app, edit the APK or modify Android Auto. Preserve the
existing signing key and update without uninstalling. Afterward check Android
Auto’s Customize launcher list: installation attribution alone does not prove
launcher visibility on another host.

On cancellation, timeout or failure, the staged `Flitsmeister-identical-update-*.apk` may remain in the phone's Downloads. This preserves a source that an open installer may still need. Close or cancel that installer first, then delete the named staged APK from Downloads before retrying if it is no longer needed. Successful verification removes the helper's staged file automatically.

This path was executed on the physical phone. At 22:49:45 local time the probe
reported `initiating=com.google.android.packageinstaller` and
`installing=com.android.vending`. The APK SHA-256 before and after remained
`54dfed66af21b55f4def080211ab7533bb8be13ea4bf27dc6c4a9503821d8441`.
After refreshing Android Auto, Flitsmeister appeared in the active Customize
launcher list above Hidden apps. This establishes physical-phone launcher
visibility with the crash-fixed APK; no Flitsmeister patch or host validation
changed during the repair.

A separate controlled emulator comparison confirmed the same effect using an
earlier captured phone APK, SHA-256
`7468e60e8b6fc297aa0513804519264b2107ce7fd3ffa49977b0e792d3f8bb89`.
The installed hash after the update matched the original capture. REA method
evidence `ev_d2c0e9063957f2e4cc1d1f5b9d688f4274defe447a64b38594cf19e317e46f18`
confirms that APK retains the crash-fixed `disableInAppMessages()` completion.
With Shell as initiating source it was absent and produced the validator denial.
After the genuine privileged system-installer flow, its initiating/installing
sources were Google Package Installer/Play Store and Flitsmeister appeared as
a checked launcher entry. Developer mode and Unknown sources stayed enabled
throughout.

The source comparison establishes patch behavior. The emulator and physical
phone observations establish the failed admission paths and restored launcher
visibility on the tested host. They do not establish a new car session,
a complete driving session, every Android Auto version, Android 10 behavior,
backend entitlements or exhaustive network coverage. The earlier phone/car map
acceptance remains bounded to that installation and setup.
