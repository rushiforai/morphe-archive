package app.markpaul099.patches.gboard.gif

import app.markpaul099.patches.gboard.misc.identity.googleApiIdentityPatch
import app.markpaul099.patches.gboard.settings.gifsExtendedSettingsPatch
import app.markpaul099.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.markpaul099.patches.shared.extensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val RUNTIME_CLASS = "Lapp/markpaul099/extension/gifsextended/GifSearchRuntime;"

@Suppress("unused")
val googleImagesGifSearchPatch = bytecodePatch(
    name = "Google Images GIF Search",
    description = "Searches GIFs on Google Images, with Tenor as a fallback. " +
        "SafeSearch can be switched in GIFs Extended settings (on by default).",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(extensionPatch, gifsExtendedSettingsPatch, googleApiIdentityPatch)

    execute {
        // Tenor content filter level follows the SafeSearch setting.
        TenorContentFilterParamFingerprint.matchAll().forEach { match ->
            val putCall = match.instructionMatches[1]
            // invoke-virtual {builder, key, value}
            val valueRegister = putCall.getInstruction<FiveRegisterInstruction>().registerE
            match.method.addInstructions(
                putCall.index,
                """
                    invoke-static/range { v$valueRegister .. v$valueRegister }, $RUNTIME_CLASS->applyContentFilter(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$valueRegister
                """
            )
        }

        // Strip the Google paging token before the Tenor request is sent.
        TenorRequestUriFingerprint.let {
            val returnMatch = it.instructionMatches.last()
            val uriRegister = returnMatch.getInstruction<OneRegisterInstruction>().registerA
            it.method.addInstructions(
                returnMatch.index,
                """
                    invoke-static/range { v$uriRegister .. v$uriRegister }, $RUNTIME_CLASS->rewriteRequest(Landroid/net/Uri;)Landroid/net/Uri;
                    move-result-object v$uriRegister
                """
            )
        }

        // Swap the reply body for Google Images results before it is parsed.
        TenorResponseParseFingerprint.let {
            val constructor = it.instructionMatches.first()
            val bodyRegister = constructor.getInstruction<FiveRegisterInstruction>().registerD
            it.method.addInstructions(
                constructor.index,
                """
                    invoke-static/range { v$bodyRegister .. v$bodyRegister }, $RUNTIME_CLASS->convertResponse(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$bodyRegister
                """
            )
        }

        // The callback that parses Tenor replies holds the request: hand it to the runtime so
        // it knows which request a reply belongs to. This runs at method entry, where p0 is
        // still `this` (Gboard's code reuses that register later on).
        val parserType = TenorResponseParseFingerprint.originalClassDef.type
        Fingerprint(
            filters = listOf(
                methodCall(definingClass = parserType, name = "<init>", parameters = listOf("Z"))
            )
        ).method.let { method ->
            check(!AccessFlags.STATIC.isSet(method.accessFlags)) {
                "Expected an instance method holding the Tenor request: ${method.definingClass}->${method.name}"
            }
            // p0 as a plain register, so the inline compiler needs no parameter context.
            val thisRegister = method.implementation!!.registerCount -
                method.parameterTypes.sumOf { type -> if (type.toString() == "J" || type.toString() == "D") 2 else 1 } - 1
            method.addInstructions(
                0,
                """
                    invoke-static/range { v$thisRegister .. v$thisRegister }, $RUNTIME_CLASS->setPendingRequest(Ljava/lang/Object;)V
                """
            )
        }
    }
}
