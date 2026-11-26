/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.shared

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourcePatch

private const val OWN_BACKGROUND = "@drawable/fakh_ic_launcher_background"
private const val OWN_FOREGROUND = "@drawable/fakh_ic_launcher_foreground"
private const val OWN_MONOCHROME = "@drawable/fakh_ic_launcher_monochrome"

/**
 * Adds the themed (monochrome) launcher icon of Android 13 and later, which follows the wallpaper colors.
 *
 * Every layer is a 432 px canvas (108 dp at xxxhdpi) with the logo already sized to fit the launcher mask: the
 * foreground at about 54% of the canvas and the monochrome layer at about 41%, since a tinted glyph reads larger than
 * a colored logo. Layers named in [bundled] (`background`, `foreground`, `monochrome`) are copied from
 * `resources/[folder]` into `res/drawable-nodpi` as `fakh_ic_launcher_<layer>`; the others come from the app.
 *
 * An adaptive icon in an `anydpi` folder wins over the app's bitmap on Android 8+ without touching the manifest, and
 * replaces the app's own adaptive icon when it sits at the same path.
 *
 * @param compatibility the app the patch applies to.
 * @param folder bundled resource folder holding the layers.
 * @param icons `res/...xml` paths of every launcher icon the manifest points at (icon and round icon).
 * @param bundled the layers shipped in [folder].
 * @param background the app's own background layer, or a `#RRGGBB` color, when [bundled] has none.
 * @param foreground the app's own foreground layer, when [bundled] has none.
 * @param monochrome the app's own layer to tint, when [bundled] has none.
 */
internal fun themedIconPatch(
    compatibility: Compatibility,
    folder: String,
    icons: List<String>,
    bundled: List<String> = listOf("monochrome"),
    background: String = OWN_BACKGROUND,
    foreground: String = OWN_FOREGROUND,
    monochrome: String = OWN_MONOCHROME,
) = resourcePatch(
    name = "Themed icon",
    description = "Adds the themed app icon of Android 13 and later, which follows the wallpaper colors.",
    default = true,
) {
    compatibleWith(compatibility)
    category("Theme")

    execute {
        bundled.forEach { layer ->
            val bytes = object {}.javaClass.getResourceAsStream("/$folder/fakh_ic_launcher_$layer.png")?.use { it.readBytes() }
                ?: throw PatchException("${compatibility.name}: $layer icon layer not bundled.")
            resourceFile("res/drawable-nodpi/fakh_ic_launcher_$layer.png").apply {
                parentFile.mkdirs()
                writeBytes(bytes)
            }
        }

        // A color goes in as a resource: some launchers show the default icon for one written into the layer.
        if (background.startsWith("#")) {
            document("res/values/colors.xml").use { xml ->
                xml.documentElement.appendChild(
                    xml.createElement("color").also {
                        it.setAttribute("name", "fakh_ic_launcher_background")
                        it.textContent = background
                    },
                )
            }
        }

        val adaptiveIcon = """<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="${if (background.startsWith("#")) "@color/fakh_ic_launcher_background" else background}" />
    <foreground android:drawable="$foreground" />
    <monochrome android:drawable="$monochrome" />
</adaptive-icon>
"""
        icons.forEach { path ->
            resourceFile(path).apply {
                parentFile.mkdirs()
                writeText(adaptiveIcon)
            }
        }
    }
}
