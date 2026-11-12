## 1.4.0 (2026-11-12)

The complete 44-patch BadFella Patches bundle includes these improvements to our LinkedIn patches.

### ✨ New Features

* **LinkedIn:** add preset and custom hex accent colors alongside wallpaper colors; give Copy text, Download and Save PDF their own post-menu icons; refine the glass navigation bar with a spring selection pill, a thin rim and no press ripple while keeping its floating inset and full-height hiding behavior.

### 🔧 Improvements

* **LinkedIn:** use Morphe's class, string and method-call indexes for theme, share-link and GmsCore patch discovery, preserving the existing checks and Google identity.
* Keep the post-text extraction and failed PDF-download cleanup fixes from 1.3.1.

### Updating

Refresh Sources in Morphe Manager and patch the original app again with the same signing key. Accent colors require Material You; glass styling requires Glass navigation bar. Restart LinkedIn after changing colors. Experimental features remain experimental.

## 1.4.0-dev.1 (2026-11-12)

The complete 44-patch BadFella Patches bundle includes these improvements to our LinkedIn patches.

### ✨ New Features

* **LinkedIn:** add preset and custom hex accent colors alongside wallpaper colors; give Copy text, Download and Save PDF their own post-menu icons; refine the glass navigation bar with a spring selection pill, a thin rim and no press ripple while keeping its floating inset and full-height hiding behavior.

### 🔧 Improvements

* **LinkedIn:** use Morphe's class, string and method-call indexes for theme, share-link and GmsCore patch discovery, preserving the existing checks and Google identity.
* Keep the post-text extraction and failed PDF-download cleanup fixes from 1.3.1.

### Updating

Refresh Sources in Morphe Manager and patch the original app again with the same signing key. Accent colors require Material You; glass styling requires Glass navigation bar. Restart LinkedIn after changing colors. Experimental features remain experimental.

## 1.3.1 (2026-11-12)

Includes the complete 44-patch bundle from v1.3.0 and all dev changes promoted into v1.3.1, across LinkedIn, TickTick, Emby, Remote for Android TV, Pep Talk, Wanderlog and Torrent Search Revolution V2. This is the full BadFella Patches bundle, with additional LinkedIn corrections.

### 🐛 Bug Fixes

* **LinkedIn:** copy actual post text, including line breaks, from the post menu instead of a tracking identifier.
* **LinkedIn:** remove temporary document slices when a PDF download fails.
* Restore copyright notices and source credits.

### Updating

Refresh Sources in Morphe Manager and patch the original app again. Keep the same Manager signing key when updating an existing patched installation. Experimental features remain experimental.

## 1.3.1-dev.1 (2026-11-12)

### 🐛 Bug Fixes

* **LinkedIn:** copy the actual post text, including line breaks, from the post menu instead of a tracking identifier; remove temporary document slices when a PDF download fails; restore copyright notices and credits.

### Notes

* Applies to the existing LinkedIn 4.1.1271 patches. Keep the same Morphe Manager signing key when updating an existing patched installation.
* Anonymous profile viewing remains experimental. These fixes do not change Google sign-in or privacy guarantees.

## 1.3.0 (2026-11-12)

### ✨ New Features

* **torrent search revolution:** add the local Pro patch for Torrent Search Revolution V2 2.3.5, covering thirteen local Pro checks across search ads, banners, native ads and Pro settings to unlock the full offline search experience and remove ads while retaining startup callbacks
* **ticktick:** support TickTick 8.3.0.1 (build 8301) across TickTick Premium, Disable analytics collection, Restore notifications and Restore reminder alarms by finding the reviewed bytecode shapes instead of the class names R8 renamed, and declare 8.3.0.1 as an explicit target so Morphe can fetch that exact version
* **linkedin:** add the Install next to LinkedIn patch for LinkedIn 4.1.1271 and 4.1.1267, which installs the patched build as a second app with its own package name, home screen name and data, so both the copy and the installed LinkedIn can be signed in side by side (closes #2)
* **linkedin:** add a Dark app icon option, Material bottom navigation icons, an Icon-only post actions option, Copy post text and an Always show navigation bar option
* **linkedin:** float the glass navigation bar above the system navigation bar, with the screen showing through the room under it, and slide it fully off screen while scrolling

### 🐛 Bug Fixes

* **linkedin:** keep the Install next to LinkedIn copy's microG spoofed package name as LinkedIn's own, so Continue with Google signs in instead of reporting an account abnormality
* **linkedin:** center the tab icons and labels inside the glass navigation bar capsule
* **linkedin:** decode bottom bar icon resources before replacing them
* **linkedin:** close an empty Premium upsell full-page takeover instead of leaving a blank screen
* **linkedin:** resolve the My Network tab from the visible tab row when swiping between feeds

### 🗑️ Removed

* **ultimea:** remove the experimental Pitch black, Hide Explorer tab and Custom font patches and the font files bundled only for them, so the bundle covers LinkedIn, TickTick, Emby, Remote for Android TV, Pep Talk, Wanderlog and Torrent Search Revolution V2

### Notes

* Patch the unmodified APKs in Morphe Manager. Keep the same Manager signing key when updating an existing patched installation.
* TickTick Premium and the Torrent Search Revolution local Pro patch change local app behavior only; they do not grant a Pro Key, a subscription or a server entitlement.
* The Install next to LinkedIn copy starts with empty data and needs its own sign-in. Select GmsCore support to sign in with Google through microG RE.

## 1.3.0-dev.10 (2026-11-12)

### ✨ New Features

* **Torrent Search Revolution V2:** add local Pro/ad-free mode for the original 2.3.5 APKS, covering thirteen local Pro checks across search ads, banners, native ads and Pro settings while retaining startup callbacks.

### Notes

* Patch the unmodified Torrent Search Revolution V2 2.3.5 APKS in Morphe Manager. Keep the same Manager signing key when updating an existing patched installation.
* This patch changes local app behavior; it does not grant a Pro Key subscription or server entitlement. Changed app bytecode is rejected for review.

## 1.3.0-dev.9 (2026-11-11)

### ✨ New Features

* **ticktick:** support TickTick 8.3.0.1 (build 8301) by finding the premium wrapper, limits, privacy gate, reminder guard and analytics provider through their reviewed bytecode shapes instead of the class names that R8 renamed, and declare 8.3.0.1 as an explicit target so Morphe sources can fetch that exact version

### Notes

* TickTick also keeps the experimental any-version target. Every patch still verifies its own anchors and fails closed on a changed one.
* TickTick Premium remains client-side only: it does not grant server AI access, cloud quota or a subscription.

## 1.3.0-dev.8 (2026-11-10)

### 🗑️ Removed

* **ultimea:** remove the experimental Ultimea patches (Pitch black, Hide Explorer tab and Custom font) and the font files bundled only for them, so the bundle covers LinkedIn, TickTick, Emby, Remote for Android TV, Pep Talk and Wanderlog again

### Notes

* Preparation of a clean baseline for the upcoming stable release after the experimental Ultimea patches are withdrawn. An already patched Ultimea install is unaffected by this bundle change.

## 1.3.0-dev.7 (2026-11-11)

### 🐛 Bug Fixes

* **linkedin:** keep the Install next to LinkedIn copy's microG spoofed package name as LinkedIn's own, so Continue with Google signs in instead of reporting an account abnormality

## 1.3.0-dev.6 (2026-11-11)

### 🐛 Bug Fixes

* **linkedin:** slide the floating glass navigation bar completely off screen when scrolling, instead of leaving half of the capsule at the bottom

## 1.3.0-dev.5 (2026-11-11)

### 🐛 Bug Fixes

* **linkedin:** float the glass navigation bar above the system navigation bar, with the screen showing through the room under it, and center the tab icons and labels inside the capsule

## 1.3.0-dev.4 (2026-11-10)

### ✨ New Features

* **linkedin:** add a Dark app icon option that paints the launcher icon background black while keeping the white "in"
* **linkedin:** add Material icons to the bottom navigation bar, filled when selected and outlined otherwise
* **linkedin:** add an Icon-only post actions option that shows Like, Comment, Repost and Send as icons without their labels
* **linkedin:** add Copy post text, so long pressing a post's text copies all of it, including the part behind "...more"
* **linkedin:** add an Always show navigation bar option that keeps the bar on screen while scrolling

### 🐛 Bug Fixes

* **linkedin:** close an empty Premium upsell full-page takeover instead of leaving a blank screen
* **linkedin:** resolve the My Network tab from the visible tab row when swiping between feeds

## 1.3.0-dev.3 (2026-11-10)

### ✨ New Features

* **linkedin:** add the Install next to LinkedIn patch for LinkedIn 4.1.1271 and 4.1.1267, which installs the patched build as a second app with its own package name, home screen name and data, so both the copy and the installed LinkedIn can be signed in side by side (closes #2)

### Notes

* The copy starts with empty data and needs its own sign-in.
* Features that check the installed package or signing certificate, such as verified app links and Google Play services based sign-in, may behave differently in the copy. Select GmsCore support as well to sign in with Google through microG RE.

## 1.3.0-dev.2 (2026-11-10)

### 🐛 Bug Fixes

* **ultimea:** make the Ultimea patches take effect on device: pitch black dark mode now replaces the reviewed dark palette tokens and the native night window colors, the Explorer/Community tab is removed from the bottom navigation and its icons are blanked, and the chosen font is injected through the Flutter font manifest so it renders across the app

### 🚀 Features

* **ultimea:** add a Custom font option with Rosemary (Samsung), Google Sans, Open Sans, Segoe UI and System Default

## 1.3.0-dev.1 (2026-11-10)

### 🚀 Features

* **ultimea:** add Pitch black AMOLED dark theme, Hide Explorer tab, and Use system font patches for Ultimea 1.4.4

## 1.2.0 (2026-11-08)

### 🐛 Bug Fixes

* **linkedin:** comprehensively eliminate promoted, boosted, and sponsored feed content (v1.2.0-dev.13) b0246b8
* **linkedin:** describe boosted and label-only promoted coverage 3efbf11
* **linkedin:** eliminate feed scroll jitter and visual flicker (v1.2.0-dev.11) 802494b
* **linkedin:** filter ads at the feed collection boundary 6fcaf21
* **linkedin:** filter sponsored items in SDUI Compose feed (v1.2.0-dev.8) 85951fc
* **linkedin:** filter the parsed feed page before it reaches the paged list 1f9dcf8
* **linkedin:** remove boosted and label-only promoted posts from the feed 4e66a05
* **linkedin:** remove promoted ads and video carousels from the feed 9534f84

### ✨ New Features

* **linkedin:** add LinkedIn 4.1.1271 feed filters and navigation options c741941
* **linkedin:** add missing Fakh patches and restore customizable navigation (v1.2.0-dev.10) daa6e59
* **linkedin:** full AMOLED pitch black theme and fix default-enabled behavior (v1.2.0-dev.12) 4aadb58, closes #000000 #0D0D0D #1A1A1A
* **linkedin:** import complete 22-patch suite and add version-agnostic support (v1.2.0-dev.9) 9be6d86

## 1.2.0-dev.13 (2026-11-08)

### 🐛 Bug Fixes

* **linkedin:** remove promoted, boosted and sponsored posts again by hiding any server-driven component that carries sponsored tracking metadata regardless of its view name, expanding sponsored URN detection and matching Promoted/Sponsored badges, and applying the same sponsored URN, boost header, lead-gen, call-to-action and promoted label checks to the legacy feed

## 1.2.0-dev.12 (2026-11-08)

### 🚀 Features

* **linkedin:** rename AMOLED black bars to Pitch black and give it the complete three tone AMOLED theme (pure black canvas, dark cards and tints) across Compose and View screens, and enable it by default once its patch is included instead of leaving it inert until the in-app switch was found

## 1.2.0-dev.11 (2026-11-08)

### 🐛 Bug Fixes

* **linkedin:** make the home feed scroll smoothly by serializing and parsing each server-driven component at most once per visibility sample instead of for every component and every nested part of every post, and by only inspecting the components that Expand posts, Tap to hide in viewers and Post menu items can edit

## 1.2.0-dev.10 (2026-11-07)

### 🚀 Features

* **linkedin:** add the Expand posts, More tab, Navigation bar, Swipe between tabs and Glass navigation bar patches from Fakh Patches, restore Customize navigation bar with Morphe options for the six bottom tabs, and make AMOLED black bars work with or without Material You

## 1.2.0-dev.9 (2026-11-06)

### 🚀 Features

* **linkedin:** import comprehensive 22-patch LinkedIn suite from Loki Patches, featuring root SDUI component filtering (`ComponentTransformer.doTransform`), in-app BadFella Patches settings, media download, and version-agnostic support across future LinkedIn releases

## 1.2.0-dev.8 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** filter the server-driven UI feed at `SduiPagedList.addAll(Collection)` before Compose receives the page, so sponsored, promoted and suggested components no longer enter the modern home feed; also match Promoted/Sponsored accessibility labels and Videos for you carousels

## 1.2.0-dev.7 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** filter each parsed feed page at `addAll(CollectionTemplate)` before the paged list reads its elements, which is the ingestion funnel the home feed actually uses, and check the carousel content type before the sponsored test so organic carousels such as Videos for you no longer pass the suggested-carousel filter

## 1.2.0-dev.6 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** drop sponsored, promoted, suggested and video updates from the parsed feed page before the list accepts them, so an ad no longer takes a list slot or reaches the presenter; also match sponsored URNs, ad tracking metadata, aggregated updates and contextual labels

## 1.2.0-dev.5 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** remove boosted and label-only promoted posts from the feed, including labels in accessibility text, supplementary actor info, headers and call-to-action cards

## 1.2.0-dev.4 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** remove promoted and lead-gen ads that carry entity, discovery or carousel cards, and remove video carousels such as Videos for you

## 1.2.0-dev.3 (2026-11-06)

### ✨ New Features

* **linkedin:** add LinkedIn 4.1.1271 sponsored-post, promoted-job, suggested-carousel and feed-video removal, plus a customizable bottom navigation bar

## 1.1.0 (2026-11-06)

### ✨ New Features

* support reviewed patch targets without version pins 05fa478
* **wanderlog:** make dark mode follow the device theme aa6b1a8
* **wanderlog:** make the theme follow the device dark-mode setting 4cc8368

# BadFella Patches

## 1.2.0-dev.2

### ✨ New Features

* **Wanderlog:** make the theme follow the device dark-mode setting 4cc8368

Wanderlog 2.227. The dark-mode provider's value is gated on a Pro check that
stays false for non-subscribers, so the previous preview never rendered the
dark theme. The patch now runs the preference evaluation regardless of that
gate and treats the light preference as the system setting: the app is dark
when the phone is dark and light when it is light. Export to Google Maps runs
on Wanderlog's servers and is not granted by the patch. Installation: enable
pre-releases for BadFella Patches in Morphe Manager, refresh the source, and
re-patch the original stock APKM.

## 1.2.0-dev.1

### ✨ New Features

* **Wanderlog:** make dark mode follow the device theme aa6b1a8

Wanderlog 2.227. The app's dark mode entry is Pro-only and the theme
preference is set by Wanderlog's servers on subscription; the patch now makes
the app theme follow the device dark-mode setting. Export to Google Maps runs
on Wanderlog's servers and is not granted by the patch. Installation: enable
pre-releases for BadFella Patches in Morphe Manager, refresh the source, and
re-patch the original stock APKM.

## 1.0.0

TickTick, Emby, Remote for Android TV, Pep Talk and Wanderlog patches.
