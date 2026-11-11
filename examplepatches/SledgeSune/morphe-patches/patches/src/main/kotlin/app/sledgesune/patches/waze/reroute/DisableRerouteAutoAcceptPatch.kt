package app.sledgesune.patches.waze.reroute

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_WAZE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ALERTER_INFO = "Lcom/waze/jni/protos/alerters/AlerterInfo;"
private const val ALERTER_TIMER_TYPE = "Lcom/waze/jni/protos/alerters/AlerterTimerType;"
private const val EXTENSION_CLASS = "Lapp/sledgesune/extension/waze/DisableRerouteAutoAcceptPatch;"

/**
 * Converter from the native core's AlerterInfo to the app's alert model
 * (obfuscated, e.g. `Lcom/b/b/a/u;->d(AlerterInfo)Lcom/waze/i;` in 5.27.4.900).
 *
 * It maps AlerterTimerType to the alert's timeout:
 * PRIMARY_BUTTON / SECONDARY_BUTTON make that button count down and press itself.
 * The protobuf classes keep their real names, so match on those.
 */
internal object AlerterInfoConverterFingerprint : Fingerprint(
    parameters = listOf(ALERTER_INFO),
    filters = listOf(
        methodCall(definingClass = ALERTER_INFO, name = "getTimerType"),
        methodCall(definingClass = ALERTER_INFO, name = "getTimeoutSeconds"),
    )
)

@Suppress("unused")
val disableRerouteAutoAcceptPatch = patch(
    name = "Disable reroute auto-accept",
    description = "Removes the countdown from the \"faster route found\" prompt while driving, " +
        "so the route only changes when you tap the button yourself.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAZE)

    extendWith("extensions/extension.mpe")

    execute {
        AlerterInfoConverterFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val callIndex = instructions.indexOfFirst {
                val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == ALERTER_INFO && reference.name == "getTimerType"
            }
            if (callIndex < 0) throw PatchException("AlerterInfo.getTimerType() call not found")

            val resultInstruction = instructions[callIndex + 1]
            if (resultInstruction.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Unexpected instruction after getTimerType(): ${resultInstruction.opcode}")
            }
            val resultRegister = (resultInstruction as OneRegisterInstruction).registerA

            // Ask the extension for the timer type instead. It returns the real one,
            // except for the reroute suggestion prompt.
            val extensionMethod = "$EXTENSION_CLASS->getTimerType(Ljava/lang/Object;)Ljava/lang/Object;"
            val replacement = when (val call = instructions[callIndex]) {
                is FiveRegisterInstruction ->
                    "invoke-static { v${call.registerC} }, $extensionMethod"

                is RegisterRangeInstruction ->
                    "invoke-static/range { v${call.startRegister} .. v${call.startRegister} }, $extensionMethod"

                else -> throw PatchException("Unexpected getTimerType() call: ${call.opcode}")
            }

            // Add below first so the indexes above stay valid.
            addInstruction(callIndex + 2, "check-cast v$resultRegister, $ALERTER_TIMER_TYPE")
            replaceInstruction(callIndex, replacement)
        }
    }
}
