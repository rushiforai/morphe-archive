# Projectivy Launcher

Package `com.spocky.projengmenu`, supported target `4.73` (versionCode `98`), as both the
APKMirror APKM and the GitHub release APK.
Source: [`patches/src/main/kotlin/dev/hyzor/patches/projectivy/`](../../patches/src/main/kotlin/dev/hyzor/patches/projectivy/).

| Patch | Default | What it does |
|---|---|---|
| Unlock Premium | on | Starts the app in its registered state, so the premium purchase prompts and feature locks are gone. |

## Port notes

This is a port of the 4.71 "Unlock Premium" patch in
[Entree3k/Morning-Entree-Patches](https://github.com/Entree3k/Morning-Entree-Patches). The
4.73 build keeps the same design — one `StateFlow<Boolean>` created by `PTApplication` and
one writer that re-checks the licence — but the writer moved and the constructor seeds the
flow through Kotlin's `MutableStateFlow` factory:

| Role | 4.71 (upstream) | 4.73 |
|---|---|---|
| premium state | `PTApplication` field seeded in `<init>` | same, seeded through `os1.a(Boolean.TRUE)` |
| licence writer | static `a(PTApplication, boolean)` | instance `d(boolean)` |

4.73 exists as two separately compiled builds with the same identity:

| Source | Artifact | ABIs |
|---|---|---|
| APKMirror (Play bundle) | `base.apk` + `arm64-v8a`/`xhdpi` splits, versionCode `98` | one or two, depending on the variant |
| GitHub, [spocky/miproja1](https://github.com/spocky/miproja1/releases) | `ProjectivyLauncher-4.73-c98-xda-release.apk`, a single universal APK | `arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64` |

Both declare versionName `4.73` / versionCode `98` and carry the same code, but they do not
share R8 names: the APKM's premium flow is `Lze4;` (preference holder `Lcj3;`), the GitHub
build's is `Llf4;` (preference holder `Lmj3;`). The fingerprints therefore avoid obfuscated
class names and anchor on structure present in both builds: the `Boolean.TRUE` seed in
`PTApplication.<init>`, the `(Z)V` shape of the licence writer, its `0x2932e000` eight-day
window, `System.currentTimeMillis`, and the `x` premium-flow field (the field name is stable
even though its type is re-obfuscated per build).

Because `ApkFileType` is part of `Compatibility`, the bundle declares two targets for 4.73 —
one `APKM` and one `APK` — and every Projectivy patch is `compatibleWith` both.

Morphe merges an APKM's splits and patches `base.apk`'s `classes.dex`; all of the patched
code is in `base.apk`. With the GitHub APK there is nothing to merge.

## Install compatibility

The 4.73 release is published as three APKM variants: `arm64-v8a` only, `arm64-v8a +
armeabi-v7a`, and `armeabi-v7a` only. Patch the variant that matches the TV. The patched APK
contains only the native libraries of the bundle it was built from, so patching the
`arm64-v8a` bundle and installing it on a 32-bit TV (or the reverse) fails with
`INSTALL_FAILED_NO_MATCHING_ABIS`. The `arm64-v8a + armeabi-v7a` bundle is the safe choice
when the ABI is unknown.

The GitHub release avoids that whole class of mistake: it is one universal APK with all four
ABIs, so the same patched file installs on 64-bit and 32-bit TVs. It is a separate build of
4.73, which is why the bundle supports both it and the APKMirror APKM.

Both 4.73 builds ship `android:extractNativeLibs="false"` and keep their libraries
uncompressed in the APK. Morphe repackages the APK, and on Android 15/16 devices with
**16 KB memory pages** the repackaged file can be rejected with:

```text
INSTALL_FAILED_NO_MATCHING_ABIS: Failed to extract native libraries, res=-113
```

Every Projectivy patch therefore depends on an internal resource patch
([ExtractNativeLibsPatch.kt](../../patches/src/main/kotlin/dev/hyzor/patches/projectivy/install/ExtractNativeLibsPatch.kt))
that sets `android:extractNativeLibs="true"`. The installer then extracts the libraries to
the app's native library directory at install time, where the zip layout no longer matters.
It is harmless on 4 KB devices (the historical default) and adds about 1 MB of extracted
libraries.

## How the app decides you are premium

`PTApplication` creates one `MutableStateFlow<Boolean>` in its constructor and publishes it
through `asStateFlow()`. Every premium screen reads that wrapper; roughly thirty classes use
it directly, including the settings pages, display profiles, custom background, theme import
and parental control.

The flag is inverted from what the name suggests: **`true` means not registered.**
`pj3` (the Premium page) shows the register text and the purchase animation while it is
`true`, and `ToggleParentalControlActivity` sends the user to `PremiumActivity` when it is
`true` and an action is already in use. Setting it to `false` is the app's own "registered"
state.

After construction the only writer is `PTApplication.d(Z)V`:

```java
void d(boolean needsLock) {
    boolean locked = needsLock &&
        (lastStart <= 0 || System.currentTimeMillis() - lastStart > 8 days);
    premiumFlow.setValue(locked);
}
```

`d` is called with `!purchased` from the Play Billing collector, and with `true` from the
startup path. The timestamp is the app's `general_last_start_date_nexp` preference, so the
expression is an eight-day re-check window (`0x2932e000` ms = 691,200,000 ms). On a re-signed
build the purchase check always fails, so `d` would put the flow back to `true` shortly after
startup.

The patch therefore does two things:

1. the constructor's `Boolean.TRUE` seed becomes `Boolean.FALSE`;
2. `d(Z)V` starts with `return-void`, so nothing can flip the flow back.

There is no second copy of the decision — the mutable flow is written only by the constructor
and `d`, and every consumer reads the same wrapper.

`PTApplication.f()`, the native `PTUtils` signature check, is left alone. It is consulted on
startup only to choose a fallback device id for analytics; it does not gate premium.

Only client-side decisions change. Anything Projectivy's backend or Play Billing reports is
untouched.

## Verification

Static checks:

- `tools/verify_fingerprints.py` resolves both anchors against the stock APKM and the stock
  GitHub APK (it checks class/method names only, not the fingerprint filters).
- Morphe 2.1.1 applies the bundle with `--validate` to all three 4.73 APKM variants and to the
  GitHub universal APK: the premium patch changes 1 of 7,584 classes (`PTApplication`) in the
  APKMs and 1 of 7,596 in the GitHub APK, the class is stripped from its original DEX, and
  each output is signed and still declares `com.spocky.projengmenu` `4.73` (`98`).
- The manifest hook sets `android:extractNativeLibs="true"` in every output, and the native
  libraries of the input are preserved (`arm64-v8a`, `armeabi-v7a`, both, or all four for the
  GitHub APK).
- The patched DEX was disassembled:
  - `PTApplication.<init>` loads `Ljava/lang/Boolean;->FALSE` where the stock build loads
    `TRUE`;
  - `PTApplication.d(Z)V` is `return-void` at offset 0 (the old body is dead code).

Install check on the Android TV emulator (`sdk_google_atv64_x86_64`, Android 16 / API 36,
`x86_64,arm64-v8a`): the `arm64-v8a` and `arm64-v8a + armeabi-v7a` patched APKs install and
cold-start into onboarding with no `FATAL EXCEPTION` in `logcat`. `dumpsys package` reports
`extractNativeLibs=true` and `primaryCpuAbi=arm64-v8a`, and the three libraries are extracted
under `/data/app/…/lib/arm64/`, which is the path the 16 KB fix relies on.

The patched GitHub universal APK also installs and cold-starts on the same image
(`primaryCpuAbi=x86_64`, all four ABIs retained).

Installing the `armeabi-v7a`-only output on this arm64 device fails with the issue's exact
message — `INSTALL_FAILED_NO_MATCHING_ABIS: … Failed to extract native libraries, res=-113` —
confirming the ABI/variant requirement above. That is a wrong-bundle case, not something the
manifest hook can fix.

Premium behavior was checked on the same TV image with the build before the install hook was
added; the hook only edits `AndroidManifest.xml` and does not touch the DEX.

The premium gate was checked against stock with the app's own gated entry point,
`ImportThemeActivity`. Its `onCreate` calls `mo2386t()`, which starts `PremiumActivity`
immediately when the premium flow is `true`:

```text
adb shell am start -a android.intent.action.VIEW \
  -d file:///sdcard/Download/ptest.pltheme -t application/octet-stream \
  -n com.spocky.projengmenu/.ui.launcherActivities.ImportThemeActivity
```

| Build | Result |
|---|---|
| stock 4.73 APKM | `PremiumActivity`, "Premium only!" / Activate license |
| 4.73 APKM + Unlock Premium | import activity runs and finishes; `PremiumActivity` is never started |
| stock 4.73 GitHub APK | `PremiumActivity` (re-checked on a fresh install) |
| 4.73 GitHub APK + Unlock Premium | import activity runs and finishes; `PremiumActivity` is never started |

The patched runs were repeated after a 15-second cold start (APKM) and a 13-second one
(GitHub APK), so the startup re-check and the billing collector had run; neither redirected,
which is the `return-void` hook holding.

Also exercised on the patched APKM build: Settings → Projectivy settings opens, and the
premium-only Display Profiles editor loads (Profile #1, colour bars, per-profile options).

Not exercised: a real theme/background import (the probe file was deliberately invalid, so
the import path itself errored after the gate), an actual purchase, and the 8-day re-check
window (only reachable by moving the clock).

