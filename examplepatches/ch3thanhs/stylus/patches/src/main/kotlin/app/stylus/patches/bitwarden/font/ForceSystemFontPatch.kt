package app.stylus.patches.bitwarden.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.stylus.patches.bitwarden.shared.Constants.COMPATIBILITY_BITWARDEN
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/stylus/extension/bitwarden/patches/ForceSystemFontPatch;"

internal val bitwardenFontExtensionPatch = patch {
    extendWith("extensions/extension.mpe")
}

internal fun markCustomUiFontInstalled() {
    val method = mutableClassDefBy(EXTENSION_CLASS).methods.single {
        it.name == "hasCustomUiFont" && it.parameterTypes.isEmpty() && it.returnType == "Z"
    }
    val firstInstruction = method.implementation?.instructions?.firstOrNull()
    if (firstInstruction?.opcode != Opcode.CONST_4 || firstInstruction !is OneRegisterInstruction) {
        throw PatchException("Could not find the custom UI font flag in the Bitwarden extension.")
    }
    method.replaceInstruction(0, BuilderInstruction11n(Opcode.CONST_4, firstInstruction.registerA, 1))
}

@Suppress("unused")
val forceSystemFontPatch = patch(
    name = "Force system font",
    description = "Uses the device's system font for UI text. Monospace text keeps its bundled font.",
    default = true,
) {
    category("Font")

    compatibleWith(COMPATIBILITY_BITWARDEN)

    dependsOn(bitwardenFontExtensionPatch)

    execute {
        val targetMethod = resolveTypefaceCompatCreateFromResourcesFontFileTarget()

        // Param mapping changes between legacy and modern method shapes.
        targetMethod.method.addInstructionsWithLabels(
            0,
            when (targetMethod.variant) {
                TypefaceCompatCreateFromResourcesFontFileVariant.LEGACY_STATIC ->
                    """
                        invoke-static { p0, p1, p4 }, $EXTENSION_CLASS->getSystemTypeface(Landroid/content/res/Resources;II)Landroid/graphics/Typeface;
                        move-result-object v0
                        if-eqz v0, :original
                        return-object v0
                        :original
                        nop
                    """

                TypefaceCompatCreateFromResourcesFontFileVariant.MODERN_VIRTUAL ->
                    """
                        invoke-static { p2, p3, p5 }, $EXTENSION_CLASS->getSystemTypeface(Landroid/content/res/Resources;II)Landroid/graphics/Typeface;
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
