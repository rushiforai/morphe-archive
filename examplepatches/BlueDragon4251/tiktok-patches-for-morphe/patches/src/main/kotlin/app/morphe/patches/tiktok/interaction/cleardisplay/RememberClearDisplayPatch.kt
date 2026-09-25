/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/interaction/cleardisplay/RememberClearDisplayPatch.kt
 */
package app.morphe.patches.tiktok.interaction.cleardisplay

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.shared.OnRenderFirstFrameFingerprint
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val AUTOMATIC_CONTROLLER =
    "Lapp/morphe/extension/tiktok/cleardisplay/AutomaticClearDisplayController;"
private const val REMEMBER_CONTROLLER =
    "Lapp/morphe/extension/tiktok/cleardisplay/RememberClearDisplayPatch;"

@Suppress("unused")
val rememberClearDisplayPatch = bytecodePatch(
    name = "Remember clear display",
    description = "Remembers TikTok's clear-display state between videos.",
    default = true,
) {
    compatibleWith(*AppCompatibilities.tiktok4673())

    execute {
        ClearModeLogCoreFingerprint.methodOrNull?.returnEarly()
        ClearModeLogStateFingerprint.methodOrNull?.returnEarly()
        ClearModeLogPlaytimeFingerprint.methodOrNull?.returnEarly()

        OnClearDisplayEventFingerprint.method.let { method ->
            val isEnabledIndex = method.indexOfFirstInstructionOrThrow(Opcode.IGET_BOOLEAN) + 1
            val isEnabledRegister = method.getInstruction<TwoRegisterInstruction>(isEnabledIndex - 1).registerA

            method.addInstructions(
                isEnabledIndex,
                "invoke-static {v$isEnabledRegister}, " +
                    "$REMEMBER_CONTROLLER->rememberClearDisplayState(Z)V",
            )

            // The event class is known from TikTok's real onClearModeEvent signature, but it is no
            // longer referenced as a type from the early player method. Pass only its Java class
            // name as a String and let extension code construct/post the event reflectively.
            val eventClassName = method.parameters[0].type
                .removePrefix("L")
                .removeSuffix(";")
                .replace('/', '.')

            OnRenderFirstFrameFingerprint.method.apply {
                val returnIndex = implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_VOID }
                    .map { it.index }
                    .last()

                addInstructions(
                    returnIndex,
                    """
                        const-string v0, "$eventClassName"
                        invoke-static {v0}, $AUTOMATIC_CONTROLLER->onRenderFirstFrame(Ljava/lang/String;)V
                        invoke-static {v0}, $REMEMBER_CONTROLLER->restoreClearDisplayState(Ljava/lang/String;)V
                    """.trimIndent(),
                )
            }
        }
    }
}
