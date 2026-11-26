# LinkedIn

Patches for the LinkedIn app (`com.linkedin.android`, versions `4.1.1264`, `4.1.1267`, `4.1.1269`, `4.1.1270`, `4.1.1272`, `4.1.1275`, `4.1.1276` and `4.1.1278`, APKM from APKMirror).

## Patches

Every patch is on by default.
Morphe Manager groups them by category.

| Category | Patch | Default | What it does |
|---|---|---|---|
| Ads | Hide ads | On | Removes promoted (sponsored) posts from the feed. |
| Ads | Hide promoted jobs | On | Removes promoted job listings from the Jobs tab and job search. |
| Ads | Hide Premium upsells | On | Removes Premium and AI upsell cards and banners, including on profiles and the profile menu. |
| Feature | Download media | On | Download buttons on profile photos and banners, and Download media in the ⋯ menu of posts (photos, videos, or a document as PDF). Adds a switch in Fakh Patches. |
| Feature | More tab | On | Hides items of the More tab (Puzzle games, Groups, Events, Newsletters), or lists them at the bottom of the profile menu. Adds a Puzzle games shortcut to the LinkedIn app icon, with its own switch. |
| Feature | Swipe between tabs | On | Swipe sideways to go to the next or previous tab of the navigation bar, with a slide animation. On My Network it first switches between Grow and Catch up. Does not act where something under the finger can scroll sideways. |
| Feature | Always show navigation bar | On | Adds a switch in Fakh Patches, off by default, that keeps the navigation bar on screen while you scroll instead of sliding it away. |
| Feature | Hide top bar buttons | On | Adds a Top bar buttons sheet in Fakh Patches to hide the Post and Messaging buttons of the top bar, and to show or hide the Feed sort button (Most relevant or Most recent), which LinkedIn only shows in the EU. |
| Feature | Navigation bar | On | Adds switches in Fakh Patches to show or hide the More, Jobs, Network and Notifications tabs of the navigation bar (and Post, Video, News and Messaging, which can be added even when LinkedIn leaves them out; an added Video tab opens the server's video screen), its notification badges and its tab labels. The tabs can be sorted in the same sheet (Home stays first). |
| Feature | GmsCore support | On | Makes "Continue with Google" work by signing in through [microG RE](https://github.com/MorpheApp/microg-RE) instead of Google Play services. Needs microG RE installed and signed in to a Google account. |
| Feed | Hide suggested posts | On | Removes "Suggested" posts from people outside your network. |
| Feed | Feed filters | On | Adds filters you can turn on in Fakh Patches: engagement counts, celebrations, job cards, network activity (likes, comments, reposts), video posts, "Recommended for you", puzzle games, the "New posts" pill, "Show translation", the Follow and Connect buttons on posts and comments, the connection degree (1st, 2nd, 3rd), the exact date and time of a post instead of its age, comments that open with the most recent first, and muted words and muted authors that hide posts by their text or by who wrote them. All start off. |
| Feed | Disable double-tap like | On | Double tapping a post or photo no longer likes it. |
| Feed | Expand posts | On | Adds a switch in Fakh Patches that shows posts expanded by default. Tapping the text collapses them. Starts off. |
| Feed | Copy text | On | Adds Copy text to the ⋯ menu of posts and comments, with its own icon. Adds a switch in Fakh Patches. |
| Feed | Disable screenshot share sheet | On | Stops the Share sheet from opening when you take a screenshot of a post. Adds a switch in Fakh Patches. |
| Feed | Keep feed on reopen | On | Keeps your place in the feed when you come back to LinkedIn instead of reloading it. Pull down or tap "New posts" to load new posts. |
| Feed | Tap to hide controls in viewers | On | Tap a video or document in full screen to hide its caption and buttons, like photos. |
| Feed | Video tab | On | Shows the video's time above the seek bar, in the Video tab and the full screen video viewer, and can go to the next video of the tab when one ends. Adds switches in Fakh Patches. |
| Privacy | Messaging | On | Hides sponsored messages, and adds an optional ghost mode that sends no typing indicator and no automatic read receipts, except in a chat you reply to. |
| Privacy | Open links directly | On | Opens outside links without LinkedIn's warning page, including `lnkd.in` short links. |
| Privacy | Sanitize share links | On | Strips tracking parameters from LinkedIn links you copy or share. |
| Privacy | Disable analytics | On | Adds a switch, on by default, that stops most LinkedIn analytics events from being sent. |
| Privacy | Anonymous profile viewing | On | Adds a switch, on by default, that stops the app from reporting your visits to profiles, so they are not listed in "Who viewed your profile". |
| Theme | Material You | On | Wallpaper colors (Android 12+) instead of LinkedIn blue for accents, backgrounds, cards, bars and borders. Some screens drawn by LinkedIn's servers keep their own colors. |
| Theme | Pitch black | On | Replaces the gray backgrounds of dark mode with black, and cards with a slightly lighter black. Works with or without Material You. |
| Theme | Dark app icon | On | Black app icon with the white "in". Off until you turn it on in Fakh Patches. |
| Theme | Material icons in the navigation bar | On | Material icons for the Home, My Network, Notifications, Jobs, Video and Messaging tabs, filled when selected. Off until you turn it on in Fakh Patches. |
| Theme | Hide gaps and dividers | On | Removes the gray gaps between posts and the dividers between list items, so the feed and lists are one flat surface. |
| Theme | Glass navigation bar | On | Draws the navigation bar as a floating, translucent capsule with a sliding selection pill, in the style of the glass navigation bar of [Morphe Patches](https://github.com/MorpheApp/morphe-patches). Slide a finger along the bar to switch tabs, with a haptic tick for each tab. The **Background blur** switch (off by default) blurs what's behind the bar and bends it at the edges on Android 12 and newer. The pill takes the wallpaper accent with Material You and stays neutral gray without it. |

Settings are in **Fakh Patches** on LinkedIn's Settings screen (profile menu → Settings & Privacy), or long press
the Home tab. Each category opens its own page; search looks through all of them.

## How the patches work

**Download media** hands the file to Android's download manager, so it shows a notification when
it is done. Files go to `Download/LinkedIn` unless you pick another folder in Fakh Patches, where
you can also split photos into `Pictures` and videos into `Movies`. Videos download in the highest
resolution LinkedIn offers. For a document, Download media in the ⋯ menu saves the original PDF when the author
allows downloads. Otherwise it puts the pages LinkedIn shows together into one PDF.

**Open links directly** needs the real target of a `lnkd.in` short link, which LinkedIn only shows
on its warning page. When the feed loads posts with short links, the patch fetches those pages in
the background and remembers the targets, so a tap opens the site right away. A short link that is
not resolved yet opens LinkedIn's warning page as usual, and is ready the next time. Resolving short
links has its own switch in Fakh Patches.

**Messaging** ghost mode only blocks the read receipts the chat screen sends by itself. Marking a
chat as read or unread from the chat list still works. With **Mark as read when you reply** on, the
chat screen's next read receipt after your reply is sent.

**Muted words** and **Muted authors** take one entry per line (or separated by commas) and match
whole words in any case. Muted words looks at the text of a post and of the post it reposts, and
Muted authors at the names of their authors. **Show exact post time** reads the time from the post's id, and keeps the age when
no id fits it.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o linkedin-patched.apk <LinkedIn 4.1.1278 APKM>
```

## Getting the APK

Download the `4.1.1278` APKM from APKMirror; `4.1.1264`, `4.1.1267`, `4.1.1269`, `4.1.1270`, `4.1.1272`, `4.1.1275` and `4.1.1276` work too. Morphe Manager looks the app up on
APKMirror itself, so it can take you to that page.

## Credits

Based on [Michii Patches](https://github.com/heyymichii/michii-patches) by heyymichii (GPLv3). GmsCore
support follows Morphe's own GmsCore support patch (GPLv3).

