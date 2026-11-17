## 3.1.1 (2026-11-16)

### Fixes
- Loki Patches menu: keeps its scroll position when you go back, in LinkedIn, Splitwise, Truecaller and Doc Scanner.

**36 patches for 4 apps.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#apps).

## 3.1.0 (2026-11-16)

### New Features
- "Don't remind me" on the microG RE battery reminder, with a switch to turn it back on.

**36 patches for 4 apps.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#apps).

## 3.0.1 (2026-11-14)

### Fixes
- **Doc Scanner:** GmsCore support (Doc Scanner): the description says text recognition (OCR), not receipt OCR, and that it needs Play services.
- **Truecaller:** Enable premium features (Truecaller): the description says the after-call screen has a switch in Loki Patches › Calls.

**36 patches for 4 apps.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#apps).

## 3.0.0 (2026-11-14)

### New Apps
- **Splitwise:** Pro features, no Pro ads and upsells, AMOLED black (switch in Loki Patches › Appearance), analytics and crash reporting removed, and Google sign-in through MicroG-RE.
- **Truecaller:** premium features, the after-call screen hidden (switch in Loki Patches › Calls), and Google sign-in and Drive backup through MicroG-RE. The Loki Patches entry replaces the Android watch entry.
- **Doc Scanner:** full version, declutter, allow clone, and Google sign-in through MicroG-RE.

### New Features
- **LinkedIn:** Loki Patches menu: Patch status, Backup & restore to a file, Diagnostics with Copy and Share report, and full-screen About and Credits pages. Same patches and settings as before; updates in place.
- Change package name and Remove ads and trackers: new patches for any app, off by default.

**36 patches for 4 apps.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#apps).

## 2.1.2 (2026-11-13)

### Fixes
- GmsCore support: LinkedIn push notifications work again. Google refused the patched app's push registration, so no notification ever arrived; it now registers with MicroG-RE like the original app.

**23 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 2.1.1 (2026-11-10)

### Fixes
- Hide Premium upsells: the full screen Premium takeover that LinkedIn opens when the feed loads is closed as soon as its content is hidden, so it no longer leaves a black page. Pressing back is no longer needed.

**23 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 2.1.0 (2026-11-10)

### New Features
- Dark app icon: optional black launcher icon (off by default).

### Fixes
- Swipe between feeds: My Network tabs now switch reliably on every screen size, including Catch up after Search.

**23 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 2.0.0 (2026-11-10)

A complete rewrite with independently developed patch code, while preserving the existing functionality of all 22 patches.

### Fixes
- Fixed bidirectional feed swiping on My Network.
- Improved feed detection for posts containing multiple photos.
- Fixed duplicate launcher shortcuts from older installations.

**22 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.2.5 (2026-11-08)

### Fixes
- Post menu: Copy text, Download and Save now have their own icons instead of all showing the bookmark.
- Copy text: the menu copies the post itself instead of a random base64 value.
- Download media: the button in the video viewer shows for every video again.
- Swipe between feeds: a hidden text selection no longer blocks the swipe.

**22 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.2.4 (2026-11-07)

### Fixes
- Download media: the button hides and shows with the viewer's own controls, and stays hidden while a video plays full screen instead of floating over it.
- Swipe between feeds: swiping back to Grow on My Network works again.

**22 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.2.3 (2026-11-07)

### Fixes
- Diagnostic log: the file is renamed to loki_log.txt.

**22 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.2.2 (2026-11-07)

### What's New
- Supports LinkedIn 4.1.1270, 4.1.1269 and 4.1.1267.

**22 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.2.1 (2026-11-06)

### What's New
- GmsCore support: reports when microG RE is missing, outdated, restricted by battery optimization or not running, with a shortcut to the download page or the relevant settings. Google sign-in no longer fails without a message.

**22 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.2.0 (2026-11-06)

### What's New
- Anonymous profile viewing (experimental): drops the analytics events of profile pages, so visits are not listed in "Who viewed your profile" or in company page visitor lists. Setting: Privacy.
- AMOLED black bars (new patch): pure black top bar, bottom bar and side menu in dark mode. Requires Material You.
- Hide bottom tabs: switches to remove My Network and Jobs from the bottom bar.
- Swipe between feeds: also switches Grow and Catch up on My Network.
- Hide games: also hides the puzzle section headings.
- Loki settings pages follow AMOLED black in dark mode.
- Supports LinkedIn 4.1.1267 only.

### Fixes
- Who viewed your profile: viewer list restored, Premium cards hidden.
- Side menu Premium bar hidden on 4.1.1267.
- Dialog contrast in Loki pages on light screens in dark mode.

**22 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.1.1 (2026-11-04)

### Fixes
- Hide Premium upsells: side menu Premium bar hidden on LinkedIn 4.1.1267.

**20 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.1.0 (2026-11-04)

### What's New
- Swipe between feeds: switches For you and Network on the home feed. Ignored on carousels and multi-page documents.
- Tap to hide in viewers: toggles the caption and action buttons of the full-screen document and video viewers.
- Documents as PDF: saves a post's document or carousel as one PDF.
- Post menu items: Copy text, Download media and Save as PDF in the post menu.
- Copy text: long press to select and copy; long posts open in a scrollable sheet (switchable).
- Keep feed on reopen, Muted words, Hide AI suggestions.
- Supports LinkedIn 4.1.1267.

### Fixes
- Copy text: overlay alignment, scrolling and selection persistence.
- Dialog readability on all phones.
- Hide Premium upsells: compatible with 4.1.1267.

**20 patches in total.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).

## 1.0.0 (2026-11-03)

### What's New
- Initial release of Loki Patches for LinkedIn.
- Removes promoted posts and jobs, suggested posts and Premium upsells; optional hiding of counts, games and other feed elements.
- Photo and video download in full screen (single or all media of a post), profile photo and banner download.
- Copy text on long press.
- Open links directly, share link sanitizing, tracking request blocking.
- Messaging options, Material You theming, dedicated settings page.

**Built for LinkedIn 4.1.1261.** Full list in the [README](https://github.com/lokesh-sparrow/loki-patches#patches).
