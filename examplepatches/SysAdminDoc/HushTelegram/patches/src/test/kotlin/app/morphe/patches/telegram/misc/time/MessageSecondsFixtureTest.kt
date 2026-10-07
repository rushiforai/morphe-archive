/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.time

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The message bubble's time, the formatter, and the runtime. */
class MessageSecondsFixtureTest {
    @Test fun `each time the bubble formats goes to the extension in the same registers`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                m.definingClass == FAST_DATE_FORMAT || m.controlBody().any { it.controlRef() == EDITED_MESSAGE }
            }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val (method, indices) = context.resolveMessageSeconds()
            val before = indices.map { method.controlBody()[it].namedRegisters() }
            assertTrue("$name: the sent, scheduled and edited times, ${indices.size}", indices.size >= 3)
            val size = method.controlBody().size
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageSecondsPatch.execute(context) })

            val body = method.controlBody()
            assertEquals("$name: nothing added or removed", size, body.size)
            assertEquals(before, indices.map { body[it].namedRegisters() })
            indices.forEach { assertEquals("$name: $it", MESSAGE_TIME_SHOWN, body[it].controlRef()) }
            assertTrue("$name: no time is formatted around the extension", body.none { it.controlRef() == TIME_FORMAT })
            val stub = context.mutableClassDefBy(MESSAGE_TIME).methods.single { it.name == "stockFormat" }.controlBody()
            assertTrue(stub.any { it.controlRef() == TIME_FORMAT })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "messageSeconds" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
