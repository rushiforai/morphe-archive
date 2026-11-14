/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.ads

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
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.comments.COMMENTS
import app.morphe.patches.threads.comments.MEDIA
import app.morphe.patches.threads.comments.MEDIA_EXT
import app.morphe.patches.threads.comments.PERMALINK_REPOSITORY
import app.morphe.patches.threads.comments.REPLIES_RESPONSE
import app.morphe.patches.threads.comments.RepliesParseFingerprint
import app.morphe.patches.threads.comments.TEXT_WITH_ENTITIES
import app.morphe.patches.threads.comments.THREAD
import app.morphe.patches.threads.comments.THREAD_ITEM
import app.morphe.patches.threads.comments.filterCommentsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The suggested threads switch of Hide suggested users on each declared build: the opened post's
 * parse hands the page's related threads to the extension right after reading them, into the
 * register it walks, the collector of the ones Threads fetches on their own does the same, and
 * Filter comments' hook on the replies beside them lands too, in either
 * order. A second related list, or a branch onto where the hook goes, is refused before anything
 * changes.
 */
class RelatedThreadsFixtureTest {
    @Test
    fun `each declared build hands an opened post's suggested threads to the extension`() {
        val call = ExtensionDex.classDef(SUGGESTED_THREADS).methods.single { it.name == "relatedThreads" }
        assertTrue(AccessFlags.STATIC.isSet(call.accessFlags) && AccessFlags.PUBLIC.isSet(call.accessFlags))
        assertEquals(RELATED_THREADS_CALL, "$SUGGESTED_THREADS->${call.name}(${call.parameterTypes.joinToString("")})${call.returnType}")

        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val where = build.name
            val stock = stockParse(build)
            val stockBody = stock.body()
            // Read apart from the patch: the answer's one list whose entries the parse reads as related threads.
            val read = stockBody.answerLists().single { stockBody.castsEntriesTo(it + 1) == RELATED_THREAD }
            assertEquals(where, Opcode.MOVE_RESULT_OBJECT, stockBody[read + 1].opcode)
            val list = (stockBody[read + 1] as OneRegisterInstruction).registerA

            val context = context(build)
            val found = context.relatedThreadsRead()
            assertEquals(where, read, found.read)
            assertEquals(where, list, found.list)
            hookRelatedThreads(found)

            val patched = context.mutable(stock).body()
            assertEquals(where, stockBody.size + 2, patched.size)
            // The range form, which reaches a list held above v15.
            val hook = patched[read + 2] as RegisterRangeInstruction
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals(where, RELATED_THREADS_CALL, hook.getReference<MethodReference>().toString())
            assertEquals(where, 1, hook.registerCount)
            assertEquals(where, list, hook.startRegister)
            assertEquals(where, Opcode.MOVE_RESULT_OBJECT, patched[read + 3].opcode)
            assertEquals(where, list, (patched[read + 3] as OneRegisterInstruction).registerA)
            assertEquals(where, stockBody.take(read + 2).map { it.kind() }, patched.take(read + 2).map { it.kind() })
            assertEquals(where, stockBody.drop(read + 2).map { it.kind() }, patched.drop(read + 4).map { it.kind() })
            // What the parse walks and casts is now the list the extension handed back.
            assertEquals(where, RELATED_THREAD, patched.castsEntriesTo(read + 3))
        }
    }

    @Test
    fun `filter comments and the suggested threads hook both land, in either order`() {
        for (build in Fixtures.declaredBuilds()) {
            for (filterFirst in listOf(true, false)) {
                RepliesParseFingerprint.clearMatch()
                val where = "${build.name}, filter comments ${if (filterFirst) "first" else "second"}"
                val stock = stockParse(build)
                val context = context(build)
                if (filterFirst) filterCommentsPatch.execute(context)
                hookRelatedThreads(context.relatedThreadsRead())
                if (!filterFirst) filterCommentsPatch.execute(context)

                val patched = context.mutable(stock).body()
                assertEquals(where, stock.body().size + 4, patched.size)
                val related = patched.indices.single { patched[it].calls(RELATED_THREADS_CALL) }
                val filter = patched.indices.single { patched[it].calls(FILTER) }
                // Each hook sits right after its own list's read, and each list is still walked as before.
                assertEquals(where, RELATED_THREAD, patched.castsEntriesTo(related + 1))
                assertEquals(where, THREAD, patched.castsEntriesTo(filter + 1))
                assertTrue(where, patched[related - 2].isAnswerList() && patched.castsEntriesTo(related - 1) == RELATED_THREAD)
                assertTrue(where, patched[filter - 2].isAnswerList() && patched.castsEntriesTo(filter - 1) == THREAD)
            }
        }
    }

    @Test
    fun `a second suggested threads list in the parse is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val context = context(build)
            val parse = context.mutable(stockParse(build))
            parse.addInstructions(
                0,
                """
                    invoke-interface/range { v0 .. v0 }, $REPLIES_RESPONSE->hushThreadsOther()$LIST
                    move-result-object v0
                    invoke-interface { v0 }, $LIST->iterator()Ljava/util/Iterator;
                    move-result-object v1
                    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v2
                    check-cast v2, $RELATED_THREAD
                """,
            )
            val error = assertThrows(build.name, PatchException::class.java) { context.relatedThreadsRead() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("suggested threads") &&
                error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertFalse(build.name, parse.body().any { it.calls(RELATED_THREADS_CALL) })
        }
    }

    @Test
    fun `a branch landing where the hook goes is refused`() {
        // The hook goes in front of the instruction after the related list's move-result-object. A
        // jump straight to that instruction would skip it, and that path would draw every card.
        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val context = context(build)
            val parse = context.mutable(stockParse(build))
            val body = parse.body()
            val read = body.answerLists().single { body.castsEntriesTo(it + 1) == RELATED_THREAD }
            parse.addInstructionsWithLabels(0, "goto/32 :after", ExternalLabel("after", parse.getInstruction(read + 2)))
            val error = assertThrows(build.name, PatchException::class.java) { context.relatedThreadsRead() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("lands right after the suggested threads"))
            assertFalse(build.name, parse.body().any { it.calls(RELATED_THREADS_CALL) })
        }
    }

    @Test
    fun `each declared build hands the suggested threads Threads fetches on their own to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val where = build.name
            // Read apart from the patch: the static call right after the parse casts a related thread
            // makes its row, and one emit among the classes holding the repository builds that row.
            val parseBody = stockParse(build).body()
            val row = parseBody.indices.filter {
                parseBody[it].opcode == Opcode.CHECK_CAST && parseBody[it].getReference<TypeReference>()?.type == RELATED_THREAD
            }.map { parseBody[it + 1].getReference<MethodReference>()!!.returnType }.single()
            val stock = RelatedThreadsFetchFixture.classes(build).flatMap { it.methods }.single { method ->
                method.name == "emit" && method.body().any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == row }
            }
            val stockBody = stock.body()
            val read = stockBody.indices.single {
                stockBody[it].opcode == Opcode.IGET_OBJECT && stockBody[it].getReference<FieldReference>()?.type == LIST
            }
            val list = (stockBody[read] as OneRegisterInstruction).registerA

            val context = context(build)
            val found = context.relatedThreadsFetch()
            assertEquals(where, stock.toString(), found.method.toString())
            assertEquals(where, read, found.read)
            assertEquals(where, list, found.list)
            hookRelatedThreadsFetch(found)

            val patched = context.mutable(stock).body()
            assertEquals(where, stockBody.size + 2, patched.size)
            val hook = patched[read + 1] as RegisterRangeInstruction
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals(where, RELATED_THREADS_CALL, hook.getReference<MethodReference>().toString())
            assertEquals(where, 1, hook.registerCount)
            assertEquals(where, list, hook.startRegister)
            assertEquals(where, Opcode.MOVE_RESULT_OBJECT, patched[read + 2].opcode)
            assertEquals(where, list, (patched[read + 2] as OneRegisterInstruction).registerA)
            assertEquals(where, stockBody.take(read + 1).map { it.kind() }, patched.take(read + 1).map { it.kind() })
            assertEquals(where, stockBody.drop(read + 1).map { it.kind() }, patched.drop(read + 3).map { it.kind() })
            // What the collector walks into rows is now the list the extension handed back.
            val walk = (read + 3 until patched.size).first { patched[it].calls("$LIST->iterator()Ljava/util/Iterator;") }
            assertEquals(where, list, patched[walk].receiver())
        }
    }

    @Test
    fun `a second collector building suggested thread rows is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val type = context(build).relatedThreadsFetch().method.definingClass
            val stock = RelatedThreadsFetchFixture.classes(build).single { it.type == type }
            val copy = "Lapp/morphe/hushthreads/test/SecondCollector;"
            val second = ImmutableClassDef(
                copy, stock.accessFlags, stock.superclass, stock.interfaces, stock.sourceFile, stock.annotations,
                stock.fields.map { ImmutableField(copy, it.name, it.type, it.accessFlags, null, null, null) },
                stock.methods.map {
                    ImmutableMethod(copy, it.name, it.parameters, it.returnType, it.accessFlags, it.annotations,
                        it.hiddenApiRestrictions, it.implementation)
                },
            )
            RepliesParseFingerprint.clearMatch()
            val doubled = PatchContexts.of(
                (ExtensionDex.classes() + classes(build).values + RelatedThreadsFetchFixture.classes(build) + second).distinctBy { it.type },
            )
            val error = assertThrows(build.name, PatchException::class.java) { doubled.relatedThreadsFetch() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("fetched suggested threads") &&
                error.message.orEmpty().contains("expected exactly one match, found 2"))
        }
    }

    @Test
    fun `a branch landing where the fetch hook goes is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            RepliesParseFingerprint.clearMatch()
            val context = context(build)
            val found = context.relatedThreadsFetch()
            val collector = found.method
            collector.addInstructionsWithLabels(0, "goto/32 :after", ExternalLabel("after", collector.getInstruction(found.read + 1)))
            RepliesParseFingerprint.clearMatch()
            val error = assertThrows(build.name, PatchException::class.java) { context.relatedThreadsFetch() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("lands right after the fetched suggested threads"))
            assertFalse(build.name, collector.body().any { it.calls(RELATED_THREADS_CALL) })
        }
    }

    /** The answer's no-argument calls answering a List. */
    private fun List<Instruction>.answerLists() = indices.filter { this[it].isAnswerList() }

    private fun Instruction.isAnswerList() = getReference<MethodReference>()?.let {
        it.definingClass == REPLIES_RESPONSE && it.parameterTypes.isEmpty() && it.returnType == LIST
    } == true

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

    private fun stockParse(build: File): Method = classes(build).getValue(PERMALINK_REPOSITORY).methods.single { it.isParse() }

    /** A method taking the answer, the repository, two objects and two flags, and answering an object. */
    private fun Method.isParse() = returnType.startsWith("L") && parameterTypes.size == 6 &&
        parameterTypes[0] == REPLIES_RESPONSE && parameterTypes[1] == PERMALINK_REPOSITORY &&
        parameterTypes.drop(2).map { it.first() } == listOf('L', 'L', 'Z', 'Z')

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    /** The opcode, with a goto of any width read as one: the inserted instructions can widen a goto. */
    private fun Instruction.kind() = when (opcode) {
        Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
        else -> opcode
    }

    private fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).findMutableMethodOf(method)

    private fun context(build: File) = PatchContexts.of(
        (ExtensionDex.classes() + classes(build).values + RelatedThreadsFetchFixture.classes(build)).distinctBy { it.type },
    )

    private fun classes(build: File): Map<String, ClassDef> = fixtures.getOrPut(build) { FixtureDex.classes(build, TYPES) }

    private companion object {
        const val LIST = "Ljava/util/List;"
        const val FILTER = "$COMMENTS->filter($LIST)$LIST"

        /** Filter comments' types too, so both patches run on one copy. */
        val TYPES = setOf(PERMALINK_REPOSITORY, REPLIES_RESPONSE, THREAD, THREAD_ITEM, MEDIA, TEXT_WITH_ENTITIES, MEDIA_EXT)

        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<Map<String, ClassDef>>()
    }
}

/**
 * Every class of a build holding the permalink repository in an instance field: where the patch
 * looks for the collector of the suggested threads Threads fetches on their own, so a test context
 * carries all the candidates the patch weighs and not just the one it should pick.
 */
internal object RelatedThreadsFetchFixture {
    private val loaded = PerBuild<List<ClassDef>>()

    fun classes(build: File): List<ClassDef> = loaded.getOrPut(build) {
        val found = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) {
                if (classDef.fields.any { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == PERMALINK_REPOSITORY }) {
                    found += ImmutableClassDef.of(classDef)
                }
            }
        }
        found.distinctBy { it.type }
    }
}
