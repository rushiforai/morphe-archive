<!-- HEADER_START -->
# <img src="../../assets/icons/com.linkedin.android.svg" width="36" height="36" align="top" alt=""> LinkedIn

![version](https://img.shields.io/badge/version-4.1.1272-2563eb?style=for-the-badge&labelColor=0d1117) ![patches](https://img.shields.io/badge/patches-23-14b8a6?style=for-the-badge&labelColor=0d1117) ![file](https://img.shields.io/badge/file-APK%20%28Android%2010%2B%29-0ea5e9?style=for-the-badge&labelColor=0d1117) ![menu](https://img.shields.io/badge/menu-Me%20panel-6e7681?style=for-the-badge&labelColor=0d1117)

[← All apps](../../README.md#apps)&nbsp;&nbsp;•&nbsp;&nbsp;`com.linkedin.android`&nbsp;&nbsp;•&nbsp;&nbsp;[v3.3.0](https://github.com/lokesh-sparrow/loki-patches/releases/tag/v3.3.0)

**🎯 Supported versions:** `4.1.1270` · `4.1.1272`
<!-- HEADER_END -->

## Features

| Feature | What you get |
|---|---|
| ✂️ **Copy text** | Long press any post, comment or profile text to select and copy it, right where it is |
| 🚫 **No ads** | Promoted posts, promoted jobs, Premium and AI upsells, sponsored messages |
| ⬇️ **Downloads** | Photos and videos in full screen (one or **all** of a post), profile photos and banners, in the best quality |
| 📄 **Documents as PDF** | Save a post's document or carousel as one PDF file |
| 🧹 **Feed filters** | Focus mode, and hide suggested posts, celebrations, job cards, network activity, videos, AI suggestions and more |
| 🕵️ **Anonymous profile viewing** | Visit profiles without showing up in their "Who viewed your profile" (experimental) |
| 👻 **Ghost mode** | Chat without the typing indicator or automatic read receipts |
| 🔗 **Clean links** | Open outside links directly, strip tracking from links you share |
| 🛡️ **Block tracking** | Stop most of LinkedIn's analytics |
| 🎨 **Material You** | Your wallpaper's colors, and an optional flat feed without gaps |
| ⚫ **AMOLED black bars** | Pure black top bar, bottom bar and side menu in dark mode (needs Material You) |
| 🖤 **Dark app icon** | Black launcher icon with the white "in", instead of LinkedIn's blue (optional) |
| 👆 **Swipe between feeds** | Swipe left or right to switch For you and Network, and Grow and Catch up |
| 🖼️ **Tap to hide in viewers** | Tap a document or video in full screen to hide its caption and buttons |
| ⋯ **Post menu items** | Copy text, Download media and Save as PDF in a post's menu |
| 🧭 **Hide bottom tabs** | Take My Network, Jobs and More out of the bottom bar (More hidden by default) |
| 🔑 **Google sign-in** | "Continue with Google" through MicroG-RE |

## How-to

### Open the Loki Patches menu

Open it from the **Me** panel (tap your profile photo), or long press the LinkedIn icon on your home screen → **Loki Patches**.

### Sign in with Google

1. Install [MicroG-RE](https://github.com/MorpheApp/microg-RE) and sign in to your Google account in it.
2. In Morphe Manager, tick **GmsCore support (LinkedIn)** when you patch LinkedIn.
3. Use **Continue with Google** in LinkedIn as usual.

### Copy text

LinkedIn doesn't let you copy what people write. With Loki Patches you can:

1. **Long press** any text: a post, a comment, a profile's About, a job description.
2. The word under your finger is selected **right where it is**, with Android's selection handles and
   the **Copy · Select all · Share** bar, the same as in any other app.
3. Drag the handles to select more. On posts cut off by "…more", the bar also has **Copy full text**.
4. Tap anywhere to go back.

Long presses that already do something in LinkedIn, like the reaction button, keep working as before.
A tap or a scroll works as usual.

### Anonymous profile viewing

Visit a profile without it appearing in that member's "Who viewed your profile", or in company page visitor lists.

1. Turn on **Anonymous profile viewing** in the Loki Patches settings, under **Privacy**. It is off by default and
   marked experimental.
2. Open profiles as usual. The app leaves out the analytics events that profile pages send, so the visit is not counted.

It works by not sending those events, not by hiding the visit on the server. LinkedIn can change what a profile page
sends in any update; if a visit still appears, please report it with the diagnostic log.

## FAQ

**How do I stop videos playing on their own, or hide that I'm online?**
LinkedIn has its own settings for both, and Loki Patches leaves them to LinkedIn: **Settings → Account preferences →
Autoplay videos → Never**, and **Settings → Visibility → Manage active status → No one**.

**Is anonymous profile viewing reliable?**
It's experimental. It stops the app from sending the analytics events of profile pages, which is how LinkedIn
counted visits in our tests on 4.1.1270. LinkedIn could change that in an update. If someone still sees you, please
report it.

**I signed up with Google and can't sign in.**
Signing in with your e-mail and password always works. If you have no password, set one on
[linkedin.com](https://www.linkedin.com/checkpoint/rp/request-password-reset) first, or use **GmsCore support (LinkedIn)** with
MicroG-RE.

**Material You or AMOLED black doesn't change some screens.**
The colors are read when the app is patched, and a few older screens in LinkedIn keep the ones they were built with.

## Patches

<!-- PATCHES_START -->
| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|---|---|---|
| **AMOLED black bars** | Turns the dark top bar, bottom bar, side menu and the other screens the app draws pure black, matching the feed that the AMOLED black setting already covers. Needs Material You. |  |
| **Anonymous profile viewing** | Adds an option (off by default, experimental) to visit profiles without being listed in "Who viewed your profile": the analytics events of profile pages are not sent. |  |
| **Block tracking** | Adds a switch (off by default) that stops most of LinkedIn's analytics events from being sent. |  |
| **Copy text** | Long press a post, comment or any other text to select and copy it in place, like on Reddit. |  |
| **Dark app icon** | Black launcher icon with the white "in", instead of LinkedIn's blue. Chosen when patching: a launcher icon cannot switch with dark mode on its own. |  |
| **Disable double-tap like** | A double tap on a post or a photo no longer likes it. |  |
| **Download media** | Puts a download button in the full screen photo, video and document viewer; documents (PDFs and carousels) are saved as a single PDF. |  |
| **Feed filters** | Adds a set of filters that are off until turned on in Loki Patches: focus mode, celebrations, job cards, reposts, posts from other people's activity, "Recommended for you", video posts, games, the "New posts" pill and "See translation". |  |
| **GmsCore support (LinkedIn)** | Routes "Continue with Google" and Firebase push through MicroG-RE (GmsCore) instead of Google Play services. Signs the FCM registration with LinkedIn's original certificate, so notifications still arrive on a re-signed build. MicroG-RE has to be installed and signed in to a Google account. |  |
| **Hide ads** | Removes sponsored (promoted) posts from the feed. |  |
| **Hide bottom tabs** | Adds switches to take My Network, Jobs and More out of the bottom bar (More is hidden by default). |  |
| **Hide Premium upsells** | Drops the Premium and AI upsell cards and banners, on profiles and in the Me panel too. |  |
| **Hide promoted jobs** | Drops promoted job listings from the Jobs tab and from job searches. |  |
| **Hide suggested posts** | Drops the "Suggested" posts from people outside your network. |  |
| **Keep feed on reopen** | Keeps your place in the feed when you come back to LinkedIn, instead of reloading it. Pull down or tap the "New posts" button to load new posts. |  |
| **Material You** | Takes the colors from your wallpaper (Android 12+): the accent replaces LinkedIn blue and the green of the selected filters, and the backgrounds, cards, bars and borders become Material 3 surfaces. Some screens LinkedIn draws from its servers may keep their own colors. |  |
| **Messaging** | Drops sponsored messages from the inbox, and adds an optional ghost mode that sends no typing indicators and no read receipts. |  |
| **Open links directly** | Skips LinkedIn's safety/go warning page and opens external links straight away. |  |
| **Post menu items** | Adds Copy text, Download photos and videos, and Save document as PDF to the ⋯ menu of posts. |  |
| **Remove gaps and dividers** | Removes the gray gaps between posts and the dividers between list items, so the feed and the lists read as one flat surface. |  |
| **Sanitize share links** | Strips the tracking parameters from LinkedIn links that get copied or shared. |  |
| **Swipe between feeds** | Swipe left and right on the home feed to switch between For you and Network, like on X. |  |
| **Tap to hide in viewers** | Tap a video or document in full screen to hide the caption and buttons, like photos. |  |
<!-- PATCHES_END -->
