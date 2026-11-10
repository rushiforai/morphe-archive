package app.morphe.patches.merriamwebster

import app.morphe.patches.merriamwebster.Constants.COMPATIBILITY_MERRIAM_WEBSTER
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/merriamwebster/AddToAnkiPatch;"

@Suppress("unused")
val addToAnkiPatch = bytecodePatch(
    name = "Add to Anki",
    description = "Adds a button next to share on each definition that sends the word and its " +
            "definitions to AnkiDroid as a new card.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MERRIAM_WEBSTER)

    extendWith("extensions/merriamwebster.mpe")

    execute {
        // Insert the button into the definition HTML right before the WebView loads it.
        ShowDefinitionFingerprint.let {
            val moveResult = it.instructionMatches[1]
            val register = moveResult.getInstruction<OneRegisterInstruction>().registerA
            it.method.addInstructions(
                moveResult.index + 1,
                """
                    invoke-static { v$register }, $EXTENSION_CLASS->addButtons(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """
            )
        }

        // Handle taps on the button's x-mw://anki/<n> link before the app's own url handler.
        listOf(ShouldOverrideUrlRequestFingerprint, ShouldOverrideUrlStringFingerprint).forEach {
            it.method.addInstructionsWithLabels(
                0,
                """
                    invoke-static { p1, p2 }, $EXTENSION_CLASS->onUrl(Landroid/webkit/WebView;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :app_handles_url
                    return v0
                """,
                ExternalLabel("app_handles_url", it.method.getInstruction(0))
            )
        }
    }
}
