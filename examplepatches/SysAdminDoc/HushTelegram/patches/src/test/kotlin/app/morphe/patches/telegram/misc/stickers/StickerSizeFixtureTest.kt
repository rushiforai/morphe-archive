/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.stickers

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.loadsInt
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** The message bubble's content setter, Telegram's message model and the runtime. */
class StickerSizeFixtureTest {
    private val contentLabel = "Lorg/telegram/messenger/R\$string;->SponsoredMessageAdWhatIsThis:I"

    @Test fun `the extension gets a sticker's largest side right after the bubble works it out`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                m.origDefiningClass == MESSAGE_OBJECT ||
                    // 13.2 loads the label's id as a number, without the R field.
                    m.controlBody().any { it.loadsInt() && it.controlRef() == contentLabel }
            }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val plan = context.resolveStickerSize()
            val old = ImmutableMethod.of(plan.method)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { stickerSizePatch.execute(context) })

            val before = old.controlBody()
            val after = plan.method.controlBody()
            val at = plan.multiply
            assertEquals("$name: two instructions", before.size + 2, after.size)
            assertEquals(Opcode.MUL_FLOAT_2ADDR, after[at].opcode)
            assertEquals(Opcode.CONST_HIGH16, after[at - 1].opcode)
            assertEquals(SIZE_HOOK, after[at + 1].controlRef())
            assertEquals("$name: the message and the size", listOf(plan.message, plan.size), after[at + 1].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, after[at + 2].opcode)
            assertEquals(listOf(plan.size), after[at + 2].namedRegisters())
            assertEquals("$name: Telegram rounds what the extension answers", Opcode.FLOAT_TO_INT, after[at + 3].opcode)
            assertEquals(plan.size, after[at + 3].namedRegisters().last())
            for (i in before.indices) {
                val shift = if (i > at) 2 else 0
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].origRef()),
                    listOf(after[i + shift].opcode, after[i + shift].namedRegisters(), after[i + shift].origRef()))
            }
            // The phone's share falls into the multiply and the tablet's jumps to it, so both reach the hook.
            val flow = ControlFlow.of(plan.method)
            assertEquals("$name: the phone and the tablet", 2, flow.normal.indices.count { at in flow.normal[it] })
            assertEquals("$name: only the multiply reaches the hook", listOf(at), flow.normal.indices.filter { at + 1 in flow.normal[it] })

            val stub = context.tgMutableClassDefBy(STICKER_SIZE).methods.single { it.origName == "emoji" }.controlBody().map { it.controlRef() }
            assertTrue("$name: the stub asks about animated emoji", "$MESSAGE_OBJECT->isAnimatedEmoji()Z" in stub)
            assertTrue("$name: and about dice", "$MESSAGE_OBJECT->isDice()Z" in stub)
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "stickerSize" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
