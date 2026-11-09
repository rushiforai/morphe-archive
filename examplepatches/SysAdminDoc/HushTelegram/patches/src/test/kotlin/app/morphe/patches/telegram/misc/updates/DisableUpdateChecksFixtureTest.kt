/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.updates

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.settings.MAIN_ACTIVITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.tgMutableClassDefBy

/**
 * Disable update checks on each declared build. telegram.org's build has the launcher activity's
 * `(boolean)` update check, found by the field it reads and the request it builds rather than by its
 * own obfuscated name, and the patch puts the extension's question in front of it and leaves the rest
 * of the method alone. Google Play's build has no update check from 13.2 on, so the patch passes
 * there without touching the activity and leaves its status off.
 */
class DisableUpdateChecksFixtureTest {
    private val updateChecks = "Lapp/hushtelegram/extension/telegram/misc/UpdateChecks;"
    private val getAppUpdate = "Lorg/telegram/tgnet/TLRPC\$TL_help_getAppUpdate;"
    private val sharedConfig = "Lorg/telegram/messenger/SharedConfig;"
    private val pendingUpdate = "$sharedConfig->pendingAppUpdate:Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;"
    private val pendingBuild = "$sharedConfig->pendingAppUpdateBuildVersion:I"

    @Test
    fun `the web build's update check is hooked, and the Play build has none to hook`() {
        val builds = Fixtures.declaredBuilds()
        assertTrue("both distributions are declared", builds.any { it.name.startsWith("telegram-web-") } &&
            builds.any { it.name.startsWith("telegram-play-") })
        for (build in builds) {
            val where = build.name
            val classes = FixtureDex.classes(build, setOf(MAIN_ACTIVITY, sharedConfig))
            assertEquals("$where: the launcher activity and SharedConfig", setOf(MAIN_ACTIVITY, sharedConfig), classes.keys)

            val checks = classes.getValue(MAIN_ACTIVITY).methods.filter {
                it.origParameterTypes == listOf("Z") && it.origReturnType == "V" &&
                    it.instructions().any { instruction ->
                        instruction.opcode == Opcode.NEW_INSTANCE && instruction.origRef() == getAppUpdate
                    }
            }
            // SharedConfig.isAppUpdateAvailable(): what the Update Telegram bar asks.
            val waiting = classes.getValue(sharedConfig).methods.filter { method ->
                method.origParameterTypes.isEmpty() && method.origReturnType == "Z" &&
                    method.instructions().map { it.origRef() }.containsAll(listOf(pendingUpdate, pendingBuild))
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            assertEquals("$where: no warning", emptyList<String>(),
                PatchLogCapture.warnings { disableUpdateChecksPatch.execute(context) })
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.origName == "disableUpdateChecks" }.instructions()

            if (build.name.startsWith("telegram-play-")) {
                assertTrue("$where: Play has no update check", checks.isEmpty())
                assertTrue("$where: and no saved update to ask about", waiting.isEmpty())
                val stock = classes.getValue(MAIN_ACTIVITY).methods.associate { it.toString() to it.instructions().size }
                val after = context.tgMutableClassDefBy(MAIN_ACTIVITY).methods.associate { it.toString() to it.instructions().size }
                assertEquals("$where: the launcher activity is left alone", stock, after)
                assertNotEquals("$where: SettingsStatus.disableUpdateChecks() stays off",
                    1, (status[0] as? NarrowLiteralInstruction)?.narrowLiteral)
                continue
            }
            val original = checks.single()

            val patched = context.tgMutableClassDefBy(MAIN_ACTIVITY).methods.single { it.sameSignatureAs(original) }
            val before = original.instructions()
            val after = patched.instructions()
            assertEquals("$where: instructions added", before.size + 4, after.size)
            assertEquals("$where: asks the extension first", Opcode.INVOKE_STATIC, after[0].opcode)
            assertEquals("$updateChecks->skipUpdateCheck()Z", (after[0] as ReferenceInstruction).reference.origString())
            assertEquals(Opcode.MOVE_RESULT, after[1].opcode)
            assertEquals(Opcode.IF_EQZ, after[2].opcode)
            assertEquals("$where: the early return", Opcode.RETURN_VOID, after[3].opcode)
            assertEquals("$where: nothing else moved", before.map { it.opcode }, after.subList(4, after.size).map { it.opcode })

            // An update found while the switch was off gets a no while it's on (#60).
            val stock = waiting.single()
            val asked = context.tgMutableClassDefBy(sharedConfig).methods.single { it.sameSignatureAs(stock) }.instructions()
            val kept = stock.instructions()
            assertEquals("$where: instructions added to isAppUpdateAvailable", kept.size + 5, asked.size)
            assertEquals("$updateChecks->hideWaitingUpdate()Z", (asked[0] as ReferenceInstruction).reference.origString())
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN),
                asked.subList(0, 5).map { it.opcode })
            assertEquals("$where: the answer is no", 0, (asked[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("$where: the stock answer follows", kept.map { it.opcode }, asked.subList(5, asked.size).map { it.opcode })

            assertEquals("$where: SettingsStatus.disableUpdateChecks() answers true first", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.sameSignatureAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
}
