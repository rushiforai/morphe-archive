package io.github.forsigh.waze

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Picture-in-picture, resource half: flags the three activities that can float.
 *
 * Android refuses to put an activity into PiP unless its manifest entry carries
 * `android:supportsPictureInPicture="true"`, and Waze ships none. The bytecode half injects
 * `primePip`, but without this flag every call into it is a no-op at runtime.
 *
 * The name match is on the simple class name so an obfuscated package path does not break it.
 */
@Suppress("unused")
internal val pipManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        val targets = setOf("UidFragmentActivity", "FreeMapAppActivity", "MainActivity")
        val flagged = mutableSetOf<String>()
        document("AndroidManifest.xml").use { dom ->
            val activities = dom.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val node = activities.item(index) as? org.w3c.dom.Element ?: continue
                val name = node.getAttribute("android:name")
                val simple = name.substringAfterLast('.')
                if (simple !in targets) continue
                node.setAttribute("android:supportsPictureInPicture", "true")
                flagged += simple
            }
        }
        if (flagged.isEmpty()) {
            throw PatchException(
                "pipManifestPatch: none of UidFragmentActivity, FreeMapAppActivity or MainActivity is in " +
                    "the manifest - Waze renamed its activities, refusing to ship a PiP row that would " +
                    "fall over at runtime",
            )
        }
        println("pipManifestPatch: PiP flag added to $flagged")
    }
}
