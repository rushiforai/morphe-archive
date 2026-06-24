package com.dumbsoftware.t2c.features

import app.morphe.patcher.patch.resourcePatch
import com.dumbsoftware.t2c.COMPATIBILITY_T2C

@Suppress("unused")
val removeGoogleMapsPatch = resourcePatch(
    name = "Remove Google Maps API key",
    description = "Removes the Google Maps API key from the manifest to stop Google tracking."
) {
    compatibleWith(COMPATIBILITY_T2C)

    execute {
        document("AndroidManifest.xml").use { document ->
            val metaDataNodes = document.getElementsByTagName("meta-data")
            (0 until metaDataNodes.length).forEach { i ->
                val node = metaDataNodes.item(i)
                val attributes = node.attributes
                if (attributes.getNamedItem("android:name")?.nodeValue == "com.google.android.geo.API_KEY") {
                    attributes.getNamedItem("android:value")?.let { it.nodeValue = "" }
                }
            }
        }
    }
}