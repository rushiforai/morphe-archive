package app.twoeno.patches.spotify.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.twoeno.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.twoeno.patches.shared.EXTENSION
import app.twoeno.patches.shared.EXTENSION_PACKAGE
import app.twoeno.patches.shared.parameterRegister
import app.twoeno.patches.spotify.FormatAndroidShareSheetUrlFingerprint
import app.twoeno.patches.spotify.OldFormatAndroidShareSheetUrlFingerprint
import app.twoeno.patches.spotify.OldShareCopyUrlFingerprint
import app.twoeno.patches.spotify.ShareCopyUrlFingerprint
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/SanitizeSharingLinksPatch;"

@Suppress("unused")
val sanitizeSharingLinksPatch = bytecodePatch(
    name = "Sanitize sharing links",
    description = "Removes the tracking parameters (si, utm_source) from shared and copied links.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    execute {
        // "Copy link": sanitize the text passed to ClipData.newPlainText(label, text).
        (ShareCopyUrlFingerprint.methodOrNull ?: OldShareCopyUrlFingerprint.method).apply {
            val newPlainTextIndex = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.definingClass == "Landroid/content/ClipData;" && reference.name == "newPlainText"
            }
            val textRegister = when (val call = getInstruction<Instruction>(newPlainTextIndex)) {
                is FiveRegisterInstruction -> call.registerD
                is RegisterRangeInstruction -> call.startRegister + 1
                else -> throw PatchException("Unexpected instruction: $call")
            }

            addInstructionsAtControlFlowLabel(
                newPlainTextIndex,
                """
                    invoke-static/range { v$textRegister .. v$textRegister }, $EXTENSION_CLASS->sanitizeText(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$textRegister
                """,
            )
        }

        // Share sheet: sanitize the url parameter of the share message formatter.
        (FormatAndroidShareSheetUrlFingerprint.methodOrNull ?: OldFormatAndroidShareSheetUrlFingerprint.method).apply {
            val urlRegister = parameterRegister(1)
            addInstructions(
                0,
                """
                    invoke-static/range { v$urlRegister .. v$urlRegister }, $EXTENSION_CLASS->sanitizeUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$urlRegister
                """,
            )
        }
    }
}
