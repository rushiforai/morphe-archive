package semicoloncolonel.mobilestream.patches.abcnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// ABC News 8.98.2 is heavily obfuscated, so the hooks rely on names R8 kept:
// Disney's player libraries and the Compose trace strings, which carry the
// original class names.
//
// - Video: Disney's player inserts ads it asks its ad service for, one pod at
//   a time (server-guided ad insertion). Each answer goes through a handler
//   that first checks for an empty pod and answers "no ad" if so, which the
//   player treats as an unfilled break and keeps playing. Both handlers, for
//   regular breaks and for pause ads, now take that path every time.
// - Feed: ad slots load their ad in the background and draw nothing until
//   one arrives, as for a slot with no ad. They now never load one.
// - Articles: the Taboola banner is not drawn.

private const val AD_RESOLVER = "Lcom/disney/dmp/sgai/service/RemoteAdResolverImpl;"
private const val POD_RESPONSE = "Lcom/disney/dmp/sgai/service/PodResponse;"

internal object PodHandlerFingerprint : Fingerprint(
    definingClass = AD_RESOLVER,
    returnType = "Lio/reactivex/SingleSource;",
    parameters = listOf(AD_RESOLVER, "Ljava/lang/Integer;", POD_RESPONSE),
    custom = { method, _ -> method.readsPods() },
)

internal object PauseAdHandlerFingerprint : Fingerprint(
    definingClass = AD_RESOLVER,
    returnType = "Lio/reactivex/SingleSource;",
    parameters = listOf(AD_RESOLVER, POD_RESPONSE),
    custom = { method, _ -> method.readsPods() },
)

// The pod handlers start by reading the response's pod list.
private fun Method.readsPods() = implementation?.instructions?.any {
    val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
    reference?.definingClass == POD_RESPONSE && reference.name == "getRawPods"
} == true

private fun Method.tracesComposable(prefix: String) = implementation?.instructions?.any {
    (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
        ((it as ReferenceInstruction).reference as StringReference).string.startsWith(prefix)
} == true

internal object FeedAdSlotFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ -> method.tracesComposable("com.disney.prism.cards.compose.ui.AdSlotComponentBinder.Bind (") },
)

internal object TaboolaBannerFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.tracesComposable(
            "com.disney.cuento.ad.display.compose.taboola.banner.TaboolaBannerDisplayAdBinder.Render (",
        )
    },
)

// Jumps over the pod check to the handler's own "empty pod" answer.
private fun MutableMethod.answerEmptyPod() {
    val check = instructions.indexOfFirst { it.opcode == Opcode.IF_EQZ }
    if (check < 0) throw PatchException("$definingClass->$name has no empty-pod check")
    val empty = (getInstruction(check) as BuilderOffsetInstruction).target.location.instruction
        ?: throw PatchException("$definingClass->$name empty-pod branch not found")
    addInstructionsWithLabels(0, "goto :empty", ExternalLabel("empty", empty))
}

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads in on-demand videos, the ads in the feeds, and the Taboola banner in articles. " +
        "Ads in the live streams are part of the broadcast and still play. Experimental.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        PodHandlerFingerprint.method.answerEmptyPod()
        PauseAdHandlerFingerprint.method.answerEmptyPod()
        FeedAdSlotFingerprint.method.returnEarly("return-void")
        TaboolaBannerFingerprint.method.returnEarly("return-void")
    }
}
