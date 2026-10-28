/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

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
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The bar's tap, the full player's own checks, the stubs and the runtime. */
class VoiceMusicPlayerFixtureTest {
    @Test fun `the bar and the full player ask the extension where they check for music`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() == IS_MUSIC } }
                .map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveVoiceMusicPlayer()
            val old = site.calls.map { (m, _) -> ImmutableMethod.of(m) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { voiceMusicPlayerPatch.execute(context) })

            val bar = site.calls.first()
            assertTrue("$name: the bar sits beside the player bar", bar.first.definingClass == FRAGMENT_CONTEXT_VIEW ||
                context.mutableClassDefBy(bar.first.definingClass).fields.any { it.type == FRAGMENT_CONTEXT_VIEW })
            assertTrue("$name: the player closes and updates through its checks",
                site.calls.filter { it.first.definingClass == site.player }.sumOf { it.second.size } >= 2)
            assertTrue("$name: a helper of the player checks too", site.calls.any { it.first.definingClass != site.player && it != bar })

            site.calls.forEachIndexed { n, (method, indices) ->
                val before = old[n].controlBody()
                val after = method.controlBody()
                assertEquals("$name: same length", before.size, after.size)
                for (i in before.indices) {
                    if (i in indices) {
                        assertEquals(PLAYER_MUSIC, after[i].controlRef())
                        assertTrue(after[i].opcode == Opcode.INVOKE_STATIC || after[i].opcode == Opcode.INVOKE_STATIC_RANGE)
                        assertEquals("$name: the same message", before[i].namedRegisters(), after[i].namedRegisters())
                    } else {
                        assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                            listOf(after[i].opcode, after[i].namedRegisters(), (after[i] as? ReferenceInstruction)?.reference?.toString()))
                    }
                }
            }

            // Add to Profile: one call after the own-list check's answer, on the same register, the rest stock.
            val (toggle, at) = site.profile
            val stockToggle = hosts.single { it.type == site.player }.methods.single { it.name == toggle.name &&
                it.parameterTypes.map(CharSequence::toString) == toggle.parameterTypes.map(CharSequence::toString) }.controlBody()
            val patched = toggle.controlBody()
            assertEquals("$name: two lines added", stockToggle.size + 2, patched.size)
            val mine = stockToggle[at - 1].namedRegisters()
            assertEquals(PLAYER_PROFILE, patched[at].controlRef())
            assertEquals("$name: the own-list answer goes in", mine, patched[at].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, patched[at + 1].opcode)
            assertEquals("$name: and comes back in the same register", mine, patched[at + 1].namedRegisters())
            assertTrue("$name: the toggle fades the buttons", patched.count { it.controlRef() == "Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;" } >= 2)
            for (i in stockToggle.indices) {
                val j = if (i < at) i else i + 2
                assertEquals("$name: toggle stock $i", listOf(stockToggle[i].opcode, stockToggle[i].namedRegisters(), stockToggle[i].controlRef()),
                    listOf(patched[j].opcode, patched[j].namedRegisters(), patched[j].controlRef()))
            }

            val stub = { n: String -> context.mutableClassDefBy(VOICE_PLAYER).methods.single { it.name == n }.controlBody().map { it.controlRef() } }
            assertTrue(IS_MUSIC in stub("isMusic"))
            assertTrue("Lorg/telegram/messenger/MessageObject;->isVoice()Z" in stub("isVoice"))
            assertTrue("Lorg/telegram/messenger/MessageObject;->isVoiceOnce()Z" in stub("once"))
            assertTrue("Lorg/telegram/messenger/MediaController;->getPlayingMessageObject()Lorg/telegram/messenger/MessageObject;" in stub("playing"))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "voiceMusicPlayer" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
