package app.jofslash.patches.quora.links

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/CleanLinksPatch;"

// The "Copy link" handler: ClipData.newPlainText("Quora URL", url).
internal object CopyLinkFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/messages/QWebViewMessageHandler;",
    filters = listOf(
        string("Quora URL"),
        methodCall(
            definingClass = "Landroid/content/ClipData;",
            name = "newPlainText",
        ),
    )
)

// The share sheet: intent.putExtra("android.intent.extra.TEXT", text).
internal object ShareTextFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/messages/callbacks/ShowNativeShareMessage;",
    filters = listOf(
        string("android.intent.extra.TEXT"),
        methodCall(
            definingClass = "Landroid/content/Intent;",
            name = "putExtra",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
        ),
    )
)

@Suppress("unused")
val cleanSharedLinksPatch = bytecodePatch(
    name = "Clean shared links",
    description = "Removes tracking parameters from Quora links you copy or share.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    execute {
        fun Fingerprint.cleanArgument(registerOf: (FiveRegisterInstruction) -> Int) {
            method.apply {
                val index = instructionMatches.last().index
                val register = registerOf(getInstruction<FiveRegisterInstruction>(index))
                addInstructions(
                    index,
                    """
                        invoke-static { v$register }, $EXTENSION_CLASS->cleanText(Ljava/lang/CharSequence;)Ljava/lang/String;
                        move-result-object v$register
                    """
                )
            }
        }

        // newPlainText(label, text) is static: the text is the second register.
        CopyLinkFingerprint.cleanArgument { it.registerD }
        // putExtra(name, value) is virtual: the intent comes first, then the name and the value.
        ShareTextFingerprint.cleanArgument { it.registerE }
    }
}
