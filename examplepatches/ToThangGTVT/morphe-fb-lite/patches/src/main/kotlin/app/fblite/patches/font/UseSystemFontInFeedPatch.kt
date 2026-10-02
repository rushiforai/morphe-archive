package app.fblite.patches.font

import app.fblite.patches.shared.Constants.COMPATIBILITY_FACEBOOK_LITE_530
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/fblite/extension/feedfont/FeedFontPatch;"

/**
 * The feed is drawn from glyph outlines the server sends, rasterized by X.0eF in the secondary dex,
 * which the patcher cannot modify. The extension adds a class with the same name that draws with the
 * system font, and this loads it at startup, before the secondary dex exists, so it takes precedence.
 */
@Suppress("unused")
val useSystemFontInFeedPatch = bytecodePatch(
    name = "Use system font in feed",
    description = "Draws feed text with the system font instead of the font the server sends.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE_530)

    extendWith("extensions/feedfont.mpe")

    execute {
        AttachBaseContextFingerprint.method.addInstruction(
            0,
            // attachBaseContext has 31 locals, so p1 is above v15 and needs the range form.
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->loadRasterizer(Landroid/content/Context;)V"
        )
    }
}
