/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.notifications

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Block promotional notifications that need no Facebook build: which methods and
 * fields the anchors take and turn down, and the code the hook puts first in the post method.
 */
class NotificationShapesTest {
    private val builderType = "Lfixture/NotificationBuilder;"
    private val postParameters = listOf(
        "Landroid/content/Intent;", "Lcom/facebook/notifications/logging/NotificationLogObject;",
        "Lcom/facebook/notifications/logging/NotificationsLogger\$Component;", builderType, "I",
    )

    /** An instance method of the tray manager loading each of [literals], then returning. */
    private fun method(
        parameters: List<String> = postParameters,
        returnType: String = "V",
        registers: Int = 9,
        vararg literals: String = arrayOf(SHOW_START),
        static: Boolean = false,
    ): Method = ImmutableMethod(
        TRAY_MANAGER,
        "post",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0),
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

    private fun field(owner: String, name: String, type: String, static: Boolean = false) =
        ImmutableField(owner, name, type, AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0),
            null, null, null)

    private fun holder(type: String, vararg fields: ImmutableField): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, fields.toList(), null)

    @Test
    fun `the post method is the instance void over the intent, the log object, the component, a builder and an int`() {
        assertTrue(isPostMethod(method()))
        assertFalse(isPostMethod(method(static = true)))
        assertFalse(isPostMethod(method(returnType = "Z")))
        // The literal is what makes it the post method: the interface's other methods don't load it.
        assertFalse(isPostMethod(method(literals = arrayOf())))
        assertFalse(isPostMethod(method(literals = arrayOf("show_notif_end"))))
        assertFalse(isPostMethod(method(postParameters.reversed())))
        assertFalse(isPostMethod(method(postParameters.dropLast(1))))
        assertFalse(isPostMethod(method(postParameters.dropLast(1) + "J")))
        assertFalse(isPostMethod(method(postParameters.map { if (it == builderType) "I" else it })))
    }

    @Test
    fun `the push is the builder's one instance field of its type`() {
        val push = field(builderType, "push", TRAY_NOTIFICATION)
        assertSame(push, notificationField(holder(builderType, push, field(builderType, "title", "Ljava/lang/CharSequence;"))))
        // A static one isn't the builder's own, and two leave no way to tell which is posted.
        assertSame(push, notificationField(holder(builderType, push, field(builderType, "last", TRAY_NOTIFICATION, static = true))))
        assertNull(notificationField(holder(builderType, push, field(builderType, "previous", TRAY_NOTIFICATION))))
        assertNull(notificationField(holder(builderType, field(builderType, "title", "Ljava/lang/CharSequence;"))))
    }

    @Test
    fun `the push's type is its String field mType`() {
        assertTrue(hasTypeField(holder(TRAY_NOTIFICATION, field(TRAY_NOTIFICATION, "mType", "Ljava/lang/String;"))))
        assertFalse(hasTypeField(holder(TRAY_NOTIFICATION, field(TRAY_NOTIFICATION, "mType", "Ljava/lang/Object;"))))
        assertFalse(hasTypeField(holder(TRAY_NOTIFICATION, field(TRAY_NOTIFICATION, "mType", "Ljava/lang/String;", static = true))))
        assertFalse(hasTypeField(holder(TRAY_NOTIFICATION, field(TRAY_NOTIFICATION, "mTitle", "Ljava/lang/String;"))))
    }

    private fun MutableMethod.at(index: Int) = implementation!!.instructions.elementAt(index)

    /** The instruction index a branch at [index] lands on. */
    private fun offsetTarget(method: MutableMethod, index: Int): Int {
        val instructions = method.implementation!!.instructions.toList()
        val branch = instructions[index] as OffsetInstruction
        var address = 0
        val addresses = instructions.map { val at = address; address += it.codeUnits; at }
        return addresses.indexOf(addresses[index] + branch.codeOffset)
    }

    @Test
    fun `the post method returns first while the kind is blocked and posts as before otherwise`() {
        val original = method()
        val post = MutableMethod(original)
        val own = post.implementation!!.instructions.count()
        val push = field(builderType, "push", TRAY_NOTIFICATION)
        post.postNothingWhenBlocked(push)

        assertEquals(own + 9, post.implementation!!.instructions.count())
        // The builder, copied into v0 from its parameter register with the 16-bit move.
        assertEquals(Opcode.MOVE_OBJECT_FROM16, post.at(0).opcode)
        assertEquals(0, (post.at(0) as TwoRegisterInstruction).registerA)
        assertEquals(original.parameterRegisterNumber(BUILDER_PARAMETER), (post.at(0) as TwoRegisterInstruction).registerB)
        // No builder or no push: Facebook's own first instruction, with no question asked.
        assertEquals(Opcode.IF_EQZ, post.at(1).opcode)
        assertEquals(9, offsetTarget(post, 1))
        val pushRead = (post.at(2) as ReferenceInstruction).reference as FieldReference
        assertEquals(Opcode.IGET_OBJECT, post.at(2).opcode)
        assertEquals(listOf(builderType, "push", TRAY_NOTIFICATION), listOf(pushRead.definingClass, pushRead.name, pushRead.type))
        assertEquals(Opcode.IF_EQZ, post.at(3).opcode)
        assertEquals(9, offsetTarget(post, 3))
        val typeRead = (post.at(4) as ReferenceInstruction).reference as FieldReference
        assertEquals(listOf(TRAY_NOTIFICATION, TYPE_FIELD, "Ljava/lang/String;"),
            listOf(typeRead.definingClass, typeRead.name, typeRead.type))
        // The type goes to the extension from v0, and its answer comes back there.
        val hook = (post.at(5) as ReferenceInstruction).reference as MethodReference
        assertEquals(Opcode.INVOKE_STATIC, post.at(5).opcode)
        assertEquals("Lapp/morphe/extension/facebook/notifications/NotificationKinds;", hook.definingClass)
        assertEquals("block", hook.name)
        assertEquals(listOf("Ljava/lang/String;"), hook.parameterTypes.map { it.toString() })
        assertEquals("Z", hook.returnType)
        assertEquals(1, (post.at(5) as Instruction35c).registerCount)
        assertEquals(0, (post.at(5) as Instruction35c).registerC)
        assertEquals(Opcode.MOVE_RESULT, post.at(6).opcode)
        assertEquals(0, (post.at(6) as OneRegisterInstruction).registerA)
        // No: Facebook's own first instruction. Yes: return before anything is posted.
        assertEquals(Opcode.IF_EQZ, post.at(7).opcode)
        assertEquals(9, offsetTarget(post, 7))
        assertEquals(Opcode.RETURN_VOID, post.at(8).opcode)
        assertEquals(Opcode.CONST_STRING, post.at(9).opcode)
        // Every register the hook names but the builder's is v0, which a 4-bit operand reaches.
        for (index in 1..7) {
            val instruction = post.at(index)
            if (instruction is OneRegisterInstruction) assertEquals("instruction $index", 0, instruction.registerA)
            if (instruction is TwoRegisterInstruction) assertEquals("instruction $index", 0, instruction.registerB)
        }
    }

    /** A post method with no local register to borrow is refused by name, before anything goes in. */
    @Test
    fun `a post method with no local to borrow stops the patch`() {
        val tight = MutableMethod(method(registers = 6))
        val refusal = assertThrows(PatchException::class.java) {
            tight.postNothingWhenBlocked(field(builderType, "push", TRAY_NOTIFICATION))
        }
        assertTrue(refusal.message, refusal.message!!.contains(PATCH))
        assertEquals(2, tight.implementation!!.instructions.count())
        assertEquals(Opcode.CONST_STRING, tight.at(0).opcode)
    }
}
