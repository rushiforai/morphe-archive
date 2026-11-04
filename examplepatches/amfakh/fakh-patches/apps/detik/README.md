# detikcom

Patches for **detikcom** (`org.detikcom.rss`), version `7.14.1`, as an APK from APKMirror.

## Patches

Every patch is on by default. Morphe Manager groups them by category.

| Category | Patch | What it does |
|---|---|---|
| Ads | Hide ads | Removes the ad banners, native ads, full-screen ads and video ads, and the ads on detik.com pages opened in the app. |
| Privacy | Disable analytics | Stops Detik Analytics from recording screens and events, keeps the Android ID out of article pages, and turns off Firebase Analytics, Crashlytics, Performance and Sessions. |
| Feature | Merge article pages | Shows every page of a multi-page article in one continuous article, without the page numbers. |
| Feature | Stop autoplay | Stops the videos and live streams embedded in articles from playing on their own. They play when tapped. |

## How the patches work

Every ad slot looks up its placement through the app's AdsManager and skips itself when there is none. **Hide ads** makes
that lookup find nothing, which covers the banners, the native ads, the full-screen ad and the video ad tags. The static
banner row in the feed keeps a placeholder without a banner, so the patch collapses it. The ad script sent with each
article is dropped, and the article, in-app browser, feature page (such as Live TV) and Milidetik WebViews answer requests
to the ad networks with an empty response. Milidetik's full-screen ad cards between stories are removed as well.
The Google Mobile Ads SDK is not started.

**Disable analytics** stops the Detik Analytics recorders, so nothing reaches `mobile-analytic.detik.com`. The article page
loads a live reader counter script with the Android ID in its URL; the patch leaves the ID empty. Firebase is turned off
through its manifest switches, and the service its upload pipeline finds its backends through is disabled. Push
notifications stay.

The app receives all pages of an article in one response and swaps the article body when a page number is tapped.
**Merge article pages** writes the pages one after the other into the body, each with its own image and caption, and leaves
out the row of page numbers. A page that repeats the cover image leaves it out.

The 20detik player embedded in an article, for a video or a live stream, starts by itself, muted. Its page turns that off
when the URL carries `smartautoplay=false`, so **Stop autoplay** sets the parameter on each player URL in the article body.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o detik-patched.apk <detikcom 7.14.1 APK>
```
