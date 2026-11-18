# Afterglow app icon

The default-selected **Afterglow app icon** patch uses the artwork supplied by
the project owner on 2026-11-17. It changes the application icon and every
launcher activity/alias, including YouTube's disabled alternative aliases,
without changing their enabled state, app name, package or notification icon.
Unselect this patch before patching to retain YouTube's launcher icon.

The original 1254 × 1254 RGBA PNG is kept byte-for-byte in
`patches/src/main/resources/afterglow/branding/drawable-nodpi/afterglow_launcher_artwork.png`.
Its SHA-256 is
`2737aedb98e0f7daceeb305ce624451fcd8f76143ab56048d138fc7f1b9ad7a9`.

Android 8 and newer use an adaptive wrapper with a dark purple background and
a 20% foreground inset to retain the play symbol and wordmark under launcher
masks. A bitmap resource supplies the legacy fallback. No Morphe branding
artwork or Custom branding implementation is enabled by this patch. It has no
runtime switch; changing the installed icon requires patching the APK again.
