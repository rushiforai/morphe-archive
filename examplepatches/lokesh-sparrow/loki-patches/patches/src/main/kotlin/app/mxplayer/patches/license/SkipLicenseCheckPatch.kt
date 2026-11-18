/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.mxplayer.patches.license

import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.mxplayer.patches.menu.settingsRowPatch
import app.mxplayer.patches.integrity.integrityPatch
import app.mxplayer.patches.shared.Constants.COMPATIBILITY_MXPLAYER_PRO
import com.android.tools.smali.dexlib2.AccessFlags

private const val CHECK_LICENSE = "com.android.vending.CHECK_LICENSE"

/** "Is this install licensed?" - asked by the app at start and before every licence prompt. */
private val isLicensed = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(CHECK_LICENSE),
)

/** Starts the Google Play licence check. */
private val startCheck = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/ContextWrapper;"),
    strings = listOf(CHECK_LICENSE),
)

/** The answer "not licensed": clears the stored result and locks the player. */
private val notLicensed = Fingerprint(
    returnType = "V",
    parameters = listOf("L", "I", "I"),
    strings = listOf("gps_manage", "direct_manage"),
)

private val flag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.license") }
    }
}

@Suppress("unused")
val skipLicenseCheckPatch = bytecodePatch(
    name = "Skip license check",
    description = "MX Player Pro asks Google Play to confirm the purchase and locks itself when the answer is " +
        "missing, which is always the case for a patched copy. The check is skipped and the app counts as licensed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MXPLAYER_PRO)
    dependsOn(flag)
    dependsOn(integrityPatch)
    dependsOn(menuPatch)
    dependsOn(settingsRowPatch)

    execute {
        isLicensed.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        startCheck.method.addInstructions(0, "return-void")
        notLicensed.method.addInstructions(0, "return-void")
    }
}
