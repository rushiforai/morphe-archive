/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.progressbar

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Keep the progress bar on every Facebook build the bundle declares: the Reels viewer's bottom
 * progress bar plugin found by the name it gives itself, its shrinking and full-size methods told
 * apart by the 255 alpha only the full-size one loads, and the full-screen controls' fade timer, the
 * one method of FeedFullscreenVideoControlsPlugin's superclass that sets a delayed message. Then the
 * two hooks on those methods: the extension asked first, a yes making the bar full size with the
 * same two arguments or setting no timer, a no landing on Facebook's first instruction, and nothing
 * of Facebook's code moved. The newer player's controls extension gets the same no-timer hook on its
 * one method that posts the hide, and so does the run() of the hide runnable that the landscape
 * player's controller posts with a delay, a runnable whose hide reaches the controls updater.
 * Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class KeepProgressBarFixtureTest {
    private fun bundles(check: (File) -> Unit) {
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

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.sameAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

    @Test
    fun `each declared build keeps the reel's bar full size through its own full-size method`() = bundles { bundle ->
        val name = bundle.name
        val holders = FixtureDex.classesHolding(bundle, REEL_SEEK_BAR_PLUGIN).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        assertTrue("$name: nothing loads \"$REEL_SEEK_BAR_PLUGIN\"", holders.isNotEmpty())
        val plugin = reelSeekBarPlugin(holders)
        val sizes = barSizes(plugin)
        assertTrue("$name: the full-size method doesn't load 255",
            sizes.fullSize.code().any { (it as? WideLiteralInstruction)?.wideLiteral == 255L })
        assertFalse("$name: the shrinking method loads 255",
            sizes.shrink.code().any { (it as? WideLiteralInstruction)?.wideLiteral == 255L })
        // The hook borrows v0: the SeekBar and the plugin are the two parameter registers.
        assertTrue("$name: ${plugin.type}->${sizes.shrink.name} has no local register for the hook",
            sizes.shrink.implementation!!.registerCount - 2 >= 1)

        val context = PatchContexts.of(listOf(plugin))
        val shrink = context.mutableClassDefBy(plugin.type).methods.single { it.sameAs(sizes.shrink) }
        val original = shrink.code()
        shrink.fullSizeInstead(plugin.type, sizes.fullSize)
        val patched = shrink.code()
        val where = "$name: ${plugin.type}->${sizes.shrink.name}"
        assertEquals("$where gains five instructions", original.size + 5, patched.size)
        assertEquals("$where: the extension is asked first", KEEPS_REEL_BAR, patched[0].reference())
        assertEquals("$where: its answer is kept", Opcode.MOVE_RESULT, patched[1].opcode)
        val register = (patched[1] as OneRegisterInstruction).registerA
        assertTrue("$where: the hook writes v$register, which isn't a local", register < shrink.localRegisterCount())
        assertEquals("$where: a no goes on to Facebook", Opcode.IF_EQZ, patched[2].opcode)
        val call = patched[3] as FiveRegisterInstruction
        assertEquals("$where: a yes makes the bar full size", "${plugin.type}->${sizes.fullSize.name}($SEEK_BAR${plugin.type})V",
            patched[3].reference())
        assertEquals("$where: with the same SeekBar and plugin", listOf(shrink.localRegisterCount(), shrink.localRegisterCount() + 1),
            listOf(call.registerC, call.registerD))
        assertEquals("$where: and returns", Opcode.RETURN_VOID, patched[4].opcode)
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(5).map { it.opcode })
        assertEquals("$where: a no lands on Facebook's first instruction", setOf(3, 5), ControlFlow.of(shrink).normal[2].toSet())
    }

    @Test
    fun `each declared build runs the scrubber's active look in place of its passive one while kept`() = bundles { bundle ->
        val name = bundle.name
        val holders = FixtureDex.classesHolding(bundle, SCRUBBER_PASSIVE).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        assertTrue("$name: nothing traces \"$SCRUBBER_PASSIVE\"", holders.isNotEmpty())
        val looks = vddScrubber(holders)
        assertNotEquals("$name: the active and passive looks are one method", looks.active.name, looks.passive.name)
        assertTrue("$name: the active look doesn't load 255 for the thumb",
            looks.active.code().any { (it as? WideLiteralInstruction)?.wideLiteral == 255L })
        assertTrue("$name: the passive look doesn't set the bar's max height",
            looks.passive.code().any { it.reference()?.endsWith("ProgressBar;->setMaxHeight(I)V") == true })
        val registers = looks.passive.implementation!!.registerCount
        // The hook borrows v0: this is the one parameter register.
        assertTrue("$name: ${looks.type}->${looks.passive.name} has no local register for the hook", registers - 1 >= 1)

        val context = PatchContexts.of(listOf(holders.single { it.type == looks.type }))
        val passive = context.mutableClassDefBy(looks.type).methods.single { it.sameAs(looks.passive) }
        val original = passive.code()
        passive.activeInstead(looks)
        val patched = passive.code()
        val where = "$name: ${looks.type}->${looks.passive.name}"
        assertEquals("$where gains nine instructions", original.size + 9, patched.size)
        assertEquals("$where: the extension is asked first", KEEPS_REEL_BAR, patched[0].reference())
        assertEquals("$where: its answer is kept", Opcode.MOVE_RESULT, patched[1].opcode)
        val register = (patched[1] as OneRegisterInstruction).registerA
        assertTrue("$where: the hook writes v$register, which isn't a local", register < passive.localRegisterCount())
        assertEquals("$where: a no goes on to Facebook", Opcode.IF_EQZ, patched[2].opcode)
        assertEquals("$where: a yes runs the active look", "${looks.type}->${looks.active.name}()V", patched[3].reference())
        assertEquals("$where: through the range form, which reaches any register", Opcode.INVOKE_VIRTUAL_RANGE, patched[3].opcode)
        val call = patched[3] as RegisterRangeInstruction
        assertEquals("$where: on this instance only", listOf(passive.localRegisterCount(), 1),
            listOf(call.startRegister, call.registerCount))
        val local = passive.localRegisterCount()
        assertEquals("$where: the instance moves into a local through the wide form", Opcode.MOVE_OBJECT_FROM16, patched[4].opcode)
        val move = patched[4] as TwoRegisterInstruction
        assertEquals("$where: from p0 into the hook's local", listOf(register, local), listOf(move.registerA, move.registerB))
        assertEquals("$where: the views holder is read off the scrubber", looks.viewsField, patched[5].reference())
        assertEquals("$where: then the time label out of it", looks.labelField, patched[6].reference())
        for (index in 5..6) {
            val read = patched[index] as TwoRegisterInstruction
            assertEquals("$where: read $index stays in the local", listOf(register, register), listOf(read.registerA, read.registerB))
        }
        assertEquals("$where: the label is a ViewGroup of the views holder", VIEW_GROUP,
            (patched[6] as ReferenceInstruction).reference.let { (it as FieldReference).type })
        assertEquals("$where: the label goes to the extension", HIDE_TIME_LABEL, patched[7].reference())
        assertEquals("$where: with the local", listOf(register), listOf((patched[7] as FiveRegisterInstruction).registerC))
        assertEquals("$where: and returns", Opcode.RETURN_VOID, patched[8].opcode)
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(9).map { it.opcode })
        assertEquals("$where: a no lands on Facebook's first instruction", setOf(3, 9), ControlFlow.of(passive).normal[2].toSet())
    }

    @Test
    fun `each declared build hides the time label where the passive look does`() = bundles { bundle ->
        val name = bundle.name
        val holders = FixtureDex.classesHolding(bundle, SCRUBBER_PASSIVE).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        val looks = vddScrubber(holders)
        // The passive look sets the label INVISIBLE (4) through the same fields the hook reads.
        val code = looks.passive.code()
        val read = code.indexOfFirst { it.reference() == looks.labelField }
        assertTrue("$name: the passive look doesn't read ${looks.labelField}", read > 0)
        assertEquals("$name: the views holder is read first", looks.viewsField, code[read - 1].reference())
        assertTrue("$name: the passive look doesn't make the label invisible",
            code.drop(read).take(8).any { (it as? WideLiteralInstruction)?.wideLiteral == 4L })
        // The active look reads the same label field, to show it.
        assertTrue("$name: the active look doesn't read ${looks.labelField}",
            looks.active.code().any { it.reference() == looks.labelField })
    }

    @Test
    fun `each declared build sets no fade timer for full-screen controls while kept`() = bundles { bundle ->
        val name = bundle.name
        val subclass = FixtureDex.classes(bundle, setOf(FULLSCREEN_CONTROLS)).values.single()
        val controls = FixtureDex.classes(bundle, setOf(subclass.superclass!!)).values.single()
        assertNotEquals("$name: the full-screen controls extend nothing of Facebook's", "Ljava/lang/Object;", controls.type)
        val timer = fadeTimer(controls)
        assertTrue("$name: ${controls.type}->${timer.name} doesn't set the delayed message",
            timer.code().any { it.reference() == SEND_DELAYED })
        // The hook borrows v0: this is the one parameter register.
        assertTrue("$name: ${controls.type}->${timer.name} has no local register for the hook",
            timer.implementation!!.registerCount - 1 >= 1)

        val context = PatchContexts.of(listOf(controls))
        val method = context.mutableClassDefBy(controls.type).methods.single { it.sameAs(timer) }
        val original = method.code()
        method.noTimerWhileKept()
        val patched = method.code()
        val where = "$name: ${controls.type}->${timer.name}"
        assertEquals("$where gains four instructions", original.size + 4, patched.size)
        assertEquals("$where: the extension is asked first", KEEPS_CONTROLS, patched[0].reference())
        assertEquals("$where: its answer is kept", Opcode.MOVE_RESULT, patched[1].opcode)
        val register = (patched[1] as OneRegisterInstruction).registerA
        assertTrue("$where: the hook writes v$register, which isn't a local", register < method.localRegisterCount())
        assertEquals("$where: a no goes on to Facebook", Opcode.IF_EQZ, patched[2].opcode)
        assertEquals("$where: a yes sets no timer", Opcode.RETURN_VOID, patched[3].opcode)
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(4).map { it.opcode })
        assertEquals("$where: a no lands on Facebook's first instruction", setOf(3, 4), ControlFlow.of(method).normal[2].toSet())
    }

    @Test
    fun `each declared build posts no hide for the newer player's controls while kept`() = bundles { bundle ->
        val name = bundle.name
        val holders = FixtureDex.classesHolding(bundle, CONTROLS_EXTENSION).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        val (extension, hide) = extensionFadeTimer(holders)
        val where = "$name: ${extension.type}->${hide.name}"
        assertTrue("$where posts no 3 second hide", hide.code().any { (it as? WideLiteralInstruction)?.wideLiteral == 3000L })
        // The hook borrows v0, so the method needs a register below its parameters.
        assertTrue("$where has no local register for the hook",
            hide.implementation!!.registerCount - hide.parameterTypes.size - 1 >= 1)

        val context = PatchContexts.of(listOf(extension))
        val method = context.mutableClassDefBy(extension.type).methods.single { it.sameAs(hide) }
        val original = method.code()
        method.noTimerWhileKept()
        val patched = method.code()
        assertEquals("$where gains four instructions", original.size + 4, patched.size)
        assertEquals("$where: the extension is asked first", KEEPS_CONTROLS, patched[0].reference())
        assertEquals("$where: a yes posts no hide", Opcode.RETURN_VOID, patched[3].opcode)
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(4).map { it.opcode })
        assertEquals("$where: a no lands on Facebook's first instruction", setOf(3, 4), ControlFlow.of(method).normal[2].toSet())
    }

    @Test
    fun `each declared build runs no hide the landscape player's controller posted while kept`() = bundles { bundle ->
        val name = bundle.name
        fun classOf(type: String) = FixtureDex.classes(bundle, setOf(type)).values.singleOrNull()
        val holders = FixtureDex.classesHolding(bundle, PLAYER_CONTROL_UPDATE).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        val updater = controlsUpdater(holders, ::classOf)
        val controllers = mutableListOf<ClassDef>()
        FixtureDex.forEach(bundle) { dex ->
            for (classDef in dex.classes) if (takesUpdater(classDef, updater)) controllers += ImmutableClassDef.of(classDef)
        }
        val (runnable, run) = controlsHideRunnable(controllers, ::classOf)
        val where = "$name: ${runnable.type}->run"
        // The hide the runnable asks for has to reach the updater, which hands the player the hide.
        val asked = run.code().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { call -> controllers.any { it.type == call.definingClass } }
        assertEquals("$where asks its controller for more than the hide", 1, asked.size)
        val hide = controllers.single { it.type == asked.single().definingClass }.methods.single { it.name == asked.single().name }
        assertTrue("$where: ${hide.name} doesn't hand the updater the hide",
            hide.code().any { it.opcode == Opcode.INVOKE_INTERFACE && it.reference()!!.startsWith("$updater->") })
        assertTrue("$where has no local register for the hook", run.implementation!!.registerCount - 1 >= 1)

        val context = PatchContexts.of(listOf(runnable))
        val method = context.mutableClassDefBy(runnable.type).methods.single { it.sameAs(run) }
        val original = method.code()
        method.noTimerWhileKept()
        val patched = method.code()
        assertEquals("$where gains four instructions", original.size + 4, patched.size)
        assertEquals("$where: the extension is asked first", KEEPS_CONTROLS, patched[0].reference())
        val register = (patched[1] as OneRegisterInstruction).registerA
        assertTrue("$where: the hook writes v$register, which isn't a local", register < method.localRegisterCount())
        assertEquals("$where: a yes hides nothing", Opcode.RETURN_VOID, patched[3].opcode)
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(4).map { it.opcode })
        assertEquals("$where: a no lands on Facebook's first instruction", setOf(3, 4), ControlFlow.of(method).normal[2].toSet())
    }
}
