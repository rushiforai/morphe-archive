package app.template.patches.spotify.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.shared.addInstructionsAtControlFlowLabel
import app.template.patches.shared.getReference
import app.template.patches.shared.indexOfFirstInstructionOrThrow
import app.template.patches.spotify.shared.FormatAndroidShareSheetUrlFingerprint
import app.template.patches.spotify.shared.FormatAndroidShareSheetUrlStringFingerprint
import app.template.patches.spotify.shared.OldFormatAndroidShareSheetUrlFingerprint
import app.template.patches.spotify.shared.OldShareCopyUrlFingerprint
import app.template.patches.spotify.shared.ShareCopyUrlFingerprint
import app.template.patches.spotify.shared.parameterRegister
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS =
    "Lapp/template/extension/extension/SpotifyLinkSanitizer;"

// Removes the tracking parameters (si, utm_source) from shared and copied
// links.
//
// Two sharing surfaces are hooked:
//   • "Copy link": the text handed to ClipData.newPlainText is sanitized —
//     every http(s) URL inside the text is stripped of tracking parameters
//     while the surrounding message, parameter order and fragments stay.
//   • The share sheet: the url parameter of the share message formatter is
//     sanitized before the message is composed.
//
// Fail-safe: URLs without tracking parameters keep their exact original string
// (same instance), and unrecognized link shapes pass through unchanged.

@Suppress("unused")
val spotifySanitizeSharingLinksPatch = bytecodePatch(
    name = "Sanitize sharing links",
    description = "Removes the tracking parameters (si, utm_source) from shared and copied links.",
    default = true,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

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
        (
            FormatAndroidShareSheetUrlFingerprint.methodOrNull
                ?: FormatAndroidShareSheetUrlStringFingerprint.methodOrNull
                ?: OldFormatAndroidShareSheetUrlFingerprint.method
        ).apply {
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
