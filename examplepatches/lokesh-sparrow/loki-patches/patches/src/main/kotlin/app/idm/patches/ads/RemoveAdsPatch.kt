/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.idm.patches.ads

import app.idm.patches.menu.idmMenuRowPatch
import app.idm.patches.shared.Constants.APPODEAL
import app.idm.patches.shared.Constants.COMPATIBILITY_IDM
import app.loki.patches.universal.menuFlagPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * 1DM routes every ad through Appodeal and a mediation tail (AppLovin, ironSource, Unity, Yandex, Pangle,
 * Vungle, BidMachine). Rather than chase seven SDKs, the two calls the app itself makes are stopped:
 * the bootstrap and the show. Nothing is loaded, so no adapter is ever asked for an ad.
 */
private fun appodealMethod(returnType: String, parameters: List<String>) = Fingerprint(
    returnType = returnType,
    parameters = parameters,
    custom = { _, classDef -> classDef.type == APPODEAL },
)

private val initializeSimple = appodealMethod("V", listOf("Landroid/content/Context;", "Ljava/lang/String;", "I"))
private val initializeWithCallback =
    appodealMethod("V", listOf("Landroid/content/Context;", "Ljava/lang/String;", "I", "Lcom/appodeal/ads/initializing/ApdInitializationCallback;"))
private val showSimple = appodealMethod("Z", listOf("Landroid/app/Activity;", "I"))
private val showWithPlacement = appodealMethod("Z", listOf("Landroid/app/Activity;", "I", "Ljava/lang/String;"))

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads (1DM)",
    description = "Removes the ads in 1DM: banners, full-screen ads and the prompts that offer a reward for watching one.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDM)
    dependsOn(menuFlagPatch("app.loki.menu.hideads"))
    dependsOn(idmMenuRowPatch)

    execute {
        initializeSimple.method.addInstructions(0, "return-void")
        initializeWithCallback.method.addInstructions(0, "return-void")
        showSimple.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        showWithPlacement.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
