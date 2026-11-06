package app.morphe.patches.applemusic.tv

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.applemusic.dilink.appleMusicDiLinkPatch
import app.morphe.patches.applemusic.shared.Constants.APPLE_MUSIC_DILINK
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"
private const val MAIN_ACTIVITY = "com.apple.android.music.common.MainActivity"
private const val LEANBACK_FEATURE = "android.software.leanback"
private const val TOUCHSCREEN_FEATURE = "android.hardware.touchscreen"

/**
 * Android TV only lists apps that expose a LEANBACK_LAUNCHER entry point, and the app declares
 * neither `android.software.leanback` nor `android.hardware.touchscreen` as optional, which is
 * what TV devices filter on. The leanback filter is added next to the existing LAUNCHER one,
 * so the same APK keeps working on the DiLink head unit.
 *
 * The app only makes sense on a TV with the DiLink patches applied: the tablet UI, the API 29
 * floor and the ADI/TLS replacements come from `appleMusicDiLinkPatch`.
 */
@Suppress("unused")
internal val tvManifestPatch = resourcePatch(
    name = "TV: manifest",
    description = "Adds a leanback launcher entry point and banner to MainActivity and declares leanback/touchscreen as not required.",
    default = false,
) {
    compatibleWith(APPLE_MUSIC_DILINK)
    dependsOn(appleMusicDiLinkPatch)

    finalize {
        document(MANIFEST).use { manifest ->
            val activities = manifest.getElementsByTagName("activity")
            val mainActivity = (0 until activities.length)
                .map { index -> activities.item(index) as Element }
                .firstOrNull { activity -> activity.getAttribute("android:name") == MAIN_ACTIVITY }
                ?: error("$MAIN_ACTIVITY not found in $MANIFEST")

            val leanbackFilter = manifest.createElement("intent-filter")
            leanbackFilter.appendChild(
                manifest.createElement("action").apply {
                    setAttribute("android:name", "android.intent.action.MAIN")
                },
            )
            leanbackFilter.appendChild(
                manifest.createElement("category").apply {
                    setAttribute("android:name", "android.intent.category.LEANBACK_LAUNCHER")
                },
            )
            mainActivity.appendChild(leanbackFilter)

            // Provisional: the APK ships no 320x180 TV banner, so the phone icon is reused.
            mainActivity.setAttribute("android:banner", "@mipmap/ic_launcher")

            val application = manifest.getElementsByTagName("application").item(0) as Element
            val declaredFeatures = manifest.getElementsByTagName("uses-feature")
            for (feature in listOf(LEANBACK_FEATURE, TOUCHSCREEN_FEATURE)) {
                val declared = (0 until declaredFeatures.length).any { index ->
                    (declaredFeatures.item(index) as Element).getAttribute("android:name") == feature
                }
                if (declared) continue

                val usesFeature = manifest.createElement("uses-feature")
                usesFeature.setAttribute("android:name", feature)
                usesFeature.setAttribute("android:required", "false")
                application.parentNode.insertBefore(usesFeature, application)
            }
        }
    }
}
