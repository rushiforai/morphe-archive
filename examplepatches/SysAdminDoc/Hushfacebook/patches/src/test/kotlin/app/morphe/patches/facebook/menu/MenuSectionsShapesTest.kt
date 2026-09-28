/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.menu

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Hide Menu promotions that need no Facebook build: which methods the anchors take and
 * turn down, where they find the group and the children list, and the code the hooks put in.
 */
class MenuSectionsShapesTest {
    private val section = "Lfixture/GroupSection;"
    private val model = "Lfixture/GroupModel;"
    private val group = "Lfixture/Group;"
    private val builder = "Lfixture/ChildrenBuilder;"
    private val children = "Lfixture/Children;"
    private val context = "Lfixture/SectionContext;"
    private val isGroup = { type: String -> type == group }

    private val childrenField = ImmutableFieldReference(builder, "A00", children)
    private val modelField = ImmutableFieldReference(section, "A04", model)
    private val groupField = ImmutableFieldReference(section, "A01", group)
    private val groupCall = ImmutableMethodReference(model, "A00", emptyList(), group)
    private val builderInit = ImmutableMethodReference(builder, "<init>", emptyList(), "V")

    private fun constString(register: Int, string: String) =
        ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(string))

    private fun invoke(opcode: Opcode, reference: MethodReference, vararg registers: Int): Instruction =
        ImmutableInstruction35c(opcode, registers.size, registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 },
            registers.getOrElse(2) { 0 }, registers.getOrElse(3) { 0 }, registers.getOrElse(4) { 0 }, reference)

    private fun newBuilder(register: Int, type: String = builder) =
        ImmutableInstruction21c(Opcode.NEW_INSTANCE, register, ImmutableTypeReference(type))

    private fun childrenOf(to: Int, from: Int, field: FieldReference = childrenField) =
        ImmutableInstruction22c(Opcode.IGET_OBJECT, to, from, field)

    /** A group section's children builder over [instructions], `this` past [locals] locals. */
    private fun method(
        instructions: List<Instruction>,
        locals: Int = 18,
        parameters: List<String> = listOf(context),
        returnType: String = children,
        static: Boolean = false,
    ): Method = ImmutableMethod(
        section,
        "A1S",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0),
        null,
        null,
        ImmutableMethodImplementation(locals + (if (static) 0 else 1) + parameters.size, instructions, null, null),
    )

    /**
     * The native section's shape: `this` into v2, the model from it, the group from the model into
     * v3, then the section's own code, which writes v0 first, builds its list in v13 and hands it
     * back. [locals] is 18, so `this` is v18.
     */
    private fun nativeSection(vararg extra: Instruction, groupRegister: Int = 3, key: String = NATIVE_SECTION_KEY) =
        method(
            listOf(
                ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 2, 18),
                ImmutableInstruction22c(Opcode.IGET_OBJECT, 6, 2, modelField),
                invoke(Opcode.INVOKE_VIRTUAL, groupCall, 6),
                ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, groupRegister),
                ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, ImmutableFieldReference(group, "A0G", group)),
                newBuilder(13),
                invoke(Opcode.INVOKE_DIRECT, builderInit, 13),
                constString(1, key),
            ) + extra.toList() + listOf(
                childrenOf(0, 13),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            ),
        )

    /** The server section's shape: its group from its own field into v5, then its list in v2. */
    private fun serverSection(vararg positions: String = SERVER_POSITIONS.toTypedArray(), field: FieldReference = groupField) =
        method(
            listOf(ImmutableInstruction22c(Opcode.IGET_OBJECT, 5, 9, field), newBuilder(2), invoke(Opcode.INVOKE_DIRECT, builderInit, 2)) +
                positions.map { constString(0, it) } +
                listOf(childrenOf(0, 2), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)),
            locals = 9,
        )

    @Test
    fun `the native section's children builder is the instance method loading the list key`() {
        assertTrue(isNativeSectionChildren(nativeSection()))
        assertFalse(isNativeSectionChildren(nativeSection(key = "community_resources_simple_tile_bookmarks_key")))
        assertFalse(isNativeSectionChildren(method(listOf(constString(0, NATIVE_SECTION_KEY)), static = true)))
        assertFalse(isNativeSectionChildren(method(listOf(constString(0, NATIVE_SECTION_KEY)), returnType = "V")))
        assertFalse(isNativeSectionChildren(method(listOf(constString(0, NATIVE_SECTION_KEY)), parameters = emptyList())))
        assertFalse(isNativeSectionChildren(method(listOf(constString(0, NATIVE_SECTION_KEY)),
            parameters = listOf(context, "I"))))
    }

    @Test
    fun `the server section's children builder loads all three positions`() {
        assertTrue(isServerSectionChildren(serverSection()))
        // GraphQL's own list of the positions is a class initializer, and a section missing one
        // isn't this one.
        assertFalse(isServerSectionChildren(serverSection("ABOVE_NATIVE", "BELOW_NATIVE")))
        assertFalse(isServerSectionChildren(method(SERVER_POSITIONS.map { constString(0, it) }, static = true)))
    }

    @Test
    fun `the native section's group is the kept answer of its one call returning the group enum`() {
        assertEquals(GroupRead(3, 3, group), nativeGroupRead(nativeSection(), isGroup))
        assertEquals(GroupRead(3, 17, group), nativeGroupRead(nativeSection(groupRegister = 17), isGroup))
        // Not the enum: no read.
        assertNull(nativeGroupRead(nativeSection(), { false }))
        // Two calls answering the enum can't be told apart.
        assertNull(nativeGroupRead(nativeSection(invoke(Opcode.INVOKE_VIRTUAL, groupCall, 6),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4)), isGroup))
        // An answer that isn't kept isn't a read.
        val dropped = method(listOf(invoke(Opcode.INVOKE_VIRTUAL, groupCall, 6), newBuilder(13)))
        assertNull(nativeGroupRead(dropped, isGroup))
    }

    @Test
    fun `the server section's group is its one read of a group field of its own class`() {
        assertEquals(GroupRead(0, 5, group), serverGroupRead(serverSection(), isGroup))
        assertNull(serverGroupRead(serverSection(field = ImmutableFieldReference("Lfixture/Other;", "A01", group)), isGroup))
        assertNull(serverGroupRead(serverSection(field = ImmutableFieldReference(section, "A01", model)), isGroup))
        val twice = method(listOf(ImmutableInstruction22c(Opcode.IGET_OBJECT, 5, 9, groupField),
            ImmutableInstruction22c(Opcode.IGET_OBJECT, 4, 9, groupField)), locals = 9)
        assertNull(serverGroupRead(twice, isGroup))
    }

    @Test
    fun `the children list is the one field of a class the method builds and constructs bare`() {
        val list = ChildrenList(builder, "$builder->A00:$children")
        assertEquals(list, childrenList(nativeSection()))
        assertEquals(list, childrenList(serverSection()))
        // The range form of the constructor counts too.
        val ranged = method(listOf(newBuilder(13), ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 13, 1, builderInit),
            childrenOf(0, 13)))
        assertEquals(list, childrenList(ranged))
        // Negative controls: a list never constructed, one constructed with an argument, a field of
        // another type, and two candidate fields.
        assertNull(childrenList(method(listOf(newBuilder(13), childrenOf(0, 13)))))
        val withArgument = ImmutableMethodReference(builder, "<init>", listOf("I"), "V")
        assertNull(childrenList(method(listOf(newBuilder(13), invoke(Opcode.INVOKE_DIRECT, withArgument, 13, 1),
            childrenOf(0, 13)))))
        assertNull(childrenList(method(listOf(newBuilder(13), invoke(Opcode.INVOKE_DIRECT, builderInit, 13),
            childrenOf(0, 13, ImmutableFieldReference(builder, "A00", "Lfixture/Other;"))))))
        assertNull(childrenList(nativeSection(childrenOf(0, 13, ImmutableFieldReference(builder, "A01", children)))))
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
    fun `a hidden group hands back a new empty list and any other goes on with the section's own code`() {
        val native = MutableMethod(nativeSection())
        val read = nativeGroupRead(native, isGroup)!!
        val own = native.implementation!!.instructions.count()
        native.buildNothingWhenHidden(read, childrenList(native)!!, HIDE_SECTION)

        val hook = native.at(4) as RegisterRangeInstruction
        assertEquals(Opcode.INVOKE_STATIC_RANGE, native.at(4).opcode)
        assertEquals(3, hook.startRegister)
        assertEquals(1, hook.registerCount)
        val call = (native.at(4) as ReferenceInstruction).reference as MethodReference
        assertEquals("Lapp/morphe/extension/facebook/menu/MenuSections;", call.definingClass)
        assertEquals("hideSection", call.name)
        assertEquals(listOf("Ljava/lang/Object;"), call.parameterTypes.map { it.toString() })
        assertEquals("Z", call.returnType)
        // v0 is borrowed: the section's next instruction writes it before anything reads it.
        assertEquals(Opcode.MOVE_RESULT, native.at(5).opcode)
        assertEquals(0, (native.at(5) as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, native.at(6).opcode)
        assertEquals(0, (native.at(6) as OneRegisterInstruction).registerA)
        assertEquals(Opcode.NEW_INSTANCE, native.at(7).opcode)
        assertEquals(builder, ((native.at(7) as ReferenceInstruction).reference as TypeReference).type)
        assertEquals(Opcode.INVOKE_DIRECT_RANGE, native.at(8).opcode)
        assertEquals("$builder-><init>()V", ((native.at(8) as ReferenceInstruction).reference as MethodReference).let {
            "${it.definingClass}->${it.name}()${it.returnType}"
        })
        assertEquals(Opcode.IGET_OBJECT, native.at(9).opcode)
        assertEquals(0, (native.at(9) as TwoRegisterInstruction).registerA)
        assertEquals(0, (native.at(9) as TwoRegisterInstruction).registerB)
        assertEquals("$builder->A00:$children", ((native.at(9) as ReferenceInstruction).reference as FieldReference).let {
            "${it.definingClass}->${it.name}:${it.type}"
        })
        assertEquals(Opcode.RETURN_OBJECT, native.at(10).opcode)
        assertEquals(0, (native.at(10) as OneRegisterInstruction).registerA)
        // A no lands on the section's own next instruction, so none of its code is skipped.
        assertEquals(Opcode.SGET_OBJECT, native.at(11).opcode)
        assertEquals(11, offsetTarget(native, 6))
        assertEquals(own + 7, native.implementation!!.instructions.count())
    }

    /** A group kept above v15 still goes to the hook, through the range form. */
    @Test
    fun `a group in a high register goes through the range form`() {
        val native = MutableMethod(nativeSection(groupRegister = 17))
        native.buildNothingWhenHidden(nativeGroupRead(native, isGroup)!!, childrenList(native)!!, HIDE_SECTION)
        val hook = native.at(4) as RegisterRangeInstruction
        assertEquals(17, hook.startRegister)
    }

    @Test
    fun `the server section's hook goes right after it reads its group`() {
        val server = MutableMethod(serverSection())
        server.buildNothingWhenHidden(serverGroupRead(server, isGroup)!!, childrenList(server)!!, HIDE_SERVER_SECTION)
        assertEquals(Opcode.IGET_OBJECT, server.at(0).opcode)
        val call = (server.at(1) as ReferenceInstruction).reference as MethodReference
        assertEquals("hideServerSection", call.name)
        assertEquals(5, (server.at(1) as RegisterRangeInstruction).startRegister)
        // v0 is the lowest local nothing reads there, and the hook borrows it.
        assertEquals(0, (server.at(2) as OneRegisterInstruction).registerA)
        assertEquals(Opcode.NEW_INSTANCE, server.at(4).opcode)
        // A no lands on the section's own list, built as before.
        assertEquals(Opcode.NEW_INSTANCE, server.at(8).opcode)
        assertEquals(8, offsetTarget(server, 3))
    }

    /**
     * With every local still wanted where the hook goes, nothing is borrowed and the patch stops
     * naming itself, before anything goes in.
     */
    @Test
    fun `a section with no free local stops the patch`() {
        val tight = MutableMethod(method(
            listOf(
                invoke(Opcode.INVOKE_VIRTUAL, groupCall, 1),
                ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            ),
            locals = 1,
        ))
        val refusal = assertThrows(PatchException::class.java) {
            tight.buildNothingWhenHidden(nativeGroupRead(tight, isGroup)!!, ChildrenList(builder, "$builder->A00:$children"),
                HIDE_SECTION)
        }
        assertTrue(refusal.message, refusal.message!!.contains(PATCH))
        assertEquals(3, tight.implementation!!.instructions.count())
    }
}
