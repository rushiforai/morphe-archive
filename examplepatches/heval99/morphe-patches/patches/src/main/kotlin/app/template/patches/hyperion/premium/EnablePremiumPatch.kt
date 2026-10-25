package app.template.patches.hyperion.premium

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_HYPERION
import app.template.patches.shared.addInstructionChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Hyperion keeps Premium in one static MutableStateFlow<Boolean> that every reader collects
 * (Settings, the premium feature collectors, App's companion check). Three writers can set it
 * false: the <clinit> seed, App.onCreate (re-signs the stored token on every cold start) and
 * the holder's reset method (billing refresh and Launcher Key failures). The patch makes each
 * of them true or inert. The token signer itself, the shared StateFlow class, Firebase and the
 * Launcher Key AIDL are left alone.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks premium features."
) {
    compatibleWith(COMPATIBILITY_HYPERION)

    execute {
        val holder = PremiumTokenSignerFingerprint.classDef
        val clinit = holder.methods.firstOrNull { it.name == "<clinit>" }
            ?: throw PatchException("${holder.type} has no <clinit>")

        // The premium flow field: <clinit> loads Boolean.FALSE, passes it to the static
        // MutableStateFlow(Object) factory and stores the result in a field of its own class.
        val clinitInstructions = clinit.instructions.toList()
        val seedIndex = clinitInstructions.indexOfFirst { it.isBooleanConstant("FALSE") }
        val factory = clinitInstructions.getOrNull(seedIndex + 1)
        val factoryRef = (factory as? ReferenceInstruction)?.reference as? MethodReference
        val store = clinitInstructions.getOrNull(seedIndex + 3)
        val flowField = (store as? ReferenceInstruction)?.reference as? FieldReference
        if (seedIndex < 0 || factory?.opcode != Opcode.INVOKE_STATIC || factoryRef == null ||
            factoryRef.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/Object;") ||
            clinitInstructions[seedIndex + 2].opcode != Opcode.MOVE_RESULT_OBJECT ||
            store?.opcode != Opcode.SPUT_OBJECT || flowField == null ||
            flowField.definingClass != holder.type || flowField.type != factoryRef.returnType
        ) {
            throw PatchException("${holder.type}.<clinit> does not seed a flow from Boolean.FALSE")
        }

        // 1. App.onCreate writes Boolean.valueOf(<token verified>) into the flow. Load 1 into
        // that boolean just before valueOf, so the write is always true. The same register then
        // feeds the "not premium" branch right after, which is skipped as for a real buyer.
        val onCreate = AppOnCreateFingerprint.method
        val onCreateInstructions = onCreate.instructions.toList()
        val valueOfIndices = onCreate.flowWrites(flowField).mapNotNull { (_, valueSource) ->
            val box = onCreateInstructions.getOrNull(valueSource - 1)
            val boxRef = (box as? ReferenceInstruction)?.reference as? MethodReference
            val boxesBoolean = onCreateInstructions[valueSource].opcode == Opcode.MOVE_RESULT_OBJECT &&
                box?.opcode == Opcode.INVOKE_STATIC && boxRef?.definingClass == BOOLEAN &&
                boxRef.name == "valueOf" && boxRef.parameterTypes.map(CharSequence::toString) == listOf("Z")
            if (boxesBoolean) valueSource - 1 else null
        }.distinct()
        if (valueOfIndices.isEmpty()) {
            throw PatchException("App.onCreate writes no Boolean.valueOf(Z) into ${flowField.name}")
        }
        // Descending, so an insert never shifts an index still to be visited.
        valueOfIndices.sortedDescending().forEach { index ->
            val valueOf = onCreateInstructions[index]
            // An inserted instruction is skipped by branches that target valueOf itself.
            if ((valueOf as BuilderInstruction).location.labels.isNotEmpty()) {
                throw PatchException("App.onCreate: Boolean.valueOf is a branch target; patch would be bypassed")
            }
            // invoke-static {vX} has a 4-bit register, so const/4 can always address it.
            val register = (valueOf as FiveRegisterInstruction).registerC
            onCreate.addInstructionChecked(index, "const/4 v$register, 0x1")
        }

        // 2. The reset (clears the stored token, pushes Boolean.FALSE) returns at once. It is
        // the holder's static no-arg void, other than <clinit>, that writes FALSE into the flow.
        val resets = holder.methods.filter { method ->
            method.name != "<clinit>" && method.returnType == "V" && method.parameterTypes.isEmpty() &&
                AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null &&
                method.flowWrites(flowField).any { (_, valueSource) ->
                    method.implementation!!.instructions.elementAt(valueSource).isBooleanConstant("FALSE")
                }
        }
        if (resets.isEmpty()) throw PatchException("${holder.type} has no reset writing FALSE into ${flowField.name}")
        resets.forEach { it.returnEarly() }

        // 3. The flow starts out true, so nothing reads false before App.onCreate runs.
        val seedRegister = (clinitInstructions[seedIndex] as OneRegisterInstruction).registerA
        clinit.replaceInstruction(seedIndex, "sget-object v$seedRegister, $BOOLEAN->TRUE:$BOOLEAN")
    }
}

/**
 * Every write into [flow]: a call on the flow's own type with the (Object, Object)Z shape of
 * StateFlowImpl's compare-and-set, whose receiver was last loaded from [flow]. Returns the call
 * index and the index of the instruction that last set the value (third) register. Straight-line
 * lookback is enough here: both writers load the flow and the value right before the call.
 */
private fun Method.flowWrites(flow: FieldReference): List<Pair<Int, Int>> {
    val instructions = implementation?.instructions?.toList() ?: return emptyList()
    return instructions.withIndex().mapNotNull { (index, instruction) ->
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) {
            return@mapNotNull null
        }
        val call = (instruction as ReferenceInstruction).reference as MethodReference
        if (call.definingClass != flow.type || call.returnType != "Z" ||
            call.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        ) return@mapNotNull null
        val (receiver, value) = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerC to instruction.registerE
            is RegisterRangeInstruction -> instruction.startRegister to instruction.startRegister + 2
            else -> return@mapNotNull null
        }
        val receiverSource = instructions.lastWriterBefore(index, receiver) ?: return@mapNotNull null
        val receiverField = (instructions[receiverSource] as? ReferenceInstruction)?.reference as? FieldReference
        if (instructions[receiverSource].opcode != Opcode.SGET_OBJECT || receiverField == null ||
            receiverField.definingClass != flow.definingClass || receiverField.name != flow.name ||
            receiverField.type != flow.type
        ) return@mapNotNull null
        val valueSource = instructions.lastWriterBefore(index, value) ?: return@mapNotNull null
        index to valueSource
    }
}

private fun List<Instruction>.lastWriterBefore(index: Int, register: Int): Int? =
    (index - 1 downTo 0).firstOrNull { i ->
        val instruction = this[i]
        instruction.opcode.setsRegister() && instruction is OneRegisterInstruction &&
            (instruction.registerA == register ||
                (instruction.opcode.setsWideRegister() && instruction.registerA + 1 == register))
    }
