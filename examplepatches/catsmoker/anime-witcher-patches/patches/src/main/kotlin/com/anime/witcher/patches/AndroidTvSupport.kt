package com.anime.witcher.patches

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Adds Android TV / Fire TV support to the app.
 *
 * The app is not a dedicated TV app, but it works fine on TV when the following
 * manifest declarations are added:
 *
 * - `<uses-feature android:name="android.software.leanback" android:required="false"/>`
 *   so the app is considered TV-compatible (required=false keeps phone support).
 * - `<uses-feature android:name="android.hardware.touchscreen" android:required="false"/>`
 *   so the app can be installed on devices without a touchscreen.
 * - `android.banner="@mipmap/ic_launcher"` so the TV launcher can display a banner.
 *   The existing launcher icon is reused (no new drawable is added, which keeps the
 *   resource compile step robust).
 * - A `LEANBACK_LAUNCHER` intent filter on [HomeActivity] so the TV / Fire TV home
 *   screen shows a launcher entry.
 */
val androidTvSupportPatch = resourcePatch(
    name = "Android TV support",
    description = "Adds Android TV / Fire TV support (manifest declarations + TV launcher entry).",
    default = true
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element

            fun addUsesFeature(name: String) {
                val feature = document.createElement("uses-feature")
                feature.setAttribute("android:name", name)
                feature.setAttribute("android:required", "false")
                manifest.appendChild(feature)
            }

            addUsesFeature("android.software.leanback")
            addUsesFeature("android.hardware.touchscreen")

            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:banner", "@mipmap/ic_launcher")

            val activities = document.getElementsByTagName("activity")
            var homeActivity: Element? = null
            for (i in 0 until activities.length) {
                val candidate = activities.item(i) as Element
                if (candidate.getAttribute("android:name") == "com.anime.witcher.HomeActivity") {
                    homeActivity = candidate
                    break
                }
            }
            checkNotNull(homeActivity) { "HomeActivity not found in AndroidManifest.xml" }

            val intentFilter = document.createElement("intent-filter")
            intentFilter.appendChild(document.createElement("action").apply {
                setAttribute("android:name", "android.intent.action.MAIN")
            })
            intentFilter.appendChild(document.createElement("category").apply {
                setAttribute("android:name", "android.intent.category.LEANBACK_LAUNCHER")
            })
            homeActivity.appendChild(intentFilter)
        }
    }
}