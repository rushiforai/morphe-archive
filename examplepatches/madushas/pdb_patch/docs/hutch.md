# Hutch App patches

**App:** Hutch App (`com.omobio.etisalatone`) · **version 4.4.1** · versionCode
`400426001` · minSdk 24 / targetSdk 35 · universal APK (arm64-v8a, armeabi-v7a,
x86, x86_64).

**Signer (SHA-256):** `76700e2a20bf441efba368d36e1cfc186c2ef30053e1c5ecb3fec6e32233459d`
(DN `CN=EtISaLaToMoBiO`).

Hutch is a React Native self-care app built by **Omobio** — the same vendor as
MyDialog (`net.omobio.dialogsc`). Unlike MyDialog, Hutch's app classes are
R8-shrunk, so patches anchor on **library** class names and on the device-integrity
string messages the JS gate returns.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Disable security checks** | ✅ | Force the device-integrity probes (jail-monkey + react-native-device-info) to answer "clean", so the app runs on rooted / adb-enabled / developer-options / emulator devices. |
| **Disable SSL pinning** | ✅ | Unpins the react-native-ssl-pinning OkHttp client and trusts user-installed CAs, so HTTPS traffic can be intercepted. |
| **Disable trackers** | ✅ | Turns off Google Analytics for Firebase (the app's only third-party analytics) and removes the advertising-ID permissions. Push (FCM/HMS) is untouched. |

## The security gate (client-side only)

Hutch's startup/login flow `await`s a Hermes function (`checkDeviceSecurityStatus`)
that runs six probes through the **jail-monkey** and **react-native-device-info**
native modules. Each failing probe returns one user-facing message:

| Probe | Message |
|---|---|
| `JailMonkey.isDebuggedMode()` | "Developer options are turned on…" |
| `JailMonkey.isDevelopmentSettingsMode()` | "Developer options are turned on…" |
| `JailMonkey.AdbEnabled` | "USB debugging is turned on…" |
| `JailMonkey.isJailBroken` | "This device has been modified (rooted/jailbroken)…" |
| `JailMonkey.hookDetected` | "Suspicious tools were detected…" |
| `DeviceInfo.isEmulator()` | "Emulators are not supported…" |

`isDebuggedMode` / `isDevelopmentSettingsMode` are **async** (`Promise`-returning)
natives — the patch rewrites them to **resolve `false`**; a plain return-early
would leave the JS `await` hanging. The other four are synchronous probes folded
into jail-monkey's `getConstants()` map, so forcing each probe to `false` makes
the constants the JS reads come back clean.

Any exception inside the gate drops through to the catch branch and the app shows
**"Unable to verify device security state."** — that message with no other cause
almost always means a patched native threw.

## Fingerprint notes (read before upgrading)

- **jadx deobfuscates the R8 survivors.** `Lj4/c;` renders as `AbstractC2621c`,
  `Lf4/a;` as `AbstractC2541a`, etc. The fingerprints use the **real on-disk dex
  names** (verified with `dexdump`), never jadx's names.
- Anchors are jail-monkey internals (`Lj4/c;`, `Lf4/a;`, `Lg4/a;`, `Lh4/a;`,
  `Li4/a;`, `Lcom/gantix/JailMonkey/JailMonkeyModule;`), react-native-device-info
  (`Lcom/learnium/RNDeviceInfo/RNDeviceModule;`) and react-native-ssl-pinning
  (`LB7/a;`). Re-verify all of them on every app update.
- **`Promise` is an interface** — resolving it needs `invoke-interface`, not
  `invoke-virtual` ("Found interface … but class was expected" otherwise).
- Hutch performs **no Play Integrity / SafetyNet token request** and **no
  client-side APK-signature verification**, so there is nothing to "spoof" here —
  the entire decision lives in the six probes above.

## SSL pinning (react-native-ssl-pinning)

`RNSslPinning.fetch` builds a hardened OkHttp client through `B7.a.e(...)`, which
pins either via an OkHttp `CertificatePinner` (`pkPinning=true`) or a bundled
`assets/<name>.cer` trust manager. The module's own `disableAllSecurity` path
(`B7.a.c(...)`) builds the same client **without** pinning; the patch rewrites
`B7.a.e` to delegate to `B7.a.c`. The app ships **no** platform `pin-set` of its
own, but targets SDK 35 (user CAs untrusted by default), so the patch also adds a
`network-security-config` that trusts the system + user stores.

## Verification (2026-11-06)

Patched APK installed on a **rooted** emulator (`RootEmu`, Android 14, `su`
present) with **adb enabled**:

- **Before:** the original APK blocks at launch — *"USB debugging is turned on.
  Please disable it in device settings."*
- **After:** the patched APK reaches the normal **Mobile Number / Generate PIN**
  login screen, with no security dialog and no `HostFunction` exception in
  logcat.

Bytecode spot-checks on the patched dex: `j4.c.c()` → `const/4 v0,0 / return v0`;
`RNDeviceModule.isEmulatorSync()` → `return false`; `JailMonkeyModule.isDebuggedMode`
→ `sget Boolean.FALSE / invoke-interface Promise.resolve / return-void`;
`B7.a.e` → `invoke-static B7.a.c / return-object`.
