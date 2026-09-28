/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Hushfacebook in the Menu that need no Facebook build: which methods and
 * constructors the anchors take and turn down, the factory added to the row item, and the code
 * put into the row list builder, the tap handler and the loggers.
 */
class SettingsRowShapesTest {
    private val item = "Lfixture/RowItem;"
    private val owner = "Lfixture/RowComponent;"
    private val helper = "Lfixture/Helper;"
    private val publicFinal = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
    private val publicStatic = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value

    private fun method(
        definingClass: String,
        name: String,
        parameters: List<String>,
        returnType: String,
        registers: Int,
        instructions: List<Instruction>,
        flags: Int = publicFinal,
    ): Method = ImmutableMethod(
        definingClass, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType, flags, null, null,
        ImmutableMethodImplementation(registers, instructions, null, null),
    )

    private fun field(name: String, type: String) = ImmutableFieldReference(item, name, type)
    private fun put(opcode: Opcode, from: Int, self: Int, name: String, type: String) =
        ImmutableInstruction22c(opcode, from, self, field(name, type))

    /**
     * 580's full constructor: (title, address, icon address, icon, icon, id) into A03, A05, A04,
     * A01, A00 and A02, stored out of order as Facebook's is. `this` is v0 of eight.
     */
    private fun constructor580(): Method = method(item, "<init>",
        listOf(CHAR, STRING, STRING, "I", "I", "J"), "V", 8,
        listOf(
            put(Opcode.IPUT_OBJECT, 2, 0, "A05", STRING),
            put(Opcode.IPUT_WIDE, 6, 0, "A02", "J"),
            put(Opcode.IPUT, 4, 0, "A01", "I"),
            put(Opcode.IPUT, 5, 0, "A00", "I"),
            put(Opcode.IPUT_OBJECT, 1, 0, "A03", CHAR),
            put(Opcode.IPUT_OBJECT, 3, 0, "A04", STRING),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        ))

    /** 577's: one icon, so (title, address, icon address, icon, id). */
    private fun constructor577(): Method = method(item, "<init>",
        listOf(CHAR, STRING, STRING, "I", "J"), "V", 7,
        listOf(
            put(Opcode.IPUT_OBJECT, 2, 0, "A04", STRING),
            put(Opcode.IPUT_WIDE, 5, 0, "A01", "J"),
            put(Opcode.IPUT, 4, 0, "A00", "I"),
            put(Opcode.IPUT_OBJECT, 1, 0, "A02", CHAR),
            put(Opcode.IPUT_OBJECT, 3, 0, "A03", STRING),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        ))

    private fun itemClass(vararg methods: Method, longFields: Int = 1) = ImmutableClassDef(
        item, publicFinal, "Ljava/lang/Object;", null, null, null,
        (1..longFields).map { ImmutableField(item, "A0$it", "J", publicFinal, null, null, null) } +
            listOf(ImmutableField(item, "A09", "I", publicFinal, null, null, null)),
        methods.toList(),
    )

    @Test
    fun `the row list build takes the session, a list and a flag, and hands back an ImmutableList`() {
        val good = ImmutableMethodReference(helper, "A08", listOf(USER_SESSION, "Ljava/util/List;", "Z"), IMMUTABLE_LIST)
        assertTrue(isRowListBuild(good))
        assertFalse(isRowListBuild(ImmutableMethodReference(helper, "A05", listOf(USER_SESSION), IMMUTABLE_LIST)))
        assertFalse(isRowListBuild(ImmutableMethodReference(helper, "A08", listOf(USER_SESSION, "Ljava/util/List;", "Z"),
            "Ljava/util/List;")))
        val native = method(helper, "A1S", listOf("Lfixture/Context;"), "Lfixture/Children;", 3, listOf(
            ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 4, 0, 1, 1, 1, 0, good),
            ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 4, 0, 1, 1, 1, 0, good),
        ))
        assertEquals("a second call to the same build is one build", listOf("A08"), rowListBuilds(native).map { it.name })
    }

    private fun tap(
        parameters: List<String> = listOf(VIEW, USER_SESSION, helper, item, "Lfixture/Events;", "Lfixture/Host;"),
        flags: Int = publicStatic,
        trace: String = ROW_TAP_TRACE,
        registers: Int = 9,
    ) = method(owner, "A04", parameters, "V", registers,
        listOf(ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(trace)),
            ImmutableInstruction10x(Opcode.RETURN_VOID)), flags)

    @Test
    fun `the row tap handler is the static one over the view, the session and the row, loading the trace`() {
        assertTrue(isRowTap(tap()))
        assertEquals(item, rowItemType(tap()))
        assertFalse(isRowTap(tap(flags = publicFinal)))
        assertFalse(isRowTap(tap(trace = "bookmarks_panel")))
        assertFalse(isRowTap(tap(parameters = listOf(USER_SESSION, VIEW, helper, item, helper, helper))))
        assertFalse(isRowTap(tap(parameters = listOf(VIEW, USER_SESSION, helper, "J", helper))))
    }

    @Test
    fun `the loggers are the tap handler's static siblings that take the row`() {
        val tap = tap()
        val logger = method(owner, "A06", listOf(helper, item, "Lfixture/Host;"), "V", 7, emptyList(), publicStatic)
        val other = method(owner, "A03", listOf("Landroid/content/Context;", VIEW), "V", 4, emptyList(), publicStatic)
        val instance = method(owner, "render", listOf(item), "V", 4, emptyList())
        val classDef = ImmutableClassDef(owner, publicFinal, "Ljava/lang/Object;", null, null, null, null,
            listOf(tap, logger, other, instance))
        assertEquals(listOf("A06"), rowLoggers(classDef, tap, item).map { it.name })
    }

    @Test
    fun `the full constructor is the one over a title, two addresses, icons and an id`() {
        val short = method(item, "<init>", listOf(CHAR, "I", "J"), "V", 5, emptyList())
        assertEquals("<init>", fullConstructor(itemClass(constructor580(), short))?.name)
        assertEquals(6, fullConstructor(itemClass(constructor580(), short))?.parameterTypes?.size)
        assertEquals(5, fullConstructor(itemClass(constructor577()))?.parameterTypes?.size)
        // The addresses swapped with the title, no icon at all, and two candidates: none taken.
        assertNull(fullConstructor(itemClass(method(item, "<init>", listOf(STRING, CHAR, STRING, "I", "J"), "V", 7,
            emptyList()))))
        assertNull(fullConstructor(itemClass(method(item, "<init>", listOf(CHAR, STRING, STRING, "J"), "V", 6,
            emptyList()))))
        assertNull(fullConstructor(itemClass(constructor580(), constructor577())))
    }

    @Test
    fun `each constructor argument maps to the field it's stored in`() {
        assertEquals(listOf("A03", "A05", "A04", "A01", "A00", "A02"), constructorFields(constructor580())!!.map { it.name })
        assertEquals(listOf("A02", "A04", "A03", "A00", "A01"), constructorFields(constructor577())!!.map { it.name })
        // An argument that isn't stored leaves nothing to copy from a template.
        val unstored = method(item, "<init>", listOf(CHAR, STRING, STRING, "I", "J"), "V", 7, listOf(
            put(Opcode.IPUT_OBJECT, 2, 0, "A04", STRING),
            put(Opcode.IPUT_WIDE, 5, 0, "A01", "J"),
            put(Opcode.IPUT_OBJECT, 1, 0, "A02", CHAR),
            put(Opcode.IPUT_OBJECT, 3, 0, "A03", STRING),
        ))
        assertNull(constructorFields(unstored))
    }

    @Test
    fun `the id is the item's one long field`() {
        assertEquals("A01", idField(itemClass())?.name)
        assertNull(idField(itemClass(longFields = 2)))
    }

    @Test
    fun `the factory builds a row with the title, the id, no address and the template's icons`() {
        val constructor = constructor580()
        val smali = rowFactorySmali(item, constructor, constructorFields(constructor)!!)
        assertEquals(
            listOf(
                "check-cast p0, $item",
                "new-instance v0, $item",
                "move-object/from16 v1, p1",
                "const/4 v2, 0x0",
                "iget-object v3, p0, $item->A04:$STRING",
                "iget v4, p0, $item->A01:I",
                "iget v5, p0, $item->A00:I",
                "move-wide/from16 v6, p2",
                "invoke-direct/range { v0 .. v7 }, $item-><init>(${CHAR}${STRING}${STRING}IIJ)V",
                "return-object v0",
            ),
            smali.lines(),
        )
        assertEquals(8, rowFactoryLocals(constructor))
        assertEquals(7, rowFactoryLocals(constructor577()))
        val one = rowFactorySmali(item, constructor577(), constructorFields(constructor577())!!).lines()
        assertEquals("iget v4, p0, $item->A00:I", one[5])
        assertEquals("invoke-direct/range { v0 .. v6 }, $item-><init>(${CHAR}${STRING}${STRING}IJ)V", one[7])
    }

    private fun MutableMethod.at(index: Int) = implementation!!.instructions.elementAt(index)

    private fun offsetTarget(method: MutableMethod, index: Int): Int {
        val instructions = method.implementation!!.instructions.toList()
        val branch = instructions[index] as OffsetInstruction
        var address = 0
        val addresses = instructions.map { val at = address; address += it.codeUnits; at }
        return addresses.indexOf(addresses[index] + branch.codeOffset)
    }

    /**
     * A builder with two returns, one of them reached by a jump: every list it hands back goes
     * through the extension and back into an ImmutableList, the jump included.
     */
    @Test
    fun `every list the builder hands back goes through the row`() {
        val builder = MutableMethod(method(helper, "A08", listOf(USER_SESSION, "Ljava/util/List;", "Z"), IMMUTABLE_LIST, 20,
            listOf(
                ImmutableInstruction10t(Opcode.GOTO, 2),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 17),
            )))
        builder.passListThroughRow()
        val calls = builder.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { call -> "${call.definingClass}->${call.name}" }
        }
        assertEquals(listOf(
            "Lapp/morphe/extension/facebook/menu/MenuSettingsRow;->withRow", "$IMMUTABLE_LIST->copyOf",
            "Lapp/morphe/extension/facebook/menu/MenuSettingsRow;->withRow", "$IMMUTABLE_LIST->copyOf",
        ), calls)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, builder.at(1).opcode)
        assertEquals(4, (builder.at(1) as RegisterRangeInstruction).startRegister)
        assertEquals(4, (builder.at(2) as OneRegisterInstruction).registerA)
        assertEquals(Opcode.RETURN_OBJECT, builder.at(5).opcode)
        assertEquals(17, (builder.at(6) as RegisterRangeInstruction).startRegister)
        assertEquals(Opcode.RETURN_OBJECT, builder.at(10).opcode)
        // The jump that went to the second return now goes through its hook first.
        assertEquals(6, offsetTarget(builder, 0))
    }

    private fun idOf() = ImmutableFieldReference(item, "A02", "J")

    @Test
    fun `a tap on the row goes to the extension first and a yes ends it`() {
        val tap = MutableMethod(tap())
        val own = tap.implementation!!.instructions.count()
        tap.skipRow(3, idOf(), tapToo = true)
        // Nine registers and six parameters: p0 is v3 and the row, p3, is v6.
        assertEquals(Opcode.MOVE_OBJECT_FROM16, tap.at(0).opcode)
        assertEquals(Opcode.IGET_WIDE, tap.at(1).opcode)
        assertEquals(1, (tap.at(1) as OneRegisterInstruction).registerA)
        assertEquals(Opcode.MOVE_OBJECT_FROM16, tap.at(2).opcode)
        val call = (tap.at(3) as ReferenceInstruction).reference as MethodReference
        assertEquals("onTap", call.name)
        assertEquals(listOf(VIEW, "J"), call.parameterTypes.map { it.toString() })
        assertEquals(Opcode.MOVE_RESULT, tap.at(4).opcode)
        assertEquals(Opcode.IF_EQZ, tap.at(5).opcode)
        assertEquals(Opcode.RETURN_VOID, tap.at(6).opcode)
        assertEquals(7, offsetTarget(tap, 5))
        assertEquals(Opcode.CONST_STRING, tap.at(7).opcode)
        assertEquals(own + 7, tap.implementation!!.instructions.count())
    }

    @Test
    fun `a logger skips the row`() {
        val logger = MutableMethod(method(owner, "A06", listOf(helper, item, "Lfixture/Host;"), "V", 7,
            listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), publicStatic))
        logger.skipRow(1, idOf(), tapToo = false)
        val call = (logger.at(2) as ReferenceInstruction).reference as MethodReference
        assertEquals("isRow", call.name)
        assertEquals(listOf("J"), call.parameterTypes.map { it.toString() })
        assertEquals(Opcode.RETURN_VOID, logger.at(5).opcode)
        assertEquals(6, offsetTarget(logger, 4))
    }

    @Test
    fun `a method the hook can't go into stops the patch before anything goes in`() {
        val tight = MutableMethod(tap(registers = 8))
        val refusal = assertThrows(PatchException::class.java) { tight.skipRow(3, idOf(), tapToo = true) }
        assertTrue(refusal.message, refusal.message!!.contains(ROW_PATCH))
        assertEquals(2, tight.implementation!!.instructions.count())
        val missing = assertThrows(PatchException::class.java) { MutableMethod(tap()).skipRow(-1, idOf(), tapToo = false) }
        assertTrue(missing.message, missing.message!!.contains("doesn't take the row item"))
        val answers = MutableMethod(method(owner, "A07", listOf(item), "Z", 5, emptyList(), publicStatic))
        assertThrows(PatchException::class.java) { answers.skipRow(0, idOf(), tapToo = false) }
    }

    private companion object {
        const val CHAR = "Ljava/lang/CharSequence;"
        const val STRING = "Ljava/lang/String;"
    }
}
