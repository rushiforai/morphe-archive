package dev.hyzor.patches.nytgames.theme

import app.morphe.patcher.Fingerprint

/**
 * `ExtendedColorsKt.<clinit>` — the static palette of the games design system.
 *
 * The class builds two `CoreThemeColors` instances: field `a` is the light palette and field `b`
 * the dark one. Every colour is a Compose `Color` built from a `const-wide` ARGB literal followed
 * by `ColorKt.d(J)J`, so the dark greys are plain constants that can be rewritten in place.
 *
 * In 6.48.0 the dark palette uses `#121212` for the page background and `#2A2A2A` for the modal
 * and subdued page backgrounds; the light palette only reuses `#121212` as its content text,
 * which is why rewriting both is safe for light mode too.
 */
object DarkPaletteFingerprint : Fingerprint(
    definingClass = "Lcom/nytimes/games/designsystem/theme/ExtendedColorsKt;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
)
