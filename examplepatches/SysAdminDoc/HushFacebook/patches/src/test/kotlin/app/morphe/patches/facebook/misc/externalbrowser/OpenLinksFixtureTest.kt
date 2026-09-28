/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.externalbrowser

import app.morphe.Fixtures
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * The redirect as the patch puts it into both browser activities of each declared build, run on
 * copies of their lifecycle methods: after the super call that passes the method's own parameters,
 * in a register nothing reads from there on, jumping to the trace section's close in onCreate and
 * returning in onNewIntent. On both builds that register is v0, which the patch used to take on
 * trust.
 */
class OpenLinksFixtureTest {
    private val redirect = "Lapp/morphe/extension/facebook/misc/ExternalBrowser;->" +
        "redirect(Landroid/app/Activity;Landroid/content/Intent;)Z"

    @Test
    fun `each browser activity's redirect goes in with v0 on each declared build`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val classes = FixtureDex.classes(bundle, IN_APP_BROWSERS.toSet())
                assertEquals("${bundle.name}: browser activities", IN_APP_BROWSERS.toSet(), classes.keys)
                for (activity in IN_APP_BROWSERS) {
                    for ((name, parameter, fromActivity) in listOf(
                        Triple("onCreate", "Landroid/os/Bundle;", true),
                        Triple("onNewIntent", "Landroid/content/Intent;", false),
                    )) {
                        val where = "${bundle.name}: $activity->$name"
                        val method = MutableMethod(lifecycleMethod(classes.getValue(activity).methods, activity, name, parameter))
                        val injectAt = method.ownSuperCallIndex() + 1
                        method.hookRedirect(intentFromActivity = fromActivity)

                        val body = method.implementation!!.instructions.toList()
                        val call = body.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == redirect }
                        assertEquals("$where: the redirect's place", injectAt + if (fromActivity) 2 else 0, call)
                        val passed = (body[call] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) }
                        val self = method.implementation!!.registerCount - 2
                        assertEquals("$where: the activity and the intent", listOf(self, if (fromActivity) 0 else self + 1), passed)
                        assertEquals("$where: the answer's register", 0, (body[call + 1] as OneRegisterInstruction).registerA)
                        // onCreate opens a trace section, so its redirect jumps to the close; onNewIntent returns.
                        val branch = if (fromActivity) Opcode.IF_NEZ else Opcode.IF_EQZ
                        assertEquals("$where: the branch", branch, body[call + 2].opcode)
                    }
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
