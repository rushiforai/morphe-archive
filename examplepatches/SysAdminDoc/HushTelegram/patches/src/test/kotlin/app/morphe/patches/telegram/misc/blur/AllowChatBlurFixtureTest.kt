/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.blur

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
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** Telegram's chat blur rating and the runtime. */
class AllowChatBlurFixtureTest {
    @Test fun `the extension answers first and a no runs Telegram's own rating`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { it.origDefiningClass == SHARED_CONFIG }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val rating = context.resolveAllowChatBlur()
            val old = ImmutableMethod.of(rating)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { allowChatBlurPatch.execute(context) })

            val before = old.controlBody()
            val after = rating.controlBody()
            assertEquals("$name: four instructions", before.size + 4, after.size)
            assertEquals(Opcode.INVOKE_STATIC, after[0].opcode)
            assertEquals("$CHAT_BLUR->allowed()Z", after[0].controlRef())
            assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN), after.subList(1, 4).map { it.opcode })
            assertEquals(listOf(0), after[1].namedRegisters())
            val flow = ControlFlow.of(rating)
            assertEquals("$name: a no runs the stock rating", listOf(3, 4), flow.normal[2].sorted())
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].origRef()),
                    listOf(after[i + 4].opcode, after[i + 4].namedRegisters(), after[i + 4].origRef()))
            }
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "allowChatBlur" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
