package app.morphe.patches.all.cleanup

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.deleteResource
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun Instruction.isLogOrTrace(): Boolean {
    val m = getReference<MethodReference>() ?: return false
    return (
        m.definingClass == "Landroid/util/Log;" &&
            m.returnType == "I" &&
            m.name in setOf("d", "v", "i", "w", "e", "wtf", "println")
        ) ||
        (m.definingClass == "Ljava/lang/Throwable;" && m.name == "printStackTrace" && m.returnType == "V")
}

@Suppress("unused")
val universalCleanupPatch = patch(
    name = "Universal cleanup",
    description = "Removes junk metadata files and (optionally) strips debug logging calls.",
    default = false,
) {
    val stripLogging by booleanOption(
        key = "stripLogging",
        default = true,
        title = "Strip debug logging",
        description = "Remove android.util.Log and Throwable.printStackTrace calls.",
    )
    val stripKotlinMetadata by booleanOption(
        key = "stripKotlinMetadata",
        default = true,
        title = "Remove Kotlin module metadata",
        description = "Delete META-INF/*.kotlin_module (safe unless the app uses kotlin-reflect).",
    )

    execute {
        listApkEntries().filter { path ->
            (path.startsWith("META-INF/") && path.endsWith(".version")) ||
                path == "DebugProbesKt.bin" ||
                path == "kotlin-tooling-metadata.json" ||
                path == "META-INF/DEPENDENCIES" ||
                (stripKotlinMetadata == true && path.startsWith("META-INF/") && path.endsWith(".kotlin_module"))
        }.forEach { deleteResource(it) }

        if (stripLogging == true) {
            classDefForEach { classDef ->
                val mc by lazy { mutableClassDefBy(classDef) }
                classDef.methods.forEach { method ->
                    val impl = method.implementation ?: return@forEach
                    if (impl.instructions.none { it.isLogOrTrace() }) return@forEach
                    val mm = mc.findMutableMethodOf(method)
                    val idxs = mm.instructions.withIndex().filter { it.value.isLogOrTrace() }.map { it.index }
                    for (i in idxs.reversed()) {
                        val m = mm.getInstruction(i).getReference<MethodReference>()
                        if (m?.returnType == "I") {
                            val ni = i + 1
                            if (ni < mm.instructions.size && mm.getInstruction(ni).opcode == Opcode.MOVE_RESULT) {
                                val reg = (mm.getInstruction(ni) as OneRegisterInstruction).registerA
                                mm.replaceInstruction(ni, "const/4 v$reg, 0x0")
                            }
                        }
                        mm.removeInstruction(i)
                    }
                }
            }
        }
    }
}
