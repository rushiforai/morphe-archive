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
import app.morphe.patches.telegram.misc.messagemenu.FORWARD_SEND
import app.morphe.util.namedRegisters
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val SET_CHECKED = "->setChecked(Z)V"

/** Instructions other than the nop that pads a switch table; an insert can add or drop that one. */
private fun List<Instruction>.counted() = count { it.opcode != Opcode.NOP }

/** The forward preview's update, the picker's and the Share sheet's sends, the Premium gate's article number, the stubs and the runtime. */
class ForwardHideSenderFixtureTest {
    @Test fun `the extension sees each new forward first and keeps Telegram's article gate`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val found = FixtureDex.classesWhere(build, { true }) { m ->
                val refs = m.controlBody().map { it.controlRef() }
                m.origDefiningClass == PREVIEW_PARAMS || m.origDefiningClass == MESSAGE_OBJECT || m.origDefiningClass == USER_CONFIG ||
                    IS_PREMIUM in refs && FORWARDS in refs && NAME_HIDE in refs || FORWARD_SEND in refs || m.pickerShaped() ||
                    refs.any { it?.endsWith(SET_CHECKED) == true } && m.controlBody().any { it.opcode == Opcode.IPUT_BOOLEAN }
            }
            // The Share sheet the sends read their flag from, and the send menu's items.
            val named = found.map { it.origType }.toSet()
            val owners = found.flatMap { it.methods }.flatMap { m ->
                val body = m.controlBody()
                if (body.any { it.controlRef() == FORWARD_SEND }) body.filter { it.opcode == Opcode.IGET_BOOLEAN }.mapNotNull { it.controlRef()?.substringBefore("->") }
                else body.mapNotNull { it.controlRef() }.filter { it.endsWith(SET_CHECKED) }.map { it.substringBefore("->") }
            }.toSet() - named
            val hosts = (found + FixtureDex.classes(build, owners).values).map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveForwardHideSender()
            assertEquals("$name: articles are type 36", 36, site.article)
            val old = ImmutableMethod.of(site.update)
            val share = site.share
            val made = ImmutableMethod.of(share.made)
            val popup = ImmutableMethod.of(share.popup)
            // Four picker callbacks and the lambda one of them makes, and none of the other forwards.
            assertEquals("$name: the picker's own forwards", 5, site.picks.size)
            assertEquals("$name: one in each callback", 5, site.picks.map { it.method }.distinct().size)
            val picks = site.picks.map { it to ImmutableMethod.of(it.method).controlBody() }
            // The Share sheet's sends, one for each chat it was given, none of them the picker's.
            assertTrue("$name: the Share sheet's sends", share.sends.isNotEmpty())
            assertTrue("$name: apart from the picker's", share.sends.none { s -> site.picks.any { it.method === s.method } })
            val shares = share.sends.map { it to ImmutableMethod.of(it.method).controlBody() }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { forwardHideSenderPatch.execute(context) })

            for ((pick, stock) in picks) {
                val code = pick.method.controlBody()
                assertEquals("$name: two instructions in front of the send", stock.counted() + 2, code.counted())
                assertEquals(Opcode.INVOKE_STATIC_RANGE, code[pick.at].opcode)
                assertEquals(PICKED, code[pick.at].controlRef())
                assertEquals("$name: the messages, the chat and the flag", (pick.first + 1..pick.first + 4).toList(), code[pick.at].namedRegisters())
                assertEquals(Opcode.MOVE_RESULT, code[pick.at + 1].opcode)
                assertEquals("$name: the flag the send takes", listOf(pick.first + 4), code[pick.at + 1].namedRegisters())
                assertEquals(FORWARD_SEND, code[pick.at + 2].controlRef())
                assertEquals("$name: the flag starts false", 0, (stock.subList(0, pick.at).last { it.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) &&
                    it.namedRegisters().first() == pick.first + 4 } as NarrowLiteralInstruction).narrowLiteral)
            }
            for ((send, stock) in shares) {
                val code = send.method.controlBody()
                val siblings = share.sends.filter { it.method === send.method }
                val at = send.at + 2 * siblings.count { it.at < send.at }
                assertEquals("$name: two instructions in front of each Share sheet send", stock.counted() + 2 * siblings.size, code.counted())
                assertEquals(Opcode.INVOKE_STATIC_RANGE, code[at].opcode)
                assertEquals(SHARED, code[at].controlRef())
                assertEquals("$name: the messages, the chat and the turned flag", (send.first + 1..send.first + 4).toList(), code[at].namedRegisters())
                assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
                assertEquals(listOf(send.first + 4), code[at + 1].namedRegisters())
                assertEquals(FORWARD_SEND, code[at + 2].controlRef())
            }

            val sheet = share.made.controlBody()
            assertEquals("$name: one call in the sheet", made.controlBody().counted() + 1, sheet.counted())
            assertEquals(Opcode.IPUT_OBJECT, sheet[share.madeAt - 1].opcode)
            assertEquals(share.messages, sheet[share.madeAt - 1].controlRef())
            assertEquals(SHARES, sheet[share.madeAt].controlRef())
            assertEquals("$name: the sheet itself", listOf(share.self), sheet[share.madeAt].namedRegisters())
            val menu = share.popup.controlBody()
            assertEquals("$name: one call in the send menu", popup.controlBody().counted() + 1, menu.counted())
            assertEquals(Opcode.IPUT_BOOLEAN, menu[share.popupAt - 2].opcode)
            assertEquals(share.flag, menu[share.popupAt - 2].controlRef())
            assertEquals(share.uncheck, menu[share.popupAt - 1].controlRef())
            assertEquals(SHARE_POPUP, menu[share.popupAt].controlRef())
            assertEquals("$name: the sheet and the ticked item", listOf(share.popupAlert, share.item), menu[share.popupAt].namedRegisters())
            val alertFields = context.tgMutableClassDefBy(share.alert).fields.filter { it.origString() == share.flag || it.origString() == share.messages }
            assertEquals("$name: the stubs reach the sheet's list and flag", listOf(true, true), alertFields.map { AccessFlags.PUBLIC.isSet(it.accessFlags) })

            val params = site.update.implementation!!.registerCount - 4
            val before = old.controlBody()
            val after = site.update.controlBody()
            assertEquals("$name: one instruction", before.size + 1, after.size)
            assertEquals(Opcode.INVOKE_STATIC, after[0].opcode)
            assertEquals(STARTS, after[0].controlRef())
            assertEquals("$name: the preview and the messages", listOf(params, params + 1), after[0].namedRegisters())
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].origRef()),
                    listOf(after[i + 1].opcode, after[i + 1].namedRegisters(), after[i + 1].origRef()))
            }

            val stub = { n: String -> context.tgMutableClassDefBy(FORWARD_SENDER).methods.single { it.origName == n }.controlBody() }
            assertTrue("$name: a new forward has no messages yet", FORWARDS in stub("fresh").map { it.controlRef() })
            assertTrue("$name: the account's Premium", IS_PREMIUM in stub("premium").map { it.controlRef() })
            assertTrue("$name: the message's type", MESSAGE_TYPE in stub("type").map { it.controlRef() })
            assertEquals("$name: the article number", 36, (stub("article").first() as NarrowLiteralInstruction).narrowLiteral)
            assertTrue("$name: the flag the send reads", stub("hide").any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == HIDE_SENDERS })
            assertTrue("$name: the account's own chat", "$USER_CONFIG->getClientUserId()J" in stub("self").map { it.controlRef() })
            assertTrue("$name: the sheet's messages", stub("shareMessages").any { it.opcode == Opcode.IGET_OBJECT && it.controlRef() == share.messages })
            assertTrue("$name: the sheet's sender flag", stub("shareHide").any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == share.flag })
            assertTrue("$name: the menu item", share.uncheck in stub("shareUncheck").map { it.controlRef() })
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "forwardHideSender" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
