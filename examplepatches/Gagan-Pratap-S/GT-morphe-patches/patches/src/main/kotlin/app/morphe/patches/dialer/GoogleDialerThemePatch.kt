package app.morphe.patches.dialer

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.dialer.DialerConstants.COMPATIBILITY_GOOGLE_DIALER
import org.w3c.dom.Element

/**
 * AMOLED Dark Theme & Silhouette Avatar Fix for Google Phone (Google Dialer).
 * Applies complete v7 UltraSmooth AMOLED palette across all Material 3 and dynamic color resources.
 */
@Suppress("unused")
val googleDialerThemePatch = resourcePatch(
    name = "AMOLED Dark Theme",
    description = "Converts Google Phone dark theme from grey into pure pitch-black (#000000), " +
                  "enhances dialpad readability with pure white text, and fixes unsaved contact avatar outlines.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOOGLE_DIALER)

    execute {
        println("Applying Google Dialer AMOLED modifications (v7 complete palette)...")

        val colorReplacements = mapOf(
            "dialer_incall_white_color" to "#ffffffff",
            "dialpad_icon_text_disabled" to "#80ffffff",
            "dialpad_icon_text_enabled" to "#ffffffff",
            "empty_content_view_message" to "#ffffffff",
            "gm3_ref_palette_dynamic_neutral10" to "#ff000000",
            "gm3_ref_palette_dynamic_neutral20" to "#ff0a0a0a",
            "gm3_ref_palette_dynamic_neutral_variant0" to "#ff000000",
            "gm3_ref_palette_dynamic_neutral_variant10" to "#ff000000",
            "gm3_sys_color_dynamic_dark_background" to "#ff000000",
            "gm3_sys_color_dynamic_dark_on_background" to "#ffffffff",
            "gm3_sys_color_dynamic_dark_on_surface" to "#ffffffff",
            "gm3_sys_color_dynamic_dark_on_surface_variant" to "#ffffffff",
            "gm3_sys_color_dynamic_dark_outline" to "@android:color/system_outline_dark",
            "gm3_sys_color_dynamic_dark_outline_variant" to "#ff1c1c1c",
            "gm3_sys_color_dynamic_dark_surface" to "#ff000000",
            "gm3_sys_color_dynamic_dark_surface_bright" to "#ff2f3130",
            "gm3_sys_color_dynamic_dark_surface_container" to "#ff000000",
            "gm3_sys_color_dynamic_dark_surface_container_high" to "#ff1c1c1c",
            "gm3_sys_color_dynamic_dark_surface_container_highest" to "#ff2f3130",
            "gm3_sys_color_dynamic_dark_surface_container_low" to "#ff000000",
            "gm3_sys_color_dynamic_dark_surface_container_lowest" to "#ff000000",
            "gm3_sys_color_dynamic_dark_surface_dim" to "#ff000000",
            "google_dark_default_color_on_surface" to "#ffffffff",
            "google_dark_default_color_on_surface_variant" to "#ffe0e0e0",
            "google_marterial_color_primary_text_dark" to "#ffffffff",
            "google_marterial_color_surface_dark" to "#ff000000",
            "google_marterial_dialog_background_color" to "#ff000000",
            "m3_ref_palette_dynamic_neutral10" to "#ff000000",
            "m3_ref_palette_dynamic_neutral20" to "#ff0a0a0a",
            "m3_ref_palette_dynamic_neutral_variant10" to "#ff000000",
            "m3_sys_color_dynamic_dark_background" to "#ff000000",
            "m3_sys_color_dynamic_dark_on_background" to "#ffffffff",
            "m3_sys_color_dynamic_dark_on_surface" to "#ffffffff",
            "m3_sys_color_dynamic_dark_on_surface_variant" to "#ffffffff",
            "m3_sys_color_dynamic_dark_outline" to "@android:color/system_outline_dark",
            "m3_sys_color_dynamic_dark_outline_variant" to "#ff1c1c1c",
            "m3_sys_color_dynamic_dark_surface" to "#ff000000",
            "m3_sys_color_dynamic_dark_surface_bright" to "#ff2f3130",
            "m3_sys_color_dynamic_dark_surface_container" to "#ff000000",
            "m3_sys_color_dynamic_dark_surface_container_high" to "#ff1c1c1c",
            "m3_sys_color_dynamic_dark_surface_container_highest" to "#ff2f3130",
            "m3_sys_color_dynamic_dark_surface_container_low" to "#ff000000",
            "m3_sys_color_dynamic_dark_surface_container_lowest" to "#ff000000",
            "m3_sys_color_dynamic_dark_surface_dim" to "#ff000000",
            "secondary_text_default_material_dark" to "#ffe0e0e0",
            "settingslib_dialog_background" to "#ff000000",
            "settingslib_materialColorOnSurface" to "#ffffffff",
            "settingslib_materialColorOnSurfaceVariant" to "#ffffffff",
            "settingslib_materialColorOutline" to "@android:color/system_outline_dark",
            "settingslib_materialColorSurfaceContainer" to "#ff000000",
            "settingslib_materialColorSurfaceContainerHigh" to "#ff1c1c1c",
            "settingslib_materialColorSurfaceContainerHighest" to "#ff2f3130",
            "settingslib_materialColorSurfaceVariant" to "#ff1c1c1c",
            "settingslib_text_color_primary_device_default" to "#ffffffff",
            "settingslib_text_color_secondary_device_default" to "#ffffffff",
            "settingslib_track_off_color" to "#ff2f3130",
            "sud_system_background_dark" to "#ff000000",
            "sud_system_background_surface" to "#ff000000",
            "sud_system_on_surface_dark" to "#ffffffff",
            "sud_system_on_surface_variant_dark" to "#ffffffff",
            "sud_system_outline_dark" to "@android:color/system_outline_dark",
            "sud_system_outline_variant_dark" to "#ff1c1c1c",
            "sud_system_primary_text" to "#ffffffff",
            "sud_system_sc_highest_dark" to "#ff2f3130",
            "sud_system_secondary_text" to "#ffe0e0e0",
            "sud_system_surface" to "#ff000000",
            "sud_system_surface_container_dark" to "#ff000000",
            "sud_system_surface_container_high_dark" to "#ff1c1c1c",
            "sud_system_surface_container_highest_dark" to "#ff2f3130",
            "sud_system_surface_container_low_dark" to "#ff000000",
            "sud_system_surface_container_lowest_dark" to "#ff000000",
            "sud_system_surface_dark" to "#ff000000",
            "sud_system_surface_dim_dark" to "#ff000000",
            "survey_surface_color" to "#ff000000",
            "survey_surface_color_elevation_2" to "#ff050505",
            "survey_surface_color_elevation_3" to "#ff1c1c1c",
            "survey_alert_dialog_bg_color" to "#ff000000",
            "bam_center_fragment_background" to "#ff000000"
        )

        val styleReplacements = mapOf(
            "elevationOverlayEnabled" to "false",
            "mc3_background" to "#ff000000",
            "mc3_surface" to "#ff000000",
            "mc3_surface_container" to "#ff000000",
            "mc3_surface_container_low" to "#ff000000",
            "mc3_surface_container_lowest" to "#ff000000",
            "mc3_surface_dim" to "#ff000000",
            "mc3_surface_bright" to "#ff2f3130",
            "mc3_surface_container_high" to "#ff1c1c1c",
            "mc3_surface_container_highest" to "#ff2f3130",
            "mc3_neutral_0" to "#ff000000",
            "mc3_neutral_10" to "#ff000000",
            "mc3_neutral_20" to "#ff0a0a0a",
            "mc3_neutral_variant_0" to "#ff000000",
            "mc3_neutral_variant_10" to "#ff000000",
            "mc3_neutral_variant_20" to "#ff0a0a0a",
            "mc3_on_surface_variant" to "#ff909191",
            "mc3_outline" to "@android:color/system_outline_dark",
            "mc3_outline_variant" to "#ff1c1c1c",
            "colorUnsavedContactAvatar" to "#ffe2e2e6"
        )

        // List of all primary files to decode and patch
        val primaryFiles = listOf(
            "res/values/colors.xml",
            "res/values/styles.xml",
            "res/values-v31/colors.xml",
            "res/values-v31/styles.xml",
            "res/values-v34/colors.xml",
            "res/values-v34/styles.xml",
            "res/values-night/colors.xml",
            "res/values-night/styles.xml",
            "res/values-night-v31/colors.xml",
            "res/values-night-v34/colors.xml"
        )

        val decodedFiles = mutableSetOf<String>()
        try {
            decodedFiles.addAll(decode("res/values*/*.xml"))
        } catch (e: Exception) {
            println("decode pattern error: ${e.message}")
        }
        decodedFiles.addAll(primaryFiles)

        println("Theme: processing ${decodedFiles.size} candidate files...")

        decodedFiles.forEach { path ->
            if (!path.endsWith(".xml") || (!path.contains("colors") && !path.contains("styles"))) {
                return@forEach
            }
            try {
                document(path).use { doc ->
                    var patchedCount = 0

                    val colors = doc.getElementsByTagName("color")
                    for (i in 0 until colors.length) {
                        val elem = colors.item(i) as? Element ?: continue
                        val name = elem.attributes?.getNamedItem("name")?.nodeValue ?: elem.getAttribute("name")
                        val repl = colorReplacements[name]
                        if (repl != null) {
                            elem.textContent = repl
                            if (elem.firstChild != null) {
                                elem.firstChild.nodeValue = repl
                            }
                            patchedCount++
                        }
                    }

                    val items = doc.getElementsByTagName("item")
                    for (i in 0 until items.length) {
                        val elem = items.item(i) as? Element ?: continue
                        val name = elem.attributes?.getNamedItem("name")?.nodeValue ?: elem.getAttribute("name")
                        val repl = styleReplacements[name]
                        if (repl != null) {
                            elem.textContent = repl
                            if (elem.firstChild != null) {
                                elem.firstChild.nodeValue = repl
                            }
                            patchedCount++
                        }
                    }

                    if (patchedCount > 0) {
                        println("Theme: successfully patched $patchedCount entries in $path")
                    }
                }
            } catch (e: Exception) {
                // Ignore files that are not present in this specific APK version
            }
        }

        println("Google Dialer AMOLED theme successfully applied!")
    }
}
