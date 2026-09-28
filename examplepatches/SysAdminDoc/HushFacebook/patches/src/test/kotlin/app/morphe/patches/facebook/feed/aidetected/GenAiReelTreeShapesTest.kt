/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.aidetected

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.treeFieldKey
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The shapes behind the Reels tab's tree reader that need no Facebook build: the TreeJNI reader the
 * patch requires, the holder and item shapes and the menu read the fixture tests hold both builds
 * to, and the names the extension reads by. Each rule has a control that must fail it.
 */
class GenAiReelTreeShapesTest {
    private val model = "Lfixture/ReelModel;"
    private val holder = "Lfixture/Holder;"
    private val tree = "Lcom/facebook/graphservice/interfaces/Tree;"

    private fun method(
        name: String,
        parameters: List<String>,
        returnType: String,
        registers: Int,
        static: Boolean,
        smali: String,
        definingClass: String = "Lfixture/Menu;",
    ): MutableMethod = MutableMethod(
        ImmutableMethod(
            definingClass,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            returnType,
            AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0),
            null,
            null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }

    private fun type(name: String, vararg fields: String, static: Boolean = false): ClassDef = ImmutableClassDef(
        name, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
        fields.mapIndexed { index, fieldType ->
            ImmutableField(name, "field$index", fieldType,
                AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null, null)
        },
        null,
    )

    private fun treeClass(vararg methods: Method): ClassDef =
        ImmutableClassDef(TREE_JNI, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, methods.toList())

    private fun reader(name: String, flags: Int, returnType: String = tree, parameter: String = "I") = ImmutableMethod(
        TREE_JNI, name, listOf(ImmutableMethodParameter(parameter, null, null)), returnType, flags, null, null, null,
    )

    /** getTree(int) answers Facebook's Tree interface; the extension reflects on it, so it has to be public and per instance. */
    @Test
    fun `the tree reader has to be a public instance method taking an int and answering an object`() {
        val publicFinal = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
        assertTrue(hasPublicTreeReader(treeClass(reader(TREE_READER, publicFinal)), TREE_READER))
        assertTrue("TreeJNI itself", hasPublicTreeReader(treeClass(reader(TREE_READER, publicFinal, returnType = TREE_JNI)), TREE_READER))
        assertFalse("missing", hasPublicTreeReader(treeClass(), TREE_READER))
        assertFalse("private", hasPublicTreeReader(treeClass(reader(TREE_READER, AccessFlags.PRIVATE.value)), TREE_READER))
        assertFalse("static", hasPublicTreeReader(
            treeClass(reader(TREE_READER, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)), TREE_READER))
        assertFalse("keyed by name", hasPublicTreeReader(
            treeClass(reader(TREE_READER, publicFinal, parameter = "Ljava/lang/String;")), TREE_READER))
        assertFalse("answers a boolean", hasPublicTreeReader(treeClass(reader(TREE_READER, publicFinal, returnType = "Z")), TREE_READER))
    }

    /** The patch stops on a TreeJNI without it, as it does without the two boolean readers. */
    @Test
    fun `a TreeJNI without the tree reader stops the patch`() {
        val publicFinal = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
        val booleans = arrayOf(
            reader(TREE_BOOLEAN_READER, publicFinal, returnType = "Z"),
            reader(TREE_FIELD_CHECK, publicFinal, returnType = "Z"),
        )
        PatchContexts.of(listOf(treeClass(*booleans, reader(TREE_READER, publicFinal)))).requireTreeReaders()

        val refused = assertThrows(PatchException::class.java) {
            PatchContexts.of(listOf(treeClass(*booleans))).requireTreeReaders()
        }
        assertTrue(refused.message, refused.message.orEmpty().contains("$TREE_READER(int)"))
    }

    @Test
    fun `a holder declares both a model field and a story field`() {
        assertTrue(isReelHolder(type(holder, model, GRAPHQL_STORY, "Ljava/lang/Integer;"), model))
        assertFalse("the model alone", isReelHolder(type(holder, model, "Ljava/lang/Integer;"), model))
        assertFalse("the story alone", isReelHolder(type(holder, GRAPHQL_STORY), model))
        assertFalse("another model", isReelHolder(type(holder, "Lfixture/Other;", GRAPHQL_STORY), model))
        assertFalse("static fields", isReelHolder(type(holder, model, GRAPHQL_STORY, static = true), model))
    }

    @Test
    fun `an item the typed reader can read holds the model or a story itself`() {
        assertTrue(holdsModelOrStory(type("Lfixture/Item;", model), model))
        assertTrue(holdsModelOrStory(type("Lfixture/Item;", GRAPHQL_STORY), model))
        assertFalse("the holder and raw trees only", holdsModelOrStory(type("Lfixture/Item;", holder, "Lfixture/Raw;"), model))
    }

    private fun menuBody(infoKey: Int = treeFieldKey(DETECTED_INFO_FIELD), flagKey: Int? = treeFieldKey(DETECTED_FLAG), helper: String? = null) = buildString {
        appendLine("const v0, $infoKey")
        appendLine("invoke-static { p0, v0 }, Lfixture/Trees;->nested(${model}I)$TREE_JNI")
        appendLine("move-result-object v1")
        if (flagKey != null) {
            appendLine("const v0, $flagKey")
            appendLine("invoke-virtual { v1, v0 }, $TREE_JNI->getBooleanValue(I)Z")
            appendLine("move-result v0")
        }
        if (helper != null) {
            appendLine("invoke-static { v1 }, $helper")
            appendLine("move-result v0")
        }
        appendLine("return-void")
    }

    private fun menu(parameters: List<String> = listOf(model, holder), static: Boolean = true, smali: String = menuBody()) =
        method("row", parameters, "V", 4, static, smali)

    private val helperRef = "Lfixture/Flags;->detected($TREE_JNI)Z"

    private fun helper(key: Int = treeFieldKey(DETECTED_FLAG)) = method(
        "detected", listOf(TREE_JNI), "Z", 2, static = true, definingClass = "Lfixture/Flags;",
        smali = """
            const v0, $key
            invoke-virtual { p0, v0 }, $TREE_JNI->getBooleanValue(I)Z
            move-result v0
            return v0
        """,
    )

    @Test
    fun `the Reels menu reads the detected info on the model, the flag in place or in a helper`() {
        assertTrue("580's shape", readsDetectedInfoOnModel(menu(), model, holder, emptyList()))
        val withHelper = menu(smali = menuBody(flagKey = null, helper = helperRef))
        assertTrue("577's shape", readsDetectedInfoOnModel(withHelper, model, holder, listOf(helper())))
        assertEquals(listOf(helperRef), treeFlagHelperCalls(withHelper).map { it.toString() })

        assertFalse("another field", readsDetectedInfoOnModel(menu(smali = menuBody(infoKey = 0x1234)), model, holder, emptyList()))
        assertFalse("no flag read", readsDetectedInfoOnModel(menu(smali = menuBody(flagKey = null)), model, holder, emptyList()))
        assertFalse("a helper reading another flag",
            readsDetectedInfoOnModel(withHelper, model, holder, listOf(helper(key = 0x1234))))
        assertFalse("a helper it doesn't call", readsDetectedInfoOnModel(
            menu(smali = menuBody(flagKey = null)), model, holder, listOf(helper())))
        assertFalse("no holder handed in", readsDetectedInfoOnModel(menu(parameters = listOf(model)), model, holder, emptyList()))
        assertFalse("no model handed in", readsDetectedInfoOnModel(menu(parameters = listOf(holder, holder)), model, holder, emptyList()))
        assertFalse("an instance method", readsDetectedInfoOnModel(menu(static = false), model, holder, emptyList()))
    }

    @Test
    fun `the item classes are the ones constructed with the holder`() {
        val builder = method(
            "build", listOf(model), "V", 6, static = true, definingClass = "Lfixture/Helper;",
            smali = """
                new-instance v0, $holder
                invoke-direct { v0, p0 }, $holder-><init>($model)V
                new-instance v1, Lfixture/Item;
                invoke-direct { v1, v0 }, Lfixture/Item;-><init>($holder)V
                new-instance v2, Lfixture/Other;
                invoke-direct { v2, p0 }, Lfixture/Other;-><init>($model)V
                return-void
            """,
        )
        assertEquals(setOf("Lfixture/Item;"), constructedWith(builder, holder))
        assertEquals(emptySet<String>(), constructedWith(builder, "Lfixture/Nothing;"))
    }

    /** The extension reads the field and walks by the reader the patch and the fixture tests hold the builds to. */
    @Test
    fun `the extension names the field and the reader the builds are held to`() {
        assertEquals(DETECTED_INFO_FIELD, ExtensionDex.stringConstant(GEN_AI_REEL_FILTER, "DETECTED_INFO_FIELD"))
        assertEquals(TREE_READER, ExtensionDex.stringConstant(GEN_AI_REEL_FILTER, "TREE_READER"))
        assertEquals(0xb4f9e684.toInt(), treeFieldKey(DETECTED_INFO_FIELD))
    }
}
