/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.pawxy.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks Pawxy premium features (VPN servers, removes paywall and upsell badges).",
) {
    compatibleWith(
        Compatibility(
            name = "Pawxy - Fast VPN & Web Browser",
            packageName = "com.pawxy.browser",
            apkFileType = ApkFileType.APKS_REQUIRED,
            appIconColor = 0x00E4FF,
            targets = listOf(
                AppTarget(version = "1.15.1", versionCode = 104, minSdk = 26),
            ),
        ),
    )

    execute {
        // 1. Patch Subscribe$State.getState() to always return SUBSCRIBED.
        //    This is the central dispatch for premium state — every premium gate
        //    (VPN servers, upsell badges, paywall) reads this value.
        SubscribeStateGetStateFingerprint.matchSingle().method.addInstructions(
            0,
            """
            sget-object p0, Lcom/pawxy/browser/core/revenue/Subscribe${'$'}State;->SUBSCRIBED:Lcom/pawxy/browser/core/revenue/Subscribe${'$'}State;
            return-object p0
            """.trimIndent(),
        )

        // 2. Make the SheetUpgrade subscribe button click a no-op so the billing
        //    flow is never opened when the user taps "Subscribe" on the paywall.
        SubscribeButtonClickFingerprint.matchSingle().method.addInstruction(0, "return-void")

        // 3. VPN upsell badge ("wad_tag") visibility is already forced to GONE by
        //    patch #1 (SheetVPN checks g1 == Subscribe$State.SUBSCRIBED, which is
        //    now always true). VpnPremiumUpsellFingerprint is kept defined for
        //    reference / future use.
    }
}
