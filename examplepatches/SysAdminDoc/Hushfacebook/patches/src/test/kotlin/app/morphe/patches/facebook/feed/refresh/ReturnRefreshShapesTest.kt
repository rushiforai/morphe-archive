/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.refresh

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Block background-return feed refresh that need no Facebook build: which methods the
 * anchors take as the warm-start check and the reset to feed's log, where the warm-start hook goes
 * and what it leaves, and the check shapes it refuses.
 */
class ReturnRefreshShapesTest {
    private val string = "Ljava/lang/String;"
    private val context = "Landroid/content/Context;"

    private fun method(
        body: String,
        parameters: List<String> = listOf(string),
        returnType: String = "I",
        static: Boolean = false,
        registers: Int = 7,
        name: String = "A05",
        owner: String = "Lfixture/FeedLoader;",
    ) = MutableMethod(
        ImmutableMethod(
            owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0),
            null, null, ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    /** The check as 577 and 580 have it: is the feed empty, then the empty-feed load or the rest. */
    private fun warmStart(beforeTest: String = "", test: String = "if-eqz v1, :stories", stories: String = "") = method(
        """
            const-string v0, "$WARM_START_CHECK"
            invoke-direct { p0 }, Lfixture/FeedLoader;->A03()Z
            move-result v1
            const/4 v3, 0x1
            $beforeTest
            $test
            const-string v0, "$EMPTY_FEED_LOAD"
            const/4 v0, 0x0
            return v0
            :stories
            $stories
            const/4 v0, 0x2
            return v0
        """,
    )

    private fun MutableMethod.body(): List<Instruction> = implementation!!.instructions.toList()

    @Test
    fun `the warm-start check is the instance int method over a reason holding both names`() {
        assertTrue(isWarmStartCheck(warmStart()))
        val empty = """
            const-string v0, "$EMPTY_FEED_LOAD"
            const/4 v0, 0x0
            return v0
        """
        assertFalse(isWarmStartCheck(method(empty)))
        assertFalse(isWarmStartCheck(method("const-string v0, \"$WARM_START_CHECK\"\nconst/4 v0, 0x0\nreturn v0")))
        val both = "const-string v0, \"$WARM_START_CHECK\"\nconst-string v0, \"$EMPTY_FEED_LOAD\"\n"
        assertTrue(isWarmStartCheck(method(both + "const/4 v0, 0x0\nreturn v0", parameters = listOf("J", string))))
        assertFalse(isWarmStartCheck(method(both + "const/4 v0, 0x0\nreturn v0", static = true)))
        assertFalse(isWarmStartCheck(method(both + "const/4 v0, 0x0\nreturn v0", parameters = listOf(string, "J"))))
        assertFalse(isWarmStartCheck(method(both + "return-void", returnType = "V")))
    }

    @Test
    fun `the hook asks once the feed has stories and answers the skip while the return holds`() {
        val check = warmStart()
        val before = check.body()
        assertEquals(2, emptyFeedAnswer(check))
        check.holdWarmStartOfAFeedWithStories()
        val after = check.body()
        assertEquals(listOf(Opcode.IF_NEZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_16,
            Opcode.RETURN), after.subList(3, 9).map { it.opcode })
        assertEquals("Lapp/morphe/extension/facebook/feed/ReturnRefresh;->holdWarmStart()Z",
            (after[4] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(1, 1, 1, 1, 1),
            listOf(after[3], after[5], after[6], after[7], after[8]).map { (it as OneRegisterInstruction).registerA })
        assertEquals(WARM_START_SKIPPED, (after[7] as NarrowLiteralInstruction).narrowLiteral)
        // Both no's land on the check's own next instruction, and its test still lands on the rest.
        val flow = ControlFlow.of(check)
        assertEquals(setOf(4, 9), flow.normal[3].toSet())
        assertEquals(setOf(7, 9), flow.normal[6].toSet())
        assertEquals(Opcode.IF_EQZ, after[10].opcode)
        assertEquals(setOf(11, 14), flow.normal[10].toSet())
        assertEquals(before.map { it.opcode }, after.filterIndexed { index, _ -> index !in 3..8 }.map { it.opcode })
    }

    @Test
    fun `a check the hook can't be sure of is refused and left as it was`() {
        val shapes = mapOf(
            // The answer read again past the test: borrowing its register would change that read.
            "read twice" to warmStart(stories = "invoke-static { v1 }, Lfixture/Log;->note(Z)V"),
            // Tested the other way, so the empty-feed load is on the branch.
            "if-nez" to warmStart(test = "if-nez v1, :stories"),
            // Another way into the instruction after the answer, which the hook would sit in front of.
            "loop" to method(
                """
                    const-string v0, "$WARM_START_CHECK"
                    invoke-direct { p0 }, Lfixture/FeedLoader;->A03()Z
                    move-result v1
                    :again
                    const/4 v3, 0x1
                    if-eqz v1, :stories
                    const-string v0, "$EMPTY_FEED_LOAD"
                    const/4 v0, 0x0
                    return v0
                    :stories
                    if-nez v3, :again
                    const/4 v0, 0x2
                    return v0
                """,
            ),
            // No is-empty question before the load.
            "no question" to method(
                """
                    const-string v0, "$WARM_START_CHECK"
                    const-string v0, "$EMPTY_FEED_LOAD"
                    invoke-direct { p0 }, Lfixture/FeedLoader;->A03()Z
                    move-result v1
                    return v1
                """,
            ),
        )
        for ((shape, check) in shapes) {
            val count = check.body().size
            assertThrows("$shape went in", PatchException::class.java) { check.holdWarmStartOfAFeedWithStories() }
            assertEquals("$shape changed", count, check.body().size)
        }
    }

    @Test
    fun `the reset to feed's log is the static (Context, String, String) method holding both keys`() {
        val keys = "const-string v0, \"$RESET_TO_FEED_OUTCOME\"\nconst-string v0, \"$RESET_TO_FEED_DESTINATION\"\nreturn-void"
        val parameters = listOf(context, string, string)
        assertTrue(isResetToFeedLog(method(keys, parameters, "V", static = true, registers = 4)))
        assertFalse(isResetToFeedLog(method(keys, parameters, "V", static = false, registers = 5)))
        assertFalse(isResetToFeedLog(method(keys, listOf(context, "Ljava/lang/Integer;", string), "V", static = true, registers = 4)))
        assertFalse(isResetToFeedLog(method("const-string v0, \"$RESET_TO_FEED_OUTCOME\"\nreturn-void", parameters, "V",
            static = true, registers = 4)))

        // It hands the outcome and destination, p1 and p2, to the extension first thing.
        val log = method(keys, parameters, "V", static = true, registers = 4)
        log.logResetToFeedFirst()
        val first = log.body()[0] as FiveRegisterInstruction
        assertEquals("Lapp/morphe/extension/facebook/feed/ReturnRefresh;->resetToFeed(Ljava/lang/String;Ljava/lang/String;)V",
            (first as ReferenceInstruction).reference.toString())
        assertEquals(listOf(2, 3), listOf(first.registerC, first.registerD).take(first.registerCount))
        assertEquals(4, log.body().size)
    }

    @Test
    fun `the teardown runnable is the instance run() holding its log text, and it asks first`() {
        val body = """
            iget-object v0, p0, Lfixture/Teardown;->A00:Ljava/lang/Object;
            const-string v0, "$LEFT_APP_TEARDOWN"
            return-void
        """
        val plain = """
            const-string v0, "$LEFT_APP_TEARDOWN"
            return-void
        """
        fun run(static: Boolean = false, name: String = "run") =
            method(if (static) plain else body, emptyList(), "V", static, registers = 2, name = name, owner = "Lfixture/Teardown;")
        assertTrue(isLeftAppTeardown(run()))
        assertFalse(isLeftAppTeardown(run(static = true)))
        assertFalse(isLeftAppTeardown(run(name = "A00")))
        assertFalse(isLeftAppTeardown(method(plain, listOf(string), "V", registers = 3, name = "run", owner = "Lfixture/Teardown;")))
        assertFalse(isLeftAppTeardown(method("return-void", emptyList(), "V", registers = 2, name = "run")))

        val teardown = run()
        teardown.keepFeedWhileAwayFirst()
        val after = teardown.body()
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.IGET_OBJECT),
            after.take(5).map { it.opcode })
        assertEquals("Lapp/morphe/extension/facebook/feed/ReturnRefresh;->keepFeedWhileAway()Z",
            (after[0] as ReferenceInstruction).reference.toString())
        assertEquals(setOf(3, 4), ControlFlow.of(teardown).normal[2].toSet())

        // A runnable with no local to borrow is refused as it was.
        val tight = method(body.replace("v0", "p0"), emptyList(), "V", registers = 1, name = "run", owner = "Lfixture/Teardown;")
        assertThrows(PatchException::class.java) { tight.keepFeedWhileAwayFirst() }
        assertEquals(3, tight.body().size)
    }

    private val scroll = "Lfixture/Scroll;"

    /** The enum the decision answers, built the way Facebook's is: each name loaded just before its constant is stored. */
    private fun scrollEnum(vararg names: String): ImmutableClassDef {
        val constants = names.withIndex().joinToString("") { (index, name) ->
            """
                const-string v1, "$name"
                const/4 v0, $index
                new-instance v2, $scroll
                invoke-direct { v2, v1, v0 }, $scroll-><init>(Ljava/lang/String;I)V
                sput-object v2, $scroll->A0$index:$scroll
            """
        }
        val clinit = method(
            "$constants\n                return-void", emptyList(), "V", static = true, registers = 3, name = "<clinit>", owner = scroll,
        )
        return ImmutableClassDef(
            scroll, AccessFlags.PUBLIC.value or AccessFlags.ENUM.value, "Ljava/lang/Enum;", null, null, null, null, listOf(clinit),
        )
    }

    /** The decision as 577 and 580 have it: STANDARD past the minutes, ADS past the seconds, NONE last. */
    private fun decision(none: String = "A02", static: Boolean = false, parameters: List<String> = listOf("J", "Z", "J", "J")) = method(
        """
            if-eqz p3, :ads
            sget-object v0, $scroll->A00:$scroll
            return-object v0
            :ads
            if-eqz p3, :none
            sget-object v0, $scroll->A01:$scroll
            return-object v0
            :none
            sget-object v0, $scroll->$none:$scroll
            return-object v0
        """,
        parameters, scroll, static, registers = 12, name = AUTO_SCROLL_DECISION, owner = "Lfixture/AutoScroll;",
    )

    @Test
    fun `the auto-scroll decision asks first and a yes answers its own NONE`() {
        assertTrue(isAutoScrollDecision(decision()))
        assertFalse(isAutoScrollDecision(decision(static = true)))
        assertFalse(isAutoScrollDecision(decision(parameters = listOf("J", "Z", "J"))))
        val enum = scrollEnum("STANDARD", "ADS", "NONE")
        assertEquals("$scroll->A02:$scroll", noAutoScrollAnswer(decision(), enum))

        val check = decision()
        val before = check.body()
        check.holdAutoScrollFirst(enum)
        val after = check.body()
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ), after.take(3).map { it.opcode })
        assertEquals("Lapp/morphe/extension/facebook/feed/ReturnRefresh;->holdAutoScroll()Z",
            (after[0] as ReferenceInstruction).reference.toString())
        assertEquals(setOf(3, 9), ControlFlow.of(check).normal[2].toSet())
        assertEquals("$scroll->A02:$scroll", (after[9] as ReferenceInstruction).reference.toString())
        assertEquals(before.map { it.opcode }, after.drop(3).map { it.opcode })

        // No NONE in the enum, or none the decision answers: refused, left as it was.
        for (refused in listOf(decision() to scrollEnum("STANDARD", "ADS"), decision(none = "A01") to enum)) {
            val count = refused.first.body().size
            assertThrows(PatchException::class.java) { refused.first.holdAutoScrollFirst(refused.second) }
            assertEquals(count, refused.first.body().size)
        }
    }
}
