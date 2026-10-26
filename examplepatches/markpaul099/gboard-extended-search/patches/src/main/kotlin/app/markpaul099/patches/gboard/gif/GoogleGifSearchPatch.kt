package app.markpaul099.patches.gboard.gif

import app.markpaul099.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/markpaul099/extension/gboard/GoogleGifSearchPatch;"

@Suppress("unused")
val googleGifSearchPatch = bytecodePatch(
    name = "Use Google Images for GIF search",
    description = "Searches animated GIFs on Google Images with SafeSearch off instead of Tenor, " +
        "covering real life and anime. Sticker search stays on Tenor, and Tenor results are " +
        "kept if Google returns nothing. Experimental: depends on Google's page layout.",
    default = false
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(removeGifSearchFilterPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Strip our own paging token before the Tenor request is sent.
        TenorRequestUriFingerprint.let {
            val returnIndex = it.instructionMatches.last().index
            val uriRegister = it.instructionMatches.last().getInstruction<OneRegisterInstruction>().registerA

            it.method.addInstructions(
                returnIndex,
                """
                    invoke-static/range { v$uriRegister .. v$uriRegister }, $EXTENSION_CLASS->rewriteRequest(Landroid/net/Uri;)Landroid/net/Uri;
                    move-result-object v$uriRegister
                """
            )
        }

        // Swap the reply body for Google results before it is parsed.
        TenorResponseParseFingerprint.let {
            val constructor = it.instructionMatches.first()
            val bodyRegister = constructor.getInstruction<FiveRegisterInstruction>().registerD

            it.method.addInstructions(
                constructor.index,
                """
                    invoke-static/range { v$bodyRegister .. v$bodyRegister }, $EXTENSION_CLASS->convertResponse(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$bodyRegister
                """
            )
        }

        // The callback that parses Tenor replies holds the request: hand it to the extension
        // right before it creates the parser, so the extension knows which request this is.
        val parserType = TenorResponseParseFingerprint.originalClassDef.type
        Fingerprint(
            filters = listOf(
                methodCall(definingClass = parserType, name = "<init>", parameters = listOf("Z"))
            )
        ).let {
            it.method.addInstructions(
                it.instructionMatches.first().index,
                """
                    invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->setPendingRequest(Ljava/lang/Object;)V
                """
            )
        }
    }
}
