## 1.1.1 (2026-11-04)

### Fixes
- The "Activate Premium" bar at the bottom of the side menu is hidden again on LinkedIn 4.1.1267. Hide Premium upsells removed it on 4.1.1261, but LinkedIn moved that code in 4.1.1267, so the bar came back.

**20 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.1.0 (2026-11-04)

### What's New
- Swipe between feeds: on the home feed, swipe left for Network and right for For you, like on X. It works while the For you and Network tabs are on screen. Swipes on photo carousels and on documents with many pages still flip through them as before.
- Tap to hide in viewers: tap a document or a video in full screen to hide the caption and the like, comment and share buttons, and tap again to bring them back, the way photos already worked.
- Documents as PDF: save a post's document or carousel as one PDF from the download button or the three-dot menu. LinkedIn's own download button in the document viewer is hidden, so there is one button on photos, videos and documents.
- Post menu items: the three-dot menu of a post now has Copy text, Download photos and videos, and Save document as PDF.
- Copy text: long press any text to select and copy it, like on Reddit. Long posts open in a scrollable sheet with the whole text, and there is a switch if you prefer to select them in place.
- Keep feed on reopen, muted words, anonymous profile viewing (experimental) and hiding of AI suggestions are included.
- LinkedIn 4.1.1267 is supported, next to 4.1.1255.1, 4.1.1259 and 4.1.1261.

### Fixes
- LinkedIn could close right after opening with an earlier test build. This release opens normally.
- Copy text lines up with the post, scrolls with it and stays selected while you scroll.
- Loki's dialogs, such as Choose media, are readable on every phone, also on light LinkedIn screens in dark mode.
- Hide Premium upsells works on LinkedIn 4.1.1267.
- The credits in Loki settings list only Loki Patches, Morphe and LinkedIn.

**20 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.0.0 (2026-11-03)

### What's New
- The first release of Loki Patches, a set of LinkedIn patches for Morphe Manager. No ads, no clutter.
- Removes promoted posts, promoted jobs, suggested posts and Premium upsells, and can hide the counts, the games section and other feed clutter.
- Downloads photos and videos in full screen, one or all of a post, plus profile photos and banners.
- Copy text: long press any text to select and copy it.
- Opens links directly without LinkedIn's warning page, cleans tracking from shared links and blocks tracking requests.
- Messaging options, a Material You look and a settings page of its own, opened from the LinkedIn icon's long press menu.

**Made for LinkedIn 4.1.1261.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).
