# Fastmail patch

Target inspected: Android Fastmail 4.24.0 (26100803).

The patch replaces the web app's dark-mode semantic CSS variables with
Catppuccin Macchiato. Fastmail's normal Appearance setting still controls
light/dark mode; light mode is unchanged in this first pass.

The Java hook runs only for the main HTTPS app.fastmail.com page. It injects
one idempotent stylesheet, does not modify account preferences, does not read
message text, and does not inject into email frames. Native dialogs, system
bars, and loading screens still need visual verification.

Build an isolated test bundle locally:

```
CATPPUCCIN_FASTMAIL_TEST=1 \
CATPPUCCIN_VERSION=0.6.0-fastmail-test \
JAVA_HOME=/opt/android-studio/jbr ANDROID_HOME=$HOME/Android/Sdk \
python3 tools/build_catppuccin.py
```

The test identity patch gives the APK a separate package and provider
permissions. Never install a test-signed APK over the user's main app.

## Custom font draft

Select **Fastmail custom font** and set its `font-file` option to a TTF.
The font is embedded locally and loaded through the WebView FontFace API;
no external font request or account preference change is required. Native
font styles use the same TTF. The font patch works with or without the color
patch and applies in light and dark modes. Repatch an original APK without
the font patch to remove it.

The shared WebView hook is installed once even when both patches are selected.
The custom font replaces UI font utilities and form controls, without modifying
outgoing compose HTML or injecting into received-message iframe documents.

Custom-font builds add **Display options → Accessibility → Custom font scale**,
with 70–150% choices. 100% (Default) restores native sizing. The setting is
local to the device. Scaling uses Fastmail's own accessibility sizing pipeline.
There are no custom mailbox-row height, spacing, padding or position overrides.
