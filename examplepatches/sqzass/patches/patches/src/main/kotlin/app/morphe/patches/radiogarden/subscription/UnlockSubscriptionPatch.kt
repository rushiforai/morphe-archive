/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.radiogarden.subscription

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * RevenueCat entitlement getter. Consumer: hybridcommon EntitlementInfoMapperKt
 * reads isActive() into the "isActive" bridge key -> Hermes JS bundle.
 * Plain iget/return (.locals 1), so returnEarly(true) is register-neutral.
 */
private object PremiumEntitlementFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
)

@Suppress("unused")
val unlockSubscriptionPatch = bytecodePatch(
    name = "Unlock subscription",
    description = "Unlocks Radio Garden premium features (equalizer, sleep timer, removes ads).",
) {
    compatibleWith(
        Compatibility(
            name = "Radio Garden",
            packageName = "com.jonathanpuckey.radiogarden",
            apkFileType = ApkFileType.APKS_REQUIRED,
            targets = listOf(
                AppTarget(version = "4.0.2", versionCode = 6194392),
            ),
        ),
    )

    execute {
        PremiumEntitlementFingerprint.matchSingle().method.returnEarly(true)
    }
}
