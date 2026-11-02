package app.stylus.patches.wimt.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.stylus.patches.wimt.shared.Constants.COMPATIBILITY_WIMT

private const val EXTENSION_CLASS =
    "Lapp/stylus/extension/wimt/patches/ForceSystemFontPatch;"

@Suppress("unused")
val forceSystemFontWimtPatch = bytecodePatch(
    name = "Force system font",
    description = "Uses the device's system font for UI text.",
    default = true,
) {
    category("Font")

    compatibleWith(COMPATIBILITY_WIMT)

    extendWith("extensions/extension.mpe")

    execute {
        ResourcesCompatGetFontFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1, p3 }, $EXTENSION_CLASS->getSystemTypeface(Landroid/content/Context;II)Landroid/graphics/Typeface;
                move-result-object v0
                if-eqz v0, :original
                if-eqz p4, :skip_callback
                invoke-virtual { p4, v0 }, Ldxa;->d(Landroid/graphics/Typeface;)V
                :skip_callback
                return-object v0
                :original
                nop
            """.trimIndent(),
        )
    }
}
