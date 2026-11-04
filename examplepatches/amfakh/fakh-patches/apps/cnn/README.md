# CNN Indonesia

Patches for **CNN Indonesia** (`com.cnn.indonesia`), version `2.50.7`, as an APK from APKMirror.

## Patches

Every patch is on by default. Morphe Manager groups them by category.

| Category | Patch | What it does |
|---|---|---|
| Ads | Hide ads | Removes the ad banners, native "Promoted" ads, sticky ads and full-screen ads, and the ads on cnnindonesia.com pages opened in the app. |
| Feature | Merge article pages | Shows every page of a multi-page article in one continuous article, without the page numbers. |
| Privacy | Disable analytics | Stops Detik Analytics and Google Analytics from recording screens and events, and turns off Firebase Analytics, Crashlytics, Performance and Sessions. |

## How the patches work

Every banner, native ad and sticky ad looks up its placement through `UtilMonetize.getMonetize` and hides its row when there
is none. **Hide ads** makes that lookup find nothing and skips the full-screen ad. The article and in-app browser WebViews
answer requests to the ad networks with an empty response, and the Google Mobile Ads SDK is not started.

**Disable analytics** stops the Detik Analytics recorders and the Google Analytics tracker, including its advertising ID
collection. Firebase is turned off through its manifest switches, and the service its upload pipeline finds its backends
through is disabled. Push notifications stay.

**Merge article pages** runs when the article screen sets up its pages. The app already holds every page, so the patch writes
them one after the other (with each page's image or video) into the first page, tells the app there is one page, and hides the
row of page numbers and the next-page button.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o cnn-patched.apk <CNN Indonesia 2.50.7 APK>
```
