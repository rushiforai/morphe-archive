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

private const val APP_UPDATE_INFO = "Lcom/google/android/play/core/appupdate/AppUpdateInfo;"
private const val APP_UPDATE_MANAGER = "Lcom/google/android/play/core/appupdate/AppUpdateManager;"
private const val REVIEW_MANAGER = "Lcom/google/android/play/core/review/ReviewManager;"
private const val UPDATE_NOT_AVAILABLE = 1

private val REVIEW_FLOW_METHODS = setOf("requestReviewFlow", "launchReviewFlow")

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

private val MOVE_RESULT_OPCODES = setOf(
    Opcode.MOVE_RESULT,
    Opcode.MOVE_RESULT_OBJECT,
    Opcode.MOVE_RESULT_WIDE,
)

@Suppress("unused")
val blockInAppUpdateReviewPatch = bytecodePatch(
    name = "Block in-app update & review prompts",
    description = """
        Stops the app from offering Play Core in-app updates and review prompts.
        Update availability is reported as unavailable, update flows and completion
        calls are removed when safe, and review flows are removed when their return
        value is unused.

        Applies to any app using Google Play Core. Best effort: obfuscated Play Core
        integrations or review flows that consume the returned Task are not covered.
    """.trimIndent(),
    default = false,
) {
    val blockUpdatePrompts by booleanOption(
        key = "blockUpdatePrompts",
        default = true,
        title = "Block in-app update prompts",
        description = "Report no available update and remove Play Core update flows.",
    )
    val blockReviewPrompts by booleanOption(
        key = "blockReviewPrompts",
        default = true,
        title = "Block in-app review prompts",
        description = "Remove Play Core review flows when their return value is unused.",
    )

    execute {
        val updateEnabled = blockUpdatePrompts ?: true
        val reviewEnabled = blockReviewPrompts ?: true
        if (!updateEnabled && !reviewEnabled) return@execute

        var availability = 0
        var updateType = 0
        var versionCode = 0
        var updateFlow = 0
        var completeUpdate = 0
        var reviewFlow = 0

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
                        updateEnabled &&
                            reference.definingClass == APP_UPDATE_INFO &&
                            reference.name == "updateAvailability" &&
                            reference.returnType == "I" -> {
                            if (replaceResultWithInt(instructions, index, UPDATE_NOT_AVAILABLE, replacements)) availability++
                        }

                        updateEnabled &&
                            reference.definingClass == APP_UPDATE_INFO &&
                            reference.name == "isUpdateTypeAllowed" &&
                            reference.returnType == "Z" -> {
                            if (replaceResultWithInt(instructions, index, 0, replacements)) updateType++
                        }

                        updateEnabled &&
                            reference.definingClass == APP_UPDATE_INFO &&
                            reference.name == "availableVersionCode" &&
                            reference.returnType == "I" -> {
                            if (replaceResultWithInt(instructions, index, 0, replacements)) versionCode++
                        }

                        updateEnabled &&
                            reference.definingClass == APP_UPDATE_MANAGER &&
                            reference.name == "startUpdateFlowForResult" -> {
                            if (replaceUpdateFlow(instructions, index, replacements)) updateFlow++
                        }

                        updateEnabled &&
                            reference.definingClass == APP_UPDATE_MANAGER &&
                            reference.name == "completeUpdate" &&
                            (reference.returnType == "V" || isResultUnused(instructions, index)) -> {
                            replacements[index] = "nop"
                            completeUpdate++
                        }

                        reviewEnabled &&
                            reference.definingClass == REVIEW_MANAGER &&
                            reference.name in REVIEW_FLOW_METHODS &&
                            isResultUnused(instructions, index) -> {
                            replacements[index] = "nop"
                            reviewFlow++
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
            "Block in-app update & review: availability=$availability updateType=$updateType " +
                "versionCode=$versionCode updateFlow=$updateFlow completeUpdate=$completeUpdate " +
                "reviewFlow=$reviewFlow.",
        )
    }
}

private fun replaceResultWithInt(
    instructions: List<Instruction>,
    invokeIndex: Int,
    value: Int,
    replacements: MutableMap<Int, String>,
): Boolean {
    val moveResult = instructions.getOrNull(invokeIndex + 1) as? OneRegisterInstruction
        ?: return false
    if (moveResult.opcode != Opcode.MOVE_RESULT) return false
    replacements[invokeIndex + 1] = constValue(moveResult.registerA, value)
    return true
}

private fun replaceUpdateFlow(
    instructions: List<Instruction>,
    invokeIndex: Int,
    replacements: MutableMap<Int, String>,
): Boolean {
    val moveResult = instructions.getOrNull(invokeIndex + 1) as? OneRegisterInstruction
    return if (moveResult?.opcode == Opcode.MOVE_RESULT) {
        replacements[invokeIndex] = constValue(moveResult.registerA, 0)
        replacements[invokeIndex + 1] = "nop"
        true
    } else {
        replacements[invokeIndex] = "nop"
        true
    }
}

private fun isResultUnused(instructions: List<Instruction>, invokeIndex: Int): Boolean =
    instructions.getOrNull(invokeIndex + 1)?.opcode !in MOVE_RESULT_OPCODES
