# Morphe - Catppuccin

Catppuccin themes for Boost, Gboard, AnkiDroid, Todoist, Fastmail, and Pocket Casts, patched with [Morphe Manager](https://morphe.software/).

Add `titandrive/morphe-catppuccin` as a remote patch source in Morphe.

## Boost

For **Boost 1.12.12**, apply **Catppuccin theme** alongside the original [Patcheddit patches](https://github.com/wchill/patcheddit). This add-on does not include their login/API fixes.

Open Boost’s theme selector and choose **Catppuccin Macchiato** (dark) or **Catppuccin Latte** (light).

For a custom font, also select **Boost custom font**, open its options, and choose a **TTF file**. The font applies throughout Boost with no in-app selector. Repatch to change it; omit the font patch to restore the original fonts.

## Gboard

For **Gboard 18.4.1.985164140-release-arm64-v8a**, apply **Gboard Catppuccin theme**. No Patcheddit patches are needed.

Open Gboard **Settings → Theme → Colors → Show more → Catppuccin Macchiato**. Choose **Key shape: None** for the borderless look, then **Apply**.

For a custom font, also select **Gboard custom font**, open its options, and choose a **TTF file**. Switch fonts in **Gboard Settings → Preferences → Font**.

## AnkiDroid

For **AnkiDroid 2.25.1 or 2.25.2**, apply **AnkiDroid Catppuccin theme and fonts**. No other patch source is needed.

In **Settings → Appearance**, choose **Catppuccin Latte** as the day theme and **Catppuccin Macchiato** as the night theme. **Font and text size** offers App default, bundled JetBrains Mono, a custom TTF picker, and 70–150% text scaling. Selected fonts override card template fonts in study and preview screens; App default restores the original fonts.

Start with an **original, unpatched APK** when updating. Morphe signs the result with its own key, so it cannot install directly over a Google Play/GitHub-signed AnkiDroid installation. Back up/sync your collection before switching installations, and keep using the same Morphe signing key for subsequent updates. AnkiCat remains a separate app.

## Todoist

For **Todoist v12314**, apply **Todoist Catppuccin theme**. No other patch source is needed.

Open **Settings → Theme** and choose **Catppuccin Macchiato** or **Catppuccin Latte**. Original themes remain available; Catppuccin selections are saved locally rather than synced to other devices.

Widgets have their own **Theme** setting: choose either Catppuccin theme when adding or editing a widget.

For a custom font, also select **Todoist custom font**, open its options, and choose a **TTF file**. The font is embedded throughout the app, with no additional in-app font selector. Repatch an original APK to change or remove it.

Use an **original, unpatched APK**. A Morphe-signed app cannot install over the Play Store version because their signing keys differ. Sync your tasks before switching installations, and keep the same Morphe signing key for future updates.

## Fastmail

For **Fastmail 4.24.0**, apply **Fastmail Catppuccin theme** to an **original, unpatched APK**. No other patch source is needed.

Choose **Dark** under **Settings → Display options → Appearance**. The patch replaces dark mode with **Catppuccin Macchiato**, including a mauve floating compose button. It does not add a theme-picker entry; light mode remains unchanged.

Keep the same Morphe signing key for updates. A Morphe-signed APK cannot install directly over the Play Store version because the signatures differ.

For a custom font, also select **Fastmail custom font**, open its options, and choose a **TTF file**. In **Display options → Accessibility → Custom font scale**, choose 70–150% to adjust its size; **Default (100%)** restores normal sizing. The scale is saved locally. Repatch an original APK to change or remove the font.

## Pocket Casts

For **Pocket Casts 8.23-rc-1**, select **Pocket Casts themes** in Morphe. In **Profile → Settings → Appearance**, choose **Catppuccin Latte**, **Catppuccin Macchiato**, or **Radioactivity**. The original themes remain available.

Optionally select **Pocket Casts custom font**, open its options, and choose a **TTF file**. It applies to the interface and show notes. Repatch an original APK to change or remove the font.

Use an original APK, not a previously patched copy. Keep the same Morphe signing key for subsequent updates; a patched APK has a different signature from the Play Store app.

Build instructions and contribution notes are in [CONTRIBUTING.md](CONTRIBUTING.md).

## Vibe-code disclosure

This project is vibe-coded with AI assistance from OpenAI Codex.

This app uses code from Patcheddit. To learn more, visit https://reddit.com/r/patcheddit
