/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.premium

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Test
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy

private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val PREMIUM_HOOK = "Lapp/hushtelegram/extension/telegram/misc/PremiumUnlock;->isPremium(I)I"

class UnlockPremiumFixtureTest {
    @Test
    fun `isPremium asks the extension first in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = FixtureDex.classes(build, setOf(USER_CONFIG)).values
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { unlockPremiumPatch.execute(context) })
            val isPremium = context.tgMutableClassDefBy(USER_CONFIG).methods.single { m ->
                m.origName == "isPremium" && m.origReturnType == "Z" &&
                    m.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(m.accessFlags)
            }
            val body = isPremium.implementation!!.instructions.toList()
            assertEquals("${build.name}: const/4 v0, 1", Opcode.CONST_4, body[0].opcode)
            assertEquals(1, (body[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("${build.name}: invoke-static isPremium", Opcode.INVOKE_STATIC, body[1].opcode)
            assertEquals(PREMIUM_HOOK, body[1].origRef())
            assertEquals("${build.name}: move-result", Opcode.MOVE_RESULT, body[2].opcode)
            assertEquals("${build.name}: if-eqz", Opcode.IF_EQZ, body[3].opcode)
            assertEquals("${build.name}: return v0", Opcode.RETURN, body[4].opcode)
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.origName == "unlockPremium" }
                .implementation!!.instructions.toList()
            assertEquals("${build.name}: status flag set", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }
}
