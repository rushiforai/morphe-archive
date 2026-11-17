/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.*
import org.junit.Test

class SmartShuffleNativeHookTest {
    private fun method(returnsBoolean: Boolean = true) = ImmutableMethod(
        "Lfixture/Queue;", "replace", emptyList(), "V", AccessFlags.PUBLIC.value,
        null, null, MutableMethodImplementation(3),
    ).toMutable().apply {
        addInstructionsWithLabels(0, """
            const/4 v0, 0x0
            invoke-static {}, Lfixture/Queue;->commit()${if (returnsBoolean) "Z" else "V"}
            ${if (returnsBoolean) "move-result v0" else ""}
            invoke-static {}, Lfixture/Queue;->afterCommit()V
            return-void
        """)
    }

    @Test
    fun unsuccessfulBooleanReplacementJumpsToOriginalSuccessorNotMethodPrefix() {
        val method = method()
        val successor = method.implementation!!.instructions.elementAt(3)
        installSmartShuffleReplacementAck(method, 3, 0)
        val instructions = method.implementation!!.instructions.toList()
        val branch = instructions[3] as BuilderOffsetInstruction
        assertEquals(Opcode.IF_EQZ, branch.opcode)
        assertSame(successor, branch.target.location.instruction)
        assertSame(successor, instructions[5])
        assertEquals(
            "Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleNative;" +
                "->replaced(Ljava/lang/Object;)V",
            (instructions[4] as ReferenceInstruction).reference.toString(),
        )
        assertEquals(Opcode.MOVE_RESULT, instructions[2].opcode)
        assertEquals(7, instructions.size)
    }

    @Test
    fun voidReplacementAcknowledgesImmediatelyAfterCommittedInvoke() {
        val method = method(false)
        val successor = method.implementation!!.instructions.elementAt(2)
        installSmartShuffleReplacementAck(method, 2, -1)
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, instructions[2].opcode)
        assertSame(successor, instructions[3])
        assertTrue(instructions.none { it.opcode == Opcode.MOVE_RESULT })
        assertEquals(5, instructions.size)
    }

    private fun nativeSuccess() = ImmutableMethod(
        "Lfixture/Callback;", "success",
        listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
        "V", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(8),
    ).toMutable().apply {
        addInstructions(0, """
            check-cast p1, Lfixture/Response;
            iget-object v0, p1, Lfixture/Response;->insertionHint:Ljava/lang/String;
            const/4 v2, 0x0
            invoke-virtual {p0}, Lfixture/Callback;->nativeTargetIndex()I
            move-result v3
            iget-object p1, p1, Lfixture/Response;->items:Ljava/util/List;
            new-instance v1, Ljava/util/ArrayList;
            invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
            invoke-static {v1, v2}, Lfixture/Callback;->nativeFilter(Ljava/util/List;I)V
            invoke-virtual {p0}, Lfixture/Callback;->nativeQueue()Ljava/util/List;
            move-result-object v0
            invoke-interface {v0, v3, v1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z
            move-result v4
            invoke-static {p0}, Lfixture/Callback;->nativeRefresh(Ljava/lang/Object;)V
            return-void
        """)
    }

    @Test
    fun indexedInsertionPreservesNativeResponseItemsFilteringAndMutationWithoutMetadataConstruction() {
        val original = nativeSuccess()
        val originalInstructions = original.implementation!!.instructions.toList()
        val indexed = indexedSmartShuffleSuccess(original)
        val instructions = indexed.implementation!!.instructions.toList()
        val originalTail = originalInstructions.drop(5)
        val indexedTail = instructions.drop(3)

        assertEquals(originalTail.map { it.opcode }, indexedTail.map { it.opcode })
        assertEquals(
            originalTail.map { (it as? ReferenceInstruction)?.reference?.toString() },
            indexedTail.map { (it as? ReferenceInstruction)?.reference?.toString() },
        )
        assertEquals(Opcode.CHECK_CAST, instructions.first().opcode)
        assertEquals(
            listOf("Ljava/util/ArrayList;"),
            instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
                .map { (it as ReferenceInstruction).reference.toString() },
        )
        assertEquals(originalInstructions.size, original.implementation!!.instructions.count())
        assertEquals("success", original.name)
    }

    @Test
    fun indexedInsertionPreservesResponseParameterRegistersAndUsesOnlyAppendedIndex() {
        val original = nativeSuccess()
        val indexed = indexedSmartShuffleSuccess(original)
        val instructions = indexed.implementation!!.instructions.toList()
        val targetMove = instructions[2] as TwoRegisterInstruction
        val responseItems = instructions[3] as TwoRegisterInstruction

        assertEquals(listOf("Ljava/lang/Object;", "I"), indexed.parameterTypes.map { it.toString() })
        assertEquals(original.implementation!!.registerCount + 1, indexed.implementation!!.registerCount)
        assertEquals(Opcode.MOVE_FROM16, instructions[2].opcode)
        assertEquals(3, targetMove.registerA)
        assertEquals(8, targetMove.registerB)
        assertEquals(7, responseItems.registerA)
        assertEquals(7, responseItems.registerB)
    }

}
