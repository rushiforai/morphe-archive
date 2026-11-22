# Changelog

## 1.0.6

### Added

- **Hide blocked authors' books** removes books by users you blocked from tag and genre results, in both the native and Flutter screens. Searching for a book by name still finds it. It reads your block list and each blocked user's book list through WebNovel's own requests, so it needs you to be signed in. Blocks made in the app apply to the next results; blocks made on the website can take up to a minute.

## 1.0.5

### Added

- **AMOLED dark theme** turns the main dark mode background, bottom bar, reader pages and reader header pure black while WebNovel's dark mode is on. Switch it under **Patch controls > Appearance**; it starts on and works with or without **Material You colors**. Cards, dialogs, reader menus and Flutter/WebView screens keep their stock colors, and downloaded reader-theme artwork is replaced by black while it is active.

## 1.0.4

### Added

- **Copy and translate** shows a book's synopsis in a selectable dialog when you long-press its details page. Select any part, such as a Discord or Patreon link, or use **Copy** or **Translate**. Wait until the details page has loaded before long-pressing.

### Known issues

- The full author's note sheet at the end of a chapter opens, but its text still cannot be selected.

## 1.0.3

### Added

- **Copy and translate** adds **Copy** and **Translate** to the long-press menu of chapter and paragraph comments and their replies, and hides **Dislike** there. Translate uses WebNovel's own machine translation and shows the result in a dialog you can copy from. Choose the target language under **Patch controls > Comments** or with **Language** in the translation dialog; the default follows the app language. The full author's note sheet becomes selectable, so Discord or Patreon links can be copied. Book reviews and book descriptions are Flutter screens and are not covered. Where WebNovel shows no long-press menu (for example, for book moderators), neither item appears.

## 1.0.2

### Added

- **Hide popups** adds a separate **Hide Featured Works page** switch, on by default. It stops the full-screen Featured Works page at launch and its shortcut above the bottom tabs. Reopen the app after changing it.

### Fixed

- **Main navigation controls** opens Library at launch when Featured is hidden, instead of the hidden Featured page.
- **WebNovel GmsCore compatibility** no longer fails Google sign-in silently. Without an installed, enabled `app.revanced.android.gms` (MicroG RE) it explains what to install. Any other failed sign-in shows Google's error code; cancelling shows nothing.

## 1.0.1

### Added

- **Hide ads** also removes the server-driven campaign button that replaces the middle bottom tab. The app's own Writing tab returns in its place; hide it with Main navigation controls if unwanted. Restart the app after changing the switch.

## 1.0.0

### Added

- Patch controls in **Profile > Settings**, with saved choices and WebNovel-style light/dark cards.
- Ad blocking for launch promotions, reader placements, Library promoted books and daily recommendations. Library books and manual check-in remain available.
- Popup blocking for automatic campaigns, check-in prompts, ratings, notification nags and reader-exit promotions. Manual actions remain available.
- Optional Material You colors for native app surfaces, navigation and reader pages. Reader colors have an independent switch and preserve saved native presets. Android 12 or later is required.
- Main bottom-tab reordering and optional Featured, Writing and Explore hiding. Library and Profile stay reachable. Native Writing restrictions remain intact.
- Optional complete reader reward-timer disable. **Enabling it stops timer-based reading rewards.** Independent reading statistics, purchases and rewarded ads remain native. Battery savings have not been measured.
- Optional **Disable Firebase Analytics** patch using the SDK's build-time deactivation setting. Other telemetry and anti-tamper reporting remain unchanged. Repatch without it to restore the original collection policy.
- Separate UI/reader font imports and resets, retained as experimental. Further font work remains paused.
- Include rushiranpise v1.23.1 startup-signature, original-certificate and GmsCore patches in the same bundle. WebNovel GmsCore compatibility selects its dependencies automatically and defaults to the required `/BaseSignInActivity;`.
- Add explicit upstream Credits, pinned source provenance and the runtime dependency's license.

### Fixed

- WebNovel-specific Google sign-in hub routing with the required GmsCore transformation. Real Google authentication and WebNovel's authorization-code exchange remain intact. The earlier external-bundle build reached owner-confirmed login; fresh integrated-build login remains unverified.
- Reader-exit branch targets and shared insertion labels that previously caused runtime verification failures.
- Duplicate Kotlin runtime packaging that broke the external startup signature hook.
- Patch metadata generation for ambiguous bundles, missing versions and literal README descriptions.

### Release preparation

- Adopt Solo Patches branding and GitLab-native source, issue and merge-request structure.
- Prepare bounded, serial builds and signed bundle publication, with embedded signatures, a public verification key and SHA-256 checksums.
- Exclude private signing material, credentials, device research and proprietary APKs from publication inputs.

### Requirements and limits

- Target WebNovel **8.24.2** (`com.qidian.Int.reader`, publisher-signed APKM).
- Startup and Google sign-in require the included **Spoof app signature**, **GmsCore support (MicroG)** and **WebNovel GmsCore compatibility** patches. Selecting WebNovel compatibility includes its dependencies. The GmsCore default is `mainActivityName=/BaseSignInActivity;`; an installed, trusted `app.revanced.android.gms` provider remains required.
- Existing installations require the same APK signing key for data-preserving updates. Bundle signing is a separate release-authenticity mechanism.
- These patches provide no ban protection, paywall bypass, fabricated rewards or future login guarantee. Some decorative gradients, artwork and WebView/Flutter surfaces keep native colors. Comments-only notification filtering is not implemented.
