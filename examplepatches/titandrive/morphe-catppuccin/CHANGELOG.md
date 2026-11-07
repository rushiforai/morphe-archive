# [0.11.0](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.11.0) (2026-11-06)

### Updates

* **Boost:** Support Boost 1.14.3 alongside compatible Patcheddit patches (tested with 2.1.0-dev.5). Keep support for 1.12.12 and 1.14.2, custom fonts, 3 dp comment indicators and single post separators.
* **Boost:** Turn off dynamic colors when selecting a Catppuccin theme so the chosen palette can take effect.
* **Boost:** Use Catppuccin blue for unvisited links and grey for opened links in comments and text posts on 1.14.2/1.14.3. Save visited link history across restarts; preserve spoilers and stock themes.

# [0.10.1](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.10.1) (2026-11-06)

### Fixes

* **AnkiDroid:** Fix JetBrains Mono in home-screen widgets. Render widget labels with the bundled font before passing them to the launcher, preserving original text accessibility and tap actions. Keep Catppuccin colors and background opacity.

# [0.10.0](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.10.0) (2026-11-06)

### Updates

* **AnkiDroid:** Theme home-screen widgets with Catppuccin Latte/Macchiato, light deck-name text in dark mode, and matching blue/red/green card counts. Bundle JetBrains Mono for widget text.
* **AnkiDroid:** Add Appearance → Widget appearance with a 0–100% background-opacity control and preview. Keep text fully visible and refresh existing widgets when opacity or theme changes.

# [0.9.1](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.9.1) (2026-11-06)

### Updates

* **Boost:** Increase Catppuccin comment-level indicators from 2 dp to 3 dp on Boost 1.14.2. Keep the approved post separators and comment colors.

# [0.9.0](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.9.0) (2026-11-06)

### Updates

* **Boost:** Support 1.14.2 alongside 1.12.12 for separate Catppuccin Latte/Macchiato themes and custom TTF fonts. Apply alongside compatible Patcheddit patches using an original APK.
* **Boost:** Restore themed navigation, media viewers, flair, username badges, Follow buttons, refresh indicators, text-post panels and profile patterns. Use 2 dp colored comment indicators and single surface0 post separators; fix media-viewer crashes while preserving stock themes.

# [0.8.1](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.8.1) (2026-11-05)

### Updates

* **Immich:** Support the verified 3.3.6 arm64 APK for Catppuccin Latte/Macchiato and custom TTF fonts, keeping mauve selected labels and the Mantle dock. Retain 3.3.5 support and strict native-binary checks.

# [0.8.0](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.8.0) (2026-10-24)

### Features

* **Immich:** Add Catppuccin Latte and Macchiato palettes for the verified 3.3.5 arm64 APK, with mauve selected tab icons and labels and a Mantle dark dock. Replaces existing palettes.
* **Immich:** Add an optional custom TTF file picker for interface fonts while preserving icon glyphs.

# [0.7.0](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.7.0) (2026-10-23)

### Features

* **Pocket Casts:** Add separate Catppuccin Latte, Macchiato, and restored Radioactivity theme choices for 8.23-rc-1.
* **Pocket Casts:** Add an optional custom TTF file picker for the interface and show notes.
* **Pocket Casts:** Theme Featured cards, now-playing surfaces, Details headers/body, and the Up Next playing banner. Preserve stock theme choices.

# [0.6.1](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.6.1) (2026-10-18)

### Features

* **Fastmail:** Add an optional custom TTF font patch with a file picker, usable with or without the Catppuccin theme.
* **Fastmail:** Add locally saved 70–150% custom font scaling under Display options → Accessibility. Use Fastmail's own sizing pipeline and retain its standard email-row layout.

# [0.6.0](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.6.0) (2026-10-18)

### Features

* **Fastmail:** Add Catppuccin Macchiato for Fastmail 4.24.0 dark mode, with mauve accents and a mauve floating compose button. Light mode remains unchanged.

# [0.5.4](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.5.4) (2026-10-18)

### Rollback

* **Todoist:** Restore the exact patch implementation from 0.5.0. Revert the Notifications-divider and P4-flag changes introduced in 0.5.1–0.5.3.
* **Todoist:** Keep the previously working theme picker, custom font support, widget palettes, and mauve refresh spinner.

# [0.5.3](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.5.3) (2026-10-18)

### Fixes

* **Todoist:** Hide the Notifications tab divider through a theme-controlled layout attribute, replacing the conditional fragment view search.
* **Todoist:** Tint the P4 flag directly at the priority-button renderer, replacing reliance on the palette token alone.

# [0.5.2](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.5.2) (2026-10-18)

### Fixes

* **Todoist:** Deliver the Notifications divider removal and lavender P4 flag with synchronized stable/prerelease update metadata.
* **Todoist:** Publish matching app-scoped changelogs before advertising the new patch bundle, fixing the missing release notes used by Morphe update detection.

# [0.5.1](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.5.1) (2026-10-18)

### Fixes

* **Todoist:** Remove the horizontal divider beneath Notifications All/Unread tabs while preserving the selected-tab underline.
* **Todoist:** Color the P4 flag Catppuccin lavender in Macchiato and Latte.

# [0.5.0](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.5.0) (2026-10-17)

### Features

* **Todoist:** Add separate Catppuccin Macchiato and Latte choices to the theme picker, preserving stock themes and keeping custom selections local.
* **Todoist:** Add Catppuccin widget theme choices and an optional custom TTF font patch.
* **Todoist:** Use mauve refresh spinners and refresh native screens consistently when changing themes.

# [0.4.1](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.4.1) (2026-10-14)

* Add AnkiDroid 2.25.2 to the compatibility list. On-device testing of this point release is pending.

# [0.4.0](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.4.0) (2026-10-13)

### Features

* **AnkiDroid 2.25.1:** Add Catppuccin Latte/Macchiato, bundled JetBrains Mono, custom TTF import, and 70–150% text sizing under Appearance.
* Selected fonts override card template fonts in study and preview screens.

### Validation

* Apply both palettes to the Android 10+ theme variants as well as the base definitions.
* Preserve the review WebView's superclass loader to prevent recursive loading crashes.
* Verified native Macchiato colors, card font loading, opening a review, and showing the answer on-device.

# [0.3.3](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.3.3) (2026-10-11)

### Fixes

* **Boost for Reddit:** Use the native TTF file picker instead of a text-path field.
* **Gboard:** Use the native TTF file picker for custom fonts.

# [0.3.2](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.3.2) (2026-10-11)

### Features

* **Boost for Reddit:** Add an optional custom TTF font patch that applies throughout the app without a new settings selector.

# [0.3.1](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.3.1) (2026-10-06)

### Improvements

* **Gboard:** Make the ?123 symbols key background transparent while retaining themed pressed feedback.

# [0.3.0](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.3.0) (2026-10-06)

### Features

* **Gboard:** Add Catppuccin Macchiato with mauve accents.
* **Gboard:** Add an optional custom TTF font patch and switching between the imported font and default fonts.

### Improvements

* **Gboard:** Add lavender spacebar feedback and Surface 1 backspace feedback, with a refreshed theme identifier.

# [0.2.14](https://github.com/titandrive/morphe-catppuccin/releases/tag/catppuccin-v0.2.14) (2026-10-02)

### Improvements

* **Boost for Reddit:** Improve Latte contrast and comment dividers.
* **Boost for Reddit:** Theme profile follow controls, pull-to-refresh indicators, and profile header patterns.
