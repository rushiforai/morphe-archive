/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.words

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.RepoFiles
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.BASE_MODEL_WITH_TREE
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.feed.treeTypeTag
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The anchors of Hide posts by words that need no Facebook build: the keys, which accessor is the
 * message's and which the shared post's, how toString is held to reading the message as text, and
 * the patch refusing a build where that reading is gone. Each rule has a control that must fail it.
 */
class PostTextShapesTest {
    private val helpers = "Lcom/example/Strings;"
    private val helperName = "A0n"

    @Test
    fun `the keys are the ones Facebook's builds load`() {
        assertEquals(0x38eb0007, treeFieldKey(MESSAGE_FIELD))
        assertEquals(0xdb1d8904.toInt(), treeTypeTag(TEXT_WITH_ENTITIES_TYPE))
        assertEquals(0x36452d, treeFieldKey(TEXT_FIELD))
        assertEquals(0x92300e9a.toInt(), treeFieldKey(ATTACHED_STORY_FIELD))
        assertEquals(0xdfba89a6.toInt(), treeTypeTag(STORY_TYPE))
    }

    private fun method(
        name: String,
        vararg body: Instruction,
        definingClass: String = GRAPHQL_STORY,
        parameters: List<String> = emptyList(),
        flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        returnType: String = GRAPHQL_TEXT_WITH_ENTITIES,
    ): Method = ImmutableMethod(
        definingClass, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType, flags, null, null,
        ImmutableMethodImplementation(8, body.toList(), null, null),
    )

    private fun literal(register: Int, value: Int) = ImmutableInstruction31i(Opcode.CONST, register, value)

    private fun string(register: Int, value: String) =
        ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value))

    private fun call(opcode: Opcode, owner: String, name: String, parameters: List<String>, returns: String, vararg registers: Int) =
        ImmutableInstruction35c(
            opcode, registers.size, registers.getOrElse(0) { 0 }, registers.getOrElse(1) { 0 },
            registers.getOrElse(2) { 0 }, registers.getOrElse(3) { 0 }, 0,
            ImmutableMethodReference(owner, name, parameters, returns),
        )

    private fun accessor(name: String, field: String, type: String, returns: String = GRAPHQL_TEXT_WITH_ENTITIES) = method(
        name,
        ImmutableInstruction21c(Opcode.CONST_CLASS, 2, ImmutableTypeReference(returns)),
        literal(1, treeTypeTag(type)),
        literal(0, treeFieldKey(field)),
        call(Opcode.INVOKE_VIRTUAL, BASE_MODEL_WITH_TREE, "getCachedModel", listOf("I", "Ljava/lang/Class;", "I"),
            BASE_MODEL_WITH_TREE, 7, 0, 2, 1),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
        returnType = returns,
    )

    /** GraphQLStory's toString as both builds have it: the accessor, a null check, the label, the reader. */
    private fun toString(accessorName: String, label: String = MESSAGE_TEXT_LABEL, readerOpcode: Opcode = Opcode.INVOKE_STATIC) =
        method(
            "toString",
            call(Opcode.INVOKE_VIRTUAL, GRAPHQL_STORY, accessorName, emptyList(), GRAPHQL_TEXT_WITH_ENTITIES, 5),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
            ImmutableInstruction21t(Opcode.IF_EQZ, 0, 8),
            string(1, label),
            call(readerOpcode, helpers, helperName, listOf(BASE_MODEL_WITH_TREE), "Ljava/lang/String;", 0),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            returnType = "Ljava/lang/String;",
        )

    /** Facebook's static text helper: the key of [field], then getCachedString. */
    private fun reader(field: String = TEXT_FIELD, getter: String = "getCachedString") = method(
        helperName,
        literal(0, treeFieldKey(field)),
        call(Opcode.INVOKE_VIRTUAL, BASE_MODEL_WITH_TREE, getter, listOf("I"),
            if (getter == "getCachedString") "Ljava/lang/String;" else "Z", 1, 0),
        ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
        definingClass = helpers,
        parameters = listOf(BASE_MODEL_WITH_TREE),
        flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        returnType = "Ljava/lang/String;",
    )

    private fun story(vararg methods: Method) =
        ImmutableClassDef(GRAPHQL_STORY, AccessFlags.PUBLIC.value, BASE_MODEL_WITH_TREE, null, null, null, null, methods.toList())

    @Test
    fun `the message accessor is the one loading message as TextWithEntities`() {
        val story = story(
            accessor("A07", MESSAGE_FIELD, TEXT_WITH_ENTITIES_TYPE),
            accessor("A0A", "title", TEXT_WITH_ENTITIES_TYPE),
            accessor("A08", MESSAGE_FIELD, "XFBTextWithEntities"),
            accessor("A04", ATTACHED_STORY_FIELD, STORY_TYPE, GRAPHQL_STORY),
            accessor("A05", "all_substories", STORY_TYPE, GRAPHQL_STORY),
        )
        assertEquals(listOf("A07"), messageAccessors(story).map { it.name })
        assertEquals(listOf("A04"), attachedStoryAccessors(story).map { it.name })
    }

    @Test
    fun `toString has to hand that accessor's model to a static reader after the message text label`() {
        val message = accessor("A07", MESSAGE_FIELD, TEXT_WITH_ENTITIES_TYPE)
        assertEquals(listOf("$helpers->$helperName"), messageTextReaders(toString("A07"), message).map { "${it.definingClass}->${it.name}" })
        // Controls: the title's label, another accessor, and a reader that isn't static.
        assertTrue(messageTextReaders(toString("A07", label = "title.text"), message).isEmpty())
        assertTrue(messageTextReaders(toString("A0A"), message).isEmpty())
        assertTrue(messageTextReaders(toString("A07", readerOpcode = Opcode.INVOKE_VIRTUAL), message).isEmpty())
    }

    @Test
    fun `the reader has to read the text field with getCachedString`() {
        assertTrue(readsTextField(reader()))
        assertFalse("another field", readsTextField(reader(field = "name")))
        assertFalse("another getter", readsTextField(reader(getter = "getCachedBoolean")))
    }

    private fun treeModel(stringReaderFlags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) = ImmutableClassDef(
        BASE_MODEL_WITH_TREE, AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, TREE_JNI, null, null, null, null,
        listOf(method("getCachedString", ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0), definingClass = BASE_MODEL_WITH_TREE,
            parameters = listOf("I"), flags = stringReaderFlags, returnType = "Ljava/lang/String;")),
    )

    private fun tree() = ImmutableClassDef(TREE_JNI, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
        listOf(ImmutableField(TREE_JNI, "mTypeTag", "I", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, null)),
        emptyList())

    private fun textModel(typeName: String = TEXT_WITH_ENTITIES_TYPE) = ImmutableClassDef(
        GRAPHQL_TEXT_WITH_ENTITIES, AccessFlags.PUBLIC.value, BASE_MODEL_WITH_TREE, null, null, null, null,
        listOf(method("getTypeName", string(0, typeName), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            definingClass = GRAPHQL_TEXT_WITH_ENTITIES, returnType = "Ljava/lang/String;")),
    )

    private fun owner(vararg methods: Method) =
        ImmutableClassDef(helpers, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, methods.toList())

    @Test
    fun `the members the extension reads have to be public`() {
        assertTrue(hasPublicStringReader(treeModel()))
        assertFalse(hasPublicStringReader(treeModel(stringReaderFlags = AccessFlags.PRIVATE.value)))
        assertTrue(answersTextType(textModel()))
        assertFalse(answersTextType(textModel("XFBTextWithEntities")))
    }

    /** A build like 577 and 580, with [toString] and [reader] in place of theirs. */
    private fun build(toString: Method = toString("A07"), reader: Method = reader()): List<ClassDef> = listOf(
        story(
            accessor("A07", MESSAGE_FIELD, TEXT_WITH_ENTITIES_TYPE),
            accessor("A0A", "title", TEXT_WITH_ENTITIES_TYPE),
            accessor("A04", ATTACHED_STORY_FIELD, STORY_TYPE, GRAPHQL_STORY),
            toString,
        ),
        textModel(), treeModel(), tree(), owner(reader),
        ExtensionDex.classDef(POST_TEXT), ExtensionDex.classDef(SETTINGS_STATUS),
    )

    private fun stubCall(classes: List<ClassDef>, stub: String): String {
        val context = PatchContexts.of(classes)
        hidePostsByWordsPatch.execute(context)
        val body = context.mutableClassDefBy(POST_TEXT).methods.single { it.name == stub }.implementation!!.instructions
        val call = (body.elementAt(1) as ReferenceInstruction).reference as MethodReference
        return call.name
    }

    @Test
    fun `the patch fills both stubs on a build like Facebook's`() {
        assertEquals("A07", stubCall(build(), MESSAGE_STUB))
        assertEquals("A04", stubCall(build(), ATTACHED_STORY_STUB))
    }

    @Test
    fun `the patch stops when toString no longer reads the message as its text`() {
        for ((what, classes) in listOf(
            "the title's label" to build(toString = toString("A07", label = "title.text")),
            "another accessor" to build(toString = toString("A0A")),
            "a reader of another field" to build(reader = reader(field = "name")),
        )) {
            val refusal = assertThrows(what, PatchException::class.java) {
                hidePostsByWordsPatch.execute(PatchContexts.of(classes))
            }
            assertTrue("$what: ${refusal.message}", refusal.message!!.startsWith(PATCH))
        }
    }

    /** The patch and the extension name the same fields and the same stubs. Read as text. */
    @Test
    fun `the patch and the extension read the same fields through the same stubs`() {
        val java = File(RepoFiles.root,
            "extensions/facebook/src/main/java/" + POST_TEXT.removePrefix("L").removeSuffix(";") + ".java")
        assertTrue("the patch fills in stubs in ${java.path}, which isn't there", java.isFile)
        val text = java.readText()
        for (name in listOf(MESSAGE_FIELD, TEXT_WITH_ENTITIES_TYPE, TEXT_FIELD, ATTACHED_STORY_FIELD)) {
            assertTrue("the extension doesn't name \"$name\"", text.contains("\"$name\""))
        }
        for (stub in listOf(MESSAGE_STUB, ATTACHED_STORY_STUB)) {
            assertTrue("the extension has no public static Object $stub(Object)",
                Regex("""public static Object $stub\(Object \w+\)""").containsMatchIn(text))
        }
    }
}
