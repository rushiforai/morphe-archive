# Kalorické Tabulky patches for Morphe

[![Latest release](https://img.shields.io/github/v/release/JoFSlash/morphe-patches?label=release)](https://github.com/JoFSlash/morphe-patches/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/JoFSlash/morphe-patches/total)](https://github.com/JoFSlash/morphe-patches/releases)
[![License](https://img.shields.io/github/license/JoFSlash/morphe-patches)](../../LICENSE)

Patches for the [Kalorické Tabulky](https://play.google.com/store/apps/details?id=cz.psc.android.kaloricketabulky)
Android app (also known as Kaloricke Tabulky, Dine4Fit or Таблица калорийности), a calorie and food diary, applied
with [Morphe](https://morphe.software). The patches take out the ads, the Premium offers and the rating prompts
that show up by themselves, and the analytics and marketing trackers.

Works with Kalorické Tabulky <!-- VERSIONS_START -->3.14.71<!-- VERSIONS_END --> on Android 12L or newer. No root
needed.

- **No ads:** no ad banners, no full-screen ads, and the ad networks are never started.
- **No nagging:** no "try Premium" banners and pop-ups, no "how do you like the app?" card, no marketing
  pop-ups sent to the app.
- **Less tracking:** no Firebase or Google Analytics, Crashlytics, Facebook app events or Kochava, and no
  advertising ID.
- **Sign in with Google without Google Play services:** through MicroG-RE, or sign in with your email.
- **Your choice:** hide the Premium buttons, the home screen banner or the device pairing pop-up, and take away
  location access.

These patches don't unlock Premium. Premium features run on the app's servers and need a subscription; the
patches don't change what your subscription gives you.

## Before you install

- **Signing in with Google needs MicroG-RE.** Google only signs in the app signed by its maker, so the patched
  app signs in through [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases) instead of Google Play
  services (keep **GmsCore support** on). Install it and add your Google account to it (MicroG-RE settings >
  Accounts). Push notifications come through MicroG-RE too. Without it, sign in with your email and password.
- **Signing in with Facebook may not work.** On our test phone (without the Facebook app) it failed in the patched
  app and in the unpatched Play Store app alike, so it isn't caused by the patches. If you
  registered with Facebook and never set a password, try the password reset on the sign-in screen with your
  account's email.
- **Google Fit doesn't sync** (MicroG-RE doesn't implement Google Fit's data), and **Samsung Health may not**,
  as it also checks the app's signature. Health Connect isn't tied to the signature and should work. Your diary is
  stored in your account, so it's all there after you sign in.
- **The patched app replaces the Play Store version.** It is signed with a different key, so uninstall the Play
  Store version first. Your diary stays in your account.

## Install

1. To sign in with Google, install [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases) and add your
   Google account to it (MicroG-RE settings > Accounts).
2. Install Morphe Manager from [morphe.software](https://morphe.software).
3. Add this repository as a patch source: open
   [this link](https://morphe.software/add-source?github=JoFSlash/morphe-patches) on your phone, or add
   `https://github.com/JoFSlash/morphe-patches` under sources in Morphe Manager.
4. Get a supported version of Kalorické Tabulky. It isn't on APKMirror: download it as an XAPK from
   [APKPure](https://apkpure.com/kalorick%C3%A9-tabulky/cz.psc.android.kaloricketabulky), or save the split
   APKs of the Play Store version from your phone as an APKS file (for example with SAI). Pick the file in
   Morphe Manager, then pick the patches you want. Keep **GmsCore support** on to sign in with Google.
5. Uninstall the Play Store version.
6. Tap Install. Android asks you to allow Morphe Manager to install unknown apps. Google Play Protect may then
   say it hasn't seen the app before: tap **More details** and **Install without scanning**.

## Updating

- **New patches:** a new version of these patches comes out every Saturday when something changed (see
  [Updating](../../README.md#updating)). Morphe Manager then marks the patched app with an Update badge. Patch
  the same Kalorické Tabulky file again and install it over the patched app. No need to uninstall: you stay
  signed in.
- **New Kalorické Tabulky version:** the patched app doesn't update from the Play Store. New versions on Google
  Play are noticed automatically every day, but the app has to be added by hand before it can be tested, so
  support can take a few days. When a release of these patches lists the new version as supported, patch that
  version the same way.

## Patches

<!-- PATCHES_START -->
Version 1.13.0, 11 patches. Supported Kalorické Tabulky versions: 3.14.71.

<details>
<summary><b>Ads</b> (1)</summary>

Ad banners and full-screen ads.

| Patch | Default | What it does |
| --- | --- | --- |
| Hide ads | on | Hides the ad banners and the full-screen ads, and never starts the ad networks (Google AdMob and AppLovin) or asks for ad consent. Premium and your subscription aren't touched. |

</details>

<details>
<summary><b>App</b> (7)</summary>

Premium offers, prompts and pop-ups.

| Patch | Default | What it does |
| --- | --- | --- |
| Disable in-app messages | on | Stops the pop-ups and banners that Kalorické Tabulky sends to the app as marketing campaigns (Firebase In-App Messaging). Push notifications and the app's own messages stay. |
| GmsCore support | on | Makes signing in with Google and push notifications work through MicroG-RE instead of Google Play services. A patched app can't sign in with Google through Play services, because it is no longer signed by its maker. Needs MicroG-RE installed, with your Google account added to it; without it, signing in with email still works, and the app says once that MicroG-RE is missing. |
| Hide device pairing pop-up | off | Hides the screen that opens by itself two days after you install the app and asks you to connect a watch, a fitness tracker or another app, when you have none connected yet. You can still connect them in the settings. |
| Hide home banner | off | Hides the picture banner on the home screen that Kalorické Tabulky fills from its servers, for example with offers and news. |
| Hide Premium buttons | off | Hides the Premium button in the home screen's top bar and the "Get Premium benefits" button in the add menu (the + button). The Premium offers you open from a Premium feature stay. |
| Hide Premium offers | on | Hides the Premium offers that show up by themselves: the trial banners on the home, search and profile screens, the Premium offer after you sign in and the full-screen Premium offer after an ad. Premium itself, its features and the offers you open yourself stay. |
| Hide rating prompts | on | Hides the card on the home screen that asks how you like the app and then asks you to rate it on Google Play. |

</details>

<details>
<summary><b>Privacy</b> (3)</summary>

Trackers and permissions. Apart from the location patch, they change nothing you see.

| Patch | Default | What it does |
| --- | --- | --- |
| Block tracking | on | Stops the analytics and marketing trackers: Firebase and Google Analytics, Firebase Crashlytics and Sessions, Facebook app events, and Kochava install and purchase tracking. Signing in, syncing your diary and Premium purchases keep working. |
| Remove location access | off | Removes the location permission. Food court (restaurant meals near you) and the partner benefits near you then can't use your location. |
| Remove unneeded permissions | on | Removes the permissions that only serve advertising and install tracking: the advertising ID, Android's ad services (ad ID, attribution, topics and custom audiences), the Google Play install referrer and the Google Play license check. |

</details>
<!-- PATCHES_END -->

## FAQ

**Is hiding ads allowed when "no ads" is part of Premium?**
The patches hide what you didn't ask to see on your own phone. They don't touch your subscription or any
Premium feature, and Premium works as before if you have it.

**Why do I need MicroG-RE for Google sign-in?**
Google Play services only signs in apps signed by their maker. A patched app is signed with your own key, so
Play services refuses it. MicroG-RE signs the app in with your Google account instead, and tells Google the
certificate the maker signs the app with. Without it, "Sign in with Google" fails; email still works.

**Why does signing in with Facebook fail?**
On our test phone, without the Facebook app, signing in through Facebook in the browser ended in "Neúspěšné
přihlášení" in the unpatched Play Store app too. With the Facebook app installed, Facebook may also refuse the
patched app, which is signed with your own key. Sign in with Google or with your email and password instead.

**Can the partner offers and praise messages be hidden?**
The partner offers (benefits, other apps' offers) come from the app's servers, mostly inside screens you open
yourself, so there is no patch for them yet; **Hide home banner** takes out the banner on the home screen. If you
see an offer you'd like gone, [open an issue](https://github.com/JoFSlash/morphe-patches/issues/new?template=feature_request.yml)
with a screenshot.

**Something doesn't work.**
Please [open an issue](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with the
app's version, and leave out your name, email and health data.

## Building

```
./gradlew :patches:buildAndroid
```

Building needs a GitHub token with `read:packages` in `GITHUB_ACTOR` / `GITHUB_TOKEN` (or `gpr.user` /
`gpr.key` in `~/.gradle/gradle.properties`), because the Morphe Gradle plugin comes from GitHub Packages.
`python .github/scripts/check_app.py kaloricke-tabulky <app.apks> --cli <morphe-cli.jar> --install --expect-screen`
applies every patch to the app (an APKS, APKM or XAPK with its split APKs) and starts it on a connected phone or
emulator, as the emulator test does.

## License

[GPLv3](../../LICENSE). Kalorické Tabulky is a trademark of its owner. This project isn't affiliated with
Kalorické Tabulky or Morphe.
