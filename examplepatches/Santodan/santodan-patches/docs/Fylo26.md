# Fylo File Manager 2.6

Package `com.aeroloom.fylofilemanager`, version **2.6**, versionCode **19**,
minSdk 32, targetSdk 36. Extracted read-only from Google Play's installation on
`emulator-5554` on 2026-11-10. The installation was not replaced or modified.

## Inputs and provenance

- Complete original archive: `E:/Morphe/OriginalApps/Fylo/Fylo-2.6-play.apks`.
- Original signed files: `E:/Morphe/OriginalApps/Fylo/2.6/`, containing `base.apk`,
  `split_config.arm64_v8a.apk`, `split_config.en.apk`, `split_config.xxhdpi.apk`.
- Base SHA-256: `edb85dbccb9d4824007b928be59b1d632f4080b21ff5ee45043ddd5a6136db31`.
- Evidence: `E:/Morphe/Skills/inspection-evidence/.inspect-fylo-2.6/`, including
  original hashes, original DEX, instruction inventories, decompiled references,
  build logs and packaged-patch checks. DEX was extracted directly from the saved base.

The supplied upstream `dev` branch contains Ling and Sponge, not Fylo. Fylo's
reference implementation is on [Morning Entree main](https://github.com/Entree3k/Morning-Entree-Patches/tree/9e4c200e04f4ebb0e84eb4109ede58c6ddf4e847/patches/src/main/kotlin/morningentree/morphe/patches/fylo).
Its 1.9 `Enable Pro` patch returns true from
`DebugFeatureUnlock.isActive(Context)` and depends on a Pairip patch. That class
is absent from the 2.6 original. This implementation independently matches the
new local billing flow; no 1.9 hooks, compatibility targets or tests were added.

## Alternatives

- **Fylo - Enable Pro**: exact compatibility and execution guard for 2.6.
- **Fylo - Enable Pro (Experimental, any version)**: package-only compatibility,
  with a null version target marked experimental. It uses the same validated
  structural contract without requiring reviewed obfuscated class/method names.

Both are optional and disabled by default. Select only one. Selecting both fails
because the second cannot match the original boolean diamond after mutation.
An unrestricted version target permits trying future releases; it does not imply
their native structure or behavior is supported. Missing, ambiguous, changed or
already-patched layouts fail before mutation.

## Reviewed native contract

The `fylo_billing` constructor anchor identifies billing ownership. The native
`Lqte;` enum constructs `NONE`, `MONTHLY`, `YEARLY`, `LIFETIME`; `d` is proven to be
the `NONE` singleton from its original static initializer.

`Lce1;-><init>(Landroid/content/Context;)V` is an instance constructor with 12
registers. Its cached entitlement seeds `_isPro` by comparing against `NONE`, boxing
the boolean and creating a StateFlow stored in `Lce1;->h:Lq8c;`. Instruction 37,
`move v2, v1` (the false path, with v1 seeded to zero), becomes `const/4 v2, 1`.
The true path, branching, register count and instruction widths remain unchanged.

`Lce1;->a0(Lqte;Ljava/lang/String;)V` is a public final instance method with six
registers. It publishes entitlement, then publishes the comparison's boolean to
the same `_isPro` field. Instruction 7, `const/4 v2, 0`, becomes `const/4 v2, 1`.
It retains entitlement publication, vault clearing/writing, integrity verdicts,
token handling and purchase acknowledgements. The boolean therefore stays true
even when a refresh publishes `NONE`, without persisting a fabricated entitlement.
The Pro flow has consumers in MainActivity, AutomationJobService and native UI,
DLNA, Shizuku and PC-server paths; device checks are needed for actual features.

The matcher connects both methods through the same StateFlow field and `NONE`
singleton, validates enum initialization, register wiring, boolean seeds, branch
destinations, boxing and setter signatures, and requires a unique match across
all original DEX. Only the exact variant additionally requires reviewed method names.

`Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V`
is a public static method with three registers, called by the Pairip Application
and LicenseContentProvider at launch. A leading `return-void` skips the launch
license check. The remaining body and all other Pairip methods remain intact.
If Pairip's client class is present, an original unique supported entry is required;
future APKs without that class need no launch-check mutation.

## Verification and delivery

From the repository, using Java 21 and Android SDK 36:

```powershell
.\build-local.ps1 :patches:verifyFylo :patches:verifyFyloBundle
.\build-local.ps1 :patches:generatePatchesList :patches:verifyAndroidBundle
.\build-local.ps1 :patches:verifyMorpheDesktopImport -PmorpheDesktopJar=E:/Morphe/morphe-desktop-2.1.1-all.jar
.\build-local.ps1 :patches:verifyFyloApk
.\build-local.ps1 :patches:verifyFyloApk -PfyloApk=../../Apps/Fylo/Fylo-2.6-pro-experimental-unsigned.apk
```

`verifyFylo` checks unique real-input matching, invalid-input rejection, the actual
boolean diamond for NONE and owned states at startup/refresh, and DEX write/reload.
`verifyFyloBundle` loads and applies each public alternative separately, checks its
version metadata, serializes/reloads all hooks and checks the complete class set
for omissions/duplicates. `verifyFyloApk` audits every original method in the
delivered rebuild and permits only the two boolean substitutions and Pairip entry.

The bundle is `patches/build/libs/patches-0.17.0.mpp` (version unchanged).
Desktop 2.1.1 rebuilds use the complete original APKS as input, select only one
Fylo patch, and use `--unsigned`:

- `E:/Morphe/Apps/Fylo/Fylo-2.6-pro-unsigned.apk`
- `E:/Morphe/Apps/Fylo/Fylo-2.6-pro-experimental-unsigned.apk`

These are validation outputs. They must be signed before installation. No signing,
installation, launch or device feature tests were performed. When testing, check
cold launch, normal Pro feature entry, billing refresh/restore without a purchase,
and force-stop/restart. Keep native purchase and catalog screens distinct from
local Pro access; no Google Play purchase or server entitlement is created.

Both alternatives produced byte-identical APKs on 2.6: SHA-256
`e127212417ef526e08265aa380317cf5b6f6bcad6d164af55c7393e2a7bd79bc`.
The delivered-APK audit passed for all **43,330 classes**, permitting only the
three reviewed hook changes. All **10 native libraries** from the original base
and ARM64 split were retained byte-for-byte; ZIP CRC and 16 KiB page alignment
checks passed. The merged manifest still identifies version 2.6 / 19 and the
original package. Signature verification reports the expected missing signature
manifest for these deliberately unsigned outputs. Android bundle validation and
Desktop 2.1.1 import passed (**37 patches across 9 apps**).

The complete JADX export reported 73 decompilation errors in the app/dependencies;
the reviewed hook contracts and verification use the original DEX instructions,
not inferred decompiler output. No future Fylo APK has been tested.
