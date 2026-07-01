package ariecos.patches.gemini

import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val geminiGmsCorePatch = resourcePatch(
    name = "GmsCore MicroG support",
    description = "Injects MicroG-RE metadata into Gemini's manifest so it gets " +
                  "signature spoofing trust from MicroG-RE.",
    default = true,
) {
    compatibleWith(
        "com.google.android.apps.bard",
        "com.google.android.googlequicksearchbox",
    )

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val manifestNode = manifest.getElementsByTagName("manifest").item(0)
            val applicationNode = manifest.getElementsByTagName("application").item(0)

            // 1. Inject the FAKE_PACKAGE_SIGNATURE permission request
            val existingPerms = manifest.getElementsByTagName("uses-permission")
            val alreadyPresent = (0 until existingPerms.length).any { i ->
                existingPerms.item(i).attributes
                    ?.getNamedItem("android:name")
                    ?.nodeValue == "org.microg.gms.permission.FAKE_PACKAGE_SIGNATURE"
            }
            if (!alreadyPresent) {
                val permNode = manifest.createElement("uses-permission")
                permNode.setAttribute(
                    "android:name",
                    "org.microg.gms.permission.FAKE_PACKAGE_SIGNATURE"
                )
                manifestNode.appendChild(permNode)
            }

            // 2. Inject spoof metadata so MicroG-RE knows what to spoof this app as.
            // MicroG-RE reads these meta-data entries from the app's ApplicationInfo.
            // The BASE_PACKAGE_NAME in MicroG-RE is "app.revanced", so the keys are:
            //   app.revanced.android.gms.SPOOFED_PACKAGE_NAME
            //   app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE
            val spoofMeta = mapOf(
                "app.revanced.android.gms.SPOOFED_PACKAGE_NAME" to
                    "com.google.android.apps.bard",
                // Google's release cert SHA-256 for Gemini (com.google.android.apps.bard)
                // This tells MicroG-RE to present this cert when GmsCore checks the signature
                "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE" to
                    "997c9c5d63e84a5024f308a615c4e4a87773a52073b0e1547a4d3b8b1081efa7"
            )

            spoofMeta.forEach { (key, value) ->
                // Only add if not already present
                val existing = (0 until applicationNode.childNodes.length).any { i ->
                    val node = applicationNode.childNodes.item(i)
                    node.nodeName == "meta-data" &&
                    node.attributes?.getNamedItem("android:name")?.nodeValue == key
                }
                if (!existing) {
                    val metaNode = manifest.createElement("meta-data")
                    metaNode.setAttribute("android:name", key)
                    metaNode.setAttribute("android:value", value)
                    applicationNode.appendChild(metaNode)
                }
            }
        }
    }
}
