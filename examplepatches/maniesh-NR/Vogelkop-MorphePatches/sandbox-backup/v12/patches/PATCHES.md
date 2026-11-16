# Opera Beta 104 custom build - patch ledger

Generated for build **v12**. This file is the single source of
truth for what the build contains. `patches/apply.py` enforces every
entry at build time (anchor must match) AND re-verifies every entry on
the re-assembled output - a patch can no longer be silently lost, the
way v9 lost the v7 patch set.

Total patches: **44**

## adblock (5)

| ID | Patch | Since | Target |
|---|---|---|---|
| PD.9 | Select all custom blocklists (39, no opera_fixes/allow-rules) | v12 | `com/opera/android/settings/SettingsManager.smali` |
| AB.1 | f9: hash->maintainer URL map + u()/v() helpers | v12 | `f9.smali` |
| AB.2 | f9: fetch URL resolved via u() (maintainer, CDN fallback) | v12 | `f9.smali` |
| AB.3 | cv2: response body gzip-normalized (engine expects .gz) | v12 | `cv2.smali` |
| AB.4 | lj3.b: checksum gate accepts live upstream content | v12 | `lj3.smali` |

## appearance (1)

| ID | Patch | Since | Target |
|---|---|---|---|
| PA.1 | k15.a()Z -> true (entitlement gate) | v12 | `k15.smali` |

## core (3)

| ID | Patch | Since | Target |
|---|---|---|---|
| P1 | Skip first-run onboarding (a()Z -> true) | v12 | `com/opera/android/OperaApplication.smali` |
| P6 | SplashView white background | v12 | `com/opera/android/custom_views/SplashView.smali` |
| P7 | Splash spinner never shown | v12 | `ssi.smali` |

## ntp (1)

| ID | Patch | Since | Target |
|---|---|---|---|
| PN.1 | Partner speed-dial component never applied (y2g) | v12 | `y2g.smali` |

## privacy (19)

| ID | Patch | Since | Target |
|---|---|---|---|
| PD.0 | SettingsManager ctor .registers 15 -> 16 | v12 | `com/opera/android/settings/SettingsManager.smali` |
| P2.1 | Default off: vpn_pro_in_app_notification | v12 | `com/opera/android/settings/SettingsManager.smali` |
| P2.2 | Default off: wallpaper_in_app_notification | v12 | `com/opera/android/settings/SettingsManager.smali` |
| P2.3 | Default off: feedback_in_app_notification | v12 | `com/opera/android/settings/SettingsManager.smali` |
| P2.4 | Default off: product_and_service_in_app_notification | v12 | `com/opera/android/settings/SettingsManager.smali` |
| P2.5 | Default off: feature_tips_notification | v12 | `com/opera/android/settings/SettingsManager.smali` |
| P2.6 | Default off: rewards_notifications | v12 | `com/opera/android/settings/SettingsManager.smali` |
| P2.7 | Default off: esim_notifications | v12 | `com/opera/android/settings/SettingsManager.smali` |
| P2.8 | Default off: enable_rewards | v12 | `com/opera/android/settings/SettingsManager.smali` |
| P2.9 | Default off: enable_product_suggestion | v12 | `com/opera/android/settings/SettingsManager.smali` |
| PD.1 | Default: ad_blocking = Ad blocker ON by default (stock 0) | v12 | `com/opera/android/settings/SettingsManager.smali` |
| PD.2 | Default: ga_usage_statistics = Usage reports OFF (stock 1) | v12 | `com/opera/android/settings/SettingsManager.smali` |
| PD.3 | Default: enable_trending_searches = Trending searches OFF (stock 1) | v12 | `com/opera/android/settings/SettingsManager.smali` |
| PD.4 | Default: banner_blocker = Tracker blocker ON (stock 0) | v12 | `com/opera/android/settings/SettingsManager.smali` |
| PD.5 | Default: dns_over_https_enabled = Secure DNS ON (stock 0) | v12 | `com/opera/android/settings/SettingsManager.smali` |
| PD.6 | Default: dns_over_https_mode = Secure DNS mode custom/choose (stock 0) | v12 | `com/opera/android/settings/SettingsManager.smali` |
| PD.7 | Default: ad_blocking_mode = Ad-block mode = CUSTOM (stock 0) | v12 | `com/opera/android/settings/SettingsManager.smali` |
| PD.8 | Cookies default: enabled, excluding third-party | v12 | `com/opera/android/settings/SettingsManager.smali` |
| PD.10 | Data collection toggles grayed out (sb6) | v12 | `sb6.smali` |

## toolbar (3)

| ID | Patch | Since | Target |
|---|---|---|---|
| PT.1 | Menu row: Rewards never added (bo3) | v12 | `bo3.smali` |
| PT.2 | Notification settings: 7 promo rows hidden (rqd) | v12 | `rqd.smali` |
| PT.3 | Settings menu: default-browser row removed (bo3) | v12 | `bo3.smali` |

## vpn (12)

| ID | Patch | Since | Target |
|---|---|---|---|
| P3 | pfn.S()V -> return-void (VPN upsell banner) | v12 | `pfn.smali` |
| P4 | d37.B(): rewards menu item never added | v12 | `d37.smali` |
| P5 | d37.B(): eSIM menu item never added | v12 | `d37.smali` |
| P5b | d37.B(): additional gated menu rows never added | v12 | `d37.smali` |
| P5c | d37.B(): wol.l row never added | v12 | `d37.smali` |
| PV.1 | Non-free VPN locations removed (cnk.a -> EMPTY_LIST) | v12 | `ldn.smali` |
| PV.2 | VpnProBanner hidden (zfn) | v12 | `zfn.smali` |
| PV.3 | cgn.J0(Luvg;I)V -> return-void | v12 | `cgn.smali` |
| PV.4 | p12.n() -> null (feature provider off) | v12 | `p12.smali` |
| PV.5 | EsimTimeZoneChangeReceiver.onReceive -> return-void | v12 | `com/opera/android/esim/EsimTimeZoneChangeReceiver.smali` |
| PV.6 | VPN settings: restore/account button removed (zfn) | v12 | `zfn.smali` |
| PV.7 | VPN settings: reactivate + upsell banners GONE (zfn) | v12 | `zfn.smali` |

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

## Adblock asset pipeline (patches/adblock/asset_pipeline.py)

- Fetches all catalog lists from https://blocklists.operacdn.com/<sha256>
  (content-addressed, hash-verified).
- Rebuilds assets/op/abp.manifest without `opera_fixes` (Opera site
  fixes - removed from the settings menu) and without
  `tier1_allow_rules` / `tier2_allow_rules` (acceptable-ads whitelist,
  removed completely).
- Bundles all 41 fresh list files into assets/abp_files/op/ so every
  list works fully offline from first launch - no post-install update.
- Manifest structure validated by walking region A (41 entries) and the
  metadata region (41 entries, exact byte-length framing).
