package patches.flitsmeister

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.instruction.*
import patches.shared.uniqueMatch

internal val flitsmeister = Compatibility(
    name = "Flitsmeister", packageName = "nl.flitsmeister", apkFileType = ApkFileType.APKS,
    signatures = setOf("ba4fdde5ed7d1082f6ba1af87df2ca39c81b094af20d36ff55b583aa3e3353e6"),
    targets = listOf(AppTarget(version = "14.17", versionCode = 1287, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(flitsmeister)
internal const val ELIGIBILITY = "Lmorphe/flitsmeister/FeatureEligibility;"

context(context: BytecodePatchContext)
internal fun exact(cls: String, name: String, result: String = "V", vararg params: String) =
    Fingerprint(definingClass = cls, name = name, returnType = result, parameters = params.toList()).uniqueMatch()

/** Fixed instruction positions are validated against opcode, registers, references
 * and branch destination. Source line numbers and package-wide searches are never
 * mutation anchors. Every method is resolved eagerly before its cohort changes. */
internal data class Guard(val index: Int, val opcode: Opcode, val registers: List<Int> = emptyList(), val reference: String? = null, val target: Int? = null)
internal data class Edit(val index: Int, val kind: String, val code: String = "", val target: Int = -1)
internal data class MethodPlan(val descriptor: String, val registerCount: Int, val instructionCount: Int, val guards: List<Guard>, val edits: List<Edit>, val referenceCounts: Map<String, Int> = emptyMap())

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

context(context: BytecodePatchContext)
internal fun applyPlans(plans: List<MethodPlan>) {
    val resolved = plans.map { plan ->
        val cls = plan.descriptor.substringBefore("->")
        val signature = plan.descriptor.substringAfter("->")
        val parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]").findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList()
        val method = exact(cls, signature.substringBefore('('), signature.substringAfter(')'), *parameters.toTypedArray()).method
        val implementation = method.implementation ?: error("Missing implementation: ${plan.descriptor}")
        check(implementation.registerCount == plan.registerCount && method.instructions.size == plan.instructionCount) { "Changed Flitsmeister layout: ${plan.descriptor}" }
        val addresses = method.instructions.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        plan.referenceCounts.forEach { (reference, expected) ->
            val actual = method.instructions.count { (it as? ReferenceInstruction)?.reference?.toString() == reference }
            check(actual == expected) { "Changed Flitsmeister reference cardinality ${plan.descriptor}: $reference expected=$expected actual=$actual" }
        }
        plan.guards.forEach { guard ->
            val instruction = method.getInstruction(guard.index)
            check(instruction.opcode == guard.opcode && instruction.registers() == guard.registers &&
                (guard.reference == null || (instruction as? ReferenceInstruction)?.reference?.toString() == guard.reference)) { "Changed Flitsmeister anchor ${plan.descriptor} @${guard.index}: expected ${guard.opcode}/${guard.registers}, actual ${instruction.opcode}/${instruction.registers()}" }
            guard.target?.let { target ->
                check(instruction is OffsetInstruction && addresses[target] == addresses[guard.index] + instruction.codeOffset) { "Changed Flitsmeister continuation ${plan.descriptor}" }
            }
        }
        plan to method
    }
    resolved.forEach { (plan, method) ->
        // Capture external destination labels before any insertion changes offsets.
        val destinations = plan.edits.filter { it.target >= 0 }.associateWith { method.implementation!!.newLabelForIndex(it.target) }
        plan.edits.sortedByDescending { it.index }.forEach { edit ->
            when (edit.kind) {
                "insert" -> method.addInstructions(edit.index, edit.code)
                "replace" -> method.replaceInstruction(edit.index, edit.code)
                "goto" -> method.replaceInstruction(edit.index, BuilderInstruction30t(Opcode.GOTO_32, destinations.getValue(edit)))
                "labelled" -> method.addInstructionsWithLabels(edit.index, edit.code, ExternalLabel("morphe_join", destinations.getValue(edit).location.instruction!!))
                "labelled_at_join" -> {
                    // Incoming enum-arm labels must execute the badge filter.
                    // Include its real factory instruction inside the labelled
                    // block; an end-only local label cannot name old code.
                    method.replaceInstruction(edit.index, edit.code.substringBefore('\n'))
                    method.addInstructionsWithLabels(edit.index + 1, edit.code.substringAfter('\n'), ExternalLabel("morphe_join", destinations.getValue(edit).location.instruction!!))
                }
                "at_join" -> {
                    // Replacing first retains incoming labels on the new scalar,
                    // so explicit/default/null branches all execute the override.
                    method.replaceInstruction(edit.index, edit.code.substringBefore('\n'))
                    method.addInstructionsWithLabels(edit.index + 1, edit.code.substringAfter('\n'), ExternalLabel("morphe_join", destinations.getValue(edit).location.instruction!!))
                }
                "body" -> {
                    // Rebuild only closed completion/rendering contracts. kie.a
                    // has an AnnotatedString push/pop catchall; its entire
                    // promotion body and handler disappear together. Retain all
                    // method flags/parameters/annotations and register layout.
                    val replacement = MutableMethod(ImmutableMethod(method.definingClass, method.name,
                        method.parameters, method.returnType, method.accessFlags, method.annotations,
                        method.hiddenApiRestrictions, ImmutableMethodImplementation(plan.registerCount,
                            emptyList(), emptyList(), emptyList()))).apply { addInstructions(0, edit.code) }
                    val cls = context.mutableClassDefBy(method.definingClass)
                    check(cls.methods.remove(method)) { "Missing presentation leaf during replacement" }
                    check(cls.methods.add(replacement)) { "Duplicate presentation leaf during replacement" }
                }
                else -> error("Unknown bounded edit ${edit.kind}")
            }
        }
    }
}
