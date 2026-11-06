package app.ru_apps.sberbank

import app.morphe.patcher.patch.resourcePatch
import app.privacy.patches.analytics.jl4ctuk.disableAnalyticsDependency
import app.ru_apps.sberbank.Constants.COMPATIBILITY_SBERBANK
import app.shared.removeUsesPermissions

/**
 * Sberbank previously had no app-specific privacy patch at all — only the
 * [DisableKasperskySdkPatch] (a bundled third-party SDK stub, not a Sberbank-authored
 * tracking mechanism) and the shared universal patches applied to every app in this
 * repo. The 2026-10-08 exhaustive audit confirmed the app still declares all three
 * advertising-ID permissions live (manifest_ru.sberbankmobile.txt):
 * `com.google.android.gms.permission.AD_ID`,
 * `android.permission.ACCESS_ADSERVICES_ATTRIBUTION`, and
 * `android.permission.ACCESS_ADSERVICES_AD_ID`.
 *
 * Removing them (same mechanism as rustore_jl4ctuk's "Disable ads", ozon_jl4ctuk's
 * "Remove Ozon ads", ozonbank's and max's "Disable advertising ID" patches) makes
 * Google Play Services hand back an all-zero advertising ID to any ad/analytics SDK
 * in the app, closing the GAID-based targeting signal at its source rather than
 * relying on a per-SDK integration being discovered first.
 */
@Suppress("unused")
val disableSberbankAdvertisingIdPatch = resourcePatch(
    name = "Disable Sberbank advertising ID",
    description = "Removes the advertising ID permission so ad and analytics SDKs cannot read the device's real advertising identifier.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBERBANK)

    dependsOn(disableAnalyticsDependency)

    execute {
        document("AndroidManifest.xml").use { document ->
            val removed = document.documentElement.removeUsesPermissions(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
            )
            println("Disable Sberbank advertising ID: removed $removed AD_ID permission(s).")
        }
    }
}
