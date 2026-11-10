# LinkedIn

Patches for the LinkedIn app (`com.linkedin.android`, versions `4.1.1264`, `4.1.1267`, `4.1.1269` and `4.1.1270`, APKM from APKMirror).

## Patches

Every patch is on by default except Material You, Pitch black, Hide gaps and dividers, and GmsCore support.
Morphe Manager groups them by category.

| Category | Patch | Default | What it does |
|---|---|---|---|
| Ads | Hide ads | On | Removes promoted (sponsored) posts from the feed. |
| Ads | Hide promoted jobs | On | Removes promoted job listings from the Jobs tab and job search. |
| Ads | Hide Premium upsells | On | Removes Premium and AI upsell cards and banners, including on profiles and the profile menu. |
| Feature | Download media | On | A download button on full screen photos and videos, profile photos and banners. |
| Feature | More tab | On | Hides items of the More tab (Puzzle games, Groups, Events, Newsletters), or lists them at the bottom of the profile menu. Adds a Puzzle games shortcut to the LinkedIn app icon, with its own switch. |
| Feature | Swipe between tabs | On | Swipe sideways to go to the next or previous tab of the navigation bar, with a slide animation. Does not act where something under the finger can scroll sideways. |
| Feature | Navigation bar | On | Adds switches in Fakh Patches to show or hide the More, Jobs, Network and Notifications tabs of the navigation bar, its notification badges and its tab labels. |
| Feature | GmsCore support | Off | Makes "Continue with Google" work by signing in through [microG RE](https://github.com/MorpheApp/microg-RE) instead of Google Play services. Needs microG RE installed and signed in to a Google account. |
| Feed | Hide suggested posts | On | Removes "Suggested" posts from people outside your network. |
| Feed | Feed filters | On | Adds filters you can turn on in Fakh Patches: engagement counts, celebrations, job cards, network activity (likes, comments, reposts), video posts, "Recommended for you", puzzle games, the "New posts" pill and "Show translation". All start off. |
| Feed | Copy text | On | Press and hold a post, comment or any other text to open it in a sheet where it can be selected and copied. Adds a switch in Fakh Patches. |
| Feed | Disable double-tap like | On | Double tapping a post or photo no longer likes it. |
| Feed | Expand posts | On | Adds a switch in Fakh Patches that shows posts expanded by default. Tapping the text collapses them. Starts off. |
| Privacy | Messaging | On | Hides sponsored messages, and adds an optional ghost mode that sends no typing indicator and no automatic read receipts. |
| Privacy | Open links directly | On | Opens outside links without LinkedIn's warning page, including `lnkd.in` short links. |
| Privacy | Sanitize share links | On | Strips tracking parameters from LinkedIn links you copy or share. |
| Privacy | Disable analytics | On | Adds a switch, off by default, that stops most LinkedIn analytics events from being sent. |
| Privacy | Anonymous profile viewing | On | Adds a switch, off by default, that stops the app from reporting your visits to profiles, so they are not listed in "Who viewed your profile". |
| Theme | Material You | Off | Wallpaper colors (Android 12+) instead of LinkedIn blue for accents, backgrounds, cards, bars and borders. Some screens drawn by LinkedIn's servers keep their own colors. |
| Theme | Pitch black | Off | Replaces the gray backgrounds of dark mode with black, and cards with a slightly lighter black. Works with or without Material You. |
| Theme | Hide gaps and dividers | Off | Removes the gray gaps between posts and the dividers between list items, so the feed and lists are one flat surface. |
| Theme | Glass navigation bar | Off | Draws the navigation bar as a floating, translucent capsule with a sliding selection pill, in the style of the glass navigation bar of [Morphe Patches](https://github.com/MorpheApp/morphe-patches). |

Settings are in **Fakh Patches** on LinkedIn's Settings screen (profile menu → Settings & Privacy), or long press
the Home tab.

## How the patches work

**Download media** hands the file to Android's download manager, so it shows a notification when
it is done. Files go to `Download/LinkedIn` unless you pick another folder in Fakh Patches, where
you can also split photos into `Pictures` and videos into `Movies`. Videos download in the highest
resolution LinkedIn offers.

**Open links directly** needs the real target of a `lnkd.in` short link, which LinkedIn only shows
on its warning page. When the feed loads posts with short links, the patch fetches those pages in
the background and remembers the targets, so a tap opens the site right away. A short link that is
not resolved yet opens LinkedIn's warning page as usual, and is ready the next time. Resolving short
links has its own switch in Fakh Patches.

**Messaging** ghost mode only blocks the read receipts the chat screen sends by itself. Marking a
chat as read or unread from the chat list still works.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o linkedin-patched.apk <LinkedIn 4.1.1270 APKM>
```

## Getting the APK

Download the `4.1.1270` APKM from APKMirror; `4.1.1264`, `4.1.1267` and `4.1.1269` work too. Morphe Manager looks the app up on
APKMirror itself, so it can take you to that page.

## Credits

Based on [Michii Patches](https://github.com/heyymichii/michii-patches) by heyymichii (GPLv3). GmsCore
support follows Morphe's own GmsCore support patch (GPLv3).
