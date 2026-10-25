# Monet premium

The bundle provides two alternatives. Select **only one**:

- **Monet - Unlock premium** targets `com.klevico.monet` **1.0.97**.
- **Monet - Unlock premium (Experimental, any version)** has a null version
  target and experimental metadata. It attempts structural matching on any Monet
  version; it rejects unsupported layouts. Only 1.0.97 has been verified.

Both are disabled by default to avoid selecting both alternatives together.
Selecting both causes the second patch to reject the already-modified evaluator.

## Upstream reference and adaptation

Original premium unlock: [Doom's Patches (rushiranpise)](https://github.com/rushiranpise/morphe-patches/tree/36e542058f41bf49791cffe67e37beba8460a2ad/patches/src/main/kotlin/app/template/patches/monet/premium).
This port updates support to Monet 1.0.97; the experimental variant removes the
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

## Original input and native contract

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

## Verification

Run from the repository (the PowerShell execution policy may require invoking
the script through `powershell -NoProfile -ExecutionPolicy Bypass -File`):

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:verifyMonet :patches:verifyMonetBundle :patches:generatePatchesList
```

`verifyMonet` checks unique matching across the original APK, missing/ambiguous/
changed/already-patched rejection, mutation scope, all sixteen boolean input
combinations and DEX write/reload. `verifyMonetBundle` independently loads and
applies each alternative from the built `.mpp`, evaluates the serialized hook,
and reconstructs the full output class set to detect cross-DEX duplication/loss.

These checks passed locally, along with `verifyMorpheDesktopImport` (31 patches,
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
