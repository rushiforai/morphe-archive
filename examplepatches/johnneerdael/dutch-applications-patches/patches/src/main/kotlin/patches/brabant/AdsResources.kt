package patches.brabant

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// These components belong only to the ad SDK; app media/push jobs stay intact.
internal val adsResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val targets = listOf(
                "service" to "com.startapp.sdk.cachedservice.BackgroundService",
                "service" to "com.startapp.sdk.jobs.SchedulerService",
                "receiver" to "com.startapp.sdk.adsbase.remoteconfig.BootCompleteListener",
            )
            for ((tag, name) in targets) {
                val nodes = doc.getElementsByTagName(tag)
                val matches = (0 until nodes.length).map { nodes.item(it) as Element }
                    .filter { it.getAttribute("android:name") == name }
                check(matches.size == 1) { "Brabant ad component changed: $name" }
                matches.single().setAttributeNS("http://schemas.android.com/apk/res/android", "android:enabled", "false")
            }
        }
    }
}
