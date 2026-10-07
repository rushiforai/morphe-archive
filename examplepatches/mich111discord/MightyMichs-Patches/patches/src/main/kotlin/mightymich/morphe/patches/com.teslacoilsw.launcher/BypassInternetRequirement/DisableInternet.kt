package mightymich.morphe.patches.com.teslacoilsw.launcher.BypassInternetRequirement

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val disableInternetPatch = bytecodePatch(
    name = "Disable Internet Access",
    description = "Simulates no internet connection in Nova Launcher to prevent background network activity.",
    default = true
) {
    compatibleWith(NovaLauncherCompatibility.NOVA_LAUNCHER)

    // 1. Fingerprint: locate the method 'a' in class 'n0', which checks network connectivity.
    val networkCheckFingerprint = Fingerprint(
        definingClass = "Ln0;",
        name = "a",
        returnType = "V"
    )

    execute {
        networkCheckFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find method 'a' in class 'n0'.")
            val instructions = method.implementation?.instructions?.toList()
                ?: throw PatchException("Method has no implementation.")

            // 2. Iterate over instructions and replace results of getActiveNetworkInfo and isConnected.
            var replaced = 0
            for (i in instructions.indices) {
                val instruction = instructions[i]
                if (instruction is ReferenceInstruction) {
                    val ref = instruction.reference
                    if (ref is MethodReference) {
                        // 3. Replace move-result-object after getActiveNetworkInfo with null.
                        if (ref.name == "getActiveNetworkInfo" &&
                            ref.definingClass == "Landroid/net/ConnectivityManager;") {
                            if (i + 1 < instructions.size) {
                                val next = instructions[i + 1]
                                if (next.opcode.name == "MOVE_RESULT_OBJECT" &&
                                    next is OneRegisterInstruction) {
                                    method.replaceInstruction(
                                        i + 1,
                                        "const/4 v${next.registerA}, 0x0"
                                    )
                                    replaced++
                                }
                            }
                        }
                        // 4. Replace move-result after isConnected with false (0).
                        if (ref.name == "isConnected" &&
                            ref.definingClass == "Landroid/net/NetworkInfo;") {
                            if (i + 1 < instructions.size) {
                                val next = instructions[i + 1]
                                if (next.opcode.name == "MOVE_RESULT" &&
                                    next is OneRegisterInstruction) {
                                    method.replaceInstruction(
                                        i + 1,
                                        "const/4 v${next.registerA}, 0x0"
                                    )
                                    replaced++
                                }
                            }
                        }
                    }
                }
            }

            if (replaced == 0) {
                throw PatchException("Could not find network check instructions in method 'a' of class 'n0'.")
            }
        }
    }
}
