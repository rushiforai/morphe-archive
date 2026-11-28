# Supported apps

Each table lists an app's patches and the versions they were tested on. [What the patches do](patches.md) explains each patch. In the tables:

- **Experimental** means the patch or version is still in testing and may not always work. If you run into an error, please [report it](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/new/choose) with as much detail as you can.
- **Off by default** means the patch is applied only if you select it in Morphe Manager when you patch.
- The Android TV apps are in their own source, [TV Morphe Patches](https://github.com/semicoloncolonel/tv-morphe-patches). [Android TV](android-tv.md) explains how to add it.

**Which file to download.** The "Get it from" column says where each app can come from. The most reliable source is Google Play or Aurora Store: install the app, then patch the installed copy with "Use installed app" in Morphe Manager. That gives you the phone build Google Play currently serves. If you are in the app's beta program, Google Play can give you a newer version than the patches support. The column's other entries mean:

- **Any:** the app's native code is in its main APK, so a single `.apk` from any site works.
- **Google Play, or a full bundle:** the native code is in a separate part of the app. Download the whole bundle (`.apkm` from APKMirror, or `.xapk`), not a single `.apk`, or the patched app closes as soon as it opens.
- **Not APKPure:** APKPure's file for this app is missing the 64-bit native code. Many newer phones, such as the Galaxy S25 and Pixel 7 and later, run only 64-bit apps, so an app patched from it closes as soon as it opens.
- **Google Play only:** APKMirror does not carry the app, and APKPure's file does not work.

Whatever the source, check that the version and version code match the table. The [FAQ](faq.md) explains how.

**Contents:** [Streaming](#streaming) · [News](#news) · [Social](#social) · [Government](#government) · [Shopping](#shopping) · [Carriers](#carriers) · [Utilities](#utilities)

## Streaming

| App | Patches | Tested version | Get it from | Last updated |
|-----|---------|----------------|-------------|--------------|
| AMC+ | Skip ads (experimental)<br>Skip launch video<br>Block analytics & tracking (experimental, off by default) | `1.8.62.1` | Google Play, or a full bundle | 10/31/26 |
| Apple TV | Auto-skip (experimental)<br>Hide prompts and pop-ups (experimental)<br>Show release times (experimental)<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Disable up next (experimental, off by default)<br>Hide player overlays (experimental, off by default) | `3.0.0` | Google Play, or a full bundle | 11/08/26 |
| Disney+ | Skip ads<br>Skip launch video<br>Block analytics & tracking (experimental, off by default) | `26.21.0+rc3-2026.11.17`<br>`26.20.0+rc3-2026.11.02`<br>`26.20.0+rc2-2026.10.28` | Google Play, or a full bundle. Not APKPure | 11/20/26 |
| ESPN | Hide betting<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `8.30.1`<br>`8.30.0`<br>`8.29.0`<br>`8.27.0` | Google Play, or a full bundle. Not APKPure | 11/25/26 |
| Fandango at Home | Mask ads<br>Block analytics & tracking (off by default) | `10.24.r009.179279954` | Any | 11/02/26 |
| Fawesome | Skip ads | `20.8` | Google Play, or a full bundle | 11/23/26 |
| Fox One | Disable Pairip license check<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `1.26.0`<br>`1.25.1`<br>`1.24.0` | Google Play, or a full bundle. Not APKPure | 11/19/26 |
| HBO Max | Remove social sign-in<br>Skip ads<br>Block analytics & tracking (experimental, off by default)<br>Video quality (experimental, off by default)<br>Force decode capability (experimental, off by default) | `22.1.0.340`<br>`22.0.0.321`<br>`7.14.0.530` | Google Play, or a full bundle. Not APKPure | 11/24/26 |
| Hulu | Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `6.34.0+18552420-google` | Any | 10/31/26 |
| JustWatch | Block ads<br>Hide sponsored titles<br>Block analytics & tracking (off by default)<br>GmsCore support (experimental, off by default)<br>Hide unavailable titles (experimental, off by default)<br>Hide watched titles (experimental, off by default)<br>Streaming titles only (experimental, off by default) | `26.47.1`<br>`26.46.2`<br>`26.45.1`<br>`26.44.2`<br>`26.43.10` | Google Play, or a full bundle | 11/24/26 |
| Kanopy | Hide prompts and pop-ups (experimental)<br>Hide survey (experimental)<br>Block analytics & tracking (experimental, off by default) | `6.32.0` | Any | 11/09/26 |
| Libby | Disable auto-updates (experimental, off by default)<br>Enable built-in tools (experimental, off by default) | `9.6.0` | Any | 11/27/26 |
| MGM+ | Remove social sign-in<br>Skip ads (experimental)<br>Skip lion intro<br>Block analytics & tracking (experimental, off by default)<br>Disable MGM+ AI (off by default) | `240.0.2026240000` | Google Play, or a full bundle | 10/30/26 |
| MLB | Hide prompts and pop-ups<br>Skip ads<br>Block analytics & tracking (off by default)<br>GmsCore support (off by default)<br>Hide betting odds (off by default) | `26.22.0.41`<br>`26.21.0.49` | Google Play, or a full bundle. Not APKPure | 11/24/26 |
| Moviebase | Block ads<br>Disable Pairip license check<br>GmsCore support<br>Hide Premium upsell<br>Block analytics & tracking (off by default) | `7.7.2`<br>`7.7.1`<br>`7.7.0` | Google Play, or a full bundle. Not 7.7.2, which stops patched copies | 11/27/26 |
| Movies Anywhere | Hide prompts and pop-ups (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Force highest quality (experimental, off by default) | `1.54.0` | Google Play, or a full bundle | 11/17/26 |
| NBA | Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Disable Ask NBA AI (experimental, off by default)<br>Hide League Pass upsells (experimental, off by default) | `1.4.2`<br>`1.3.0`<br>`1.2.0` | Google Play, or a full bundle. Not APKPure | 11/20/26 |
| Netflix | Bypass tamper protection (experimental)<br>Browse hidden categories (experimental, off by default)<br>Disable autoplay (experimental, off by default)<br>Keep screen brightness (experimental, off by default)<br>Remove bottom tabs (experimental, off by default)<br>Respect rotation lock (experimental, off by default) | `9.93.0 build 8 74808`<br>`9.93.0 build 7 74878` (experimental)<br>`9.92.0 build 9 74772` | Google Play, or a full bundle | 11/17/26 |
| NFL | Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `61.0.22`<br>`61.0.21`<br>`61.0.19`<br>`61.0.18` | Google Play, or a full bundle. Not APKPure | 11/25/26 |
| Paramount+ | Enable picture-in-picture (experimental)<br>Force highest quality<br>Skip ads<br>Skip launch video<br>Block analytics & tracking (experimental, off by default) | `17.4.1`<br>`17.3.0`<br>`17.2.0` | Google Play, or a full bundle | 11/17/26 |
| PBS | Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `5.27.0` | Google Play, or a full bundle | 10/30/26 |
| Peacock | Disable Xfinity auto sign-in<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `7.11.22`<br>`7.11.11` | Google Play, or a full bundle. Not APKPure | 11/24/26 |
| Plex | Hide sponsored content<br>Skip ads<br>Block analytics & tracking (off by default) | `2026.23.0` (beta)<br>`2026.22.0` | Google Play, or a full bundle | 11/05/26 |
| Pluto TV | Skip ads<br>Skip launch video<br>Block analytics & tracking (experimental, off by default) | `17.3.0` | Google Play, or a full bundle. Not APKPure | 11/06/26 |
| Prime Video | Rename shared permissions<br>Skip ads<br>Block analytics & tracking (experimental, off by default)<br>Disable AI (experimental, off by default) | `3.0.482.2147`<br>`3.0.482.1447`<br>`3.0.481.2847`<br>`3.0.481.2447`<br>`3.0.481.1947`<br>`3.0.480.847`<br>`3.0.480.747`<br>`3.0.480.647`<br>`3.0.479.847`<br>`3.0.477.1447` | Any | 11/24/26 |
| Shudder | Block analytics & tracking (off by default) | `10.1.1` | Google Play, or a full bundle | 11/05/26 |
| SiriusXM | Block analytics & tracking (off by default)<br>Hide content (experimental, off by default)<br>Hide Howard tab (off by default)<br>Mask live ad breaks (experimental, off by default) | `2611.2.1`, `2610.4.0` | Google Play, or a full bundle | 11/13/26 |
| Starz | Remove social sign-in<br>Skip launch video<br>Skip pre-roll promo (experimental)<br>Block analytics & tracking (experimental, off by default) | `6.12.1`<br>`6.12.0`<br>`6.11.0` | Google Play, or a full bundle. Not APKPure | 11/16/26 |
| Sundance Now | Block analytics & tracking (off by default) | `5.0.30.1`<br>`5.0.25.2` | Any | 11/24/26 |
| Tubi | Hide sign-in prompts<br>Hide update prompts<br>Highest quality (experimental)<br>Remove social sign-in<br>Skip ads<br>Block analytics & tracking (experimental, off by default) | `10.46.0`<br>`10.44.3`<br>`10.44.1` | Google Play, or a full bundle. Not APKPure | 11/19/26 |
| Viki | Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default) | `26.23.0` | Google Play, or a full bundle. Not APKPure | 11/27/26 |
| Xumo Play | Skip ads<br>Block analytics & tracking (experimental, off by default) | `4.6.21` | Any | 11/04/26 |
| YouTube TV | Change app name<br>Fix picture-in-picture (experimental)<br>GmsCore support<br>Skip ads (experimental)<br>Block telemetry (off by default)<br>Hide membership upsell (off by default)<br>Hide prompts and promos (off by default)<br>Mask live ad breaks (experimental, off by default)<br>Start at high quality (experimental, off by default)<br>Change skip interval (experimental, off by default)<br>Disable live previews (experimental, off by default)<br>Volume and brightness sliders (experimental, off by default)<br>Press and hold to speed up (experimental, off by default)<br>Set playback speed (experimental, off by default) | `10.47.0`<br>`10.46.0`<br>`10.45.0`<br>`10.44.0` | Google Play, or a full bundle. Not APKPure | 11/21/26 |

## News

| App | Patches | Tested version | Get it from | Last updated |
|-----|---------|----------------|-------------|--------------|
| ABC News | Skip ads (experimental)<br>Block analytics & tracking (off by default)<br>Route traffic through a proxy (experimental, off by default) | `8.101.0`<br>`8.100.0` | Google Play, or a full bundle. Not APKPure | 11/24/26 |
| Al Jazeera | Hide prompts and pop-ups (experimental)<br>Skip ads (experimental)<br>Skip cookie settings (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `12.2.0` (experimental) | Google Play, or a full bundle | 11/25/26 |
| AP News | Hide donate button<br>Skip ads<br>Block analytics & tracking (off by default)<br>GmsCore support (off by default)<br>Route traffic through a proxy (off by default) | `6.32.1`<br>`6.32` | Google Play, or a full bundle | 11/15/26 |
| BBC: World News & Stories | Skip ads<br>Block analytics & tracking (off by default)<br>Route traffic through a proxy (experimental, off by default) | `2026.11.0` | Google Play, or a full bundle | 11/23/26 |
| CBS News | Disable signature check<br>Hide prompts and pop-ups<br>Skip ads<br>Block analytics & tracking<br>Route traffic through a proxy (experimental, off by default) | `5.20` | Any | 11/02/26 |
| CGTN | Block analytics & tracking (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `6.7.0` (experimental) | Any | 11/27/26 |
| CNA | Block analytics & tracking (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `2.0.6` (experimental) | Google Play, or a full bundle | 11/27/26 |
| CNBC | Fix launch with DNS blockers<br>Hide newsletter pop-ups<br>Hide prompts and pop-ups<br>Skip ads (experimental)<br>Block analytics & tracking (off by default)<br>Dark mode (experimental, off by default)<br>Hide premium promotions (off by default)<br>Route traffic through a proxy (experimental, off by default) | `8.8.2` | Google Play, or a full bundle. Not APKPure | 11/08/26 |
| CNN | Faster launch (26.21.0 only)<br>Remove social sign-in<br>Skip ads (experimental)<br>Block analytics & tracking (experimental)<br>Route traffic through a proxy (experimental, off by default) | `26.24.0`<br>`26.23.0`<br>`26.21.0` | Google Play, or a full bundle. Not APKPure | 11/27/26 |
| C-SPAN Now | Hide prompts and pop-ups<br>Skip ads (experimental)<br>Block analytics & tracking (off by default)<br>Route traffic through a proxy (experimental, off by default) | `1.25.0` | Any | 11/05/26 |
| Fox Local | Hide pop-ups and rating prompts<br>Skip ads (experimental)<br>Block analytics & tracking<br>Route traffic through a proxy (experimental, off by default) | `7.22.0` | Google Play, or a full bundle | 11/02/26 |
| Fox News | Hide prediction markets<br>Skip ads (experimental)<br>Block analytics & tracking (experimental)<br>Enable developer menu (off by default)<br>Route traffic through a proxy (experimental, off by default) | `5.52.0`<br>`5.51.0`<br>`5.50.0` | Google Play, or a full bundle | 11/24/26 |
| MS NOW | Block analytics & tracking (experimental)<br>Route traffic through a proxy (experimental, off by default) | `14.7.1`<br>`14.6.0` | Google Play, or a full bundle | 11/24/26 |
| NBC News | Hide prompts and pop-ups<br>Skip ads<br>Block analytics & tracking<br>Route traffic through a proxy (experimental, off by default) | `15.0.1` | Google Play, or a full bundle | 11/02/26 |
| NewsBreak | Block installed-app scan<br>Disable NewsBreak AI<br>Hide My Town intro<br>Hide Premium upsells<br>Hide prompts and pop-ups<br>Skip ads<br>Block analytics & tracking (off by default)<br>GmsCore support (off by default)<br>Hide AI summaries (off by default)<br>Route traffic through a proxy (off by default) | `26.46.1`<br>`26.46.0`<br>`26.45.1`<br>`26.44.1` | Google Play, or a full bundle | 11/16/26 |
| NewsNation | Skip ads<br>Block analytics & tracking (off by default)<br>Route traffic through a proxy (experimental, off by default) | `510.3.0` | Any | 11/05/26 |
| NHK WORLD-JAPAN | Skip cookie settings (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `9.0.2` (experimental) | The phone build from Google Play or APKPure. Not the Android TV build | 11/24/26 |
| Nikkei Asia | Hide subscriber-only buttons (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `8a14774d3a9cb8f25eaae58f4c4e4f3e` (experimental) | Google Play, or a full bundle. Not APKPure, which has only the 32-bit build | 11/24/26 |
| NPR | Fix media connection crash<br>Hide donate buttons<br>Hide Waze bar<br>Skip ads<br>Block analytics & tracking<br>Route traffic through a proxy (off by default) | `7.11.0`<br>`7.10.0` | Google Play, or a full bundle | 11/16/26 |
| Reuters | Hide paywall overlay<br>Hide prompts and pop-ups (experimental)<br>Skip ads (experimental)<br>Block analytics & tracking (off by default)<br>Customize bottom bar (off by default)<br>Move Today section (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `8.1.0`<br>`8.0.0`<br>`7.51.0` | Google Play, or a full bundle. Not APKPure | 11/27/26 |
| South China Morning Post | Hide subscription prompts (experimental)<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `7.2.9` (experimental) | Google Play, or a full bundle. Not APKPure, which has only the 32-bit build | 11/25/26 |
| Substack | Disable screenshot detection<br>Hide follow upsell<br>Block analytics & tracking (off by default)<br>GmsCore support (off by default)<br>Route traffic through a proxy (experimental, off by default) | `3.15.1`<br>`3.15.0`<br>`3.14.0`<br>`3.13.1`<br>`3.12.0` | Google Play, or a full bundle. Not APKPure | 11/24/26 |
| The Daily Wire | Skip ads<br>Hide prompts and pop-ups<br>Block analytics & tracking (off by default)<br>GmsCore support (off by default)<br>Route traffic through a proxy (experimental, off by default) | `3.5.24`<br>`3.5.23`<br>`3.5.22`, `3.5.21` | Google Play, or a full bundle | 11/24/26 |
| The New York Times | Hide upsell pop-ups (experimental)<br>Remove social sign-in<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Incognito reading (experimental, off by default)<br>Library pass reminder (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `12.1.0`<br>`12.0.0`<br>`11.99.0`<br>`11.98.2`<br>`11.98.0` | Google Play, or a full bundle. Not APKPure | 11/27/26 |
| theScore | Block analytics & tracking (off by default)<br>Route traffic through a proxy (experimental, off by default) | `26.16.1`<br>`26.16.0` | Google Play, or a full bundle. Not APKPure | 11/12/26 |
| The Straits Times | Block analytics & tracking (experimental, off by default) | `8.5.20` (experimental) | Google Play, or a full bundle | 11/27/26 |
| The Wall Street Journal | Hide paywall overlay<br>Hide prompts and pop-ups (experimental)<br>Hide prediction markets<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Incognito reading (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `15.13.0.44249`<br>`15.12.0.42675` | Any | 11/15/26 |
| The Washington Post | Hide prompts and pop-ups (experimental)<br>Hide paywall sheet (7.19.0 only)<br>Skip age check errors (7.19.0 only)<br>Skip ads (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Disable AI (experimental, off by default)<br>Hide next article peek (experimental, off by default)<br>Incognito reading (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `7.19.0`<br>`7.18.4`<br>`7.18.3`<br>`7.18.1` | Google Play, or a full bundle | 11/12/26 |
| USA TODAY | Hide prompts and pop-ups<br>Hide subscription prompts<br>Skip ads<br>Block analytics & tracking (off by default)<br>Route traffic through a proxy (experimental, off by default) | `8.15.0` | Google Play, or a full bundle. Not APKPure | 11/06/26 |
| Xinhua News | Block analytics & tracking (experimental, off by default) | `5.4.2` (experimental) | Google Play, or a full bundle | 11/27/26 |
| Yahoo Finance | Disable AI (experimental)<br>Hide Plus upsells (experimental)<br>Hide prompts and pop-ups (experimental)<br>Skip ads (experimental)<br>Block analytics & tracking (off by default)<br>GmsCore support (off by default)<br>Route traffic through a proxy (experimental, off by default) | `26.23.0`<br>`26.22.2` | Google Play, or a full bundle. Not APKPure | 11/12/26 |
| Yahoo News | Disable AI<br>Disable video autoplay<br>Hide prompts and pop-ups (experimental)<br>Hide reading streaks<br>Skip ads (experimental)<br>Block analytics & tracking (off by default)<br>GmsCore support (off by default)<br>Customize bottom bar (off by default)<br>Show unreleased features (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `100.1.1` | Google Play, or a full bundle | 11/12/26 |
| Yonhap News English | Block analytics & tracking (experimental, off by default)<br>Route traffic through a proxy (experimental, off by default) | `1.1.01` (experimental) | Any | 11/27/26 |

## Social

| App | Patches | Tested version | Get it from | Last updated |
|-----|---------|----------------|-------------|--------------|
| Truth Social | Disable AI<br>Disable forced updates<br>Disable update and review prompts<br>Fix pictures shown as videos<br>Hide crypto and prediction markets<br>Hide Truth+<br>Save videos<br>Skip ads<br>Block analytics & tracking (off by default)<br>Route traffic through a proxy (off by default)<br>Show poll results (off by default)<br>Show sensitive media (off by default) | `1.28.4`<br>`1.28.3` | Google Play, or a full bundle. Not APKPure | 11/24/26 |

## Government

| App | Patches | Tested version | Get it from | Last updated |
|-----|---------|----------------|-------------|--------------|
| FEMA | Save content for offline use<br>Block analytics & tracking (off by default) | `3.2.1` | Google Play, or a full bundle | 11/02/26 |
| MyTSA | Block analytics & tracking (off by default) | `5.1.0` | Any | 11/02/26 |
| National Forests & Grasslands | Disable Pairip license check<br>Block analytics & tracking (off by default)<br>Hide device identifiers (off by default) | `1.4.0`<br>`1.3.0` | Google Play, or a full bundle | 11/24/26 |
| NPS | Block analytics & tracking (off by default)<br>Hide device identifiers (off by default) | `2.16.0`<br>`2.15.0` | Google Play, or a full bundle. Not APKPure | 11/14/26 |
| Recreation.gov | Hide prompts and pop-ups<br>Skip location on open<br>Block analytics & tracking (off by default)<br>Show hidden details (off by default) | `2.2.69`<br>`2.2.67.1` | Google Play, or a full bundle | 11/24/26 |
| White House | Disable Pairip license check<br>Remove microphone access<br>Skip launch video<br>Block analytics & tracking (off by default)<br>Hide promotions (off by default)<br>Hide social feeds (off by default)<br>Route traffic through a proxy (off by default) | `47.7.11` | Google Play, or a full bundle | 11/10/26 |

## Shopping

| App | Patches | Tested version | Get it from | Last updated |
|-----|---------|----------------|-------------|--------------|
| Amazon Shopping | Hide sponsored listings (experimental)<br>Disable AI (experimental, off by default) | `32.20.2.100`<br>`32.20.0.100`<br>`32.19.0.100` | Google Play, or a full bundle. Not APKPure | 11/24/26 |
| Best Buy | Hide sponsored listings (experimental)<br>Disable AI (experimental, off by default) | `26.11.10`<br>`26.10.10` | Google Play, or a full bundle | 11/16/26 |
| Checkout 51 | Block ads (experimental)<br>Block location tracking (experimental)<br>Hide prompts and pop-ups (experimental)<br>Show gas offers on OpenStreetMap (experimental)<br>Dark mode (experimental, off by default)<br>GmsCore support (off by default)<br>Strip affiliate links (experimental, off by default) | `9.22.10` | Any | 11/11/26 |
| Consumer Reports | Block analytics & tracking (experimental, off by default) | `5.25.0-1326` | Google Play, or a full bundle | 11/27/26 |
| Costco | Hide sponsored products (experimental)<br>Block analytics & tracking (experimental, off by default) | `26.11.1`<br>`26.10.3` | Google Play, or a full bundle | 11/24/26 |
| CVS | Hide sponsored listings (experimental)<br>Disable AI (experimental, off by default) | `26.11.31`<br>`26.11.30` (experimental)<br>`26.10.50` | Google Play, or a full bundle | 11/24/26 |
| DealNews | Disable Pairip license check<br>Block ads<br>Hide prompts and pop-ups<br>Strip affiliate links<br>Block analytics & tracking (off by default) | `10.7.2`<br>`10.7.1` | Google Play, or a full bundle | 11/11/26 |
| DealSeek | Disable Pairip license check<br>Hide editor articles (experimental)<br>Hide prompts and pop-ups<br>Strip affiliate links<br>Block analytics & tracking (experimental, off by default)<br>Dark mode (experimental, off by default) | `1.67.0`<br>`1.66.17`<br>`1.65.0` | Google Play, or a full bundle | 11/26/26 |
| eBay | Hide live listings (experimental)<br>Strip affiliate links (experimental)<br>Block analytics & tracking (experimental, off by default) | `6.244.0.1` (experimental) | Google Play, or a full bundle | 11/27/26 |
| Flipp | Block ads (experimental)<br>Skip tutorials (experimental)<br>Strip affiliate links (experimental)<br>GmsCore support (off by default) | `116.2.0`<br>`116.1.0`<br>`116.0.0`<br>`115.0.0` | Any | 11/26/26 |
| Koupon | Strip affiliate links<br>Keep new-user promo codes<br>Hide promo code countdown<br>Show promo codes<br>Hide prompts and pop-ups<br>Hide rewards<br>Hide sponsored cards (experimental)<br>Block analytics & tracking (off by default)<br>Disable AI (off by default)<br>GmsCore support (off by default) | `3.1.9`<br>`3.1.8`<br>`3.1.6` | Google Play only | 11/27/26 |
| Lowe's | Hide sponsored listings (experimental)<br>Disable AI (experimental, off by default) | `26.10.8`<br>`26.10.7` | Google Play, or a full bundle | 11/24/26 |
| RetailMeNot | Disable Pairip license check<br>Hide prompts and pop-ups (experimental)<br>Block analytics & tracking (experimental, off by default)<br>Strip affiliate links (experimental, off by default)<br>Dark mode (experimental, off by default)<br>Remove location access (experimental, off by default) | `10.2.0`<br>`10.1.0`<br>`10.0.6` | Google Play, or a full bundle | 11/20/26 |
| Slickdeals | Block ads (experimental)<br>Hide sign-up prompts (experimental)<br>Strip affiliate links (experimental)<br>Block analytics & tracking (experimental, off by default)<br>GmsCore support (experimental, off by default) | `6.37.1`<br>`6.37.0`<br>`6.36.0` | Any | 11/25/26 |
| Target | Hide sponsored listings (experimental)<br>Disable AI (experimental, off by default) | `2026.44.0`<br>`2026.43.0` | Google Play, or a full bundle | 11/14/26 |
| The Home Depot | Hide sponsored listings (experimental)<br>Disable AI (experimental, off by default) | `8.2.8`<br>`8.2.6`<br>`8.2.5` | Google Play, or a full bundle | 11/24/26 |
| Walgreens | Hide sponsored products (experimental)<br>Hide prompts and pop-ups (experimental) | `119.0`<br>`118.1` | Google Play, or a full bundle. Not APKPure | 11/24/26 |
| Walmart | Hide card offers (experimental)<br>Hide creator videos (experimental)<br>Hide prompts and pop-ups (experimental)<br>Hide sponsored listings (experimental)<br>Hide Walmart+ promotions (experimental)<br>Disable AI (experimental, off by default) | `26.42.3`<br>`26.42.2`<br>`26.42.1`<br>`26.42`<br>`26.38` | Google Play, or a full bundle | 11/18/26 |

## Carriers

| App | Patches | Tested version | Get it from | Last updated |
|-----|---------|----------------|-------------|--------------|
| Mint Mobile | Block analytics & tracking (off by default) | `2.3.43`<br>`2.3.42` | Google Play, or a full bundle | 11/24/26 |
| myAT&T | Block background network reports (experimental)<br>Block analytics & tracking<br>Disable AI (off by default) | `2026.11.2`<br>`2026.11.1`<br>`2026.10.2`<br>`2026.10.1` | Google Play, or a full bundle | 11/18/26 |
| My Verizon | Block analytics & tracking<br>Disable AI (experimental, off by default) | `22.3.5` | Google Play, or a full bundle | 11/10/26 |
| T-Life | Block analytics & tracking<br>Disable AI (off by default)<br>Mask device identity (off by default) | `12.4.0`<br>`12.3.1` | Google Play, or a full bundle | 11/12/26 |
| T-Mobile Play | Block ads<br>Block analytics & tracking (off by default)<br>Block TV discovery (off by default)<br>Hide stories (off by default) | `19.5.2`<br>`19.4.4` | Any | 11/10/26 |
| Visible | Block ads<br>Block analytics & tracking | `3.0.7`<br>`3.0.6` | Google Play, or a full bundle | 11/18/26 |
| Xfinity | Block Advanced Security telemetry (off by default)<br>Block analytics & tracking (off by default)<br>Disable AI (off by default) | `6.16.0-2`<br>`6.14.0-2` | Google Play, or a full bundle | 11/24/26 |

## Utilities

| App | Patches | Tested version | Get it from | Last updated |
|-----|---------|----------------|-------------|--------------|
| Settings Home | Block ads<br>Disable Pairip license check<br>Block analytics & tracking (off by default)<br>Hide device identifiers (off by default) | `1.6.7`<br>`1.6.6`<br>`1.6.4` | Google Play, or a full bundle | 11/27/26 |
