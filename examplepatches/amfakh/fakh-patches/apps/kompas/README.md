# KOMPAS.com

Patches for **KOMPAS.com** (`com.ertanto.kompas.official`, "KOMPAS.com+ News Updates" on APKPure), version `9.8.4`,
as an XAPK.

## Patches

Every patch is on by default except GmsCore support. Morphe Manager groups them by category.

| Category | Patch | What it does |
|---|---|---|
| Ads | Hide ads | Removes the ad banners together with their grey "Iklan" block from the home feed, articles, lists and the Video tab, the native ad in the home feed, the video ad before a video starts, the Teads video ad in articles, the full-screen ad, and the banners on kompas.com pages opened in the app (such as Harga Emas). |
| Privacy | Disable analytics | Stops AppsFlyer, Mixpanel and Insider from tracking installs, reads and other in-app events, and turns off Firebase Analytics, Crashlytics, Performance and Sessions. |
| Feature | Stop autoplay | Stops the videos in the "Video Pilihan" block under an article from playing on their own. They play when tapped. |
| Feature | GmsCore support | Makes "Login dengan Google" work by signing in through microG RE (GmsCore) instead of Google Play services. Off by default. |

## How the patches work

The app checks an `allowAds` preference before every ad slot, including the IMA ad tag that the video player plays
before a video. **Hide ads** makes the app read it as off, the state an ad-free account gets. As a fallback, every
banner is a Google `AdManagerAdView` that the app wraps with an "Iklan - Scroll ke bawah untuk melanjutkan"
label and a "Gabung Kompas.com+" note. **Hide ads** hides each banner as it is built, collapses that wrapper and the
list row it sits in, and skips the ad request. The native feed ad and the full-screen ad are only shown once their
request returns, so the patch skips those requests. The Teads row in an article is collapsed before it asks for an ad.
Sponsored article labels are part of the article and stay.

Living Assistance (Harga Emas and the like) and links from articles open kompas.com pages in a WebView, with the site's
own sticky banners at the top and bottom. On those screens **Hide ads** answers requests to the ad networks with an
empty response and adds a style sheet that hides the slots the site keeps for them.

**Disable analytics** sets Firebase's own manifest switches and disables the service its upload pipeline finds its
backends through. AppsFlyer's init, start and logEvent calls do nothing. Mixpanel reports itself as opted out, so each
of its track calls returns early, and Insider is never initialized. Push notifications go through the app's own
messaging service, which the patch leaves alone. AppsFlyer also resolves `kompascom.onelink.me` links, so those now open the app's home instead of the page they
point to; `kompas.com` links are not affected.

"Video Pilihan" is the `widget.kompas.com/kgplayer` page in a WebView, which embeds the KGNow player in an iframe.
**Stop autoplay** loads each player with `autoplay=none`. The server ignores that parameter for the app's article
`position` values, so the patch drops `position` from the player URL.

"Login dengan Google" uses the legacy Google Sign-In with an ID token, which Google only issues to the app's own
signing certificate, so a patched app gets DEVELOPER_ERROR from Play services. **GmsCore support** sends the app's
Play services calls to microG RE, which presents KOMPAS.com's certificate instead. Install
[microG RE](https://github.com/MorpheApp/microg-RE) and sign in to a Google account in it first.

The installed Play Store app must be uninstalled first: it is signed with another key.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o kompas-patched.apk <KOMPAS.com 9.8.4 XAPK>
```

## Getting the APK

Download the `9.8.4` XAPK from APKPure by hand. Morphe Manager's own lookup only knows APKMirror
and Uptodown pages.
