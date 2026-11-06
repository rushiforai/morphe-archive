package app.template.patches.shared.privacy
import app.template.patches.shared.logUniversal

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.constValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Universal heuristic "Block analytics SDKs" patch.
// NOPs void event-reporting calls whose defining class matches a known tracker
// package marker, and flips literal setAnalyticsCollectionEnabled(true) to
// false. Heuristic; default = false.

private val TRACKER_MARKERS = listOf(
    "com/google/firebase/analytics",
    "com/appsflyer",
    "com/adjust/sdk",
    "com/facebook/appevents",
    "com/segment",
    "com/amplitude",
    "com/mixpanel",
    "com/localytics",
    "com/countly",
    "com/urbanairship",
)

private val EVENT_METHODS = setOf("logEvent", "trackEvent", "track", "send", "sendEvent", "report")

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_STATIC,
    Opcode.INVOKE_STATIC_RANGE,
)

@Suppress("unused")
val blockAnalyticsSdksPatch = bytecodePatch(
    name = "Block analytics & tracking SDKs",
    description = """
        Disables common analytics/tracking SDKs (Firebase Analytics, AppsFlyer, Adjust,
        Facebook AppEvents, Segment, Amplitude, Mixpanel and similar) by removing their
        event-reporting calls.

        Heuristic: obfuscated or reflection-based reporting is not covered. Applies to
        any app.
    """.trimIndent(),
    default = false,
) {
    execute {
        var eventsNop = 0
        var collectionOff = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed

                    val isTrackerCall = TRACKER_MARKERS.any { reference.definingClass.contains(it) }

                    when {
                        isTrackerCall && reference.name in EVENT_METHODS && reference.returnType == "V" -> {
                            replacements[index] = "nop"
                            eventsNop++
                        }

                        isTrackerCall &&
                            reference.name == "setAnalyticsCollectionEnabled" &&
                            reference.returnType == "V" -> {
                            val valueRegister = argumentRegister(instruction, 1) ?: return@forEachIndexed
                            val literal = literalForRegister(instructions, index, valueRegister)
                                ?: return@forEachIndexed
                            if (literal.second == 1) {
                                replacements[literal.first] = constValue(valueRegister, 0)
                                collectionOff++
                            }
                        }
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (i, smali) -> method.replaceInstruction(i, smali) }
                }
            }
        }

        logUniversal("Block analytics SDKs: $eventsNop event call(s) NOPed, $collectionOff collection flag(s) off.")
    }
}

private fun argumentRegister(instruction: Instruction, argumentIndex: Int): Int? = when (instruction) {
    is FiveRegisterInstruction -> when (argumentIndex) {
        0 -> instruction.registerC
        1 -> instruction.registerD
        2 -> instruction.registerE
        else -> null
    }

    is RegisterRangeInstruction ->
        (instruction.startRegister + argumentIndex)
            .takeIf { argumentIndex < instruction.registerCount }

    else -> null
}

private fun literalForRegister(
    instructions: List<Instruction>,
    before: Int,
    register: Int,
): Pair<Int, Int>? {
    var inspected = 0
    for (index in before - 1 downTo 0) {
        val instruction = instructions[index]
        if (instruction is OneRegisterInstruction && instruction.registerA == register) {
            val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral ?: return null
            return index to literal
        }
        if (instruction.opcode == Opcode.MOVE_RESULT ||
            instruction.opcode == Opcode.MOVE_RESULT_OBJECT ||
            instruction.opcode == Opcode.MOVE_RESULT_WIDE
        ) return null
        if (++inspected >= 8) return null
    }
    return null
}
