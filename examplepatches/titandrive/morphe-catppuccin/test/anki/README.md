# AnkiDroid patch checks

The patch currently targets the official **2.25.1 and 2.25.2** APKs. Test new upstream releases before expanding compatibility.

Build the production bundle:

```sh
JAVA_HOME=/opt/android-studio/jbr ANDROID_HOME="$HOME/Android/Sdk" python3 tools/build_catppuccin.py
```

Patch the original APK with Morphe desktop, enabling only **AnkiDroid Catppuccin theme and fonts**, then run:

```sh
python3 test/anki/verify_apk.py /path/to/patched.apk
```

`WebViewHooks.java` checks the patched DEX to ensure overridden WebView loaders retain their superclass calls instead of recursively dispatching into the patch. `verify_themes.py` checks every Android resource qualifier for the light/dark theme overrides. Both checks reproduce earlier bugs before their fixes.

`FontValidation.java` checks TrueType table validation against the compiled runtime extension. `TestIdentityPatch.kt` is included only when `CATPPUCCIN_ANKI_TEST=1`. It gives the test app a separate package and enables debugging. The runtime directs that test package to a private collection; never review or edit cards until this isolation is confirmed. The test identity is absent from the production bundle.

On-device checks: Latte/Macchiato, JetBrains Mono and App default, custom TTF import/cancel, 80%/100% text scaling, both card renderers, deck options, and statistics. Inspect the card WebView's computed font family and `document.fonts` loading status, rather than relying only on visual similarity. Retain font weight and style, including explicit Arial templates and inline `!important` font declarations.

Repatch a clean upstream APK each time. Keep the same signing key for production updates; never install test builds over the user's real app. Align local test APK native libraries with `zipalign -P 16` before signing on devices with 16 KiB pages.

Widget checks: Card Analysis and Deck Picker names/counts, JetBrains Mono in launcher RemoteViews, opacity at 0/50/100%, theme changes, and existing-widget refresh. Opacity must not fade text or compound across nested backgrounds.
