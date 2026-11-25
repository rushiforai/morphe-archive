/*
 * Copyright (C) 2026 Quantro100
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Ported from Quantro100/Morphe-patches:
 * https://github.com/Quantro100/Morphe-patches/commit/f384d233384d2bc3d63d9f5011507f774d586b6f
 * Commit f384d233384d2bc3d63d9f5011507f774d586b6f (2026-06-02),
 * patches/src/main/kotlin/app/morphe/patches/aliexpress/analytics/DisableAnalyticsPatch.kt
 */
package patches.aliexpress.analytics

import patches.aliexpress.ALIEXPRESS

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.matchSingle
import patches.aliexpress.settings.markPatchApplied
import patches.aliexpress.settings.returnWhenEnabled
import patches.aliexpress.signin.spoofSignaturePatch
import patches.aliexpress.putApplicationMetaData
import patches.aliexpress.descriptor
import patches.aliexpress.replaceStub

private const val PATCH_SETTINGS_CLASS = "Lnl/johninnl/aliexpress/PatchSettings;"
private const val FIREBASE_INITIALIZER_REGISTERS = 3

private val analyticsDefaultsPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            document.putApplicationMetaData("firebase_analytics_collection_enabled", "false")
        }
    }
}

private const val DESCRIPTION = "Stops usage statistics and affiliate link reports."

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = DESCRIPTION,
) {
    compatibleWith(ALIEXPRESS)
    dependsOn(spoofSignaturePatch, analyticsDefaultsPatch)

    execute {
        markPatchApplied("disableAnalytics", DESCRIPTION)
        val firebaseInstance = FirebaseInstanceFingerprint.matchSingle().method
        val firebaseCollection = FirebaseCollectionFingerprint.matchSingle().method
        mutableClassDefBy(PATCH_SETTINGS_CLASS).replaceStub(
            "initializeAnalytics",
            FIREBASE_INITIALIZER_REGISTERS,
            """
                invoke-static { p0 }, ${descriptor(firebaseInstance)}
                move-result-object v0
                invoke-virtual { v0, p1 }, ${descriptor(firebaseCollection)}
                return-void
            """.trimIndent(),
        )
        UtSendFingerprint.matchSingle().method.returnWhenEnabled("$PATCH_SETTINGS_CLASS->disableAnalytics()Z")
        AffiliateUrlTrackingFingerprint.matchSingle().method.returnWhenEnabled("$PATCH_SETTINGS_CLASS->disableAnalytics()Z")
        AffiliateLongUrlTrackingFingerprint.matchAll(2..2).forEach { it.method.returnWhenEnabled("$PATCH_SETTINGS_CLASS->disableAnalytics()Z") }
    }
}
