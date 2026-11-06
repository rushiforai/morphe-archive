// Ported from Solvo37/VK-Video-Morphe-Patches (GPLv3), dev/solvo37/vkvideopatches/ResourcePatches.kt.
package app.ru_apps.vkvideo

import app.morphe.patcher.patch.resourcePatch
import app.ru_apps.vkvideo.Constants.VK_VIDEO
import app.shared.childrenNamed
import app.shared.disableComponentsByName
import app.shared.removeUsesPermissions

// VK Video still declares the AD_ID permission (confirmed live in the 2026-10-08
// exhaustive audit, manifest_com.vk.vkvideo.txt) on top of its own my.target/VK Ads
// mediation stack — removing it makes Play Services hand back an all-zero
// advertising ID to any ad SDK that still asks for it.
@Suppress("unused")
val removeVkVideoAdIdPatch = resourcePatch(
    name = "Disable VK Video advertising ID",
    description = "Removes the advertising ID permission so ad SDKs cannot read the device's real advertising identifier.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        document("AndroidManifest.xml").use { document ->
            val removed = document.documentElement.removeUsesPermissions(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
            )
            println("Disable VK Video advertising ID: removed $removed AD_ID permission(s).")
        }
    }
}

// VK Video bundles a real MyTarget SDK (confirmed via decompile, 2026-10-08: live
// MyTargetActivity/MyTargetContentProvider/NativeAdContainer/MediaAdView classes,
// not just the AdvertisingIdClient identifier stub), and the manifest registers its
// auto-init content provider — `enabled`/`exported` were both still their SDK
// defaults (no existing patch touched them). Disabling both the activity (so an ad
// can never be displayed even if requested) and the content provider (so the SDK
// never auto-initializes at process start) closes this independently of the AD_ID
// permission removal above, which only affects GAID-based targeting, not MyTarget's
// own ad-serving path.
@Suppress("unused")
val disableVkVideoMyTargetPatch = resourcePatch(
    name = "Disable VK Video MyTarget SDK",
    description = "Disables MyTarget's auto-init content provider and ad activity so the SDK never starts.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement.childrenNamed("application").single()
            val disabled = application.disableComponentsByName(
                "com.my.target.common.MyTargetActivity",
                "com.my.target.common.MyTargetContentProvider",
            )
            println("Disable VK Video MyTarget SDK: disabled $disabled manifest component(s).")
        }
    }
}

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
