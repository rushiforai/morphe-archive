package app.morphe.patches.dialer

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.dialer.DialerConstants.COMPATIBILITY_GOOGLE_DIALER

/**
 * Clones package to com.google.android.dialer.amoled for non-rooted users.
 * Combines full v7 manifest isolation with HelioFloxZ node removal.
 */
@Suppress("unused")
val googleDialerClonePatch = resourcePatch(
    name = "Clone Dialer Package",
    description = "Changes package to com.google.android.dialer.amoled for non-rooted install. " +
                  "Leave OFF on rooted devices to mount over stock dialer without crashing.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOOGLE_DIALER)

    execute {
        val packageName = "com.google.android.dialer"
        val newPackageName = "com.google.android.dialer.amoled"

        document("AndroidManifest.xml").use { doc ->
            // 1. Root package attribute
            doc.documentElement.setAttribute("package", newPackageName)

            // 2. Custom permission declarations & usages
            val permissions = doc.getElementsByTagName("permission")
            for (i in 0 until permissions.length) {
                val node = permissions.item(i)
                val name = node.attributes?.getNamedItem("android:name")?.nodeValue.orEmpty()
                if (name.startsWith("$packageName.")) {
                    val newName = name.replaceFirst(packageName, newPackageName)
                    node.attributes?.getNamedItem("android:name")?.nodeValue = newName
                }
            }

            val usesPermissions = doc.getElementsByTagName("uses-permission")
            for (i in 0 until usesPermissions.length) {
                val node = usesPermissions.item(i)
                val name = node.attributes?.getNamedItem("android:name")?.nodeValue.orEmpty()
                if (name.startsWith("$packageName.")) {
                    val newName = name.replaceFirst(packageName, newPackageName)
                    node.attributes?.getNamedItem("android:name")?.nodeValue = newName
                }
            }

            // 3. Provider authorities isolation
            val providers = doc.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val node = providers.item(i)
                val authAttr = node.attributes?.getNamedItem("android:authorities")
                val authorities = authAttr?.nodeValue.orEmpty()
                if (authorities.isNotEmpty()) {
                    val newAuthorities = authorities.split(';').map { auth ->
                        if (auth.startsWith("$packageName.")) {
                            auth.replaceFirst(packageName, newPackageName)
                        } else if (!auth.endsWith(".amoled")) {
                            "$auth.amoled"
                        } else {
                            auth
                        }
                    }
                    authAttr?.nodeValue = newAuthorities.joinToString(";")
                }
            }

            // 4. HelioFloxZ approach: REMOVE com.google.android.dialer.support completely
            val libraryNodes = doc.getElementsByTagName("uses-library")
            for (i in libraryNodes.length - 1 downTo 0) {
                val node = libraryNodes.item(i)
                val name = node.attributes?.getNamedItem("android:name")?.nodeValue
                if (name == "com.google.android.dialer.support") {
                    println("Removing com.google.android.dialer.support uses-library node")
                    node.parentNode?.removeChild(node)
                }
            }

            // 5. Remove DroidGuard client meta-data tags to prevent Play Integrity launch crash
            val metaNodes = doc.getElementsByTagName("meta-data")
            for (i in metaNodes.length - 1 downTo 0) {
                val node = metaNodes.item(i)
                val name = node.attributes?.getNamedItem("android:name")?.nodeValue.orEmpty()
                if (name.contains("droidguardclient")) {
                    println("Removing droidguardclient meta-data: $name")
                    node.parentNode?.removeChild(node)
                }
                if (node.attributes?.getNamedItem("android:value")?.nodeValue == "com.google.android.dialer.preferredsimfallback") {
                    node.attributes?.getNamedItem("android:value")?.nodeValue = "com.google.android.dialer.preferredsimfallback.amoled"
                }
            }
        }

        println("AndroidManifest.xml successfully cloned to $newPackageName")
    }
}
