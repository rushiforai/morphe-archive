package semicoloncolonel.mobilestream.patches.abcnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants

// ABC News 8.98.2. Ads in the live streams are stitched in on Disney's
// servers, so they cannot be removed. The player UI keeps an AdState whose
// isInAd flag drives the "Ad" countdown, and every change to that flag goes
// through AdStatusStateModifier, which the player also sends with false when
// it closes. LiveBreakMask covers the screen in front and mutes the media
// volume while the flag is set. AdTimerControl's Render receives the
// milliseconds left in the break as a StateFlow, which the cover reads for its
// own countdown. Every screen passes through
// ComponentActivity.onCreate, which lets the mask follow the one in front.

private const val MASK = "Lsemicoloncolonel/mobilestream/extension/abcnews/LiveBreakMask;"

internal object AdStatusModifierToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("AdStatusStateModifier(isInAd="),
)

internal object AdTimerRenderFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.getOrNull(1) == "Lkotlinx/coroutines/flow/StateFlow;" &&
            method.implementation?.instructions?.any {
                (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((it as ReferenceInstruction).reference as StringReference).string
                        .startsWith("com.disney.media.ui.feature.ads.AdTimerControl.Render (")
            } == true
    },
)

internal object ActivityCreateFingerprint : Fingerprint(
    definingClass = "Landroidx/activity/ComponentActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

@Suppress("unused")
val maskLiveAdBreaksPatch = bytecodePatch(
    name = "Mask live ad breaks",
    description = "Covers the ad breaks in the live streams with a black screen and mutes them, then restores " +
        "the stream when the break ends. Live ads are part of the broadcast, so they cannot be removed.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val modifier = AdStatusModifierToStringFingerprint.classDef
        // toString reads isInAd first.
        val isInAd = AdStatusModifierToStringFingerprint.method.implementation!!.instructions
            .first { it.opcode == Opcode.IGET_BOOLEAN }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        // modify(state): returns the state type it is given.
        val modify = modifier.methods.firstOrNull { method ->
            method.parameterTypes.size == 1 && method.returnType == method.parameterTypes[0].toString() &&
                method.implementation != null
        } ?: throw PatchException("AdStatusStateModifier modify not found in ${modifier.type}")
        if (modify.implementation!!.registerCount - 2 < 1) throw PatchException("No free register in modify")
        modify.addInstructions(
            0,
            """
                iget-boolean v0, p0, $isInAd
                invoke-static { v0 }, $MASK->onAdState(Z)V
            """,
        )
        // /range: p2 can be above v15.
        AdTimerRenderFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p2 .. p2 }, $MASK->trackTimer(Ljava/lang/Object;)V",
        )
        ActivityCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $MASK->track(Landroid/app/Activity;)V",
        )
    }
}
