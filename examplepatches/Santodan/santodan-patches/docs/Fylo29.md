# Fylo File Manager 2.9

Package `com.aeroloom.fylofilemanager`, version **2.9**, versionCode **22**,
minSdk 32, targetSdk 36. Supplied as the replacement original; the earlier 2.6
input is no longer in the workspace.

## Inputs and provenance

- Complete original archive: `E:/Morphe/OriginalApps/Fylo-File-Manager_2.9.apks`
  (SHA-256 `54bb8a934f9bfa1ddffc334fb8a116d4e9f23e3ffcc338b2682b9c2cc9a27e15`).
- Extracted original splits used by the DEX verifiers:
  `E:/Morphe/OriginalApps/Fylo/2.9/`, containing `base.apk`,
  `split_config.arm64_v8a.apk`, `split_config.en.apk`, `split_config.xxhdpi.apk`.
- Base SHA-256: `c8acd8440192435937323a47df14c848718fea86d5ad51566848fbd566ebbf2e`.
  The base carries three DEX files (2.6 carried four).
- Evidence: `E:/Morphe/Skills/inspection-evidence/.inspect-fylo-2.9/`.

The upstream Morning Entree 1.9 `Enable Pro` patch returned true from
`DebugFeatureUnlock.isActive(Context)` and depended on a Pairip patch. That class
is absent from 2.9, as it was from 2.6. This implementation matches the local
billing StateFlow flow structurally; no 1.9 hooks were reintroduced.

## Alternatives

- **Fylo - Enable Pro**: version-pinned to 2.9, and additionally pinned to the
  reviewed 2.9 method descriptors.
- **Fylo - Enable Pro (Experimental, any version)**: no version restriction. It
  uses the same structural billing contract without requiring reviewed class or
  method names, so it also covers the earlier 2.6 layout and future releases that
  keep the contract. An unrestricted target permits trying future releases; it
  does not imply their structure or behavior is supported. Missing, ambiguous,
  changed or already-patched layouts fail before mutation.

Both are optional and disabled by default. Select only one. The two produce a
byte-identical APK on 2.9.

## Reviewed native contract

The billing owner is the class whose `<init>(Landroid/content/Context;)V`
references the `fylo_billing` shared-preferences name; on 2.9 that is `Ljm1;`.
The native `Lr3f;` enum (superclass `Ljava/lang/Enum;`) constructs `NONE`,
`MONTHLY`, `YEARLY`, `LIFETIME`; `Lr3f;->d` is proven to be the `NONE` singleton
from its static initializer (string `NONE`, `invoke-direct`, `sput-object` wired
through the matched registers).

The Pro boolean is a `pro = (entitlement != NONE)` diamond whose boxed result is
wrapped in a StateFlow and stored in `Ljm1;->g:Lubi;` (the field has exactly one
`iput-object` writer across all DEX). The diamond has the same backbone at
startup and refresh:

```
IF_EQ a, b -> P-1        ; a or b is the NONE singleton
... pro path assigns the result register 1 ...
GOTO -> P                ; at P-2, skipping the NONE path
P-1: write result = 0    ; the IF_EQ taken target (NONE / false path)
P:   INVOKE_STATIC Boolean.valueOf(Z){result}
```

- Seed: in `Ljm1;-><init>(Landroid/content/Context;)V` the NONE/false path is
  `move v12, v3` (v3 seeded 0) at list index **210**; it is rewritten to
  `const/4 v12, 1`. The boxed boolean then flows `valueOf -> StateFlow factory
  (Lz9g;->a) -> iput Ljm1;->g`. The pro path (`move v12, v6`, v6 seeded 1),
  branch, boxing, factory and field write are unchanged.
- Refresh: `Ljm1;->p(Lr3f;Ljava/lang/String;)V` (public final instance, params
  `(Lr3f;, String)`, returns void) reads `Ljm1;->g`, recomputes the same diamond
  and republishes the boolean to the StateFlow. Its NONE/false path is
  `move v4, v3` (v3 seeded 0) at list index **10**; it is rewritten to
  `const/4 v4, 1`. Entitlement publication, vault clearing/writing, integrity
  verdicts and acknowledgements are retained, so the boolean stays true even when
  a refresh publishes `NONE`, without persisting a fabricated entitlement.

The matcher connects both methods through the same StateFlow field and NONE
singleton, validates the enum initializer, the diamond backbone (NONE/false path
immediately before `valueOf`, `goto` two before it targeting `valueOf`, the pro
path producing 1), the StateFlow factory signature, the single field writer, and
the refresh publication to that field. It requires a unique match across all
original DEX. The exact variant additionally requires the reviewed descriptors
`Ljm1;-><init>(Landroid/content/Context;)V` and `Ljm1;->p(Lr3f;Ljava/lang/String;)V`.

`Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V`
is a public static method (three registers), called by the Pairip Application and
LicenseContentProvider at launch. A leading `return-void` skips the launch license
check; the remaining body and all other Pairip methods are intact. If the client
class is present, a unique original supported entry is required; future APKs
without that class need no launch-check mutation.

## Verification and delivery

From the repository, using Java 21 and Android SDK 36:

```powershell
.\build-local.ps1 :patches:verifyFylo :patches:verifyFyloBundle
.\build-local.ps1 :patches:generatePatchesList :patches:verifyAndroidBundle
.\build-local.ps1 :patches:verifyMorpheDesktopImport
.\build-local.ps1 :patches:verifyFyloApk
.\build-local.ps1 :patches:verifyFyloApk -PfyloApk=../../Apps/Fylo/Fylo-2.9-pro-experimental-unsigned.apk
```

`verifyFylo` checks unique real-input matching, invalid-input rejection, the
actual boolean diamond for NONE and owned states at startup/refresh, and DEX
write/reload. `verifyFyloBundle` loads and applies each public alternative
separately, checks its version metadata, serializes/reloads all hooks and checks
the complete class set for omissions/duplicates. `verifyFyloApk` audits every
original method in the delivered rebuild and permits only the two boolean
substitutions and the Pairip entry.

Delivery with Morphe Desktop 2.3.0 CLI, selecting one Fylo patch exclusively and
using `--unsigned`:

- `E:/Morphe/Apps/Fylo/Fylo-2.9-pro-unsigned.apk`
- `E:/Morphe/Apps/Fylo/Fylo-2.9-pro-experimental-unsigned.apk`

These are validation outputs and must be signed before installation. No signing,
installation, launch or device feature tests were performed. When testing, check
cold launch, normal Pro feature entry, billing refresh/restore without a purchase,
and force-stop/restart. No Google Play purchase or server entitlement is created.

Both alternatives produced a byte-identical APK on 2.9: SHA-256
`dfe04aa3cb52236ff942b8bd998f9571ec2759095e9f5fd7ee8f9ba1fb39fb65`. The
delivered-APK audit passed for all **36,909 classes**, permitting only the three
reviewed hook changes, with no added or removed classes. The merged rebuild still
identifies version 2.9 / 22 and the original package. The Pro flow has consumers
in MainActivity, AutomationJobService and native UI, DLNA, Shizuku and PC-server
paths; device checks are needed for actual features. No future Fylo APK has been
tested.
