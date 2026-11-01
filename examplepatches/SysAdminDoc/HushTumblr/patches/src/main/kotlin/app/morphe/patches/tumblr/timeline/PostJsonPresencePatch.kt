/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.freeLocalsAt
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PATCH = "Post JSON presence"
private const val ADAPTER = "Lcom/tumblr/rumblr/model/post/PostJsonAdapter;"
internal const val POST_JSON_SET = "$POST->hushSetJsonPresence(II)V"
internal const val POST_PAID_KNOWN = "$POST->hushPaidContextKnown:Z"
internal const val POST_TRAIL_PRESENT = "$POST->hushRootTrailPresent:Z"

internal class PostJsonPresencePlan(val reader: MutableMethod, val scratch: List<Int>)

/** One parser hook shared by paid-placement and canonical-root readers. Unparsed fields stay unknown. */
internal val postJsonPresencePatch = bytecodePatch {
    dependsOn(tumblrExtensionPatch)
    execute { applyPostJsonPresence(resolvePostJsonPresence()) }
}

internal fun BytecodePatchContext.resolvePostJsonPresence(): PostJsonPresencePlan {
    val model = classDefByOrNull(POST)
    requireShape(PATCH, model != null && model.fields.none { it.name in setOf("hushRootTrailPresent", "hushPaidContextKnown") }
        && model.methods.none { it.name == "hushSetJsonPresence" }, "the shared presence bridge already exists or Post is missing")
    val reader = classDefByOrNull(ADAPTER)?.methods?.singleOrNull {
        it.name == "fromJson" && it.hasShape(listOf("Le9b;"), "Ljava/lang/Object;") && !it.isStatic()
    }
    requireShape(PATCH, reader?.implementation?.registerCount == 178, "the erased Post JSON reader changed")
    val method = reader!!
    val body = method.instructionList()
    fun one(at: Int, opcode: Opcode, register: Int) = body.getOrNull(at)?.let {
        it.opcode == opcode && (it as? OneRegisterInstruction)?.registerA == register
    } == true
    fun move(at: Int, opcode: Opcode, destination: Int, source: Int) = body.getOrNull(at)?.let {
        it.opcode == opcode && (it as? TwoRegisterInstruction)?.let { r -> r.registerA == destination && r.registerB == source } == true
    } == true
    fun literal(at: Int, opcode: Opcode, register: Int, value: Int) = one(at, opcode, register)
        && (body[at] as? NarrowLiteralInstruction)?.narrowLiteral == value
    fun and(at: Int, mask: Int) = body.getOrNull(at)?.let {
        it.opcode == Opcode.AND_INT && (it as? ThreeRegisterInstruction)?.let { r ->
            r.registerA == 3 && r.registerB == 10 && r.registerC == mask
        } == true
    } == true
    fun untouched(register: Int, from: Int, until: Int) = body.subList(from, until).none {
        it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.let { r ->
            r.registerA == register || (it.opcode.setsWideRegister() && r.registerA + 1 == register)
        } == true
    }
    val constructors = body.indices.filter { body[it].methodRef()?.let { r -> r.definingClass == POST && r.name == "<init>" } == true }
    val allocations = body.indices.filter { body[it].opcode == Opcode.NEW_INSTANCE &&
        (body[it] as? ReferenceInstruction)?.reference.toString() == POST }
    val returns = body.indices.filter { body[it].opcode == Opcode.RETURN_OBJECT }
    val ctor = body.getOrNull(2166) as? RegisterRangeInstruction
    val ctorRef = body.getOrNull(2166)?.methodRef()
    val shape = body.size == 2183 && literal(10, Opcode.CONST_4, 10, -1)
        && move(66, Opcode.MOVE, 4, 10) && (67..69).all { move(it, Opcode.MOVE, it - 62, it - 63) }
        && literal(168, Opcode.CONST, 161, 0x80000.inv()) && literal(175, Opcode.CONST, 168, 0x4000000.inv())
        && and(1732, 168) && and(1865, 161) && move(1713, Opcode.MOVE, 10, 3)
        && literal(394, Opcode.AND_INT_LIT8, 3, -2) && (body[394] as TwoRegisterInstruction).registerB == 7
        && move(211, Opcode.MOVE, 7, 3) && move(2126, Opcode.MOVE_FROM16, 154, 10)
        && move(2070, Opcode.MOVE_FROM16, 158, 7) && untouched(154, 2127, 2167) && untouched(158, 2071, 2167)
        && allocations == listOf(2098) && one(2098, Opcode.NEW_INSTANCE, 4) && constructors == listOf(2166)
        && ctor?.opcode == Opcode.INVOKE_DIRECT_RANGE && ctor.startRegister == 4 && ctor.registerCount == 156
        && ctorRef?.parameterTypes?.takeLast(6)?.map { it.toString() } == listOf("I", "I", "I", "I", "I", "Lh27;")
        && returns == listOf(2167, 2181) && one(2167, Opcode.RETURN_OBJECT, 4)
        && literal(2065, Opcode.CONST_16, 157, 0) && one(2181, Opcode.RETURN_OBJECT, 157)
        && untouched(157, 2066, 2070) && untouched(157, 2168, 2182) && one(2069, Opcode.IF_NEZ, 0)
        && body[2180].methodRef().toString() == "Lf7b;->a(Ljava/lang/String;)V"
    requireShape(PATCH, shape, "the explicit followed, can_edit and trail masks or complete Post return paths changed")
    val flow = ControlFlow.of(method)
    val predecessors = body.indices.filter { 2167 in flow.normal[it] || 2167 in flow.exceptional[it] }
    requireShape(PATCH, predecessors == listOf(2166), "the successful Post return no longer follows its only constructor")
    requireShape(PATCH, 2168 in flow.normal[2069] && (2168..2181).all { target ->
        body.indices.filter { target in flow.normal[it] || target in flow.exceptional[it] } == listOf(if (target == 2168) 2069 else target - 1)
    }, "the null error return no longer follows only its missing-fields branch")
    val scratch = method.freeLocalsAt(PATCH, 2167, 3, reads = listOf(4, 154, 158))
    return PostJsonPresencePlan(mutableOf(method), scratch)
}

internal fun BytecodePatchContext.applyPostJsonPresence(plan: PostJsonPresencePlan) {
    val model = mutableClassDefBy(POST)
    for (name in listOf("hushRootTrailPresent", "hushPaidContextKnown")) model.fields.add(
        ImmutableField(POST, name, "Z", AccessFlags.PRIVATE.value, null, null, null).toMutable(),
    )
    model.methods.add(ImmutableMethod(POST, "hushSetJsonPresence", listOf(
        ImmutableMethodParameter("I", null, null),
        ImmutableMethodParameter("I", null, null),
    ), "V", AccessFlags.PUBLIC.value or AccessFlags.SYNTHETIC.value, null, null, MutableMethodImplementation(4)).toMutable().apply {
        addInstructions(0, """
            const v0, 0x4080000
            and-int/2addr p1, v0
            if-nez p1, :unknown
            const/4 v0, 0x1
            goto :paid
            :unknown
            const/4 v0, 0x0
            :paid
            iput-boolean v0, p0, $POST_PAID_KNOWN
            and-int/lit8 v0, p2, 0x1
            xor-int/lit8 v0, v0, 0x1
            iput-boolean v0, p0, $POST_TRAIL_PRESENT
            return-void
        """)
    })
    val (post, first, trail) = plan.scratch
    plan.reader.addInstructionsAtControlFlowLabel(2167, """
        move-object/from16 v$post, v4
        move/from16 v$first, v154
        move/from16 v$trail, v158
        invoke-virtual { v$post, v$first, v$trail }, $POST_JSON_SET
    """)
}
