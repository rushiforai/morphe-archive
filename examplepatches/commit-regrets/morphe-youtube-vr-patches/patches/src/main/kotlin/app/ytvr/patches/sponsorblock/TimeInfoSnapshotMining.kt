package app.ytvr.patches.sponsorblock

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Mines the time-info snapshot's backend field and its eight accessor calls out of the method
 * the [timeInfoSnapshotFingerprint] matched.
 *
 * The eight accessors are collected from the window that ends at the TimeInfo factory call --
 * the fingerprint already proved the method invokes that exact prototype -- walking backwards
 * over the accessor/move-result pairs and taking the one `iget-object` that feeds the first
 * accessor. A whole-method scan cannot do this since 1.91.10: its snapshot grew a cache (a
 * backend lookup, two `ConcurrentMap.put`s, a comparison read), whose interface calls and
 * leading `iget-object` would be swept in with the real ones. On 1.88-1.90, whose snapshot is
 * exactly this window, the walk yields the same eight calls and the same field the old scan
 * found (asserted by [TimeInfoSnapshotMiningTest] on both shapes).
 *
 * Failure is loud by construction: anything inside the window that is not a move-result, an
 * accessor slot still being filled, or the terminating field read stops the walk short of eight
 * accessors and [mine] returns null -- the patch turns that into a PatchException rather than
 * mining a wrong accessor. One residual quiet path is closed by the field-type check: if a
 * future build parks an unrelated `iget-object` directly before the factory, the walk would
 * otherwise take it as the backend field; requiring its type to be the accessors' own interface
 * turns that into a loud null too.
 *
 * The walk anchors on the FIRST factory-prototype invoke (`indexOfFirst`), so a method invoking
 * the prototype twice is mined from the first call's window; wrong-window shapes there still
 * fail loudly by the rules above.
 */
internal object TimeInfoSnapshotMining {

    /** The exact parameter prototype of the TimeInfo factory the window ends at. */
    val FACTORY_PARAMETERS =
        listOf("J", "J", "J", "J", "I", "J", "J", "Ljava/lang/String;")

    /** The accessor count the TimeInfo factory consumes (position, utc, duration, buffered, live, cpn...). */
    private const val ACCESSOR_COUNT = 8

    /** The backend field read plus the eight accessors, in factory-argument order (#0 = position ms). */
    data class Mined(val backendField: FieldReference, val accessors: List<MethodReference>)

    /** Null when the method does not carry the expected window; never a wrong answer. */
    fun mine(instructions: List<Instruction>): Mined? {
        val factoryIndex = factoryIndexOf(instructions) ?: return null
        return walkWindowBack(instructions, factoryIndex - 1)
            ?.let { (field, accessors) -> minedOrNull(field, accessors) }
    }

    private fun factoryIndexOf(instructions: List<Instruction>): Int? {
        val index = instructions.indexOfFirst { instruction -> isFactoryCall(instruction) }
        return index.takeIf { it >= 0 }
    }

    /**
     * True when [instruction] is the static TimeInfo factory call the window ends at. The
     * snapshot fingerprint uses this same predicate rather than its own copy of the prototype,
     * so the shape a build is matched on and the call the walk anchors at cannot drift apart.
     */
    fun isFactoryCall(instruction: Instruction): Boolean {
        val invokesFactory = instruction.opcode == Opcode.INVOKE_STATIC ||
            instruction.opcode == Opcode.INVOKE_STATIC_RANGE
        return invokesFactory &&
            (instruction as? ReferenceInstruction)?.reference.let { reference ->
                reference is MethodReference &&
                    reference.parameterTypes.map { it.toString() } == FACTORY_PARAMETERS &&
                    reference.returnType.startsWith("L")
            }
    }

    /**
     * The backward walk. Anything inside the window that is not a move-result, an accessor
     * slot still being filled, or the terminating field read ends the walk early -- the caller
     * sees a short accessor list and reports the shape as broken rather than mining noise.
     *
     * Both invoke encodings are accepted ([isAccessorCall]): a single-argument interface call is
     * normally 35c, but its receiver sits above v15 in a register-heavy method, where dex forces
     * the 3rc form. Reading only 35c would turn that into a loud-but-wrong "shape changed".
     */
    private fun walkWindowBack(
        instructions: List<Instruction>,
        startIndex: Int,
    ): Pair<FieldReference, List<MethodReference>>? {
        val accessors = mutableListOf<MethodReference>()
        var backendField: FieldReference? = null
        var index = startIndex
        while (index >= 0 && backendField == null) {
            val instruction = instructions[index]
            when {
                isMoveResult(instruction.opcode) -> Unit

                isAccessorCall(instruction.opcode) && accessors.size < ACCESSOR_COUNT ->
                    accessors += referenceOf(instruction) as MethodReference

                instruction.opcode == Opcode.IGET_OBJECT && accessors.size == ACCESSOR_COUNT ->
                    backendField = referenceOf(instruction) as FieldReference

                else -> return null
            }
            index -= 1
        }
        // The walk collected the accessors backwards; restore factory-argument order (#0 = position).
        accessors.reverse()
        return backendField?.let { it to accessors }
    }

    /** The bridges read the field and call the accessors on its value, so the types must agree. */
    private fun minedOrNull(
        backendField: FieldReference,
        accessors: List<MethodReference>,
    ): Mined? = if (accessors.size == ACCESSOR_COUNT &&
        accessors[0].definingClass == backendField.type
    ) {
        Mined(backendField, accessors)
    } else {
        null
    }

    private fun isMoveResult(opcode: Opcode): Boolean = opcode == Opcode.MOVE_RESULT ||
        opcode == Opcode.MOVE_RESULT_WIDE ||
        opcode == Opcode.MOVE_RESULT_OBJECT

    /** Both encodings of a one-argument interface call: 35c, and 3rc when the receiver is above v15. */
    private fun isAccessorCall(opcode: Opcode): Boolean = opcode == Opcode.INVOKE_INTERFACE ||
        opcode == Opcode.INVOKE_INTERFACE_RANGE

    private fun referenceOf(instruction: Instruction) = (instruction as ReferenceInstruction).reference
}
