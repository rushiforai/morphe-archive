/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.imo.patches.ads

import app.imo.patches.menu.imoMenuRowPatch
import app.imo.patches.shared.Constants.COMPATIBILITY_IMO
import app.imo.patches.signin.imoSignaturePatch
import app.loki.patches.universal.menuFlagPatch
import app.loki.patches.universal.stopAdSdks
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val AD_SERVICE = "Lcom/imo/android/imoim/ads/AdSDKModuleService;"
private const val AD_SUBSCRIBE = "Lcom/imo/android/imoim/ads/ShowAdSubGuideActivity;"

/**
 * IMO runs all of its advertising through one service, `AdSDKModuleService`, which keeps its readable name. `init`
 * starts the ad managers and with them every network IMO carries (Google, Facebook, Pangle, Unity, Vungle, VK,
 * Yandex, Fyber); `doColdRun` is the launch-time preload of the opening, story, chat and end-of-call ads. Neither is
 * needed for the app to work, so both return at once: with no SDK running there is nothing to load an ad, and the
 * screens that show one are never started.
 */
private val adInit = Fingerprint(
    definingClass = AD_SERVICE,
    name = "init",
    returnType = "Z",
    parameters = listOf(),
)

private val adColdRun = Fingerprint(
    definingClass = AD_SERVICE,
    name = "doColdRun",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "J"),
)

/** The "go ad-free" offer, which IMO opens from several places. It has no state of its own, so it can close at once. */
private val adSubscribeScreen = Fingerprint(
    definingClass = AD_SUBSCRIBE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads (IMO)",
    description = "Removes the ads in IMO: the opening ad, ads in chats, stories and after a call, and the offer to pay " +
        "to go ad-free.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IMO)
    dependsOn(imoSignaturePatch)
    dependsOn(menuFlagPatch("app.loki.menu.hideads"))
    dependsOn(imoMenuRowPatch)

    execute {
        // Without these two the ad networks start; failing loudly beats shipping an app that still shows ads.
        adInit.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        adColdRun.method.addInstructions(0, "return-void")

        // Close the pay-to-remove-ads offer: call the parent's onCreate so the activity is valid, then finish it.
        val parent = adSubscribeScreen.classDef.superclass
            ?: throw PatchException("IMO: the ad-free offer screen has no parent class")
        adSubscribeScreen.method.addInstructions(
            0,
            """
                invoke-super {p0, p1}, $parent->onCreate(Landroid/os/Bundle;)V
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """,
        )

        // Belt and braces: the third-party SDKs that IMO carries in its download-on-demand modules.
        stopAdSdks()
    }
}
