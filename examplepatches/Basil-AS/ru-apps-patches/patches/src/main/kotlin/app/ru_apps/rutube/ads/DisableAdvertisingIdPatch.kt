package app.ru_apps.rutube.ads

import app.morphe.patcher.patch.resourcePatch
import app.ru_apps.rutube.shared.Constants.COMPATIBILITY_RUTUBE
import app.shared.removeUsesPermissions

/**
 * RuTube's "Disable ads" patch ([disableAdsPatch]) prevents its own ad SDK kernel
 * (`ru.rutube.adsdk.core.internal.b`, a mediation kernel for AppLovin, IronSource,
 * Facebook Audience Network, and Fyber — confirmed via the 2026-10-08 dex string
 * scan) from ever being constructed, but it still declares the AD_ID permission
 * (confirmed live, manifest_ru.rutube.app.txt) with nothing removing it — a gap
 * found during the hook-driven audit that the first "disable ads" fix pass missed.
 *
 * Removing the permission (same mechanism as rustore_jl4ctuk's "Disable ads" and
 * every other app in this repo's AD_ID fix) closes the GAID-based targeting signal
 * at its source, independent of whether the mediation kernel itself is ever reached.
 */
@Suppress("unused")
val disableRutubeAdvertisingIdPatch = resourcePatch(
    name = "Disable RuTube advertising ID",
    description = "Removes the advertising ID permission so ad SDKs cannot read the device's real advertising identifier.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUTUBE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val removed = document.documentElement.removeUsesPermissions(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
            )
            println("Disable RuTube advertising ID: removed $removed AD_ID permission(s).")
        }
    }
}
