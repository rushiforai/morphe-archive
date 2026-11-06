package app.bookspiko.patches.books.misc.gms

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Manifest changes required for GmsCore sign-in. The package name of the app is kept.
 */
internal fun gmsCoreSupportResourcePatch(
    fromPackageName: String,
    vendorGroupIdOption: Option<String>,
    spoofedSignatureOption: Option<String>,
) = resourcePatch {
    execute {
        val vendor = vendorGroupIdOption.value!!
        val gmsCorePackage = "$vendor.android.gms"

        var syncAdapterResource: String? = null

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement

            fun Element.child(tagName: String, vararg attributes: Pair<String, String>) =
                document.createElement(tagName).also { child ->
                    attributes.forEach { (name, value) -> child.setAttribute(name, value) }
                    appendChild(child)
                }

            // GET_ACCOUNTS is declared with maxSdkVersion=22 and therefore not requested on modern
            // Android. GmsCore only lists accounts to apps that hold it.
            val permissions = document.getElementsByTagName("uses-permission")
            var hasGetAccounts = false
            for (i in 0 until permissions.length) {
                val permission = permissions.item(i) as Element
                if (permission.getAttribute("android:name") == "android.permission.GET_ACCOUNTS") {
                    permission.removeAttribute("android:maxSdkVersion")
                    hasGetAccounts = true
                }
            }
            if (!hasGetAccounts) {
                val permission = document.createElement("uses-permission")
                permission.setAttribute("android:name", "android.permission.GET_ACCOUNTS")
                manifest.insertBefore(permission, manifest.firstChild)
            }

            // Package visibility for GmsCore and its account provider.
            val queries = document.getElementsByTagName("queries").item(0) as Element?
                ?: document.createElement("queries").also { manifest.appendChild(it) }
            queries.child("package", "android:name" to gmsCorePackage)
            queries.child("provider", "android:authorities" to "$gmsCorePackage.auth.accounts")

            val application = document.getElementsByTagName("application").item(0) as Element?
                ?: throw PatchException("<application> not found in AndroidManifest.xml")

            val metaData = document.getElementsByTagName("meta-data")
            for (i in 0 until metaData.length) {
                val item = metaData.item(i) as Element
                if (item.getAttribute("android:name") == "android.content.SyncAdapter") {
                    syncAdapterResource = item.getAttribute("android:resource")
                }
            }

            // GmsCore checks these to impersonate the original app towards Google (OAuth client).
            application.child(
                "meta-data",
                "android:name" to "$vendor.android.gms.SPOOFED_PACKAGE_NAME",
                "android:value" to fromPackageName,
            )
            application.child(
                "meta-data",
                "android:name" to "$vendor.android.gms.SPOOFED_PACKAGE_SIGNATURE",
                "android:value" to spoofedSignatureOption.value!!,
            )
        }

        // The library sync adapter is declared for "com.google" accounts. Android only runs a sync
        // adapter for accounts of its type, so the sync the app requests for the GmsCore account was
        // dropped: shelves and other library data never downloaded on a fresh install.
        val syncAdapter = syncAdapterResource?.removePrefix("@")
            ?: throw PatchException("Sync adapter not found in AndroidManifest.xml")
        document("res/$syncAdapter.xml").use { document ->
            val adapter = document.documentElement
            val accountType = adapter.getAttribute("android:accountType")
            if (accountType != GOOGLE_ACCOUNT_TYPE) {
                throw PatchException("Unexpected sync adapter account type: $accountType")
            }
            adapter.setAttribute("android:accountType", vendor)
        }
    }
}
