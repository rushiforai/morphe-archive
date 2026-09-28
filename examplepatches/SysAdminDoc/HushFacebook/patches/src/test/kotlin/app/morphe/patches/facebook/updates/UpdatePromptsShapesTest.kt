/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.updates

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Stop update prompts that need no Facebook build: what each fingerprint takes and
 * refuses, and the code each hook puts in front of its method.
 */
class UpdatePromptsShapesTest {
    private val filterParameters = listOf(CONTEXTUAL_FILTER, PROMOTION_DEFINITION)
    private val handlerParameters = listOf(
        "Landroid/content/Context;", "Lcom/facebook/auth/usersession/FbUserSession;",
        "Lcom/facebook/push/constants/PushProperty;", "Lfixture/Renamed;", "Lfixture/AlsoRenamed;",
        "Lcom/facebook/pushlite/model/PushInfraMetaData;",
    )
    private val evaluatorParameters = listOf(
        "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Long;", "Ljava/lang/Double;", "Ljava/lang/Boolean;",
        "Ljava/util/Map;",
    )

    /** A method loading each of [literals] then returning, with [registers] in its frame. */
    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returnType: String,
        static: Boolean,
        registers: Int,
        vararg literals: String,
    ): Method = ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0),
        null,
        null,
        ImmutableMethodImplementation(
            registers,
            literals.map { ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(it)) } +
                ImmutableInstruction10x(Opcode.RETURN_VOID),
            null,
            null,
        ),
    )

    private fun filter(vararg literals: String, static: Boolean = false, parameters: List<String> = filterParameters) =
        method("Lfixture/Filter;", "A06", parameters, "Z", static, 11, *literals)

    @Test
    fun `a promotion filter is an instance predicate over the filter and its promotion holding every literal`() {
        assertTrue(isPromotionFilter(filter(LATEST_VERSION_AVAILABLE, CELLULAR_PROVIDER), LATEST_VERSION_AVAILABLE, CELLULAR_PROVIDER))
        // One literal alone: the "latest version" string turns up in other code too.
        assertFalse(isPromotionFilter(filter(LATEST_VERSION_AVAILABLE), LATEST_VERSION_AVAILABLE, CELLULAR_PROVIDER))
        assertFalse(isPromotionFilter(filter(LATEST_VERSION_AVAILABLE, CELLULAR_PROVIDER, static = true), LATEST_VERSION_AVAILABLE))
        assertFalse(isPromotionFilter(filter(OWNERSHIP_NEEDED, OWNERSHIP_PROVIDER, parameters = filterParameters.reversed()), OWNERSHIP_NEEDED))
        assertFalse(isPromotionFilter(method("Lfixture/Filter;", "A06", filterParameters, "V", false, 11, OWNERSHIP_NEEDED), OWNERSHIP_NEEDED))
    }

    @Test
    fun `the force-sync handler is the void six-parameter push handler holding both literals`() {
        val handler = method("Lfixture/Handler;", "Di3", handlerParameters, "V", false, 21, FORCE_SYNC_UNSUPPORTED, FORCE_SYNC_SUCCESS)
        assertTrue(isForceSyncHandler(handler))
        assertFalse(isForceSyncHandler(method("Lfixture/Handler;", "Di3", handlerParameters, "V", false, 21, FORCE_SYNC_SUCCESS)))
        assertFalse(isForceSyncHandler(method("Lfixture/Handler;", "Di3", handlerParameters.dropLast(1), "V", false, 21,
            FORCE_SYNC_UNSUPPORTED, FORCE_SYNC_SUCCESS)))
        assertFalse(isForceSyncHandler(method("Lfixture/Handler;", "Di3", handlerParameters.reversed(), "V", false, 21,
            FORCE_SYNC_UNSUPPORTED, FORCE_SYNC_SUCCESS)))
        assertFalse(isForceSyncHandler(method("Lfixture/Handler;", "Di3", handlerParameters, "Z", false, 21,
            FORCE_SYNC_UNSUPPORTED, FORCE_SYNC_SUCCESS)))
    }

    @Test
    fun `the evaluator is the dispatcher's kept static method holding the ceiling filter`() {
        assertTrue(isFilterEvaluator(method(FILTER_DISPATCHER, EVALUATE_FILTER, evaluatorParameters, "I", true, 7, VERSION_CEILING)))
        assertFalse(isFilterEvaluator(method("Lfixture/Other;", EVALUATE_FILTER, evaluatorParameters, "I", true, 7, VERSION_CEILING)))
        assertFalse(isFilterEvaluator(method(FILTER_DISPATCHER, "evaluate", evaluatorParameters, "I", true, 7, VERSION_CEILING)))
        assertFalse(isFilterEvaluator(method(FILTER_DISPATCHER, EVALUATE_FILTER, evaluatorParameters, "I", false, 7, VERSION_CEILING)))
        assertFalse(isFilterEvaluator(method(FILTER_DISPATCHER, EVALUATE_FILTER, evaluatorParameters, "I", true, 7, "app_min_version")))
        assertFalse(isFilterEvaluator(method(FILTER_DISPATCHER, EVALUATE_FILTER, evaluatorParameters.dropLast(1), "I", true, 7, VERSION_CEILING)))
    }

    private fun calls(method: MutableMethod, index: Int): MethodReference =
        (method.getInstructionAt(index) as ReferenceInstruction).reference as MethodReference

    private fun MutableMethod.getInstructionAt(index: Int) = implementation!!.instructions.elementAt(index)

    @Test
    fun `a filter answers no first thing while the switch is on and runs itself otherwise`() {
        val filter = MutableMethod(filter(LATEST_VERSION_AVAILABLE, CELLULAR_PROVIDER))
        val own = filter.implementation!!.instructions.count()
        filter.failFilterWhenBlocked()
        val hook = calls(filter, 0)
        assertEquals("Lapp/morphe/extension/facebook/updates/UpdatePrompts;->blockPromotion()Z",
            hook.definingClass + "->" + hook.name + "()" + hook.returnType)
        assertEquals(Opcode.MOVE_RESULT, filter.getInstructionAt(1).opcode)
        assertEquals(Opcode.IF_EQZ, filter.getInstructionAt(2).opcode)
        assertEquals(Opcode.CONST_4, filter.getInstructionAt(3).opcode)
        assertEquals(Opcode.RETURN, filter.getInstructionAt(4).opcode)
        // The branch lands on the method's own first instruction, so nothing of it is skipped.
        assertEquals(own + 5, filter.implementation!!.instructions.count())
        assertEquals(Opcode.CONST_STRING, filter.getInstructionAt(5).opcode)
        assertEquals(5, offsetTarget(filter, 2))
    }

    @Test
    fun `the push handler returns first thing while the switch is on`() {
        val handler = MutableMethod(method("Lfixture/Handler;", "Di3", handlerParameters, "V", false, 21,
            FORCE_SYNC_UNSUPPORTED, FORCE_SYNC_SUCCESS))
        handler.skipWhenBlocked()
        assertEquals("blockForceSync", calls(handler, 0).name)
        assertEquals(Opcode.RETURN_VOID, handler.getInstructionAt(3).opcode)
        assertEquals(4, offsetTarget(handler, 2))
    }

    @Test
    fun `the evaluator answers failed for the ceiling first thing, with the filter name passed as a range`() {
        val evaluator = MutableMethod(method(FILTER_DISPATCHER, EVALUATE_FILTER, evaluatorParameters, "I", true, 7, VERSION_CEILING))
        evaluator.failVersionCeilingWhenBlocked()
        val call = evaluator.getInstructionAt(0)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals("blockVersionCeiling", calls(evaluator, 0).name)
        // p0 of a static method with six narrow parameters and one local is v1.
        assertEquals(1, (call as RegisterRangeInstruction).startRegister)
        assertEquals(1, call.registerCount)
        assertEquals(Opcode.CONST_4, evaluator.getInstructionAt(3).opcode)
        assertEquals(FILTER_FAILED.toLong(),
            (evaluator.getInstructionAt(3) as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction).narrowLiteral.toLong())
        assertEquals(Opcode.RETURN, evaluator.getInstructionAt(4).opcode)
    }

    /** A method with no local register to borrow is refused by name, before anything is put in. */
    @Test
    fun `a method with no local to borrow stops the patch`() {
        val tight = MutableMethod(method("Lfixture/Filter;", "A06", filterParameters, "Z", false, 3, OWNERSHIP_NEEDED))
        val refusal = assertThrows(PatchException::class.java) { tight.failFilterWhenBlocked() }
        assertTrue(refusal.message, refusal.message!!.contains(PATCH))
        assertEquals(Opcode.CONST_STRING, tight.getInstructionAt(0).opcode)
    }

    /** The instruction index a branch at [index] lands on. */
    private fun offsetTarget(method: MutableMethod, index: Int): Int {
        val instructions = method.implementation!!.instructions.toList()
        val branch = instructions[index] as OffsetInstruction
        var address = 0
        val addresses = instructions.map { val at = address; address += it.codeUnits; at }
        return addresses.indexOf(addresses[index] + branch.codeOffset)
    }
}
