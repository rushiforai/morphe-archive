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
