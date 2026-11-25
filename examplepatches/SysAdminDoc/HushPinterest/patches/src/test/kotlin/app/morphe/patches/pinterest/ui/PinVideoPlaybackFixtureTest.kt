/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pinterest.actions.PIN_CLOSEUP_PRESENTER
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** #48: the saved video states, the pin pages' reset of them, the idea pin page's own play and each pin page's start of its sound. */
@Category(FixtureTests::class)
class PinVideoPlaybackFixtureTest {
    private val flags = listOf("pinVideoPlayback", "pinVideoAutoplay", "pinVideoSound")

    /**
     * Both pin page presenters, the regular video pin page, every class that plays a video, the class
     * keeping the saved states and the sound flag, the idea pin page's sound setter and its callers.
     */
    private fun read(build: File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { method ->
            method.definingClass == PIN_CLOSEUP_PRESENTER || method.definingClass == PROMOTED_CLOSEUP_PRESENTER ||
                method.definingClass == PIN_CLOSEUP_VIDEO_MODULE ||
                method.calls().any { it.name == "play" && it.parameterTypes.isEmpty() && it.returnType == "V" }
        }
        val states = PatchContexts.of(found).videoStates().getter.definingClass
        val withStates = (found + FixtureDex.classes(build, setOf(states)).values).distinctBy { it.type }
        val clean = PatchContexts.of(withStates)
        val flag = clean.soundFlag(clean.videoStates()).second
        val setters = FixtureDex.classesWhere(build, { true }) { it.setsSound(flag) }
        val setter = setters.flatMap { it.methods }.single { it.setsSound(flag) }
        val callers = FixtureDex.classesWhere(build, { true }) { method ->
            method.calls().any { it.definingClass == setter.definingClass && it.name == setter.name && it.parameterTypes.isEmpty() }
        }
        return (withStates + setters + callers).distinctBy { it.type }
    }

    private fun mutableOf(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.parameters() == method.parameters() && it.returnType == method.returnType
        } as MutableMethod

    /** Where each jump in [method] onto [at] came from, not counting the instruction before it. */
    private fun jumpsOnto(method: Method, at: Int): List<Int> {
        val flow = ControlFlow.of(method)
        return flow.normal.indices.filter { it != at - 1 && at in flow.normal[it] }
    }

    /** The patched instruction a jump [from] in the stock method lands on, with [added] instructions put in at [at]. */
    private fun landing(context: BytecodePatchContext, method: Method, from: Int, at: Int, added: Int): Int {
        val moved = if (from < at) from else from + added
        return ((mutableOf(context, method).implementation!!.instructions[moved]) as BuilderOffsetInstruction).target.location.index
    }

    private fun reg(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction) = (instruction as OneRegisterInstruction).registerA

    @Test
    fun `each declared APK asks before a fresh video state, a page's reset, an idea pin's play and each pin page's sound`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val clean = PatchContexts.of(classes)
            val states = clean.videoStates()
            val fresh = clean.freshState(states)
            val idea = clean.ideaPinStart()
            val sound = clean.soundStarts(states)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            pinVideoPlaybackPatch.execute(context)
            for (flag in flags) assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))

            // A fresh state: the hook's answer goes into its paused flag right before it's handed back.
            val got = fresh.method.instructions()
            val made = PinPageKit.patched(context, fresh.method)
            val at = fresh.at
            assertEquals(build.name, PIN_VIDEO_WAITS_HOOK, PinPageKit.target(made[at]))
            assertTrue("${build.name}: the hook takes nothing", made[at].passed().isEmpty())
            assertEquals(build.name, Opcode.MOVE_RESULT, made[at + 1].opcode)
            val answer = reg(made[at + 1])
            assertTrue("${build.name}: the answer's register v$answer holds the state", answer != fresh.state && answer <= 15)
            assertEquals(build.name, Opcode.IPUT_BOOLEAN, made[at + 2].opcode)
            assertEquals(build.name, states.paused.toString(), PinPageKit.target(made[at + 2]))
            assertEquals(build.name, answer, (made[at + 2] as TwoRegisterInstruction).registerA)
            assertEquals("${build.name}: into the state returned", fresh.state, (made[at + 2] as TwoRegisterInstruction).registerB)
            assertEquals(build.name, Opcode.RETURN_OBJECT, made[at + 3].opcode)
            assertEquals(build.name, fresh.state, reg(made[at + 3]))
            assertEquals("${build.name}: the getter is otherwise Pinterest's", PinPageKit.kinds(got),
                PinPageKit.kinds(made.take(at) + made.drop(at + 3)))
            for (from in jumpsOnto(fresh.method, at)) {
                assertEquals("${build.name}: a jump to the return runs the hook first", at, landing(context, fresh.method, from, at, 3))
            }

            // Each pin page's reset: the hook's answer replaces its false right before the store. Pinterest's constant stays.
            assertEquals(build.name, listOf(PIN_CLOSEUP_PRESENTER, PROMOTED_CLOSEUP_PRESENTER), states.resets.map { it.first.definingClass })
            for ((method, clear) in states.resets) {
                val before = method.instructions()
                val after = PinPageKit.patched(context, method)
                val register = reg(before[clear])
                assertEquals(build.name, Opcode.CONST_4, after[clear].opcode)
                assertEquals(build.name, PIN_VIDEO_WAITS_HOOK, PinPageKit.target(after[clear + 1]))
                assertEquals(build.name, Opcode.MOVE_RESULT, after[clear + 2].opcode)
                assertEquals("${build.name}: the answer goes where the false was", register, reg(after[clear + 2]))
                assertEquals(build.name, Opcode.IPUT_BOOLEAN, after[clear + 3].opcode)
                assertEquals(build.name, states.paused.toString(), PinPageKit.target(after[clear + 3]))
                assertEquals(build.name, register, (after[clear + 3] as TwoRegisterInstruction).registerA)
                assertEquals("${build.name}: ${method.definingClass} is otherwise Pinterest's", PinPageKit.kinds(before),
                    PinPageKit.kinds(after.take(clear + 1) + after.drop(clear + 3)))
            }

            // The idea pin page's start: on yes only the play is skipped, the seek to the start stays.
            val ideaBefore = idea.method.instructions()
            val ideaAfter = PinPageKit.patched(context, idea.method)
            val play = idea.play
            assertEquals(build.name, PIN_VIDEO_WAITS_HOOK, PinPageKit.target(ideaAfter[play]))
            assertEquals(build.name, Opcode.MOVE_RESULT, ideaAfter[play + 1].opcode)
            val waits = reg(ideaAfter[play + 1])
            assertTrue("${build.name}: v$waits holds the video", waits != idea.video)
            assertEquals(build.name, Opcode.IF_NEZ, ideaAfter[play + 2].opcode)
            assertEquals(build.name, waits, reg(ideaAfter[play + 2]))
            assertEquals("${build.name}: yes lands past the play", play + 4,
                (mutableOf(context, idea.method).implementation!!.instructions[play + 2] as BuilderOffsetInstruction).target.location.index)
            assertEquals(build.name, PinPageKit.target(ideaBefore[play]), PinPageKit.target(ideaAfter[play + 3]))
            assertEquals(build.name, listOf(idea.video), ideaAfter[play + 3].passed())
            assertEquals("${build.name}: the idea pin page is otherwise Pinterest's", PinPageKit.kinds(ideaBefore),
                PinPageKit.kinds(ideaAfter.take(play) + ideaAfter.drop(play + 3)))

            // Each pin page's sound start: on yes the flag it reads next is muted, then Pinterest's own code runs.
            assertEquals(build.name, PIN_CLOSEUP_VIDEO_MODULE, sound.video.definingClass)
            assertEquals(build.name, states.getter.definingClass, sound.flag.definingClass)
            assertTrue("${build.name}: the idea pin presenter calls the sound setter",
                sound.idea.calls().any { it.name == sound.applier.name && it.definingClass == sound.applier.definingClass })
            for (page in listOf(sound.video, sound.idea)) {
                val before = page.instructions()
                val after = PinPageKit.patched(context, page)
                val code = mutableOf(context, page).implementation!!.instructions
                assertEquals(build.name, PIN_VIDEO_MUTED_HOOK, PinPageKit.target(after[0]))
                assertTrue("${build.name}: the hook takes nothing", after[0].passed().isEmpty())
                assertEquals(build.name, Opcode.MOVE_RESULT, after[1].opcode)
                val muted = reg(after[1])
                assertTrue("${build.name}: v$muted is a local of ${page.name}", muted < page.implementation!!.registerCount - 1 - page.parameterTypes.size)
                assertEquals(build.name, Opcode.IF_EQZ, after[2].opcode)
                assertEquals(build.name, muted, reg(after[2]))
                assertEquals("${build.name}: no goes to Pinterest's first instruction", 4, (code[2] as BuilderOffsetInstruction).target.location.index)
                assertEquals(build.name, Opcode.SPUT_BOOLEAN, after[3].opcode)
                assertEquals(build.name, muted, reg(after[3]))
                assertEquals(build.name, sound.flag.toString(), PinPageKit.target(after[3]))
                assertEquals("${build.name}: ${page.name} is otherwise Pinterest's", PinPageKit.kinds(before), PinPageKit.kinds(after.drop(4)))
                assertTrue("${build.name}: nothing jumps into the hook of ${page.name}",
                    code.filterIsInstance<BuilderOffsetInstruction>().none { it.target.location.index in 1..3 })
            }
        }
    }

    @Test
    fun `a missing stub, pin page, idea pin page, sound start or state getter refuses with Pinterest's code untouched`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val clean = PatchContexts.of(classes)
        val states = clean.videoStates()
        val idea = clean.ideaPinStart().method.definingClass
        val sound = clean.soundStarts(states)
        val cases = linkedMapOf(
            "no pinVideoPlayback stub" to (PinPageKit.extensionWithout("pinVideoPlayback") + classes to "pinVideoPlayback"),
            "no pinVideoAutoplay stub" to (PinPageKit.extensionWithout("pinVideoAutoplay") + classes to "pinVideoAutoplay"),
            "no pinVideoSound stub" to (PinPageKit.extensionWithout("pinVideoSound") + classes to "pinVideoSound"),
            "no ad pin page" to (ExtensionDex.classes() + classes.filter { it.type != PROMOTED_CLOSEUP_PRESENTER } to PROMOTED_CLOSEUP_PRESENTER),
            "no state getter" to (ExtensionDex.classes() + classes.filter { it.type != states.getter.definingClass } to "video state getter"),
            "no idea pin page" to (ExtensionDex.classes() + classes.filter { it.type != idea } to "idea pin page"),
            "no video pin page" to (ExtensionDex.classes() + classes.filter { it.type != PIN_CLOSEUP_VIDEO_MODULE } to "regular video pin page"),
            "no idea pin sound setter" to (ExtensionDex.classes() + classes.filter { it.type != sound.applier.definingClass } to "sound setter"),
            "no idea pin presenter" to (ExtensionDex.classes() + classes.filter { it.type != sound.idea.definingClass } to "idea pin presenter's start"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { pinVideoPlaybackPatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            for (flag in flags) assertEquals("$reason: $flag", 0, PinPageKit.flagOrZero(context, flag))
            val present = input.map { it.type }.toSet()
            for (method in classes.filter { it.type in present }.flatMap { it.methods }.filter { it.implementation != null }) {
                assertEquals("$reason changed ${method.definingClass}->${method.name}",
                    method.instructions().map { it.opcode }, PinPageKit.patched(context, method).map { it.opcode })
            }
        }
    }
}
