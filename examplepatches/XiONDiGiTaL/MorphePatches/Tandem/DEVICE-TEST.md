# Device test — v1.1.0 clone build

First hardware run of the bundle. Short version: **the clone installs as its own app, but it does not
launch.** Tandem's licence gate opens Google Play and the process dies inside PairIP's native library.
The same happens to an unpatched copy of the same APK, so the blocker is the app's licensing, not the
rename.

## Setup

| | |
| :--- | :--- |
| Date | 2026-11-04 |
| Device | Samsung SM-S918U (Galaxy S23 Ultra), Android 17 (`CP2A.260605.016`, `S918USQU8GZIF`) |
| ABI / density | `arm64-v8a`; 560 dpi (xxhdpi bucket) |
| Bundle | `v1.1.0`, SHA-256 `0034159ee9a8ba74d7f540f2ca48f5c57cf4d805f68639da575d991e1f5f2af9` |
| Source file | APKMirror universal APKM, 6.38.0 (versionCode 11568) |
| Patches applied | all five: Bypass PairIP checks, Disable Adjust tracking, Force dark mode, Remove ads, Clone package |
| Install artefact | single merged APK, 268,880,129 B, signed `CN=Morphe` (cert SHA-256 `b4085a46…59faca`), `app.xiondigital.tandem` |

Morphe's own pipeline produced the artefact (PATCHING → REBUILDING → SIGNING all reported success), so
this is the file a user gets from the bundle, not a hand-built variant.

## Method

```bash
adb install -r out-clone-full.apk          # Success
adb shell am start -n app.xiondigital.tandem/net.tandem.ui.MainActivity
# observed for 9 s: process presence, resumed activity, logcat (main + crash buffers)
```

## Results

| Check | Result |
| :--- | :--- |
| Installs | **Pass** — `adb install` reports `Success`, package `app.xiondigital.tandem` is listed |
| Separate from the official app | **Pass** — listed alongside `net.tandem`; provider authorities, permission and task affinity followed the new id |
| Stays running | **Fail** — no process 9 s after start (repeatable, 2 runs) |
| Launch screen | **Fail** — splash only, then the Play Store licence paywall comes to the front |
| Reaches Tandem UI / sign-in | **Fail** — never gets past the licence gate |

## Evidence

The paywall is an activity the app process starts; the intent is Play's licence paywall for **the
original** package, not the clone:

```
wm_create_activity: [0,…,com.android.vending/com.google.android.finsky.activities.MainActivityPrivate,
                     android.intent.action.VIEW, NULL, http://play.google.com/…,
                     … startActivityAsUser:app.xiondigital.tandem:-1]
capturedLink=http://play.google.com/store/license/paywall?id=net.tandem
```

Immediately afterwards the process dies with a native fault inside PairIP:

```
am_crash: [2867,0,app.xiondigital.tandem,547896388,Native crash,Segmentation fault,unknown,0,0]
F DEBUG : signal 11 (SIGSEGV), code 2 (SEGV_ACCERR), fault addr 0xb400007d403de000 (read)
F DEBUG : Cmdline: app.xiondigital.tandem
F DEBUG : backtrace:
F DEBUG :       #00 pc 00000000000330c4 …/base.apk!libpairipcore.so (offset 0x533c000)
```

Both the paywall and the fault reference the licence machinery, which is PairIP's
`com.pairip.licensecheck` flow bound to Play's `IBackgroundLicensingService`.

## Control: the same APK without patches

To separate "the patches broke it" from "the app refuses this install", the reference APKM was
installed unmodified on the same device and launched the same way:

```bash
adb install-multiple -r apkm/base.apk apkm/split_config.arm64_v8a.apk apkm/split_config.xxhdpi.apk
adb shell am start -n net.tandem/net.tandem.ui.MainActivity
```

| Check | Patched clone | Unpatched `net.tandem` |
| :--- | :--- | :--- |
| Installs | Pass | Pass |
| Opens Play's licence paywall on launch | Yes | Yes (`MainActivityPrivate`) |
| Process still alive after 9 s | No | No |
| PairIP `libpairipcore.so` in the log | Yes (SIGSEGV) | Yes |

So the gate fires for a sideloaded build regardless of patching. 6.38.0 wants an installation it can
license, and neither a clone id nor the current bytecode stubs satisfy it.

## Why the existing stubs do not stop it

The bundle's **Bypass PairIP checks** replaces `LicenseClient.checkLicense`,
`startPaywallActivity`, `startErrorDialogActivity`, `scheduleAppShutdown` and
`LicenseActivity.onStart()` in the dex. Those replacements *are* in the installed build — Morphe writes
patched classes into a final `classes6.dex`, which contains exactly the edited classes (`LicenseClient`,
`LicenseActivity`, `SignatureCheck`, `TandemApp`, the ad SDK classes, …), and the night-mode injection is
present as expected.

The run still reaches the licence path, and the tombstone points into `libpairipcore.so`. That is the
signature of enforcement happening **below** the patched layer — PairIP's native core and the classes it
decrypts at startup — rather than in the bytecode the patch edits. Emptying the Java methods does not
remove the binding to Play's licensing service, and the native core terminates the process afterwards.

## Attempts to get past it

Two things were tried on the device. Neither helped, and neither is in the bundle.

**1. Unwrapping PairIP's application class.** `com.pairip.application.Application` is a thin
subclass of `net.tandem.TandemApp`, so the manifest's `android:name` was pointed at Tandem's own
class — removing `attachBaseContext`, and with it the signature and licence checks — while keeping
the dex stubs. The build installed and the installed manifest was confirmed to declare
`net.tandem.TandemApp`, yet the launch behaved identically: the same paywall, and

```
D nativeloader: Load …/split_config.arm64_v8a.apk!/lib/arm64-v8a/libpairipcore.so
                using class loader …/base.apk!classes2.dex
F DEBUG : signal 11 (SIGSEGV) … #00 pc 00000000000330c4 …!libpairipcore.so
```

The library is loaded from `classes2.dex` — `com.pairip.VMRunner` — which Tandem's own startup
reaches, so taking the wrapper out of the manifest does not take PairIP out of the process.

**2. Removing Play from the equation.** With `com.android.vending` disabled
(`pm disable-user --user 0 com.android.vending`), the licensing service cannot answer at all. The
process still loaded `libpairipcore.so` and still died at the same `0x330c4`. So the kill is PairIP's
native integrity check, not a reaction to Play saying "not licensed" — which is why stubbing the
bytecode that talks to Play cannot fix it.

Conclusion from both: the enforcement sits in `libpairipcore.so` (plus the classes it decrypts), and
no dex or manifest patch reaches it. The prototype change was reverted, so the shipped bundle is
byte-for-byte unchanged.

## Second pass — patching the native library

Source: `split_config.arm64_v8a.apk` → `lib/arm64-v8a/libpairipcore.so` (608,896 bytes, build id
`1e3b4544…`). All of its file offsets equal its virtual addresses (first `LOAD` is `0x0`/`0x0`), so a
crash `pc` maps straight onto the file. Build tested: the shipped 1.1.0 output, `.so` edited, re-zipped,
zipaligned (`-P 16`) and signed.

### Fault 1 — `0x330c4`, a 16-bit length that overflows

The tombstone carries the registers, which settle what is happening:

```
signal 11 (SIGSEGV), code 2 (SEGV_ACCERR), fault addr 0xb400007d403de000 (read)
  x0  b400007d401f3680   x1  0000007fe41a8948
  x12 b400007d4025b0e3   x13 0000000000182f1d   x11 00000000ffe75554
  pc  0000007ced1390c4
```

`x12` is the range base, `x13` the index and the fault address is exactly `x12 + x13`, i.e. the loop
walked `1,585,437` bytes off the end of a ~3.9 MB heap buffer and hit an unmapped page. The counter is
loaded with `ldrsh`, so a length of 32,768 or more becomes negative and `subs`/`b.ne` never reaches
zero. The function reads a descriptor on the stack (`x1`) and FNV-1 hashes two ranges from the blob
(`x0`) against expected values — the 64-bit offset basis `0xcbf29ce484222325` and prime
`0x100000001b3` are both visible in it.

First patch, one instruction:

```
0x330a0  ldrsh w11, [x1, #0x2c]   ->   ldrh w11, [x1, #0x2c]
         79c0582b                       7940582b
```

Result: that fault is gone and the process now dies at `0x5fd9c` — the same hash loop, inlined a
second time (`ldrsh w9, [x1, #0x14]` at `0x5fd6c`). Two descriptors handing the hasher a negative
length is not a coincidence.

### Fault 2 — `0x5fd9c`, then `0x50c24`

Patching all three descriptor-length loads (`0x33028`, `0x330a0`, `0x5fd6c`, each `ldrsh`→`ldrh`)
moved the crash again, to `0x50c24` — not one of those three. That site is a different loop: it hashes
`w27` bytes from `x25 + ((x22 ^ w0) % w19)`, i.e. a table entry located by hash, and it ran off the end
of that table the same way (`SEGV_ACCERR` on a page boundary).

### Why this is not a bypass

- Every fix reveals the next, and the third site has no length field to correct — it is the table walk
  itself that is out of range. The descriptors are not self-consistent, so the validators cannot all
  be satisfied by patching their loops.
- The VM's input is not damaged by patching. `com.pairip.VmDecryptor.decrypt` is a no-op
  (`return-object v1`), so `VMRunner` executes the raw `assets/<name>` entry it reads from `base.apk`
  with `ZipFile`. Those entries are byte-identical between the reference `base.apk` and the patched
  build (20 compared, same sizes and content), and the manifest/asset names are unchanged.
- The check is not gated on the Java stub either. `LicenseClient.checkLicense(context)` was patched to
  `return-void` in `classes2.dex` and the build was reinstalled: unchanged, still SIGSEGV at
  `0x330c4`. The licence flow is also entered from `LicenseContentProvider.onCreate` (a manifest
  provider) and `Application.attachBaseContext`, both ahead of Tandem's own code.
- Timeline of a launch: process starts, `net.tandem.ui.MainActivity` is created, the paywall `START`
  intent (`store/license/paywall?id=net.tandem`) is sent at +2.1 s, and the crash lands 30 ms later.
  The startup program does execute; what follows does not.

So the three sites are the verifier's own arithmetic, not a tripwire that can be skipped: the data they
verify cannot be reconstructed from a re-signed APK. Making the app run needs either a licence response
the native verifier accepts (Play-signed) or a PairIP-free build — not another instruction patch.

## What this means

- The clone mechanics work: new application id, installs beside the official app, no provider or
  broadcast collisions on the device.
- The bundle is **not usable on hardware yet**: it cannot get past Tandem's licence and integrity
  gate, which is the same "Get this app from Google Play" behaviour reported before the clone patch
  existed. The gate is native, so this is not something a further dex patch can fix.
- Nothing after launch has been observed — sign-in, messaging, dark mode, ad removal, voice notes — so
  none of those can be marked as verified.

## Next

1. Stop trying to patch around the crash. Three sequential faults were fixed on hardware
   (`0x330c4` → `0x5fd9c` → `0x50c24`) and each one only revealed the next, because the descriptors
   the native verifier is fed do not match a re-signed build. The workable routes are a Tandem
   release without PairIP, or a licence response the native verifier accepts.
2. Once a run survives launch, walk the app: sign-in, conversation list, a message, a call, then the
   patch-specific effects.
3. Compare against a **Play-installed** official app; sideloading the stock APK trips the same gate, so
   it is not a usable baseline.

## 6.12.0 — the same gate, a different message

6.12.0 (versionCode 11503) was tried as a way around the launch failure above, because older Tandem
builds are what still run for most people. It is **not** one. Measured on the reference APKM, split
like the 6.38.0 one:

| | 6.38.0 | 6.12.0 |
| :--- | :--- | :--- |
| Application class in the manifest | `com.pairip.application.Application` | the same |
| PairIP components in the manifest | `LicenseActivity` | `LicenseActivity` and `LicenseContentProvider` (`net.tandem.com.pairip.licensecheck.LicenseContentProvider`) |
| `lib/arm64-v8a/libpairipcore.so` | present | present, 527,472 bytes |
| Licence entry points | `LicenseClient.checkLicense(Context)`, `startPaywallActivity`, `startErrorDialogActivity`, `scheduleAppShutdown` | `LicenseClient.connectToLicensingService()`, `checkLicenseInternal(IBinder)`, `LicenseActivity.showPaywallAndCloseApp()`, `showErrorDialog()` |
| Signature gate | `SignatureCheck.verifyIntegrity(Context)` | the same |

So a re-signed 6.12.0 is subject to the same signature and licence checks, and it ships the native
core that produced the SIGSEGV above.

**"Please update … from the Google Play store" is Tandem's own dialog, not Play's licensing.** The
text is `string/Error.UpgradeMessage` — "Please update to the latest version of Tandem from the
Google Play store. We've improved the chat experience …" (`0x7f130458` in 6.38.0, `0x7f130421` in
6.12.0; 6.12.0 also carries `string/OutdatedAppText` with the App Store wording). A literal-constant
scan of all five dex files in each base APK found no method that loads either id, and no dex string
references the resource by name — so the code that raises that dialog is not in the dex the
patches rewrite, which is why emptying the licence methods behind it does not remove it.

What the bundle does about 6.12.0 is only declared support: `v1.1.1` applies all five patches to
both reference APKMs (five applied, zero failed, `--validate` on), with the anchors that moved
between the builds matched by something stable. That is an "applies" result, not a "runs on a
device" result — 6.12.0 has not been installed yet, and nothing above suggests it would behave
differently from 6.38.0.

## Note on the official copy

At the start of the test `net.tandem` was installed on the device. After the clone install completed it
was gone from both `pm list packages` and `pm list packages -u`, with no uninstall event captured (the
log buffer was cleared before installing). A package-id change cannot uninstall another package, so this
was an outside agent — most likely Play Protect removing a sideloaded build — or a manual uninstall.
The unpatched control run used a copy reinstalled from the reference APKM; reinstall from Play for a
true baseline.
