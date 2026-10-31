package app.morphe.patches.vkvideo.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vkvideo.shared.Constants.COMPATIBILITY_VK_VIDEO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/vkvideo/vpn/VpnSpoof;"

private fun formatInvokeStatic(instruction: Instruction, targetMethod: String): String {
    return when (instruction) {
        is FiveRegisterInstruction -> {
            val regs = when (instruction.registerCount) {
                1 -> "v${instruction.registerC}"
                2 -> "v${instruction.registerC}, v${instruction.registerD}"
                3 -> "v${instruction.registerC}, v${instruction.registerD}, v${instruction.registerE}"
                4 -> "v${instruction.registerC}, v${instruction.registerD}, v${instruction.registerE}, v${instruction.registerF}"
                5 -> "v${instruction.registerC}, v${instruction.registerD}, v${instruction.registerE}, v${instruction.registerF}, v${instruction.registerG}"
                else -> error("Unsupported register count: ${instruction.registerCount}")
            }
            "invoke-static { $regs }, $targetMethod"
        }
        is RegisterRangeInstruction -> {
            val start = instruction.startRegister
            val end = start + instruction.registerCount - 1
            "invoke-static/range { v$start .. v$end }, $targetMethod"
        }
        else -> error("Unsupported instruction format: ${instruction::class.java.simpleName}")
    }
}

@Suppress("unused")
val vpnDetectionPatch = bytecodePatch(
    name = "Bypass VPN detection",
    description = "Bypasses VPN and proxy detection across the application so video streaming works smoothly over VPN.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_VIDEO)

    extendWith("extensions/vkvideo.mpe")

    execute {
        val proxyClasses = (classDefByStrings("http.proxyHost") + classDefByStrings("http.proxyPort"))
            .map { it.type }
            .toSet()

        var rewrittenInstructions = 0

        classDefForEach { classDef ->
            if (classDef.type == EXTENSION_CLASS) return@classDefForEach

            val isProxyClass = classDef.type in proxyClasses
            var classHasTargets = false

            for (method in classDef.methods) {
                val instructions = method.implementation?.instructions ?: continue
                for (instruction in instructions) {
                    val op = instruction.opcode
                    if (op == Opcode.INVOKE_VIRTUAL || op == Opcode.INVOKE_VIRTUAL_RANGE) {
                        val ref = (instruction as ReferenceInstruction).reference as MethodReference
                        val defClass = ref.definingClass
                        val name = ref.name
                        if (defClass == "Landroid/net/NetworkCapabilities;" && (name == "hasTransport" || name == "hasCapability")) {
                            classHasTargets = true
                            break
                        } else if (defClass == "Landroid/net/ConnectivityManager;" && name == "getNetworkInfo") {
                            classHasTargets = true
                            break
                        }
                    } else if (isProxyClass && (op == Opcode.INVOKE_STATIC || op == Opcode.INVOKE_STATIC_RANGE)) {
                        val ref = (instruction as ReferenceInstruction).reference as MethodReference
                        if (ref.definingClass == "Ljava/lang/System;" && ref.name == "getProperty") {
                            classHasTargets = true
                            break
                        }
                    }
                }
                if (classHasTargets) break
            }

            if (!classHasTargets) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)

            for (method in mutableClass.methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue

                instructions.forEachIndexed { index, instruction ->
                    val op = instruction.opcode
                    if (op == Opcode.INVOKE_VIRTUAL || op == Opcode.INVOKE_VIRTUAL_RANGE) {
                        val ref = (instruction as ReferenceInstruction).reference as MethodReference
                        val defClass = ref.definingClass
                        val name = ref.name

                        if (defClass == "Landroid/net/NetworkCapabilities;") {
                            if (name == "hasTransport" && ref.parameterTypes.size == 1 && ref.parameterTypes[0].toString() == "I") {
                                val targetMethod = "$EXTENSION_CLASS->hasTransport(Landroid/net/NetworkCapabilities;I)Z"
                                method.replaceInstruction(index, formatInvokeStatic(instruction, targetMethod))
                                rewrittenInstructions++
                            } else if (name == "hasCapability" && ref.parameterTypes.size == 1 && ref.parameterTypes[0].toString() == "I") {
                                val targetMethod = "$EXTENSION_CLASS->hasCapability(Landroid/net/NetworkCapabilities;I)Z"
                                method.replaceInstruction(index, formatInvokeStatic(instruction, targetMethod))
                                rewrittenInstructions++
                            }
                        } else if (defClass == "Landroid/net/ConnectivityManager;") {
                            if (name == "getNetworkInfo" && ref.parameterTypes.size == 1 && ref.parameterTypes[0].toString() == "I") {
                                val targetMethod = "$EXTENSION_CLASS->getNetworkInfo(Landroid/net/ConnectivityManager;I)Landroid/net/NetworkInfo;"
                                method.replaceInstruction(index, formatInvokeStatic(instruction, targetMethod))
                                rewrittenInstructions++
                            }
                        }
                    } else if (isProxyClass && (op == Opcode.INVOKE_STATIC || op == Opcode.INVOKE_STATIC_RANGE)) {
                        val ref = (instruction as ReferenceInstruction).reference as MethodReference
                        if (ref.definingClass == "Ljava/lang/System;" && ref.name == "getProperty") {
                            if (ref.parameterTypes.size == 1 && ref.parameterTypes[0].toString() == "Ljava/lang/String;") {
                                val targetMethod = "$EXTENSION_CLASS->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;"
                                method.replaceInstruction(index, formatInvokeStatic(instruction, targetMethod))
                                rewrittenInstructions++
                            } else if (ref.parameterTypes.size == 2 &&
                                ref.parameterTypes[0].toString() == "Ljava/lang/String;" &&
                                ref.parameterTypes[1].toString() == "Ljava/lang/String;"
                            ) {
                                val targetMethod = "$EXTENSION_CLASS->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"
                                method.replaceInstruction(index, formatInvokeStatic(instruction, targetMethod))
                                rewrittenInstructions++
                            }
                        }
                    }
                }
            }
        }

        println("VPN Detection Patch: successfully rewritten $rewrittenInstructions instruction calls.")
    }
}
