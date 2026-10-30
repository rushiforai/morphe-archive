package patches.negentwee

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val adsResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val nodes = doc.getElementsByTagName("provider")
            val matches = (0 until nodes.length).map { nodes.item(it) as Element }
                .filter { it.getAttribute("android:name") == "com.google.android.gms.ads.MobileAdsInitProvider" }
            check(matches.size == 1 && !matches.single().hasAttribute("android:enabled")) {
                "9292 original ad initializer changed"
            }
            matches.single().setAttributeNS("http://schemas.android.com/apk/res/android", "android:enabled", "false")
        }
    }
}
