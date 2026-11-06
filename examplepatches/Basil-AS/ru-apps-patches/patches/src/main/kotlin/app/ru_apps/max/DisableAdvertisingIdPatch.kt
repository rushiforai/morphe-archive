package app.ru_apps.max

import app.morphe.patcher.patch.resourcePatch
import app.ru_apps.max.Constants.COMPATIBILITY_MAX
import app.shared.removeUsesPermissions

/**
 * MAX still declares the AD_ID permission (confirmed live in the 2026-10-08
 * exhaustive audit, manifest_ru.oneme.app.txt) even though it has no app-specific
 * ads/targeting patch at all — only the shared universal privacy patches applied
 * to it.
 *
 * Removing the AD_ID permission (same mechanism as rustore_jl4ctuk's "Disable ads",
 * ozon_jl4ctuk's "Remove Ozon ads", and ozonbank's "Disable Ozon Bank advertising ID")
 * makes Google Play Services hand back an all-zero advertising ID to any ad/analytics
 * SDK in the app, closing the GAID-based targeting signal at its source.
 */
@Suppress("unused")
val disableMaxAdvertisingIdPatch = resourcePatch(
    name = "Disable MAX advertising ID",
    description = "Removes the advertising ID permission so ad and analytics SDKs cannot read the device's real advertising identifier.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAX)

    execute {
        document("AndroidManifest.xml").use { document ->
            val removed = document.documentElement.removeUsesPermissions(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
            )
            println("Disable MAX advertising ID: removed $removed AD_ID permission(s).")
        }
    }
}
