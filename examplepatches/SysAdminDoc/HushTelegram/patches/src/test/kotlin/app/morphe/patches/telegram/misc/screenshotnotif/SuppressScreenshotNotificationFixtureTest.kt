/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.screenshotnotif

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.origString
import app.morphe.util.names.tgMutableClassDefBy

private const val SCREENSHOT_REQUEST = "Lorg/telegram/tgnet/TLRPC\$TL_messages_sendScreenshotNotification;"
private const val SCREENSHOT_SECRET = "Lorg/telegram/tgnet/TLRPC\$TL_decryptedMessageActionScreenshotMessages;"
private const val SUPPRESS_HOOK = "Lapp/hushtelegram/extension/telegram/misc/ScreenshotNotification;->suppress(I)Z"

class SuppressScreenshotNotificationFixtureTest {
    @Test
    fun `the screenshot notification guard hooks every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                m.implementation?.instructions?.toList()?.any {
                    it.opcode == Opcode.NEW_INSTANCE &&
                        (it as? ReferenceInstruction)?.reference?.origString() in setOf(SCREENSHOT_REQUEST, SCREENSHOT_SECRET)
                } == true
            }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            suppressScreenshotNotificationPatch.execute(context)
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.origName == "suppressScreenshotNotification" }
                .implementation!!.instructions.toList()
            assertEquals("${build.name}: status flag set", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
            val hooked = hosts.flatMap { host ->
                context.tgMutableClassDefBy(host.type).methods.flatMap { method ->
                    method.implementation?.instructions?.toList()?.filter { it.origRef() == SUPPRESS_HOOK }.orEmpty()
                }
            }
            assertTrue("${build.name}: at least one suppress hook landed", hooked.isNotEmpty())
        }
    }
}
