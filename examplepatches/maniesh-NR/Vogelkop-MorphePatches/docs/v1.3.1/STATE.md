# STATE — Morphe × Opera Beta patch (v1.3.1)

**Target:** Opera Beta 104.0.5262.91143 (base.apk sha256
`cea71c13388af85fbd2152957878c7bb39923c877e15293812b1064854c2e85d`)

**Repo:** `github.com/maniesh-NR/Vogelkop-MorphePatches` (private)

**Distro:** GitHub Release `sandbox-storage`

## v1.3.1 changelog

| # | Patch | Status |
| --- | --- | --- |
| 01 | Spoof app signature | **REMOVED** (was the v1.3.0 crash cause) |
| 02a | WelcomeActivity T&C bypass | NEW |
| 02b | r65.l(Z)Z → always false (CMP consent) | NEW |
| 02c | mm6 default-browser dialog bypass | NEW |
| 03a | Manifest: strip 3 VPN Pro components | NEW |
| 03b | wdn.a()Z → always false (VPN Pro feature gate) | NEW |
| 03c | strings.xml: blank 5 VPN Pro strings | NEW |
| 03z | (workaround) mbridge MBCommonActivity negative-theme fixup | NEW |
| — | (existing v1.3.0 patches: analytics removal, sponsored Speed Dial removal, ad permission removal) | unchanged |

## v1.3.1 patch artifacts in this directory

| File | Purpose |
| --- | --- |
| `patches/01-disable-spoof/README.md` | rationale for dropping the spoof patch |
| `patches/02-skip-firstrun-dialogs/README.md` | overview of the 3 first-run dialog patches |
| `patches/02-skip-firstrun-dialogs/02a-welcome-tc.md` | exact smali diff for WelcomeActivity |
| `patches/02-skip-firstrun-dialogs/02b-cmp-consent.md` | exact smali diff for r65.l |
| `patches/02-skip-firstrun-dialogs/02c-default-browser-dialog.md` | exact smali diff for mm6.e |
| `patches/03-remove-vpn-pro/README.md` | overview of the 3 VPN Pro removal patches |
| `patches/03-remove-vpn-pro/03a-manifest.md` | exact manifest diff |
| `patches/03-remove-vpn-pro/03b-wdn-feature-gate.md` | exact smali diff for wdn.a |
| `patches/03-remove-vpn-pro/03c-resource-strings.md` | exact strings.xml diff |
| `apply_v131_patches.py` | idempotent script that applies all v1.3.1 patches |
| `Opera_Beta_104.0.5262.91143_v1.3.1_base_signed.apk` | smoke-tested patched **base.apk only** (v3-signed) |
| `morphe.keystore` | fresh keystore (the original was lost with the previous sandbox) |
| `HANDOFF.md` | what the user needs to do to release v1.3.1 |

## Smoke test results (this sandbox, 2026-11-10)

| Step | Result |
| --- | --- |
| apktool d base.apk | ✓ (7 dex, 45,244 smali files) |
| apply_v131_patches.py | ✓ (all 6 patches + 1 workaround applied, idempotent) |
| apktool b beta_base_patched | ✓ (all 7 dex assembled, APK built) |
| zipalign -p -f 4 | ✓ |
| apksigner sign (v1+v2+v3 enabled, min-sdk 29) | ✓ (v3 applied; v1/v2 not, see HANDOFF) |
| apksigner verify | ✓ Verifies |
| unzip -t | ✓ No errors detected |
| APK size | 147,004,228 bytes (≈140 MiB) |
| APK sha256 | `1ec93ab66d5d679cb81814a05ec061c21fcfa7ec680b6ff2af6d7c531b4f6384` |

The smoke test proves: all v1.3.1 smali patches assemble cleanly, the
patched tree rebuilds end-to-end, and the resulting APK is structurally
valid and signed.

## What was NOT done in this sandbox

1. **On-device boot test.** The sandbox has no Android emulator/device. The
   v1.3.0 bisect matrix proved C1 (all patches minus spoof) boots; v1.3.1
   is C1 + first-run-dialog patches + VPN Pro removal. None of the v1.3.1
   additions touch the Application class hierarchy or any other component
   whose failure mode is instant SIGSEGV, so a boot test is expected to
   pass — but it must be done on a real device before release.
2. **Full .apkm merge + sign.** Only `base.apk` was patched and signed
   here. The 23 `split_config.*.apk` and 16 `split_pangle_ads*.apk` files
   in the original `.apkm` were not re-merged. The user's Vogelkop
   `build_bisect.sh` script does the merge.
3. **Push to Vogelkop repo / upload to sandbox-storage release.** The
   sandbox has no GitHub PAT (the previous fine-grained PAT was revoked or
   expired with the previous sandbox). See HANDOFF.md.

## v1.3.0 → v1.3.1 diff at a glance

```
- (01) Spoof app signature                              [REMOVED — crash cause]
+ (02a) WelcomeActivity T&C bypass                      [NEW]
+ (02b) r65.l(Z)Z → false                               [NEW]
+ (02c) mm6 default-browser dialog bypass               [NEW]
+ (03a) Manifest: strip 3 VPN Pro components            [NEW]
+ (03b) wdn.a()Z → false                                [NEW]
+ (03c) strings.xml: blank 5 VPN Pro strings            [NEW]
+ (03z) mbridge MBCommonActivity theme fixup            [NEW workaround]
```

## Known limitations carried into v1.3.1

* **Opera's built-in adblocker** still only blocks ~23% of EasyList-style
  rules (vs uBlock's 90%+). Documented in v1.3.0; not addressed here.
  Possible v1.4.x work: replace Opera's adblock engine or wire uBlock
  filters into Opera's URL resolver.
* **Spoof is gone.** If a future feature needs signature spoofing (e.g.,
  Google Play Billing on the patched APK), it requires a new
  `AppComponentFactory`-based hook design — see
  `patches/01-disable-spoof/README.md` "Future work" section.
* **VPN Pro strings in localized `values-<lang>/strings.xml`** are not
  blanked. Only the default `values/strings.xml` is patched. If a future
  build surfaces localized "VPN Pro" text in a straggler code path, expand
  `patch_03c` to all `values-*` directories.
