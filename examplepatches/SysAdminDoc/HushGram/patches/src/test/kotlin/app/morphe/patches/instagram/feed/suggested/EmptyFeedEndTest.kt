/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.feed.suggested

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class EmptyFeedEndTest {
    private val adapter = "Lfixture/MainFeedAdapter;"
    private val feed = "Lfixture/Feed;"
    private val ended = "$feed->ended:Z"

    private val following = "Lfixture/FeedState;"

    @Test
    fun theHooksAreInTheExtension() {
        val declared = ExtensionDex.classDef(FEED_ENDED.substringBefore("->")).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        for (hook in listOf(FEED_ENDED, END_CARD_RULE, MORE_AFTER_FOLLOWING)) assertTrue("$hook is not in the extension: $declared", hook.substringAfter("->") in declared)
    }

    /**
     * The row's show check asks the extension whether its feed pages as Following's right after
     * comparing the source, and about a next page right after asking the question isLoading()
     * shares with it. Nothing else it asks goes past the extension.
     */
    @Test
    fun theEndCardRulesQuestionsGoPastTheExtension() {
        val context = PatchContexts.of(listOf(followingState(), feedNames()))

        context.endFollowingAtItsCard()

        val shows = context.classDefBy(following).methods.single { it.name == "shows" }.implementation!!.instructions.toList()
        for ((question, hook) in listOf("Ljava/lang/String;->equals(Ljava/lang/Object;)Z" to END_CARD_RULE,
            "$following->hasMore()Z" to MORE_AFTER_FOLLOWING)) {
            val asked = shows.indexOfFirst { it.calls(question) }
            val answer = (shows[asked + 1] as OneRegisterInstruction).registerA
            val call = shows[asked + 2]
            assertTrue("$hook right after the answer", call.calls(hook))
            assertEquals("the answer", answer, (call as RegisterRangeInstruction).startRegister)
            assertEquals(Opcode.MOVE_RESULT, shows[asked + 3].opcode)
            assertEquals(answer, (shows[asked + 3] as OneRegisterInstruction).registerA)
            assertEquals("$hook once", 1, shows.count { it.calls(hook) })
        }
        val loading = context.classDefBy(following).methods.single { it.name == "isLoading" }.implementation!!.instructions
        assertTrue("isLoading is left", loading.none { it.calls(MORE_AFTER_FOLLOWING) })
    }

    @Test
    fun anIsLoadingSharingNoQuestionFailsThePatch() {
        val context = PatchContexts.of(listOf(followingState(shared = false), feedNames()))
        assertThrows(PatchException::class.java) { context.endFollowingAtItsCard() }
    }

    /**
     * The flag is the last boolean read before the loading row, not an earlier one, and every read
     * of it in the adapter goes past the extension, the one in its empty check too.
     */
    @Test
    fun everyReadOfTheFlagGoesPastTheExtension() {
        val context = PatchContexts.of(listOf(adapter()))

        val end = context.findFeedEnd()
        assertEquals(adapter, end.adapter)
        assertEquals(ended, end.flag.toString())
        context.endEmptiedFeed(end)

        for (name in listOf("buildModels", "isEmptyFeed")) {
            val code = context.code(name)
            val read = code.indexOfFirst { it.reads(ended) }
            val hook = code[read + 1]
            assertTrue("$name: right after the read", hook.calls(FEED_ENDED))
            val flag = (code[read] as TwoRegisterInstruction).registerA
            assertEquals("$name: the flag", flag, (hook as RegisterRangeInstruction).startRegister)
            assertEquals(Opcode.MOVE_RESULT, code[read + 2].opcode)
            assertEquals(flag, (code[read + 2] as OneRegisterInstruction).registerA)
            assertEquals("$name: hooked once", 1, code.count { it.calls(FEED_ENDED) })
        }
        val other = context.code("buildModels").indexOfFirst { it.reads("$feed->other:Z") }
        assertTrue("the other flag is left", !context.code("buildModels")[other + 1].calls(FEED_ENDED))
    }

    @Test
    fun aBuilderThatDoesntAskWhetherTheFeedIsEmptyFailsThePatch() {
        val context = PatchContexts.of(listOf(adapter(asks = false)))
        assertThrows(PatchException::class.java) { context.findFeedEnd() }
    }

    @Test
    fun twoBuildersFailThePatch() {
        val context = PatchContexts.of(listOf(adapter(), adapter("Lfixture/SecondAdapter;")))
        assertThrows(PatchException::class.java) { context.findFeedEnd() }
    }

    /**
     * In each declared build the home feed adapter reads its flag twice, in its model builder and its
     * empty check, and both reads go past the extension. On 449 that's LX/00pR reading LX/00pT;->A02:Z
     * in A16 and A1F.
     */
    @Test
    fun eachDeclaredBuildEndsTheEmptiedFeed() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        var checked = 0
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val classes = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.methods.any { it.holds(BUILD_MODELS) || it.holds(FOLLOWING_FEED) }) classes += ImmutableClassDef.of(classDef)
                    }
                }
                val context = PatchContexts.of(classes.distinctBy { it.type })

                val end = context.findFeedEnd()
                context.endEmptiedFeed(end)

                val reads = context.classDefBy(end.adapter).methods.flatMap { method ->
                    val code = method.implementation?.instructions?.toList().orEmpty()
                    code.indices.filter { code[it].reads(end.flag.toString()) }.map { code to it }
                }
                assertEquals("${bundle.name}: ${end.adapter} reads ${end.flag}", 2, reads.size)
                for ((code, at) in reads) {
                    assertTrue("${bundle.name}: right after the read", code[at + 1].calls(FEED_ENDED))
                    assertEquals(Opcode.MOVE_RESULT, code[at + 2].opcode)
                }

                context.endFollowingAtItsCard()
                for (hook in listOf(END_CARD_RULE, MORE_AFTER_FOLLOWING)) {
                    val asked = classes.map { it.type }.distinct().flatMap { type ->
                        context.classDefBy(type).methods.flatMap { method ->
                            val code = method.implementation?.instructions?.toList().orEmpty()
                            code.indices.filter { code[it].calls(hook) }.map { Triple(method, code, it) }
                        }
                    }
                    assertEquals("${bundle.name}: $hook asked once", 1, asked.size)
                    val (shows, code, at) = asked.single()
                    assertTrue("${bundle.name}: in the show check", shows.holds(FOLLOWING_FEED))
                    assertEquals(Opcode.MOVE_RESULT, code[at - 1].opcode)
                    val question = (code[at - 2] as ReferenceInstruction).reference as MethodReference
                    val expected = if (hook == END_CARD_RULE) "Ljava/lang/String;" else shows.definingClass
                    assertEquals("${bundle.name}: what $hook answers", expected, question.definingClass)
                    assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
                }
                checked++
            }
        }
        assertTrue("no fixture of a declared build", checked > 0)
    }

    private fun Instruction.calls(reference: String) =
        ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == reference

    private fun Instruction.reads(reference: String) =
        ((this as? ReferenceInstruction)?.reference as? FieldReference)?.toString() == reference

    private fun Method.holds(string: String): Boolean = implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == string
    } == true

    private fun BytecodePatchContext.code(name: String): List<Instruction> =
        classDefBy(adapter).methods.single { it.name == name }.implementation!!.instructions.toList()

    /**
     * The builder reads another flag first, then the one that ends the feed, asks the feed whether
     * it's empty, and asks again before adding the loading row. Its empty check reads the flag too.
     */
    private fun adapter(type: String = adapter, asks: Boolean = true) = classDef(type, listOf(
        method(type, "buildModels", "V", registers = 4, body = """
            const-string v0, "$BUILD_MODELS"
            iget-object v1, v3, $type->feed:$feed
            iget-boolean v2, v1, $feed->other:Z
            iget-boolean v0, v1, $ended
            if-eqz v0, :loading
            ${if (asks) "invoke-virtual { v1 }, $feed->isEmpty()Z\nmove-result v0" else "const/4 v0, 0x1"}
            if-eqz v0, :loading
            return-void
            :loading
            invoke-virtual { v1 }, $feed->isEmpty()Z
            move-result v0
            if-eqz v0, :done
            const-string v0, "$SHIMMER_KEY"
            :done
            return-void
        """),
        method(type, "isEmptyFeed", "Z", registers = 3, body = """
            iget-object v1, v2, $type->feed:$feed
            iget-boolean v0, v1, $ended
            return v0
        """),
    ))

    /**
     * The load more row's state: its show check holds the Following feed's name and asks whether
     * there's a next page and whether paging failed, and isLoading() asks whether it's busy and
     * (unless [shared] is false) whether there's a next page.
     */
    private fun followingState(shared: Boolean = true) = classDef(following, listOf(
        method(following, "shows", "Z", registers = 2, body = """
            const-string v0, "$FOLLOWING_FEED"
            invoke-virtual { v0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :done
            invoke-virtual { v1 }, $following->hasMore()Z
            move-result v0
            if-nez v0, :done
            invoke-virtual { v1 }, $following->failed()Z
            move-result v0
            :done
            return v0
        """),
        method(following, "isLoading", "Z", registers = 2, body = """
            invoke-virtual { v1 }, $following->busy()Z
            move-result v0
            ${if (shared) "invoke-virtual { v1 }, $following->hasMore()Z\nmove-result v0" else ""}
            return v0
        """),
        method(following, "hasMore", "Z", registers = 2, body = "const/4 v0, 0x1\nreturn v0"),
        method(following, "failed", "Z", registers = 2, body = "const/4 v0, 0x0\nreturn v0"),
        method(following, "busy", "Z", registers = 2, body = "const/4 v0, 0x0\nreturn v0"),
    ))

    /** A static table of feed names holding the Following feed's too, which isn't the show check. */
    private fun feedNames() = classDef("Lfixture/FeedNames;", listOf(
        method("Lfixture/FeedNames;", "name", "Ljava/lang/String;", registers = 1, static = true, body = """
            const-string v0, "$FOLLOWING_FEED"
            return-object v0
        """),
    ))

    private fun method(type: String, name: String, returnType: String, registers: Int, body: String, static: Boolean = false): Method {
        val mutable = MutableMethod(
            ImmutableMethod(
                type, name, emptyList<ImmutableMethodParameter>(), returnType,
                AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null,
                ImmutableMethodImplementation(registers, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(0, body.trimIndent())
        return ImmutableMethod.of(mutable)
    }

    private fun classDef(type: String, methods: List<Method>): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(), methods)
}
