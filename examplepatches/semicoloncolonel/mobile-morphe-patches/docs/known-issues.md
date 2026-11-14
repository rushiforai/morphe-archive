# Known issues

These problems are already known. Each row gives the cause, or a workaround when there is one. If your problem is not listed, please [report it](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/new/choose).

Ad blockers and DNS filters, such as AdGuard, Control D, NextDNS, and Pi-hole, cause many playback and sign-in problems on their own. Before you report a problem, try again with them turned off.

| App | Issue | Cause or workaround |
|-----|-------|---------------------|
| Apple TV | If you rewind into a recap or intro within about 3 seconds of Auto-skip skipping it, it can be skipped again. | Rewind a few seconds later, or use "Watch Recap" or "Watch Intro". |
| Apple TV (Android TV) | With Block analytics & tracking (Android TV) on, the app still contacts Apple's metrics server, `xp.apple.com`, when it starts. | Apple's metrics code takes this address from Apple's servers when the app runs, and the request is made where the patch does not reach yet. Block `xp.apple.com` with a DNS filter to stop it. This is under review. |
| Apple TV (Android TV) | The patched app closes the moment it opens, with a missing-library error. | Apple TV keeps its native libraries, such as `libluna.so`, in a separate split. A base-only patch, or Morphe Manager's "Use installed app" on a Play Store copy, drops that split. Patch the full bundle with every split. See [Apps that need the full bundle](android-tv.md#apps-that-need-the-full-bundle). |
| Best Buy | On some phones, every screen has a white tint and the app can take a minute to start. | The official app does the same on these phones, so the patches do not cause it. This is under review. |
| Costco | Passkey sign-in does not work, and Costco may not show all of your account information. | Android allows a passkey only in an app signed by its owner, and Costco's security check after sign-in requires Costco's own signature. Sign in with your email and password. |
| HBO Max | On TV, a resumed episode can show "Couldn't Play Content" (error 39999) when it reaches a mid-roll ad break. | Start the episode from the beginning. |
| JustWatch | With Hide unavailable titles or Hide watched titles on, the title count at the top of the Watchlist still includes the hidden titles. | The count comes from JustWatch's server before titles are hidden. |
| Moviebase | The Activity and Members tabs do not load. | Moviebase's community server accepts only requests that pass Google's Play Integrity check, which a patched app cannot pass. |
| NewsNation (Android TV), Apple TV (Android TV) | On a TV, Morphe Manager may offer to update the app to the phone version (NewsNation 510.3.0, Apple TV 3.0.0). | The phone and Android TV apps share a package name, and Morphe Manager compares only version numbers. Ignore the update. The Android TV versions are NewsNation 4.94 and Apple TV 17.0.2. |
| NPS | The patched app closes as soon as it opens. | The patched file had no native libraries, which the app's map needs. Install NPS from the Play Store, then patch it with "Use installed app" in Morphe Manager, which keeps them. |
| Pluto TV | Continue Watching does not resume an episode where you stopped. | Pluto TV saves your place only when you are signed in to a free Pluto TV account. A DNS filter or ad blocker that blocks `sparrow.pluto.tv` or `tm.pluto.tv` also stops it, so allow both. The Aggressive level of Block analytics & tracking blocks them too. |
| Walmart | Sign-in codes are not sent by text. | A DNS filter may block `drfdisvc.walmart.com`. Allow it and `h-walmart.online-metrix.net`, which Walmart uses for fraud checks at sign-in. |
| YouTube TV | The location check can take a while indoors, or fail with a VPN on. | MicroG RE falls back to GPS when its Wi-Fi location service has no data for your area. Turn off the VPN if YouTube TV cannot determine your location. |
