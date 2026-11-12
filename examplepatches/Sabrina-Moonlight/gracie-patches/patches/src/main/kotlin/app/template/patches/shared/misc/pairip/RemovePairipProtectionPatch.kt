/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.template.patches.shared.misc.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * Skips PairIP license checks and the delayed shutdown (scheduleAppShutdown →
 * System.exit after 30s) that closes clones after a while.
 */
val removePairipProtectionPatch = bytecodePatch(
    name = "Remove Pairip Protection",
    description = "Skips PairIP license checks and the delayed process exit.",
    default = true,
) {
    compatibleWith(GLASS_WIDGETS)

    execute {
        if (classDefByOrNull(LICENSE_CLIENT_CLASS) == null) return@execute

        // Never start a license check from Application.attachBaseContext.
        CheckLicenseFingerprint.method.returnEarly()
        InitializeLicenseCheckFingerprint.method.returnEarly()

        // Do not talk to Play licensing / schedule retries.
        runCatching { BindToLicensingServiceFingerprint.method.returnEarly() }
        runCatching { InitiateFreshLicensingServiceConnectionFingerprint.method.returnEarly() }
        runCatching { ScheduleRepeatedLicenseCheckFingerprint.method.returnEarly() }

        // Response / error paths that open paywall or error UI and then shut down.
        runCatching { ProcessResponseFingerprint.method.returnEarly() }
        runCatching { HandleErrorFingerprint.method.returnEarly() }
        runCatching { StartPaywallActivityFingerprint.method.returnEarly() }
        runCatching { StartErrorDialogActivityFingerprint.method.returnEarly() }

        // Critical: blocks the 30s delayed System.exit(0).
        runCatching { ScheduleAppShutdownFingerprint.method.returnEarly() }

        // Treat local check as already passed if anything still queries it.
        runCatching {
            IsLocalCheckPassedFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }
    }
}
