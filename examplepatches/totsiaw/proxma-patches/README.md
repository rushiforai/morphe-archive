# Proxma Patches

Morphe patch bundle for **My Telenor**, **Investify**, **Simosa** (Jazz), **OLX**, **MTProxy**, **MyZong** (Zong), **NetMonster**, and **foodpanda**. See [Patches](#patches) below for the current list of apps, supported versions, and what each patch does.

## How to use

1. Install [Morphe Manager](https://morphe.software).
2. Add this source: https://morphe.software/add-source?github=totsiaw/proxma-patches
   (already added? open the source and tap **Update** / pull-to-refresh to get the latest version).
3. Pick your app, select the patches you want, tap **Patch**, then install the result.

> Patches target a specific app version (below). If your installed app is a different version, it won't match until that version is added.


## Patches

### Simosa (`com.jazz.jazzworld`)

_Supported version(s): 3.3.5, 3.3.4.2_

| Patch | Description |
|-------|-------------|
| **Auto check-in & claim daily reward** | Claims today's daily check-in and today's Daily Rewards rung on their own, once a day, a few seconds after the app has loaded them — no ad and nothing to tap. The missed-days restore and the day-10/20/30 milestone claim are untouched. |
| **Background daily check-in worker** | Runs the Simosa daily check-in from a 24-hour WorkManager job that this patch adds to the app, with two-tier token auth, stale-token retry, a per-account day latch and a status notification. |
| **Bypass signature verification** | Disables Simosa's anti-tamper signature check so a re-signed APK launches normally instead of stalling on the splash / "version is not correct" dialog. |
| **Dark theme (black background)** | Makes Simosa a dark app: screens, sheets, dialogs and menus use the dark palette (near-black background, light text) instead of the light one, including on Android 12+ where the app would otherwise take a light colour scheme from the wallpaper. The app's own red/orange branding and its white cards are left alone so text on them stays readable. |
| **Remove Shop, Social+ and Lifestyle tabs** | Removes the Shop, Social+ and Lifestyle tabs from the bottom bar, leaving Home and Account (plus any optional tab this build enables). Nothing is deleted: those screens still exist and still open if the app routes to them (a deep link, a tile, a notification) — they just no longer take a tab. |
| **Remove ads & tracking** | Removes every ad (interstitial, banner, daily-reward) and every tracker (Mixpanel, Firebase, Facebook, AppsFlyer) — app events, network sends, ad-SDK requests (Google Ads / AppLovin / AnyMind / Prebid), SDK auto-collection, and the ipify IP leak. The app then phones home only to its own Jazz API. |
| **Remove daily check-in ads** | Removes the SocialPlus daily check-in / in-feed ads (FeedAdsManager banner + native loaders) and the day-10/20/30 milestone-claim RewardedAd (the award is still granted, just with no ad). Separate from "Remove ads & tracking" to keep that patch Morphe-Manager-safe; enable this one when patching with the desktop CLI. |

### My Telenor (`com.telenor.pakistan.mytelenor`)

_Supported version(s): 4.2.63_

| Patch | Description |
|-------|-------------|
| **Auto-claim daily rewards** | Claims daily streak MBs and Answer & Win quiz rewards automatically via a background WorkManager job scheduled from MainActivity. |
| **Block trackers** | Stops the Insider, TikTok Business SDK and Mixpanel Session Replay trackers from initializing (event/attribution/session-replay tracking never starts). Leaves AWS Amplify, Firebase core/RemoteConfig/FCM and Google Ads init untouched so app data, push and the remote ad-config the ads patch relies on keep working. |
| **Block trackers (manifest flags)** | Disables Firebase Analytics + Google advertiser-id auto-collection and the Facebook SDK's auto app-events / advertiser-id / auto-init via AndroidManifest <meta-data> flags — the SDK-side auto-collection that no bytecode init-stub can reach. Leaves Firebase core (FCM push, RemoteConfig) and the Facebook ContentProvider intact. Separate from the bytecode Block trackers patch so you can pick either or both. |
| **Bypass device validation** | Neutralizes the client-side device-validation gate (anti-root / anti-emulator / anti-Frida / anti-Xposed / anti-tamper battery) that shows a "Device validation failed" toast and kills the app via finishAffinity() on a rooted, emulated or re-signed build. Redirects the single failure callback to the success path so all ~16 checks report as passed and the app keeps running pre- and post-login. |
| **Remove ads** | Removes every Google Ad Manager ad (banners + interstitials) across Daily Rewards, Home, Test Your Skills and Explore by nulling the remote ad-config chokepoint, so each surface renders its no-ads layout and never requests an interstitial. |

### Storywise (`com.storywise.storywise`)

_Supported version(s): 1.0.3_

| Patch | Description |
|-------|-------------|
| **Block update prompt** | Forces Remote Config to report latest_version_name=1.0.3 and android_latest_build=34, matching the installed version so the force-update dialog never appears. |
| **Bypass login** | Restores a signed-in user from an embedded assets/sw_cred.json (pre-formatted Firebase credential file) into SharedPreferences before FirebaseAuth initialises, so the constructor picks up the stored user. Falls back to anonymous sign-in (H3/h + zzacq.zza) if the asset is missing. Also short-circuits the Google sign-in provider flow (O5/p pswitch_5) to reuse the current user. |
| **Unlock pass** | Unlocks paid content (Monthly Pass: lessons, tutor, reports) by forging pass-expiry and active fields in Firestore document maps the app reads. Also forces latest_version_name and android_latest_build to installed values when present in a Firestore doc, blocking the update prompt via the Firestore path. |

### Investify (`com.blueinklabs.investifystocks.free`)

_Supported version(s): 5.6.0_

| Patch | Description |
|-------|-------------|
| **Bypass PairIP license check** | Disables Google PairIP's license/installer check (com.pairip.licensecheck) so a re-signed build runs on a real device instead of being redirected to the Play Store and killed. No-ops the LicenseContentProvider entry point and LicenseClient.initializeLicenseCheck(). |
| **Unlock premium (remove ads)** | Unlocks Investify premium — forces the backend `no_ads` entitlement getter to report true in both the model and its Realm proxy, so the app treats the account as ad-free without any purchase. Ad SDK loads are gated on this flag app-wide. |

### NetMonster (`cz.mroczis.netmonster`)

_Supported version(s): 4.0.4, 5.0.0, 5.0.1_

| Patch | Description |
|-------|-------------|
| **Bypass Play license check (NetMonster)** | Removes Google Play's PairIP license check so a re-signed NetMonster 5.0.x build runs instead of being blocked by the "Get this app from Play" screen. Without it, patched 5.0.0 / 5.0.1 open the Play Store on launch and close. No effect on 4.0.4, which has no such check. |
| **Google Maps API key (NetMonster)** | Optional: write YOUR OWN Google Maps API key so the map renders after re-signing (NetMonster's built-in key is cert-locked). Leave the key empty to leave the map as-is. |
| **Unlock premium (NetMonster)** | Unlocks NetMonster Premium — forces the Adapty entitlement collector to always report premium active, so real-time LTE/NR-NSA location calculation is unlocked, ads are removed, and the status shows Active without a subscription. |

### foodpanda (`com.global.foodpanda.android`)

_Supported version(s): 26.38.1_

| Patch | Description |
|-------|-------------|
| **Bypass anti-tamper (foodpanda)** | Bypasses foodpanda's DeliveryHero MAS integrity block — forces the master security gate (`w9u.a`) to report the device/app as trusted AND short-circuits the enforcement orchestrator that launches the block screen, so re-signed / sideloaded builds no longer hit the "This device or application is not supported" BlockedActivity. |
| **Force dark mode** | Rewrites foodpanda's baked-in Bento color constants to dark equivalents so the app renders a real dark theme. The app ships no dark palette — R8 merged its light and dark token sets into one identical set of dex constants — so theme, force-dark and values-night changes have no effect. Brand colors are left untouched. |
| **Remove ads** | Removes foodpanda's adtech banner ads (all placements: order-tracking, home, discovery, reels) and the forced PandaMart "CrossSell" popup, and suppresses the forced in-app review prompt (DeliveryHero InAppRatingActivity). |
| **Unlock premium (foodpanda)** | Unlocks foodpanda pandapro — forces every `isSubscribed()` check (status instanceof UserSubscriptionStatus.Subscribed) to report subscribed and forces Subscribed.hasBenefits() true, so the app's pro state, UI and entitlement gates unlock. Server-enforced benefits (free delivery, vouchers) still require a real subscription. |

### Safar (`com.safar.fyi`)

_Supported version(s): 3.0.1_

| Patch | Description |
|-------|-------------|
| **Bypass license verification** | Bypasses Google Play's PairIP license check so a re-signed Safar build runs instead of being blocked by the "Get this app from Play" paywall or a "Something went wrong" dialog. |
| **Remove ads** | Removes Safar's AdMob banner, interstitial and app-open ads by stubbing the react-native-google-mobile-ads load funnels (no ad is requested, so none renders). User-initiated rewarded ads are left working. |

### OLX (`com.olx.pk`)

_Supported version(s): 18.8.0_

| Patch | Description |
|-------|-------------|
| **Force dark mode** | Forces OLX into dark (night) mode regardless of the system theme, using the app's built-in -night resources via UiModeManager.setApplicationNightMode at startup. |
| **Remove ads** | Removes native feed ads (Google GMA), the full-height ad slot, the "Buy with Delivery" promo section (bar, cards and View all), the three item-page banner slots, and the home-screen banner slots from OLX. Pinned to the 18.8.0 build (matches that build's obfuscated feed, item-page and home classes). |

### OLX India (`com.olx.southasia`)

_Supported version(s): 20.07.001_

| Patch | Description |
|-------|-------------|
| **Remove Elite promotions** | Removes the promoted Elite seller cards and the buyer-matchmaking recommendation slot from OLX India's listing feed — OLX's own paid placements, which the ad-removal patch does not cover. |
| **Remove ads** | Removes ads from OLX India by disabling the in-house Baxter ad SDK at its own enable predicate (com.naspers.advertising.baxterandroid.f.d()). Every ad path — native feed, full-page, interstitial, swipe, adpv and the ad view itself — already checks this predicate, so disabling it stops the ad requests rather than just hiding the boxes. |

### inDrive (`sinet.startup.inDriver`)

_Supported version(s): 5.188.0, 5.189.0_

| Patch | Description |
|-------|-------------|
| **Remove ads** | Removes inDrive's Google ads — the banner, the card shown during and after a ride, and the full-screen ones — by switching the app's own Google Ads enable flags off, so it never asks Google for an ad. Rides, chat, payments and inDrive's own promo codes keep working. |

### MTProxy (`com.sdev.mtproxy`)

_Supported version(s): 2.1.4_

| Patch | Description |
|-------|-------------|
| **Remove ads** | Removes every AdMob ad — the interstitial (rerouted to its onAdFailedToLoad branch so the proxy-apply action still runs, but no ad loads or shows) and the on-screen banner (load skipped). No feature is lost. |

### MyZong (`com.zong.customercare`)

_Supported version(s): 5.19.19.112_

| Patch | Description |
|-------|-------------|
| **Remove ads & tracking** | Removes every ad (AdMob) and every tracker (Firebase Analytics, AppsFlyer, Facebook, TikTok, and the Veridium SDK's own Google Analytics) — event sends, full SDK init (AppsFlyer init, TikTok initializeSdk/startTrack, MobileAds.initialize), and auto-collection. Pushwoosh push is left intact. The app then phones home only to its own Zong API. |
| **Unlock daily reward (skip ad)** | Claim MyZong's daily reward with no 'watch ad' popup and no ad. Forces the reward-bubble tap to take the app's own direct-claim branch (the same claim call the post-ad path makes), upstream of both the popup and the rewarded ad. |

## Troubleshooting

### App crashes / won't open right after patching (e.g. Jazz World)

This is a known **Morphe Manager** bug with large apps: picking **too many patches at once** can produce a build that won't launch.

**Fix: select fewer patches.**

For **Jazz World (Simosa)** in Morphe Manager, tick only:

- ✅ Bypass signature verification
- ✅ Remove ads & tracking

Leave **❌ Remove daily check-in ads** unticked — adding it is what triggers the crash. You still get every ad removed except the one on the daily check-in screen.

Want that last ad gone too? Patch on a computer with the **Morphe desktop app** instead — it isn't affected by this bug.
