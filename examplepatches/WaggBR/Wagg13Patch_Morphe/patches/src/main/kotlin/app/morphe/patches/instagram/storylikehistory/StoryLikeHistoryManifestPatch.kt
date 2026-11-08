/*
 * Story like history (Morphe) — manifest registration.
 *
 * The activity lives in the shared extension, so it only becomes reachable after being declared
 * in the target's manifest. Follows the resource-patch idiom used by Piko's Instagram patches
 * <https://github.com/crimera/piko> (GPLv3; see NOTICE.piko).
 */

package app.morphe.patches.instagram.storylikehistory

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ACTIVITY = "app.morphe.extension.instagram.patches.story.StoryLikeHistoryActivity"

/** Hidden helper: declared as a dependency of [storyLikeHistoryPatch]. */
internal val storyLikeHistoryManifestPatch = resourcePatch(
    description = "Adds the story like history activity to the Android manifest.",
) {
    finalize {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                if (activity.getAttribute("android:name") == ACTIVITY) return@use
            }

            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(
                document.createElement("activity").apply {
                    setAttribute("android:name", ACTIVITY)
                    setAttribute("android:exported", "false")
                    setAttribute("android:theme", "@android:style/Theme.Black.NoTitleBar")
                },
            )
        }
    }
}
