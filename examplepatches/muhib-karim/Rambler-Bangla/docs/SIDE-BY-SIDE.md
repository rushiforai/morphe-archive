# Rambler Bangla side-by-side build (com.aidev2024.ramblerbangla)

The experimental APK is rebuilt under its own package identity so it
installs **alongside** stock PixelBoard - no uninstall, no update-in-place
signer conflict.

- App display name: **Rambler Bangla**
- Package / application ID: **com.aidev2024.ramblerbangla**
- Intended public repo: **muhib-karim/Rambler-Bangla**
- Base: PixelBoard 18.3.1 experimental Bengali-Unicode build
  (input APK SHA-256 61e771bd92d62ca9415e05aa5a1d7a542add0d2806c1fa81acdd9c81831c8d36)

## What the rename touches

Driver: `rename/rename_apk.py` (helpers in `rename/axml_pool.py`).

| Layer | Rewrite |
|---|---|
| `AndroidManifest.xml` (binary AXML) | package attribute, 11 provider authorities, 2 declared permissions, 2 phenotype meta-data, deeplink host `deeplink.*`, feature meta-data values, app label. String-pool **content** rewrite only - indices, offsets and chunk sizes preserved. |
| `res/B_o.xml`, `res/IeH.xml` (binary AXML) | package references (same pool-safe rewrite). |
| `resources.arsc` | ResTable_package name field (fixed 256-byte UTF-16LE slot at chunk+12). |
| `classes.dex` | baksmali -> exact whole-string literal replace -> smali round-trip. 14 lines change, verified by full-tree diff: bare package (6 sites), 2 feature keys (2 sites each), the Gboard-whitelist sentence, `RENAMED_GBOARD_PACKAGE` / `GBOARD_PACKAGE_REVERSED_DEV` constants, 2 log `TAG`s. |
| ZIP | manual writer: stored entries 4-byte aligned (proper 0xFFFF extra TLV), `.so` page-aligned to 4096 (`android:extractNativeLibs="false"` requires this or install fails), stale JAR signature files dropped. |
| Signature | re-signed v2-only with a fresh dedicated key (`CN=Rambler Bangla (ai-dev-2024 experimental)`). v1 dropped deliberately - minSdk 32 makes JAR signing unnecessary. |

## Deliberately NOT renamed

- Extension class names `...extension.GboardPatchesSettingsActivity` /
  `...SettingsProvider` and the internal keys `...extension`,
  `...extension.extra.PATCHES_NAVIGATION_PATH`, `...tile.NAVIGATION_PATH`
  in `classes.dex`. These are in-app class identifiers and private
  SharedPreferences/extra keys; they are namespaced per installed app and
  cannot collide across packages. Renaming them would desynchronize the
  dex references for zero collision benefit.
- versionCode 176004238 / versionName 18.3.1.977415014-beta-arm64-v8a -
  kept identical so lineage to the base build is obvious.

## Verification results (final artifact)

- androguard parse: valid; package `com.aidev2024.ramblerbangla`;
  label `Rambler Bangla`; minSdk 32 / targetSdk 37.
- Provider-authority uniqueness vs the original APK: **zero collisions**
  (11/11 renamed).
- Component counts identical to base: 31 activities, 22 services,
  12 receivers, 11 providers, 19 uses-permission, 64 meta-data.
- Residual old-package scan: only the 3 intentional extension-key strings.
- classes.dex baksmali diff vs base: exactly the 14 intended string lines.
- ZIP: `unzip -t` clean; all stored entries 4-byte aligned and all `.so`
  page-aligned (checked against raw local headers).
- Signature: apksig `verified=true`, v2, signer
  `CN=Rambler Bangla (ai-dev-2024 experimental)`, cert SHA-256
  `5a59f77bbf88a2e6ef7344594837bb44b9bf4da98aa1f4c846bb65dc1de6c37b`.
- aapt2 badging matches: package, label, targetSdk 37, arm64-v8a.

## Reproduce

```
python3 rename/rename_apk.py \
  --in-apk  PixelBoard-18.3.1-Bengali-Unicode-experimental.apk \
  --out-apk rambler-bangla-unsigned.apk \
  --new-package com.aidev2024.ramblerbangla \
  --new-label "Rambler Bangla" \
  --workdir /tmp/rename-work --smali-cp "$SMALI_CP" \
  --report rename-report.json
# then sign with your own key (v2; see tools-src/MiniApkSigner.java)
```

Never distribute the stock Google/PixelBoard APK or upstream signing
keys; the public project ships this tooling, and each builder supplies
their own base APK and key.
