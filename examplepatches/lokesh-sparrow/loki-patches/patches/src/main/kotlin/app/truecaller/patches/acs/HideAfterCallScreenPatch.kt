/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.truecaller.patches.acs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val AFTER_CALL_SCREEN = "Lcom/truecaller/acs/AfterCallScreen;"
private const val HISTORY_EVENT = "Lcom/truecaller/acs/data/AfterCallHistoryEvent;"
private const val SWITCH = "Lapp/loki/extension/LokiSwitches;->hideAfterCall()Z"

/**
 * The two screens Truecaller shows once a call ends. Both are its own unobfuscated activities, so they are the
 * backstop for every route that starts them directly - missed calls among them, which the app's own "hide" switches
 * say they do not cover.
 */
private fun afterCallActivity(type: String) = Fingerprint(
    definingClass = type,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private val fullScreen = afterCallActivity("Lcom/truecaller/acs/ui/fullscreen/AfterCallScreenActivity;")
private val popup = afterCallActivity("Lcom/truecaller/acs/ui/popup/AfterCallPopupActivity;")

/** Lets the Loki Patches screen show the after-call screen as hidden (Calls page). */
private val afterCallFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.aftercall") }
    }
}

/** True when the method has a register free at entry for the switch's answer. */
private fun MutableMethod.hasLocal(): Boolean {
    val impl = implementation ?: return false
    val parameters = parameterTypes.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    return impl.registerCount - parameters >= 1
}

/**
 * Stops the screen Truecaller shows once a call ends - for every call type, missed calls included. Internal: it
 * applies with the premium patch, and a switch in the Loki menu (Calls page, on by default) decides at run time.
 * Calls, caller ID and the call log are untouched.
 */
internal val hideAfterCallScreen = bytecodePatch {
    dependsOn(menuPatch, afterCallFlag)

    execute {
        // 1. The after-call service: the one class implementing Truecaller's AfterCallScreen interface. Every
        //    finished call reaches it (service, caller ID window, notifications, calls made from Truecaller) through
        //    a show-for-this-call method taking the call event, or a no-argument warm-up. Guard all of them.
        var service: app.morphe.patcher.util.proxy.mutableTypes.MutableClass? = null
        classDefForEach { if (AFTER_CALL_SCREEN in it.interfaces) service = mutableClassDefBy(it) }
        val entries = service?.methods?.filter { method ->
            method.returnType == "V" && method.name != "<init>" &&
                (method.parameterTypes.isEmpty() || method.parameterTypes.map { it.toString() } == listOf(HISTORY_EVENT))
        }.orEmpty()
        if (entries.isEmpty()) throw PatchException("No $AFTER_CALL_SCREEN implementation with show methods")
        entries.forEach { method ->
            if (!method.hasLocal()) throw PatchException("${method.name}: no free register for the switch")
            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $SWITCH
                    move-result v0
                    if-eqz v0, :show
                    return-void
                """,
                ExternalLabel("show", method.getInstruction(0)),
            )
        }

        // 2. The screens themselves close before they are drawn. finish() first, then the activity's own onCreate
        //    runs as usual (it must: skipping super.onCreate crashes), and Android never shows the window.
        listOf(fullScreen, popup).forEach { screen ->
            val method = screen.method
            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $SWITCH
                    move-result v0
                    if-eqz v0, :show
                    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                """,
                ExternalLabel("show", method.getInstruction(0)),
            )
        }
    }
}
