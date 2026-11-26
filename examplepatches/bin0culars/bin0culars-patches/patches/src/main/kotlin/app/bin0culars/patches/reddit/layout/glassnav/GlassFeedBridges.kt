package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val LAZY_LIST_STATE_TYPE = "Landroidx/compose/foundation/lazy/b;"
private const val POPULAR_FEED_SCREEN_CLASS = "Lcom/reddit/feeds/popular/impl/ui/PopularFeedScreen;"
private const val TRACKER_CLASS = "Lcom/reddit/feeds/ui/composables/b;"
private const val TOP_BAR_STATE_EXTENSION_CLASS =
    "Lapp/bin0culars/extension/reddit/GlassTopBarState;"

internal data class ScrolledCheckSite(
    val lambdaClass: String,
    val literal: Int,
    val initRef: MethodReference,
    val stateFirst: Boolean,
)

private fun findVisibleFieldBeforeTracker(
    instructions: List<Instruction>,
    trackerIndex: Int,
    feedStateType: String,
): FieldReference? =
    (trackerIndex - 1 downTo 0)
        .takeWhile { !isControlFlowBoundary(instructions[it].opcode) }
        .firstNotNullOfOrNull { idx ->
            val inst = instructions[idx]
            val ref = if (inst.opcode == Opcode.IGET_BOOLEAN) {
                (inst as? ReferenceInstruction)?.reference as? FieldReference
            } else {
                null
            }
            ref?.takeIf { it.definingClass == feedStateType && it.type == "Z" }
        }

internal fun findFeedVisibleField(feedStateType: String): FieldReference? {
    val screenClass = classDefByOrNull(POPULAR_FEED_SCREEN_CLASS) ?: return null
    return screenClass.methods.firstNotNullOfOrNull { method ->
        val instructions = method.implementation?.instructions?.toList()
        instructions?.indices?.firstNotNullOfOrNull { trackerIdx ->
            val inst = instructions[trackerIdx]
            val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
            val ref = if (isStatic) (inst as? ReferenceInstruction)?.reference as? MethodReference else null
            val isTracker = ref != null && ref.definingClass == TRACKER_CLASS && ref.name == "a"
            if (isTracker) findVisibleFieldBeforeTracker(instructions, trackerIdx, feedStateType) else null
        }
    }
}

private fun hasNewInstanceBefore(
    instructions: List<Instruction>,
    idx: Int,
    reg: Int,
    type: String,
): Boolean = (idx - 1 downTo 0).any { prev ->
    val inst = instructions[prev]
    val instType = ((inst as? ReferenceInstruction)?.reference as? TypeReference)?.type
    inst.opcode == Opcode.NEW_INSTANCE &&
        inst.registersUsed.firstOrNull() == reg &&
        instType == type
}

private fun literalWrittenBefore(
    instructions: List<Instruction>,
    idx: Int,
    reg: Int,
): Int? = (idx - 1 downTo 0).firstNotNullOfOrNull { prev ->
    val inst = instructions[prev]
    val writesReg = inst is OneRegisterInstruction && inst.opcode.setsRegister() && inst.registerA == reg
    if (writesReg && inst is NarrowLiteralInstruction) inst.narrowLiteral else null
}

internal fun findScrolledCheckInMethod(method: Method): ScrolledCheckSite? {
    val instructions = method.implementation?.instructions?.toList() ?: return null
    return instructions.indices.firstNotNullOfOrNull { idx ->
        val callInst = instructions[idx]
        val isDirect = callInst.opcode == Opcode.INVOKE_DIRECT || callInst.opcode == Opcode.INVOKE_DIRECT_RANGE
        val ref = if (isDirect) (callInst as? ReferenceInstruction)?.reference as? MethodReference else null
        val p = ref?.parameterTypes?.map { it.toString() }
        val stateFirst = p == listOf(LAZY_LIST_STATE_TYPE, "I")
        val validSig = ref != null && ref.name == "<init>" && ref.returnType == "V"
        val validParams = stateFirst || p == listOf("I", LAZY_LIST_STATE_TYPE)
        val initRef = ref.takeIf { validSig && validParams }
        val regs = callInst.registersUsed
        if (initRef != null && regs.size == 3 && hasNewInstanceBefore(instructions, idx, regs[0], initRef.definingClass)) {
            val intReg = if (stateFirst) regs[2] else regs[1]
            literalWrittenBefore(instructions, idx, intReg)?.let { literal ->
                ScrolledCheckSite(initRef.definingClass, literal, initRef, stateFirst)
            }
        } else {
            null
        }
    }
}

internal fun fillFeedBridges(
    feedStateType: String,
    visibleField: FieldReference,
    scrolledSite: ScrolledCheckSite,
) {
    fillBridge(
        "feedVisible",
        """
            check-cast p0, $feedStateType
            iget-boolean p1, p0, ${visibleField.toSmali()}
            return p1
        """,
        extensionClass = TOP_BAR_STATE_EXTENSION_CLASS,
    )
    val constOp = if (scrolledSite.literal in -8..7) "const/4" else "const"
    val initArgs = if (scrolledSite.stateFirst) "p2, p0, p1" else "p2, p1, p0"
    fillBridge(
        "scrolledCheck",
        """
            check-cast p0, $LAZY_LIST_STATE_TYPE
            new-instance p2, ${scrolledSite.lambdaClass}
            $constOp p1, ${scrolledSite.literal}
            invoke-direct { $initArgs }, ${scrolledSite.initRef.toSmali()}
            return-object p2
        """,
        extensionClass = TOP_BAR_STATE_EXTENSION_CLASS,
    )
}
