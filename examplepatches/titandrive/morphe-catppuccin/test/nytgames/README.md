# NYT Games draft

Inspected version: **6.46.1** (`com.nytimes.crossword`, code 6428025).

Two optional patches: **NYT Games Catppuccin theme** and **NYT Games custom font**
with a TTF file picker. This draft replaces native night-mode semantic,
settings, navigation, crossword board and keyboard colors, plus shared Compose
core and component palettes. Existing light-mode colors and Wordle answer-state
colors remain unchanged. Visual coverage is incomplete; the latest Compose
changes still need checking on the actual game screens.

The font patch replaces bundled font payloads while preserving their paths and
resource IDs. It uses the selected TTF unchanged. The latest test APK used a
separately prepared, smaller JetBrains Mono sample; that scaling is not part of
the patch. SVG/bitmap artwork, logos and avatars are not modified.

Run the palette fixture checks with:

```
JAVA_HOME=/opt/android-studio/jbr python3 test/nytgames/verify_palettes.py
```

Local isolated test bundle:

```
CATPPUCCIN_INCLUDE_NYT_GAMES=1 CATPPUCCIN_NYT_GAMES_TEST=1 \
CATPPUCCIN_VERSION=0.7.0-nyt-games-test \
JAVA_HOME=/opt/android-studio/jbr ANDROID_HOME=$HOME/Android/Sdk \
python3 tools/build_catppuccin.py
```

The isolated identity uses `com.nytimes.crossword.catppuccin.test` and separate
provider permissions. It must never replace the user's main NYT Games app.
No release has been published.
