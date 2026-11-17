# Opera Beta 104 custom build - patch ledger

Generated for build **v14**. This file is the single source of
truth for what the build contains. `patches/apply.py` enforces every
entry at build time (anchor must match) AND re-verifies every entry on
the re-assembled output - a patch can no longer be silently lost, the
way v9 lost the v7 patch set.

Total patches: **44** (40 enabled, 4 disabled)

## adblock (5)

| ID | Patch | Since | Enabled | Target |
|---|---|---|---|---|
| PD.9 | Select all custom blocklists (39, no opera_fixes/allow-rules) | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| AB.1 | f9: hash->maintainer URL map + u()/v() helpers | v14 | **NO** | `f9.smali` |
| AB.2 | f9: fetch URL resolved via u() (maintainer, CDN fallback) | v14 | **NO** | `f9.smali` |
| AB.3 | cv2: response body gzip-normalized (engine expects .gz) | v14 | **NO** | `cv2.smali` |
| AB.4 | lj3.b: checksum gate accepts live upstream content | v14 | **NO** | `lj3.smali` |

## appearance (1)

| ID | Patch | Since | Enabled | Target |
|---|---|---|---|---|
| PA.1 | k15.a()Z -> true (entitlement gate) | v14 | yes | `k15.smali` |

## core (3)

| ID | Patch | Since | Enabled | Target |
|---|---|---|---|---|
| P1 | Skip first-run onboarding (a()Z -> true) | v14 | yes | `com/opera/android/OperaApplication.smali` |
| P6 | SplashView white background | v14 | yes | `com/opera/android/custom_views/SplashView.smali` |
| P7 | Splash spinner never shown | v14 | yes | `ssi.smali` |

## ntp (1)

| ID | Patch | Since | Enabled | Target |
|---|---|---|---|---|
| PN.1 | Partner speed-dial component never applied (y2g) | v14 | yes | `y2g.smali` |

## privacy (19)

| ID | Patch | Since | Enabled | Target |
|---|---|---|---|---|
| PD.0 | SettingsManager ctor .registers 15 -> 16 | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| P2.1 | Default off: vpn_pro_in_app_notification | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| P2.2 | Default off: wallpaper_in_app_notification | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| P2.3 | Default off: feedback_in_app_notification | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| P2.4 | Default off: product_and_service_in_app_notification | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| P2.5 | Default off: feature_tips_notification | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| P2.6 | Default off: rewards_notifications | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| P2.7 | Default off: esim_notifications | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| P2.8 | Default off: enable_rewards | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| P2.9 | Default off: enable_product_suggestion | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| PD.1 | Default: ad_blocking = Ad blocker ON by default (stock 0) | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| PD.2 | Default: ga_usage_statistics = Usage reports OFF (stock 1) | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| PD.3 | Default: enable_trending_searches = Trending searches OFF (stock 1) | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| PD.4 | Default: banner_blocker = Tracker blocker ON (stock 0) | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| PD.5 | Default: dns_over_https_enabled = Secure DNS ON (stock 0) | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| PD.6 | Default: dns_over_https_mode = Secure DNS mode custom/choose (stock 0) | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| PD.7 | Default: ad_blocking_mode = Ad-block mode = CUSTOM (stock 0) | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| PD.8 | Cookies default: enabled, excluding third-party | v14 | yes | `com/opera/android/settings/SettingsManager.smali` |
| PD.10 | Data collection toggles grayed out (sb6) | v14 | yes | `sb6.smali` |

## toolbar (3)

| ID | Patch | Since | Enabled | Target |
|---|---|---|---|---|
| PT.1 | Menu row: Rewards never added (bo3, v14 verifier-safe) | v14 | yes | `bo3.smali` |
| PT.2 | Notification settings: 7 promo rows hidden (rqd) | v14 | yes | `rqd.smali` |
| PT.3 | Settings menu: default-browser row removed (bo3, v14 verifier-safe) | v14 | yes | `bo3.smali` |

## vpn (12)

| ID | Patch | Since | Enabled | Target |
|---|---|---|---|---|
| P3 | pfn.S()V -> return-void (VPN upsell banner) | v14 | yes | `pfn.smali` |
| P4 | d37.B(): rewards menu item never added | v14 | yes | `d37.smali` |
| P5 | d37.B(): eSIM menu item never added | v14 | yes | `d37.smali` |
| P5b | d37.B(): additional gated menu rows never added | v14 | yes | `d37.smali` |
| P5c | d37.B(): wol.l row never added | v14 | yes | `d37.smali` |
| PV.1 | Non-free VPN locations removed (cnk.a -> EMPTY_LIST) | v14 | yes | `ldn.smali` |
| PV.2 | VpnProBanner hidden (zfn) | v14 | yes | `zfn.smali` |
| PV.3 | cgn.J0(Luvg;I)V -> return-void | v14 | yes | `cgn.smali` |
| PV.4 | p12.n() -> null (feature provider off) | v14 | yes | `p12.smali` |
| PV.5 | EsimTimeZoneChangeReceiver.onReceive -> return-void | v14 | yes | `com/opera/android/esim/EsimTimeZoneChangeReceiver.smali` |
| PV.6 | VPN settings: restore/account button removed (zfn) | v14 | yes | `zfn.smali` |
| PV.7 | VPN settings: reactivate + upsell banners GONE (zfn) | v14 | yes | `zfn.smali` |

## Build pipeline guarantees

1. `patches/apply.py apply` - every anchor must match exactly N times,
   else the build aborts before assembly.
2. Class-set equality vs stock dexes after reassembly.
3. `patches/apply.py verify` - the produced dexes are re-disassembled
   and every patch postcondition is re-checked on the REAL output.
4. `scripts/verify_v9.py` - structural checks on the signed APK
   (all 45,244 classes, z4, manifest, services, arsc/.so stored).
5. Signer certificate pinned to the v9/v10 key (SHA-256
   62:C9:FA:6F:DA:E6:82:66:29:93:A5:AB:41:7C:71:17:79:D1:A0:BC:
   8F:F6:43:E4:4D:E5:20:11:87:A9:6A:DF) - in-place upgrades.
6. This ledger + patches/manifest.json are committed to git and
   uploaded with every release (patch-bundle zip).

## Adblock asset pipeline (NOT used since v12)

- v11's asset surgery (rebuilding assets/op/abp.manifest) corrupted the
  ADBLOCK_CSS section count and caused the v11 startup crash. Since v12
  the build ships the STOCK v9/v10 asset layer byte-identical - this
  module is kept for reference only and is not part of the build.
- The acceptable-ads behavior is preserved by PD.9 simply not selecting
  the allow-rule lists; nothing is edited inside the asset layer.

## v13 note: AB.1-AB.4 disabled (the v12 startup crash)

The four v12 updater patches (maintainer-direct blocklist updates) are
DISABLED in v13 and f9/cv2/lj3 are reverted to stock. Root cause of the
v12 ~5 s white-screen crash (2026-11-16 Mixture-of-Experts analysis):
the resolver k9d pairs every downloaded file with its manifest entry by
the sha256 of the file CONTENT, so AB.4's live-maintainer bytes stored
under the manifest-hash name can never pair - the file is deleted as
stale, the entry stays missing, and the list is re-downloaded on every
resolve pass (each launch). AB.3 additionally buffers each full response
body in RAM outside cv2's try/catchall (only IOExceptions are caught;
an OOM Error escapes uncaught), and with 27 unbundled lists selected by
PD.9 the first startup pass alone can kill the process. The feature
returns in v14 with an invariant-respecting design. Full details in the
MoE report and PATCH-NOTES-v13.md.
