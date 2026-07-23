/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Disables Firebase Analytics initialization. By returning early from the
 * `DefaultFirebaseAnalytics` constructor, FirebaseAnalytics is never wired up
 * and no events or user properties are reported to Google.
 */

package app.morphe.patches.zee5.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.zee5.shared.Constants.COMPATIBILITY_ZEE5_TV
import app.morphe.patches.zee5.shared.FirebaseInitFingerprint

@Suppress("unused")
val disableFirebasePatch = bytecodePatch(
    name = "Disable Firebase analytics",
    description = "Prevents Firebase Analytics from initializing, stopping event " +
        "and user-property reporting to Google."
) {
    compatibleWith(COMPATIBILITY_ZEE5_TV)

    execute {
        FirebaseInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
