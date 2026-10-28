package app.dieroboter.patches.subzero

import app.morphe.patcher.patch.resourcePatch
import app.dieroboter.patches.shared.Constants.COMPATIBILITY_GEOMETRY_DASH_SUBZERO
import org.w3c.dom.Element
import org.w3c.dom.Node

private val AD_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "com.amazon.privacypass.ATTEST"
)

/**
 * Candidate 5: strip the ad identifier permissions from the manifest.
 *
 * Removes AD_ID and the three Ad Services permissions (ad ID, attribution,
 * topics), so the ad SDKs in the mediation stack get no advertising
 * identifier, plus the Amazon PrivacyPass attestation permission added in
 * 2.2.148 (its only users are the AdMob/OMID ad-measurement internals,
 * already dead once the ad patches run). READ_PHONE_STATE was deliberately
 * left in place originally; the app itself removed it from the manifest in
 * 2.2.148, so there is nothing left to strip there.
 */
@Suppress("unused")
val stripAdPermissionsPatch = resourcePatch(
    name = "Strip ad tracking permissions",
    description = "Removes the ad identifier permissions (AD_ID and the Ad Services " +
        "permissions: ad ID, attribution and topics) and the Amazon PrivacyPass " +
        "attestation permission from the manifest.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GEOMETRY_DASH_SUBZERO)

    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("uses-permission")
            val deadPermissions = mutableListOf<Node>()
            for (i in 0 until permissions.length) {
                val element = permissions.item(i) as Element
                if (element.getAttribute("android:name") in AD_PERMISSIONS) {
                    deadPermissions += element
                }
            }
            deadPermissions.forEach { it.parentNode?.removeChild(it) }
        }
    }
}
