package io.github.matthewriley05.machu.patches.earthwallpaper

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Resource changes for the AOSP build. This patch is an unnamed dependency of
 * `earthSuperWallpaperPatch`, so it is applied with the main patch but is not
 * listed separately.
 */
@Suppress("unused")
internal val earthSuperWallpaperResourcePatch = resourcePatch {
    execute {
        val androidNamespace = "http://schemas.android.com/apk/res/android"

        // The official metadata requests ambient mode, which makes AOSP require
        // the signature-only AMBIENT_WALLPAPER permission. Align the main
        // service with position 0 so the picker shows five consistent entries.
        document("res/xml/super_wallpaper.xml").use { document ->
            document.documentElement.apply {
                setAttribute("android:description", "@string/earth_position_content_0")
                setAttribute("android:thumbnail", "@drawable/home_small_preview_0")
                setAttribute("android:showMetadataInPreview", "true")
                setAttributeNS(
                    androidNamespace,
                    "android:supportsAmbientMode",
                    "false",
                )
            }
        }

        // Expose positions 1-4 as separate services for the AOSP picker.
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application> element")

            val existingServices = document.getElementsByTagName("service")
            for (index in existingServices.length - 1 downTo 0) {
                val service = existingServices.item(index) as? Element ?: continue
                val name = service.getAttribute("android:name")

                when {
                    // The MIUI preview service is a duplicate, broken entry on AOSP.
                    name.endsWith("EarthPreviewSuperWallpaper") ->
                        service.parentNode.removeChild(service)

                    name.endsWith(".EarthSuperWallpaper") ->
                        service.setAttribute("android:label", "@string/earth_position_title_0")
                }
            }

            for (position in 1..4) {
                val service = document.createElement("service").apply {
                    setAttribute(
                        "android:name",
                        "com.miui.miwallpaper.earth.superwallpaper.EarthSuperWallpaper$position",
                    )
                    setAttribute("android:permission", "android.permission.BIND_WALLPAPER")
                    setAttribute("android:exported", "true")
                    setAttribute("android:label", "@string/earth_position_title_$position")
                    // Each position gets its own process so the Filament native
                    // state of the previous wallpaper can never overlap the new
                    // one during a picker apply.
                    setAttribute("android:process", ":earthSuperWallpaper$position")
                    setAttribute("android:defaultToDeviceProtectedStorage", "true")
                    setAttribute("android:directBootAware", "true")
                }

                service.appendChild(
                    document.createElement("intent-filter").apply {
                        appendChild(
                            document.createElement("action").apply {
                                setAttribute(
                                    "android:name",
                                    "android.service.wallpaper.WallpaperService",
                                )
                            },
                        )
                    },
                )

                service.appendChild(
                    document.createElement("meta-data").apply {
                        setAttribute("android:name", "android.service.wallpaper")
                        setAttribute("android:resource", "@xml/super_wallpaper$position")
                    },
                )

                application.appendChild(service)
            }
        }

        // Position-specific wallpaper metadata. The strings and drawables
        // already exist in the official APK.
        for (position in 1..4) {
            get("res/xml/super_wallpaper$position.xml", copy = false).writeText(
                """
                <?xml version="1.0" encoding="utf-8"?>
                <wallpaper android:description="@string/earth_position_content_$position"
                    android:thumbnail="@drawable/home_small_preview_$position"
                    android:showMetadataInPreview="true"
                    android:supportsAmbientMode="false"
                    xmlns:android="http://schemas.android.com/apk/res/android" />
                """.trimIndent(),
            )
        }
    }
}
