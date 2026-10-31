package dev.twitchpatches.patches.twitch.playback

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.*

private const val VERTICAL = "Ltv/twitch/android/feature/theatre/vertical/VerticalTheatreFragment;"

internal fun nativeBackgroundEligibility(all: List<Method>): Method {
    val lifecycle = all.filter { it.definingClass == VERTICAL && it.name == "onStop" &&
        it.parameterTypes.isEmpty() && it.returnType == "V" }.uniqueHook("vertical playback stop lifecycle")
    val calls = lifecycle.references().filterIsInstance<MethodReference>().map { it.toString() }.toSet()
    return all.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" &&
            method.parameterTypes.map { it.toString() } == listOf(VERTICAL) &&
            method.reference in calls && method.hasStrings("audioDeviceManager") &&
            method.references().filterIsInstance<MethodReference>().count(::isDjStatus) == 1
    }.uniqueHook("vertical background playback eligibility")
}

internal fun BytecodePatchContext.restoreNativeBackgroundPlayback() {
    val all = mutableListOf<Method>()
    classDefForEach { all.addAll(it.methods) }
    val eligibility = nativeBackgroundEligibility(all)
    val code = eligibility.code()
    val read = code.indexOfFirst { isDjStatus((it as? ReferenceInstruction)?.reference as? MethodReference) }
    val result = code[read + 1] as? OneRegisterInstruction
    require(code[read + 1].opcode == Opcode.MOVE_RESULT && result != null) {
        "Background playback: DJ result contract changed."
    }
    // Keep Twitch's audio-device preference and foreground-service lifecycle intact.
    mutableClassDefBy(eligibility.definingClass).methods.single { it.reference == eligibility.reference }
        .replaceInstruction(read + 1, "const/16 v${result.registerA}, 0x0")
}
