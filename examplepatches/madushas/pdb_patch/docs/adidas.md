# adidas Running patches

**App:** adidas Running (`com.runtastic.android`) · **version 14.12.1** · versionCode
`2026110512` · minSdk 29 / targetSdk 37 · split-APK (`.apkm`) bundle: `base.apk` +
`split_config.arm64_v8a` + `xxxhdpi`/`xxhdpi` + 12 language splits.

**Signer (SHA-256):** `08c2c1b48f633287e72f1f29f0fe664348b3fce4c12ddc8cafa66494268d9427`.

> The older `14.4.0` (vc `2026011603`) `.apkm` is superseded by `14.12.1`.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Bypass PairIP** | ✅ | Disables PairIP licence/VM verification and restores the real Application class. **⚠ see the blocker below — the app will not run until a depairip pass is added.** |
| **Remove ads** | ✅ | No ad-serving SDK ships; denies the advertising ID + Privacy-Sandbox ad services and drops the install-referrer permission. |
| **Disable trackers** | ✅ | No-ops the Adjust SDK's event/lifecycle entry points. |
| **Disable tracker components** | ✅ | Disables the Google Analytics measurement receiver/services + the Adjust lifecycle provider and sets the Firebase/GA collection opt-outs. |
| **Enable dark mode** | ✅ | Forces the built-in night theme (`RtBaseTheme.Dark`) via `AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_YES)` at app startup. |

All five apply cleanly (`failedPatches: []`).

## Dark mode

adidas already ships a full night theme — `values-night/RtBaseTheme` inherits
`RtBaseTheme.Dark` while the day variant inherits `RtBaseTheme.Light` — and a
`DarkModeSettingsActivity`, but it never forces a night mode, so it renders light unless
the whole device is dark. The patch calls
`AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_YES)` at the very start of
`RuntasticApplication.onCreate()`, switching the process `uiMode` to night so both the
resource-qualified themes and Compose `isSystemInDarkTheme()` resolve to dark.

## Ads

adidas ships **no ad-serving SDK** — only the advertising-ID client
(`com.google.android.gms.ads.identifier.AdvertisingIdClient`). The patch therefore
strips `AD_ID`, `ACCESS_ADSERVICES_*`, the install-referrer permission and the
Privacy-Sandbox ad-services property.

## Telemetry

- **Adjust** (attribution analytics) — `SystemLifecycleContentProvider` disabled and its
  `Adjust.trackEvent` / `Adjust.onResume` entry points no-op'ed.
- **Google Analytics (Firebase)** — `AppMeasurementReceiver` / `Service` / `JobService`
  disabled and the Firebase/GA collection opt-outs set.
- FCM push is left intact.

## ⚠ PairIP status (deep-dive complete 2026-11-09)

adidas ships the **full-VM** PairIP variant

- `com.pairip.application.Application` extends the real
  `com.runtastic.android.RuntasticApplication`;
- `com.pairip.licensecheck.LicenseActivity` + `CHECK_LICENSE` are present;
- a DEX VM (`VMRunner`, `SignatureCheck`, `StartupLauncher`, `VmDecryptor`) plus the
  native `lib/arm64-v8a/libpairipcore.so`;
- **18 virtualized methods in 14.12.1** (`Application.onCreate`, 2 content providers,
  6 activity `onCreate`s, BTLE service, OAuth activity, receivers) — each is a pure
  `VMRunner.invoke("progName", args)` trampoline; the real logic lives in encrypted
  `assets/*` VM programs;
- 20 virtualized call sites in 14.4.0 (receivers only); its `Application.onCreate`
  invokes reflection `Method` objects (`ti.kb.JYGl.*`) that the **startup program**
  populates (method-extraction keeps the real Java bodies in the dex).

### What was proven on-device (x86_64 emulator, ARM translation)

| Build | Result |
|---|---|
| **Original**, unmodified | Runs; reaches PairIP's `LicenseActivity` paywall. ARM libs translate fine. |
| **Merged + re-signed, otherwise untouched** | `Fatal signal 11 (SIGSEGV)`. **The native layer verifies the package signature itself** — no dex-level patch can keep the VM alive. |
| **VM kept, startup program skipped** (`StartupLauncher.launch` → void) | The per-method programs now run but abort: native C++ `length_error` in `-fno-exceptions` mode (`vector`) ~20 ms after the first program loads — the VM needs state that only the startup program creates. |
| **VM fully killed + string holders baked** (shipped) | No crash; Firebase initializes; reaches `StartActivity`. 14.12.1 then NPEs in `MainActivity` (its `Application.onCreate`/Dagger init was VM-only). 14.4.0 NPEs in `Application.onCreate` (reflection `Method` table never populated). |

### The string bake (new — no Frida needed)

The ~1,500 VM-decrypted strings were captured **from the original Play-signed app** with
a root heap dump: `adb root && am dumpheap <pid> /data/local/tmp/h.hprof`, pulled and
parsed with a custom ART-HPROF parser (`/tmp/opencode/hprof_holders.py`,
`methods2.py`), then baked into each holder's `<clinit>` via
`restorePairIpHolders("adidas" | "adidas40")` (TSV resources picked by app version).
This eliminated the `FirebaseInitProvider: NullPointerException: name cannot be null`.

### Also fixed in the shared patcher

`killPairIpFull` had two latent bugs surfaced by adidas (a multi-dex app):

1. dexlib instruction lists are **one-shot iterables** — a filter pass after any
   iteration saw an exhausted stream, so all 18 call-site clears silently no-op'ed.
   Now: single pass collects targets, then mutates.
2. `returnEarly()` only supports `void` methods — non-void virtualized methods
   (e.g. `MigrationContentProvider.onCreate()Z`) crashed the patcher. Now:
   `overrideReturnDefault()` emits a typed default return per signature.

Both fixes benefit every app using `killPairIpFull`.

### Why it is not fully working — and what a future attempt needs

With the VM dead, the 18/20 virtualized bodies are unexecutable: 14.12.1 lost its
`Application.onCreate`/DI init (VM-only) and 14.4.0 lost its reflection `Method` table.
Recovering them requires decrypting the VM programs (native RE of `libpairipcore.so` —
no Ghidra/Frida available in this environment; the `pairipcore-vm` tooling only handles
older pairip builds' string encryption) or running the two-pass capture on the ORIGINAL
app at runtime. A future attempt should:

1. use 14.4.0 (only receivers virtualized; real Java init bodies exist), and
2. recover the 6 `ti.kb.JYGl` reflection `Method` targets — either from a heap dump
   (java.lang.reflect.Method instances; the HPROF parser needs an ART-14-exact
   instance layout) or statically by mapping the extracted methods in the dex, then
   generate `Class.forName(...).getDeclaredMethod(...)` lookups in `JYGl.<clinit>`.
