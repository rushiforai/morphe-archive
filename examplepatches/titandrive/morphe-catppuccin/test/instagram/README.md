# Instagram draft

Target: `com.instagram.android` 447.0.0.55.81. Initial inspection used the
phone's Piko-patched APK. Current clean-input testing uses APKPure's original
385311927 base plus density split. The original base signature verifies with
Meta Platforms' signer certificate (SHA-256
`3a10c50c18ba937506c2875e9047be74f8fd8b86fae2ff9feaa50a81fcb4c014`).

The first isolated test installation coincided with a system-server restart on
the phone and did not complete. Root cause is unconfirmed. Do not retry that
artifact. Keep further installation diagnosis in the local emulator.

The test identity now assigns unique authorities even when the input declares
two startup providers with the same authority. That duplicate also exists in
the clean input; correcting it is not proof of the restart's cause.

Optional patches:

- **Instagram Catppuccin theme:** Latte for light mode and Macchiato for dark mode.
  Initial coverage targets named IGDS interface colors, Prism button tokens, and legacy/Prism semantic theme tables.
  Hardcoded colors and newer rendering paths still need visual verification.
- **Instagram custom font:** TTF file picker, replacing bundled interface fonts.
  Icon fonts, Instagram/Facebook wordmarks and display branding remain intact.

Build locally with:

```sh
CATPPUCCIN_INCLUDE_INSTAGRAM=1 CATPPUCCIN_VERSION=0.7.0-instagram-test \
JAVA_HOME=/opt/android-studio/jbr ANDROID_HOME=$HOME/Android/Sdk \
python3 tools/build_catppuccin.py
```

Excluded from normal release builds. No release published and no installation
over the existing Instagram app.

Validate a decoded test manifest before installation:

```sh
python3 test/instagram/verify_identity.py /path/to/decoded/AndroidManifest.xml
```

Local checks completed against the fresh-input test APK:

- Both patches apply; decoded Latte/Macchiato backgrounds and mauve accents match.
- JetBrains Mono payloads match across the three IGUI weights.
- Isolated manifest has 23 unique provider authorities and four private permissions.
- Android 36 x86 emulator installation checks use diagnostic copies with ARM
  native libraries removed. These check package registration, not app startup,
  appearance, or Samsung/Android 17 compatibility. They cannot establish the
  phone restart's cause or prove that a phone retry is safe.

Fresh full ARM test artifact: `/tmp/instagram-clean-test.apk` (local only).

Fresh-input phone installation completed successfully without a system restart.
Its first launch exposed a separate app crash: `Resources$NotFoundException`
with resource ID zero. Instagram reads theme attribute resource IDs, so semantic
style overrides must reference named color resources rather than literal colors.
The patch now emits explicit Latte/Macchiato resources in the base table and
references those from the semantic styles. Check the built output with:

```sh
python3 test/instagram/verify_theme.py /path/to/decoded
```

The named-reference build installed and opened successfully on the phone; the
system-server PID remained unchanged. JetBrains Mono is visible on the welcome
screen. Welcome-screen background and buttons still use stock colors, so theme
coverage is incomplete and signed-in screens have not yet been checked.

Signed-in profile verification confirmed Macchiato surfaces, mauve Follow
buttons and the custom font. The next draft extends semantic overrides to
reaction/chip/form-field roles and native DirectDarkMode/DirectLightMode and
base theme tables, including incoming-message bubble and composer colors.
Decoded output passes 305 named-reference checks. Latest local artifact:
`/tmp/instagram-chat-test.apk`.

The broader palette pass maps directly referenced BDS/Prism neutral UI resources
and their alpha variants, numeric Prism indigo accents, selected controls and
bright text links. Images and artwork are not recolored. This targets the
remaining stock settings header/search/dividers and onboarding controls.

Compose coverage: the patch maps the 80 light and 95 dark primitive reads in the
version-pinned semantic palette constructors. `ComposePaletteChecks.java`
checks both palettes, alpha preservation, mauve accents and untouched unknown
colors. The updated test copy was installed; light settings and mauve controls
were visually verified, and the original System default preference restored.

Story startup: `ReelViewerFragment.A0t` explicitly initializes the transition
controller and viewer background with opaque black. The patch replaces that
single guarded initializer with the fragment theme's primary background and
aligns story loading/scrim attributes with the same color. It does not hook
image pixels or change story content. `VerifyStoryHook.java` checks the actual
APK for exactly one initializer hook and the packaged helper.

Paused state: the first story-initializer fix was installed, but the user still
observed a black flash. The next draft prepares the inflated viewer root and
solid-black loading backgrounds before its first draw. That draft builds and
patches locally, but has not been installed or visually verified. Do not claim
the story flash is fixed. Latest candidate: `/tmp/instagram-story-root-test.apk`.
