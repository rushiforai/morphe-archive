package semicoloncolonel.mobilestream.patches.abcnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod

// ABC News for Android TV 11.12.0. The player UI keeps an AdState whose
// isInAd flag drives the "Ad" countdown, and every change to that flag goes
// through AdStatusStateModifier, which the player also sends with false when
// it closes. LiveBreakMask covers the screen in front and mutes the media
// volume while the flag is set.
//
// The countdown control receives the milliseconds left in the break as a
// StateFlow. On TV, R8 merged that control into a class that draws several
// player controls, chosen by a switch, so the hook sits in the countdown's
// own branch, right after it reads its text style (AdTimerSkin). Without that
// hook the cover still works and shows no time.
//
// Every screen extends androidx's ComponentActivity, whose name R8 changed,
// so it is found by an error message in its constructor. Its onCreate lets
// the mask follow the screen in front.

private const val MASK = "Lsemicoloncolonel/mobilestream/extension/shared/misc/LiveBreakMask;"
private const val STATE_FLOW = "Lkotlinx/coroutines/flow/StateFlow;"
private const val COMPONENT_ACTIVITY_ERROR =
    "getLifecycle() returned null in ComponentActivity's constructor. Please make sure you are lazily " +
        "constructing your Lifecycle in the first call to getLifecycle() rather than relying on field " +
        "initialization."

internal object AdStatusModifierToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("AdStatusStateModifier(isInAd="),
)

internal object AdTimerSkinToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("AdTimerSkin(textColor="),
)

internal object ComponentActivityInitFingerprint : Fingerprint(
    strings = listOf(COMPONENT_ACTIVITY_ERROR),
)

private fun Instruction.castsTo(type: String) =
    opcode == Opcode.CHECK_CAST && ((this as ReferenceInstruction).reference as TypeReference).type == type

/** Part of Skip ads: runs only when its "maskLiveAds" option is on. */
internal fun BytecodePatchContext.maskLiveAdBreaks() {
    // 1. The isInAd flag. toString reads it first.
    val modifier = AdStatusModifierToStringFingerprint.classDef
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

    // 2. The countdown's StateFlow, in the merged control class.
    val skin = AdTimerSkinToStringFingerprint.classDef.type
    forEachMatchingMethod(
        classFilter = { true },
        methodFilter = { method ->
            method.returnType == "V" &&
                method.parameterTypes.getOrNull(1)?.toString() == STATE_FLOW &&
                method.implementation?.instructions?.any { it.castsTo(skin) } == true
        },
    ) { method ->
        val index = method.instructions.indexOfFirst { it.castsTo(skin) }
        // /range: p2 is above v15 in this method.
        method.addInstruction(index + 1, "invoke-static/range { p2 .. p2 }, $MASK->trackTimer(Ljava/lang/Object;)V")
    }

    // 3. The screen in front.
    val onCreate = ComponentActivityInitFingerprint.classDef.methods.firstOrNull {
        it.name == "onCreate" && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
    } ?: throw PatchException("ComponentActivity.onCreate not found")
    onCreate.addInstruction(0, "invoke-static/range { p0 .. p0 }, $MASK->track(Landroid/app/Activity;)V")
}
