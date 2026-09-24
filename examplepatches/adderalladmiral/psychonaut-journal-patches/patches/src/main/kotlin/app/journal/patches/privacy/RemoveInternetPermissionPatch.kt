package app.journal.patches.privacy

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.asSequence
import app.journal.patches.shared.Constants.COMPATIBILITY_JOURNAL
import org.w3c.dom.Element

// RevenueCat's Purchases.configure() checks the manifest for the INTERNET
// permission *declaration* at startup and throws IllegalArgumentException
// ("Purchases requires INTERNET permission.") immediately if it's missing -
// this is a static manifest check, not a runtime network probe. So by default
// INTERNET stays declared even though (with "Unlock premium" installed) the
// app never actually depends on the network succeeding. ACCESS_NETWORK_STATE
// has no such guard and isn't needed for anything else, so that one is always
// safe to drop.
//
// removeInternet additionally drops INTERNET too, but that's only safe once
// "Purge RevenueCat" has removed the configure() call this check lives in -
// with plain "Unlock premium" alone, dropping INTERNET here just moves the
// same crash earlier.
@Suppress("unused")
val removeInternetPermissionPatch = resourcePatch(
    name = "Remove internet permission",
    description = "Removes the ACCESS_NETWORK_STATE permission, and optionally INTERNET too.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JOURNAL)

    val removeInternet by booleanOption(
        key = "removeInternet",
        default = false,
        title = "Also remove INTERNET",
        description = "Also removes the INTERNET permission. Requires \"Purge RevenueCat\" to " +
            "also be enabled - without it, RevenueCat's SDK crashes on startup when it can't " +
            "find INTERNET declared in the manifest.",
    )

    execute {
        val permissionsToRemove = buildSet {
            add("android.permission.ACCESS_NETWORK_STATE")
            if (removeInternet == true) add("android.permission.INTERNET")
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val usesPermissions = manifest.getElementsByTagName("uses-permission")
                .asSequence()
                .map { it as Element }
                .toList()

            usesPermissions.forEach { element ->
                if (element.getAttribute("android:name") in permissionsToRemove) {
                    manifest.removeChild(element)
                }
            }
        }
    }
}
