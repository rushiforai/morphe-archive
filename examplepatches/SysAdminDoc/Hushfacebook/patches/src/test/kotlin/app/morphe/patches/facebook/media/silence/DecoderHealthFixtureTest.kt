/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.silence

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.reels.HERO_PLAYER_SETTING
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Facebook's checks on dropped frames on each declared build (#286): the dav1d health check's
 * speed read and every read of the drop fallback switches, thresholds and recovery action go
 * through the extension right after Facebook reads them, back into the same register, with the
 * rest of each method as Facebook wrote it.
 */
class DecoderHealthFixtureTest {
    private fun bundles(check: (File) -> Unit) {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                check(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun readsDropSetting(method: Method) = method.implementation?.instructions?.any { instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        field != null && field.name in DROP_SETTINGS && instruction.opcode != Opcode.IPUT_BOOLEAN &&
            instruction.opcode != Opcode.IPUT_WIDE
    } == true

    private fun fieldRead(method: Method, index: Int) =
        ((method.implementation!!.instructions.elementAt(index) as ReferenceInstruction).reference as FieldReference)

    /** The patcher widens a jump the added code pushes out of reach, so a goto is a goto at any width. */
    private fun jump(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode

    @Test
    fun `each declared build's dropped frame checks ask the extension after each read`() = bundles { bundle ->
        val readers = FixtureDex.methodsWhere(bundle, { true }, ::readsDropSetting)
        val types = readers.map { it.definingClass }.toSet() + HERO_PLAYER_SETTING +
            FixtureDex.classesHolding(bundle, META_DAV1D).map { it.type }
        val settings = FixtureDex.classes(bundle, setOf(HERO_PLAYER_SETTING)).getValue(HERO_PLAYER_SETTING)
            .fields.single { it.name == "gen" }.type
        // The settings class itself writes every field, and those writes stay as they are.
        val context = PatchContexts.of(FixtureDex.classes(bundle, types + settings).values)
        assertEquals("${bundle.name}: the settings class", settings, context.playerSettings())
        val reads = context.dropChecks()

        // Probed on 585 (2026-10-31): HeroServicePlayer's position update compares its own speed
        // field with 1.0 once, in the only method naming Facebook's dav1d decoder and its threshold.
        val health = reads.filter { it.hook == HEALTH_SPEED }
        assertEquals("${bundle.name}: health check speed reads", 1, health.size)
        val speed = fieldRead(health.single().method, health.single().index)
        assertEquals("${bundle.name}: the speed is a float of the player's own", "F", speed.type)
        assertEquals("${bundle.name}: the speed's class", health.single().method.definingClass, speed.definingClass)

        val drops = reads - health.toSet()
        for ((name, hook) in DROP_SETTINGS) {
            val ofName = drops.filter { fieldRead(it.method, it.index).name == name }
            assertTrue("${bundle.name}: nothing reads $name", ofName.isNotEmpty())
            ofName.forEach { assertEquals("${bundle.name}: $name's hook", hook, it.hook) }
            ofName.forEach { assertEquals("${bundle.name}: $name's class", settings, fieldRead(it.method, it.index).definingClass) }
        }
        // The warning handler picks the SD fallback for every warning, so one method reads all
        // but the very large threshold, and each check reads its own switch too.
        val perMethod = drops.groupBy { "${it.method.definingClass}->${it.method.name}" }
            .mapValues { (_, list) -> list.map { fieldRead(it.method, it.index).name }.toSet() }
        assertTrue("${bundle.name}: no warning handler reads four drop settings: $perMethod",
            perMethod.values.any { it.size >= 4 })
        assertTrue("${bundle.name}: the drop settings read in only ${perMethod.size} methods", perMethod.size >= 4)
        // Every read in the whole dex is found, not only those in the classes the index lets through.
        val everyRead = readers.flatMap { dropReads(it, settings) }.map { "${it.method.definingClass}->${it.method.name}@${it.index}" }
        assertEquals("${bundle.name}: reads found", everyRead.sorted(),
            drops.map { "${it.method.definingClass}->${it.method.name}@${it.index}" }.sorted())

        for ((method, ofMethod) in reads.groupBy { it.method }) {
            val where = "${bundle.name}: ${method.definingClass}->${method.name}"
            val code = method.implementation!!.instructions.toList()
            val mutable = context.mutableClassDefBy(method.definingClass).methods.single { same(it, method) }
            mutable.handDropReads(ofMethod)
            // A second pass over the patched method finds each read handed over already.
            mutable.handDropReads(dropReads(mutable, settings))
            val body = mutable.implementation!!.instructions.toList()
            assertEquals("$where: two instructions per read, once", code.size + 2 * ofMethod.size, body.size)
            var shift = 0
            for (at in code.indices) {
                assertEquals("$where: instruction $at", jump(code[at].opcode), jump(body[at + shift].opcode))
                val read = ofMethod.singleOrNull { it.index == at } ?: continue
                val register = (code[at] as TwoRegisterInstruction).registerA
                val wide = code[at].opcode == Opcode.IGET_WIDE
                val ask = body[at + shift + 1]
                assertEquals("$where@$at: the ask's form", Opcode.INVOKE_STATIC_RANGE, ask.opcode)
                assertEquals("$where@$at: the ask", read.hook, (ask as ReferenceInstruction).reference.toString())
                assertEquals("$where@$at: the ask reads the setting", register, (ask as RegisterRangeInstruction).startRegister)
                assertEquals("$where@$at: the ask's width", if (wide) 2 else 1, ask.registerCount)
                assertEquals("$where@$at: the hook's width", wide, read.hook.endsWith("J"))
                val answer = body[at + shift + 2]
                assertEquals("$where@$at: the answer's form", if (wide) Opcode.MOVE_RESULT_WIDE else Opcode.MOVE_RESULT, answer.opcode)
                assertEquals("$where@$at: the answer's register", register, (answer as OneRegisterInstruction).registerA)
                shift += 2
            }
        }
    }
}
