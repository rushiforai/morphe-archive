package app.template.patches.rtenews.ads

import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_RTENEWS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * RTÉ News draws an ad embed inside articles: a Compose block with the "ADVERTISEMENT" heading and
 * an AdView, built from the article's advertising info and left visible as an empty placeholder
 * when no ad fills.
 *
 * The patch does two things:
 *  1. the ad block composable returns at its entry, so neither the heading nor the placeholder is
 *     laid out;
 *  2. the loader no longer calls AdView.loadAd(request), so no ad request is made for the article
 *     (the AdView and its request object are still constructed; only the network call goes).
 *
 * The consent stack (OneTrust), the article content and the rest of the ad SDK are untouched.
 *
 * Verified 2026-10-27 against 10.0.2 (versionCode 440): see COMPATIBILITY_RTENEWS.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes the article ad blocks and their empty placeholders.",
) {
    compatibleWith(COMPATIBILITY_RTENEWS)

    execute {
        RteAdBlockFingerprint.method.returnEarly()

        val loader = RteAdLoadFingerprint.method
        val insns = loader.implementation?.instructions?.toList()
            ?: throw PatchException("${loader.definingClass}->${loader.name} has no implementation")

        // The container is created right after the AdView.loadAd call; drop that call.
        val containerIndex = insns.indexOfFirst { instruction ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == loader.returnType
        }
        if (containerIndex <= 0) {
            throw PatchException("${loader.definingClass}->${loader.name} does not build its container")
        }
        val load = insns[containerIndex - 1]
        val loadRef = (load as? ReferenceInstruction)?.reference as? MethodReference
        if (load.opcode != Opcode.INVOKE_VIRTUAL || loadRef?.returnType != "V" ||
            loadRef.parameterTypes.size != 1 || loadRef.parameterTypes.map(CharSequence::toString).firstOrNull()?.startsWith("L") != true
        ) {
            throw PatchException(
                "${loader.definingClass}->${loader.name}: expected AdView.loadAd before the container, " +
                    "got ${load.opcode} $loadRef",
            )
        }

        loader.removeInstructions(containerIndex - 1, 1)
    }
}
