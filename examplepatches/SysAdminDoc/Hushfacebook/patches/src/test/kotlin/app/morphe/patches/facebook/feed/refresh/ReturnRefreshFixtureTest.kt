/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.refresh

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Block background-return feed refresh on every Facebook build the bundle declares. Each holds one
 * FeedRefreshTriggerController resume callback, one feed warm-start check, the only method loading
 * its trace name, and one place the reset to feed writes down its outcome. The patch, run on them,
 * asks the extension first in the callback, right after the warm-start check's is-the-feed-empty
 * answer, and first in the reset's log, and leaves the rest of each method as it was. Reads the
 * fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class ReturnRefreshFixtureTest {
    private val extension = "Lapp/morphe/extension/facebook/feed/ReturnRefresh;"
    private val skip = "$extension->skip()Z"
    private val holdWarmStart = "$extension->holdWarmStart()Z"
    private val resetToFeed = "$extension->resetToFeed(Ljava/lang/String;Ljava/lang/String;)V"
    private val keepFeedWhileAway = "$extension->keepFeedWhileAway()Z"
    private val holdAutoScroll = "$extension->holdAutoScroll()Z"

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.call(): String? = ((this as? ReferenceInstruction)?.reference)?.toString()

    private fun signature(method: Method) =
        method.definingClass + "->" + method.name + method.parameterTypes.joinToString("", "(", ")") + method.returnType

    /** Whether [method] answers [value] somewhere: a constant of it returned straight away. */
    private fun answers(method: Method, value: Int): Boolean = method.body().zipWithNext().any { (constant, ret) ->
        constant is NarrowLiteralInstruction && constant.narrowLiteral == value && ret.opcode == Opcode.RETURN &&
            (ret as OneRegisterInstruction).registerA == (constant as OneRegisterInstruction).registerA
    }

    @Test
    fun `the extension has the entries the patch calls, public and static`() {
        val methods = ExtensionDex.classDef(extension).methods.associateBy(::signature)
        for (entry in listOf(skip, holdWarmStart, resetToFeed, keepFeedWhileAway, holdAutoScroll)) {
            val method = methods[entry]
            assertTrue("the extension has no $entry", method != null)
            assertTrue("$entry isn't public static",
                AccessFlags.PUBLIC.isSet(method!!.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags))
        }
    }

    @Test
    fun `each declared build holds the feed on every check of a return`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                check(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun check(bundle: File) {
        val name = bundle.name
        val controllers = FixtureDex.classesHolding(bundle, "FeedRefreshTriggerController")
        val callbacks = controllers.flatMap { it.methods.filter(::isReturnRefreshCallback) }
        assertEquals("$name: resume callbacks: ${callbacks.map(::signature)}", 1, callbacks.size)

        // The warm-start check is the one method loading its trace name. Its own skip answers 2,
        // which is what the hook answers for it.
        val warmOwners = FixtureDex.classesHolding(bundle, WARM_START_CHECK)
        val holding = warmOwners.flatMap { owner -> owner.methods.filter { holdsString(it, WARM_START_CHECK) } }
        assertEquals("$name: methods loading \"$WARM_START_CHECK\": ${holding.map(::signature)}", 1, holding.size)
        val warmStart = holding.single()
        assertTrue("$name: ${signature(warmStart)} isn't the warm-start check", isWarmStartCheck(warmStart))
        assertTrue("$name: ${signature(warmStart)} never answers $WARM_START_SKIPPED", answers(warmStart, WARM_START_SKIPPED))
        // Throws on a shape the hook can't go into: see emptyFeedAnswer.
        val answer = emptyFeedAnswer(warmStart)
        val empty = (warmStart.body()[answer] as OneRegisterInstruction).registerA

        val logOwners = FixtureDex.classesHolding(bundle, RESET_TO_FEED_OUTCOME)
        val logs = logOwners.flatMap { it.methods.filter(::isResetToFeedLog) }
        assertEquals("$name: reset-to-feed logs: ${logs.map(::signature)}", 1, logs.size)
        val log = logs.single()

        // The runnable that tears the feed down once Facebook has been away as long as the
        // warm-start threshold is the one method loading its log text.
        val teardownOwners = FixtureDex.classesHolding(bundle, LEFT_APP_TEARDOWN)
        val teardowns = teardownOwners.flatMap { owner -> owner.methods.filter { holdsString(it, LEFT_APP_TEARDOWN) } }
        assertEquals("$name: methods loading \"$LEFT_APP_TEARDOWN\": ${teardowns.map(::signature)}", 1, teardowns.size)
        val teardown = teardowns.single()
        assertTrue("$name: ${signature(teardown)} isn't the teardown runnable", isLeftAppTeardown(teardown))

        // NewsFeedFragment's foreground auto-scroll decision, the one method of its name, answers
        // its enum's NONE last.
        val decisions = FixtureDex.methodsWhere(bundle, { dex -> dex.stringSection.any { it == AUTO_SCROLL_DECISION } }) {
            it.name == AUTO_SCROLL_DECISION
        }
        assertEquals("$name: methods named $AUTO_SCROLL_DECISION: ${decisions.map(::signature)}", 1, decisions.size)
        val decision = decisions.single()
        assertTrue("$name: ${signature(decision)} isn't the auto-scroll decision", isAutoScrollDecision(decision))
        val scrollTypes = FixtureDex.classes(bundle, setOf(decision.definingClass, decision.returnType))
        val none = noAutoScrollAnswer(decision, scrollTypes.getValue(decision.returnType))
        val noneAt = decision.body().indexOfFirst { it.call() == none }
        assertEquals("$name: the NONE answer's return", Opcode.RETURN_OBJECT, decision.body()[noneAt + 1].opcode)

        val owners = (controllers + warmOwners + logOwners + teardownOwners + scrollTypes.values).distinctBy { it.type }
        val context = PatchContexts.of(owners + ExtensionDex.classDef(SETTINGS_STATUS))
        blockReturnRefreshPatch.execute(context)
        fun patched(method: Method) = context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.returnType == method.returnType &&
                it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
        }

        val callback = patched(callbacks.single()).body()
        assertEquals("$name: the callback's first call", skip, callback[0].call())

        // Right after the is-empty answer: an empty feed goes on to Facebook's load, a feed with
        // stories asks, and a yes answers the skip. Both no's land on Facebook's next instruction.
        val before = warmStart.body()
        val after = patched(warmStart).body()
        val added = after.subList(answer + 1, answer + 7)
        assertEquals("$name: the hook", listOf(Opcode.IF_NEZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.CONST_16, Opcode.RETURN), added.map { it.opcode })
        assertEquals("$name: the question", holdWarmStart, added[1].call())
        assertEquals("$name: the registers", listOf(empty, empty, empty, empty, empty),
            listOf(added[0], added[2], added[3], added[4], added[5]).map { (it as OneRegisterInstruction).registerA })
        assertEquals("$name: the skip answer", WARM_START_SKIPPED, (added[4] as NarrowLiteralInstruction).narrowLiteral)
        val flow = ControlFlow.of(patched(warmStart))
        assertTrue("$name: an empty feed doesn't go on to Facebook's load", answer + 7 in flow.normal[answer + 1])
        assertTrue("$name: a no doesn't reach Facebook's code", answer + 7 in flow.normal[answer + 4])
        assertEquals("$name: one question", 1, after.count { it.call() == holdWarmStart })
        assertEquals("$name: the rest of the check", before.map { it.opcode },
            after.filterIndexed { index, _ -> index !in answer + 1..answer + 6 }.map { it.opcode })

        // The log hands on its outcome and destination, the two parameters after the context.
        val logBody = patched(log).body()
        assertEquals("$name: the log's first call", resetToFeed, logBody[0].call())
        val registers = log.implementation!!.registerCount
        assertEquals("$name: what the log hands on", listOf(registers - 2, registers - 1),
            (logBody[0] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals("$name: the rest of the log", log.body().map { it.opcode }, logBody.drop(1).map { it.opcode })

        // The teardown asks first and returns without tearing down while the switch is on.
        val teardownBody = patched(teardown).body()
        assertEquals("$name: the teardown's first call", keepFeedWhileAway, teardownBody[0].call())
        assertEquals("$name: the teardown's hook", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.RETURN_VOID), teardownBody.take(4).map { it.opcode })
        assertEquals("$name: the rest of the teardown", teardown.body().map { it.opcode }, teardownBody.drop(4).map { it.opcode })

        // The decision asks first and a yes lands on its own NONE answer.
        val decisionBody = patched(decision).body()
        assertEquals("$name: the decision's first call", holdAutoScroll, decisionBody[0].call())
        assertEquals("$name: the decision's hook", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
            decisionBody.take(3).map { it.opcode })
        assertTrue("$name: a yes doesn't answer NONE", noneAt + 3 in ControlFlow.of(patched(decision)).normal[2])
        assertEquals("$name: NONE", none, decisionBody[noneAt + 3].call())
        assertEquals("$name: the rest of the decision", decision.body().map { it.opcode },
            decisionBody.drop(3).map { it.opcode })
    }
}
