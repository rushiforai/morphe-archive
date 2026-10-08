/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.stickers

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
import org.junit.Assert.assertTrue
import org.junit.Test

/** The message bubble's time drawer, Telegram's message model and the runtime. */
class HideStickerTimeFixtureTest {
    @Test fun `the extension sees the bubble's message first and a no draws the time the way Telegram does`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                m.returnType == "V" && m.parameterTypes.size == 3 && m.controlBody().any { it.controlRef() == MESSAGE_TYPE } &&
                    m.parameterTypes.any { it.toString() == "Landroid/graphics/Canvas;" }
            }.map(ImmutableClassDef::of) + FixtureDex.classesWhere(build, { true }) { m -> "${m.definingClass}->${m.name}()${m.returnType}" == ANY_STICKER }
                .map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.distinctBy { it.type })
            val (drawTime, message) = context.resolveHideStickerTime()
            val old = ImmutableMethod.of(drawTime)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideStickerTimePatch.execute(context) })

            val before = old.controlBody()
            val after = drawTime.controlBody()
            assertEquals("$name: six instructions", before.size + 6, after.size)
            assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                after.take(6).map { it.opcode })
            assertEquals(listOf(0, drawTime.implementation!!.registerCount - 4), after[0].namedRegisters())
            assertEquals(message, after[1].controlRef())
            assertEquals("$STICKER_TIME->hidden(Ljava/lang/Object;)Z", after[2].controlRef())
            assertEquals("$name: a no draws the stock time", listOf(5, 6), ControlFlow.of(drawTime).normal[4].sorted())
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                    listOf(after[i + 6].opcode, after[i + 6].namedRegisters(), (after[i + 6] as? ReferenceInstruction)?.reference?.toString()))
            }
            val stub = context.mutableClassDefBy(STICKER_TIME).methods.single { it.name == "isSticker" }.controlBody()
            assertTrue("$name: the stub asks Telegram", stub.any { it.controlRef() == ANY_STICKER })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideStickerTime" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
