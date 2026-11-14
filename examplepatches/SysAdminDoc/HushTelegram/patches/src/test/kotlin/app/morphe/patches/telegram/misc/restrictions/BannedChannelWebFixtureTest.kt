/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.restrictions

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.translate.OutsideTranslateFixtureTest
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private val BANNED_ALERT_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * What the banned channel's button needs from [build] (#71): the chat screen's slice Outside translate
 * reads, Telegram's alert builder and its button listener. A test that runs Bypass channel restrictions
 * and expects nothing to warn about adds these, or the patch says the alert keeps only its OK.
 */
internal fun bannedAlertHosts(build: File): List<ClassDef> = BANNED_ALERT_HOSTS.hostsOf(build.path) {
    val builder = FixtureDex.classes(build, setOf(ALERT_BUILDER)).values.single()
    val listeners = builder.methods.map { it.parameterTypes.map(CharSequence::toString) }
        .filter { it.size == 2 && it[0] == "Ljava/lang/CharSequence;" }.map { it[1] }.toSet()
    (OutsideTranslateFixtureTest().hosts(build) + (FixtureDex.classes(build, listeners).values + builder).map(ImmutableClassDef::of))
        .distinctBy { it.type }
}

/** Open on the web (#71) in Telegram's alert for a channel that banned you. */
class BannedChannelWebFixtureTest {
    private val stubs = "Lapp/hushtelegram/extension/telegram/misc/BannedChannelWeb;"

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())
    private fun Instruction.buildRef() = (this as? ReferenceInstruction)?.reference?.toString()

    @Test fun `the alert hands its builder and chat screen over right after OK in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + bannedAlertHosts(build))
            val site = context.resolveBannedChannelAlert()
            val before = ImmutableMethod.of(site.alert).controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { context.applyBannedChannelAlert(site) })

            val after = site.alert.controlBody()
            assertEquals("$name: two instructions", before.size + 2, after.size)
            val ok = before[site.ok].controlRef()!!
            assertTrue("$name: OK is the builder's text setter, $ok", ok.startsWith("$ALERT_BUILDER->") && ok.contains("(Ljava/lang/CharSequence;"))
            assertTrue("$name: after the banned title", before.subList(0, site.ok).any { it.controlRef() == BANNED_TITLE })
            assertEquals("$name: the builder is the one OK was set on", site.builder, before[site.ok].namedRegisters().first())

            val screen = site.alert.localRegisterCount()
            assertEquals("$name: the chat screen", listOf(Opcode.MOVE_OBJECT_FROM16, listOf(site.free, screen)),
                listOf(after[site.ok + 1].opcode, after[site.ok + 1].namedRegisters()))
            assertEquals("$name: asks the extension", BANNED_OFFER, after[site.ok + 2].controlRef())
            assertEquals("$name: with the builder and the screen", listOf(site.builder, site.free), after[site.ok + 2].namedRegisters())
            assertNotEquals("$name: the builder stays put", site.builder, site.free)
            assertTrue("$name: a call can name both", site.builder < 16 && site.free < 16)
            for (i in 0..site.ok) assertEquals("$name: stock $i", before[i].shape(), after[i].shape())
            for (i in site.ok + 1 until before.size) assertEquals("$name: stock $i", before[i].shape(), after[i + 2].shape())

            assertEquals("$name: the screen's account", "getCurrentAccount", site.account.origName)
            assertEquals("$name: the chat", "Lorg/telegram/tgnet/TLRPC\$Chat;", site.chat.type)
            assertEquals("$name: a second button with the same listener", listOf("Ljava/lang/String;", site.listener),
                site.button.parameterTypes.map(CharSequence::toString))
            assertNotEquals("$name: not OK itself", before[site.ok].buildRef(), site.button.toString())

            val stub = { n: String -> context.tgMutableClassDefBy(stubs).methods.single { it.origName == n }.controlBody() }
            assertEquals("$name: chatOf reads the screen's chat", site.chat.toString(), stub("chatOf").single { it.opcode == Opcode.IGET_OBJECT }.buildRef())
            assertEquals("$name: account asks the screen", site.account.toString(), stub("account").single { it.opcode == Opcode.INVOKE_VIRTUAL }.buildRef())
            assertEquals("$name: addButton sets the second button", site.button.toString(), stub("addButton").single { it.opcode == Opcode.INVOKE_VIRTUAL }.buildRef())
            assertEquals("$name: listenerType names the listener", site.listener, stub("listenerType").single { it.opcode == Opcode.CONST_CLASS }.buildRef())
        }
    }

    @Test fun `the whole patch turns Open on the web on, and leaves it off without the alert`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classes(build, setOf("Lorg/telegram/messenger/MessagesController;") + FORWARD_HOSTS).values
            val stories = FixtureDex.classesWhere(build, { true }) { it.isStoryCheck() }
            fun flag(context: app.morphe.patcher.patch.BytecodePatchContext) = context.tgMutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.origName == "bannedChannelWeb" }.controlBody().let { (it[0] as NarrowLiteralInstruction).narrowLiteral }

            val full = PatchContexts.of((ExtensionDex.classes() + hosts + stories + bannedAlertHosts(build) +
                forwardGateOwners(build)).distinctBy { it.type })
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { bypassChannelRestrictionsPatch.execute(full) })
            assertEquals("$name: on", 1, flag(full))

            val bare = PatchContexts.of((ExtensionDex.classes() + hosts + stories + forwardGateOwners(build)).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { bypassChannelRestrictionsPatch.execute(bare) }
            assertEquals("$name: one warning, $warnings", 1, warnings.size)
            assertTrue("$name: $warnings", warnings.single().endsWith("A banned channel's alert keeps only Telegram's OK."))
            assertEquals("$name: off", 0, flag(bare))
        }
    }
}
