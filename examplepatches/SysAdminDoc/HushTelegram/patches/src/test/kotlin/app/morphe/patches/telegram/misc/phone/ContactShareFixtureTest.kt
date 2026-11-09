/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.phone

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.addInstructions
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** The add contact screen's share box on the pinned builds: where it's ticked, and what saving reads. */
class ContactShareFixtureTest {
    @Test fun `the box asks the runtime right after Telegram ticks it and the save still reads both flags`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + contactShareHosts(build))
            val site = context.resolveContactShare()
            assertTrue("$name: two different flags", site.offer != site.box)
            val save = saveOf(context, site.box)
            val saved = save.controlBody().map(::operands)
            assertTrue("$name: saving reads the offer and then the box", save.controlBody().let { body ->
                val reads = body.filter { it.opcode == Opcode.IGET_BOOLEAN }.map { it.controlField().toString() }
                reads.indexOf(site.offer) in 0 until reads.indexOf(site.box)
            })

            val tick = site.tick
            val stock = site.view.controlBody().map(::operands)
            val (value, owner) = site.view.controlBody()[tick].namedRegisters()
            val stockFlow = ControlFlow.of(site.view)
            val skips = stock.indices.filter { it != tick && tick + 1 in stockFlow.normal[it] }
            assertTrue("$name: the offer's check and the screen's own check both skip the tick", skips.size >= 2)

            site.rehearse()
            assertEquals("$name: the rehearsal leaves Telegram alone", stock, site.view.controlBody().map(::operands))
            site.apply(site.view)

            val body = site.view.controlBody()
            assertEquals("$name: four instructions added", stock.size + 4, body.size)
            assertEquals("$name: everything before the tick", stock.take(tick), body.take(tick).map(::operands))
            assertEquals("$name: everything after it", stock.drop(tick + 1), body.drop(tick + 5).map(::operands))
            val scratch = body[tick].namedRegisters().first()
            assertFalse("$name: the scratch register is neither of the tick's", scratch == value || scratch == owner)
            assertEquals("$name: the box is read first", listOf(Opcode.IGET_BOOLEAN, listOf(scratch, owner), site.box, null), operands(body[tick]))
            assertEquals("$name: Telegram still ticks it", stock[tick], operands(body[tick + 1]))
            assertEquals("$name: the runtime decides", listOf(Opcode.INVOKE_STATIC, listOf(owner, value, scratch), STARTS_TICKED, null), operands(body[tick + 2]))
            assertEquals("$name: its answer", listOf(Opcode.MOVE_RESULT, listOf(scratch), null, null), operands(body[tick + 3]))
            assertEquals("$name: is what the box holds", listOf(Opcode.IPUT_BOOLEAN, listOf(scratch, owner), site.box, null), operands(body[tick + 4]))

            val flow = ControlFlow.of(site.view)
            for (skip in skips) {
                assertTrue("$name: the skip at $skip still lands past the tick", tick + 5 in flow.normal[skip])
                assertFalse("$name: the skip at $skip never runs the runtime", (tick + 1..tick + 4).any { it in flow.normal[skip] })
            }
            assertEquals("$name: only the offer's check reaches the tick", listOf(tick - 1), body.indices.filter { tick in flow.normal[it] })
            assertEquals("$name: the save is Telegram's own", saved, save.controlBody().map(::operands))
        }
    }

    @Test fun `a changed add contact screen refuses before anything is edited`() {
        val cases = listOf<Triple<String, String, (BytecodePatchContext, ContactShareSite) -> Unit>>(
            Triple("tick unguarded", "without the offer's check right before it") { _, site ->
                site.view.replaceInstruction(site.tick - 1, "nop")
            },
            Triple("ticked twice", "share box tick is missing or ambiguous") { context, site ->
                created(context, site).addInstructions(0, "const/4 v0, 0x1\niput-boolean v0, p0, ${site.box}")
            },
            Triple("starts ticked", "doesn't start with the share box clear") { context, site ->
                val constructor = context.tgMutableClassDefBy(site.box.substringBefore("->")).methods.first { it.origName == "<init>" }
                val body = constructor.controlBody()
                val store = body.indices.first { body[it].controlField().toString() == site.box }
                val value = body[store].namedRegisters().first()
                val write = (store - 1 downTo 0).first { body[it].opcode.setsRegister() && body[it].namedRegisters().firstOrNull() == value }
                assertEquals(0, (body[write] as NarrowLiteralInstruction).narrowLiteral)
                constructor.replaceInstruction(write, "const/4 v$value, 0x1")
            },
            Triple("offer elsewhere", "no longer comes from Telegram's add contact bar") { context, site ->
                val method = created(context, site)
                val body = method.controlBody()
                val key = body.indices.single { body[it].controlString() == EXCEPTION_KEY }
                method.replaceInstruction(key, "const-string v${body[key].namedRegisters().single()}, \"dialog_bar_other\"")
            },
            Triple("save reads the box alone", "add contact save that reads the share box is missing or ambiguous") { context, site ->
                // The offer's check goes, so the box alone decides what's shared.
                val save = saveOf(context, site.box)
                val offer = save.controlBody().indexOfFirst { it.opcode == Opcode.IGET_BOOLEAN && it.controlField().toString() == site.offer }
                assertEquals(Opcode.IF_EQZ, save.controlBody()[offer + 1].opcode)
                save.replaceInstruction(offer + 1, "nop")
            },
        )
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hidePhoneHosts(build)
            for ((name, reason, mutate) in cases) {
                val context = PatchContexts.of(ExtensionDex.classes() + hosts)
                mutate(context, context.resolveContactShare())
                val before = snapshot(context, hosts)
                val refused = assertThrows("${build.name}: $name", PatchException::class.java) { hidePhoneNumberPatch.execute(context) }
                assertTrue("${build.name}: $name refused for its own reason: ${refused.message}", refused.message.orEmpty().contains(reason))
                assertEquals("${build.name}: $name leaves every host as it was", before, snapshot(context, hosts))
                for (flag in listOf("hidePhoneNumber", "shareNumberUnticked")) {
                    val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                    assertEquals("${build.name}: $name leaves $flag off", 0L, (status.first() as WideLiteralInstruction).wideLiteral)
                }
            }
        }
    }

    private fun created(context: BytecodePatchContext, site: ContactShareSite) =
        context.tgMutableClassDefBy(site.box.substringBefore("->")).methods.single { it.origName == "onFragmentCreate" }

    private fun snapshot(context: BytecodePatchContext, hosts: List<ClassDef>) = hosts.map { it.type }
        .filter { !it.startsWith("Lapp/hushtelegram/") }
        .associateWith { type -> context.tgMutableClassDefBy(type).methods.map { it.toString() to it.controlBody().map(::operands) } }
}

/** The one method that hands Telegram's addContact (or, inlined, its request) the screen's share box. */
internal fun saveOf(context: BytecodePatchContext, box: String): MutableMethod {
    val found = mutableListOf<Method>()
    context.classDefForEach { cls ->
        cls.methods.filterTo(found) { m -> m.controlBody().let { body -> body.any { it.controlRef() in SAVES } && body.any { it.controlRef() == box } } }
    }
    val save = found.single()
    return context.tgMutableClassDefBy(save.definingClass).methods.single { it.toString() == save.toString() }
}

/** addContact, or the request field its share boolean lands in where 13.2 inlines it. */
private val SAVES = setOf(ADD_CONTACT, PRIVACY_EXCEPTION)

/** The classes that save a contact and every screen whose flags they read. */
internal fun contactShareHosts(build: File): List<ClassDef> {
    val savers = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() in SAVES } }
    val screens = savers.flatMap { it.methods }.filter { m -> m.controlBody().any { it.controlRef() in SAVES } }
        .flatMap { m -> m.controlBody().filter { it.opcode == Opcode.IGET_BOOLEAN }.mapNotNull { it.controlField()?.definingClass } }
        .filter { it.startsWith("Lorg/telegram/") }.toSet()
    return (savers + FixtureDex.classes(build, screens).values.map(ImmutableClassDef::of)).distinctBy { it.type }
}

internal fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(),
    instruction.controlRef(), (instruction as? WideLiteralInstruction)?.wideLiteral)
