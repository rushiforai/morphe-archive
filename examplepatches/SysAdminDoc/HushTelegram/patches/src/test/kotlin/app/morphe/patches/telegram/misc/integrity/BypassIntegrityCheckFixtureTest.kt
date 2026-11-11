/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.integrity

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

private const val EMU_DETECTOR = "Lorg/telegram/messenger/EmuDetector;"
private const val EMU_INPUT_DETECTOR = "Lorg/telegram/messenger/EmuInputDevicesDetector;"
private const val SKIP_HOOK = "Lapp/hushtelegram/extension/telegram/misc/IntegrityBypass;->skipIntegrityCheck(I)Z"

class BypassIntegrityCheckFixtureTest {
    @Test
    fun `detector methods ask the extension first in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val types = setOf(EMU_DETECTOR, EMU_INPUT_DETECTOR)
            val hosts = FixtureDex.classes(build, types).values
            if (hosts.isEmpty()) continue
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            bypassIntegrityCheckPatch.execute(context)
            var hooked = 0
            for (type in types) {
                val cls = context.tgMutableClassDefByOrNull(type) ?: continue
                val detect = cls.methods.singleOrNull { m ->
                    m.origName == "detect" && m.origReturnType == "Z" &&
                        m.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(m.accessFlags)
                } ?: continue
                val body = detect.implementation!!.instructions.toList()
                assertEquals("${build.name}: $type const/4 v0, 1", Opcode.CONST_4, body[0].opcode)
                assertEquals(1, (body[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals("${build.name}: $type invoke-static", SKIP_HOOK, body[1].origRef())
                assertEquals("${build.name}: $type move-result", Opcode.MOVE_RESULT, body[2].opcode)
                assertEquals("${build.name}: $type branch", Opcode.IF_EQZ, body[3].opcode)
                assertEquals("${build.name}: $type const/4 false", Opcode.CONST_4, body[4].opcode)
                assertEquals(0, (body[4] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals("${build.name}: $type return false", Opcode.RETURN, body[5].opcode)
                hooked++
            }
            assertTrue("${build.name}: at least one detector hooked", hooked > 0)
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.origName == "bypassIntegrityCheck" }
                .implementation!!.instructions.toList()
            assertEquals("${build.name}: status flag set", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }
}
