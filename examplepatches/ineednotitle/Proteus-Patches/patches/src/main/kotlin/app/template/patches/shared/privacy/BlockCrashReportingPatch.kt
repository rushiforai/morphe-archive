package app.template.patches.shared.privacy

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.logUniversal
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val CRASH_MARKERS = listOf(
    "io/sentry",
    "com/google/firebase/crashlytics",
    "com/bugsnag",
    "com/datadog",
    "com/newrelic",
    "com/microsoft/appcenter/crashes",
)

private val REPORT_METHODS = setOf(
    "captureException",
    "captureMessage",
    "captureEvent",
    "recordException",
    "logException",
    "notify",
    "addError",
    "addErrorWithStacktrace",
    "noticeError",
    "trackError",
    "log",
)

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_STATIC,
    Opcode.INVOKE_STATIC_RANGE,
)

private val MOVE_RESULT_OPCODES = setOf(
    Opcode.MOVE_RESULT,
    Opcode.MOVE_RESULT_OBJECT,
    Opcode.MOVE_RESULT_WIDE,
)

@Suppress("unused")
val blockCrashReportingPatch = bytecodePatch(
    name = "Block crash-reporting SDKs",
    description = """
        Removes reporting calls to Sentry, Firebase Crashlytics, Bugsnag, Datadog,
        New Relic and AppCenter.

        Applies to any app. Best effort: obfuscated SDKs and calls whose return value
        is consumed are skipped. Crash reports will no longer reach the developer.
    """.trimIndent(),
    default = false,
) {
    val blockCrashReporting by booleanOption(
        key = "blockCrashReporting",
        default = true,
        title = "Block crash reporting",
        description = "Remove crash and exception reporting calls from known SDKs.",
    )

    execute {
        val crashEnabled = blockCrashReporting ?: true
        if (!crashEnabled) return@execute

        var removed = 0
        var skipped = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@forEachIndexed
                    if (!isCrashReporter(reference)) return@forEachIndexed
                    if (reference.name !in REPORT_METHODS) return@forEachIndexed

                    when {
                        reference.returnType == "V" -> {
                            replacements[index] = "nop"
                            removed++
                        }

                        isResultUnused(instructions, index) -> {
                            replacements[index] = "nop"
                            removed++
                        }

                        else -> skipped++
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) -> method.replaceInstruction(index, smali) }
                }
            }
        }

        logUniversal("Block crash reporting: removed=$removed skipped=$skipped.")
    }
}

private fun isCrashReporter(reference: MethodReference): Boolean =
    CRASH_MARKERS.any { reference.definingClass.contains(it) }

private fun isResultUnused(instructions: List<Instruction>, invokeIndex: Int): Boolean =
    instructions.getOrNull(invokeIndex + 1)?.opcode !in MOVE_RESULT_OPCODES
