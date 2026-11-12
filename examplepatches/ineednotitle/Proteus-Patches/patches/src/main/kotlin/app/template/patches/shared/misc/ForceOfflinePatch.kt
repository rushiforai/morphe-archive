package app.template.patches.shared.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.constValue
import app.template.patches.shared.logUniversal
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CONNECTIVITY_MANAGER = "Landroid/net/ConnectivityManager;"
private const val NETWORK_INFO = "Landroid/net/NetworkInfo;"
private const val NETWORK_CAPABILITIES = "Landroid/net/NetworkCapabilities;"

private val CONNECTIVITY_OBJECT_GETTERS = setOf(
    "getActiveNetworkInfo",
    "getNetworkInfo",
    "getActiveNetwork",
    "getNetworkCapabilities",
    "getLinkProperties",
)

private val NETWORK_INFO_BOOLEAN_GETTERS = setOf(
    "isConnected",
    "isConnectedOrConnecting",
    "isAvailable",
)

private val NETWORK_CAPABILITY_BOOLEAN_GETTERS = setOf(
    "hasCapability",
    "hasTransport",
)

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val forceOfflinePatch = bytecodePatch(
    name = "Force offline mode (simulate no network)",
    description = """
        Makes connectivity APIs report no active network, no network capabilities and
        disconnected network info, so apps that check connectivity behave as if the
        device is offline.

        Applies to any app. This is a best-effort simulation, not a firewall: sockets,
        HTTP clients and code that ignores connectivity state can still reach the
        network.
    """.trimIndent(),
    default = false,
) {
    val simulateOffline by booleanOption(
        key = "simulateOffline",
        default = true,
        title = "Simulate offline device",
        description = "Report no active network and no network capabilities.",
    )

    execute {
        val offlineEnabled = simulateOffline ?: true
        if (!offlineEnabled) return@execute

        var connectivity = 0
        var networkInfo = 0
        var capabilities = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@forEachIndexed

                    when {
                        reference.definingClass == CONNECTIVITY_MANAGER &&
                            reference.name in CONNECTIVITY_OBJECT_GETTERS -> {
                            if (replaceResultWithNull(instructions, index, replacements)) connectivity++
                        }

                        reference.definingClass == NETWORK_INFO &&
                            reference.name in NETWORK_INFO_BOOLEAN_GETTERS &&
                            reference.returnType == "Z" -> {
                            if (replaceResultWithFalse(instructions, index, replacements)) networkInfo++
                        }

                        reference.definingClass == NETWORK_CAPABILITIES &&
                            reference.name in NETWORK_CAPABILITY_BOOLEAN_GETTERS &&
                            reference.returnType == "Z" -> {
                            if (replaceResultWithFalse(instructions, index, replacements)) capabilities++
                        }
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) -> method.replaceInstruction(index, smali) }
                }
            }
        }

        logUniversal(
            "Force offline: connectivity=$connectivity networkInfo=$networkInfo " +
                "capabilities=$capabilities.",
        )
    }
}

private fun replaceResultWithNull(
    instructions: List<Instruction>,
    invokeIndex: Int,
    replacements: MutableMap<Int, String>,
): Boolean {
    val moveResult = instructions.getOrNull(invokeIndex + 1) as? OneRegisterInstruction
        ?: return false
    if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return false
    replacements[invokeIndex + 1] = constValue(moveResult.registerA, 0)
    return true
}

private fun replaceResultWithFalse(
    instructions: List<Instruction>,
    invokeIndex: Int,
    replacements: MutableMap<Int, String>,
): Boolean {
    val moveResult = instructions.getOrNull(invokeIndex + 1) as? OneRegisterInstruction
        ?: return false
    if (moveResult.opcode != Opcode.MOVE_RESULT) return false
    replacements[invokeIndex + 1] = constValue(moveResult.registerA, 0)
    return true
}
