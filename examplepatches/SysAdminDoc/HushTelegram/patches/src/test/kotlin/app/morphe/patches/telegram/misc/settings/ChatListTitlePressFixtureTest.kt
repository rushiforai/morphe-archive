/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.settings

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.holiday.HOLIDAY_LOOK
import app.morphe.patches.telegram.misc.holiday.NEW_YEAR_HAT
import app.morphe.patches.telegram.misc.holiday.TITLE_EMOJI
import app.morphe.patches.telegram.misc.holiday.holidayLookPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origName
import app.morphe.util.names.origRef

/**
 * A long press on the "Telegram" title at the top of the chat list opens HushTelegram settings. The
 * chat list has no logo button, so the patch hands its top bar to the extension right after the
 * chat list makes Telegram's logo the bar's title. The context is the extension, the chat list, its
 * action bar and the holiday look's classes, which edit the same method.
 */
class ChatListTitlePressFixtureTest {
    @Test
    fun `the chat list hands its top bar over right after the logo title on both fixtures`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = contextFor(build)
            val site = context.resolveChatListTitle()
            val stock = ImmutableMethod.of(site.method)
            val before = stock.body()
            val setter = before[site.after - 1]
            assertEquals("$name: the setter hands over the bar", site.bar, setter.namedRegisters().first())
            assertEquals("$name: the setter takes the title first", "Ljava/lang/CharSequence;",
                ((setter as ReferenceInstruction).reference as MethodReference).parameterTypes.first().toString())

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { chatListTitlePressPatch.execute(context) })

            val after = site.method.body()
            assertEquals("$name: one call added", before.operations().size + 1, after.operations().size)
            assertEquals("$name: the call", WATCH_TITLE, after[site.after].callName())
            assertEquals("$name: with the bar", Opcode.INVOKE_STATIC_RANGE, after[site.after].opcode)
            assertEquals("$name: and only the bar", listOf(site.bar), after[site.after].namedRegisters())
            assertEquals("$name: one hook", 1, after.count { it.callName() == WATCH_TITLE })
            assertEquals("$name: everything before it stays", before.take(site.after).operations(),
                after.take(site.after).operations())
            assertEquals("$name: everything after it stays", before.drop(site.after).operations(),
                after.drop(site.after + 1).operations())

            // The call runs only straight after the setter. A jump that went to the instruction
            // after the setter still goes there, where the bar register may hold something else.
            val stockFlow = ControlFlow.of(stock)
            val flow = ControlFlow.of(site.method)
            assertEquals("$name: the setter runs into the call", listOf(site.after), flow.normal[site.after - 1])
            assertEquals("$name: the call runs into Telegram's next instruction", listOf(site.after + 1), flow.normal[site.after])
            for (at in before.indices) if (at != site.after - 1 && site.after in stockFlow.normal[at]) {
                val moved = if (at < site.after) at else at + 1
                assertTrue("$name: a jump from $at now lands on the call", site.after + 1 in flow.normal[moved] && site.after !in flow.normal[moved])
            }
        }
    }

    @Test
    fun `the holiday look's logo edits and the title hook go in either order`() {
        for (build in Fixtures.declaredBuilds()) for (titleFirst in listOf(true, false)) {
            val name = "${build.name} ${if (titleFirst) "title first" else "holiday first"}"
            val context = contextFor(build)
            val warnings = PatchLogCapture.warnings {
                if (titleFirst) chatListTitlePressPatch.execute(context)
                // The holiday look preflights the chat list's logo block itself and throws on drift.
                holidayLookPatch.execute(context)
                if (!titleFirst) chatListTitlePressPatch.execute(context)
            }
            assertEquals("$name: warnings", emptyList<String>(), warnings)
            val create = context.resolveChatListTitle().method.body()
            assertEquals("$name: one title hook", 1, create.count { it.callName() == WATCH_TITLE })
            assertEquals("$name: one logo span registration", 1, create.count {
                it.callName() == "$HOLIDAY_LOOK->registerLogoSpan(Landroid/text/style/ImageSpan;)V" })
            assertEquals("$name: one title emoji", 1, create.count {
                it.callName() == "$TITLE_EMOJI->decorate(Landroid/text/SpannableStringBuilder;)V" })
        }
    }

    @Test
    fun `a chat list it doesn't recognise is said and left as Telegram made it`() {
        val drifts = listOf<Pair<String, (ChatListTitleSite) -> Unit>>(
            "a second logo read" to { site -> site.method.addInstruction(0, "sget v0, $LOGO") },
            "the bar register written over before the setter" to { site ->
                site.method.addInstruction(site.after - 1, "move-object/from16 v${site.bar}, p0")
            },
        )
        for (build in Fixtures.declaredBuilds()) {
            for ((drift, apply) in drifts) {
                val context = contextFor(build)
                val site = context.resolveChatListTitle()
                apply(site)
                val drifted = site.method.body().operations()
                val warnings = PatchLogCapture.warnings { chatListTitlePressPatch.execute(context) }
                assertEquals("${build.name} $drift: one warning", 1, warnings.size)
                assertTrue("${build.name} $drift: says what can't work: $warnings", warnings.single().startsWith(
                    "HushTelegram settings: a long press on the chat list title can't open the settings (chat list title: "))
                assertEquals("${build.name} $drift: the chat list changed", drifted, site.method.body().operations())
            }
        }
        // No chat list at all, as on a build that dropped it.
        val bare = PatchContexts.of(ExtensionDex.classes())
        val warnings = PatchLogCapture.warnings { chatListTitlePressPatch.execute(bare) }
        assertEquals(1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("read by 0 screens"))
    }

    /** The holiday check's class, the snow flag's readers (the action bar among them) and the chat list. */
    private fun owners(build: File): List<ClassDef> {
        val check = FixtureDex.classesWhere(build, HAT_CENSUS, { true }) { method -> method.body().any { it.reference() == NEW_YEAR_HAT } }
        assertEquals("${build.name}: the holiday check", 1, check.size)
        val loader = check.single().methods.single { method -> method.body().any { it.reference() == NEW_YEAR_HAT } }
        val snow = loader.body().first { it.opcode == Opcode.SPUT_BOOLEAN }.reference()
        val readers = FixtureDex.classesWhere(build, READER_CENSUS, { true }) { method -> method.origName == "getTextStartX" ||
            method.body().any { (it.opcode == Opcode.SGET_BOOLEAN && it.reference() == snow) ||
                (method.origName == "createView" && it.reference() == LOGO) } }
        // 13.2 loads the logo through a static helper right after its id, and the holiday look reads that helper's body.
        val loaders = readers.flatMap { it.methods }.filter { it.origName == "createView" }.mapNotNull { method ->
            val body = method.body()
            val logo = body.indexOfFirst { it.reference() == LOGO }
            body.getOrNull(logo + 1)?.takeIf { logo >= 0 && it.opcode == Opcode.INVOKE_STATIC }
                ?.let { ((it as ReferenceInstruction).reference as MethodReference).definingClass }
        }.toSet()
        return (check + readers + FixtureDex.classes(build, loaders).values).distinctBy { it.type }
    }

    private fun contextFor(build: File): BytecodePatchContext = PatchContexts.of(ExtensionDex.classes() + owners(build))

    private companion object {
        const val LOGO = "Lorg/telegram/messenger/R\$drawable;->telegram_logo_2:I"
        val HAT_CENSUS = FixtureDex.ClassCensus()
        val READER_CENSUS = FixtureDex.ClassCensus()
    }

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    // Source names, with R8's inlined resource ids read back as their R fields.
    private fun Instruction.reference(): String? = origRef()
    private fun Instruction.callName(): String? = reference()?.takeIf {
        (this as? ReferenceInstruction)?.reference is MethodReference
    }
    // dexlib re-aligns switch payloads with a NOP and widens a goto whose jump grew when an
    // instruction goes in, so those don't count as changes.
    private fun List<Instruction>.operations() = filter { it.opcode != Opcode.NOP }.map { instruction ->
        val opcode = if (instruction.opcode in GOTOS) Opcode.GOTO else instruction.opcode
        listOf(opcode, instruction.namedRegisters(), instruction.reference())
    }
}

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
