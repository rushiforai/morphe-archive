package semicoloncolonel.mobilestream.patches.abcnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants

// ABC News for Android TV 11.12.0 uses the same Disney player as the phone
// app. The player inserts ads it asks Disney's ad service for, one pod at a
// time (server-guided ad insertion). Each answer goes through a handler that
// first checks for an empty pod and, if so, answers with an error that the
// player treats as an unfilled break, so the video keeps playing. The
// handlers for regular breaks and for pause ads now take that path every
// time.
//
// Live streams usually have their ads stitched in on Disney's servers. The
// player can also ask for live pods, through a third handler, when Disney's
// player configuration turns that on. That handler takes the same path. When
// the live ads are stitched in, the "Mask live ad breaks" option covers them.
//
// The TV app has no ads in its feeds and no Taboola, unlike the phone app.

private const val AD_RESOLVER = "Lcom/disney/dmp/sgai/service/RemoteAdResolverImpl;"
private const val POD_RESPONSE = "Lcom/disney/dmp/sgai/service/PodResponse;"

internal object PodHandlerFingerprint : Fingerprint(
    definingClass = AD_RESOLVER,
    returnType = "Lio/reactivex/SingleSource;",
    parameters = listOf(AD_RESOLVER, "Ljava/lang/Integer;", POD_RESPONSE),
    custom = { method, _ -> method.readsPods() },
)

internal object LivePodHandlerFingerprint : Fingerprint(
    definingClass = AD_RESOLVER,
    returnType = "Lio/reactivex/SingleSource;",
    parameters = listOf(AD_RESOLVER, "I", POD_RESPONSE),
    custom = { method, _ -> method.readsPods() },
)

internal object PauseAdHandlerFingerprint : Fingerprint(
    definingClass = AD_RESOLVER,
    returnType = "Lio/reactivex/SingleSource;",
    parameters = listOf(AD_RESOLVER, POD_RESPONSE),
    custom = { method, _ -> method.readsPods() },
)

// The handlers start by reading the response's pod list. The synthetic
// bridges with the same signatures only forward the call.
private fun Method.readsPods() = implementation?.instructions?.any {
    val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
    reference?.definingClass == POD_RESPONSE && reference.name == "getRawPods"
} == true

// Jumps over the pod check to the handler's own "no pod" answer.
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
    description = "Removes the ads in on-demand videos and the ads shown when a video is paused.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)
    extendWith("extensions/extension.mpe")

    val maskLiveAds by booleanOption(
        key = "maskLiveAds",
        default = true,
        title = "Mask live ad breaks",
        description = "Covers live ad breaks with a \"We'll be right back!\" screen and mutes them.",
    )

    execute {
        PodHandlerFingerprint.method.answerEmptyPod()
        PauseAdHandlerFingerprint.method.answerEmptyPod()
        // Only some player versions ask for live pods.
        LivePodHandlerFingerprint.methodOrNull?.answerEmptyPod()
        if (maskLiveAds == true) maskLiveAdBreaks()
    }
}
