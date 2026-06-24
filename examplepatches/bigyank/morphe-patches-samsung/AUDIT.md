# Audit: morphe-patches-samsung vs SamsungAppsPatcher

Comparison of this Morphe patch bundle against the original PC-side patcher ([SamsungAppsPatcher](https://github.com/adil192/SamsungAppsPatcher), fork: [bigyank/SamsungAppsPatcher](https://github.com/bigyank/SamsungAppsPatcher)).

**Audit date:** June 2026  
**Morphe release reviewed:** v1.0.15  
**Reference Health version:** 6.32.0.001  
**Device verification:** SM-S911B, Android 16, Knox 0x1 — launch, account sync, Galaxy Fit3 wearable sync confirmed

---

## Executive summary

**morphe-patches-samsung** covers the **Health-only, on-device** workflow well and goes **deeper than the original on login** (provider stubs + `AccountManager` redirect, not just string replacement).

For **Knox 0x1 + unrooted + Samsung phone + Health 6.32**, the Morphe bundle is **feature-complete** relative to the original Health path. The original repo’s remaining value is mostly **other Samsung apps** (Galaxy Wearable, watch plugins) and **secondary Health hardening** that may not be needed when using stock Wearable with a Morphe-resigned Health APK.

---

## Side-by-side capability matrix

| Capability | SamsungAppsPatcher | morphe-patches-samsung | Notes |
|------------|-------------------|------------------------|-------|
| Knox SDK stubs (`KnoxAdapter`, `IcccAdapter`, `KnoxControl`, SAK) | ✅ `.patch` + Python | ✅ 17 fingerprint stubs | Morphe adds `checkKnoxInitMigCondition`, `isLicenseActivated`, `requestKeyInitForKnox` |
| OOBE Knox popups / root gates | ✅ Python content scan | ✅ `OobeKnoxStubber.kt` | Hardcoded `util/h` fingerprints failed on 6.32; v1.0.15 uses dex scan |
| Samsung Account bypass | ⚠️ String replace only | ✅ Strings + provider stubs + `AccountManager` | Morphe fix for login after re-sign |
| `$this$isRooted` file scan stub | ✅ Python scan | ✅ v1.0.16+ content scan | Defensive hardening |
| Multi-user Health (`install_only_owner`) | ✅ manifest + smali | ❌ | `resourcePatch` → OOM on ~300 MB APK |
| Custom cert allowlist (Health ↔ plugins) | ✅ `shealth_custom_cert.patch` | ❌ | Often unnecessary with stock Wearable + Morphe Health |
| Galaxy Wearable host bypass | ✅ 3 patches | ❌ | Separate repo scope |
| Watch plugin cert patches (7 APKs) | ✅ | ❌ | High churn; Fit3 path works without them on test device |
| Global `Build.MANUFACTURER` spoof | ✅ all APKs | ❌ | For non-Samsung hosts only |
| Obfuscated SAK (`j0/b/m`) | ✅ separate patch | ✅ via `SakChecker` + `c6r` stubs | Stable SDK path on 6.32 |
| On-device / no PC | ❌ apktool + JKS | ✅ Morphe Manager | Core value proposition |
| Default keystore sufficient | ❌ custom `SamsungPatch` JKS | ✅ | Account patch avoids provider cert check |

---

## What Morphe does better

1. **Account login** — Original renames `com.osp.app.signin` in smali/XML. Morphe additionally stubs `SamsungAccountUtils` / `Util` provider methods and redirects `getSamsungAccountId` through `AccountManager.getAccountsByType("com.osp.app.signin")`. Login works with Morphe’s default signing key without importing a custom JKS.

2. **OOBE resilience** — v1.0.15 scans dex for Knox popup patterns (like `apply_shealth_knox_bypass.py`) instead of hardcoding obfuscated class names (`h`, `idc`, `h4d`, `j32`).

3. **On-device constraints** — Dex-only design avoids resource decode OOM (v1.0.10 regression).

---

## SamsungAppsPatcher inventory

### Patch files (`patches/`)

| File | Target | Dex/manifest | Summary |
|------|--------|--------------|---------|
| `shealth_remove_root_check.patch` | Health | smali | Knox SDK + OOBE + `$this$isRooted`; line-number fragile |
| `apply_shealth_knox_bypass.py` | Health 6.32+ | smali script | Runtime Knox/SAK/OOBE scan; obfuscated OOBE class names |
| `shealth-disable-SAK.patch` | Health | smali | Obfuscated `j0/b/m.isSakSupported` |
| `shealth_allow_multiuser.patch` | Health | smali + **manifest** | `install_only_owner=false` |
| `shealth_custom_cert.patch` | Health | smali | Whitelist `SamsungPatch` keystore in signature util |
| `wearable_remove_device_restrictions.patch` | Wearable | smali | `HostManagerUtilsRulesBTDevices.isSupportedInHostDevice` → true |
| `wearable-disable-SAK.patch` | Wearable | smali | `VerificationManager.isSupportSAKVerify` → false |
| `wearable-remove-huawei-check.patch` | Wearable | smali | Neuter `"HUAWEI"` in host blocklist |
| `*_custom_cert.patch` (7 files) | Watch plugins | smali | Add custom cert to `Signaturechecker` classes |

### Scripts

| Script | Role |
|--------|------|
| `wearable-patcher.sh` | Main pipeline: global manufacturer sed + account string sed + per-app `.patch` files + sign with `keystore.jks` |
| `patch-shealth-632.sh` | Health 6.32 only: account sed + `apply_shealth_knox_bypass.py` (does **not** apply legacy `.patch` files) |
| `wearable-installer.sh` / `wearable-wipe.sh` | ADB install/uninstall batch |

**Important:** `./wearable-patcher.sh shealth` and `./patch-shealth-632.sh` are **not equivalent** (multiuser + custom cert vs Python Knox only).

### Supported apps (original repo)

| Tier | Apps |
|------|------|
| Core | Samsung Health, Galaxy Wearable, Accessory Service |
| Watch plugins | watchplugin, watch3plugin, watch4plugin, active/active2, gearfit2, gears |
| Documented, no dedicated patch | gearsport, buds plugins, Gear IconX |

Global sed (every patched APK): `Build.MANUFACTURER`/`BRAND` → dummy string; `com.osp.app.signin` → `com.notsamsung.dummy`.

---

## morphe-patches-samsung inventory

### Patches (2 default-on)

| Patch val | File | What it modifies |
|-----------|------|------------------|
| `disableKnoxIntegrityChecksPatch` | `KnoxBypassPatch.kt` | 17 SDK fingerprint stubs + `stubOobeKnoxGates()` |
| `bypassSamsungAccountSignatureCheckPatch` | `AccountBypassPatch.kt` | Provider stubs + `getSamsungAccountId` redirect + dex string replace |

### Support code

| File | Role |
|------|------|
| `Fingerprints.kt` | 21 method fingerprints (17 Knox + 4 account) |
| `BytecodeStubUtils.kt` | Stub helpers with try/catch clearing |
| `OobeKnoxStubber.kt` | Content-scanned OOBE Knox/root/ViewModel gates |
| `SigninPackageReplacer.kt` | Dex-wide signin package replacement |
| `Constants.kt` | Targets: 6.32.0.001, 6.31.3.013 |

### Morphe hard constraints

- **Bytecode-only** — no `resourcePatch` (OOM on ~300 MB Health APK).
- **1280 MB** Morphe process runtime minimum.
- Patch val names must not be renamed (Morphe bundle IDs).
- `BytecodePatchContext` extension helpers; work inside `fingerprint.method.apply { }`.

---

## Gap analysis and recommended roadmap

### Tier 1 — Health-only, Morphe-friendly

| Item | Original source | When to add |
|------|-----------------|-------------|
| **`$this$isRooted` dex stub** | `apply_shealth_knox_bypass.py` | ✅ v1.0.16+ — static `(File)Z` methods containing `$this$isRooted` |
| **New Health version** | — | Add `AppTarget` + verify fingerprints when Samsung ships 6.33+ |

Implementation sketch for root scan: find static `(Ljava/io/File;)Z` methods containing const-string `$this$isRooted`, stub return false — same pattern as `OobeKnoxStubber.kt`.

### Tier 2 — Health, poor Morphe fit (defer)

| Item | Why defer |
|------|-----------|
| `shealth_allow_multiuser.patch` | Requires manifest edit → `resourcePatch` → OOM |
| `shealth_custom_cert.patch` | Only for patched plugin IPC; stock Wearable + Morphe Health works without it (verified Fit3) |
| Obfuscated SAK `j0/b/m` patch | Covered by stable `SakChecker` + `c6r` on 6.32 |

### Tier 3 — Other Samsung apps (new repo)

Suggested separate bundle: **morphe-patches-samsung-wearable**

| First patches | Original equivalent |
|---------------|---------------------|
| `disableWearableDeviceRestrictionsPatch` | `wearable_remove_device_restrictions.patch` |
| SAK disable on Wearable | `wearable-disable-SAK.patch` |

Skip watch plugin cert patches unless patching Health **and** plugins with the **same** Morphe keystore and seeing signature IPC failures.

Do **not** port to Morphe unless requirements change:

- Multi-user manifest patch
- Seven watch plugin custom-cert patches
- Global manufacturer sed (non-Samsung hosts)
- PC `keystore.jks` workflow

---

## Device verification log (SM-S911B, v1.0.15)

Signals observed during live logcat after successful patch:

| Area | Log signal | Result |
|------|------------|--------|
| OOBE | `OOBEManager: getState :NOT_NEEDED` | ✅ Bypassed |
| Launch | `HomeDashboardActivity` first frame | ✅ OK |
| Account sync | `MeSaSyncManager: sa sync complete` (pull-to-refresh) | ✅ OK |
| Wearable | `Galaxy Fit3` sync `Error : 0`, `[REQUEST_DATA \| SUCCESS]` | ✅ OK |
| Knox crash | No `VerifyError`, `HomeAppCloseActivity`, `OOBE_ERROR_KNOX` | ✅ Clean |
| Provider block | No runtime `app.shealth … mismatched` during sync window | ✅ Account patch effective |

Expected benign noise: `SignatureInfoDbHelper … mismatched` at install time (re-signed APK); `SamsungChildAccountException` on child-account probe.

---

## Version history relevant to audit

| Version | Audit note |
|---------|------------|
| v1.0.11 | Account provider stubs; login/sync confirmed |
| v1.0.14 | OOBE hardcoded fingerprints — **failed** on 6.32 (obfuscated class names) |
| v1.0.15 | OOBE content scan fix; device-verified on SM-S911B |

---

## Related docs

- User setup: [README.md](./README.md)
- Contributor workflow: [CONTRIBUTING.md](./CONTRIBUTING.md)
- Agent handoff: [AGENTS.md](./AGENTS.md)
- Original inspiration: [SamsungAppsPatcher](https://github.com/bigyank/SamsungAppsPatcher)
