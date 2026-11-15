/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.truecaller.patches.acs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch

/**
 * dm1.a(): the only entry to the after-call screen - InCallUIService calls it when a call ends, and it decides
 * whether to show it (dm1.e()) and then starts the full-screen/popup activity. It also ignores the app's own
 * "after call screen" setting for some contacts, which is why turning the setting off is not enough.
 * App-specific, so the fingerprint throws instead of skipping: dm1 is an obfuscated name pinned to 26.43.5.
 */
private val afterCallEntry = Fingerprint(
    definingClass = "Ldm1;",
    name = "a",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Stops the screen Truecaller shows once a call ends. Internal: it applies with the premium patch, because the
 * user asked for it and Manager should not carry a switch for every behaviour. Calls, caller ID and the call log
 * are untouched.
 */
/** Lets the Loki Patches screen show the after-call screen as hidden (Calls page). */
private val afterCallFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.aftercall") }
    }
}

internal val hideAfterCallScreen = bytecodePatch {
    dependsOn(menuPatch, afterCallFlag)

    execute {
        // A switch in the Loki menu (Calls page) decides; on by default. v0 is free at entry (p0 is v1).
        afterCallEntry.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, Lapp/loki/extension/LokiSwitches;->hideAfterCall()Z
                move-result v0
                if-eqz v0, :show
                return-void
            """,
            ExternalLabel("show", afterCallEntry.method.getInstruction(0)),
        )
    }
}
