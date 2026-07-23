package app.stylus.patches.bitwarden.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.stylus.patches.bitwarden.shared.Constants.COMPATIBILITY_BITWARDEN

private const val EXTENSION_CLASS =
    "Lapp/stylus/extension/bitwarden/patches/ForceSystemFontPatch;"

@Suppress("unused")
val forceSystemFontPatch = bytecodePatch(
    name = "Force system font (Bitwarden)",
    description = "Renders the app using the device's system font instead of DM Sans / Roboto.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BITWARDEN)

    extendWith("extensions/extension.mpe")

    execute {
        val targetMethod = resolveTypefaceCompatCreateFromResourcesFontFileTarget()

        // Param mapping changes between legacy and modern method shapes.
        targetMethod.method.addInstructionsWithLabels(
            0,
            when (targetMethod.variant) {
                TypefaceCompatCreateFromResourcesFontFileVariant.LEGACY_STATIC ->
                    """
                        invoke-static { p4 }, $EXTENSION_CLASS->getSystemTypeface(I)Landroid/graphics/Typeface;
                        move-result-object v0
                        if-eqz v0, :original
                        return-object v0
                        :original
                        nop
                    """

                TypefaceCompatCreateFromResourcesFontFileVariant.MODERN_VIRTUAL ->
                    """
                        invoke-static { p5 }, $EXTENSION_CLASS->getSystemTypeface(I)Landroid/graphics/Typeface;
                        move-result-object v0
                        if-eqz v0, :original
                        return-object v0
                        :original
                        nop
                    """
            }
        )
    }
}