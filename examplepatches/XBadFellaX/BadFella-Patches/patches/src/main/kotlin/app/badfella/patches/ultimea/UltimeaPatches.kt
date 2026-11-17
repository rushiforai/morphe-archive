/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.badfella.patches.ultimea

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.resourcePatch
import app.badfella.patches.ultimea.upstream.shared.misc.requireArm64
import app.badfella.patches.ultimea.upstream.shared.misc.dart.dartAotLibrary
import app.badfella.patches.ultimea.upstream.settings.nativeMethods
import app.badfella.patches.ultimea.upstream.settings.nativeMethodsPatch
import app.badfella.patches.ultimea.upstream.distractions.removeCommunityNavigation
import app.badfella.patches.ultimea.upstream.theme.ThemeElfImage
import app.badfella.patches.ultimea.upstream.theme.ThemeInstructions
import app.badfella.patches.ultimea.upstream.theme.ThemeHooks
import app.badfella.patches.ultimea.upstream.theme.themeSettingsPatch
import org.w3c.dom.Element

@Suppress("unused")
val ultimeaBlackModePatch = resourcePatch(
    name = "Ultimea Black Mode",
    description = "Ports hxreborn's dark theme in fixed AMOLED mode, with light text, controls and artwork. ARM64 only.",
) {
    compatibleWith(
        Compatibility(
            name = "Ultimea",
            packageName = "com.dynanic.ultimea",
            targets = listOf(
                AppTarget(
                    version = "1.4.4",
                    versionCodes = mapOf(
                        SupportedAbi.ARM64_V8A to 495,
                    ),
                    description = "Version 1.4.4, build 495. ARM64 only, matching hxreborn upstream.",
                )
            ),
        ),
    )

    dependsOn(nativeMethodsPatch, themeSettingsPatch)
    availability(requireArm64)

    execute {
        listOf("values", "values-night").forEach { qualifier ->
            val stylesFile = get("res/$qualifier/styles.xml")
            if (stylesFile.exists()) {
                document("res/$qualifier/styles.xml").use { doc ->
                    val styles = doc.getElementsByTagName("style")
                    for (i in 0 until styles.length) {
                        val style = styles.item(i) as Element
                        val name = style.getAttribute("name")
                        if (name == "NormalTheme" || name == "LaunchTheme" || name.contains("Theme")) {
                            val items = style.getElementsByTagName("item")
                            for (j in 0 until items.length) {
                                val item = items.item(j) as Element
                                when (item.getAttribute("name")) {
                                    "android:windowBackground" -> item.textContent = "@android:color/black"
                                    "android:statusBarColor", "android:navigationBarColor" -> item.textContent = "@android:color/black"
                                    "android:windowLightStatusBar" -> item.textContent = "false"
                                }
                            }
                        }
                    }
                }
            }
        }

        val colorsFile = get("res/values/colors.xml")
        if (colorsFile.exists()) {
            document("res/values/colors.xml").use { doc ->
                val colors = doc.getElementsByTagName("color")
                for (i in 0 until colors.length) {
                    val color = colors.item(i) as Element
                    if (color.getAttribute("name") == "splash_bg_color") {
                        color.textContent = "#ff000000"
                    }
                }
            }
        }

        listOf("res/values-night/colors.xml", "res/values-night-v8/colors.xml").forEach { path ->
            val file = get(path)
            if (file.exists()) {
                document(path).use { doc ->
                    val colors = doc.getElementsByTagName("color")
                    for (i in 0 until colors.length) {
                        val color = colors.item(i) as Element
                        val colorName = color.getAttribute("name")
                        if (colorName in setOf("colorBackground", "colorElevated", "default_color_background")) {
                            color.textContent = "#ff000000"
                        }
                    }
                }
            }
        }

        val iconsDir = get("assets/flutter_assets/assets/icons")
        if (iconsDir.exists()) {
            val logoDark = iconsDir.resolve("login_logo_dark.svg")
            val logo = iconsDir.resolve("login_logo.svg")
            if (logoDark.exists()) {
                logoDark.copyTo(logo, overwrite = true)
            }

            for (name in listOf("device_nomsgchat", "msg_center_noready", "msg_center_ready")) {
                val nightIcon = iconsDir.resolve("${name}_night.svg")
                val targetIcon = iconsDir.resolve("$name.svg")
                if (nightIcon.exists()) {
                    nightIcon.copyTo(targetIcon, overwrite = true)
                }
            }

            for (name in listOf("default_user_icon.svg", "default_new_userIcon.svg")) {
                val userIcon = iconsDir.resolve(name)
                if (userIcon.exists()) {
                    userIcon.writeText(
                        userIcon.readText()
                            .replace("#E9E9E9", "#24242A")
                            .replace("fill=\"white\"", "fill=\"#B8BCC2\"")
                    )
                }
            }

            for (name in listOf("ble_play_help", "eq_help", "jerry_can_help", "device_usb_icon", "right_into", "right_arrow", "device_arrow_connected")) {
                val icon = iconsDir.resolve("$name.svg")
                if (icon.exists()) {
                    icon.writeText(
                        icon.readText()
                            .replace("#646464", "#B8BCC2")
                            .replace("#161616", "#B8BCC2")
                            .replace("#E9E9E9", "#24242A")
                            .replace("stroke=\"black\"", "stroke=\"#B8BCC2\"")
                    )
                }
            }

            val guide = iconsDir.resolve("guide.svg")
            if (guide.exists()) {
                guide.writeText(
                    guide.readText()
                        .replace("\"white\"", "\"#24242A\"")
                        .replace("#AAB0B5", "#B8BCC2")
                )
            }
        }

        val home = get("assets/flutter_assets/assets/images/home")
        home.resolve("home_add_device_dark.png").copyTo(home.resolve("home_add_device.png"), overwrite = true)

        val imagesDir = get("assets/flutter_assets/assets/images")
        if (imagesDir.exists()) {
            listOf(
                "device_input_hdmi_n.png",
                "device_input_usb_n.png",
                "device_input_optical_n.png",
                "device_input_aux_n.png",
                "device_input_bluetooth_n.png",
                "mine_user_icon.png",
            ).forEach { name ->
                val resource = object {}.javaClass.getResourceAsStream("/ultimea/images/$name")
                if (resource == null) throw PatchException("Missing Ultimea image $name")
                run {
                    val target = imagesDir.resolve(name)
                    resource.use { input -> target.outputStream().use { output -> input.copyTo(output) } }
                }
            }

            for (name in listOf("store_icon", "store_icon_select", "home_icon", "home_icon_select", "mine_icon", "mine_icon_select")) {
                val icon = imagesDir.resolve("$name.svg")
                if (icon.exists()) {
                    icon.writeText(
                        icon.readText()
                            .replace("#646464", "#B8BCC2")
                            .replace("#541597", "#C499FF")
                            .replace("\"white\"", "\"#24242A\"")
                    )
                }
            }
        }
    }

    // Install theme hooks after navigation has finished extending the executable segment.
    finalize {
        val library = dartAotLibrary()
        val image = ThemeElfImage(library.readBytes())
        val stock = ThemeElfImage(nativeMethods.bytes)
        val matches = ThemeInstructions(stock.bytes, stock.codeStart, stock.codeEnd).match()
        ThemeHooks.apply(image, matches, mode = 2)
        library.writeBytes(image.bytes)
    }
}

@Suppress("unused")
val ultimeaHideExplorerPatch = resourcePatch(
    name = "Ultimea Hide Explorer Tab",
    description = "Ports hxreborn's community navigation removal, including tab bodies, callbacks and controller indexes. ARM64 only.",
) {
    compatibleWith(
        Compatibility(
            name = "Ultimea",
            packageName = "com.dynanic.ultimea",
            targets = listOf(
                AppTarget(
                    version = "1.4.4",
                    versionCodes = mapOf(
                        SupportedAbi.ARM64_V8A to 495,
                    ),
                    description = "Version 1.4.4, build 495. ARM64 only, matching hxreborn upstream.",
                )
            ),
        ),
    )

    dependsOn(nativeMethodsPatch)
    availability(requireArm64)

    execute {
        val library = dartAotLibrary()
        val bytes = library.readBytes()
        bytes.removeCommunityNavigation()
        library.writeBytes(bytes)
    }
}
