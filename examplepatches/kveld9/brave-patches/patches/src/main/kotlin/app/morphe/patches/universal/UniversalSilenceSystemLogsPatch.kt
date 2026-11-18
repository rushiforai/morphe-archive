package app.morphe.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TAG = "[Silence System Logs]"
private const val LOG_CLASS = "Landroid/util/Log;"

private val DEBUG_VERBOSE_LEVELS = setOf("d", "v")
private val NO_ERROR_LEVELS = setOf("d", "v", "i", "w")
private val ALL_LEVELS = setOf("d", "v", "i", "w", "e", "println", "wtf")

@Suppress("unused")
val universalSilenceSystemLogsPatch = bytecodePatch(
    name = "Silence System Logs",
    description = "Stops apps from writing debug and diagnostic messages to the system log.",
    default = false,
) {
    val level by stringOption(
        key = "logLevel",
        title = "Log level",
        description = "Which log levels to silence.",
        default = "all",
        values = mapOf(
            "All" to "all",
            "Debug and verbose only" to "debug_verbose",
            "All except errors" to "no_errors",
        ),
        required = false,
    )

    execute {
        val selectedLevel = level?.lowercase() ?: "all"
        val (targetMethods, levelDescription) = when (selectedLevel) {
            "debug", "debug_verbose", "debug and verbose only" -> DEBUG_VERBOSE_LEVELS to "Debug and verbose only"
            "no_errors", "noerror", "all except errors" -> NO_ERROR_LEVELS to "All except errors"
            else -> ALL_LEVELS to "All"
        }

        var patched = 0
        var touchedClasses = 0

        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/kveld9/morphe/extension") ||
                classDef.type.startsWith("Lapp/morphe/extension")
            ) {
                return@classDefForEach
            }

            var mutableMethods: List<MutableMethod>? = null
            var classModified = false

            for ((methodIndex, method) in classDef.methods.withIndex()) {
                val mutations = scanMethodMutations(method, targetMethods)
                if (mutations.isNotEmpty()) {
                    val methods = mutableMethods ?: mutableClassDefBy(classDef).methods.toList().also {
                        mutableMethods = it
                    }
                    applyMutations(methods[methodIndex], mutations)
                    patched += mutations.size
                    classModified = true
                }
            }

            if (classModified) {
                touchedClasses++
            }
        }

        if (patched == 0) {
            println("$TAG Target APK does not contain targeted log calls (0 call sites found).")
            return@execute
        }

        println(
            "$TAG Silenced $patched log call(s) across $touchedClasses class(es) (level: $levelDescription)."
        )
    }
}

private data class LogMutation(
    val invokeIndex: Int,
    val invokeReplacement: String,
    val moveResultIndex: Int? = null,
)

private fun scanMethodMutations(
    method: Method,
    targetNames: Set<String>,
): List<LogMutation> {
    val instructions = method.instructionsOrNull?.toList() ?: return emptyList()
    val mutations = mutableListOf<LogMutation>()

    var i = 0
    while (i < instructions.size) {
        val inst = instructions[i]
        val opcode = inst.opcode
        if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) {
            i++
            continue
        }

        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        if (ref == null || ref.name !in targetNames || ref.definingClass != LOG_CLASS) {
            i++
            continue
        }

        val next = instructions.getOrNull(i + 1)
        if (next != null && next.opcode == Opcode.MOVE_RESULT) {
            val reg = (next as OneRegisterInstruction).registerA
            val constInstr = when {
                reg <= 0xf -> "const/4 v$reg, 0x0"
                reg <= 0xff -> "const/16 v$reg, 0x0"
                else -> "const v$reg, 0x0"
            }
            mutations.add(LogMutation(invokeIndex = i, invokeReplacement = constInstr, moveResultIndex = i + 1))
            i += 2
        } else if (next != null && next.opcode == Opcode.MOVE_RESULT_WIDE) {
            val reg = (next as OneRegisterInstruction).registerA
            mutations.add(LogMutation(invokeIndex = i, invokeReplacement = "const-wide/16 v$reg, 0x0", moveResultIndex = i + 1))
            i += 2
        } else if (next != null && next.opcode == Opcode.MOVE_RESULT_OBJECT) {
            val reg = (next as OneRegisterInstruction).registerA
            val constInstr = when {
                reg <= 0xf -> "const/4 v$reg, 0x0"
                reg <= 0xff -> "const/16 v$reg, 0x0"
                else -> "const v$reg, 0x0"
            }
            mutations.add(LogMutation(invokeIndex = i, invokeReplacement = constInstr, moveResultIndex = i + 1))
            i += 2
        } else {
            mutations.add(LogMutation(invokeIndex = i, invokeReplacement = "nop"))
            i += 1
        }
    }

    return mutations
}

private fun applyMutations(
    method: MutableMethod,
    mutations: List<LogMutation>,
) {
    for (mutation in mutations.reversed()) {
        if (mutation.moveResultIndex != null) {
            method.replaceInstruction(mutation.moveResultIndex, "nop")
        }
        method.replaceInstruction(mutation.invokeIndex, mutation.invokeReplacement)
    }
}
