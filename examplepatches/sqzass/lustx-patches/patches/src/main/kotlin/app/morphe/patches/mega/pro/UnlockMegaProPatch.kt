/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.mega.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.matchSingle

@Suppress("unused")
val unlockMegaProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks all MEGA Pro features and removes ads.",
) {
    compatibleWith(
        Compatibility(
            name = "MEGA",
            packageName = "mega.privacy.android.app",
            targets = listOf(
                AppTarget(version = "16.15.2(263201951)(c9da563417)", versionCode = 263201951),
            ),
        ),
    )

    val proTierOption = stringOption(
        key = "proTier",
        default = "PRO_III",
        values = mapOf(
            "PRO Lite" to "PRO_LITE",
            "PRO I" to "PRO_I",
            "PRO II" to "PRO_II",
            "PRO III (Recommended)" to "PRO_III",
            "PRO Flexi" to "PRO_FLEXI",
            "Business" to "BUSINESS",
        ),
        title = "Pro tier",
        description = "Which Pro tier to spoof. PRO III is the highest consumer tier.",
        required = true,
    )

    execute {
        val tier = proTierOption.value!!

        AccountTypeMapperFingerprint.matchSingle().method.addInstructions(
            0,
            """
                sget-object v0, Lmega/privacy/android/domain/entity/AccountType;->$tier:Lmega/privacy/android/domain/entity/AccountType;
                return-object v0
            """.trimIndent(),
        )

        AccountTypeIsPaidFingerprint.matchSingle().method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        GoogleAdsManagerCreateAdRequestFingerprint.matchSingle().method.addInstructions(0, "return-void")

        AdsViewModelCheckAvailabilityFingerprint.matchSingle().method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object v0
            """.trimIndent(),
        )
    }
}
