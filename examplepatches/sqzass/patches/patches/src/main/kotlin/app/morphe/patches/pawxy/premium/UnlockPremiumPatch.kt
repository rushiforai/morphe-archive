/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.pawxy.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.returnEarly

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
        PremiumEntitlementFingerprint.matchSingle().method.returnEarly(true)
        SubscribeStateGetStateFingerprint.matchSingle().method.addInstructions(
            0,
            """
            sget-object p0, Lcom/pawxy/browser/core/revenue/Subscribe${'$'}State;->SUBSCRIBED:Lcom/pawxy/browser/core/revenue/Subscribe${'$'}State;
            return-object p0
            """.trimIndent(),
        )
    }
}
