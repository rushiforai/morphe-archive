/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.comments

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Filter comments on each declared build: the opened post's parse hands the answer's reply list to
 * the extension right after reading it, into the register it iterates, and the four reads the
 * extension needs are written in from getters Threads can actually call. A second reply list or a
 * second caption helper is refused before anything changes.
 */
class FilterCommentsFixtureTest {
    @Test
    fun `each declared build filters an opened post's reply list and fills the four reads`() {
        val filter = ExtensionDex.classDef(COMMENTS).methods.single { it.name == "filter" && it.parameterTypes.size == 1 }
        assertTrue(AccessFlags.STATIC.isSet(filter.accessFlags) && AccessFlags.PUBLIC.isSet(filter.accessFlags))
        assertEquals(LIST, filter.parameterTypes.joinToString(""))
        assertEquals(LIST, filter.returnType)

        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val where = build.name
            val classes = classes(build)
            assertEquals("$where: kept types", TYPES, classes.keys)

            // Read apart from the patch: the repository's one parse of an opened post's answer. A
            // void method beside it takes the same answer and repository but answers no state.
            val parses = classes.getValue(PERMALINK_REPOSITORY).methods.filter { it.isParse() }
            assertEquals("$where: parses of the answer", 1, parses.size)
            val stock = parses.single()
            val stockBody = stock.body()
            // Its calls for one of the answer's lists, and the one whose entries it reads as replies.
            val listCalls = stockBody.indices.filter { i ->
                stockBody[i].getReference<MethodReference>()?.let {
                    it.definingClass == REPLIES_RESPONSE && it.parameterTypes.isEmpty() && it.returnType == LIST
                } == true
            }
            assertTrue("$where: list calls on the answer", listCalls.isNotEmpty())
            val replyCalls = listCalls.filter { stockBody.castsEntriesTo(it + 1) == THREAD }
            assertEquals("$where: reply list calls", 1, replyCalls.size)
            val site = replyCalls.single()
            val kept = stockBody[site + 1]
            assertEquals(where, Opcode.MOVE_RESULT_OBJECT, kept.opcode)
            val list = (kept as OneRegisterInstruction).registerA

            // The four getters, each the only one of its shape and each one the extension may call.
            val threadList = classes.getValue(THREAD).methods.single { it.parameterTypes.isEmpty() && it.returnType == LIST }
            val itemMedia = classes.getValue(THREAD_ITEM).methods.single { it.parameterTypes.isEmpty() && it.returnType == MEDIA }
            val mediaText = classes.getValue(MEDIA).methods.single {
                it.parameterTypes.isEmpty() && it.returnType == TEXT_WITH_ENTITIES && !AccessFlags.STATIC.isSet(it.accessFlags)
            }
            val textBody = classes.getValue(TEXT_WITH_ENTITIES).methods.single { it.parameterTypes.isEmpty() && it.returnType == STRING }
            val captions = classes.getValue(MEDIA_EXT).methods.filter {
                AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == STRING &&
                    it.parameterTypes.joinToString("") == MEDIA && it.readsGetterThenString()
            }
            assertEquals("$where: caption helpers", 1, captions.size)
            val caption = captions.single()
            for (method in listOf(threadList, itemMedia, mediaText, textBody, caption)) {
                assertTrue("$where: ${method.signature()} is public", AccessFlags.PUBLIC.isSet(method.accessFlags))
            }

            val context = context(build)
            assertEquals(where, 0, status(context))
            filterCommentsPatch.execute(context)

            val patched = context.mutable(stock).body()
            assertEquals(where, stockBody.size + 2, patched.size)
            // The range form, which reaches a list held above v15.
            val hook = patched[site + 2] as RegisterRangeInstruction
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals(where, FILTER, hook.getReference<MethodReference>().toString())
            assertEquals(where, 1, hook.registerCount)
            assertEquals(where, list, hook.startRegister)
            assertEquals(where, Opcode.MOVE_RESULT_OBJECT, patched[site + 3].opcode)
            assertEquals(where, list, (patched[site + 3] as OneRegisterInstruction).registerA)
            assertEquals(where, stockBody.take(site + 2).map { it.kind() }, patched.take(site + 2).map { it.kind() })
            assertEquals(where, stockBody.drop(site + 2).map { it.kind() }, patched.drop(site + 4).map { it.kind() })
            // What the parse iterates and casts is now the list the extension handed back.
            assertEquals(where, THREAD, patched.castsEntriesTo(site + 3))

            assertEquals(where, listOf("$THREAD->${threadList.name}()$LIST"), context.stubCalls("threadItems"))
            assertEquals(where, listOf("$THREAD_ITEM->${itemMedia.name}()$MEDIA"), context.stubCalls("itemMedia"))
            assertEquals(
                where,
                listOf("$MEDIA->${mediaText.name}()$TEXT_WITH_ENTITIES", "$TEXT_WITH_ENTITIES->${textBody.name}()$STRING"),
                context.stubCalls("mediaText"),
            )
            assertEquals(where, listOf("$MEDIA_EXT->${caption.name}($MEDIA)$STRING"), context.stubCalls("mediaCaption"))
            assertEquals(where, 1, status(context))
        }
    }

    @Test
    fun `a second reply list in the parse is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val context = context(build)
            val parse = context.mutable(stockParse(build))
            parse.addInstructions(
                0,
                """
                    invoke-interface { v0 }, $REPLIES_RESPONSE->hushThreadsOther()$LIST
                    move-result-object v0
                    invoke-interface { v0 }, $LIST->iterator()Ljava/util/Iterator;
                    move-result-object v1
                    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v2
                    check-cast v2, $THREAD
                """,
            )
            val error = assertThrows(build.name, PatchException::class.java) { filterCommentsPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("reply list") &&
                error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertUntouched(build.name, context, parse)
        }
    }

    @Test
    fun `a second reply list read through range invokes is refused, not crashed on`() {
        // A list or iterator held above v15 is called through the /range form, which the search
        // has to read as well as the five-register one.
        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val context = context(build)
            val parse = context.mutable(stockParse(build))
            parse.addInstructions(
                0,
                """
                    invoke-interface/range { v0 .. v0 }, $REPLIES_RESPONSE->hushThreadsOther()$LIST
                    move-result-object v0
                    invoke-interface/range { v0 .. v0 }, $LIST->iterator()Ljava/util/Iterator;
                    move-result-object v1
                    invoke-interface/range { v1 .. v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v2
                    check-cast v2, $THREAD
                """,
            )
            val error = assertThrows(build.name, PatchException::class.java) { filterCommentsPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertUntouched(build.name, context, parse)
        }
    }

    @Test
    fun `a branch landing where the hook goes is refused`() {
        // The hook goes in front of the instruction after the reply list's move-result-object. A
        // jump straight to that instruction would skip it, and that path would see every reply.
        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val context = context(build)
            val parse = context.mutable(stockParse(build))
            val body = parse.body()
            val site = body.indices.single { i ->
                body[i].getReference<MethodReference>()?.let {
                    it.definingClass == REPLIES_RESPONSE && it.parameterTypes.isEmpty() && it.returnType == LIST
                } == true && body.castsEntriesTo(i + 1) == THREAD
            }
            parse.addInstructionsWithLabels(0, "goto/32 :after", ExternalLabel("after", parse.getInstruction(site + 2)))
            val error = assertThrows(build.name, PatchException::class.java) { filterCommentsPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("lands right after the reply list"))
            assertUntouched(build.name, context, parse)
        }
    }

    @Test
    fun `a second caption helper is refused before any stub is written`() {
        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val context = context(build)
            val helpers = context.mutableClassDefBy(MEDIA_EXT)
            val caption = helpers.methods.single {
                AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == STRING &&
                    it.parameterTypes.joinToString("") == MEDIA && it.readsGetterThenString()
            }
            helpers.methods.add(
                ImmutableMethod(
                    caption.definingClass, "hushThreadsOther", caption.parameters, caption.returnType,
                    caption.accessFlags, caption.annotations, caption.hiddenApiRestrictions, caption.implementation,
                ).toMutable(),
            )
            val error = assertThrows(build.name, PatchException::class.java) { filterCommentsPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("caption helper") &&
                error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertUntouched(build.name, context, context.mutable(stockParse(build)))
        }
    }

    /** Nothing changed: the switch's status is off, the parse calls no filter and every stub is still empty. */
    private fun assertUntouched(where: String, context: BytecodePatchContext, parse: Method) {
        assertEquals(where, 0, status(context))
        assertFalse(where, parse.body().any { it.getReference<MethodReference>()?.toString() == FILTER })
        for (stub in listOf("threadItems", "itemMedia", "mediaText", "mediaCaption")) {
            assertEquals("$where: $stub", emptyList<String>(), context.stubCalls(stub))
        }
    }

    /**
     * What the list the `move-result-object` at [result] holds is read as, found the long way: the
     * iterator made from that register within the next twenty instructions, and the first type its
     * next entry is cast to within twenty more.
     */
    private fun List<Instruction>.castsEntriesTo(result: Int): String? {
        val list = (getOrNull(result) as? OneRegisterInstruction)?.registerA ?: return null
        val iterator = (result + 1 until minOf(size, result + 20)).firstOrNull {
            this[it].calls("$LIST->iterator()Ljava/util/Iterator;") && this[it].receiver() == list
        } ?: return null
        val iteratorRegister = (getOrNull(iterator + 1) as? OneRegisterInstruction)?.registerA ?: return null
        val next = (iterator + 1 until minOf(size, iterator + 20)).firstOrNull {
            this[it].calls("Ljava/util/Iterator;->next()Ljava/lang/Object;") && this[it].receiver() == iteratorRegister
        } ?: return null
        val entry = (getOrNull(next + 1) as? OneRegisterInstruction)?.registerA ?: return null
        val cast = (next + 1 until minOf(size, next + 20)).firstOrNull {
            this[it].opcode == Opcode.CHECK_CAST && (this[it] as OneRegisterInstruction).registerA == entry
        } ?: return null
        return this[cast].getReference<TypeReference>()?.type
    }

    private fun Instruction.calls(signature: String) = getReference<MethodReference>()?.toString() == signature

    /** The register an invoke is made on, in its five-register or its range form. */
    private fun Instruction.receiver(): Int? = when (this) {
        is FiveRegisterInstruction -> registerC
        is RegisterRangeInstruction -> startRegister
        else -> null
    }

    /** The app methods the stub [name] calls, in order: none while it's the extension's empty stub. */
    private fun BytecodePatchContext.stubCalls(name: String): List<String> {
        val stub = mutableClassDefBy(COMMENTS).methods.single { it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) }
        assertNotNull(stub.implementation)
        return stub.body().mapNotNull { it.getReference<MethodReference>()?.toString() }
    }

    private fun stockParse(build: File): Method = classes(build).getValue(PERMALINK_REPOSITORY).methods.single { it.isParse() }

    /** A method taking the answer, the repository, two objects and two flags, and answering an object. */
    private fun Method.isParse() = returnType.startsWith("L") && parameterTypes.size == 6 &&
        parameterTypes[0] == REPLIES_RESPONSE && parameterTypes[1] == PERMALINK_REPOSITORY &&
        parameterTypes.drop(2).map { it.first() } == listOf('L', 'L', 'Z', 'Z')

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    /**
     * The opcode, with a goto of any width read as one: the two inserted instructions can push a
     * branch past a plain goto's reach, and dexlib2 then writes it as goto/16 (454's parse does).
     */
    private fun Instruction.kind() = when (opcode) {
        Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
        else -> opcode
    }

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).findMutableMethodOf(method)

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + classes(build).values)

    private fun classes(build: File): Map<String, ClassDef> = fixtures.getOrPut(build) { FixtureDex.classes(build, TYPES) }

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "filterComments" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private companion object {
        const val LIST = "Ljava/util/List;"
        const val STRING = "Ljava/lang/String;"
        const val FILTER = "$COMMENTS->filter($LIST)$LIST"
        val TYPES = setOf(PERMALINK_REPOSITORY, REPLIES_RESPONSE, THREAD, THREAD_ITEM, MEDIA, TEXT_WITH_ENTITIES, MEDIA_EXT)

        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<Map<String, ClassDef>>()
    }
}
