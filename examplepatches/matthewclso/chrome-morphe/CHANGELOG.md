# Changelog

## 0.5.1 — 2026-09-30

- Fix the page-sharing crash by preserving Android Icon tint calls; Black mode only redirects compatible Drawable methods.
- Keep the original close glyph and font sizes, centering both the X and tab title within the active-tab outline.
- Refresh favicons after icon-only changes and navigation, and retrieve restored-tab icons from Chrome’s local favicon database.
- Reveal the selected tab after the picker is laid out again following address entry.
- Keep the divider hidden during long-press menus and toolbar captures without overriding Chrome’s native visibility changes.
- Keep the composited toolbar and address-field backgrounds black while scrolling in Black mode.

## 0.5.0 — 2026-09-29

- Add an optional tab picker above the True bottom address bar, with native favicons, titles, tab switching and close controls.
- Disable the picker setting while True bottom is off, preserving the user's preference.
- Use a vertically inset active-tab outline and omit the divider between the picker and address bar.
- Scroll the picker with the native address bar, reserve its height above page content, and hide it during address entry, in the Hub and behind Incognito authentication.
- Keep native close confirmations and regular-tab Undo. Closing the final private tab opens the empty private viewer.

## 0.4.0 — 2026-09-29

- Remember the last regular/Incognito mode for launcher opens and full-browser external links.
- Retain the empty Incognito viewer after closing all private tabs, while ending the private session normally.

## 0.3.0 — 2026-09-28

- Add optional Android autofill for regular tabs while retaining MicroG sign-in.
- Disable the Android autofill provider for off-the-record profiles and add a route to Google's native password viewer.

## 0.2.0 — 2026-09-28

- Add optional MicroG sign-in with account-access setup in Morphe settings.
- Route account operations and Trusted Vault verification through Morphe MicroG.
- Require MicroG 7.1.1 or newer to avoid the older provider's incorrect account capabilities and missing key-retrieval service.
- Document recovery for earlier test builds; signed-in Incognito, bookmarks and homepage articles were confirmed on the S26.
- Make Google Password Manager offer Google's password website, with a clear native saving/autofill limitation.

## 0.1.2 — 2026-09-28

- Rename the installed app, patch source and release bundle to Chrome Morphe.
- Mark the tested 153.0.8010.53 (801005304) target as supported instead of experimental.
- Preserve the existing package ID for updates and retain exact-build rejection.

## 0.1.1 — 2026-09-28

- Keep tab search visible when rotating between portrait and landscape.

## 0.1.0 — 2026-09-28

- Add a persistent Morphe settings screen with switches for the Incognito toolbar button, Black mode, true bottom controls and Incognito defaults.
- Apply Black mode to Chrome backgrounds, settings cards, suggested articles, popup and long-press menus.
- Move tab-view action controls and search to the bottom with true bottom enabled.
- Preserve native Incognito locking, explicit regular tabs and embedded Custom Tabs.
- Publish an MIT-licensed source tree, Manager bundle metadata and build/release workflows.

Supports Chrome 153.0.8010.53 (801005304, ARM64) only.
