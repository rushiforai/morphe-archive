# Solid Explorer

Package `pl.solidexplorer2`, supported target `3.6.4` (versionCode `306041`, APKM).
Source: [`patches/src/main/kotlin/dev/hyzor/patches/solidexplorer/`](../../patches/src/main/kotlin/dev/hyzor/patches/solidexplorer/).

| Patch | Default | What it does |
|---|---|---|
| Enable Pro | on | Reports the free licence as Pro, so the Pro features unlock and the ads are gone. |

## Port notes

This is a port of the Solid Explorer 3.6.1 "Enable Pro" patch in
[hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches). The licensing code did
not change between 3.6.1 and 3.6.4: `LicenseDetails`, `LicenseState` and `adsEnabled()` are
the same classes with the same shapes, so the hook itself is unchanged. What is new here is
the way the patch finds its target — see below.

The tested artifact is the APKMirror APKM (`base.apk` plus `arm64-v8a`, `armeabi-v7a`, `x86`
and `x86_64` splits, versionCode `306041`). All of the patched code is in `base.apk`; the
splits only carry native libraries and are merged through unchanged.

## How the app decides you are Pro

Solid Explorer keeps the licence decision in one immutable record,
`pl.solidexplorer.licensing.LicenseDetails`:

```text
a: LicenseState   UNKNOWN / CHECKING / TRIAL / UNLICENSED / LEGACY_PREMIUM /
                  SUBSCRIBER / PREMIUM_PRO / ERROR
b: String         productId
c: Long           trialStartDate
d: Long           trialEndDate
e: String         revokedReason
```

Everything else reads that record:

- `FeatureGate.isAccessGranted()` is
  `LicenseState.getPRO().contains(LicensingManager.currentLicenseDetails.state)`, and
  `getPRO()` is `{SUBSCRIBER, PREMIUM_PRO}`. The Pro gates — folder encryption, storage
  analyser, backup sync, icon sets — are all built on it.
- `LicenseDetails.adsEnabled()` is `state == UNLICENSED` and drives the ads.
- `isPro()`, `isLicensed()`, `isStateResolved()`, `isTrialStarted()` and the paywall screens
  read the same field directly or through `getState()`.

`LicensingManager` publishes the record through a `MutableStateFlow`, seeded with
`LicenseState.UNKNOWN`. It is rebuilt from the backend response, from the on-disk
`LicenseCache` and from Play Billing reconciliation, and every one of those paths funnels
through the single `LicenseDetails.<init>`.

## The patch

The hook runs at the end of that constructor: if the freshly built record reports ads
(`adsEnabled()`, i.e. `state == UNLICENSED`), its state is rewritten to `PREMIUM_PRO`.
Records that are already licensed keep their state, so a subscriber still gets the
subscriber UI. Rewriting the field rather than the getters matters: `adsEnabled()` and
`isPro()` compare the field directly, so patching `getState()` alone would leave the ads on.

Only the state is forged. The product id, the trial dates and the rest of the record are
what the app received, and nothing server-side changes; a purchase or a subscription the
backend refuses is still refused.

The upstream patch hard-codes the field name (`a`) and matches the constructor by
`definingClass` + "is a public constructor". Both are brittle here:

- the state field is single-letter and R8 is free to rename it, so the patch reads the name
  from the constructor's own `iput-object` of a `LicenseState` instead, and fails with an
  actionable `PatchException` if there is not exactly one;
- 3.6.4 has two constructors in the class — the real five-argument one and the Kotlin
  synthetic one for default arguments — so the fingerprint pins the five-argument parameter
  list and matches exactly once (confirmed by `--validate`).

The app's legacy licensing (`SELicenseManager`, `LEGACY_PREMIUM`) and the signature/Play
Integrity paths are untouched.

## Verification

Static checks:

- `tools/verify_fingerprints.py` resolves both anchors against the stock APKM
  (`LicenseDetails.<init>` with the five-argument signature and `adsEnabled()Z`).
- Morphe Desktop applies the bundle to the stock APKM with `--validate --exclusive`:
  the fingerprint matches exactly once, the patch is the only one applied,
  and it changes 1 of the 40,086 classes.
- The patched DEX was disassembled. The constructor now ends with:

  ```smali
  invoke-virtual {p0}, Lpl/solidexplorer/licensing/LicenseDetails;->adsEnabled()Z
  move-result v0
  if-eqz v0, :cond_0
  sget-object v0, Lpl/solidexplorer/licensing/LicenseState;->PREMIUM_PRO:Lpl/solidexplorer/licensing/LicenseState;
  iput-object v0, p0, Lpl/solidexplorer/licensing/LicenseDetails;->a:Lpl/solidexplorer/licensing/LicenseState;
  :cond_0
  ```

  The patched class is stripped from its original DEX and written to a new one, so there is
  no duplicate definition.
- The signed output still declares `pl.solidexplorer2` `3.6.4` (`306041`).

Device run on an Android 16 x86_64 emulator (`sdk_gphone64_x86_64`, API 36). Stock 3.6.4 was
installed from `base.apk` + `split_config.x86_64.apk`, onboarded, and compared against the
patched build after the same onboarding:

| Check | Stock 3.6.4 | Patched 3.6.4 |
|---|---|---|
| Drawer header | no Pro badge | **Pro** badge next to the app name |
| Settings → Icon set → tap **Paper** (a Pro set) | opens the Pro paywall ("Ad-Free Experience", "Strong File Encryption", …) | applies the set (green check), no paywall |

The patched build cold-started and stayed up with no `FATAL EXCEPTION` in logcat. Play
Billing and Firebase auth are unavailable on the emulator, so the licence resolves to the
free/unresolved path there — which is exactly the path the hook rewrites.

Not exercised: a real purchase or `SUBSCRIBER` account (the subscriber branch is deliberately
left alone), the legacy `LEGACY_PREMIUM` path, folder encryption and backup sync (the
paywall check above covers the same `FeatureGate`), and the ads themselves — `adsEnabled()`
reads the rewritten state, so the ad views are not created, but that was not observed on a
device with a live ad unit.
