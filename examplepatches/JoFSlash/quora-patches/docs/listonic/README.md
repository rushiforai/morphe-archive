# Listonic patches for Morphe

[![Latest release](https://img.shields.io/github/v/release/JoFSlash/morphe-patches?label=release)](https://github.com/JoFSlash/morphe-patches/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/JoFSlash/morphe-patches/total)](https://github.com/JoFSlash/morphe-patches/releases)
[![License](https://img.shields.io/github/license/JoFSlash/morphe-patches)](../../LICENSE)

Patches for the [Listonic](https://play.google.com/store/apps/details?id=com.l) Android app, a grocery shopping
list, applied with [Morphe](https://morphe.software). The patches take out the ads, the sale campaigns and the
prompts that show up by themselves, and the analytics and marketing trackers.

Works with Listonic <!-- VERSIONS_START -->9.25.2 and 9.25.1<!-- VERSIONS_END --> on Android 12L or newer. No root needed.

- **No ads:** no banners, no ads between your list items, no full-screen ads, no partner leaflets, and the ad
  networks aren't started when the app opens. The ads you choose to watch for Broccoli coins still work.
- **No nagging:** no "Black Friday sale" campaigns, no Premium offer after the first start, no rating prompts
  or "Love Listonic?" cards, no marketing pop-ups, no Google Play update screens.
- **Your choice:** hide the Premium buttons and sections, the Broccoli coins, the Food facts tab or the
  Assistant's suggestions below your lists, and take away location access.
- **Less tracking:** no AdShift, TikTok, Gemius or Microsoft Clarity, no Firebase Analytics, Crashlytics or
  Performance, no Facebook app events, and no advertising ID.
- **Sign in with Google without Google Play services:** through MicroG-RE.

These patches don't unlock Premium. Themes, fonts, widgets and the unlimited Assistant stay Premium (themes can
still be unlocked with Broccoli coins), and the patches don't change what your subscription gives you.

## Before you install

- **Signing in with Google needs MicroG-RE.** Google only signs in the app signed by its maker, so the patched
  app signs in through [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases) instead of Google Play
  services (keep **GmsCore support** on). Install it and add your Google account to it (MicroG-RE settings >
  Accounts). Push notifications, for example when someone changes a shared list, come through MicroG-RE too.
  The lists work without an account as well.
- **Signing in with Facebook** goes through Facebook's page in your browser and works with the patched app.
- **Links from Listonic's emails need one setting.** Android only opens Listonic's links (the "Log in without
  password" email, shared lists) in the app signed by its maker; for the patched app they open Google Play
  instead. Allow them once: Settings > Apps > Listonic > **Open by default** > **Add links**, and tick
  `button.listonic.com` and `flyers.listonic.com`. Then tap the link in the email again.
- **The patched app replaces the Play Store version.** It is signed with a different key, so uninstall the Play
  Store version first. If you're signed in, your lists stay in your account; lists on a device without an account
  are lost when you uninstall, so sign in or share them first.

## Install

1. To sign in with Google, install [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases) and add your
   Google account to it (MicroG-RE settings > Accounts).
2. Install Morphe Manager from [morphe.software](https://morphe.software).
3. Add this repository as a patch source: open
   [this link](https://morphe.software/add-source?github=JoFSlash/morphe-patches) on your phone, or add
   `https://github.com/JoFSlash/morphe-patches` under sources in Morphe Manager.
4. Get a supported version of Listonic. Download it as an XAPK from
   [APKPure](https://apkpure.com/grocery-shopping-list-listonic/com.l), or save the split APKs of the Play Store
   version from your phone as an APKS file (for example with SAI). Pick the file in Morphe Manager, then pick the
   patches you want. Keep **GmsCore support** on to sign in with Google.
5. Uninstall the Play Store version.
6. Tap Install. Android asks you to allow Morphe Manager to install unknown apps. Google Play Protect may then
   say it hasn't seen the app before: tap **More details** and **Install without scanning**.

## Updating

- **New patches:** a new version of these patches comes out every Saturday when something changed (see
  [Updating](../../README.md#updating)). Morphe Manager then marks the patched app with an Update badge. Patch
  the same Listonic file again and install it over the patched app. No need to uninstall: you stay signed in.
- **New Listonic version:** the patched app doesn't update from the Play Store. New versions on Google Play are
  noticed automatically every day, but the app has to be added by hand before it can be tested, so support can
  take a few days. When a release of these patches lists the new version as supported, patch that version the
  same way.

## Patches

<!-- PATCHES_START -->
Version 1.13.0, 14 patches. Supported Listonic versions: 9.25.2, 9.25.1.

<details>
<summary><b>Ads</b> (2)</summary>

Banners, ads between list items, full-screen ads and partner leaflets.

| Patch | Default | What it does |
| --- | --- | --- |
| Hide ads | on | Hides the banners, ads between list items and full-screen ads, and doesn't start the ad networks (AppLovin, Google, AdAdapted, Smart and their partners) when the app opens, or ask for ad consent. The ads you choose to watch for Broccoli coins still work. Premium and your subscription aren't touched. |
| Hide partner offers | on | Hides the shop leaflets and partner offers (Offerista) shown on the lists screen and inside your lists. The offers and leaflets you open yourself stay. |

</details>

<details>
<summary><b>App</b> (9)</summary>

Premium offers and buttons, prompts, coins and Google sign-in.

| Patch | Default | What it does |
| --- | --- | --- |
| Disable in-app messages | on | Stops the pop-ups and banners that Listonic sends to the app as marketing campaigns (Firebase In-App Messaging). Push notifications and the app's own messages stay. |
| GmsCore support | on | Makes signing in with Google and push notifications work through MicroG-RE instead of Google Play services. A patched app can't sign in with Google through Play services, because it is no longer signed by its maker. Needs MicroG-RE installed, with your Google account added to it; without it, the lists work without an account or with an email sign-in, and the app says once that MicroG-RE is missing. |
| Hide Assistant suggestions | off | Hides the Assistant's suggestions (such as "Suggest missing products" and "Quick dinner idea") below your lists. The Assistant itself stays. |
| Hide Broccoli coins | off | Hides the Broccoli coins button in the top bars and the Broccoli coins card on the profile screen, for when you don't collect coins for ads. Coins you have stay in your account. |
| Hide Food facts | off | Hides the Food facts tab that shows up in the bottom bar. |
| Hide Premium buttons | off | Hides the "Buy premium" button in the lists screen's top bar, the "Remove ads, Upgrade now!" card and the "Discover Premium benefits" section on the profile screen, and the PREMIUM section of the settings. A subscription is managed in Google Play. |
| Hide Premium offers | on | Hides the Premium offers that show up by themselves: the sale campaigns (such as "Black Friday sale! -50%") on the lists screen and the Premium offer that opens after the first start. Premium itself, its features and the offers you open yourself stay. |
| Hide rating prompts | on | Hides what asks you to rate the app on Google Play: the prompt after a while of use, the "Love Listonic?" card on the profile screen and the "Enjoying the app?" row below it. |
| Hide update prompts | on | Stops the Google Play update-available and forced-update screens. Google Play can't update a patched app; update it by patching the new version. |

</details>

<details>
<summary><b>Privacy</b> (3)</summary>

Trackers and permissions. They change nothing you see.

| Patch | Default | What it does |
| --- | --- | --- |
| Block tracking | on | Stops the trackers: AdShift install attribution, TikTok event reporting, Gemius audience measurement, Microsoft Clarity session recording, Firebase Analytics, Crashlytics and Performance, and Facebook's automatic app events. Your lists, sync and sign-in aren't touched. |
| Remove location access | off | Removes the location permissions. Listonic uses your location only for shops and offers near you; without them it can't ask for your location. |
| Remove unneeded permissions | on | Removes the permissions that only serve advertising and tracking: the advertising ID, Android's ad services, the Google Play install referrer, phone state, the advertising IDs of some phone makers and Amazon's ad attestation. With the ad and tracking patches on, nothing in the app uses them. |

</details>
<!-- PATCHES_END -->

## FAQ

**Is hiding ads allowed when "no ads" is part of Premium?**
The patches hide what you didn't ask to see on your own phone. They don't touch your subscription or any
Premium feature, and Premium works as before if you have it.

**Why do I need MicroG-RE for Google sign-in?**
Google Play services only signs in apps signed by their maker. A patched app is signed with your own key, so
Play services refuses it. MicroG-RE signs the app in with your Google account instead, and tells Google the
certificate the maker signs the app with. Without it, "Continue with Google" fails.

**Where did the consent pop-up go?**
The "Listonic asks for your consent" pop-up only serves the ad networks, which **Hide ads** keeps off, so it
doesn't open by itself. You can still open it from the privacy settings.

**The login link from the email opens Google Play.**
Android checks that the app opening Listonic's links is signed by Listonic, so for a patched app it hands the
link to the website, which sends you to Google Play. Allow the links in Settings > Apps > Listonic > **Open by
default** > **Add links** (`button.listonic.com` and `flyers.listonic.com`) and tap the link again.

**Something doesn't work.**
Please [open an issue](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with the
app's version, and leave out your name, email and your lists.

## Building

```
./gradlew :patches:buildAndroid
```

Building needs a GitHub token with `read:packages` in `GITHUB_ACTOR` / `GITHUB_TOKEN` (or `gpr.user` /
`gpr.key` in `~/.gradle/gradle.properties`), because the Morphe Gradle plugin comes from GitHub Packages.
`python .github/scripts/check_app.py listonic <app.apks> --cli <morphe-cli.jar> --install --expect-screen` applies
every patch to the app (an APKS, APKM or XAPK with its split APKs) and starts it on a connected phone or
emulator, as the emulator test does.

## License

[GPLv3](../../LICENSE). Listonic is a trademark of its owner. This project isn't affiliated with Listonic or
Morphe.
