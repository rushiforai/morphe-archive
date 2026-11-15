/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.splitwise.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.loki.patches.universal.addMenuFlag
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.loki.patches.universal.menuPatch
import app.splitwise.patches.shared.Constants.COMPATIBILITY_SPLITWISE
import app.splitwise.patches.shared.overrideFeatures

/**
 * The Account tab draws the big "Do more with Splitwise Pro" card and the Pro card whenever these two objects are
 * non-null, and never looks at the feature's visible flag: forcing visible=false leaves both on screen. Returning
 * null is the only thing the screen respects.
 */
private val proAdConfig = Fingerprint(
    definingClass = "Lcom/Splitwise/SplitwiseMobile/data/ProAccountCardFeatureStatus;",
    name = "getProAdConfiguration",
    returnType = "Lcom/Splitwise/SplitwiseMobile/data/ProAccountCardFeatureStatus" + '$' + "ProAdConfiguration;",
    parameters = listOf(),
)

private val proSubscriptionConfig = Fingerprint(
    definingClass = "Lcom/Splitwise/SplitwiseMobile/data/ProAccountCardFeatureStatus;",
    name = "getProSubscriptionConfiguration",
    returnType = "Lcom/Splitwise/SplitwiseMobile/data/ProAccountCardFeatureStatus" + '$' + "ProSubscriptionConfiguration;",
    parameters = listOf(),
)

/** Tells the Loki Patches screen this patch was applied. */
private val proAdsFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.proads") }
    }
}

@Suppress("unused")
val hideProAdsPatch = bytecodePatch(
    name = "Hide Pro ads and upsells",
    description = "Removes the full-screen ad after adding an expense, the ad in Activity, the Pro diamond, the " +
        "Pro account and Pro Duo cards, the Pro Pass prompts, the Pro tour screen, the hiring promo and the " +
        "rate-the-app prompt.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPLITWISE)
    dependsOn(menuPatch, proAdsFlag)
    extendWith("extensions/extension.mpe")

    execute {
        // The Account tab's Pro cards ignore the feature flag and check these two objects instead.
        for (card in listOf(proAdConfig, proSubscriptionConfig)) {
            card.matchOrNull()?.method?.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        overrideFeatures(exit = "exitAds")
    }
}
