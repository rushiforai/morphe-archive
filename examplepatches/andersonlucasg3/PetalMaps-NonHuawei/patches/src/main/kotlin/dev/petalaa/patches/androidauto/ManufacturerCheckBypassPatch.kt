package dev.petalaa.patches.androidauto

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS

/**
 * Bytecode patch that bypasses the manufacturer check in [up2.g], which
 * blocks non-Huawei/Honor devices from entering the map.
 *
 * [up2.g] reads ro.product.manufacturer and returns true only if it equals
 * "HUAWEI". This patch makes it unconditionally return true, allowing any
 * Android device to proceed past the splash screen and into the map.
 *
 * Call sites:
 * - [SplashActivity.enterHome] (line 286) — main entry gate
 * - [SplashActivity.A] (line 79) — secondary restriction dialog
 * - [SplashActivity] line 461 — additional check
 *
 * Note: [AutoPetalMapsActivity] was checked and does NOT contain manufacturer
 * checks — it inherits access control from the splash flow.
 */
@Suppress("unused")
val manufacturerCheckBypassPatch = bytecodePatch(
    name = "Manufacturer Check Bypass",
    description = "Forces the Huawei manufacturer check to always return true, " +
            "allowing non-Huawei devices to use the app.",
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    execute {
        ManufacturerCheckFingerprint.method.returnEarly(true)
    }
}
