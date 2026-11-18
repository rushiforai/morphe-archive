# MD PROXY VPN (com.vpnproxymd.mdproxyvpn)

A v2rayNG fork bundled with an SSH/OpenVPN tunnel stack, AdMob and a
voucher/session-time monetization layer. Supported version: v1.0.8.8
(versionCode 29).

The app keeps its `com.v2ray.ang` class names, but the MMKV helper class and
the R8-merged click-handler lambdas are renamed on every build. Patch targets
are located by content fingerprints (MMKV keys, format strings, GMS ad-load
calls), never by obfuscated names, and the Speed Boost rewrite resolves its
helper calls from the app's own bytecode at patch time.

## Unlimited Time

Sessions are metered by an MMKV `TimeLeft` value: 1 hour by default, reset to
10 minutes at connect when it runs low, and counted down by a service that
stops the VPN at zero. The patch makes the getter return 100 years, so the
reset never fires, and makes the countdown formatter show the infinity sign
instead of a day count. Vouchers and the rewarded-ad time top-up stay as they
are and become unnecessary.

## Remove Ads

Empties the four app-side ad loaders (banner coroutine, interstitial,
home rewarded, app-open) and NOPs the `RewardedAd.load` call inside the
server-row boost button. No ad request leaves the device afterwards; the
interstitial show sites are null-guarded in the app, so nothing crashes. The
server-row handler also routes server selection, so only the ad load is
neutralized, not the whole click handler.

## Unlock Speed Boost

The per-server boost is granted when an interstitial shows, and the app
re-shows that interstitial every 3 minutes while connected. The patch
rewrites the gate: a boost tap writes the selected server into the
`BoostedServer` MMKV list right away, with the same rocket badge and toast,
and the other callers of the gate return immediately, which silences the
periodic interstitial. Helper calls are resolved from the app's own bytecode
at patch time, so the rewrite survives R8 renames. Works together with
"Remove Ads".
