# Supported apps

Each table lists an app's patches and the versions they were tested on. [What the patches do](patches.md) explains each patch, and [Android TV](android-tv.md) covers the apps marked 📺.

| | Meaning |
|---|---|
| 🧪 | Experimental: still in testing and may not always work. If you run into an error, please leave a detailed report in [Issues](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/new/choose). |
| ⚙️ | Off by default: this patch is not applied unless you select it in Morphe Manager when patching. |
| 📺 | Also works on the Android TV app. |

**Which file to download.** Use the `.apkm` bundle from APKMirror for most apps. Use the `.apk` for CBS News, ESPN, Fandango at Home, Hulu, MyTSA, Prime Video, The Wall Street Journal, and T-Mobile Play. For Fox One, T-Life, NPS, National Forests & Grasslands, and Recreation.gov, install the app from the Play Store and patch the installed copy. The Play Store installs the HBO Max phone app as `com.wbd.stream`, and APKMirror lists it as `com.wbd.hbomax`. The patches support both package names.

**Contents:** [Streaming](#-streaming) · [News](#-news) · [Social](#-social) · [Government](#️-government) · [Shopping](#-shopping) · [Carriers](#-carriers)

## 🎬 Streaming

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| AMC+ | Skip ads 🧪<br>Skip launch video<br>Block analytics & tracking 🧪⚙️ | `1.8.62.1` | 10/31/26 |
| Apple TV | Auto-skip 🧪<br>Hide rating prompt 🧪<br>Show release times 🧪<br>Skip ads 🧪<br>Block analytics & tracking 🧪⚙️<br>Disable up next 🧪⚙️<br>Hide player overlays 🧪⚙️ | `3.0.0` | 11/08/26 |
| Apple TV (Android TV) 📺 | Auto-skip (Android TV) 🧪<br>Hide rating prompt (Android TV) 🧪<br>Show release times (Android TV) 🧪<br>Block analytics & tracking (Android TV) 🧪⚙️ | `17.0.2` | 11/08/26 |
| Disney+ | Skip ads<br>Skip launch video<br>Block analytics & tracking 🧪⚙️ | `26.20.0+rc2-2026.10.28`<br>`26.20.0+rc3-2026.11.02` 🧪 | 11/08/26 |
| ESPN | Skip ads 🧪<br>Block analytics & tracking 🧪⚙️ | `8.29.0` | 11/04/26 |
| Fandango at Home | Mask ads<br>Block analytics & tracking ⚙️ | `10.24.r009.179279954` | 11/02/26 |
| Fox One | Disable Pairip license check<br>Skip ads 🧪<br>Block analytics & tracking 🧪⚙️ | `1.25.1` | 11/06/26 |
| HBO Max 📺 | Remove social sign-in (phone)<br>Skip ads<br>Block analytics & tracking 🧪⚙️ | `22.0.0.321`<br>Android TV `22.0.0.36` | 11/07/26 |
| Hulu | Skip ads 🧪<br>Block analytics & tracking 🧪⚙️ | `6.34.0+18552420-google` | 10/31/26 |
| JustWatch 📺 | Block ads<br>Hide sponsored titles<br>Block analytics & tracking ⚙️<br>GmsCore support 🧪⚙️<br>Hide unavailable titles 🧪⚙️<br>Hide watched titles 🧪⚙️<br>Streaming titles only 🧪⚙️ | `26.44.2`<br>Android TV `26.43.8` | 11/08/26 |
| MGM+ | Remove social sign-in<br>Skip ads 🧪<br>Skip lion intro<br>Skip pre-roll promo 🧪<br>Block analytics & tracking 🧪⚙️<br>Disable MGM+ AI ⚙️ | `240.0.2026240000` | 10/30/26 |
| MLB | Hide surveys and rating prompt<br>Skip ads<br>Block analytics & tracking ⚙️<br>GmsCore support ⚙️<br>Hide betting odds ⚙️<br>Mask live ad breaks 🧪⚙️ | `26.21.0.49` | 11/05/26 |
| Moviebase | Block ads<br>Disable Pairip license check<br>GmsCore support<br>Hide Premium upsell<br>Block analytics & tracking ⚙️ | `7.7.0` | 11/02/26 |
| NBA | Skip ads 🧪<br>Block analytics & tracking 🧪⚙️<br>Disable Ask NBA AI 🧪⚙️ | `1.2.0` | 10/31/26 |
| NFL | Skip ads 🧪<br>Block analytics & tracking 🧪⚙️ | `61.0.19` | 11/07/26 |
| Paramount+ | Skip ads<br>Skip launch video<br>Block analytics & tracking 🧪⚙️ | `17.3.0` | 11/04/26 |
| PBS | Skip ads 🧪<br>Block analytics & tracking 🧪⚙️ | `5.27.0` | 10/30/26 |
| Peacock | Disable Xfinity auto sign-in<br>Skip ads 🧪<br>Block analytics & tracking 🧪⚙️ | `7.10.30` | 11/06/26 |
| Plex 📺 | Hide sponsored content<br>Skip ads<br>Block analytics & tracking ⚙️ | `2026.22.0`<br>Android TV `2026.22.0` | 11/05/26 |
| Pluto TV 📺 | Mask live ad breaks<br>Skip ads<br>Skip launch video<br>Block analytics & tracking 🧪⚙️ | `17.3.0`<br>Android TV `17.3.0` | 11/06/26 |
| Prime Video | Rename shared permissions<br>Skip ads<br>Block analytics & tracking 🧪⚙️<br>Disable AI 🧪⚙️ | `3.0.480.647` | 11/08/26 |
| Shudder | Block analytics & tracking ⚙️ | `10.1.1` | 11/05/26 |
| Starz | Remove social sign-in<br>Skip launch video<br>Skip pre-roll promo 🧪<br>Block analytics & tracking 🧪⚙️ | `6.11.0` | 10/31/26 |
| Sundance Now | Block analytics & tracking ⚙️ | `5.0.25.2` | 11/05/26 |
| Tubi | Hide sign-in prompts<br>Highest quality 🧪<br>Remove social sign-in<br>Skip ads<br>Block analytics & tracking 🧪⚙️ | `10.44.2` | 11/07/26 |
| Xumo Play | Mask live ad breaks 🧪<br>Skip ads<br>Block analytics & tracking 🧪⚙️ | `4.6.21` | 11/04/26 |
| YouTube TV | Change app name<br>Fix picture-in-picture 🧪<br>GmsCore support<br>Skip ads 🧪<br>Block telemetry ⚙️<br>Hide membership upsell ⚙️<br>Hide prompts and promos ⚙️<br>Mask live ad breaks 🧪⚙️<br>Start at high quality 🧪⚙️ | `10.45.0`<br>`10.44.0` | 11/07/26 |

## 📰 News

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| ABC News | Mask live ad breaks<br>Skip ads 🧪<br>Block analytics & tracking ⚙️ | `8.98.2` | 11/02/26 |
| AP News | Hide donate button<br>Skip ads<br>Block analytics & tracking ⚙️<br>GmsCore support ⚙️<br>Route traffic through a proxy ⚙️ | `6.31.2` | 11/05/26 |
| CBS News | Disable signature check<br>Hide surveys<br>Opt out of data sale & sharing<br>Skip ads<br>Block analytics & tracking ⚙️ | `5.20` | 11/02/26 |
| CNN | Faster launch<br>Opt out of data sale & sharing<br>Remove social sign-in<br>Skip ads 🧪<br>Block analytics & tracking 🧪⚙️ | `26.21.0` | 11/05/26 |
| C-SPAN Now | Hide promo banners<br>Skip ads 🧪<br>Block analytics & tracking ⚙️ | `1.25.0` | 11/05/26 |
| Fox Local | Hide pop-ups and rating prompts<br>Opt out of data sale & sharing<br>Skip ads 🧪<br>Block analytics & tracking ⚙️ | `7.22.0` | 11/02/26 |
| Fox News | Opt out of data sale & sharing<br>Skip ads 🧪<br>Block analytics & tracking 🧪⚙️<br>Enable developer menu ⚙️ | `5.49.2` | 10/31/26 |
| MS NOW | Opt out of data sale & sharing<br>Block analytics & tracking 🧪⚙️ | `14.6.0` | 10/31/26 |
| NBC News | Hide surveys and rating prompt<br>Opt out of data sale & sharing<br>Skip ads<br>Block analytics & tracking ⚙️ | `15.0.1` | 11/02/26 |
| NewsBreak | Block installed-app scan<br>Disable NewsBreak AI<br>Hide My Town intro<br>Hide Premium upsells<br>Hide rating prompt<br>Skip ads<br>Block analytics & tracking ⚙️<br>GmsCore support ⚙️<br>Hide AI summaries ⚙️<br>Route traffic through a proxy ⚙️ | `26.44.1` | 11/05/26 |
| NewsNation | Skip ads (phone)<br>Block analytics & tracking ⚙️ | `510.3.0` | 11/05/26 |
| NewsNation (Android TV) 📺 | Hide rating prompt (Android TV)<br>Skip ads (Android TV)<br>Block analytics & tracking ⚙️ | `4.94` | 11/06/26 |
| NPR | Fix media connection crash<br>Hide donate buttons<br>Hide Waze bar<br>Opt out of data sale & sharing<br>Skip ads<br>Block analytics & tracking ⚙️<br>Route traffic through a proxy ⚙️ | `7.10.0` | 11/05/26 |
| Substack | Disable screenshot detection<br>Hide follow upsell<br>Block analytics & tracking ⚙️ | `3.12.0` | 11/05/26 |
| The Daily Wire | Skip ads<br>Block analytics & tracking ⚙️<br>GmsCore support ⚙️ | `3.5.21` | 11/05/26 |
| The New York Times | Hide upsell pop-ups 🧪<br>Remove social sign-in<br>Skip ads 🧪<br>Block analytics & tracking 🧪⚙️ | `11.98.0` | 10/30/26 |
| theScore | Block analytics & tracking ⚙️ | `26.16.0` | 11/05/26 |
| The Wall Street Journal | Hide marketing pop-ups 🧪<br>Skip ads 🧪<br>Block analytics & tracking 🧪⚙️ | `15.12.0.42675` | 10/30/26 |
| The Washington Post | Hide marketing pop-ups 🧪<br>Skip ads 🧪<br>Block analytics & tracking 🧪⚙️<br>Disable AI 🧪⚙️ | `7.18.1` | 10/30/26 |
| USA TODAY | Hide rating prompt<br>Hide subscription prompts<br>Skip ads<br>Block analytics & tracking ⚙️ | `8.15.0` | 11/06/26 |

## 💬 Social

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| Truth Social | Disable AI<br>Disable forced updates<br>Disable update and review prompts<br>Fix pictures shown as videos<br>Hide crypto and prediction markets<br>Hide Truth+<br>Save videos<br>Skip ads<br>Block analytics & tracking ⚙️<br>Route traffic through a proxy ⚙️<br>Show poll results ⚙️<br>Show sensitive media ⚙️ | `1.28.3` | 11/06/26 |

## 🏛️ Government

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| FEMA | Save content for offline use<br>Block analytics & tracking ⚙️ | `3.2.1` | 11/02/26 |
| MyTSA | Block analytics & tracking ⚙️ | `5.1.0` | 11/02/26 |
| National Forests & Grasslands | Disable Pairip license check<br>Block analytics & tracking ⚙️ | `1.3.0` | 11/02/26 |
| NPS | Block analytics & tracking ⚙️<br>Block Bluetooth scanning ⚙️ | `2.15.0` | 11/02/26 |
| Recreation.gov | Hide rating prompt<br>Skip location on open<br>Block analytics & tracking ⚙️<br>Show hidden details ⚙️ | `2.2.67.1` | 11/07/26 |
| White House | Disable Pairip license check<br>Remove microphone access<br>Skip launch video<br>Block analytics & tracking ⚙️<br>Hide promotions ⚙️<br>Hide social feeds ⚙️<br>Route traffic through a proxy ⚙️ | `47.7.8` | 11/05/26 |

## 🛒 Shopping

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| Amazon Shopping | Hide sponsored listings 🧪<br>Disable AI 🧪⚙️ | `32.19.0.100` | 11/01/26 |
| Best Buy | Hide sponsored listings 🧪<br>Disable AI 🧪⚙️ | `26.10.10` | 11/01/26 |
| CVS | Disable AI 🧪⚙️ | `26.10.50` | 11/01/26 |
| DealSeek | Disable Pairip license check<br>Hide pop-ups<br>Strip affiliate links<br>Block analytics & tracking 🧪⚙️ | `1.64.0` | 11/05/26 |
| Target | Hide sponsored listings 🧪<br>Disable AI 🧪⚙️ | `2026.43.0` | 11/01/26 |
| The Home Depot | Disable AI 🧪⚙️ | `8.2.5` | 11/01/26 |
| Walgreens | The shared privacy patches only | `118.0` | 11/01/26 |
| Walmart | Disable AI 🧪⚙️ | `26.42.1`<br>`26.42.2` 🧪 | 11/08/26 |

## 📶 Carriers

| App | Patches | Tested version | Last updated |
|-----|---------|----------------|--------------|
| Mint Mobile | Block analytics & tracking ⚙️ | `2.3.42` | 11/06/26 |
| myAT&T | Block background network reports 🧪<br>Block session recording<br>Block analytics & tracking ⚙️<br>Disable AI ⚙️ | `2026.10.2` | 11/07/26 |
| My Verizon | Block session recording<br>Block analytics & tracking ⚙️<br>Disable AI 🧪⚙️ | `22.2.5` | 11/02/26 |
| T-Life | Block location tracking<br>Block session recording<br>Block analytics & tracking ⚙️<br>Disable AI ⚙️ | `12.3.1` | 11/01/26 |
| T-Mobile Play | Block ads<br>Block analytics & tracking ⚙️<br>Block TV discovery ⚙️<br>Hide stories ⚙️ | `19.4.4` | 11/01/26 |
| Visible | Block ads<br>Block session recording<br>Block analytics & tracking ⚙️ | `3.0.5` | 11/01/26 |
| Xfinity | Block Advanced Security telemetry ⚙️<br>Block analytics & tracking ⚙️<br>Disable AI ⚙️ | `6.14.0-2` | 11/01/26 |
