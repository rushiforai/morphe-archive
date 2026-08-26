package app.zdrgon.patches.satellite

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Universal patch for Android Direct-to-Cell (DTC) / Satellite network optimization.
 * 
 * According to Google's official Android Satellite Connectivity documentation and T-Mobile Direct-to-Cell guidance:
 * Adding `<meta-data android:name="android.telephony.PROPERTY_SATELLITE_DATA_OPTIMIZED" android:value="PACKAGE_NAME" />`
 * inside the `<application>` tag allows apps (e.g. WireGuard, Lichess, YouTube, Browsers) to send and receive data 
 * over DTC satellite connections.
 */
@Suppress("unused")
val satelliteDataPatch = resourcePatch(
    name = "Satellite Data Optimization",
    description = "Injects PROPERTY_SATELLITE_DATA_OPTIMIZED meta-data tag into AndroidManifest.xml to enable Direct-To-Cell (DTC) satellite data on T-Mobile / SpaceX network.",
    default = true
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifestElement = document.documentElement
            val packageName = manifestElement.getAttribute("package")

            val applicationNodes = document.getElementsByTagName("application")
            if (applicationNodes.length > 0) {
                val applicationElement = applicationNodes.item(0) as Element

                // Check if PROPERTY_SATELLITE_DATA_OPTIMIZED is already present
                val metaDataList = applicationElement.getElementsByTagName("meta-data")
                var alreadyExists = false
                
                for (i in 0 until metaDataList.length) {
                    val metaItem = metaDataList.item(i) as Element
                    if (metaItem.getAttribute("android:name") == "android.telephony.PROPERTY_SATELLITE_DATA_OPTIMIZED") {
                        alreadyExists = true
                        // Ensure package name is correctly updated to target package
                        metaItem.setAttribute("android:value", packageName)
                        break
                    }
                }

                if (!alreadyExists) {
                    val satelliteMetadata = document.createElement("meta-data")
                    satelliteMetadata.setAttribute("android:name", "android.telephony.PROPERTY_SATELLITE_DATA_OPTIMIZED")
                    satelliteMetadata.setAttribute("android:value", packageName)
                    applicationElement.appendChild(satelliteMetadata)
                }
            }
        }
    }
}
