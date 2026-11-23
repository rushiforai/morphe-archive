package dev.dyno0311.patches.apps.camscanner.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import dev.dyno0311.patches.apps.camscanner.camScannerCompatibility

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Reports a local VIP / super-VIP account status and sync entitlement, unlocking the features " +
        "CamScanner gates behind its subscription check on device. Cloud credits, Word/Excel conversion and " +
        "other server-side work stay validated remotely."
) {
    compatibleWith(camScannerCompatibility)

    execute {
        // 0x1 == VIP status code (stored default is 0x2 == free)
        VipStatusCodeFingerprint.method.returnEarly(1L)
        // A far-future expiry keeps the account state consistent; forcing only the status boolean leaves the
        // entitlement expired and routes the local filter pipeline into a VIP path that cannot complete.
        VipExpiryFingerprint.method.returnEarly(9999999999L)
    }
}
