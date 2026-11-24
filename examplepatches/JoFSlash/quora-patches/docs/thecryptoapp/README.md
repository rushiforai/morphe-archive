# The Crypto App patches for Morphe

[![Latest release](https://img.shields.io/github/v/release/JoFSlash/morphe-patches?label=release)](https://github.com/JoFSlash/morphe-patches/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/JoFSlash/morphe-patches/total)](https://github.com/JoFSlash/morphe-patches/releases)
[![License](https://img.shields.io/github/license/JoFSlash/morphe-patches)](../../LICENSE)

Patches for [The Crypto App](https://play.google.com/store/apps/details?id=com.crypter.cryptocyrrency) (TrustSwap),
the crypto prices, news and portfolio app, applied with [Morphe](https://morphe.software). The patches hide the
ads and add our own price alerts, chart and portfolio, which work without an account.

Works with The Crypto App <!-- VERSIONS_START -->4.0.5<!-- VERSIONS_END --> on Android 10 or newer. No account and
no root needed.

- **No ads:** no banners and no ads between the news.
- **Your own price alerts:** a "Crypto Alerts" icon next to the app's own. Add an alert for a coin going above or
  below a price, or up or down by some percent in 24 hours, with a note, once or every time. Prices are checked
  about every 15 minutes, also when the phone sleeps, and a met alert shows as a notification.
- **Chart and portfolio:** a candlestick chart for each alert (TradingView, or Binance as a fallback), and a
  portfolio of the coins you hold, typed in by you, with the value of each and the total.

Prices come from Binance's free public API, and from CoinGecko for coins Binance doesn't list. They are fetched
without an account or API key, and your alerts and portfolio stay on your phone.

These patches don't unlock The Crypto App Pro. The alerts, chart and portfolio are our own screens, not the app's
Pro features; the app's own alerts, portfolio and Pro work as before if you have them.

## Before you install

- **The patched app replaces the Play Store version.** It is signed with a different key, so uninstall the Play
  Store version first. The app works without an account; signing in with Google may not work in the patched app,
  because it is signed with a different key.
- **Use the APK bundle (APKM).** The app keeps its native libraries in a split, so a single APK without them closes
  at start.
- **Allow notifications.** The first time you open Crypto Alerts it asks to show notifications (Android 13 and
  newer). Without that, alerts are checked but can't reach you; Crypto Alerts says so, and a met alert waits
  until notifications are on.

## Install

1. Install Morphe Manager from [morphe.software](https://morphe.software).
2. Add this repository as a patch source: open
   [this link](https://morphe.software/add-source?github=JoFSlash/morphe-patches) on your phone, or add
   `https://github.com/JoFSlash/morphe-patches` under sources in Morphe Manager.
3. Get a supported version of The Crypto App from
   [APKMirror](https://www.apkmirror.com/apk/trustswap-inc/cryptocurrency-bitcoin-altcoin-price/) as an APK bundle
   (APKM), TrustSwap's own (by its certificate). Pick the file in Morphe Manager, then pick the patches you want.
4. Uninstall the Play Store version.
5. Tap Install. Android asks you to allow Morphe Manager to install unknown apps. Google Play Protect may then
   say it hasn't seen the app before: tap **More details** and **Install without scanning**.

## Updating

- **New patches:** a new version of these patches comes out every Saturday when something changed (see
  [Updating](../../README.md#updating)). Morphe Manager then marks the patched app with an Update badge. Patch
  the same file again and install it over the patched app. No need to uninstall; your alerts and portfolio stay.
- **New version of The Crypto App:** the patched app doesn't update from the Play Store. New versions on APKMirror
  are noticed automatically every day and tested, so support usually arrives within a day or two. When a release
  of these patches lists the new version as supported, patch that version the same way.

## Patches

<!-- PATCHES_START -->
3 patches, all on by default. Supported The Crypto App versions: 4.0.5.

<details>
<summary><b>Ads</b> (1)</summary>

| Patch | Default | What it does |
| --- | --- | --- |
| Hide ads | on | Hides the banners and the ads between the news, using the app's own ad-free mode for new users, kept on for good. Pro isn't unlocked. |

</details>

<details>
<summary><b>Features</b> (1)</summary>

Our own screens, next to the app.

| Patch | Default | What it does |
| --- | --- | --- |
| Custom price alerts | on | Adds a "Crypto Alerts" icon with your own price alerts (a price above or below a target, or a 24h change), checked about every 15 minutes with free public prices and shown as notifications, plus a chart and a local portfolio. |

</details>

<details>
<summary><b>App</b> (1)</summary>

| Patch | Default | What it does |
| --- | --- | --- |
| Disable PairIP license check | on | Lets the patched app start. Without it the app sees it wasn't installed from the Play Store, shows a paywall and closes. Keep it on. |

</details>
<!-- PATCHES_END -->

## FAQ

**Where are my alerts?**
Open the "Crypto Alerts" icon that the patched app adds next to its own. Tap an alert to change it, use the switch
to turn it off, and Chart or Delete on the right. Portfolio is under the form.

**Which symbols work?**
A coin (`BTC`), or a pair against a dollar coin (`BTCUSDT`, `ETH/USDC`). Prices are in US dollars. Coins on
Binance work best; others are looked up on CoinGecko by their ticker, and a coin on neither can't be priced. The
chart is Binance only.

**Why did an alert fire only once?**
A met alert waits 30 minutes before it fires again, and fires again sooner only after the price has gone back
across the target. A one-time alert turns itself off after it fires.

**Is hiding ads allowed?**
The patches hide what you didn't ask to see on your own phone, using a mode the app already has for new users.
They don't touch Pro or any paid feature.

**Something doesn't work.**
Please [open an issue](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with the
app's version, and leave out your name and any personal details.

## Building

```
./gradlew :patches:buildAndroid
```

Building needs a GitHub token with `read:packages` in `GITHUB_ACTOR` / `GITHUB_TOKEN` (or `gpr.user` /
`gpr.key` in `~/.gradle/gradle.properties`), because the Morphe Gradle plugin comes from GitHub Packages.
`python .github/scripts/check_app.py thecryptoapp <thecryptoapp.apkm> --cli <morphe-cli.jar> --install --expect-screen`
applies every patch to the app and starts it on a connected phone or emulator, as the emulator test does.

## License

[GPLv3](../../LICENSE). The Crypto App is a product of TrustSwap. This project isn't affiliated with TrustSwap,
Binance, CoinGecko, TradingView or Morphe.
