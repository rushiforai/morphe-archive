# Monet premium

For separate Nuvio catalog rows on **1.1.0** (existing 1.0.97 support retained), see [MonetCatalogChannels.md](MonetCatalogChannels.md).
The user-confirmed integration puts catalogs inside **NuVioTV > Content**, uses
NuVio's installed icon and refreshes independently of Recommendations. That
independent optional patch can be combined with either premium alternative.

For the **1.1.0 / 1.0.97** Displayed Cards limit and additional controls, see
[MonetDisplayedCards.md](MonetDisplayedCards.md). That patch also works independently
or with either premium alternative.

The bundle provides two alternatives. Select **only one**:

- **Monet - Unlock premium** targets `com.klevico.monet` **1.1.0**, retaining
  the existing **1.0.97** target.
- **Monet - Unlock premium (Experimental, any version)** has a null version
  target and experimental metadata. It attempts structural matching on any Monet
  version; it rejects unsupported layouts. The latest verified input is **1.1.0**.

Both are disabled by default to avoid selecting both alternatives together.
Selecting both causes the second patch to reject the already-modified evaluator.

## Upstream reference and adaptation

Original premium unlock: [Doom's Patches (rushiranpise)](https://github.com/rushiranpise/morphe-patches/tree/36e542058f41bf49791cffe67e37beba8460a2ad/patches/src/main/kotlin/app/template/patches/monet/premium).
This port updates support to Monet 1.1.0; the experimental variant removes the
version restriction. It adds no new premium-unlock features.
The reference contains one premium patch and two fingerprints; its compatibility
entry targets `v1.0.76` / `110`, and source comments also describe 1.0.84.
It forces the billing write-back boolean and updates the state holder at the end
of the billing-manager constructor to cover cold startup and subsequent refreshes.

The 1.0.97 implementation is independently matched against the original DEX.
Its receipt persistence moved to a separate store and the billing callback is now
`La/m20;->p(Ljava/util/List;Z)V`; the old fingerprints cannot simply be copied.
Instead, the shared premium evaluator is made true for every input. This covers
the same local feature access at startup and after billing/license updates, while
leaving receipt storage, license blobs and purchase processing intact. It does
not fabricate a Play purchase or server entitlement. No runtime extension is needed.

## 1.1.0 change and native contract

- Input: `../OriginalApps/monet-1.1.0.apk`. Manifest: `com.klevico.monet`,
  version **1.1.0**, code **134**, minimum SDK 26, TV launcher.
- SHA-256: `3fdd45e7ed85f4a26ab6a56924e8a9c298c42c3cb036cb121d15ed6504b9a69c`.
- All original DEX contain **9,041** classes. The unique evaluator is now
  `La/dl5;->a()Z`, **public instance**, no parameters, four registers, no try blocks.
  Its access flags changed from `17` (public final) to `1` (public), which alone
  caused the old experimental matcher to reject it. The regular patch also had
  a deliberate 1.0.97 version/descriptor restriction.
- R8 merged the holder with an unrelated string constructor. Do not fingerprint
  its complete class field list or require every method to remain final.
- The same 13 instructions and offsets remain. Fields in read order are `b,a,c,d`;
  the formula is `b || (a && (c || !d))`. `p0=v3`; all loads use `p0` before its
  final overwrite. Index 11 / code address 19 is `const/4 v3, 0`, followed by
  `return v3`. Replacing only that literal with 1 preserves all code widths,
  registers, branch destinations and exception boundaries.
- `La/f50;-><init>(Landroid/content/Context;La/ms0;)V` contains `billing_prefs`
  and `license_blob_v1` and uniquely invokes `La/dl5;-><init>(ZZ)V`.
  That constructor calls the evaluator, boxes its result and seeds `La/ct6;`,
  exposed through `La/kt5;`. `La/dl5;->c(Z)V` reevaluates on license changes;
  `La/f50;->s(Ljava/util/List;Z)V` reevaluates on billing updates.
- Raw original-DEX evidence: `../.inspect-monet-1.1.0/{billing,state,callers}.txt`.
  No runtime extension or fabricated receipt/server entitlement is introduced.

## Experimental resilience and limits

Both alternatives use the shared structural matcher. Instead of exact `final`
flags, register numbers, opcode count and branch offsets, it now verifies:

1. A public non-static `()Z` reducer (optional `final`), four distinct owned boolean
   field loads, no try blocks, a small allowlisted pure forward-only control flow.
2. The reviewed truth table for **all 16 inputs**, with every instruction reachable
   across those inputs, one true and one false constant-return block.
3. A unique billing constructor anchor and native holder constructor/license-refresh
   calls to that same evaluator. The regular alternative additionally checks the
   version's reviewed descriptor.

This tolerates renamed classes/fields/methods, optional `final`, relocated registers,
forward branch layout changes, wider `goto` and harmless NOPs. It still changes only
the proven false-return constant. Missing, ambiguous, already-patched, impure or
semantically changed candidates fail before mutation.

**“Any version” means unrestricted version selection, not guaranteed compatibility.**
Changed preference keys, constructor contracts, reordered field roles, inlining,
new entitlement logic or server enforcement can still require fresh inspection.
Do not solve these by accepting arbitrary boolean methods or broadly changing
billing storage. Catalog rows and the separate displayed-card patch also support
**1.1.0** with reviewed native UI/runtime contracts and combined-patch verification.

## Historical 1.0.97 input and contract

- Input: `../OriginalApps/monet-1.0.97.apk`.
- Manifest: `com.klevico.monet`, version `1.0.97`, code `131`, minimum SDK 26;
  leanback launcher / TV form factor.
- SHA-256: `58bcdaeb7de6109434e013e796e367df6bdfcea3b9b17a01c15431c51d5556cf`.
- `classes.dex`: `La/sa5;->a()Z`, public final instance method, four registers,
  no parameters, no try blocks. `p0` is `v3`.
- Original formula: `c || (b && (d || !e))`. Four `iget-boolean` instructions
  load `c,b,d,e` into `v0,v1,v2,v3`; five branch offsets are `3,7,8,4,4`.
  The true and false return blocks each contain `const/4 v3` then `return v3`.
- Mutation: instruction index 11, `const/4 v3, 0` becomes `const/4 v3, 1`.
  Instruction widths, register count, branch targets, method signatures and
  exception boundaries remain unchanged. No new references are introduced.
- `La/sa5;-><init>(ZZ)V` seeds `La/ie6;` through this evaluator and exposes
  its read-only flow through `La/vh5;`. `La/sa5;->c(Z)V` recomputes it after
  license-state changes. `La/m20;->p(Ljava/util/List;Z)V` recomputes it after
  purchase answers; `La/mx3;` consumes the exposed flow for launcher UI state.
- Matching scans all original DEX classes. It validates the complete 13-opcode
  evaluator, register operands, four distinct boolean fields, branch offsets and
  original literals, plus a unique constructor calling this holder's `(ZZ)V`
  constructor alongside `billing_prefs` and `license_blob_v1` strings.
  The exact-version patch additionally requires the reviewed evaluator descriptor.

## Verification (latest input: 1.1.0)

Run from the repository (the PowerShell execution policy may require invoking
the script through `powershell -NoProfile -ExecutionPolicy Bypass -File`):

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\build-local.ps1 :patches:buildAndroid :patches:verifyMonet :patches:verifyMonetBundle :patches:generatePatchesList :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport -PmorpheDesktopJar=E:/Morphe/morphe-desktop-1.19.1-all.jar --offline
```

`verifyMonet` checks unique matching across the original 1.1.0 APK, final/non-final
and relocated-register/NOP/wider-goto synthetic layouts, static/wrong-semantics/
unanchored/missing-refresh/missing/ambiguous/changed/already-patched rejection,
mutation scope, all sixteen boolean input
combinations and DEX write/reload. `verifyMonetBundle` independently loads and
applies each alternative from the built `.mpp`, evaluates the serialized hook,
and reconstructs the full output class set to detect cross-DEX duplication/loss.

Latest bundle: `patches/build/libs/patches-0.15.0.mpp`. Original-DEX and packaged
application checks passed for both alternatives; Desktop 1.19.1 imports all 33
patches across 8 apps. `verifyAndroidBundle` confirms Android DEX in the actual MPP.
Logs are under `../.inspect-monet-1.1.0/`. No release version was changed.

Desktop 1.19.1 also rebuilt each alternative successfully with `--exclusive --unsigned`:

- `../Apps/Monet/monet-1.1.0-premium-unsigned.apk`
- `../Apps/Monet/monet-1.1.0-premium-experimental-unsigned.apk`

`verifyMonetApk` audits the experimental output by default; use
`-PmonetApk=E:/Morphe/Apps/Monet/monet-1.1.0-premium-unsigned.apk` for the regular
output. Each should retain 9,041 unique classes, all 16 patched premium states and
674 unchanged non-DEX/non-signature entries (including the manifest).
The outputs are validation fixtures, **unsigned and not installable as-is**;
`apksigner verify` is expected to report the missing signature manifest.
No signing, installation or device testing was performed locally. Required device checks:
clean cold start, premium customization, billing reconnect, license refresh and
process restart. Do not confuse a successful rebuild with device-verified behavior.

On **2026-10-29**, the user reported that the updated premium patch appears to work
on their device. The selected alternative and individual startup/reconnect/license
refresh scenarios were not specified; do not treat this as separate device
verification of both alternatives or every lifecycle case.

### Historical 1.0.97 verification

The original checks passed locally, along with `verifyMorpheDesktopImport` (31 patches,
8 apps). The bundle is `patches/build/libs/patches-0.13.0.mpp`; no release version
was changed. Morphe Desktop 1.19.0 separately applied and rebuilt both alternatives
without failed patches:

- `../Apps/Monet/monet-1.0.97-premium-unsigned.apk`
- `../Apps/Monet/monet-1.0.97-premium-experimental-unsigned.apk`

Both rebuilt APKs retain all 8,514 classes without duplicates, pass all sixteen
premium-state cases, preserve all 673 non-DEX/non-signature file contents, and
pass `zipalign -c -v 4`. `apksigner verify` reports the expected missing
`META-INF/MANIFEST.MF`: these validation outputs are deliberately unsigned.
Build and Desktop reports are under `../.inspect-monet-1.0.97/`.

Device checks remain necessary: cold startup with no previous purchase, premium
customization, a billing reconnect/refresh, process restart and license refresh.
Neither APK was signed, installed or tested on a device. No older-version fixture,
mapping or compatibility entry is added.
