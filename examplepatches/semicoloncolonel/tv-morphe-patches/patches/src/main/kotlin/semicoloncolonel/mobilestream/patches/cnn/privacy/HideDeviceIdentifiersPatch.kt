package semicoloncolonel.mobilestream.patches.cnn.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.cnn.shared.Constants

// CNN 26.10.1 for Android TV gives the web app its advertising ID through the
// bridge method deviceIFA(), which asks Google's advertising ID client
// (renamed by R8) and returns DeviceIFA(id, limitAdTracking, type) as JSON.
// Right before each DeviceIFA is built, the ID becomes the all-zeros ID and
// limit ad tracking becomes true, which is what apps see after the user
// deletes the advertising ID in Android settings.
//
// The shared Hide device identifiers patch does not fit this app. It cannot
// find the renamed AdvertisingIdInfo getters, and its rename of the ad ID
// service action would make the renamed client throw an IOException that
// deviceIFA() does not catch. The app reads no Android ID.

private const val DEVICE_IFA = "Lcom/cnn/ctv/DeviceIFA;"
private const val ZERO_AD_ID = "00000000-0000-0000-0000-000000000000"

internal object DeviceIfaFingerprint : Fingerprint(
    definingClass = "Lcom/cnn/ctv/JavaScriptBridge;",
    name = "deviceIFA",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

@Suppress("unused")
val hideDeviceIdentifiersPatch = bytecodePatch(
    name = "Hide device identifiers",
    description = "Gives the app's web pages a zeroed advertising ID with ad tracking limited.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        DeviceIfaFingerprint.method.apply {
            // DeviceIFA(String id, boolean limitAdTracking, String type): the
            // normal path and the app's own fallback.
            val sites = implementation!!.instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_DIRECT &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == DEVICE_IFA && it.name == "<init>" &&
                            it.parameterTypes.map { type -> type.toString() } ==
                            listOf("Ljava/lang/String;", "Z", "Ljava/lang/String;")
                    }
            }.map { it.index to (it.value as FiveRegisterInstruction) }
            if (sites.isEmpty()) throw PatchException("Hide device identifiers: DeviceIFA is not built in deviceIFA()")

            // Last first, so earlier indexes stay valid.
            sites.reversed().forEach { (index, call) ->
                addInstructions(
                    index,
                    """
                        const-string v${call.registerD}, "$ZERO_AD_ID"
                        const/4 v${call.registerE}, 0x1
                    """.trimIndent(),
                )
            }
        }
    }
}
