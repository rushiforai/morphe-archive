/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Disables CleverTap initialization. The CleverTap SDK collects the device
 * advertising id (GAID) and sends extensive behavioral telemetry. By returning
 * early from `initCleverTap` the SDK never starts.
 */

package app.morphe.patches.zee5.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.zee5.shared.CleverTapInitFingerprint
import app.morphe.patches.zee5.shared.Constants.COMPATIBILITY_ZEE5_TV

@Suppress("unused")
val disableCleverTapPatch = bytecodePatch(
    name = "Disable CleverTap",
    description = "Prevents the CleverTap analytics SDK from initializing, " +
        "stopping behavioral tracking and advertising-id (GAID) collection."
) {
    compatibleWith(COMPATIBILITY_ZEE5_TV)

    execute {
        CleverTapInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
