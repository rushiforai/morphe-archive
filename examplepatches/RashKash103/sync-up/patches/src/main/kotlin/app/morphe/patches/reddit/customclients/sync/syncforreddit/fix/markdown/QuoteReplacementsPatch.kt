package app.morphe.patches.reddit.customclients.sync.syncforreddit.fix.markdown

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val QUOTE_REPLACEMENT =
    "Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;"

@Suppress("unused")
val quoteReplacementsPatch = bytecodePatch(
    name = "Load threads whose text contains a dollar sign",
    description = "Stops a thread failing to load when the text in it contains a dollar sign.",
    default = true
) {
    compatibleWith(*SyncForRedditCompatible)

    execute {
        listOf(codeBlockFingerprint, markdownLinkFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                // Every place matched text is handed back as a replacement, of which the link
                // rewriting has several.
                val replacements = instructions.withIndex().filter { (_, instruction) ->
                    instruction.getReference<MethodReference>()?.name == "appendReplacement"
                }.map { (index, _) -> index }

                replacements.reversed().forEach { index ->
                    val register = getInstruction<FiveRegisterInstruction>(index).registerE

                    addInstructions(
                        index,
                        """
                        invoke-static       { v$register }, $QUOTE_REPLACEMENT
                        move-result-object  v$register
                        """
                    )
                }
            }
        }
    }
}
