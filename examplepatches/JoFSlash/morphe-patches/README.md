# Patches for Morphe

[![Latest release](https://img.shields.io/github/v/release/JoFSlash/morphe-patches?label=release)](https://github.com/JoFSlash/morphe-patches/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/JoFSlash/morphe-patches/total)](https://github.com/JoFSlash/morphe-patches/releases)
[![License](https://img.shields.io/github/license/JoFSlash/morphe-patches)](LICENSE)

Patches for Android apps, applied with [Morphe](https://morphe.software). One patch source for all of them: add it
once in Morphe Manager and pick the app you want to patch. No root needed.

<!-- APPS_START -->
| App | What the patches do | Details |
| --- | --- | --- |
| [Booking.com](https://play.google.com/store/apps/details?id=com.booking) | Compare the price with the hotel's own website, watch prices, check crossed-out prices and reviews, and take out scarcity messages, sponsored results and upsells. | [Booking.com patches](docs/booking/README.md) |
| [Google Health](https://play.google.com/store/apps/details?id=com.fitbit.FitbitMobile) (Fitbit) | Sign in through MicroG-RE instead of Google Play services, no surveys or nags, a black theme, screenshots on every screen, and a clone next to the official app. | [Google Health patches](docs/google-health/README.md) |
| [IMDb](https://play.google.com/store/apps/details?id=com.imdb.mobile) | Remove the ads from the movie and TV database and stop its third-party trackers (comScore, Branch, Pinpoint, clickstream), without an account. | [IMDb patches](docs/imdb/README.md) |
| [Kalorické Tabulky](https://play.google.com/store/apps/details?id=cz.psc.android.kaloricketabulky) | Remove ads, Premium pop-ups, rating prompts and trackers from the calorie and food diary, and sign in with Google through MicroG-RE. | [Kalorické Tabulky patches](docs/kaloricke-tabulky/README.md) |
| [Listonic](https://play.google.com/store/apps/details?id=com.l) | Remove the ads, sale campaigns, rating prompts and trackers from the grocery shopping list, and sign in with Google through MicroG-RE. | [Listonic patches](docs/listonic/README.md) |
| [Quora](https://play.google.com/store/apps/details?id=com.quora.android) | Remove ads and tracking, and hide what you don't use: AI answers, Quora+ paywalls, suggestions, counts, old answers. | [Quora patches](docs/quora/README.md) |
| [Speedtest](https://play.google.com/store/apps/details?id=org.zwanoo.android.speedtest) (Ookla) | Remove the ads from the internet speed test and stop its third-party trackers (Appvestor, CellRebel), without an account. | [Speedtest patches](docs/speedtest/README.md) |
| [The Crypto App](https://play.google.com/store/apps/details?id=com.crypter.cryptocyrrency) (TrustSwap) | Hide the ads, and add your own price alerts (price or 24h change), a chart and a local portfolio, with free public prices and no account. | [The Crypto App patches](docs/thecryptoapp/README.md) |
<!-- APPS_END -->

Each app's page lists its patches, the supported app versions and what to know before you install.

## Install

1. Install Morphe Manager from [morphe.software](https://morphe.software).
2. Add this repository as a patch source: open
   [this link](https://morphe.software/add-source?github=JoFSlash/morphe-patches) on your phone, or add
   `https://github.com/JoFSlash/morphe-patches` under sources in Morphe Manager. The patches are also listed in
   the community [Morphe patch index](https://morphe-patches.software/).
3. Download a supported version of the app as an APKM file from APKMirror (the app's page links the right one;
   Kalorické Tabulky and Listonic aren't there, their pages say where to get them), pick it in Morphe Manager, then pick the
   patches you want.
4. Uninstall the Play Store version before installing the patched one, unless you patch a clone. The patched app
   is signed with a different key, so Android won't install it over the original.

## Updating

- **New patches:** a new version of these patches comes out every Saturday when something changed. An urgent fix
  can come out sooner. To get new patches on Wednesday already, turn
  on **Pre-release patches** for this source in Morphe Manager; pre-releases are less tested. Morphe Manager then
  marks the patched app with an Update badge: patch the same app file again and install it over the patched app.
  No need to uninstall, and your settings stay.
- **New app version:** a patched app doesn't update from the Play Store. Wait until a release of these patches
  lists the new version as supported, then patch that version the same way.
- **The app stops accepting your version** (Quora shows "Upgrade Needed"): patch the newest supported version and
  install it over the old one.

## Moved here

Until November 2026 each app had its own repository: `JoFSlash/quora-patches` (now this one, renamed),
`JoFSlash/booking-patches` and `JoFSlash/google-health-patches`. Their history, issues and patches are here now.

- **Quora:** nothing to do. The old address leads here and Morphe Manager keeps updating the patches.
- **Booking.com and Google Health:** the old repositories are deleted, so Morphe Manager shows an error for the
  old source. Remove the old source and add this one (step 2 above).
  Then patch the app again with this source and install it over the patched app; you stay signed in and keep
  your settings, including Booking.com's watched prices.

## Building

You need JDK 21 and a GitHub token with `read:packages`
(see the [Morphe docs](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md)).

```bash
./gradlew :patches:buildAndroid
```

The bundle ends up in `patches/build/libs/patches-*.mpp`. Each app has its own patches in
`patches/src/main/kotlin/app/jofslash/patches/<app>/` and its own extension in `extensions/<app>/`, so a patched
app only gets its own code. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

<!-- OWNERS_START -->
[GPL-3.0](LICENSE), see also [NOTICE](NOTICE). Not affiliated with Amazon, Booking.com, Fitbit, Google, IMDb, Kalorické Tabulky, Listonic, Ookla, Quora or TrustSwap, or with the Morphe project.
<!-- OWNERS_END -->
