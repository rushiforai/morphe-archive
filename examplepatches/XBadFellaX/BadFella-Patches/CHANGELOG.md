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
