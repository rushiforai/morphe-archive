/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.settings

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.TELEGRAM_APPLICATION
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The actual vendor application and launcher bodies, independent of the shortcut stand-ins. */
class SettingsVendorFixtureTest {
    @Test
    fun `each declared self settings builder receives its own dedicated native row`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = NativeSettingsFixtures.hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + SettingsPatchHosts.all() + hosts)
            settingsPatch.execute(context)
            val owner = context.mutableClassDefBy(hosts.first().type)
            assertEquals("${build.name}: dedicated row uses the native owner", 1,
                owner.methods.count { it.name == "hushTelegramAddSettingsRow" })
        }
    }

    @Test
    fun `each declared distribution exposes and receives every native settings lifecycle hook`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = FixtureDex.classes(build, setOf(TELEGRAM_APPLICATION,
                "Lorg/telegram/messenger/ApplicationLoader;", MAIN_ACTIVITY))
            assertEquals("${build.name}: exact native application and launcher classes", 3, hosts.size)
            assertEquals("${build.name}: native application base", "Lorg/telegram/messenger/ApplicationLoader;",
                hosts.getValue(TELEGRAM_APPLICATION).superclass)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.values)
            val application = context.declaredInHierarchy(TELEGRAM_APPLICATION, "onCreate")
            val create = context.declaredInHierarchy(MAIN_ACTIVITY, "onCreate", "Landroid/os/Bundle;")
            val intent = context.declaredInHierarchy(MAIN_ACTIVITY, "onNewIntent", "Landroid/content/Intent;")
            val original = listOf(application, create, intent).associate { it.signature() to it.operations() }
            assertTrue("${build.name}: application returns after native setup",
                application.implementation!!.instructions.any { it.opcode == Opcode.RETURN_VOID })
            telegramExtensionPatch.execute(context)
            settingsPatch.execute(context)
            assertEquals("${build.name}: extension initializes before native application startup",
                "Lapp/hushtelegram/extension/shared/Utils;->setContext(Landroid/content/Context;)V",
                (application.implementation!!.instructions.first() as ReferenceInstruction).reference.toString())
            for (method in listOf(application, create, intent)) {
                val added = method.operations().filter { it.second?.startsWith("Lapp/hushtelegram/extension/") == true }
                val expected = when (method) {
                    application -> listOf("setContext", "onApplicationCreate")
                    create -> listOf("onActivityCreate")
                    else -> listOf("onNewIntent")
                }
                assertEquals("${build.name}: complete ${method.signature()} hooks", expected,
                    added.map { it.second!!.substringAfter("->").substringBefore("(") })
                assertEquals("${build.name}: native operations survive ${method.signature()}", original.getValue(method.signature()),
                    method.operations().filterNot { it.second?.startsWith("Lapp/hushtelegram/extension/") == true })
            }
        }
    }

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    // dexlib adds or drops a payload-alignment NOP when the entry hook shifts a switch body.
    private fun Method.operations() = implementation!!.instructions.filter { it.opcode != Opcode.NOP }.map { instruction ->
        instruction.opcode to (instruction as? ReferenceInstruction)?.reference?.toString()
    }
}
