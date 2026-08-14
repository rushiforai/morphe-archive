package com.p1.mobile.putong.data

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private val instructionCache = java.util.WeakHashMap<com.android.tools.smali.dexlib2.iface.Method, List<Instruction>>()

private fun com.android.tools.smali.dexlib2.iface.Method.cachedInstructions(): List<Instruction> =
    instructionCache.getOrPut(this) {
        implementation?.instructions?.toList() ?: emptyList()
    }

private const val RETURN_BOOLEAN_FALSE = """
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    return-object v0
"""

private const val RETURN_INTEGER_0 = """
    const/4 v0, 0x0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    return-object v0
"""

@Suppress("unused")
@JvmField
val searchDiscoveryPatch = bytecodePatch(
    name = "Search Discovery",
    description = "Enhances search and discovery: disables auto-adjust radius, removes invisible radius, enables Gaea distance algorithm, expands liked user and visitor filter ranges",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        classDefByOrNull("Lcom/p1/mobile/putong/data/Settings;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                when {
                    method.name == "autoAdjustSuggestRadius" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Ljava/lang/Boolean;" -> {
                        method.addInstructions(0, RETURN_BOOLEAN_FALSE)
                    }
                    method.name == "getSearchInvisibleRadius" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Ljava/lang/Integer;" -> {
                        method.addInstructions(0, RETURN_INTEGER_0)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/data/GaeaDistanceConfig;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instrs = method.cachedInstructions()
                val writeIndices = instrs.withIndex().filter { (_, instr) ->
                    instr.opcode.name == "iput-byte" &&
                        instr is ReferenceInstruction &&
                        instr.reference is FieldReference &&
                        (instr.reference as FieldReference).name == "gaeaDistanceOpen" &&
                        (instr.reference as FieldReference).definingClass == "Lcom/p1/mobile/putong/core/data/GaeaDistanceConfig;"
                }.map { it.index }

                if (writeIndices.isEmpty()) return@forEach

                writeIndices.reversed().forEach { idx ->
                    val instr = instrs[idx]
                    if (instr is TwoRegisterInstruction) {
                        val objReg = instr.registerB
                        val fieldRef = (instr as ReferenceInstruction).reference as FieldReference
                        val tempReg = if (objReg != 0) "v0" else "v1"
                        method.addInstructions(idx + 1, """
                            const/4 $tempReg, 0x1
                            iput-byte $tempReg, v$objReg, ${fieldRef.definingClass}->${fieldRef.name}:${fieldRef.type}
                        """)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instrs = method.cachedInstructions()
                val distanceWrites = instrs.withIndex().filter { (_, instr) ->
                    instr.opcode.name == "iput" &&
                        instr is ReferenceInstruction &&
                        instr.reference is FieldReference &&
                        (instr.reference as FieldReference).name == "distance" &&
                        (instr.reference as FieldReference).definingClass == "Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;"
                }.map { it.index }

                if (distanceWrites.isEmpty()) return@forEach

                distanceWrites.reversed().forEach { idx ->
                    val instr = instrs[idx]
                    if (instr is TwoRegisterInstruction) {
                        val objReg = instr.registerB
                        val fieldRef = (instr as ReferenceInstruction).reference as FieldReference
                        val tempReg = if (objReg != 0 && objReg != 1) "v0" else "v2"
                        method.addInstructions(idx + 1, """
                            const/16 $tempReg, 0x2710
                            iput $tempReg, v$objReg, ${fieldRef.definingClass}->${fieldRef.name}:${fieldRef.type}
                        """)
                    }
                }
            }
        }

        classDefByOrNull("Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instrs = method.cachedInstructions()
                val distanceWrites = instrs.withIndex().filter { (_, instr) ->
                    instr.opcode.name == "iput" &&
                        instr is ReferenceInstruction &&
                        instr.reference is FieldReference &&
                        (instr.reference as FieldReference).name == "distance" &&
                        (instr.reference as FieldReference).definingClass == "Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;"
                }.map { it.index }

                if (distanceWrites.isEmpty()) return@forEach

                distanceWrites.reversed().forEach { idx ->
                    val instr = instrs[idx]
                    if (instr is TwoRegisterInstruction) {
                        val objReg = instr.registerB
                        val fieldRef = (instr as ReferenceInstruction).reference as FieldReference
                        val tempReg = if (objReg != 0 && objReg != 1) "v0" else "v2"
                        method.addInstructions(idx + 1, """
                            const/16 $tempReg, 0x2710
                            iput $tempReg, v$objReg, ${fieldRef.definingClass}->${fieldRef.name}:${fieldRef.type}
                        """)
                    }
                }
            }
        }
    }
}
