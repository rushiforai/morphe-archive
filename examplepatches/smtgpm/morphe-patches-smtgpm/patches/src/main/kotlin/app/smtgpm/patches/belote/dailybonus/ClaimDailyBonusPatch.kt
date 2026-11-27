/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.dailybonus

import app.morphe.patcher.patch.rawResourcePatch
import app.smtgpm.patches.belote.shared.Constants.COMPATIBILITY_BELOTE
import app.smtgpm.patches.belote.shared.NativeData
import app.smtgpm.patches.belote.shared.applyNativeEdits
import app.smtgpm.patches.belote.shared.nativeHookPayloadPatch
import app.smtgpm.patches.belote.shared.resignFixPatch

/**
 * Hooks (native/belote/hooks.c) after MenuUIViewController.Show and RefreshDailyBonus. Once per
 * launch they send the wheel's own claim (ActivityBonusManager.Claim, source "WHEEL") without
 * opening the wheel, then reload the inventory. A hook after MenuUIViewController.RefreshShop
 * makes the chip counter count up from the old to the new balance with the game's income
 * animation, so the claim is visible.
 */
@Suppress("unused")
val claimDailyBonusPatch = rawResourcePatch(
    name = "Claim daily bonus automatically",
    description = "Claims the free daily wheel spin in the background when it is ready; the chip counter counts up.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BELOTE)

    dependsOn(resignFixPatch, nativeHookPayloadPatch)

    execute {
        applyNativeEdits(
            listOf(
                NativeData.HOOK_MENU_SHOW,
                NativeData.HOOK_MENU_REFRESH_DAILY_BONUS,
                NativeData.HOOK_MENU_REFRESH_SHOP,
            ),
        )
    }
}
