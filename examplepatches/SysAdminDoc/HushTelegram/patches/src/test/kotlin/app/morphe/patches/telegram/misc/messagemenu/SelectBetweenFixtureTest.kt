/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.util.names.origString
import app.morphe.util.names.origParameterTypes
import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.replaceInstruction
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

/** The selection bar's builder, its click handler, the chat's select method and the stubs that reach them, on the pinned builds. */
class SelectBetweenFixtureTest {
    private val list = "Ljava/util/ArrayList;"

    @Test fun `the button goes in before the bar's last call and the click and select hooks come first`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val base = MessageMenuFixtureTest().hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + base)
            val chat = chatOf(base)
            val sites = context.resolveSelectBetween(chat.type)
            assertEquals("$name: ${sites.missing}", null, sites.missing)
            val create = chat.methods.single { m -> m.parameterTypes.isEmpty() && m.origReturnType == "V" && m.controlBody().any { it.controlRef() == "Lorg/telegram/messenger/R\$string;->SaveToMusic:I" } }
            val before = context.tgMutableClassDefBy(chat.type).methods.single { it.toString() == create.toString() }.controlBody()
            val wrapper = chat.methods.single { m -> m.origParameterTypes == listOf("Lorg/telegram/messenger/MessageObject;", "Z") && m.controlBody().size <= 4 &&
                m.controlBody().any { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef()?.contains("(Lorg/telegram/messenger/MessageObject;ZZ)V") == true } }
            val recorder = wrapper.controlBody().first { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef()!!

            assertEquals("$name", emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })

            // The bar: one call, just before the last button's call and the one return, on the chat itself.
            val bar = context.tgMutableClassDefBy(chat.type).methods.single { it.toString() == create.toString() }.controlBody()
            val last = before.size - 1
            assertEquals("$name: one instruction", before.size + 1, bar.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, bar[last - 1].opcode)
            assertEquals(SELECT_ADD_ITEM, bar[last - 1].controlRef())
            val self = create.implementation!!.registerCount - 1
            assertEquals("$name: the chat", listOf(self), bar[last - 1].namedRegisters())
            assertEquals("$name: the last button is still Telegram's", before[last - 1].controlRef(), bar[last].controlRef())
            assertEquals(Opcode.RETURN_VOID, bar[last + 1].opcode)

            // The click handler: five instructions first, the id coming back in its own register.
            val handler = context.tgMutableClassDefBy(handlerOf(context, chat.type))
            val click = handler.methods.single { m -> m.parameterTypes.map(CharSequence::toString) == listOf("I") && m.origReturnType == "V" && m.controlBody().any { it.controlField()?.origType == chat.origType } }
            val clicking = click.controlBody().filter { it.opcode != Opcode.NOP }
            val id = click.implementation!!.registerCount - 1
            assertEquals(Opcode.MOVE_OBJECT_FROM16, clicking[0].opcode)
            assertEquals(Opcode.IGET_OBJECT, clicking[1].opcode)
            assertEquals(chat.type, clicking[1].controlField()!!.type)
            assertEquals(Opcode.INVOKE_STATIC, clicking[3].opcode)
            assertEquals(SELECT_CLICKED, clicking[3].controlRef())
            assertEquals("$name: the chat and the id", listOf(0, 1), clicking[3].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, clicking[4].opcode)
            assertEquals("$name: the id register takes the answer", listOf(id), clicking[4].namedRegisters())

            // Selecting: the hook sees the chat and the message first.
            val select = context.tgMutableClassDefBy(chat.type).methods.single { it.parameterTypes.size == 3 && recorder.endsWith(it.origString().substringAfter("->")) && it.origString() == recorder }
            val picking = select.controlBody().filter { it.opcode != Opcode.NOP }
            val top = select.implementation!!.registerCount - 4
            assertEquals(Opcode.INVOKE_STATIC_RANGE, picking[0].opcode)
            assertEquals(SELECT_SELECTING, picking[0].controlRef())
            assertEquals("$name: the chat and the message", listOf(top, top + 1), picking[0].namedRegisters())

            val stub = { n: String -> context.tgMutableClassDefBy(SELECT_BETWEEN).methods.single { it.origName == n }.controlBody() }
            assertTrue("$name: the selected messages", stub("selected").any { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.origType == "[Landroid/util/SparseArray;" })
            assertTrue("$name: Telegram's list getter", stub("messages").any { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef()?.endsWith(")Ljava/util/ArrayList;") == true })
            assertEquals("$name: the chat's select method", wrapper.origString(), stub("pick").single { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())
            // The redraw after picking: the bar's "N Selected" title, then the rows' checks (the method walking the list's children), given false.
            val redraw = stub("refresh").filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { call -> chat.methods.single { it.origString() == call.controlRef() } }
            assertEquals("$name: two calls", 2, redraw.size)
            assertTrue("$name: the title", redraw[0].parameterTypes.isEmpty() && redraw[0].controlBody().any { it.controlString() == "MessagesSelected" })
            assertEquals("$name: the rows take a flag", listOf("Z"), redraw[1].origParameterTypes)
            assertTrue("$name: the rows", redraw[1].controlBody().any { it.controlRef()?.contains("->getChildAt(I)") == true })
            val flag = stub("refresh").filter { it.opcode != Opcode.NOP }.let { it[it.indexOfLast { i -> i.opcode == Opcode.INVOKE_VIRTUAL } - 1] }
            assertEquals("$name: false", 0L, (flag as WideLiteralInstruction).wideLiteral)
            assertTrue("$name: the bar's menu", stub("menu").any { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef()?.contains("(Ljava/lang/String;)") == true })
            // The label and the width land in their own slots whichever order the build takes them in (Play's 13.2 has the width first).
            val add = stub("addMenuItem").single { it.opcode == Opcode.INVOKE_VIRTUAL }
            val addDesc = add.controlRef()!!.substringAfter("(").substringBefore(")")
            assertTrue("$name: the add call $addDesc", addDesc in setOf("IILjava/lang/String;I", "IIILjava/lang/String;"))
            assertEquals("$name: menu, ID, icon, label, width", if (addDesc == "IILjava/lang/String;I") listOf(0, 1, 2, 3, 4) else listOf(0, 1, 2, 4, 3),
                add.namedRegisters())
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_select:I", stub("icon").first().controlRef())
            assertEquals("Lorg/telegram/messenger/MessageObject;->getId()I", stub("messageId").single { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())
            assertEquals("Lorg/telegram/messenger/MessageObject;->contentType:I", stub("contentType").single { it.opcode == Opcode.IGET }.controlRef())
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "selectBetween" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed bar leaves the button out and the rest of the menu goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val base = MessageMenuFixtureTest().hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + base)
            val chat = chatOf(base)
            val create = context.tgMutableClassDefBy(chat.type).methods.single { m -> m.parameterTypes.isEmpty() && m.origReturnType == "V" && m.controlBody().any { it.controlRef() == "Lorg/telegram/messenger/R\$string;->SaveToMusic:I" } }
            val body = create.controlBody()
            val share = body.indexOfFirst { it.controlRef() == "Lorg/telegram/messenger/R\$drawable;->msg_shareout:I" }
            create.replaceInstruction(share, "const/16 v${body[share].namedRegisters().single()}, 0x0")
            val sites = context.resolveSelectBetween(chat.type)
            assertTrue("$name: ${sites.missing}", sites.missing != null && "selection bar's builder" in sites.missing!!)
            val warnings = PatchLogCapture.warnings { messageMenuPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "goes on without the Select between button" in warnings.single())
            assertTrue("$name: no hook in the bar", context.tgMutableClassDefBy(chat.type).methods.none { m -> m.controlBody().any { it.controlRef() == SELECT_SELECTING } })
            val flag = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "selectBetween" }.controlBody()
            assertTrue("$name: the build flag stays off", (flag.first() as? WideLiteralInstruction)?.wideLiteral != 1L)
            val menu = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "messageMenuRepeat" }.controlBody()
            assertEquals(1L, (menu.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    private fun chatOf(base: List<ClassDef>) = base.first { cls ->
        cls.methods.any { m ->
            m.origParameterTypes == listOf("Lorg/telegram/messenger/MessageObject;", list, list, list) &&
                m.controlBody().any { it.controlRef() == FORWARD_LABEL }
        }
    }

    /** The class the chat hands its action bar as the click listener. */
    private fun handlerOf(context: app.morphe.patcher.patch.BytecodePatchContext, chat: String): String {
        val methods = context.tgMutableClassDefBy(chat).methods
        for (method in methods) {
            val body = method.controlBody()
            val call = body.indexOfFirst { it.controlRef()?.contains("->setActionBarMenuOnItemClick(") == true }
            if (call < 0) continue
            val argument = body[call].namedRegisters().last()
            val made = (call - 1 downTo 0).first { body[it].opcode == Opcode.NEW_INSTANCE && body[it].namedRegisters() == listOf(argument) }
            return body[made].controlRef()!!
        }
        error("no click listener in $chat")
    }
}

/** The classes the selection bar's button needs beside the menu's own: the click handler, the list adapter and the action bar's classes. */
internal fun selectBetweenHosts(build: File, base: List<ClassDef>): List<ClassDef> = FixtureDex.namedBy(build) {
    val list = "Ljava/util/ArrayList;"
    val chat = base.first { cls ->
        cls.methods.any { m ->
            m.origParameterTypes == listOf("Lorg/telegram/messenger/MessageObject;", list, list, list) &&
                m.controlBody().any { it.controlRef() == FORWARD_LABEL }
        }
    }
    val owned = FixtureDex.classesWhere(build, { true }) { m ->
        m.isMessagesGetter(chat.type) || m.parameterTypes.map(CharSequence::toString) == listOf("I") && m.origReturnType == "V" &&
            m.controlBody().any { it.controlField()?.origType == chat.origType }
    }
    val bar = chat.methods.flatMap { it.controlBody() }.mapNotNull { it.controlRef()?.substringBefore("->") }
        .filter { it.startsWith("Lorg/telegram/ui/ActionBar/") }.toSet() + setOfNotNull(chat.superclass)
    val barClasses = FixtureDex.classes(build, bar).values.map(ImmutableClassDef::of)
    (owned + barClasses).filter { found -> base.none { it.origType == found.origType } }
}
