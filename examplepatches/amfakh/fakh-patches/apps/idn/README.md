# IDN

Patches for **IDN** (`com.idntimes.idntimes`, "IDN App: News & Entertainment" on APKPure),
version `6.69.0`, as an XAPK.

## Patches

Every patch is on by default. Morphe Manager groups them by category.

| Category | Patch | What it does |
|---|---|---|
| Ads | Hide ads | Removes the Google ad banners from the home, article, quiz, event and live screens, and the promo popups (such as the full-screen one at launch). The free-episode ads in short movies stay. |
| Layout | Hide Create button | Removes the "+" button (write news, start a live stream) from the middle of the bottom navigation. |
| Layout | Hide home tabs | Adds switches to hide the Nonton, IDN Live, Berita and Quiz tabs. |
| Layout | Hide package banner | Removes the "Beli Paket" banner from the profile. |
| Privacy | Disable analytics | Stops AppsFlyer, CleverTap, Firebase Analytics, Crashlytics, Google Tag Manager, comScore and Facebook events from collecting data. Push notifications and the app's own Lifestream activity feed stay. |
| Feature | Stop autoplay | Adds an Autoplay setting that can stop the video previews and the automatic sliding of the home banners. |
| Feature | Redirect Gold purchase | Opens `connect.idn.media/my-account/gold` in the browser instead of the in-app Gold top up. |
| Feature | Allow Developer options | Lets short movies play while Developer options are turned on, instead of asking to turn them off. |

## Fakh Patches page

Profile > Settings has a "Fakh Patches" row. The page is in Indonesian and looks like the app's own Settings, with an
Off/On chip pair per feature that was patched in. On shows the thing (a tab, the Create button, ads, the package
banner) or, for Autoplay, lets it play; Off removes it. A snackbar offers to restart the app, because the changes apply
on the next start. At least one home tab always stays.

## How the patches work

Every banner is loaded through Google's `AdManagerAdView`, so **Hide ads** skips that request and
collapses the frame the banner would sit in. The popups are CleverTap in-app campaigns; the patch
drops them before they are shown. Push notifications use another path and still arrive.

The short movie player reads Developer options together with a root check and shows a "developer
mode" sheet when the setting is on. **Allow Developer options** makes the app read the setting as
off; the root check stays.

The installed Play Store app must be uninstalled first: it is signed with another key.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o idn-patched.apk <IDN 6.69.0 XAPK>
```

## Getting the APK

Download the `6.69.0` XAPK from APKPure by hand. Morphe Manager's own lookup only knows APKMirror
and Uptodown pages.
