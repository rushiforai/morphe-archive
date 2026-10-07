/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.forward

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The forward preview's update, the Premium gate's article number, the stubs and the runtime. */
class ForwardHideSenderFixtureTest {
    @Test fun `the extension sees each new forward first and keeps Telegram's article gate`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                m.definingClass == PREVIEW_PARAMS || m.definingClass == MESSAGE_OBJECT || m.definingClass == "Lorg/telegram/messenger/UserConfig;" ||
                    m.controlBody().map { it.controlRef() }.let { IS_PREMIUM in it && FORWARDS in it && NAME_HIDE in it }
            }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveForwardHideSender()
            assertEquals("$name: articles are type 36", 36, site.article)
            val old = ImmutableMethod.of(site.update)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { forwardHideSenderPatch.execute(context) })

            val params = site.update.implementation!!.registerCount - 4
            val before = old.controlBody()
            val after = site.update.controlBody()
            assertEquals("$name: one instruction", before.size + 1, after.size)
            assertEquals(Opcode.INVOKE_STATIC, after[0].opcode)
            assertEquals(STARTS, after[0].controlRef())
            assertEquals("$name: the preview and the messages", listOf(params, params + 1), after[0].namedRegisters())
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                    listOf(after[i + 1].opcode, after[i + 1].namedRegisters(), (after[i + 1] as? ReferenceInstruction)?.reference?.toString()))
            }

            val stub = { n: String -> context.mutableClassDefBy(FORWARD_SENDER).methods.single { it.name == n }.controlBody() }
            assertTrue("$name: a new forward has no messages yet", FORWARDS in stub("fresh").map { it.controlRef() })
            assertTrue("$name: the account's Premium", IS_PREMIUM in stub("premium").map { it.controlRef() })
            assertTrue("$name: the message's type", MESSAGE_TYPE in stub("type").map { it.controlRef() })
            assertEquals("$name: the article number", 36, (stub("article").first() as NarrowLiteralInstruction).narrowLiteral)
            assertTrue("$name: the flag the send reads", stub("hide").any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == HIDE_SENDERS })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "forwardHideSender" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
