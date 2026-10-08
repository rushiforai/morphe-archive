package dev.solvo37.vkvideopatches

import app.morphe.patcher.patch.resourcePatch
import dev.solvo37.vkvideopatches.Constants.VK_VIDEO

private val AD_XML_LAYOUTS = listOf(
    "res/layout/catalog_ad_banner.xml",
    "res/layout/catalog_ad_banner_medium.xml",
    "res/layout/video_ad_banner.xml",
    "res/layout/video_player_ads_panel.xml",
    "res/layout-land/video_player_ads_panel.xml",
)

@Suppress("unused")
val hideAdXmlSurfacesPatch = resourcePatch(
    name = "Hide ad XML surfaces",
    description = "Collapses known catalog, video-banner, and player ad layouts while preserving their XML structure.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        val apkEntries = listApkEntries().toHashSet()

        AD_XML_LAYOUTS
            .filter(apkEntries::contains)
            .forEach { path ->
                document(path).use { document ->
                    val root = document.documentElement
                        ?: error("Ad layout has no root element: $path")

                    // Keep the original hierarchy/ids intact. Some VK code still
                    // inflates these layouts and resolves child ids even when ad
                    // data is blocked. Collapsing the root is safer than deleting
                    // the XML resource or replacing its children.
                    root.setAttribute("android:visibility", "gone")
                    root.setAttribute("android:layout_width", "0dp")
                    root.setAttribute("android:layout_height", "0dp")
                }
            }
    }
}
