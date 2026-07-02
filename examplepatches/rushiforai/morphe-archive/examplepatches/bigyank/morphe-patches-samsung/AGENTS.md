# Agent quick-start — morphe-patches-samsung

Handoff doc for agents continuing work on **Samsung Health Morphe patches**. Read this before touching code.

## Project at a glance

| Item | Value |
|------|--------|
| **Repo** | https://github.com/bigyank/morphe-patches-samsung |
| **Latest release** | **v1.1.0** — stable; Knox 0x1 device-verified |
| **Morphe plugin** | `app.morphe.patches` 1.3.0 |
| **Target app** | Samsung Health `com.sec.android.app.shealth` — **latest: 7.00.0.107** (also 6.32.0.001, 6.31.3.013) |
| **User scenario** | Knox tripped (0x1), **unrooted** Samsung phone; stock Health blocks Knox/integrity; patched Health must launch, login, and sync |
| **Patch source URL** | `https://github.com/bigyank/morphe-patches-samsung` |

**Working setup (device-verified on v1.0.16):** Morphe Manager, **both patches enabled**, process runtime **1280 MB**, default Morphe keystore (no custom JKS). Test device: SM-S911B, Android 16, Knox 0x1: launch, account sync, Galaxy Fit3 wearable sync confirmed.

---

## What we built (chat history summary)

### Goal

Patch Samsung Health **on-device** via [Morphe Manager](https://morphe.software/) so it runs on Knox-tripped phones without root — comparable login/sync behavior to a fully patched APK workflow.

### Two patches (both default-on)

1. **Disable Knox integrity checks** — stubs 17 Knox/SAK/warranty SDK methods plus content-scanned OOBE gates (`OobeKnoxStubber.kt`).
2. **Bypass Samsung Account provider checks** — dex string replace + provider stubs so login does not hit Samsung Account’s signature-checked `AccountManagerProvider`.

### Root-cause journey (read this to avoid repeating mistakes)

| Symptom | Actual cause | Fix |
|---------|--------------|-----|
| Knox VerifyError / OOBE crash on launch | Stubbed methods kept stale try/catch tables | Full body replace + clear exception handlers (v1.0.4+) |
| Login “server error” after patch | Not cloud — `SignatureInfoDbHelper … mismatched` + `AccountManagerProvider … blocked application` for `app.shealth` | Provider stubs + dex string replace (v1.0.11+) |
| Thought custom keystore was required | Red herring for Morphe; real blocker was provider path | Default Morphe keystore works with account patch |
| Morphe OOM / patch loop on device | `resourcePatch` decodes ~300 MB Health resources | **Dex-only** account patch; never re-add manifest/res decode (v1.0.10 was broken) |
| CI compile failures after refactor | Morphe 1.3 needs `BytecodePatchContext` for `fingerprint.method` and smali `addInstructions` | Extension functions on `BytecodePatchContext`, logic inside `fingerprint.method.apply { }` (v1.0.12) |
| OOBE fingerprint mismatch on 6.32 | Hardcoded `util/h.p` obfuscated per build | Content-scanned `OobeKnoxStubber.kt` (v1.0.15) |
| Health 7.x SAK fingerprint | Empty `c6r` class — hard fingerprint fails | Optional `c6r` fingerprint + `SakSupportedStubber.kt` dex scan |
| Health 7.x account API refactor | `getSamsungAccountId(Context)` removed; provider gate takes `Context` | `isAccountProviderSupported(Context)` fingerprint + `AccountProviderStubber.kt` scans `SamsungAccountDataSourceImpl` |
| CI compile fail on `$this$isRooted` string | Kotlin string interpolation in `isRootedFileCheck` | Escape dollars: `${'$'}this${'$'}isRooted` (v1.0.16) |

### Refactor completed (main branch)

- Split monolithic patch files into `BytecodeStubUtils.kt`, `SigninPackageReplacer.kt`, `AccountBypassPatch.kt`, `KnoxBypassPatch.kt`, `Fingerprints.kt`.
- Removed template `extensions/` and optional `signing/` keystore from repo.
- Docs cleaned for Morphe-only workflow (no desktop patcher references in user-facing text).
- Stubs fail loudly via `PatchException` instead of silent skip.

---

## Release / changelog narrative

Semantic-release on push to `main`. Conventional commits: `fix:`, `feat:`, `refactor:`, `chore:`.

| Version | Milestone |
|---------|-----------|
| **1.0.0** | Initial Knox bypass Morphe port |
| **1.0.2–1.0.3** | Access flags, register-safe stubs, drop bad SAK fingerprint |
| **1.0.4–1.0.5** | Clear try/catch on stub; minimal return stubs |
| **1.0.6** | First Samsung Account bypass attempt |
| **1.0.7–1.0.9** | Dex-only string replace; read-only scan before mutate |
| **1.0.10** | **Broken** — restored `resourcePatch` → OOM on device |
| **1.0.11** | **Working** — provider stubs + dex-only; login/sync confirmed |
| **1.0.12** | Refactor + `BytecodePatchContext` extension helpers; CI green |
| **1.0.13** | Samsung Health 6.31.3.013 compatibility target |
| **1.0.14** | Extra Knox SDK stubs + OOBE fingerprints (OOBE hardcoded names failed on 6.32) |
| **1.0.15** | OOBE content scan fix; SM-S911B launch + account + Fit3 sync verified |
| **1.0.16** | `$this$isRooted` dex scan + AUDIT.md; full SamsungAppsPatcher Health parity (dex-only) |

Full comparison with SamsungAppsPatcher: [AUDIT.md](./AUDIT.md).

Full machine-generated log: [CHANGELOG.md](./CHANGELOG.md).

---

## Repository layout

```
morphe-patches-samsung/
├── patches/src/main/kotlin/app/bigyank/patches/
│   ├── shared/Constants.kt          # AppTarget versions, package name
│   └── shealth/
│       ├── KnoxBypassPatch.kt       # val disableKnoxIntegrityChecksPatch
│       ├── AccountBypassPatch.kt    # val bypassSamsungAccountSignatureCheckPatch
│       ├── Fingerprints.kt          # All method fingerprints (Knox + account)
│       ├── BytecodeStubUtils.kt     # stubReturnFalse, stubZeroReturn, replaceMethodBody
│       ├── OobeKnoxStubber.kt       # content-scanned OOBE Knox/root gate stubs
│       └── SigninPackageReplacer.kt # replaceSigninPackageInDex()
├── patches/build.gradle.kts         # Morphe bundle metadata; -Xcontext-receivers
├── patches-list.json                # Auto-updated by release CI — do not hand-edit
├── .github/workflows/release.yml    # build + semantic-release
├── README.md                        # User docs
├── CONTRIBUTING.md                  # Contributor notes
├── AUDIT.md                         # Comparison vs SamsungAppsPatcher + roadmap
└── AGENTS.md                        # This file
```

### Patch bundle IDs (do not rename vals)

Morphe identifies patches by Kotlin `val` names:

- `disableKnoxIntegrityChecksPatch`
- `bypassSamsungAccountSignatureCheckPatch` ← name is historical; UI title is “Bypass Samsung Account provider checks”

---

## Technical design

### Patch 1 — Knox (`KnoxBypassPatch.kt`)

Stubs **stable SDK methods** plus **content-scanned OOBE/root gates** (`OobeKnoxStubber.kt`):

- `KnoxAdapter` (9 methods incl. `checkKnoxInitMigCondition`, `isLicenseActivated`)
- `IcccAdapter.checkKnoxCompromised`
- `KnoxControl` (3 methods)
- `IKnoxControl$Stub$Proxy` (`isKnoxAvailable`, `requestKeyInitForKnox`)
- `SakChecker.isSupported`, `c6r.isSakSupported`
- OOBE: content-scanned Knox popups, `HomeAppCloseActivity` root check, `KnoxHandlerViewModel` flag getter/setter, `$this$isRooted` file checks (see `OobeKnoxStubber.kt`)

**Out of scope:** manifest/res multiuser patches and custom cert allowlists.

### Patch 2 — Account (`AccountBypassPatch.kt`)

Three layers, **dex-only**:

1. **Provider bool stubs** → return false:
   - `SamsungAccountUtils.isAccountProviderSupported`
   - `Util.getSupportAccountManagerProvider`
   - `Util.isAccountSignedInFromAccountManagerProvider`

2. **`getSamsungAccountId` redirect** → `AccountManager.getAccountsByType("com.osp.app.signin")` (real account type; dummy package is for other strings only).

3. **Dex string replace** — all `com.osp.app.signin` → `com.notsamsung.dummy` in const-strings and static field defaults (`SigninPackageReplacer.kt`).

Manifest/res may still contain `com.osp.app.signin` in sync-adapter XML — **that is OK**; runtime provider calls were the login blocker.

### Stub implementation rules (`BytecodeStubUtils.kt`)

Critical Morphe 1.3 constraints:

- Helpers are **`BytecodePatchContext` extension functions** — called from `execute { }` only.
- **`fingerprint.method.apply { }`** — receiver is Morphe `MutableMethod`; smali `addInstructions(String)` / `removeInstructions` work here.
- **Do not** call smali helpers on plain `Method` or `MutableMethodImplementation` outside `apply`.
- **Do not** use top-level `context(_: BytecodePatchContext)` — needs `-Xcontext-parameters` and breaks CI.
- Simple stubs: try reflection to swap `implementation`, else in-place wipe with try/catch cleared.
- Custom bodies (`getSamsungAccountId`): always in-place wipe (preserves register count).

---

## Build & CI

### Local (needs GitHub Packages auth)

```bash
export GITHUB_TOKEN="$(gh auth token)"   # needs read:packages
./gradlew :patches:buildAndroid generatePatchesList clean
```

Output: `patches/build/libs/patches-*.mpp`

CI runs the same Gradle command on push to `main`, then semantic-release publishes GitHub release + updates `patches-list.json` and README patch table.

### Common compile errors

| Error | Fix |
|-------|-----|
| `No context argument for BytecodePatchContext` | Use `BytecodePatchContext` extension functions; call from `execute { }` |
| `addInstructions` type mismatch on `MutableMethodImplementation` | Use smali string overload inside `fingerprint.method.apply { }` |
| `context parameters is experimental` | Do not use `context(_: BytecodePatchContext)` syntax in helpers |

---

## Device testing checklist

1. Morphe Manager → process runtime **1280 MB**.
2. Add patch source; select the **latest** Health APK (currently **7.00.0.107** or **6.32.0.001** universal).
3. Enable **both** patches; patch on device.
4. Uninstall stock Health; install patched APK.
5. Verify:
   - App launches (no Knox OOBE loop)
   - Samsung Account login succeeds
   - Data syncs
6. Logcat signals:
   - **Bad:** `SignatureInfoDbHelper`, `AccountManagerProvider`, `blocked application`, `app.shealth`
   - **Good:** no provider signature mismatch after patch

---

## Debugging guide

### Login fails after patch

- Confirm both patches enabled and **[latest release](https://github.com/bigyank/morphe-patches-samsung/releases/latest)** (v1.0.16+).
- Capture logcat during login; search for `SignatureInfoDbHelper` / `AccountManagerProvider`.
- If provider lines appear → account patch did not apply (wrong version, patch disabled, or fingerprint mismatch on new Health build).

### Morphe OOM / infinite loop

- Force-stop Morphe; set 1280 MB runtime; close other apps.
- Ensure account patch is **bytecode-only** (no `resourcePatch`).
- Do not use v1.0.10-era builds that decode resources.

### VerifyError on launch

- Usually stale try/catch after partial stub — ensure `clearExceptionHandlers()` runs before in-place replace.
- Check Knox fingerprints match target APK (access flags, method names).

---

## Extending to a new Health version

1. Download APK; decompile or inspect dex.
2. Confirm all classes/methods in `Fingerprints.kt` still exist with same signatures.
3. Add `AppTarget(version = "x.y.z")` in `Constants.kt`.
4. Test on Knox 0x1 device — launch, login, sync.
5. PR with device model + Knox status + results.
6. Use conventional commit; release is automatic.

If new Health version adds obfuscated Knox gates, extend **`OobeKnoxStubber.kt` heuristics** or add fingerprints for stable SDK methods. Do not hardcode obfuscated class names.

---

## Hard rules (do not break)

1. **Never re-add `resourcePatch`** for account manifest/res sed — OOM on ~300 MB APK on-device.
2. **Keep account patch dex-only** — string replace + provider stubs only.
3. **Keep both patches default-on** unless there is a proven reason not to.
4. **Do not rename** `bypassSamsungAccountSignatureCheckPatch` / `disableKnoxIntegrityChecksPatch` vals.
5. **Bytecode helpers** must be `BytecodePatchContext` extensions with work inside `fingerprint.method.apply { }`.
6. **Default Morphe keystore is sufficient** — do not require custom JKS in docs or patch metadata.
7. **Do not commit** unless the user asks.

---

## Related context

- **User-facing docs:** [README.md](./README.md)
- **Contributor workflow:** [CONTRIBUTING.md](./CONTRIBUTING.md)
- **Prior conversation transcript** (full debug arc): Cursor agent transcript `c67d5233-6c77-4c87-8892-b6748d201a42` in SamsungAppsPatcher workspace (if available to the agent).

---

## Quick commands

```bash
# Clone
git clone https://github.com/bigyank/morphe-patches-samsung.git
cd morphe-patches-samsung

# Build (with auth)
export GITHUB_TOKEN="$(gh auth token)"
./gradlew :patches:buildAndroid generatePatchesList clean

# Check latest release
gh release view --repo bigyank/morphe-patches-samsung

# Watch CI
gh run list --repo bigyank/morphe-patches-samsung --limit 3
```

---

## Current status (as of v1.1.0)

- **CI:** green (`./gradlew :patches:buildAndroid generatePatchesList clean`)
- **Device:** launch, account sync, Galaxy Fit3 wearable sync confirmed on SM-S911B, Knox 0x1
- **Stable targets:** Samsung Health 7.00.0.107 / 6.32.0.001 / 6.31.3.013 with both default-on patches
- **Open work:** separate Wearable Morphe repo if expanding scope — see [AUDIT.md](./AUDIT.md)
