package app.mitrosoft.patches.bloomberg

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BLOOMBERG
import org.w3c.dom.Element

private val storagePermissions = listOf(
    "android.permission.WRITE_EXTERNAL_STORAGE",
    "android.permission.READ_EXTERNAL_STORAGE",
)
private val bootPermissions = listOf(
    "android.permission.RECEIVE_BOOT_COMPLETED",
)
private val adIdPermissions = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)
private val installReferrerPermissions = listOf(
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)
private val billingPermissions = listOf(
    "com.android.vending.BILLING",
)

@Suppress("unused")
val permissionsStripPatch = resourcePatch(
    name = "Strip Bloomberg permissions",
    description = "Removes the selected permission groups from AndroidManifest.xml.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLOOMBERG)

    val stripStorage by booleanOption(
        key = "stripStorage",
        default = true,
        title = "Storage",
        description = "Removes READ/WRITE_EXTERNAL_STORAGE.",
    )
    val stripBoot by booleanOption(
        key = "stripBoot",
        default = true,
        title = "Boot start",
        description = "Removes RECEIVE_BOOT_COMPLETED. Background work will not restart after a reboot.",
    )
    val stripAdId by booleanOption(
        key = "stripAdId",
        default = true,
        title = "Ad ID",
        description = "Removes AD_ID and the ACCESS_ADSERVICES_* permissions. Blocks advertising ID access.",
    )
    val stripInstallReferrer by booleanOption(
        key = "stripInstallReferrer",
        default = true,
        title = "Install referrer",
        description = "Removes BIND_GET_INSTALL_REFERRER_SERVICE. Blocks reading the install referrer.",
    )
    val stripBilling by booleanOption(
        key = "stripBilling",
        default = false,
        title = "Billing",
        description = "Removes com.android.vending.BILLING. Breaks in-app purchases and subscriptions.",
    )

    execute {
        val strip = buildSet {
            if (stripStorage ?: false) addAll(storagePermissions)
            if (stripBoot ?: false) addAll(bootPermissions)
            if (stripAdId ?: false) addAll(adIdPermissions)
            if (stripInstallReferrer ?: false) addAll(installReferrerPermissions)
            if (stripBilling ?: false) addAll(billingPermissions)
        }

        document("AndroidManifest.xml").use { manifest ->
            val permissions = manifest.getElementsByTagName("uses-permission")
            // Iterate backwards so removing a node does not shift the indices still to visit.
            for (i in permissions.length - 1 downTo 0) {
                val element = permissions.item(i) as Element
                if (element.getAttribute("android:name") in strip) {
                    element.parentNode.removeChild(element)
                }
            }
        }
    }
}
