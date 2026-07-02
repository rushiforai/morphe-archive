/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/messenger/metaai/RemoveMetaAIPatch.kt
 */
package app.morphe.patches.messenger.metaai

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.messenger.misc.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

internal const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/morphe/extension/messenger/metaai/RemoveMetaAIPatch;"
internal const val EXTENSION_METHOD_NAME = "overrideBooleanFlag"

@Suppress("unused")
val removeMetaAIPatch = bytecodePatch(
    name = "Remove Meta AI",
    description = "Removes UI elements related to Meta AI."
) {
    compatibleWith(AppCompatibilities.MESSENGER)

    dependsOn(sharedExtensionPatch)

    execute {
        GetMobileConfigBoolFingerprint.method.apply {
            val returnIndex = GetMobileConfigBoolFingerprint.instructionMatches.first().index
            val returnRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA

            addInstructions(
                returnIndex,
                """
                    invoke-static { p1, p2, v$returnRegister }, $EXTENSION_CLASS_DESCRIPTOR->$EXTENSION_METHOD_NAME(JZ)Z
                    move-result v$returnRegister
                """
            )
        }

        // Extract the common starting digits of Meta AI flag IDs from a flag found in code.
        val relevantDigits = with(MetaAIKillSwitchCheckFingerprint) {
            method.getInstruction<WideLiteralInstruction>(instructionMatches.first().index).wideLiteral
        }.toString().substring(0, 7)

        // Replace placeholder in the extension method.
        with(ExtensionMethodFingerprint) {
            method.replaceInstruction(
                stringMatches.first().index,
                """
                    const-string v1, "$relevantDigits"
                """
            )
        }
    }
}
