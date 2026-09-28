# Offline Games 3.14.1: native patches and mounted installations

## Why 1.4.1 could patch successfully without changing gameplay

The supplied `Offline_Games_3.14.1.apks` contains a base APK and an ARMv7
configuration split, **both containing `libil2cpp.so`**:

- `base.apk`: SHA-256 `cb47f0498be4c13765e6364ed99fae6c889339d07ddc5a37b1790228cb0c272f`
  (the old 15-to-1 edit).
- `split_config.armeabi_v7a.apk`: SHA-256
  `dd619f322538d339137e30a8c53e913ddecb59e78296ba86a79f058853ba0512` (stock).

This explains the original hash-error report without assuming the user selected
the wrong file. The earlier inspection examined only the split and missed the
duplicate in the base. The pristine `offline_games.xapk` contains its library
only in `config.armeabi_v7a.apk`.

A real Morphe Desktop 1.17.0 / Patcher 1.14.1 run applying all three 1.4.1
patches produced a rebuilt APK whose library was SHA-256
`deca5aa0e761174b9418df3e4badf0731bd5712e23323261f6d0f26ce3cf0e8c`.
The edits did survive rebuilding. Earlier Python-only checks had not established this.

The app manifest has `android:extractNativeLibs=true`. Its DEX method
`UnityPlayer.getUnityNativeLibraryPath(Context)` returns
`ApplicationInfo.nativeLibraryDir`. `UnityPlayer.loadNative(String)` loads
`directory/libmain.so`, then calls `NativeLoader.load(directory)`.
The native loader loads `libunity.so` and `libil2cpp.so` from that directory.

[Manager 1.32.0 RootInstaller](https://github.com/MorpheApp/morphe-manager/blob/v1.32.0/app/src/main/java/app/morphe/manager/domain/installer/RootInstaller.kt)
bind-mounts the patched APK over `ApplicationInfo.sourceDir`. It does not replace
the extracted libraries in `nativeLibraryDir`. Patching the APK therefore does
not establish which native code a mounted game actually loads. This is a source-
verified explanation for the reported unchanged countdown; the user's process
maps have not been captured.

## New loading path

Every Offline Games patch depends on one unnamed bytecode patch. It replaces
only `getUnityNativeLibraryPath(Context)` with the extension's path resolver.
The resolver reads the currently mounted `sourceDir` ZIP directly, stages
`libmain.so`, `libunity.so`, and `libil2cpp.so` together in an app-private directory,
and returns that directory to the existing Unity loader. It uses no root commands.

A patch-time finalizer embeds SHA-256 values of all three final native files.
The manifest hash names the staging directory, so remounting a different patched
APK cannot reuse stale libraries. Each cached file is content-checked; a damaged
cache is repaired. Missing or mismatched payloads fail explicitly rather than
silently loading stock native code. First launch needs about 88 MB of additional
private storage. Older content-addressed directories remain until app data is
cleared, avoiding deleting files that may still be mapped.

## Correct method identities

IL2CPP v31 stores methods grouped by type, but a codegen module's pointer array
is indexed by **method token RID minus one**, not by flattened type order. The
earlier analysis used the latter and consequently assigned wrong names to real
function addresses. The corrected mapping validates declaring-type indices,
method tokens and module counts:

| Address | Verified function |
|---|---|
| `0x15B6CF4` | `HouseAdPopupView.Open()` |
| `0x15B767C` | `HouseAdPopupView.UpdateCounter()` |
| `0x15B7750` | `HouseAdPopupView.ClosePressed()` |
| `0x15B77AC` | `HouseAdPopupView.OpenStorePage()` |
| `0x15B78E8` | `<CountDownCo>d__19.MoveNext()` |
| `0x15B7AA4` | `<CountDownCo>d__19.IEnumerator.Reset()` (old, wrong redirect target) |
| `0x17EFA6C` | `<ShowRewardedAd>g__showHouseAd` (the old duration edit was in this path) |
| `0x17EFD94` | `<ShowRewardedAd>b__6` (completion callback, not an ad request) |
| `0x12A22F8` | `ApplovinRewardedAd.LoadMaxSdkAd` |

`HouseAdPopupView` fields include `secondsTextWrapper`, `secondsText`,
`closeButton`, `counter`, and `callback`. `Open()` calls `GameObject.SetActive`
on the wrapper with `counter > 0` and on the close button with `counter == 0`.
The callback before `Open()` **writes the duration to the counter** at `+0x4C`;
it is not an unmodifiable prefab constant. The coroutine waits using
`UnityEngine.WaitForSeconds`, decrements the counter, and finally activates the
button. `ClosePressed()` invokes the stored callback and closes the popup; it
does not test the counter again.

The revised close patch explicitly activates the close button in `Open()`, hides
the countdown wrapper, and initializes the counter to zero. The normal close /
reward callback remains intact. The real `OpenStorePage()` calls
`JungleFrogApp.GetPlayStoreURL` followed by `ApplicationUtil.OpenURL`; it is now
the target of the no-click patch. The in-house-only patch routes the shared
rewarded decision to the existing house-ad closure after callback setup and
disables only the rewarded adapter's load function.

Known edits from 1.2.x–1.4.1 are normalized for whole-library SHA-256 verification
and then restored where obsolete. Unknown changes outside supported edits are
rejected. This accepts known prior outputs without trusting arbitrary libraries
that happen to match a few instruction windows.

## Device verification

Update the source, select the desired Offline Games patches in Expert mode,
repatch the complete APKS/XAPK, then **replace the mounted APK and force-stop /
restart the game**. Updating a source alone does not replace an existing mount.

With ADB, after launch:

```sh
adb logcat -d -s PatchLabOfflineGames:I
adb shell su -c 'pid=$(pidof com.JindoBlu.OfflineGames); cat /proc/$pid/maps | grep libil2cpp'
```

The log should say `Using verified Unity libraries from mounted APK`, and maps
should point under `app_patchlab-offlinegames-native/<manifest hash>/libil2cpp.so`,
not the installed app's `lib/arm/libil2cpp.so`. If the log is absent, send the
patch report and exported patched APK; another mount or an old process may be
active. No app-data wipe is required for the new cache.

Local checks cover actual APK rebuilding, loader cache/mount replacement,
per-file integrity, and isolated ARM control-flow execution with engine calls
stubbed. Full Unity UI, Android linker, and reward behavior still require a
device run; they must not be described as device-tested without that evidence.

## Validation record (2026-09-27)

Built `v1.4.2-dev.1` with CI, including four passing loader tests: mounted APK
replacement, damaged-cache repair, incorrect payload rejection, and rejection
of a stock APK without a patch manifest. Applied with Morphe Desktop 1.17.0 /
Patcher 1.14.1 to the supplied APKS, to a real rebuilt 1.4.1 output, and again to
the new output. All three runs produced library SHA-256
`1262828c2d1a93db14317666039751ac6a3c37bce00f1863e724197c450ef79b`.

The output verifier checks the final ZIP payloads, manifest hashes, changed DEX
resolver and extension definitions. Unicorn executes the actual patched ARM
blocks: opening with counters 0/1/3/15/60 always activates the button and hides
the counter; initialization writes zero; the normal coroutine completes; the
real store handler and rewarded download adapter return immediately; and the
rewarded branch enters the existing house-ad path. Unity calls are stubbed.

Selecting **only Instant in-house ad close** on the pristine XAPK also rebuilt
successfully. Its library hash is
`145d83bb19545b75b0d3c24dde3a5163d7c43885bab73c7a732ff31db16bea0b`;
the unselected store handler and rewarded branch remain stock. Checks are about
patch behavior, not ZIP timestamps or signing identities.

Reproduce the all-selected check using a built bundle and the original inputs:

```sh
java -Xmx2g -jar morphe-desktop-1.17.0-all.jar patch Offline_Games_3.14.1.apks \
  -p patches.mpp --exclusive -e 'In-house ad only' \
  -e 'Instant in-house ad close' -e 'In-house ad not clickable' \
  --unsigned -t work -o patched.apk -r result.json
python scripts/verify_offlinegames.py Offline_Games_3.14.1.apks patched.apk
```

Unsigned output is for local inspection only. Let Manager use its configured
signing key for installation/mounting.
