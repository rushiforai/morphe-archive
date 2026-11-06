package com.openbubbles.wear.patches

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class NativeHooksTest {
    private val notify = ImmutableMethodReference(
        "Landroidx/core/app/NotificationManagerCompat;", "notify",
        listOf("I", "Landroid/app/Notification;"), "V",
    )

    @Test fun `selects only first native notification post and uses its built notification register`() {
        val instructions = listOf<Instruction>(
            BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 4, 5, 6, 0, 0, notify),
            BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 7, 8, 9, 0, 0, notify),
        )
        assertEquals(0 to 6, conversationNotifyTarget(instructions))
    }

    @Test fun `dismissal metadata is attached before Android copies the notification`() {
        val ownerType = "Lcom/localob/messaging/app/notifications/ChatNotifications;"
        val instructions = listOf<Instruction>(
            BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 4, 5, 6, 0, 0, notify),
            BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 7, 8, 9, 0, 0, notify),
            BuilderInstruction10x(Opcode.RETURN_VOID),
        )
        val method = com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
            ownerType, "post", listOf("Landroid/content/Context;", "Ljava/lang/String;", "Z").map {
                com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(it, emptySet(), null)
            }, "V", 2, emptySet(), emptySet(),
            com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(24, instructions, emptyList(), emptyList()))
        val owner = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
            com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                ownerType, 1, "Ljava/lang/Object;", emptyList(), null, emptySet(), emptyList(), listOf(method)))
        injectConversationNotifyHook(owner, owner.methods.single())
        val calls = owner.directMethods.single().implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)?.name
        }
        assertEquals(listOf("prepareNotification", "notify", "onNotificationPosted", "notify"), calls)
    }

    @Test fun `startup uses the Context argument rather than a reused p0 register`() {
        val start = ImmutableMethodReference("Lcom/localob/messaging/app/service/BackendForegroundService\$Companion;",
            "start", listOf("Landroid/content/Context;"), "V")
        val invoke = BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 6, 2, 0, 0, 0, start)
        assertEquals(0 to 2, backendStartTarget(listOf(invoke)))
        assertFailsWith<PatchException> { backendStartTarget(listOf(invoke, invoke)) }
    }

    @Test fun `notification hook keeps parameters even when native code overwrites their old registers`() {
        val oldCount = 24
        val registers = mutableMapOf(27 to "this", 28 to "context", 29 to "key", 30 to "silent", 6 to "notification")
        parameterShiftInstructions(oldCount).forEach {
            val move = it as TwoRegisterInstruction
            registers[move.registerA] = registers.getValue(move.registerB)
        }
        registers[21] = "reused native local"
        registers[23] = "another native local"
        val hook = preservedAlertHookInstructions(oldCount, 6)
        hook.take(3).forEach {
            val move = it as TwoRegisterInstruction
            registers[move.registerA] = registers.getValue(move.registerB)
        }
        assertEquals(listOf("context", "notification", "silent"), (24..26).map { registers[it] })
        assertEquals(Opcode.INVOKE_STATIC_RANGE, hook.last().opcode)
    }

    @Test fun `fails closed when conversation notification fingerprint is ambiguous`() {
        val oneCall = listOf<Instruction>(BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 4, 5, 6, 0, 0, notify))
        assertFailsWith<PatchException> { conversationNotifyTarget(oneCall) }
        val wrong = ImmutableMethodReference(notify.definingClass, "notify", listOf("I"), "V")
        val wrongCall = listOf<Instruction>(
            BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 4, 5, 0, 0, 0, wrong),
            BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 4, 5, 6, 0, 0, notify),
        )
        assertFailsWith<PatchException> { conversationNotifyTarget(wrongCall) }
    }

    @Test fun `expanded register file preserves native parameters in their original registers`() {
        val oldCount = 24
        val prologue = parameterShiftInstructions(oldCount)
        assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16,
            Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_FROM16), prologue.map { it.opcode })
        assertEquals(listOf(20, 21, 22, 23), prologue.map { (it as TwoRegisterInstruction).registerA })
        assertEquals(listOf(27, 28, 29, 30), prologue.map { (it as TwoRegisterInstruction).registerB })

        val original = MutableMethodImplementation(oldCount).apply { addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID)) }
        val grown = growImplementation(original, 7)
        assertEquals(oldCount + 7, grown.registerCount)
        assertEquals(listOf(Opcode.RETURN_VOID), grown.instructions.map { it.opcode })
    }

    @Test fun `parameter shift rejects impossible register files`() {
        assertFailsWith<PatchException> { parameterShiftInstructions(3) }
    }
}
