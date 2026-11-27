// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.ads.disable

import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.method
import app.reseam.patch.methods
import app.reseam.patch.patch
import app.reseam.patch.points

private const val MOBILE_ADS_PROVIDER = "com.google.android.gms.ads.MobileAdsInitProvider"

private val adsEnabled = method("Sync ads preference read") {
    params("android.content.Context")
    returns(Type.Boolean)
    flags(AccessFlags.STATIC)
    strings("ADS ENABLED ID: ", "SyncIapHelper")
}

private val adSites = methods("Consumers of Sync ad eligibility") {
    calls(adsEnabled)
}.points("Ad eligibility result") {
    calls(adsEnabled)
    then { resultOf(Type.Boolean) }
}

private val purchaseAndDiagnosticOwners = setOf(
    // The purchase-restore callback has an obfuscated inner class name in version 23033.
    "Lcom/laurencedawson/reddit_sync/ui/views/onboarding/OnboardingRestoreLinearLayout\$a;",
    "Lcom/laurencedawson/reddit_sync/ui/views/editor/EditorView;",
)

val disableAds = patch(SyncPatchStrings.disableAds) {
    description(SyncPatchStrings.disableAdsDescription)
    compatibleWith(syncForReddit)

    execute {
        // Preserve actual purchase state in onboarding and diagnostic reports.
        val points = adSites.all.filterNot { it.method.owner in purchaseAndDiagnosticOwners }
            .map { it.captureAs("showAds", Type.Boolean) }
        check(points.size == 15) { "Expected fifteen ad eligibility uses, found ${points.size}" }
        points.forEach { it.index }
        manifest.edit {
            findByTag("provider").single { it["android:name"] == MOBILE_ADS_PROVIDER }
                .setBool("android:enabled", false)
        }
        points.forEach {
            it.after { capture("showAds").assign(bool(false)) }
        }
    }
}
