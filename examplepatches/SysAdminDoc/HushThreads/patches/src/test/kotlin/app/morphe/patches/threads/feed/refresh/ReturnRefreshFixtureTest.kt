/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed.refresh

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import app.morphe.util.literalReads
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Block background-return feed refresh on each declared build: each of Threads' four return
 * checks is found exactly once, and each asks the extension at the one place its answer is made.
 */
class ReturnRefreshFixtureTest {
    private val warmStart = "$RETURN_REFRESH->warmStart(Z)Z"
    private val resetToFeed = "$RETURN_REFRESH->resetToFeed(Z)Z"
    private val holdHotStart = "$RETURN_REFRESH->holdHotStart()Z"
    private val cachedPosts = "$RETURN_REFRESH->cachedPosts(Z)Z"

    @Test
    fun `the extension answers each check with a boolean`() {
        val extension = ExtensionDex.classDef(RETURN_REFRESH)
        for ((name, parameters) in listOf("warmStart" to listOf("Z"), "resetToFeed" to listOf("Z"), "holdHotStart" to emptyList(),
                "cachedPosts" to listOf("Z"))) {
            val method = extension.methods.single { it.name == name }
            assertTrue(name, AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
            assertEquals(name, parameters, method.parameterTypes.map { it.toString() })
            assertEquals(name, "Z", method.returnType)
        }
    }

    @Test
    fun `each anchor is held by exactly one method of every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val warm = FixtureDex.methodsWhere(build, { true }) { it.holdsString(TOO_SHORT) && it.holdsString(WALL_CLOCK) }
            assertEquals(build.name, 1, warm.size)
            assertEquals(build.name, "Z", warm.single().parameterTypes.last().toString())
            val reset = FixtureDex.methodsWhere(build, { true }) { it.holdsString(RESET_TO_MAIN_FEED) }
            assertEquals(build.name, listOf(BARCELONA_ACTIVITY), reset.map { it.definingClass })
            val handler = FixtureDex.methodsWhere(build, { true }) { it.holdsString(BADGE_DECISION) }
            assertEquals(build.name, listOf(BARCELONA_ACTIVITY), handler.map { it.definingClass })
            // The swap to background posts compares the warm-start threshold once more, in the same class.
            val threshold = warm.single().warmStartThreshold()
            val swaps = FixtureDex.classes(build, setOf(warm.single().definingClass)).values.single().methods
                .flatMap { it.cachedPostsSites(threshold) }
            assertEquals(build.name, 1, swaps.size)
        }
    }

    @Test
    fun `every check asks the extension where its answer is made`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            blockReturnRefreshPatch.execute(context)

            val warm = context.method(fixture.warm)
            val site = fixture.warm.warmStartSite()
            val call = warm.indexOfCall(warmStart)
            assertEquals(build.name, site.store, call)
            assertEquals(build.name, site.register, (warm[call] as RegisterRangeInstruction).startRegister)
            assertEquals(build.name, Opcode.MOVE_RESULT, warm[call + 1].opcode)
            assertEquals(build.name, site.register, (warm[call + 1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.IPUT_BOOLEAN, warm[call + 2].opcode)
            assertEquals(build.name, site.register, (warm[call + 2] as TwoRegisterInstruction).registerA)

            val reset = context.method(fixture.reset)
            val resetCall = reset.indexOfCall(resetToFeed)
            val returned = (reset.last() as OneRegisterInstruction).registerA
            assertEquals(build.name, reset.size - 3, resetCall)
            assertEquals(build.name, returned, (reset[resetCall] as RegisterRangeInstruction).startRegister)
            assertEquals(build.name, returned, (reset[resetCall + 1] as OneRegisterInstruction).registerA)

            // The if-gez that skips the false lands on the hook, so both answers are asked.
            val swap = context.method(fixture.cached.method)
            val swapCall = swap.indexOfCall(cachedPosts)
            val answer = fixture.cached.register
            assertEquals(build.name, answer, (swap[swapCall] as RegisterRangeInstruction).startRegister)
            assertEquals(build.name, Opcode.MOVE_RESULT, swap[swapCall + 1].opcode)
            assertEquals(build.name, answer, (swap[swapCall + 1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.CONST_4, swap[swapCall - 1].opcode)
            assertEquals(build.name, answer, (swap[swapCall - 1] as OneRegisterInstruction).registerA)
            assertEquals(build.name, Opcode.IF_GEZ, swap[swapCall - 2].opcode)
            assertEquals(build.name, swap.addressOf(swapCall),
                swap.addressOf(swapCall - 2) + (swap[swapCall - 2] as OffsetInstruction).codeOffset)
            assertEquals(build.name, fixture.cached.method.implementation!!.instructions.toList()[fixture.cached.join].opcode,
                swap[swapCall + 2].opcode)

            val hot = context.method(fixture.hotStart)
            val stock = fixture.hotStart.implementation!!.instructions.toList()
            assertEquals(build.name, 0, hot.indexOfCall(holdHotStart))
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN_OBJECT),
                hot.subList(1, 5).map { it.opcode })
            assertEquals(build.name, 0, (hot[3] as NarrowLiteralInstruction).narrowLiteral)
            // The no-hold branch skips its own two code units and the two of the null return, landing
            // on Threads' own first instruction, which now follows the hook.
            assertEquals(build.name, stock.first().opcode, hot[5].opcode)
            assertEquals(build.name, 4, (hot[2] as OffsetInstruction).codeOffset)

            assertEquals(build.name, 1, status(context))
        }
    }

    @Test
    fun `both warm-start answers reach Threads' decision only through the hooked store`() {
        for (build in Fixtures.declaredBuilds()) {
            val warm = fixture(build).warm
            val site = warm.warmStartSite()
            val body = warm.implementation!!.instructions.toList()
            val logged = body.indexOfFirst { it.getReference<StringReference>()?.string == TOO_SHORT }
            fun answer(value: Int) = (logged downTo 0).first {
                body[it].opcode == Opcode.CONST_4 && (body[it] as OneRegisterInstruction).registerA == site.register &&
                    (body[it] as NarrowLiteralInstruction).narrowLiteral == value
            }
            for ((label, index) in listOf("true" to answer(1), "false" to answer(0))) {
                val stores = warm.literalReads(index).filter { body[it].opcode == Opcode.IPUT_BOOLEAN }
                assertEquals("$build $label", listOf(site.store), stores)
            }
        }
    }

    @Test
    fun `a warm-start check that logs twice or loses its answer is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val site = fixture.warm.warmStartSite()
            val cases = listOf(
                "second log" to (site.store to "const-string v${if (site.register == 0) 1 else 0}, \"$TOO_SHORT\""),
                "overwritten answer" to (site.store to "const/4 v${site.register}, 0x1"),
            )
            for ((label, change) in cases) {
                val context = context(fixture)
                context.mutableMethod(fixture.warm).addInstructions(change.first, change.second)
                assertThrows("$build $label", PatchException::class.java) { blockReturnRefreshPatch.execute(context) }
            }
        }
    }

    @Test
    fun `a swap whose answer is overwritten, or a second swap, is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val site = fixture.cached
            val threshold = fixture.warm.warmStartThreshold()

            // At the join itself, so the if-gez still lands where it should and only the write is wrong.
            val overwritten = context(fixture)
            overwritten.mutableMethod(site.method).addInstructionsAtControlFlowLabel(site.join, "const/4 v${site.register}, 0x1")
            val lost = assertThrows("$build overwritten", PatchException::class.java) { blockReturnRefreshPatch.execute(overwritten) }
            assertTrue(lost.message.orEmpty(), lost.message.orEmpty().contains("found 0"))

            val twice = context(fixture)
            twice.mutableMethod(site.method).addInstructions(
                0,
                """
                    const-wide v0, ${threshold.key}L
                    invoke-interface { v6, v0, v1 }, ${threshold.getter}
                    move-result-wide v0
                    cmp-long v2, v4, v0
                    const/4 v3, 0x1
                    if-gez v2, :again
                    const/4 v3, 0x0
                    :again
                    if-eqz v3, :done
                    :done
                    nop
                """,
            )
            val second = assertThrows("$build second", PatchException::class.java) { blockReturnRefreshPatch.execute(twice) }
            assertTrue(second.message.orEmpty(), second.message.orEmpty().contains("found 2"))

            // A path from the method's entry skips the key, so this one doesn't ask the threshold.
            val unset = context(fixture)
            unset.mutableMethod(site.method).addInstructions(
                0,
                """
                    if-eqz v3, :ask
                    const-wide v0, ${threshold.key}L
                    :ask
                    invoke-interface { v6, v0, v1 }, ${threshold.getter}
                    move-result-wide v0
                    cmp-long v2, v4, v0
                    const/4 v3, 0x1
                    if-gez v2, :again
                    const/4 v3, 0x0
                    :again
                    if-eqz v3, :done
                    :done
                    nop
                """,
            )
            blockReturnRefreshPatch.execute(unset)
        }
    }

    @Test
    fun `a swap that compares the other way, branches on something else or asks another key or getter is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val site = fixture.cached
            val stock = site.method.implementation!!.instructions.toList()
            val compare = site.join - 4
            val comparison = stock[compare] as ThreeRegisterInstruction
            assertEquals(build.name, Opcode.CMP_LONG, comparison.opcode)
            val taken = setOf(comparison.registerA, comparison.registerB, comparison.registerB + 1, comparison.registerC,
                comparison.registerC + 1, site.register)
            val elsewhere = (0..15).first { it !in taken }
            val call = stock[compare - 2] as FiveRegisterInstruction
            val key = call.registerD
            val getter = call.getReference<MethodReference>()!!
            val cases = mapOf<String, (MutableMethod) -> Unit>(
                "reversed" to { it.replaceInstruction(compare,
                    "cmp-long v${comparison.registerA}, v${comparison.registerC}, v${comparison.registerB}") },
                "other result" to { it.replaceInstruction(compare,
                    "cmp-long v$elsewhere, v${comparison.registerB}, v${comparison.registerC}") },
                "other key" to { it.addInstructions(compare - 2, "const-wide v$key, 0x1L") },
                "other getter" to { it.replaceInstruction(compare - 2,
                    "invoke-interface { v${call.registerC}, v$key, v${call.registerE} }, ${getter.definingClass}->other(J)J") },
                "key moved in from another register" to { it.addInstructions(compare - 2, "move-wide v$key, v$elsewhere") },
            )
            for ((label, change) in cases) {
                val context = context(fixture)
                change(context.mutableMethod(site.method))
                val error = assertThrows("$build $label", PatchException::class.java) { blockReturnRefreshPatch.execute(context) }
                assertTrue("$build $label: ${error.message}", error.message.orEmpty().contains("found 0"))
            }
        }
    }

    @Test
    fun `the warm-start threshold is one key on every path, and the swap has to ask that one`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val threshold = fixture.warm.warmStartThreshold()
            assertTrue(build.name, threshold.getter.startsWith("Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;->"))
            val stock = fixture.warm.implementation!!.instructions.toList()
            val logged = stock.indexOfFirst { it.getReference<StringReference>()?.string == TOO_SHORT }
            val compare = (logged downTo 0).first { stock[it].opcode == Opcode.CMP_LONG }
            val call = compare - 2
            val key = (stock[call] as FiveRegisterInstruction).registerD
            // Both builds load the key far above the call, across the branches that reach it.
            assertTrue(build.name, (call - 6 until call).none {
                stock[it].opcode == Opcode.CONST_WIDE && (stock[it] as OneRegisterInstruction).registerA == key
            })
            val answer = (stock[compare] as ThreeRegisterInstruction).registerA

            // Every path asks another key: the warm check still applies, the swap no longer matches it.
            val other = context(fixture)
            other.mutableMethod(fixture.warm).addInstructions(call, "const-wide v$key, 0x1L")
            val unmatched = assertThrows("$build other key", PatchException::class.java) { blockReturnRefreshPatch.execute(other) }
            assertTrue(unmatched.message.orEmpty(), unmatched.message.orEmpty().contains("found 0"))

            // One path asks another key, so the threshold is no single number.
            val split = context(fixture)
            split.mutableMethod(fixture.warm).addInstructionsWithLabels(
                call,
                """
                    if-eqz v$answer, :keep
                    const-wide v$key, 0x1L
                    :keep
                    nop
                """,
            )
            val error = assertThrows("$build split", PatchException::class.java) { blockReturnRefreshPatch.execute(split) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("isn't one MobileConfig key"))
        }
    }

    @Test
    fun `a reset to main feed with a second answer is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val fixture = fixture(build)
            val context = context(fixture)
            context.mutableMethod(fixture.reset).addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            val error = assertThrows(build.name, PatchException::class.java) { blockReturnRefreshPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("Candidates"))
        }
    }

    private data class Fixture(
        val classes: Collection<ClassDef>,
        val warm: Method,
        val reset: Method,
        val hotStart: Method,
        val cached: CachedPostsSite,
    )

    private fun fixture(build: File): Fixture {
        val warmClasses = FixtureDex.classesWhere(build, { true }) { it.holdsString(TOO_SHORT) }
        val activity = FixtureDex.classes(build, setOf(BARCELONA_ACTIVITY)).getValue(BARCELONA_ACTIVITY)
        val handler = activity.methods.single { it.holdsString(BADGE_DECISION) }
        val decision = activity.methods.single { it.name == "onStart" }.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.returnType == handler.parameterTypes.single().toString() && it.parameterTypes.size == 4 }
            .distinctBy { it.toString() }.single()
        val decisionClass = FixtureDex.classes(build, setOf(decision.definingClass)).getValue(decision.definingClass)
        val classes = (warmClasses + activity + decisionClass).distinctBy { it.type }
        val warm = warmClasses.flatMap { it.methods }.single { it.holdsString(TOO_SHORT) }
        val cached = warmClasses.single { it.type == warm.definingClass }.methods
            .flatMap { it.cachedPostsSites(warm.warmStartThreshold()) }.single()
        return Fixture(
            classes,
            warm,
            activity.methods.single { it.holdsString(RESET_TO_MAIN_FEED) },
            decisionClass.methods.single { it.name == decision.name && it.parameterTypes.map(CharSequence::toString) ==
                decision.parameterTypes.map(CharSequence::toString) && it.returnType == decision.returnType },
            cached,
        )
    }

    private fun context(fixture: Fixture) = PatchContexts.of(ExtensionDex.classes() + fixture.classes)

    private fun BytecodePatchContext.mutableMethod(method: Method) = mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }

    private fun BytecodePatchContext.method(method: Method): List<Instruction> =
        mutableMethod(method).implementation!!.instructions.toList()

    private fun List<Instruction>.addressOf(index: Int) = subList(0, index).sumOf { it.codeUnits }

    private fun List<Instruction>.indexOfCall(reference: String) =
        indices.single { (this[it] as? ReferenceInstruction)?.reference?.toString() == reference }

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "returnRefresh" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral
}
