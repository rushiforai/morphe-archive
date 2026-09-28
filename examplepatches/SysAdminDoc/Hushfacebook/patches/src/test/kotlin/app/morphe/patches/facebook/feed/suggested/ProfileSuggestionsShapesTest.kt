/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.suggested

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
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
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of the profile hook in Hide suggested and promoted posts that need no Facebook build:
 * which section, base class and Children type the anchors take and turn down, and the code the
 * hook puts first in the section's children builder.
 */
class ProfileSuggestionsShapesTest {
    private val base = "Lfixture/Section;"
    private val section = "Lfixture/PymkSection;"
    private val children = "Lfixture/Children;"
    private val context = "Lfixture/SectionContext;"
    private val string = "Ljava/lang/String;"

    private val childrenInit = ImmutableMethodReference(children, "<init>", emptyList(), "V")

    private fun constString(register: Int, value: String) =
        ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value))

    private fun invoke(opcode: Opcode, reference: MethodReference, vararg registers: Int): Instruction =
        ImmutableInstruction35c(opcode, registers.size, registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 },
            registers.getOrElse(2) { 0 }, registers.getOrElse(3) { 0 }, registers.getOrElse(4) { 0 }, reference)

    private fun method(
        definingClass: String,
        name: String,
        parameters: List<String>,
        returnType: String,
        registers: Int,
        instructions: List<Instruction>?,
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    ): Method = ImmutableMethod(
        definingClass,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        flags,
        null,
        null,
        instructions?.let { ImmutableMethodImplementation(registers, it, null, null) },
    )

    /** The section's constructor: hands [name] to [superclass]'s `(String)` constructor. */
    private fun constructor(name: String = PROFILE_PYMK_SECTION, superclass: String = base, parameters: List<String> = listOf(string)) =
        method(section, "<init>", emptyList(), "V", 2, listOf(
            constString(0, name),
            invoke(Opcode.INVOKE_DIRECT, ImmutableMethodReference(superclass, "<init>", parameters, "V"), 1, 0),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        ), AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)

    /**
     * A children builder loading [literal], with [locals] locals: it names its section and hands
     * back a new Children, the way the real one's path with nothing to fetch does.
     */
    private fun builder(
        literal: String? = PROFILE_PYMK_SECTION,
        locals: Int = 8,
        parameters: List<String> = listOf(context),
        returnType: String = children,
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        definingClass: String = section,
        name: String = "A1S",
    ): Method = method(definingClass, name, parameters, returnType, locals + 1 + parameters.size,
        listOfNotNull(
            literal?.let { constString(0, it) },
            ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference(children)),
            invoke(Opcode.INVOKE_DIRECT, childrenInit, 0),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
        ), flags)

    private fun sectionClass(vararg methods: Method, type: String = section, superclass: String = base): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, superclass, null, null, null,
            null, methods.toList())

    private val logTag = method(base, LOG_TAG, emptyList(), string, 1, listOf(
        constString(0, "Section"), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
    ))

    private fun setChildren(type: String = children) =
        method(base, SET_CHILDREN, listOf(type), "V", 2, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)))

    private fun baseClass(vararg methods: Method = arrayOf(logTag, setChildren())): ClassDef =
        ImmutableClassDef(base, AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, "Ljava/lang/Object;", null,
            null, null, null, methods.toList())

    private val childrenConstructor = method(children, "<init>", emptyList(), "V", 1,
        listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)

    private val getChildren = method(children, GET_CHILDREN, emptyList(), "Ljava/util/List;", 1, listOf(
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
    ))

    private fun childrenClass(
        vararg methods: Method = arrayOf(childrenConstructor, getChildren),
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    ): ClassDef = ImmutableClassDef(children, flags, "Ljava/lang/Object;", null, null, null, null, methods.toList())

    @Test
    fun `the children builder is the instance method taking the context and answering an object`() {
        assertTrue(isChildrenBuilder(builder()))
        assertFalse(isChildrenBuilder(builder(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))
        assertFalse(isChildrenBuilder(builder(parameters = emptyList())))
        assertFalse(isChildrenBuilder(builder(parameters = listOf(context, context))))
        assertFalse(isChildrenBuilder(builder(parameters = listOf("I"))))
        assertFalse(isChildrenBuilder(builder(returnType = "V")))
        assertFalse(isChildrenBuilder(builder(returnType = "Z")))
        assertFalse(isChildrenBuilder(method(section, "A1S", listOf(context), children, 2, null,
            AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value)))
    }

    @Test
    fun `the builders taken are the ones loading the section's name, and never the constructor`() {
        val wanted = builder()
        val found = profileSuggestionBuilders(sectionClass(constructor(), wanted, builder(literal = null, name = "A1T"),
            builder(literal = "ProfilePeopleYouMayKnowBelowIntrocardSection", name = "A1U")))
        assertEquals(listOf(wanted), found)
    }

    @Test
    fun `the section names itself through its base class's string constructor`() {
        assertTrue(namesItself(sectionClass(constructor(), builder())))
        // Another section's name, a name handed to some other class, and a base constructor taking nothing.
        assertFalse(namesItself(sectionClass(constructor(name = "ProfileSection"), builder())))
        assertFalse(namesItself(sectionClass(constructor(superclass = "Lfixture/Other;"), builder())))
        assertFalse(namesItself(sectionClass(constructor(parameters = emptyList()), builder())))
        assertFalse(namesItself(sectionClass(builder())))
    }

    @Test
    fun `the base class declares getLogTag and setChildren of what the builder answers`() {
        assertTrue(isSectionBase(baseClass(), children))
        assertFalse(isSectionBase(baseClass(), "Lfixture/OtherChildren;"))
        assertFalse(isSectionBase(baseClass(logTag), children))
        assertFalse(isSectionBase(baseClass(setChildren()), children))
        assertFalse(isSectionBase(baseClass(setChildren("Lfixture/OtherChildren;"), logTag), children))
        val staticTag = method(base, LOG_TAG, emptyList(), string, 1, listOf(
            constString(0, "Section"), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
        ), AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        assertFalse(isSectionBase(baseClass(staticTag, setChildren()), children))
        val abstractTag = method(base, LOG_TAG, emptyList(), string, 1, null,
            AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value)
        assertFalse(isSectionBase(baseClass(abstractTag, setChildren()), children))
    }

    @Test
    fun `Children can be built empty only through a public constructor taking nothing`() {
        assertTrue(isChildrenList(childrenClass()))
        assertFalse(isChildrenList(childrenClass(flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value)))
        assertFalse(isChildrenList(childrenClass(flags = AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or
            AccessFlags.ABSTRACT.value)))
        assertFalse(isChildrenList(childrenClass(getChildren)))
        assertFalse(isChildrenList(childrenClass(childrenConstructor)))
        val privateConstructor = method(children, "<init>", emptyList(), "V", 1,
            listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), AccessFlags.PRIVATE.value or AccessFlags.CONSTRUCTOR.value)
        assertFalse(isChildrenList(childrenClass(privateConstructor, getChildren)))
        val taking = method(children, "<init>", listOf("I"), "V", 2,
            listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)
        assertFalse(isChildrenList(childrenClass(taking, getChildren)))
    }

    private fun MutableMethod.at(index: Int) = implementation!!.instructions.elementAt(index)

    private fun offsetTarget(method: MutableMethod, index: Int): Int {
        val instructions = method.implementation!!.instructions.toList()
        val branch = instructions[index] as OffsetInstruction
        var address = 0
        val addresses = instructions.map { val at = address; address += it.codeUnits; at }
        return addresses.indexOf(addresses[index] + branch.codeOffset)
    }

    @Test
    fun `the patch finds the section and has its builder answer an empty Children while the carousel goes`() {
        val original = builder()
        val context = PatchContexts.of(listOf(baseClass(), childrenClass(), sectionClass(constructor(), original)))
        context.hideProfileSuggestions()
        val hooked = context.mutableClassDefBy(section).methods.single { it.name == "A1S" }
        val own = original.implementation!!.instructions.map { it.opcode }

        // this, handed over through the range form from the register past the locals.
        val ask = hooked.at(0)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, ask.opcode)
        assertEquals(HIDE_PROFILE_SECTION, (ask as ReferenceInstruction).reference.toString())
        assertEquals("Lapp/morphe/extension/facebook/feed/ProfileSuggestions;->hideSection(Ljava/lang/Object;)Z",
            HIDE_PROFILE_SECTION)
        assertEquals(8, (ask as RegisterRangeInstruction).startRegister)
        assertEquals(1, ask.registerCount)
        assertEquals(Opcode.MOVE_RESULT, hooked.at(1).opcode)
        assertEquals(0, (hooked.at(1) as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, hooked.at(2).opcode)
        assertEquals(0, (hooked.at(2) as OneRegisterInstruction).registerA)
        // A yes: a new, empty Children of the builder's own type, straight back.
        assertEquals(Opcode.NEW_INSTANCE, hooked.at(3).opcode)
        assertEquals(children, ((hooked.at(3) as ReferenceInstruction).reference as TypeReference).type)
        assertEquals(Opcode.INVOKE_DIRECT, hooked.at(4).opcode)
        assertEquals("$children-><init>()V", (hooked.at(4) as ReferenceInstruction).reference.toString())
        assertEquals(0, (hooked.at(4) as Instruction35c).registerC)
        assertEquals(Opcode.RETURN_OBJECT, hooked.at(5).opcode)
        assertEquals(0, (hooked.at(5) as OneRegisterInstruction).registerA)
        // A no lands on the builder's own first instruction, and all of it is still there.
        assertEquals(6, offsetTarget(hooked, 2))
        assertEquals(own, hooked.implementation!!.instructions.drop(6).map { it.opcode })
    }

    @Test
    fun `the patch goes past the extension's own copy of the name`() {
        val extension = sectionClass(builder(definingClass = "Lapp/morphe/extension/facebook/feed/Stand;"),
            type = "Lapp/morphe/extension/facebook/feed/Stand;")
        val context = PatchContexts.of(listOf(baseClass(), childrenClass(), sectionClass(constructor(), builder()), extension))
        assertEquals(section, context.profileSuggestionSection().builder.definingClass)
    }

    private fun refusal(vararg classes: ClassDef): String =
        assertThrows(PatchException::class.java) { PatchContexts.of(classes.toList()).profileSuggestionSection() }.message!!

    @Test
    fun `the patch stops when the evidence isn't all there`() {
        assertTrue(refusal(baseClass(), childrenClass()).contains("found none"))
        val second = sectionClass(builder(definingClass = "Lfixture/Second;"), type = "Lfixture/Second;")
        assertTrue(refusal(baseClass(), childrenClass(), sectionClass(constructor(), builder()), second)
            .contains("expected one section children builder"))
        assertTrue(refusal(baseClass(), childrenClass(), sectionClass(constructor(name = "ProfileSection"), builder()))
            .contains("doesn't hand"))
        assertTrue(refusal(baseClass(logTag), childrenClass(), sectionClass(constructor(), builder()))
            .contains("no superclass"))
        assertTrue(refusal(baseClass(), childrenClass(getChildren), sectionClass(constructor(), builder()))
            .contains("can't hand back an empty one"))
        assertTrue(refusal(baseClass(), sectionClass(constructor(), builder())).contains("can't hand back an empty one"))
    }

    @Test
    fun `a builder with no local register to borrow is refused`() {
        val bare = MutableMethod(builder(locals = 0, literal = null))
        val refusal = assertThrows(PatchException::class.java) { bare.buildNoChildrenWhenHidden(children) }
        assertTrue(refusal.message, refusal.message!!.contains("0 local register"))
    }

    @Test
    fun `the extension answers under the name the patch finds the section by`() {
        val type = "Lapp/morphe/extension/facebook/feed/ProfileSuggestions;"
        assertEquals(PROFILE_PYMK_SECTION, ExtensionDex.stringConstant(type, "SECTION"))
        assertEquals(LOG_TAG, ExtensionDex.stringConstant(type, "LOG_TAG"))
        val hooks = ExtensionDex.classDef(type).methods.filter {
            "$type->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == HIDE_PROFILE_SECTION
        }
        assertEquals(1, hooks.size)
        assertTrue(AccessFlags.STATIC.isSet(hooks.single().accessFlags) && AccessFlags.PUBLIC.isSet(hooks.single().accessFlags))
    }
}
