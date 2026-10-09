/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.sendconfirm

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCall
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The five places the questions stand, the call sites that move, the stubs that run the stock work again, and the runtime. */
class SendConfirmFixtureTest {
    private val callParameters = listOf(
        "Lorg/telegram/tgnet/TLRPC\$User;", "Z", "Z", "Landroid/app/Activity;", "Lorg/telegram/tgnet/TLRPC\$UserFull;",
        "Lorg/telegram/messenger/AccountInstance;",
    )
    private val fixed = setOf(
        "Lorg/telegram/ui/Components/ChatActivityEnterView;", "Lorg/telegram/messenger/MediaController;", "Lorg/telegram/ui/LaunchActivity;",
    )

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), (this as? ReferenceInstruction)?.reference?.toString())
    private fun signature(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    /** A method that starts a call, or one of the places that could stand in front of a send: the classes the resolver reads. */
    private fun wanted(m: Method): Boolean {
        val params = m.parameterTypes.map(CharSequence::toString)
        val instance = !com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(m.accessFlags)
        if (!instance && m.returnType == "V" && params == callParameters) return true
        if (instance && m.returnType == "V" && params == listOf(
                "Landroid/view/View;", "Ljava/lang/Object;", "Ljava/lang/String;", "Ljava/lang/Object;", "Z", "I", "I",
                "Lorg/telegram/messenger/MediaController\$PhotoEntry;", "Z",
            )) return true
        val body = m.controlBody()
        if (body.isEmpty()) return false
        if (instance && m.returnType == "V" && VideoShape.values().any { it.target == params } && body.any { it.controlRef() == CAMERA_ALLOWED }) return true
        return body.any { it.controlCall()?.let { c -> c.returnType == "V" && c.parameterTypes.map(CharSequence::toString) == callParameters } == true }
    }

    @Test fun `each question stands in front of its method and each call goes through the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val found = FixtureDex.classesWhere(build, { true }) { wanted(it) }
            val hosts = (FixtureDex.classes(build, fixed).values + found).distinctBy { it.type }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveSendConfirm()
            assertEquals("$name: the chat bar's sticker send", "Lorg/telegram/ui/Components/ChatActivityEnterView;", site.sticker.definingClass)
            assertEquals("$name: Telegram's end of a recording", "stopRecording", site.voice.name)
            assertEquals("$name: the round video recorder's order of arguments",
                if ("telegram-beta" in name) VideoShape.SOUND_LAST else VideoShape.SOUND_SECOND, site.shape)
            val before = mapOf(
                "sticker" to ImmutableMethod.of(site.sticker), "gif" to ImmutableMethod.of(site.gif), "voice" to ImmutableMethod.of(site.voice),
                "video" to ImmutableMethod.of(site.video), "header" to ImmutableMethod.of(site.header), "profile" to ImmutableMethod.of(site.profile),
            )
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { sendConfirmPatch.execute(context) })

            // A question: the extension's call first, then Telegram's own code, which is everything the method held.
            val gates = mapOf(
                "sticker" to Triple(site.sticker, "sticker", 9), "gif" to Triple(site.gif, "gif", 10), "voice" to Triple(site.voice, "voice", 7),
                "video" to Triple(site.video, site.shape.hook, 9),
            )
            for ((key, gate) in gates) {
                val (method, hook, words) = gate
                val stock = before.getValue(key).controlBody().filter { it.opcode != Opcode.NOP }
                val gated = method.controlBody().filter { it.opcode != Opcode.NOP }
                val top = method.implementation!!.registerCount
                assertEquals("$name $key: four instructions", stock.size + 4, gated.size)
                assertEquals(Opcode.INVOKE_STATIC_RANGE, gated[0].opcode)
                assertTrue("$name $key: the extension's $hook", gated[0].controlRef()!!.startsWith("Lapp/hushtelegram/extension/telegram/misc/SendConfirm;->$hook("))
                assertTrue("$name $key: the answer comes back as a boolean", gated[0].controlRef()!!.endsWith(")Z"))
                assertEquals("$name $key: this and every parameter", (top - words until top).toList(), gated[0].namedRegisters())
                assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.RETURN_VOID), gated.subList(1, 4).map { it.opcode })
                assertEquals("$name $key: the answer lands in a local", listOf(0), gated[1].namedRegisters())
                for (i in stock.indices) assertEquals("$name $key: stock $i", stock[i].shape(), gated[i + 4].shape())
            }

            // A call: the same registers and the same place, to the extension.
            for ((key, method, index) in listOf(Triple("header", site.header, site.headerCall), Triple("profile", site.profile, site.profileCall))) {
                val stock = before.getValue(key).controlBody()
                val moved = method.controlBody()
                assertEquals("$name $key: no instruction added", stock.size, moved.size)
                assertEquals(Opcode.INVOKE_STATIC_RANGE, moved[index].opcode)
                assertEquals("$name $key: the call", "Lapp/hushtelegram/extension/telegram/misc/SendConfirm;->call(Ljava/lang/Object;ZZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V",
                    moved[index].controlRef())
                assertEquals("$name $key: the same six registers", stock[index].namedRegisters(), moved[index].namedRegisters())
                assertEquals("$name $key: the call it replaced", site.startCall, stock[index].controlRef())
                for (i in stock.indices) if (i != index) assertEquals("$name $key: stock $i", stock[i].shape(), moved[i].shape())
            }
            assertEquals("$name: the header call is the only start of a call in its method", 1,
                before.getValue("header").controlBody().count { it.controlRef() == site.startCall })

            val stub = { n: String -> context.mutableClassDefBy(SEND_CONFIRM).methods.single { it.name == n }.controlBody() }
            val again = { n: String, target: Method, words: Int ->
                val call = stub(n).single { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
                assertEquals("$name $n: Telegram's own method again", signature(target), call.controlRef())
                assertEquals("$name $n: its arguments, as the extension holds them", (0 until words).toList(), call.namedRegisters())
            }
            again("resumeSticker", site.sticker, 9)
            again("resumeGif", site.gif, 10)
            again("resumeVoice", site.voice, 7)
            again(site.shape.resume, site.video, 9)
            val start = stub("startCall").single { it.opcode == Opcode.INVOKE_STATIC_RANGE }
            assertEquals(site.startCall, start.controlRef())
            assertEquals((0..5).toList(), start.namedRegisters())
            assertEquals("$name: the main window", site.launchField, stub("launchActivity").first().controlRef())
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "askBeforeSending" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
