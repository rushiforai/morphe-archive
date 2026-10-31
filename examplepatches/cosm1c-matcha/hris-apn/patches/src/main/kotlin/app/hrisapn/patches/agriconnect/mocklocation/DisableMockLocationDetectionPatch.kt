package app.hrisapn.patches.agriconnect.mocklocation

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.hrisapn.patches.agriconnect.shared.Constants.COMPATIBILITY_AGRICONNECT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Forces the `simulated` flag of the background-geolocation plugin to `false`.
 *
 * The check-in/out page does:
 *
 *     this.isMockLocation = location.simulated
 *     if (this.isMockLocation) showMockLocationAlert()
 *
 * so a constant `false` makes the guard never trigger. The position itself is
 * unaffected; only the boolean that describes it is overridden.
 */
@Suppress("unused")
val disableMockLocationDetectionPatch = bytecodePatch(
    name = "Disable mock GPS detection",
    description = "Forces the background-geolocation 'simulated' flag to false so the " +
        "check-in/out mock-location guard never blocks submission.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AGRICONNECT)

    execute {
        FormatLocationFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()

            // The original sequence is:
            //   invoke-virtual {p0}, Landroid/location/Location;->isFromMockProvider()Z
            //   move-result v2
            //   invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)...
            val callIndex = instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                reference is MethodReference &&
                    reference.definingClass == "Landroid/location/Location;" &&
                    reference.name == "isFromMockProvider"
            }
            if (callIndex == -1) {
                throw PatchException("isFromMockProvider() was not found in formatLocation()")
            }

            // Only the immediately following move-result consumes the result.
            val moveResult = instructions.getOrNull(callIndex + 1)
                ?: throw PatchException("Unexpected end of formatLocation()")

            if (moveResult.opcode != Opcode.MOVE_RESULT) {
                throw PatchException(
                    "Unexpected instruction after isFromMockProvider(): ${moveResult.opcode}"
                )
            }

            // Overwrite the mock flag with false. v0-v15 can use const/4.
            val register = (moveResult as OneRegisterInstruction).registerA
            replaceInstruction(
                callIndex + 1,
                if (register <= 0xF) "const/4 v$register, 0x0"
                else "const/16 v$register, 0x0",
            )
        }
    }
}
