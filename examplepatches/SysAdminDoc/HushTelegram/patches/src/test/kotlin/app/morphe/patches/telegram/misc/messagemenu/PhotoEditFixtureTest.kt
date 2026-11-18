/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PlusPending
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

private const val VIEWER = "Lorg/telegram/ui/PhotoViewer;"

/** The method a call instruction makes, by its source name, or null for anything else. */
private fun Instruction.call() = if ((this as? ReferenceInstruction)?.reference is MethodReference) controlRef() else null

/** The chat's media editor opener: takes a caption and a path, and hands the viewer a list, two numbers and a flag. */
private fun Method.isMediaEditorOpener() = origParameterTypes == listOf("Ljava/lang/CharSequence;", "Ljava/lang/String;") &&
    origReturnType == "V" && controlBody().any { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE && it.call()?.contains("(Ljava/util/ArrayList;IIZ") == true }

/** The Telegram classes the chat's media editor opener calls into, beyond the ones [base] already has. */
internal fun photoEditHosts(build: File, base: List<ClassDef>): List<ClassDef> {
    val calls = base.flatMap { it.methods }.filter { it.isMediaEditorOpener() }.flatMap { it.controlBody() }
        .mapNotNull { it.call()?.substringBefore("->") }
    val wanted = calls.filter { it.startsWith("Lorg/telegram/") && base.none { b -> b.type == it } }.toSet()
    return FixtureDex.classes(build, wanted).values.filter { cls -> base.none { it.type == cls.type } }.distinctBy { it.type }.map(ImmutableClassDef::of)
}

/** Edit a copy in the message menu: the stub that opens a photo the way the chat opens a video for editing, or a clean refusal. */
@PlusPending
class PhotoEditFixtureTest {
    @Test fun `the stub makes the chat's own editor calls for a photo and the build flag goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + MessageMenuFixtureTest().hosts(build))
            val chat = context.resolveMessageMenu().chat
            assertEquals("$name: ${context.resolvePhotoEdit(chat).missing}", null, context.resolvePhotoEdit(chat).missing)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })

            val opener = context.tgMutableClassDefBy(chat).methods.single { it.isMediaEditorOpener() }
            val openerCalls = opener.controlBody().mapNotNull { it.call() }
            val open = context.tgMutableClassDefBy(PHOTO_EDIT).methods.single { it.origName == "open" }
            val body = open.controlBody()
            val stubCalls = body.mapNotNull { it.call() }.filter { it.startsWith("Lorg/telegram/") }
            // Every Telegram call the stub makes is one the opener makes, in the opener's order.
            var from = 0
            for (call in stubCalls) {
                val at = openerCalls.subList(from, openerCalls.size).indexOf(call)
                assertTrue("$name: $call isn't the opener's next call (${openerCalls.drop(from)})", at >= 0)
                from += at + 1
            }
            assertEquals("$name: the viewer's instance, parent, entry, visible, close, provider and open", 7, stubCalls.size)
            assertTrue("$name: ${stubCalls.first()}", stubCalls.first().startsWith("$VIEWER->"))
            assertTrue("$name: ${stubCalls.last()}", stubCalls.last().startsWith("$VIEWER->") && stubCalls.last().contains("(Ljava/util/ArrayList;IIZ"))

            // The entry is a photo: its path comes from the stub's path and its one flag (a video in the opener) is 0.
            val entryCall = body.single { it.opcode == Opcode.INVOKE_DIRECT_RANGE }
            val entryTypes = parameterTypes(entryCall.call()!!.substringAfter('(').substringBefore(')'))
            val total = open.implementation!!.registerCount
            fun lastWrite(register: Int) = body.subList(0, body.indexOf(entryCall)).last { (it as? OneRegisterInstruction)?.registerA == register }
            var register = (entryCall as RegisterRangeInstruction).startRegister + 1
            for (type in entryTypes) {
                val write = lastWrite(register)
                when (type) {
                    "Ljava/lang/String;" -> {
                        assertEquals("$name: the path", Opcode.MOVE_OBJECT_FROM16, write.opcode)
                        assertEquals("$name: the path is p1", total - 2, (write as TwoRegisterInstruction).registerB)
                    }
                    "J" -> assertEquals("$name: $type", 0L, (write as WideLiteralInstruction).wideLiteral)
                    else -> assertEquals("$name: $type at v$register", 0, (write as NarrowLiteralInstruction).narrowLiteral)
                }
                register += if (type == "J") 2 else 1
            }
            assertEquals("$name: one flag, the video one", 1, entryTypes.count { it == "Z" })

            val icon = context.tgMutableClassDefBy(PHOTO_EDIT).methods.single { it.origName == "icon" }.controlBody()
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_photoeditor:I", icon.first().controlRef())
            for (flag in listOf("photoEdit", "messageMenuRepeat")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `a build without the chat's media editor opener leaves Edit a copy out and the menu goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = MessageMenuFixtureTest().hosts(build)
            val chat = PatchContexts.of(ExtensionDex.classes() + hosts).resolveMessageMenu().chat
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.map { cls ->
                if (cls.methods.any { it.isMediaEditorOpener() }) withoutOpener(cls) else cls
            })
            assertTrue("$name: ${context.resolvePhotoEdit(chat).missing}", context.resolvePhotoEdit(chat).missing != null)
            val warnings = PatchLogCapture.warnings { messageMenuPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "goes on without Edit a copy" in warnings.single())
            val flag = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "photoEdit" }.controlBody()
            assertTrue("$name: the build flag stays off", (flag.first() as? WideLiteralInstruction)?.wideLiteral != 1L)
            val menu = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "messageMenuRepeat" }.controlBody()
            assertEquals(1L, (menu.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    /** [owner] without its media editor opener, still read through its build's name table. */
    private fun withoutOpener(owner: ClassDef): ClassDef {
        val copy = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations,
            owner.fields, owner.methods.filter { !it.isMediaEditorOpener() })
        return if (owner is FixtureDex.FixtureClassDef) FixtureDex.FixtureClassDef(owner.versionCode, copy) else copy
    }

    /** The types in a method descriptor's parameter list, one per parameter. */
    private fun parameterTypes(list: String): List<String> {
        val types = mutableListOf<String>()
        var i = 0
        while (i < list.length) {
            var end = i
            while (list[end] == '[') end++
            end = if (list[end] == 'L') list.indexOf(';', end) + 1 else end + 1
            types += list.substring(i, end)
            i = end
        }
        return types
    }
}
