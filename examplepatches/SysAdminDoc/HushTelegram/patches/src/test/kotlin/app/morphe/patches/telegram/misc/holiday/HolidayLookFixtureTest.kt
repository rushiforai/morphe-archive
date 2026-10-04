/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.holiday

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** The holiday check's class, every class that reads its snow flag and the runtime are the whole context. */
class HolidayLookFixtureTest {
    @Test
    fun `the holiday check shows the look or puts it back before its date test`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val sites = context.resolveHolidayLookSites()
            val stock = ImmutableMethod.of(sites.check)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { holidayLookPatch.execute(context) })
            val name = build.name
            val after = sites.check.instructions()

            assertEquals("$name: hook", HOOK, after.subList(0, HOOK.size).map { it.opcode })
            assertEquals("$name: hook asks", "$HOLIDAY_LOOK->mode()I", after[0].reference())
            assertEquals("$name: show lets snow start", sites.snow.toString(), after[5].reference())
            assertEquals("$name: show looks for the hat", sites.hat.toString(), after[6].reference())
            assertEquals("$name: restore drops the hat", sites.hat.toString(), after[10].reference())
            assertEquals("$name: restore stops snow", sites.snow.toString(), after[11].reference())
            assertEquals("$name: restore forgets the last check", sites.checked.toString(), after[13].reference())
            // The wide write takes the pair the restore wrote its zero to.
            assertEquals("$name: zeroed pair", after[12].namedRegisters()[0], after[13].namedRegisters()[0])

            val moved = assertKeepsStock("$name: holiday check", stock, sites.check, 0, HOOK.size)
            val flow = ControlFlow.of(sites.check)
            val stockStart = HOOK.size
            assertEquals("$name: off runs Telegram's check", setOf(3, stockStart - 1), flow.normal[2].toSet())
            assertEquals("$name: show or restore", setOf(5, 9), flow.normal[4].toSet())
            assertEquals("$name: a loaded hat returns as is", setOf(8, moved.getValue(sites.done)), flow.normal[7].toSet())
            assertEquals("$name: no hat yet loads it", listOf(moved.getValue(sites.load)), flow.normal[8])
            assertEquals("$name: restore goes on to Telegram's check", listOf(stockStart), flow.normal[stockStart - 1])
            assertEquals("$name: restore runs into it", listOf(stockStart - 1), flow.normal[13])

            // The load is the stock one: the app's resources, the hat's id, stored to the hat.
            val load = stock.instructions()
            assertEquals("$name: load reads the app context", Opcode.SGET_OBJECT, load[sites.load].opcode)
            assertTrue("$name: load reads the hat's id", (sites.load until sites.done).any { load[it].reference() == NEW_YEAR_HAT })
            assertEquals("$name: the exit returns the hat", Opcode.RETURN_OBJECT, load[sites.done + 1].opcode)

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "holidayLook" }.instructions()
            assertEquals("$name: build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    @Test
    fun `only Telegram's holiday check loads the hat, and its snow flag reaches the top bar and chat backgrounds`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val loaders = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.reference() == NEW_YEAR_HAT } }
            assertEquals("$name: one hat loader", 1, loaders.size)
            val check = loaders.single()
            val snow = check.instructions().first { it.opcode == Opcode.SPUT_BOOLEAN }.reference()
            val readers = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any {
                it.opcode == Opcode.SGET_BOOLEAN && it.reference() == snow } }
            // The top bar starts its snow where it draws the hat; the chat background starts the same snow.
            val bar = readers.single { it.name == "drawChild" }
            val effect = bar.instructions().first { it.opcode == Opcode.NEW_INSTANCE }.reference()
            assertEquals("$name: snow flag readers", 2, readers.size)
            assertTrue("$name: the bar draws the hat", bar.instructions().any { it.reference()?.endsWith("->${check.name}()$DRAWABLE") == true })
            val background = readers.single { it != bar }
            assertTrue("$name: the chat background starts the same snow", background.instructions().any {
                it.opcode == Opcode.NEW_INSTANCE && it.reference() == effect })
        }
    }

    // The switch's text promises only the snow. If a build draws the chat list title as plain text
    // again, the hat shows too and this fails so the text can say so.
    @Test
    fun `the bar draws the hat only over a plain-text title, and the chat list title is Telegram's logo`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val check = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any { it.reference() == NEW_YEAR_HAT } }.single()
            val asks = { method: Method -> method.instructions().any { it.reference()?.endsWith("->${check.name}()$DRAWABLE") == true } }
            val bar = FixtureDex.methodsWhere(build, { true }) { method -> method.name == "drawChild" && asks(method) }.single().instructions()
            val ask = bar.indexOfFirst { it.reference()?.endsWith("->${check.name}()$DRAWABLE") == true }
            val draw = (ask until bar.size).first { bar[it].reference() == "Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V" }
            assertTrue("$name: the hat draws only over a String title",
                (ask until draw).any { bar[it].opcode == Opcode.INSTANCE_OF && bar[it].reference() == "Ljava/lang/String;" })

            val screens = FixtureDex.methodsWhere(build, { true }) { method -> method.name == "createView" && method.instructions().any {
                it.reference()?.endsWith("->setSupportsHolidayImage(Z)V") == true } }
            assertEquals("$name: one screen wants the holiday image", 1, screens.size)
            val title = screens.single().instructions()
            assertTrue("$name: its title is the logo", title.any { it.reference() == "Lorg/telegram/messenger/R\$drawable;->telegram_logo_2:I" })
            assertTrue("$name: spanned over the app name", title.any {
                it.opcode == Opcode.NEW_INSTANCE && it.reference() == "Landroid/text/style/ImageSpan;" })
        }
    }

    @Test
    fun `changed holiday check geometry refuses before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val changes: List<Pair<String, (BytecodePatchContext, HolidayLookSites) -> Unit>> = listOf(
                "a second hat loader" to { context, sites ->
                    val other = context.mutableClassDefBy(sites.check.definingClass).methods.first { it != sites.check &&
                        (it.implementation?.registerCount ?: 0) > 1 }
                    other.addInstructions(0, "sget v0, $NEW_YEAR_HAT")
                },
                "the hat goes to another field" to { _, sites ->
                    val body = sites.check.instructions()
                    val store = (sites.load until sites.done).first { body[it].opcode == Opcode.SPUT_OBJECT }
                    sites.check.replaceInstruction(store, "sput-object v${body[store].namedRegisters()[0]}, " +
                        "${sites.check.definingClass}->hushOther:$DRAWABLE")
                },
                "a second exit" to { _, sites ->
                    sites.check.addInstructions(sites.load, "return-object v0")
                },
                "the snow flag is set one way only" to { _, sites ->
                    val body = sites.check.instructions()
                    sites.check.replaceInstruction(body.indexOfFirst { it.opcode == Opcode.SPUT_BOOLEAN }, "nop")
                },
                "the top bar stops reading the snow flag" to { context, sites ->
                    val bar = sites.readers.single { it.name == "drawChild" }
                    val method = context.mutableClassDefBy(bar.definingClass).methods.single { it.name == bar.name &&
                        it.parameterTypes.map(CharSequence::toString) == bar.parameterTypes.map(CharSequence::toString) }
                    val body = method.instructions()
                    val read = body.indexOfFirst { it.opcode == Opcode.SGET_BOOLEAN && (it as ReferenceInstruction).reference.toString() == sites.snow.toString() }
                    method.replaceInstruction(read, "const/4 v${body[read].namedRegisters()[0]}, 0x0")
                },
            )
            for ((case, change) in changes) {
                val context = contextFor(build)
                change(context, context.resolveHolidayLookSites())
                assertRefusedUntouched(build, case, context)
            }
            assertRefusedUntouched(build, "no runtime", contextFor(build, runtime = false))
        }
    }

    private fun assertRefusedUntouched(file: java.io.File, case: String, context: BytecodePatchContext) {
        val build = file.name
        val owners = owners(file).map { it.type }
        val before = owners.associateWith { type -> context.mutableClassDefBy(type).methods.map { it.instructions().map(::operation) } }
        try {
            holidayLookPatch.execute(context)
            fail("$build: $case was accepted")
        } catch (expected: PatchException) {
            assertTrue("$build: $case: ${expected.message}", expected.message.orEmpty().contains("before editing"))
        }
        assertEquals("$build: $case doesn't partly mutate the holiday check or its readers", before,
            owners.associateWith { type -> context.mutableClassDefBy(type).methods.map { it.instructions().map(::operation) } })
        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "holidayLook" }.instructions()
        assertEquals("$build: $case leaves the build fact false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    /**
     * The edited method holds the stock one's operations outside the [size] instructions inserted
     * at [at], and every stock jump still goes where it went, a jump to the hooked instruction now
     * landing on the hook. Returns where each stock index moved.
     */
    private fun assertKeepsStock(what: String, original: Method, after: Method, at: Int, size: Int): Map<Int, Int> {
        val old = original.instructions()
        val now = after.instructions()
        val kept = old.indices.toList()
        val moved = now.indices.filterNot { it in at until at + size }
        assertEquals("$what keeps every stock operation", kept.map { operation(old[it]) }, moved.map { operation(now[it]) })
        val to = kept.zip(moved).toMap()
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(after)
        for (index in kept) {
            assertEquals("$what keeps stock flow from $index", oldFlow.normal[index].map { if (it == at) at else to.getValue(it) },
                newFlow.normal[to.getValue(index)])
        }
        return to
    }

    /** The holiday check's class and every class reading its snow flag. */
    private fun owners(build: java.io.File): List<ClassDef> {
        val check = FixtureDex.classesWhere(build, HAT_CENSUS, { true }) { method -> method.instructions().any { it.reference() == NEW_YEAR_HAT } }
        assertEquals("${build.name}: the holiday check", 1, check.size)
        val loader = check.single().methods.single { method -> method.instructions().any { it.reference() == NEW_YEAR_HAT } }
        val snow = loader.instructions().first { it.opcode == Opcode.SPUT_BOOLEAN }.reference()
        val readers = FixtureDex.classesWhere(build, SNOW_CENSUS, { true }) { method -> method.instructions().any {
            it.opcode == Opcode.SGET_BOOLEAN && it.reference() == snow } }
        return (check + readers).distinctBy { it.type }
    }

    private fun contextFor(build: java.io.File, runtime: Boolean = true): BytecodePatchContext {
        val extension = ExtensionDex.classes().filter { runtime || it.type != HOLIDAY_LOOK }
        return PatchContexts.of(extension + owners(build))
    }

    private companion object {
        val HAT_CENSUS = FixtureDex.ClassCensus()
        val SNOW_CENSUS = FixtureDex.ClassCensus()
        val HOOK = listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.IF_NE, Opcode.SPUT_BOOLEAN,
            Opcode.SGET_OBJECT, Opcode.IF_NEZ, Opcode.GOTO, Opcode.CONST_4, Opcode.SPUT_OBJECT, Opcode.SPUT_BOOLEAN,
            Opcode.CONST_WIDE_16, Opcode.SPUT_WIDE, Opcode.NOP)
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.reference() = ((this as? ReferenceInstruction)?.reference as? Any)?.let {
        if (it is FieldReference) "${it.definingClass}->${it.name}:${it.type}" else it.toString() }
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
}
