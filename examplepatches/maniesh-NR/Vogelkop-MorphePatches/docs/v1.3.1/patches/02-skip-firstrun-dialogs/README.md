# Patch 02 — Skip first-run dialogs

Three first-run dialogs are shown on a fresh install / first launch of Opera
Beta. This patch set suppresses all three at their respective gate methods, so
the user lands directly on the start page without any interstitial.

| # | Dialog | Gate class | Gate method / pref | Patch |
| --- | --- | --- | --- | --- |
| 02a | Purple Terms & Conditions ("Next") | `com.opera.android.startup.WelcomeActivity` | `SettingsManager.i("eula_accepted.gdpr")` | force result `true` at 2 call sites |
| 02b | "Help us make Opera better" (Usercentrics CMP) | `r65` | `r65.l(Z)Z` reads `startup.request_cmp_consent` | force `r65.l(Z)Z` to return `false` |
| 02c | Set as default browser prompt | `mm6` | `mm6.e(ZLeej;Lqim;)V` reads `show_enable_default_browser_dialog_on_startpage` | force the dialog-branch guard `v13` to `0` |

## Net behavior after all three patches

* Welcome flow is fully bypassed → the "set as default browser" leaf page
  inside that flow is never reached, so 02c is mostly defense-in-depth for
  users who somehow exit the welcome flow early.
* Usercentrics CMP is never asked → under CMP default-deny semantics, every
  analytics/tracking switch that would have been gated on consent defaults
  to **off**. This is the desired behavior; the user does not have to opt out
  manually.
* No T&C acceptance pref is ever written — that's fine; the patched APK
  simply never consults it again, and the check is short-circuited anyway.

## Patch application order

Apply 02a, 02b, 02c in any order; they touch disjoint files.

## Verification

After build & install on a clean device profile:

1. Cold-start the patched APK.
2. Expect: straight to start page, no purple T&C screen, no "Help us make
   Opera better" sheet, no "Set Opera as default browser" prompt.
3. Open Settings → Privacy & security → "Help us make Opera better" should
   read as **off** without user action.
4. Reboot the device, cold-start again: still no first-run dialogs.
