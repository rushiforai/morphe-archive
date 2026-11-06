package app.ru_apps.ozonbank.ads

import app.morphe.patcher.patch.resourcePatch
import app.ru_apps.ozonbank.shared.Constants.COMPATIBILITY_OZON_BANK_CURRENT
import app.shared.removeUsesPermissions

/**
 * Ozon Bank bundles a real Google AdMob/Ad Manager integration (manifest meta-data
 * `com.google.android.gms.ads.APPLICATION_ID` = `ca-app-pub-1360555279826491~...`,
 * the same publisher ID as the main Ozon app — confirmed live in the 19.37.0
 * manifest during the 2026-10-08 exhaustive audit) with no own AdActivity/init-
 * provider manifest entries to target directly. Before this patch, Ozon Bank had
 * no app-specific ads/targeting patch at all — only the shared universal privacy
 * patches applied to it.
 *
 * Removing the AD_ID permission (same mechanism as rustore_jl4ctuk's "Disable ads"
 * and ozon_jl4ctuk's "Remove Ozon ads") makes Google Play Services hand back an
 * all-zero advertising ID to AdMob and any other ad SDK in the app, closing the
 * targeting signal at its source instead of chasing each SDK's own entry point.
 */
@Suppress("unused")
val disableOzonBankAdvertisingIdPatch = resourcePatch(
    name = "Disable Ozon Bank advertising ID",
    description = "Removes the advertising ID permission so AdMob and other ad SDKs cannot read the device's real advertising identifier.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_BANK_CURRENT)

    execute {
        document("AndroidManifest.xml").use { document ->
            val removed = document.documentElement.removeUsesPermissions(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
            )
            println("Disable Ozon Bank advertising ID: removed $removed AD_ID permission(s).")
        }
    }
}
