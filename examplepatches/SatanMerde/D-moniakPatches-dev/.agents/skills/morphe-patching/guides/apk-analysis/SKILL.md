---
name: apk-analysis-workflow
description: Step-by-step APK analysis workflow for Morphe — preserve the input, inspect its complete container, decompile, extract every base DEX, find targets, and verify exact smali. Use when starting analysis of an authorized app.
---

# APK Analysis Workflow

Use only with software the user is authorized to analyze. Decompiled Java is for understanding;
smali is authoritative for fingerprints. Preserve the original package and complete split
container throughout the workflow.

## 1. Create the analysis workspace

```bash
APP="appname"
mkdir -p "analysis/$APP"/{apk,notes,decompiled,smali,builds}
cp -- "/path/to/package.apkm" "analysis/$APP/apk/"
```

Copy; never move, delete, or overwrite the user's original. Record its SHA-256. If an existing
workspace has another hash, stop and use a distinct app/version key.

## 2. Identify the package/container

For a plain APK:

```bash
aapt dump badging "analysis/$APP/apk/app.apk" | sed -n '1,5p'
unzip -Z1 "analysis/$APP/apk/app.apk" | rg '(^|/)classes([0-9]+)?\.dex$'
```

For APKM/APKS/XAPK, enumerate nested APKs and select a base-named APK only for metadata,
Java, and smali analysis. Preserve the full container as the later CLI input. Do not infer that an
extracted base APK contains code/resources/native libraries shipped in feature or config splits.

Optional protection detection:

```bash
uvx apkid "analysis/$APP/apk/<package>"
```

Do not install a missing tool automatically.

## 3. Determine app architecture and intended ApkFileType

```bash
unzip -Z1 "<base-apk>" | rg 'classes([0-9]+)?\.dex|index\.android\.bundle|libflutter\.so|libapp\.so|^lib/'
aapt dump xmltree "<base-apk>" AndroidManifest.xml | rg -i 'split|requiredSplit'
```

| Complete artifact users will patch | Recommended | Required/enforced |
|---|---|---|
| Single APK | `APK` | `APK_REQUIRED` |
| APKMirror APKM | `APKM` | `APKM_REQUIRED` |
| Bundletool APKS | `APKS` | `APKS_REQUIRED` |
| APKPure XAPK | `XAPK` | `XAPK_REQUIRED` |

Non-`_REQUIRED` values guide Manager UI; `_REQUIRED` rejects other input formats. A manifest
split declaration means a complete split container is needed, not specifically XAPK.

Architecture indicators:

- `assets/index.android.bundle`: React Native/Hermes; core logic may be JavaScript bytecode.
- `libflutter.so` + `libapp.so`: Flutter AOT; core Dart logic is native.
- packed/encrypted DEX: static analysis may be blocked; document rather than invent targets.

## 4. Decompile and extract smali

The Kaggle runner is the primary decompilation path (4 cores, 28 GB RAM) for large APKs. Explain
that the direct URL and downloaded APK are processed by Kaggle, obtain explicit approval, then run
the workspace `jadx-decompile` helper. Local jadx is the fallback for small APKs or when the user
declines remote:

```bash
jadx --deobf --show-bad-code --no-res -d "analysis/$APP/decompiled" "<base-apk>"
```

For each `classes*.dex` in the selected base APK:

```bash
TMP=$(mktemp -d)
unzip -j "<base-apk>" 'classes*.dex' -d "$TMP"
for dex in "$TMP"/classes*.dex; do
  name=$(basename "$dex" .dex)
  baksmali d "$dex" -o "analysis/$APP/smali/$name"
done
```

Clean only the temporary directory you created. The remote Kaggle path requires an explanation of
what APK/URL leaves the machine plus explicit approval before transmission.
Never place tokens in notes or workflow state.

## 5. Search for the requested behavior

```bash
# Billing/feature SDKs
rg -i 'revenuecat|adapty|qonversion|BillingClient|LicenseChecker' \
  "analysis/$APP/decompiled" -g '*.java' -l

# Local gates and ads
rg -i 'isPremium|isPro|isSubscribed|hasPremium|showAd|loadAd|InterstitialAd|MobileAds' \
  "analysis/$APP/decompiled" -g '*.java' -l
```

Trace app-owned consumers to the smallest stable client-side decision point. Do not broaden the
scope or pursue server-side payment, account, credential, entitlement, or attestation compromise.

## 6. Verify each candidate in smali

Search all DEX directories, then read the complete method:

```bash
rg -l 'getEntitlements|getActive' "analysis/$APP/smali"
rg -n -A 40 '^\.method ' "analysis/$APP/smali/classesN/path/Target.smali"
```

Record:

- DEX and smali path.
- Complete `.method` signature and exact access flags.
- Parameter and return descriptors.
- `.registers` or `.locals`.
- Ordered relevant instructions and referenced stable APIs.
- Intended patch point, uniqueness rationale, and limitations.

Access flags are exact in Morphe fingerprints: list every flag shown in smali. Never identify a
fingerprint with obfuscated app class/method/field names.

## 7. Write evidence

`notes/recon.md` records identity, package/version, SHA-256, container, selected base member, DEX
count, architecture, ABIs, protections, and missing tools. Use one additional note per target type.
Every viable target must state `Smali verified: YES` and include the exact evidence above.
Java-only candidates remain rejected/unverified and cannot advance to patch writing.

## Final layout

```text
analysis/<app>/
├── apk/          # preserved original APK/APKM/APKS/XAPK
├── notes/        # recon, findings, workflow state
├── decompiled/   # jadx output
├── smali/        # classes, classes2, ...
└── builds/       # later patched outputs
```
