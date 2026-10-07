/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.notifications

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

/** The silent notification check, the stubs and the runtime. */
class SilenceNonContactsFixtureTest {
    private val hostTypes = setOf(NOTIFICATIONS, MESSAGE_OBJECT, TL_USER, "Lorg/telegram/messenger/MessagesController;")

    @Test fun `a message from a stranger counts as silent before Telegram's own check`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m -> m.definingClass in hostTypes }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val check = context.resolveSilenceNonContacts()
            val old = ImmutableMethod.of(check)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { silenceNonContactsPatch.execute(context) })

            val message = check.implementation!!.registerCount - 1
            val before = old.controlBody()
            val after = check.controlBody()
            assertEquals("$name: five instructions", before.size + 5, after.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), after.take(5).map { it.opcode })
            assertEquals(SILENCED, after[0].controlRef())
            assertEquals("$name: the message", listOf(message), after[0].namedRegisters())
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                    listOf(after[i + 5].opcode, after[i + 5].namedRegisters(), (after[i + 5] as? ReferenceInstruction)?.reference?.toString()))
            }

            val stub = { n: String -> context.mutableClassDefBy(NON_CONTACTS).methods.single { it.name == n }.controlBody().map { it.controlRef() } }
            assertTrue("$MESSAGE_OBJECT->getDialogId()J" in stub("dialog"))
            assertTrue("Lorg/telegram/messenger/MessagesController;->getUser(Ljava/lang/Long;)$TL_USER" in stub("user"))
            for (flag in listOf("contact", "bot", "self")) assertTrue("$TL_USER->$flag:Z" in stub(flag))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "silenceNonContacts" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
