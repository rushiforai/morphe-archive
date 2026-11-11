# Patch 03 — Remove all VPN Pro menu items & mentions

The user-facing VPN Pro surface in Opera Beta 104.0.5262.91143 spans:

* System-level: Quick Settings tile service, App Widget, boot-completed
  receiver that auto-starts VPN Pro.
* In-app: main-menu VPN Pro banner, settings VPN Pro page (premium tab),
  VPN-settings upsell banners, "70% off VPN Pro for one week only" promo
  dialogs, free-VPN-Pro onboarding dialogs, in-app notifications, switch-to-
  VPN-Pro reminder dialogs, omnibox "Opera VPN Pro" suggestion chip.

The patch set removes all of the above by combining three layers:

| Layer | What it does | File |
| --- | --- | --- |
| 03a | Strip 3 component declarations from `AndroidManifest.xml` (system surfaces) | `03a-manifest.md` |
| 03b | Force `Lwdn;->a()Z` ("is VPN Pro supported?") to always return false | `03b-wdn-feature-gate.md` |
| 03c | Blank the most prominent VPN Pro user-visible string resources | `03c-resource-strings.md` |

## Why three layers

* **03a** removes the system installable surfaces (tile, widget, boot
  receiver). After this, the user cannot add a "VPN Pro" tile or widget from
  the system picker, and VPN Pro cannot auto-start on boot.
* **03b** makes Opera's own code think the device/account/region does not
  support VPN Pro. Every code path that asks `wdn.a()` short-circuits to
  "not supported" → no main-menu banner, no settings entry, no promo dialog
  is even considered. Callers verified by grep: `ggn`, `nlk`, `yvg`, `yi2`,
  `hlk` (the last is a debug logger only).
* **03c** is defense-in-depth: a handful of strings (`vpn_pro_title`, the
  70%-off promo) are blanked in the default-language `strings.xml` so that
  any straggler code path that does not consult `wdn.a()` still produces no
  visible "VPN Pro" text.

## What is NOT touched

* The **free Opera VPN** (no "Pro") is a separate feature, gated on
  `Lvdn;` not `Lwdn;`. It is left fully functional.
* The VPN settings page itself is still reachable; only the VPN-Pro-specific
  banners and entries inside it are suppressed (by 03b).
* `VpnReceiver` (the free VPN's receiver, line 507 of the manifest) is left
  in place.

## Recon evidence (collected against 104.0.5262.91143)

* `Lcom/opera/android/custom_views/VpnProBanner;` is referenced by 6 classes
  (`agn`, `cgn`, `e73`, `pt1`, `svi`, `zfn`) and inflated only from
  `res/layout/vpn_settings_info_premium.xml` and
  `res/layout/vpn_settings_info_free.xml` (the VPN settings pages).
* `MainMenuVpnProBannerState` exists only as a method-signature string in
  `r7d.smali`; the class itself was stripped by R8. The main-menu banner's
  actual visibility is gated upstream by `ggn`, which calls `wdn.a()`.
* 109 `vpn_pro*` string resources exist in `res/values/strings.xml`. Layer
  03c blanks the 5 most user-visible; the rest become dead resources once
  03a + 03b are in place.
