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
 * Hooks (native/belote/hooks.c) after FortuneWheelUIViewController.Show (spin),
 * OnFreeSpinCompleted (collect) and the collect animation callback (close).
 */
@Suppress("unused")
val autoCollectDailyWheelPatch = rawResourcePatch(
    name = "Auto-collect daily wheel",
    description = "Opening the daily wheel with a free spin spins it, collects the chips and closes it.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BELOTE)

    dependsOn(resignFixPatch, nativeHookPayloadPatch)

    execute {
        applyNativeEdits(
            listOf(
                NativeData.HOOK_WHEEL_SHOW,
                NativeData.HOOK_WHEEL_FREE_SPIN_COMPLETED,
                NativeData.HOOK_WHEEL_COLLECT_DONE,
            ),
        )
    }
}
