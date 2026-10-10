package app.noam.patches.chesscom.misc.settings

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.noam.patches.chesscom.shared.Constants
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

internal val settingsResourcePatch = resourcePatch(
    description = "Adds the Noam's Patches screen, its title and its More tab icon to the app.",
) {
    execute {
        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement
            val strings = resources.getElementsByTagName("string")
            val exists = (0 until strings.length).any {
                (strings.item(it) as Element).getAttribute("name") == "morphe_settings_title"
            }
            if (!exists) {
                resources.appendChild(
                    document.createElement("string").apply {
                        setAttribute("name", "morphe_settings_title")
                        textContent = "Noam\\'s Patches"
                    },
                )
            }
        }

        // The More tab icon: a sparkle with a soft green glow.
        get("res/drawable/morphe_patches_icon.xml").writeText(PATCHES_ICON)

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("The manifest has no application element")

            application.appendChild(
                document.createElement("activity").apply {
                    setAttributeNS(ANDROID_NAMESPACE, "android:name", Constants.SETTINGS_ACTIVITY)
                    setAttributeNS(ANDROID_NAMESPACE, "android:exported", "false")
                    setAttributeNS(ANDROID_NAMESPACE, "android:label", "@string/morphe_settings_title")
                    setAttributeNS(ANDROID_NAMESPACE, "android:theme", "@android:style/Theme.Material.NoActionBar")
                },
            )
        }
    }
}

private val PATCHES_ICON = """
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:aapt="http://schemas.android.com/aapt"
    android:width="24dp"
    android:height="24dp"
    android:viewportWidth="24"
    android:viewportHeight="24">
    <path android:pathData="M0.5,12 A11.5,11.5 0 1,0 23.5,12 A11.5,11.5 0 1,0 0.5,12 Z">
        <aapt:attr name="android:fillColor">
            <gradient
                android:type="radial"
                android:centerX="12"
                android:centerY="12"
                android:gradientRadius="11.5">
                <item android:offset="0" android:color="#B381B64C" />
                <item android:offset="0.5" android:color="#4D81B64C" />
                <item android:offset="1" android:color="#0081B64C" />
            </gradient>
        </aapt:attr>
    </path>
    <path android:pathData="M12,3 C12.6,8.2 15.8,11.4 21,12 C15.8,12.6 12.6,15.8 12,21 C11.4,15.8 8.2,12.6 3,12 C8.2,11.4 11.4,8.2 12,3 Z">
        <aapt:attr name="android:fillColor">
            <gradient
                android:type="linear"
                android:startX="12"
                android:startY="3"
                android:endX="12"
                android:endY="21">
                <item android:offset="0" android:color="#FFFFFFFF" />
                <item android:offset="1" android:color="#FFC2E59A" />
            </gradient>
        </aapt:attr>
    </path>
</vector>
""".trimIndent()
