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
import org.junit.Test

/** MediaController's voice queue and the runtime. */
class VoiceOneAtATimeFixtureTest {
    @Test fun `the queue passes through the extension before Telegram stores it`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { it.definingClass == MEDIA_CONTROLLER }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val setter = context.resolveVoiceOneAtATime()
            val old = ImmutableMethod.of(setter)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { voiceOneAtATimePatch.execute(context) })

            val playlist = setter.implementation!!.registerCount - 2
            val before = old.controlBody()
            val after = setter.controlBody()
            assertEquals("$name: two instructions", before.size + 2, after.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT), after.take(2).map { it.opcode })
            assertEquals(QUEUE, after[0].controlRef())
            assertEquals("$name: the queue parameter", listOf(listOf(playlist), listOf(playlist)), after.take(2).map { it.namedRegisters() })
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                    listOf(after[i + 2].opcode, after[i + 2].namedRegisters(), (after[i + 2] as? ReferenceInstruction)?.reference?.toString()))
            }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "voiceOneAtATime" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
