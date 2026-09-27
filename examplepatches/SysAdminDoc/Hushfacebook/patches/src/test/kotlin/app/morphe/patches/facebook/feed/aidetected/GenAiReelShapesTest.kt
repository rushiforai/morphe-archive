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
import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.reels.FB_USER_SESSION
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of the Reels side of Hide AI-detected posts that need no Facebook build: how the
 * attribution finder is picked out of the methods holding the type name, the shapes the finder
 * and Facebook's label decision are held to, and the stub the patch fills. Each rule has a control
 * that must fail it.
 */
class GenAiReelShapesTest {
    private val model = "Lfixture/ReelModel;"
    private val attribution = "Lfixture/Attribution;"
    private val finderClass = "Lfixture/Attributions;"
    private val finder = "$finderClass->find($model" + "Ljava/lang/String;)$attribution"
    private val other = "Lfixture/Other;->find($model" + "Ljava/lang/String;)$attribution"
    private val text = "$finderClass->label($model" + "Ljava/lang/String;)Ljava/lang/String;"

    private fun method(
        name: String,
        parameters: List<String>,
        returnType: String,
        registers: Int,
        static: Boolean,
        smali: String,
        definingClass: String = "Lfixture/Holder;",
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

    private fun holder(smali: String) = method("build", listOf(model), "V", 6, static = true, smali = smali)

    /** A holder that loads the literal and hands it to [call] beside the model. */
    private fun handsTo(call: String) = holder(
        """
            const-string v1, "$TRANSPARENCY_ATTRIBUTION"
            invoke-static { p0, v1 }, $call
            move-result-object v0
            return-void
        """,
    )

    @Test
    fun `a static call handed the literal as its String is a finder call, a comparison is not`() {
        assertEquals(listOf(finder), finderCalls(handsTo(finder)).map { it.toString() })

        val compares = holder(
            """
                const-string v1, "$TRANSPARENCY_ATTRIBUTION"
                invoke-virtual { v1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                return-void
            """,
        )
        assertEquals(emptyList<String>(), finderCalls(compares).map { it.toString() })

        // The literal's register written again before the call: the call reads something else.
        val overwritten = holder(
            """
                const-string v1, "$TRANSPARENCY_ATTRIBUTION"
                const/4 v1, 0x0
                invoke-static { p0, v1 }, $finder
                move-result-object v0
                return-void
            """,
        )
        assertEquals(emptyList<String>(), finderCalls(overwritten).map { it.toString() })

        // A range invoke passes the literal too, and the literal in a place that isn't a String is no finder call.
        val range = holder(
            """
                const-string v1, "$TRANSPARENCY_ATTRIBUTION"
                move-object v0, p0
                invoke-static/range { v0 .. v1 }, $finder
                move-result-object v0
                return-void
            """,
        )
        assertEquals(listOf(finder), finderCalls(range).map { it.toString() })
        val logged = holder(
            """
                const-string v1, "$TRANSPARENCY_ATTRIBUTION"
                invoke-static { v1 }, Lfixture/Log;->note(Ljava/lang/Object;)V
                return-void
            """,
        )
        assertEquals("a call taking the literal as an Object", emptyList<String>(), finderCalls(logged).map { it.toString() })
    }

    @Test
    fun `the finder is the one method every holder hands the literal to`() {
        val found = attributionFinder(listOf(handsTo(finder), handsTo(finder)))
        assertNull(found.problem, found.problem)
        assertEquals(finder, found.call.toString())

        val two = attributionFinder(listOf(handsTo(finder), handsTo(other)))
        assertNull(two.call)
        assertTrue(two.problem, two.problem.orEmpty().contains("2 static methods"))

        val none = attributionFinder(listOf(holder("return-void")))
        assertNull(none.call)
        assertTrue(none.problem, none.problem.orEmpty().contains(TRANSPARENCY_ATTRIBUTION))

        // A helper answering text, such as the label's string, isn't the finder.
        val label = attributionFinder(listOf(handsTo(text)))
        assertNull(label.call)
        assertTrue(label.problem, label.problem.orEmpty().contains("answering a model"))
    }

    /** A method of [owner] handing the literal to the extension's stub, as the reel filter's own code does. */
    private fun handsToStub(owner: String) = method(
        "lambda", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", 3, static = true,
        smali = """
            const-string v0, "$TRANSPARENCY_ATTRIBUTION"
            invoke-static { p0, v0 }, $GEN_AI_REEL_FILTER->$ATTRIBUTION_STUB(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """,
        definingClass = owner,
    )

    /**
     * The patcher searches the APK with the extension merged in, and the extension hands the same
     * literal to its stub. That hand-off isn't a second finder; the same code in one of Facebook's
     * classes would be, which is the control.
     */
    @Test
    fun `the extension handing the literal to its own stub isn't a second finder`() {
        val merged = attributionFinder(listOf(handsTo(finder), handsToStub(GEN_AI_REEL_FILTER)))
        assertNull(merged.problem, merged.problem)
        assertEquals(finder, merged.call.toString())

        val facebooks = attributionFinder(listOf(handsTo(finder), handsToStub("Lfixture/Other;")))
        assertNull(facebooks.call)
        assertTrue(facebooks.problem, facebooks.problem.orEmpty().contains("2 static methods"))
    }

    private fun finderBody(typeName: String = "getTypeName", equals: String = "Ljava/lang/String;->equals(Ljava/lang/Object;)Z") = """
        invoke-interface { p0 }, Lfixture/ReelModel;->attributions()Ljava/util/List;
        move-result-object v2
        const/4 v1, 0x0
        invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
        move-result-object v0
        check-cast v0, $attribution
        invoke-interface { v0 }, $attribution->$typeName()Ljava/lang/String;
        move-result-object v1
        invoke-virtual { p1, v1 }, $equals
        move-result v1
        if-eqz v1, :none
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
    """

    @Test
    fun `the finder has to pick an attribution by its type name`() {
        val shape = method("find", listOf(model, "Ljava/lang/String;"), attribution, 5, static = true, smali = finderBody(), definingClass = finderClass)
        assertTrue(isAttributionFinder(shape))

        assertFalse("an instance method", isAttributionFinder(
            method("find", listOf(model, "Ljava/lang/String;"), attribution, 5, static = false, smali = finderBody(), definingClass = finderClass)))
        assertFalse("answers text", isAttributionFinder(
            method("find", listOf(model, "Ljava/lang/String;"), "Ljava/lang/String;", 5, static = true, smali = finderBody(), definingClass = finderClass)))
        assertFalse("no getTypeName", isAttributionFinder(
            method("find", listOf(model, "Ljava/lang/String;"), attribution, 5, static = true, smali = finderBody(typeName = "getId"), definingClass = finderClass)))
        assertFalse("no String.equals", isAttributionFinder(
            method("find", listOf(model, "Ljava/lang/String;"), attribution, 5, static = true,
                smali = finderBody(equals = "Lfixture/Text;->same(Ljava/lang/Object;)Z"), definingClass = finderClass)))
        assertFalse("another parameter list", isAttributionFinder(
            method("find", listOf(model, "Ljava/lang/String;", "Ljava/lang/String;"), attribution, 6, static = true,
                smali = finderBody(), definingClass = finderClass)))
    }

    private fun decisionBody(key: Int = treeFieldKey(DETECTED_FLAG), reader: String = "$TREE_JNI->getBooleanValue(I)Z") = """
        const v0, $key
        invoke-virtual { p1, v0 }, $reader
        move-result v0
        return v0
    """

    private fun decision(parameters: List<String> = listOf(FB_USER_SESSION, attribution, model), static: Boolean = true, smali: String = decisionBody()) =
        method("shows", parameters, "Z", 4, static, smali, definingClass = "Lfixture/Decision;")

    @Test
    fun `the label decision reads the detected flag on the attribution through TreeJNI`() {
        assertTrue(readsReelDetectedFlag(decision(), attribution, model))

        assertFalse("another flag", readsReelDetectedFlag(decision(smali = decisionBody(key = 0x1234)), attribution, model))
        assertFalse("another reader", readsReelDetectedFlag(
            decision(smali = decisionBody(reader = "Lfixture/Attribution;->getBooleanValue(I)Z")), attribution, model))
        assertFalse("the model and the attribution swapped", readsReelDetectedFlag(
            decision(parameters = listOf(FB_USER_SESSION, model, attribution)), attribution, model))
        assertFalse("no session", readsReelDetectedFlag(decision(parameters = listOf(attribution, model)), attribution, model))
        assertFalse("an instance method", readsReelDetectedFlag(decision(static = false), attribution, model))
        assertFalse("another attribution type", readsReelDetectedFlag(decision(), "Lfixture/Chip;", model))
    }

    private fun tree(vararg methods: Method): ClassDef =
        ImmutableClassDef(TREE_JNI, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, methods.toList())

    private fun reader(name: String, flags: Int, parameter: String = "I", returnType: String = "Z") = ImmutableMethod(
        TREE_JNI, name, listOf(ImmutableMethodParameter(parameter, null, null)), returnType, flags, null, null, null,
    )

    /** The extension reads these by reflection, so each has to be there, public and an instance member. */
    @Test
    fun `the readers the extension reflects on have to be public instance members`() {
        val publicFinal = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
        assertTrue(hasPublicIntReader(tree(reader(TREE_BOOLEAN_READER, publicFinal)), TREE_BOOLEAN_READER))
        assertTrue(hasPublicIntReader(tree(reader(TREE_FIELD_CHECK, publicFinal)), TREE_FIELD_CHECK))
        assertFalse("missing", hasPublicIntReader(tree(), TREE_BOOLEAN_READER))
        assertFalse("private", hasPublicIntReader(tree(reader(TREE_BOOLEAN_READER, AccessFlags.PRIVATE.value)), TREE_BOOLEAN_READER))
        assertFalse("static", hasPublicIntReader(
            tree(reader(TREE_BOOLEAN_READER, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)), TREE_BOOLEAN_READER))
        assertFalse("takes a String", hasPublicIntReader(
            tree(reader(TREE_BOOLEAN_READER, publicFinal, parameter = "Ljava/lang/String;")), TREE_BOOLEAN_READER))
        assertFalse("answers an int", hasPublicIntReader(tree(reader(TREE_BOOLEAN_READER, publicFinal, returnType = "I")), TREE_BOOLEAN_READER))
    }

    /** The stub as a hand-built class: `static Object transparencyAttribution([parameters])`. */
    private fun stub(registers: Int, parameters: List<String> = listOf("Ljava/lang/Object;", "Ljava/lang/String;")): ClassDef {
        val method = method(
            ATTRIBUTION_STUB, parameters, "Ljava/lang/Object;", registers, static = true,
            smali = "const/4 v0, 0x0\nreturn-object v0", definingClass = GEN_AI_REEL_FILTER,
        )
        return ImmutableClassDef(GEN_AI_REEL_FILTER, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, listOf(method))
    }

    private val Instruction.call get() = ((this as ReferenceInstruction).reference as MethodReference).toString()

    /** The filled stub's body, and the registers its range call hands the finder. */
    private fun filled(classes: List<ClassDef>): Pair<List<Instruction>, IntRange> {
        val context = PatchContexts.of(classes)
        context.fillFinderStub(GEN_AI_REEL_FILTER, ATTRIBUTION_STUB, attributionFinder(listOf(handsTo(finder))).call!!)
        val method = context.mutableClassDefBy(GEN_AI_REEL_FILTER).methods.single { it.name == ATTRIBUTION_STUB }
        val body = method.implementation!!.instructions.toList()
        val range = body[1] as RegisterRangeInstruction
        return body to (range.startRegister until range.startRegister + range.registerCount)
    }

    /**
     * The fill reads only the stub's two parameters: the model cast to the finder's own parameter
     * type, then both handed to the finder as a range. A stub with no local at all takes it, which
     * is what the compiled extension carries.
     */
    @Test
    fun `the stub is filled with a cast and the finder call, through its parameters alone`() {
        for (registers in listOf(2, 3, 20)) {
            val (body, passed) = filled(listOf(stub(registers)))
            assertEquals(
                listOf(Opcode.CHECK_CAST, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                body.take(4).map { it.opcode },
            )
            assertEquals("the model is cast to the finder's own parameter type", model,
                ((body[0] as ReferenceInstruction).reference as TypeReference).type)
            assertEquals(finder, body[1].call)
            assertEquals("$registers registers: the finder gets the two parameters", (registers - 2) until registers, passed)
            assertEquals("the cast is of the model", registers - 2, (body[0] as OneRegisterInstruction).registerA)
        }
    }

    /**
     * The regression: the fill used to load the type name into a local of its own, and the stub R8
     * compiles keeps none (its marker goes in the parameter it never reads), so the patch stopped on
     * both fixture builds. The stub has to take the fill as the bundle carries it.
     */
    @Test
    fun `the stub the bundle carries takes the fill`() {
        val (body, passed) = filled(listOf(ExtensionDex.classDef(GEN_AI_REEL_FILTER)))
        assertEquals(finder, body[1].call)
        assertEquals(2, passed.count())
    }

    /** The extension hands the finder the type name the patch found it by, and reads the flag the patch checked. */
    @Test
    fun `the extension names the attribution and the flag the patch holds the build to`() {
        assertEquals(TRANSPARENCY_ATTRIBUTION, ExtensionDex.stringConstant(GEN_AI_REEL_FILTER, "ATTRIBUTION_TYPE"))
        assertEquals(DETECTED_FLAG, ExtensionDex.stringConstant(GEN_AI_REEL_FILTER, "DETECTED_FLAG"))
    }

    /** A stub of another shape, such as the one-parameter stub before the name moved into it, stops the patch. */
    @Test
    fun `a stub without the name parameter stops the patch`() {
        val context = PatchContexts.of(listOf(stub(registers = 2, parameters = listOf("Ljava/lang/Object;"))))
        val refused = assertThrows(PatchException::class.java) {
            context.fillFinderStub(GEN_AI_REEL_FILTER, ATTRIBUTION_STUB, attributionFinder(listOf(handsTo(finder))).call!!)
        }
        assertTrue(refused.message, refused.message.orEmpty().contains("(Object, String)"))
    }
}
