# v1.3.1 binary build pipeline (E-rung)

Replaces the apktool `d → apply_v131_patches.py → b` pipeline. That pipeline
produced builds (base_signed, D0, D1) that passed every host-side check but
were rejected by the device package installer ("There was a problem parsing
the package"); the only systematic difference from the device-proven
B0/B0b/C1 builds was the aapt2-recompiled resources / re-serialized
manifest lineage. The E-rung never decodes or recompiles anything: all edits
are equal-length byte edits on a device-proven substrate.

## Substrates

| Rung | Substrate | Content |
| --- | --- | --- |
| E1 | stock `base.apk` + 46 splits, APKEditor 1.4.9 `m -i merge_in -o out` (the B0b method) | v1.3.1 patches only, on stock Opera |
| E2 | `C1-morphe-v130-nospoof-v123.apk` from this release (device-proven) | all v1.3.0 Morphe patches (minus spoof) + all v1.3.1 patches — the FULL v1.3.1 |

## Build

```bash
# prerequisites: python3 (+androguard), zipalign/apksigner (build-tools),
# APKEditor 1.4.9 (E1 only)

# E1 substrate (skip if you already have C1 for E2):
mkdir -p work/merge_in
cp <extracted .apkm>/base.apk work/merge_in/
cp <extracted .apkm>/split_*.apk work/merge_in/
java -Xmx3g -jar APKEditor.jar m -i work/merge_in -o work/E1_merged.apk

# patch + align + sign (either substrate):
python3 scripts/v131_binary_patch.py --inspect  work/<substrate>.apk   # dry-run anchors
python3 scripts/v131_binary_patch.py --patch   work/<substrate>.apk work/patched.apk
zipalign -f -p 4 work/patched.apk work/aligned.apk
apksigner sign --ks morphe.keystore --ks-pass pass:Morphe \
  --ks-key-alias morphe --key-pass pass:Morphe \
  --v1-signing-enabled true --v2-signing-enabled true \
  --v3-signing-enabled true --out work/signed.apk work/aligned.apk

# validate:
python3 scripts/validate_build.py work/signed.apk work/<substrate>.apk
```

`v131_binary_patch.py` is assert-before-write: every edit first verifies the
expected original bytes (method heads, invoke+move-result shapes, manifest
component names, string-pool footprints) and exits non-zero on any mismatch.
DEX adler32 + SHA-1 are recomputed after patching. The rewritten zip keeps
each entry's original compression (resources.arsc must be and stays STORED)
and drops stale `META-INF` signature files before re-signing.

## What each patch does at byte level

| Patch | Edit |
| --- | --- |
| 02a (×4 sites) | `invoke{SettingsManager.i}` (3u) + `move-result vN` (1u) → `const/4 vN,0x1` + 3×`nop` |
| 02b | `r65.l(Z)Z` head: `const/4 v0,0x1` → `const/4 v0,0x0; return v0` (rest becomes dead code) |
| 02c | `invoke-interface{getBoolean}` (3u) + `move-result v13` (1u) → `const/4 v13,0x0` + 3×`nop` |
| 03a | binary AXML: cut the 3 VpnPro element chunks, fix top-level size (string pool untouched) |
| 03b | `wdn.a()Z` head: `iget-boolean v0,p0,…` → `const/4 v0,0x0; return v0` |
| 03c | string pool: overwrite the 5 vpn_pro values in place with `" "` — all locales |

## Verification checklist (all must pass)

`validate_build.py` covers: zip integrity, CRC-level entry diff vs substrate
(only `AndroidManifest.xml`, `classes3.dex`, `resources.arsc` may differ),
manifest (0 VpnPro components, free `VpnReceiver` kept, no
`isSplitRequired`/`requiredSplitTypes`/`<split>`), arsc (5 strings read back
as `" "` in every config), and androguard bytecode proofs for every patched
method. Additionally run: `apksigner verify --min-sdk-version 24 --verbose`
(v2+v3 true), `zipalign -c -p 4`, `aapt dump badging`, `unzip -t`.

## Install requirements

* Android 10+ (minSdk 29 — an Android 9 device cannot install this app at
  all, patched or not)
* uninstall any previous Morphe/ladder build first (APK signing key rotated
  on 2026-11-10)
* verify the sha256 before installing (see SHA256SUMS.txt on the release)
