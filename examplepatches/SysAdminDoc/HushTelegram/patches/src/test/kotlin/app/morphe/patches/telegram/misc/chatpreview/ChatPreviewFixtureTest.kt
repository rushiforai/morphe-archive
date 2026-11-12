/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.chatpreview

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import java.util.concurrent.ConcurrentHashMap
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

private val CHAT_PREVIEW_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/** The screens' base class's preview with a menu, and the stubs that open and close it. */
class ChatPreviewFixtureTest {
    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())
    private fun Method.code() = controlBody().filter { it.opcode != Opcode.NOP }

    /** Every class of the action bar package, every class asking for a preview with a menu, and the extension. */
    private fun hosts(build: File): List<ClassDef> = (ExtensionDex.classes() + CHAT_PREVIEW_HOSTS.hostsOf(build.path) {
        FixtureDex.classesWhere(build, { true }) { m ->
            m.definingClass.startsWith("Lorg/telegram/ui/ActionBar/") ||
                m.controlBody().any { it.call()?.name == PRESENT_WITH_MENU }
        }
    }).distinctBy { it.type }

    private fun status(context: BytecodePatchContext) =
        context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "chatPreviewButtons" }.controlBody()

    @Test fun `the preview hands its menu over first and the stubs open and close it`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(hosts(build))
            val site = context.resolveChatPreview()
            val (base, item) = if (name.contains("-73039")) "i2" to "b1" else "j2" to "b1"
            assertEquals("Lorg/telegram/ui/ActionBar/$base;", site.base)
            assertEquals("Lorg/telegram/ui/ActionBar/$item;", site.item)
            assertEquals("$ACTION_BAR_LAYOUT->K:$PREVIEW_MENU", site.menuField)
            assertEquals("$ACTION_BAR_LAYOUT->q()V", site.expand)
            val before = ImmutableMethod.of(site.present).code()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { chatPreviewButtonsPatch.execute(context) })

            val after = site.present.code()
            val self = site.present.implementation!!.registerCount - 3
            assertEquals("$name: one instruction", before.size + 1, after.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[0].opcode)
            assertEquals(CHAT_PREVIEW_MENU, after[0].controlRef())
            assertEquals("$name: the screen, the preview and the menu", listOf(self, self + 1, self + 2), after[0].namedRegisters())
            for (i in before.indices) assertEquals("$name: stock $i", before[i].shape(), after[i + 1].shape())

            val stub = { n: String -> context.tgMutableClassDefBy(CHAT_PREVIEW).methods.single { it.origName == n }.controlBody() }
            val made = stub("item")
            assertEquals("$name: Telegram's item", "Lorg/telegram/ui/ActionBar/$item;-><init>(Landroid/content/Context;ZZ)V",
                made.single { it.opcode == Opcode.INVOKE_DIRECT }.controlRef())
            // The context, top off, and the last item's flag as the bottom.
            assertEquals("$name: the item's corners", listOf(0, 2, 1, 5), made.single { it.opcode == Opcode.INVOKE_DIRECT }.namedRegisters())
            assertEquals("$name: text and icon", site.text, made.single { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())
            assertEquals(listOf("${site.base}->finishPreviewFragment()V"), stub("finish").filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
            val expanding = stub("expand")
            assertTrue("$name: the menu is cleared", expanding.any { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == site.menuField })
            assertEquals("$name: then the preview opens", site.expand, expanding.last { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_message:I", stub("openIcon").first().controlRef())
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_cancel:I", stub("closeIcon").first().controlRef())
            assertEquals(1L, (status(context).first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a build whose previews build no menu items refuses before changing anything`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(hosts(build).filter { cls ->
                cls.type.startsWith("Lorg/telegram/ui/ActionBar/") || cls.methods.none { m -> m.controlBody().any { it.call()?.name == PRESENT_WITH_MENU } }
            })
            assertTrue("$name: resolving refuses", runCatching { context.resolveChatPreview() }.exceptionOrNull() is PatchException)
            val before = status(context).map { it.opcode }
            val stubs = context.tgMutableClassDefBy(CHAT_PREVIEW).methods.associate { it.origName to it.controlBody().map { i -> i.opcode } }
            assertThrows(PatchException::class.java) { chatPreviewButtonsPatch.execute(context) }
            assertEquals("$name: the switch stays off", before, status(context).map { it.opcode })
            assertEquals("$name: the stubs stay empty", stubs,
                context.tgMutableClassDefBy(CHAT_PREVIEW).methods.associate { it.origName to it.controlBody().map { i -> i.opcode } })
        }
    }
}
