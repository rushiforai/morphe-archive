# LinkedIn

Patches for the LinkedIn app (`com.linkedin.android`, versions `4.1.1264`, `4.1.1267`, `4.1.1269`, `4.1.1270`, `4.1.1272`, `4.1.1275`, `4.1.1276` and `4.1.1278`, APKM from APKMirror).

## Patches

Every patch is on by default.
Morphe Manager groups them by category, named after the pages of Fakh Patches.

| Category | Patch | Default | What it does |
|---|---|---|---|
| Ads & promotions | Hide ads | On | Removes promoted (sponsored) posts from the feed. |
| Ads & promotions | Hide promoted jobs | On | Removes promoted job listings from the Jobs tab and job search. |
| Ads & promotions | Hide suggested posts | On | Removes "Suggested" posts from people outside your network. |
| Ads & promotions | Hide Premium upsells | On | Removes Premium and AI upsell cards and banners, including on profiles and the profile menu. |
| Feed | Muted words | On | Hides posts whose text, or the text of the post they repost, has one of the words or phrases you list. |
| Feed | Muted authors | On | Hides posts by the people and pages you list, and posts that repost them. |
| Feed | Hide celebration posts | On | Hides work anniversaries and new jobs. |
| Feed | Hide job posts | On | Hides job cards in the feed. |
| Feed | Hide network activity | On | Hides the likes, comments and reposts of people you know. |
| Feed | Hide video posts | On | Hides video posts. |
| Feed | Hide "Recommended for you" | On | Hides the lists of people and pages to follow. |
| Feed | Hide puzzle games | On | Hides the puzzle games in the feed. |
| Feed | Hide the "New posts" button | On | Hides the "New posts" pill above the feed. |
| Feed | Keep feed on reopen | On | Keeps your place in the feed when you come back to LinkedIn instead of reloading it. Pull down or tap "New posts" to load new posts. |
| Posts | Expand posts | On | Shows posts expanded by default. Tapping the text collapses them. |
| Posts | Copy text | On | Adds Copy text to the ⋯ menu of posts and comments, with its own icon. |
| Posts | Hide "Show translation" | On | Hides "Show translation" under posts and comments. |
| Posts | Hide engagement counts | On | Hides the like, comment and repost counts of posts. |
| Posts | Hide Follow and Connect | On | Hides the Follow and Connect buttons on posts and comments. |
| Posts | Hide connection degree | On | Hides the 1st, 2nd and 3rd next to names. |
| Posts | Show exact post time | On | Shows the date and time of a post instead of its age. |
| Posts | Disable double-tap like | On | Double tapping a post or photo no longer likes it. |
| Posts | Disable screenshot share sheet | On | Stops the Share sheet from opening when you take a screenshot of a post. |
| Posts | Most recent comments first | On | Opens comments sorted by Most recent. |
| Video & viewers | Tap to hide controls in viewers | On | Tap a video or document in full screen to hide its caption and buttons, like photos. |
| Video & viewers | Show video time | On | Shows the video's time above the seek bar, in the Video tab and the full screen video viewer. |
| Video & viewers | Auto-scroll videos | On | Goes to the next video of the Video tab when one ends. |
| Navigation bar | Navigation bar | On | Shows or hides the More, Jobs, Network and Notifications tabs of the navigation bar (and Post, Video, News and Messaging, which can be added even when LinkedIn leaves them out; an added Video tab opens the server's video screen). The tabs can be sorted in the same sheet (Home stays first). |
| Navigation bar | Hide tab labels | On | Hides the text under the icons of the navigation bar. |
| Navigation bar | Hide notification badges | On | Hides the count badges on the navigation bar tabs. |
| Navigation bar | Swipe between tabs | On | Swipe sideways to go to the next or previous tab of the navigation bar, with a slide animation. On My Network it first switches between Grow and Catch up. Does not act where something under the finger can scroll sideways. |
| Navigation bar | Glass navigation bar | On | Draws the navigation bar as a floating, translucent capsule with a sliding selection pill, in the style of the glass navigation bar of [Morphe Patches](https://github.com/MorpheApp/morphe-patches). Slide a finger along the bar to switch tabs, with a haptic tick for each tab. **Background blur** blurs what's behind the bar and bends it at the edges on Android 12 and newer. The pill takes the wallpaper accent with Material You and stays neutral gray without it. |
| Navigation bar | Material icons in the navigation bar | On | Material icons for the Home, My Network, Notifications, Jobs, Video and Messaging tabs, filled when selected. |
| Navigation bar | Always show navigation bar | On | Keeps the navigation bar on screen while you scroll instead of sliding it away. |
| Navigation bar | Hide top bar buttons | On | Hides the Post and Messaging buttons of the top bar, and shows or hides the Feed sort button (Most relevant or Most recent), which LinkedIn only shows in the EU. |
| Navigation bar | More tab | On | Hides items of the More tab (Puzzle games, Groups, Events, Newsletters). |
| Navigation bar | Show More tab items in profile menu | On | Lists the items of the More tab at the bottom of the profile menu. |
| Navigation bar | Puzzle games shortcut | On | Adds Puzzle games to the shortcuts of the LinkedIn app icon (long press the icon). |
| Appearance | Hide gaps and dividers | On | Removes the gray gaps between posts and the dividers between list items, so the feed and lists are one flat surface. |
| Appearance | Material You | On | Wallpaper colors (Android 12+) instead of LinkedIn blue for accents, backgrounds, cards, bars and borders. Some screens drawn by LinkedIn's servers keep their own colors. |
| Appearance | Pitch black | On | Replaces the gray backgrounds of dark mode with black, and cards with a slightly lighter black. Works with or without Material You. |
| Appearance | Dark app icon | On | Black app icon with the white "in". |
| Download | Download media | On | Download buttons on profile photos and banners, and Download media in the ⋯ menu of posts (photos, videos, or a document as PDF). |
| Chat & privacy | Hide sponsored messages | On | Hides sponsored messages from the chat list. |
| Chat & privacy | Ghost mode | On | Sends no typing indicator and no automatic read receipts. |
| Chat & privacy | Mark as read when you reply | On | With Ghost mode on, a chat you reply to is marked as read. |
| Chat & privacy | Open links directly | On | Opens outside links without LinkedIn's warning page. |
| Chat & privacy | Expand lnkd.in links | On | Opens the real address of `lnkd.in` short links instead of the redirect. |
| Chat & privacy | Sanitize share links | On | Strips tracking parameters from LinkedIn links you copy or share. |
| Chat & privacy | Disable analytics | On | Stops most LinkedIn analytics events from being sent. |
| Chat & privacy | Anonymous profile viewing | On | Stops the app from reporting your visits to profiles, so they are not listed in "Who viewed your profile". |
| Feature | GmsCore support | On | Makes "Continue with Google" work by signing in through [microG RE](https://github.com/MorpheApp/microg-RE) instead of Google Play services. Needs microG RE installed and signed in to a Google account. |

Settings are in **Fakh Patches** on LinkedIn's Settings screen (profile menu → Settings & Privacy), or long press
the Home tab. Each category opens its own page; search looks through all of them.

## How the patches work

**Download media** hands the file to Android's download manager, so it shows a notification when
it is done. Files go to `Download/LinkedIn` unless you pick another folder in Fakh Patches, where
you can also split photos into `Pictures` and videos into `Movies`. Videos download in the highest
resolution LinkedIn offers. For a document, Download media in the ⋯ menu saves the original PDF when the author
allows downloads. Otherwise it puts the pages LinkedIn shows together into one PDF.

**Expand lnkd.in links** needs the real target of a `lnkd.in` short link, which LinkedIn only shows
on its warning page. When the feed loads posts with short links, the patch fetches those pages in
the background and remembers the targets, so a tap opens the site right away. A short link that is
not resolved yet opens LinkedIn's warning page as usual, and is ready the next time.

**Ghost mode** only blocks the read receipts the chat screen sends by itself. Marking a
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

