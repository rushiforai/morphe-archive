package app.template.patches.ninegag.ad

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.ninegag.shared.COMPATIBILITY_NINEGAG
import app.template.patches.ninegag.util.filterElements
import app.template.patches.ninegag.util.get
import app.template.patches.ninegag.util.set

private const val AD_CONTAINER_ID = "adview_adhesion_banner_container"
private const val LAYOUT_HEIGHT_ATTR = "android:layout_height"

val hideAdContainersPatch = resourcePatch(
    description = "Removes blank ad containers from the layout."
) {
    compatibleWith(COMPATIBILITY_NINEGAG)

    execute {
        setOf(
            "res/layout/activity_home_v2.xml",
            "res/layout/activity_simple_fragment_holder.xml",
            "res/layout/activity_standalone_swipe.xml",
            "res/layout/activity_swipe_post_comment.xml",
        ).forEach { layoutPath ->
            document(layoutPath).use { document ->
                val containers = document
                    .getElementsByTagName("FrameLayout")
                    .filterElements { it["android:id"].contains(AD_CONTAINER_ID) }
                check(containers.size == 1) { "Expected one 9GAG banner container in $layoutPath; found ${containers.size}" }
                containers.forEach {
                    it[LAYOUT_HEIGHT_ATTR] = "0dp"
                    it["android:visibility"] = "gone"
                }
            }
        }

        // 8.23.0 no longer contains the legacy view_aatk_native layout.
    }
}
