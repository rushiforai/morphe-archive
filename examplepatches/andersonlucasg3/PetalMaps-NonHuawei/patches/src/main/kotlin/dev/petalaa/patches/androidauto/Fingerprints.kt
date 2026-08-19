package dev.petalaa.patches.androidauto

import app.morphe.patcher.Fingerprint

/**
 * Fingerprint for [SecurityDetect.irpj] — the native anti-repack integrity check.
 *
 * Method signature: `public static boolean irpj()`
 * Unique strings: "irpj: " (in catch block), "SecurityDetect" (tag)
 *
 * This is a wrapper in `com.huawei.secure.android.common.detect.SecurityDetect`
 * that delegates to the native `SD.irpj()` in libaegissec.so.
 */
internal object SecurityDetectIrpjFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("irpj: "),
)

/**
 * Fingerprint for [up2.g] — the manufacturer check that blocks non-Huawei/Honor devices.
 *
 * Method signature: `public static boolean g(Context)`
 * Unique strings: "Get Manufacturer: " (logging), "HUAWEI" (comparison target)
 *
 * Located in `defpackage.up2` (compiled from EnvironmentUtil.java).
 * Checks `ro.product.manufacturer` system property — returns true only if it equals "HUAWEI".
 * Used by [SplashActivity.enterHome] and [SplashActivity.A] to gate app entry.
 */
internal object ManufacturerCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Get Manufacturer: ", "HUAWEI"),
)
