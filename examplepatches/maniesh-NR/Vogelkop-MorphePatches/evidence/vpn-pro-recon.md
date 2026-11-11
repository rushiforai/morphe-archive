# VPN Pro recon — Opera Beta 104.0.5262.91143 (2026-11-10)

Goal: remove every user-facing "VPN Pro" menu item / mention while keeping the
FREE Opera VPN fully functional.

## Raw counts (base.apk, 7 dex)

- Strings `VPN Pro` / `vpn_pro` / `VpnPro` / `vpnpro`: 12 hits across classes.dex,
  classes3.dex, classes4.dex.
- 53 classes reference `VpnPro|vpn_pro|VPN_PRO` (grep over baksmali).
- 109 `vpn_pro*` / `free_vpn_pro_*` string resources in `res/values/strings.xml`.
- 3 manifest components (see below).

## Key classes

| Class | Role |
| --- | --- |
| `Lwdn;` | "VPN Pro feature state" holder; `a()Z` = "is VPN Pro supported here?" — true only if remote-config bit0 (`tfn.a`) AND server flag (`jtg.b()`) AND kill-switch `vpn_pro.kill_switch.on` is off. Constructed in `vy`, `x53`, `ydn`. |
| `Lydn;` | VPN manager; `p()` returns the `Lwdn;`. |
| `Lggn;` | menu-state computer; consults `wdn.a()` to decide whether the VPN Pro menu banner state is selectable. |
| `Lcom/opera/android/custom_views/VpnProBanner;` | the banner custom view; inflated ONLY from `res/layout/vpn_settings_info_premium.xml` (vpn_reactivate_banner, vpn_upsell_promo_banner) and `vpn_settings_info_free.xml` (vpn_promo_banner). Referenced by agn/cgn/e73/pt1/svi/zfn (cgn = the settings fragment; others are lambdas/binders). |
| `Lr7d;` | holds string `updateBannerView(Lcom/opera/android/mainmenu/MainMenuVpnProBannerState;)V` — the MainMenuVpnProBannerState class itself was stripped by R8; only the reflective signature string remains. Main-menu banner visibility is gated upstream by `ggn` → `wdn.a()`. |
| `Lhlk;` | debug logger; writes "VpnPro: disabled by user / not supported / available / unavailable" + "vpn_pro.kill_switch.on". Harmless. |
| `VpnProReceiver`, `VpnProQuickSettingsTileService`, `VpnProAppWidget` | system surfaces (manifest). |

## Manifest components (base.apk lines)

- L508 `<receiver android:name="com.opera.android.vpn.VpnProReceiver">` + `BOOT_COMPLETED` filter.
- L523 `<service android:label="@string/vpn_pro_title" android:name="com.opera.android.vpn.quick_settings_tile.VpnProQuickSettingsTileService">` + QS_TILE filter + ACTIVE_TILE/TOGGLEABLE_TILE meta.
- L587 `<receiver android:label="@string/vpn_pro_title" android:name="com.opera.android.vpn.app_widget.VpnProAppWidget">` + APPWIDGET_UPDATE filter + `@xml/vpn_pro_widget_info`.
- L507 free-VPN `VpnReceiver` — deliberately untouched.

## Callers of `Lwdn;->a()Z` (all VPN-Pro-scoped, verified)

`ggn`, `nlk`, `yvg`, `yi2`, `hlk` (logger), `ydn` (internal).

## Pref keys observed (Context: vpn_pro.* lives in a dedicated SharedPreferences via `Lru9;`)

vpn_pro.kill_switch.on · vpn_pro.kill_switch.activated_timestamp ·
vpn.vpnpro_first_enable_timestamp · vpn.vpnpro_auto_connect · vpn.vpnpro_expected ·
vpn.vpnpro.upsell_banner_version · vpn.vpnpro.upsell_banner_closed ·
vpn.vpnpro.feedback_dialog_shown_count · vpn.vpnpro.quick_settings_tile_added ·
vpn.pro_adult_page_promo.show_count / show_timestamp · vpn_pro.reminder.show_count

## Strategy chosen (v1.3.1)

Three redundant layers (see patches 03a/03b/03c):

1. **03a manifest strip** — removes system-reachable surfaces (tile picker, widget
   picker, boot autostart).
2. **03b `wdn.a()Z` → false** — the load-bearing gate: every in-app VPN Pro surface
   (main-menu banner, settings premium tab, promo dialogs, omnibox chip, switch
   reminders) asks this method first; false = "not supported" = suppressed.
3. **03c string blanking** — default-locale `values/strings.xml` blanks for the 5 most
   visible strings, as defense-in-depth for any straggler path.

Not touched: the free VPN (`Lvdn;` gates), `VpnReceiver`, VPN settings page itself.

## Known gaps

- Localized `values-<lang>/strings.xml` still contain "VPN Pro" text. Unreachable via
  03b, but if a future build leaks a straggler path, extend 03c to all values-* dirs.
- `res/xml/vpn_pro_widget_info.xml` and the VpnPro* smali classes remain in the APK
  (unreferenced after 03a). Android never instantiates undeclared components; size
  cost is negligible versus the risk of over-pruning.
