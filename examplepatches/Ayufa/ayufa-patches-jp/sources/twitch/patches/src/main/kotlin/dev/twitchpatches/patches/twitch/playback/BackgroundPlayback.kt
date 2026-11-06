package dev.twitchpatches.patches.twitch.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.*

private const val VERTICAL = "Ltv/twitch/android/feature/theatre/vertical/VerticalTheatreFragment;"

private object VerticalBackgroundEligibilityFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Z",
    parameters = listOf(VERTICAL),
    strings = listOf("audioDeviceManager"),
)

internal fun requireBackgroundEligibilityContract(lifecycle: Method, eligibility: Method) {
    val calls = lifecycle.references().filterIsInstance<MethodReference>().map { it.toString() }
    require(eligibility.reference in calls && eligibility.references().filterIsInstance<MethodReference>().count(::isDjStatus) == 1) {
        "Background playback: eligibility is no longer the DJ check used by the stop lifecycle."
    }
}

internal fun BytecodePatchContext.restoreNativeBackgroundPlayback() {
    val lifecycle = classDefBy(VERTICAL).methods.filter {
        it.name == "onStop" && it.parameterTypes.isEmpty() && it.returnType == "V"
    }.uniqueHook("vertical playback stop lifecycle")
    val eligibility = VerticalBackgroundEligibilityFingerprint.originalMethod
    requireBackgroundEligibilityContract(lifecycle, eligibility)
    val code = eligibility.code()
    val read = code.indexOfFirst { isDjStatus((it as? ReferenceInstruction)?.reference as? MethodReference) }
    val result = code[read + 1] as? OneRegisterInstruction
    require(code[read + 1].opcode == Opcode.MOVE_RESULT && result != null) {
        "Background playback: DJ result contract changed."
    }
    // Keep Twitch's audio-device preference and foreground-service lifecycle intact.
    VerticalBackgroundEligibilityFingerprint.method.replaceInstruction(read + 1, "const/16 v${result.registerA}, 0x0")
}
