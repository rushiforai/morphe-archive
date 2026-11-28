# Known issues

These problems are already known. Each row gives the cause, or a workaround when there is one. If your problem is not listed, please [report it](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/new/choose).

Ad blockers and DNS filters, such as AdGuard, Control D, NextDNS, and Pi-hole, cause many playback and sign-in problems on their own. Before you report a problem, try again with them turned off.

| App | Issue | Cause or workaround |
|-----|-------|---------------------|
| Apple TV | If you rewind into a recap or intro within about 3 seconds of Auto-skip skipping it, it can be skipped again. | Rewind a few seconds later, or use "Watch Recap" or "Watch Intro". |
| Best Buy | On some phones, every screen has a white tint and the app can take a minute to start. | The official app does the same on these phones, so the patches do not cause it. This is under review. |
| Costco | Passkey sign-in does not work, and Costco may not show all of your account information. | Android allows a passkey only in an app signed by its owner, and Costco's security check after sign-in requires Costco's own signature. Sign in with your email and password. |
| Flipp | With GmsCore support and Clone app both on, "Continue with Google" fails with "An unexpected error occurred." | GmsCore's consent screen checks that the app's package name matches the original, and a clone has a new one. Turn Clone app off. |
| HBO Max | On TV, a resumed episode can show "Couldn't Play Content" (error 39999) when it reaches a mid-roll ad break. | Start the episode from the beginning. |
| JustWatch | With Hide unavailable titles or Hide watched titles on, the title count at the top of the Watchlist still includes the hidden titles. | The count comes from JustWatch's server before titles are hidden. |
| Koupon | The patched app closes as soon as it opens. | The patched file had no native libraries, which are in a separate part of the app. APKPure offers Koupon as a single APK without them, and APKMirror does not carry it, so install it from Google Play or Aurora Store, then patch it with "Use installed app" in Morphe Manager. The patches now refuse a file without the native libraries. |
| Moviebase | The Activity and Members tabs do not load. | Moviebase's community server accepts only requests that pass Google's Play Integrity check, which a patched app cannot pass. |
| NPS | The patched app closes as soon as it opens. | The patched file had no native libraries, which the app's map needs. Install NPS from the Play Store, then patch it with "Use installed app" in Morphe Manager, which keeps them. |
| Pluto TV | Continue Watching does not resume an episode where you stopped. | Pluto TV saves your place only when you are signed in to a free Pluto TV account. A DNS filter or ad blocker that blocks `sparrow.pluto.tv` or `tm.pluto.tv` also stops it, so allow both. The Aggressive level of Block analytics & tracking blocks them too. |
| Prime Video | When a title has ads built into the video stream, the remaining time on the seek bar still counts the skipped ads, so it can read a few minutes too long. | Amazon adds the ads' length to the title's length before the player skips them. The position on the seek bar is correct. |
| T-Life | Signing in can ask you to verify your identity by uploading a photo of your ID. | T-Mobile runs a fraud check at sign-in that fingerprints your device, and a patched app can look like a new or untrusted device. Keep Mask device identity in Relaxed mode, or off, so the check still reads your real Android ID. Aggressive mode is the most likely to trigger this. The re-signed app can still prompt it on its own, because the signing certificate differs from T-Mobile's. |
| Walmart | Sign-in codes are not sent by text. | A DNS filter may block `drfdisvc.walmart.com`. Allow it and `h-walmart.online-metrix.net`, which Walmart uses for fraud checks at sign-in. |
| YouTube TV | The location check can take a while indoors, or fail with a VPN on. | MicroG RE falls back to GPS when its Wi-Fi location service has no data for your area. Turn off the VPN if YouTube TV cannot determine your location. |
