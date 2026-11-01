package patches.marktplaats

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val adsResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val providers = doc.getElementsByTagName("provider")
            val matches = (0 until providers.length).map { providers.item(it) as Element }
                .filter { it.getAttribute("android:name") == "com.google.android.gms.ads.MobileAdsInitProvider" }
            // The NextGen SDK has no legacy manifest initializer. Its
            // explicit initializer is stopped by the bytecode control.
            check(matches.isEmpty()) { "Marktplaats 16.19.0 legacy ad provider unexpectedly present" }
        }
    }
}
