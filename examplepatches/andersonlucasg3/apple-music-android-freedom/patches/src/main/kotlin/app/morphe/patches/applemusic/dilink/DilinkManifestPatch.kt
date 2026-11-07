package app.morphe.patches.applemusic.dilink

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.applemusic.shared.Constants.APPLE_MUSIC_DILINK
import org.w3c.dom.Element

private const val MANIFEST = "AndroidManifest.xml"
private const val MLI_CHROME_TAB_ACTIVITY = "com.apple.android.music.mli.MLIChromeTabActivity"

/**
 * The only <uses-sdk> in the app lives in the base manifest (the splits declare none),
 * so this is the single place that gates installation on API 30.
 * MLIChromeTabActivity is the only portrait-locked activity and the only source of the
 * implicit `android.hardware.screen.portrait` feature that aapt2 derives.
 *
 * The target is API 29 (Android 10, the DiLink head unit), not API 28: API 28 has its own
 * blocker (utils.m1.<clinit> instantiates FontStyle, API 29) that is out of scope here.
 */
@Suppress("unused")
internal val dilinkManifestPatch = resourcePatch(
    name = "DiLink: manifest",
    description = "Lowers minSdkVersion from 30 to 29 (Android 10) and removes the portrait lock of MLIChromeTabActivity.",
    default = false,
) {
    compatibleWith(APPLE_MUSIC_DILINK)

    finalize {
        document(MANIFEST).use { manifest ->
            val usesSdk = manifest.getElementsByTagName("uses-sdk").item(0) as Element
            usesSdk.setAttribute("android:minSdkVersion", "29")

            val activities = manifest.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as Element
                if (activity.getAttribute("android:name") == MLI_CHROME_TAB_ACTIVITY) {
                    activity.removeAttribute("android:screenOrientation")
                }
            }
        }
    }
}
