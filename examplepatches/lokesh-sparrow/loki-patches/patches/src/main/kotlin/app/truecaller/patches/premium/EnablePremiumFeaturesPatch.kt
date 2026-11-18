/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.truecaller.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.truecaller.patches.acs.hideAfterCallScreen
import app.truecaller.patches.menu.truecallerMenuEntry
import app.truecaller.patches.privacy.anonymousProfileViewing
import app.truecaller.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val FEATURE = "Lcom/truecaller/premium/data/feature/PremiumFeature;"
private const val STATUS = "Lcom/truecaller/premium/data/feature/PremiumFeatureStatus;"
private const val TIER = "Lcom/truecaller/premium/data/tier/PremiumTierType;"

// Truecaller renames its own classes on every release (gkx in 26.43.5 is rmx in 26.44.6), so every hook below is
// found by what the method does - the preference key it reads, the enums it uses - never by its class name.

private fun Method.readsString(value: String) =
    implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value } == true

/**
 * The premium feature gate, `c(PremiumFeature, boolean)`: "is this feature included for me", answered from the
 * server's cached feature list and the `disabledPremiumFeatures` preference. Every feature check goes through it.
 */
private val isFeatureIncluded = Fingerprint(
    returnType = "Z",
    parameters = listOf(FEATURE, "Z"),
    strings = listOf("disabledPremiumFeatures"),
)

/** `!isPremiumExpired`: whether the plan is active. Its neighbour that also reads `isInGracePeriod` is left alone. */
private val isPremium = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("isPremiumExpired"),
    custom = { method, _ -> !method.readsString("isInGracePeriod") },
)

/** The plan tier, read from the `premiumLevel` preference (FREE until a purchase). */
private val premiumTier = Fingerprint(
    returnType = TIER,
    parameters = listOf(),
    strings = listOf("premiumLevel"),
)

/** `status == INCLUDED`: how feature cards and settings rows choose between "included" and an upsell. */
private val isStatusIncluded = Fingerprint(
    returnType = "Z",
    parameters = listOf(STATUS),
    filters = listOf(fieldAccess(definingClass = STATUS, name = "INCLUDED")),
)

/** Tells the Loki Patches screen this install is unlocked (its Premium page and Patch status read it). */
private val premiumFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.premium") }
    }
}

private const val ANSWER_YES = """
    const/4 v0, 0x1
    return v0
"""

@Suppress("unused")
val enablePremiumFeaturesPatch = bytecodePatch(
    name = "Enable premium features (Truecaller)",
    description = "Makes the premium features the app decides on the device available, the plan read as Gold " +
        "instead of Free, hides the after-call screen (switch in Loki Patches > Calls) and lets you " +
        "view profiles and search numbers without the other person being told (switches in Loki Patches > " +
        "Privacy). Call Assistant and Family Sharing stay off. Who viewed me, who searched for me, caller ID for " +
        "unknown numbers and fraud insurance show only what Truecaller's servers send to the account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)
    // Ads are removed by their own patch, Hide ads (Truecaller), so users can see and choose them separately.
    dependsOn(menuPatch, truecallerMenuEntry, hideAfterCallScreen, anonymousProfileViewing, premiumFlag)

    execute {
        // 1. Every feature check answers yes - except the two that only work with Truecaller's servers behind them.
        //    Faking those opens screens that fail, so they keep the app's own answer.
        val gate = isFeatureIncluded.method
        gate.addInstructionsWithLabels(
            0,
            """
                sget-object v0, $FEATURE->CALL_ASSISTANT:$FEATURE
                if-eq p1, v0, :own_answer
                sget-object v0, $FEATURE->FAMILY_SHARING:$FEATURE
                if-eq p1, v0, :own_answer
                $ANSWER_YES
            """,
            ExternalLabel("own_answer", gate.getInstruction(0)),
        )

        // 2. The plan reads as active...
        isPremium.method.addInstructions(0, ANSWER_YES)

        // 3. ...at the Gold tier, so screens that show the tier stop offering an upgrade.
        premiumTier.method.addInstructions(
            0,
            """
                sget-object v0, $TIER->GOLD:$TIER
                return-object v0
            """,
        )

        // 4. Feature statuses read as included.
        isStatusIncluded.method.addInstructions(0, ANSWER_YES)
    }
}
