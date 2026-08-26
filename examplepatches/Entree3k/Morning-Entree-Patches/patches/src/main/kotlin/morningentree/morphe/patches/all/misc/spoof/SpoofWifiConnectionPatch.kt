package morningentree.morphe.patches.all.misc.spoof

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val NETWORK_INFO = "Landroid/net/NetworkInfo;"
private const val NETWORK_CAPABILITIES = "Landroid/net/NetworkCapabilities;"
private const val CONNECTIVITY_MANAGER = "Landroid/net/ConnectivityManager;"

private val TRUE_BOOLEAN_TARGETS = mapOf(
    NETWORK_INFO to setOf("isConnected", "isConnectedOrConnecting", "isAvailable"),
    NETWORK_CAPABILITIES to setOf("hasTransport", "hasCapability"),
)
private val FALSE_BOOLEAN_TARGETS = mapOf(
    CONNECTIVITY_MANAGER to setOf("isActiveNetworkMetered"),
)

private val ENUM_TARGETS = mapOf(
    "getState" to "Landroid/net/NetworkInfo\$State;->CONNECTED:Landroid/net/NetworkInfo\$State;",
    "getDetailedState" to
        "Landroid/net/NetworkInfo\$DetailedState;->CONNECTED:Landroid/net/NetworkInfo\$DetailedState;",
)

// Based on Rushi's patch

@Suppress("unused")
val spoofWifiConnectionPatch = bytecodePatch(
    name = "Spoof Wi-Fi connection",
    description = "Spoof Wi-Fi connection",
    default = false,
) {
    execute {
        classDefForEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    val definingClass = reference.definingClass
                    val name = reference.name

                    if (reference.returnType == "Z") {
                        val literal = when {
                            name in (TRUE_BOOLEAN_TARGETS[definingClass] ?: emptySet()) -> "0x1"
                            name in (FALSE_BOOLEAN_TARGETS[definingClass] ?: emptySet()) -> "0x0"
                            else -> return@forEachIndexed
                        }
                        val move = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                            ?: return@forEachIndexed
                        if (move.opcode == Opcode.MOVE_RESULT) {
                            method.replaceInstruction(index + 1, "const/4 v${move.registerA}, $literal")
                        }
                        return@forEachIndexed
                    }

                    if (definingClass == NETWORK_INFO) {
                        val enumField = ENUM_TARGETS[name] ?: return@forEachIndexed
                        val move = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                            ?: return@forEachIndexed
                        if (move.opcode == Opcode.MOVE_RESULT_OBJECT) {
                            method.replaceInstruction(index + 1, "sget-object v${move.registerA}, $enumField")
                        }
                    }
                }
            }
        }
    }
}
