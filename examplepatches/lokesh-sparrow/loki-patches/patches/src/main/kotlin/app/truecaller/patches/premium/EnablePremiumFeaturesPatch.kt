/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.truecaller.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.truecaller.patches.acs.hideAfterCallScreen
import app.truecaller.patches.menu.truecallerMenuEntry
import app.truecaller.patches.shared.Constants.COMPATIBILITY_TRUECALLER

private const val FEATURE = "Lcom/truecaller/premium/data/feature/PremiumFeature;"

/**
 * gkx (no package: Truecaller obfuscates its own classes) implements the premium feature gate: `c(PremiumFeature, boolean)` answers "is this feature
 * included for me", from the server's cached availableFeatures list plus the disabledPremiumFeatures pref.
 * Every feature check in the app (12 call sites) goes through it. It is an obfuscated one-letter class, so this
 * patch is pinned to 26.43.5.
 */
private val isFeatureIncluded = Fingerprint(
    definingClass = "Lgkx;",
    name = "c",
    returnType = "Z",
    parameters = listOf(FEATURE, "Z"),
)

/** Premium state in the app's own preferences: "isPremiumExpired" (Q) and "premiumLevel" (N). */
private val isPremium = Fingerprint(
    definingClass = "Lxrx;",
    name = "Q",
    returnType = "Z",
    parameters = listOf(),
)

/** Tells the Loki Patches screen this install is unlocked (its Premium page and Patch status read it). */
private val premiumFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.premium") }
    }
}

@Suppress("unused")
val enablePremiumFeaturesPatch = bytecodePatch(
    name = "Enable premium features (Truecaller)",
    description = "Makes every premium feature the app decides on the device available, and the plan read as active " +
        "instead of Free, and hides the after-call screen (switch in Loki Patches > Calls). Features whose content comes from Truecaller's " +
        "servers (who viewed me, caller ID for unknown numbers, fraud insurance) open but stay empty - their " +
        "data is not in the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)
    dependsOn(menuPatch, truecallerMenuEntry, hideAfterCallScreen, premiumFlag)

    execute {
        // 1. Every feature check answers yes.
        isFeatureIncluded.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 2. Not expired, so the plan reads as active.
        isPremium.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

    }
}
