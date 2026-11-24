package app.morphe.patches.pixelcamera.gallery

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val androidNamespace = "http://schemas.android.com/apk/res/android"
private const val toggleTitle = "pref_camera_replace_google_photos_with_immich_title"
private const val toggleSummary = "pref_camera_replace_google_photos_with_immich_summary"

val galleryTargetResources = resourcePatch(
    name = "Replace Google Photos with Immich",
    description = "Adds a setting to open the Pixel Camera thumbnail in Immich.",
    default = true
) {
    compatibleWith(
        Compatibility(
            packageName = "com.google.android.GoogleCamera",
            name = "Pixel Camera",
            targets = listOf(AppTarget("11.1.040.982810059.19", 69703284, false, 37))
        )
    )
    dependsOn(galleryTargetPatch)

    execute {
        val translations = mapOf(
            "values" to ("Replace Google Photos with Immich" to "Open the last photo in Immich from the camera thumbnail"),
            "values-fr" to ("Remplacer Google Photos par Immich" to "Ouvrir la dernière photo dans Immich depuis la miniature")
        )
        for ((locale, labels) in translations) {
            document("res/$locale/strings.xml").use { doc ->
                for ((id, label) in mapOf(toggleTitle to labels.first, toggleSummary to labels.second)) {
                    val string = doc.createElement("string")
                    string.setAttribute("name", id)
                    string.textContent = label
                    doc.documentElement.appendChild(string)
                }
            }
        }

        document("res/xml/camera_gm3_preferences.xml").use { doc ->
            val categories = doc.getElementsByTagName("androidx.preference.PreferenceCategory")
            val general = (0 until categories.length).map { categories.item(it) as Element }
                .single { it.getAttribute("android:key") == "pref_category_general" }
            val toggle = doc.createElement("androidx.preference.SwitchPreferenceCompat")
            toggle.setAttributeNS(androidNamespace, "android:key", replacePhotosKey)
            toggle.setAttributeNS(androidNamespace, "android:title", "@string/$toggleTitle")
            toggle.setAttributeNS(androidNamespace, "android:summary", "@string/$toggleSummary")
            toggle.setAttributeNS(androidNamespace, "android:defaultValue", "false")
            // AndroidX reserves Int.MAX_VALUE for preferences with no explicit order.
            toggle.setAttributeNS(androidNamespace, "android:order", (Int.MAX_VALUE - 1).toString())
            general.appendChild(toggle)
        }

        document("AndroidManifest.xml").use { doc ->
            val queries = doc.getElementsByTagName("queries").item(0)
                ?: doc.createElement("queries").also { doc.documentElement.appendChild(it) }
            val immich = doc.createElement("package")
            immich.setAttributeNS(androidNamespace, "android:name", immichPackage)
            queries.appendChild(immich)
        }
    }
}
