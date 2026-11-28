package sabp.morphe.patches.smartaudiobook.privacy

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import sabp.morphe.patches.smartaudiobook.smartAudioBookCompatibility

/**
 * SABP 11.7.8 has no analytics, ads or crash reporters, but the Google Play Billing Library inside it
 * sends usage events ("PLAY_BILLING_LIBRARY") to Google through Google's data transport (the CCT
 * backend). The transport finds its backends through `backend:` meta-data on its discovery service;
 * without the CCT entry, queued events have no backend and are deleted on the device instead of sent.
 * Billing itself is untouched.
 */
@Suppress("unused")
val blockBillingLoggingPatch = resourcePatch(
    name = "Block Google billing logging",
    description = "Stops the Google Play billing library inside SABP from sending usage reports to Google. " +
        "Purchases and the full-version check keep working. SABP has no other analytics, ads or crash reporters.",
) {
    compatibleWith(smartAudioBookCompatibility)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val metas = doc.getElementsByTagName("meta-data")
            val cct = (0 until metas.length).map { metas.item(it) as Element }
                .filter { it.getAttribute("android:name") == "backend:com.google.android.datatransport.cct.CctBackendFactory" }
            cct.forEach { it.parentNode.removeChild(it) }
        }
    }
}
