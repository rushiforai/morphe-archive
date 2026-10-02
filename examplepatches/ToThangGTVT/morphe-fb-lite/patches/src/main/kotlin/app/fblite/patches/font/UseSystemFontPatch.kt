package app.fblite.patches.font

import app.fblite.patches.shared.Constants.COMPATIBILITY_FACEBOOK_LITE
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/fblite/extension/UseSystemFontPatch;"

@Suppress("unused")
val useSystemFontPatch = bytecodePatch(
    name = "Use system font",
    description = "Blocks the downloaded Meta fonts (Optimistic, Instagram Sans, emoji, ...) so the app falls back to the system font.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE)

    extendWith("extensions/extension.mpe")

    execute {
        AttachBaseContextFingerprint.method.addInstruction(
            0,
            // attachBaseContext has 31 locals, so p1 is above v15 and needs the range form.
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->blockDownloadedFonts(Landroid/content/Context;)V"
        )
    }
}
