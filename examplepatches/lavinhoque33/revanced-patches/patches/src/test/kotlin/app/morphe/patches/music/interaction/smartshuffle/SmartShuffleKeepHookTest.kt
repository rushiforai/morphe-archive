/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.*
import org.junit.Test

class SmartShuffleKeepHookTest {
    private val requestBase = "Lfixture/RequestBase;"
    private val network = "Lfixture/Network;"
    private val future = "Lcom/google/common/util/concurrent/ListenableFuture;"

    private fun method(parameters: List<String>, registers: Int, result: String, body: String) = ImmutableMethod(
        "Lfixture/Shared;", "submit", parameters.map { ImmutableMethodParameter(it, null, null) },
        result, AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructionsWithLabels(0, body) }

    private fun futureSubmission(
        submittedRequest: String = "p1",
        capturedRequest: String = "p1",
    ): MutableMethod {
        val send = "Lfixture/Network;->send(" +
            "Lfixture/RequestBase;Ljava/util/concurrent/Executor;Lfixture/Options;)$future"
        val callbackConstructor = "Lfixture/Completion;-><init>(" +
            "Lfixture/Shared;Lfixture/Policy;Lfixture/RequestBase;)V"

        return method(
            listOf(requestBase, "Lfixture/Policy;", "Ljava/util/concurrent/Executor;", "Lfixture/Options;"),
            10, future, """
                const/4 v2, 0x0
                if-eqz v2, :network
                return-object v2
                :network
                invoke-virtual {p0, $submittedRequest, p3, p4}, $send
                move-result-object v0
                new-instance v1, Lfixture/Completion;
                invoke-direct {v1, p0, p2, $capturedRequest}, $callbackConstructor
                return-object v0
            """,
        )
    }

    @Test
    fun modernSubmissionObservesBuiltRequestBeforeDispatchAndRetargetsIncomingBranch() {
        val method = futureSubmission()
        val original = method.implementation!!.instructions.toList()
        val branch = original[1] as BuilderOffsetInstruction
        val index = requireNotNull(method.keepRequestSubmissionIndex(requestBase, network))

        method.addKeepRequestSubmission(index)

        val code = method.implementation!!.instructions.toList()
        val hook = code[index] as RegisterRangeInstruction
        assertEquals(3, index)
        assertEquals(10, method.implementation!!.registerCount)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, hook.opcode)
        assertEquals(6, hook.startRegister)
        assertEquals(1, hook.registerCount)
        assertEquals("onEditStarted", code[index].getReference<MethodReference>()!!.name)
        assertSame(code[index], branch.target.location.instruction)
        assertEquals(original[index].getReference<MethodReference>(), code[index + 1].getReference<MethodReference>())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[index + 2].opcode)
        assertSame(original[index + 1], code[index + 2])
        assertSame(original[index + 3], code[index + 4])
        assertEquals(6, (code[index + 4] as FiveRegisterInstruction).registerF)
        assertEquals(original.size + 1, code.size)
    }

    @Test
    fun legacySubmissionObservesSameRequestAfterCompletionClosureBeforeNetworkCall() {
        val callbackConstructor = "Lfixture/Completion;-><init>(" +
            "Lfixture/Shared;Lfixture/Policy;Lfixture/RequestBase;Lfixture/Callback;)V"
        val send = "Lfixture/Network;->send(" +
            "Lfixture/RequestBase;Lfixture/Callback;Lfixture/Options;)V"
        val method = method(
            listOf(requestBase, "Lfixture/Policy;", "Lfixture/Callback;", "Lfixture/Options;"),
            10, "V", """
                new-instance v0, Lfixture/Completion;
                invoke-direct {v0, p0, p2, p1, p3}, $callbackConstructor
                invoke-virtual {p0, p1, v0, p4}, $send
                return-void
            """,
        )
        val original = method.implementation!!.instructions.toList()
        val index = requireNotNull(method.keepRequestSubmissionIndex(requestBase, network))

        method.addKeepRequestSubmission(index)

        val code = method.implementation!!.instructions.toList()
        assertEquals(2, index)
        assertSame(original[0], code[0])
        assertSame(original[1], code[1])
        assertEquals(6, (code[1] as FiveRegisterInstruction).registerF)
        assertEquals(6, (code[2] as RegisterRangeInstruction).startRegister)
        assertEquals(original[2].getReference<MethodReference>(), code[3].getReference<MethodReference>())
        assertEquals(6, (code[3] as FiveRegisterInstruction).registerD)
        assertSame(original[3], code[4])
        assertEquals(10, method.implementation!!.registerCount)
    }

    @Test
    fun rangeSubmissionPreservesHighRequestRegisterAndInvokeResultAdjacency() {
        val send = "Lfixture/Network;->send(" +
            "Lfixture/RequestBase;Ljava/util/concurrent/Executor;Lfixture/Options;)$future"
        val callbackConstructor = "Lfixture/Completion;-><init>(Lfixture/Shared;Lfixture/RequestBase;)V"
        val method = method(
            listOf(requestBase, "Lfixture/Policy;", "Ljava/util/concurrent/Executor;", "Lfixture/Options;"),
            40, future, """
                move-object/from16 v37, p3
                move-object/from16 v38, p4
                invoke-virtual/range {v35 .. v38}, $send
                move-result-object v0
                new-instance v34, Lfixture/Completion;
                invoke-direct/range {v34 .. v36}, $callbackConstructor
                return-object v0
            """,
        )
        val index = requireNotNull(method.keepRequestSubmissionIndex(requestBase, network))

        method.addKeepRequestSubmission(index)

        val code = method.implementation!!.instructions.toList()
        assertEquals(2, index)
        assertEquals(40, method.implementation!!.registerCount)
        assertEquals(36, (code[2] as RegisterRangeInstruction).startRegister)
        assertEquals(1, (code[2] as RegisterRangeInstruction).registerCount)
        assertEquals(Opcode.INVOKE_VIRTUAL_RANGE, code[3].opcode)
        assertEquals(35, (code[3] as RegisterRangeInstruction).startRegister)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[4].opcode)
        assertEquals(34, (code[6] as RegisterRangeInstruction).startRegister)
    }

    @Test
    fun completionObservesOriginalRequestAndResponseBeforeNativeParameterReuse() {
        val method = method(listOf(requestBase, "Ljava/lang/Object;"), 40, "V", """
            check-cast p2, Lfixture/Response;
            invoke-virtual/range {p1 .. p1}, Lfixture/RequestBase;->builder()Ljava/lang/Object;
            move-result-object p1
            return-void
        """)
        val original = method.implementation!!.instructions.toList()

        method.addKeepEditCompletion()

        val code = method.implementation!!.instructions.toList()
        val hook = code.first() as RegisterRangeInstruction
        assertEquals(40, method.implementation!!.registerCount)
        assertEquals(38, hook.startRegister)
        assertEquals(2, hook.registerCount)
        assertEquals("onEditCompleted", code.first().getReference<MethodReference>()!!.name)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code.first().opcode)
        original.forEachIndexed { index, instruction -> assertSame(instruction, code[index + 1]) }
    }

    @Test(expected = IllegalStateException::class)
    fun submissionPreflightRejectsDifferentRequestIdentity() {
        futureSubmission(submittedRequest = "v2").keepRequestSubmissionIndex(requestBase, network)
    }

    @Test(expected = IllegalStateException::class)
    fun submissionPreflightRejectsCompletionCapturingDifferentRequest() {
        futureSubmission(capturedRequest = "v2").keepRequestSubmissionIndex(requestBase, network)
    }

    @Test
    fun nativeFailureNotificationAndUnrelatedNetworkOwnerAreNotSubmissionSites() {
        val callback = method(listOf(requestBase), 2, "V", "return-void")

        assertNull(callback.keepRequestSubmissionIndex(requestBase, network))
        assertNull(futureSubmission().keepRequestSubmissionIndex(requestBase, "Lfixture/Unrelated;"))
    }
}
