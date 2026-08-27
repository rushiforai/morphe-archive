package app.morphe.patches.discord.bunny

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val ANDROID_MAIN_ACTION =
    "android.intent.action.MAIN"

private const val ANDROID_LAUNCHER_CATEGORY =
    "android.intent.category.LAUNCHER"

private const val BUNNY_BRANDING_ALIAS_PREFIX =
    ".bunny_branding_"

private val bunnyBrandingIconModes = listOf(
    "bunny",
    "bunny_manager",
    "vendetta",
    "vendetta_manager",
    "discord",
    "brand_inverted",
    "matte_dark",
    "matte_light",
    "brand_dark",
    "pastel",
    "pirate",
    "camo",
    "sunset",
    "galaxy",
    "y2k",
    "cherry_blossom",
    "beanie",
    "gaming",
    "circuit",
    "holo_waves",
    "blush",
    "angry",
    "manga",
    "controller",
    "mushroom",
    "blurple_twilight",
    "in_rainbows",
    "midnight_prism",
    "color_wave",
)

private val bunnyBrandingNameModes = listOf(
    "discord" to "Discord",
    "bunny" to "Bunny",
    "vendetta" to "Vendetta",
)
private val bunnyBrandingColors = linkedMapOf(
    "bunny_branding_bg_angry" to "#FF190403",
    "bunny_branding_bg_beanie" to "#FFC1C5F4",
    "bunny_branding_bg_blurple_twilight" to "#FF2547C4",
    "bunny_branding_bg_blush" to "#FFEFBEC7",
    "bunny_branding_bg_brand_dark" to "#FF000000",
    "bunny_branding_bg_brand_inverted" to "#FFFFFFFF",
    "bunny_branding_bg_bunny" to "#FF48488B",
    "bunny_branding_bg_bunny_manager" to "#FF48488B",
    "bunny_branding_bg_camo" to "#FF7A8046",
    "bunny_branding_bg_circuit" to "#FF0D4439",
    "bunny_branding_bg_color_wave" to "#FFFFFFFF",
    "bunny_branding_bg_controller" to "#FFCDD0ED",
    "bunny_branding_bg_discord" to "#FF5865F2",
    "bunny_branding_bg_holo_waves" to "#FF040404",
    "bunny_branding_bg_in_rainbows" to "#FFA8CD32",
    "bunny_branding_bg_manga" to "#FF040404",
    "bunny_branding_bg_matte_dark" to "#FF2A2D33",
    "bunny_branding_bg_matte_light" to "#FFEBEBEB",
    "bunny_branding_bg_midnight_prism" to "#FF030303",
    "bunny_branding_bg_mushroom" to "#FFAEE1EF",
    "bunny_branding_bg_pastel" to "#FFEFBEC7",
    "bunny_branding_bg_pirate" to "#FFDA8A5D",
    "bunny_branding_bg_sunset" to "#FFF576B0",
    "bunny_branding_bg_vendetta" to "#FF5865F2",
    "bunny_branding_bg_vendetta_manager" to "#FF3AB8BA",
    "bunny_branding_bg_y2k" to "#FF2E3E9B",
)


private fun directChildElements(
    parent: Element,
): List<Element> {
    val result = mutableListOf<Element>()
    val children = parent.childNodes

    for (index in 0 until children.length) {
        val child = children.item(index)

        if (child.nodeType == Node.ELEMENT_NODE) {
            result += child as Element
        }
    }

    return result
}

private fun launcherIntentFilters(
    component: Element,
): List<Element> =
    directChildElements(component)
        .filter { it.tagName == "intent-filter" }
        .filter { intentFilter ->
            val children =
                directChildElements(intentFilter)

            val hasMain =
                children.any {
                    it.tagName == "action" &&
                        it.getAttribute("android:name") ==
                            ANDROID_MAIN_ACTION
                }

            val hasLauncher =
                children.any {
                    it.tagName == "category" &&
                        it.getAttribute("android:name") ==
                            ANDROID_LAUNCHER_CATEGORY
                }

            hasMain && hasLauncher
        }

private fun allIntentFilters(
    component: Element,
): List<Element> =
    directChildElements(component)
        .filter { it.tagName == "intent-filter" }

private fun launcherTarget(
    component: Element,
): String =
    when (component.tagName) {
        "activity-alias" ->
            component.getAttribute(
                "android:targetActivity",
            )

        "activity" ->
            component.getAttribute(
                "android:name",
            )

        else ->
            ""
    }

private fun manifestEnabled(
    component: Element,
): Boolean {
    val value =
        component
            .getAttribute("android:enabled")
            .trim()
            .lowercase()

    return when (value) {
        "",
        "true" ->
            true

        "false" ->
            false

        else ->
            error(
                "Unsupported launcher android:enabled value: " +
                    value,
            )
    }
}

internal val bunnyBrandingResourcePatch = resourcePatch(
    default = false,
) {
    dependsOn(bunnyPackageIdentityResourcePatch)

    execute {
        /*
         * Copy every preset under Bunny-owned names.
         *
         * No runtime alias depends on Discord's original alternate
         * icon resource names.
         */
        /*
         * Values resources are different from ordinary drawable/mipmap
         * files. Merge Bunny's new colors into the standard colors.xml
         * resource document so Morphe/ARSCLib can allocate entry IDs.
         */
        val colorsPath =
            "res/values/colors.xml"

        val colorsFile =
            get(colorsPath)

        if (!colorsFile.exists()) {
            colorsFile.parentFile?.mkdirs()

            check(colorsFile.createNewFile()) {
                "Could not create $colorsPath"
            }

            colorsFile.writeText(
                "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
                    "<resources>\n" +
                    "</resources>\n"
            )
        }

        document(colorsPath).use { colorsDocument ->
            val resources =
                colorsDocument.documentElement

            check(resources.tagName == "resources") {
                "$colorsPath has an unexpected root element"
            }

            val existingColorNames =
                directChildElements(resources)
                    .filter {
                        it.tagName == "color"
                    }
                    .map {
                        it.getAttribute("name")
                    }
                    .toMutableSet()

            bunnyBrandingColors.forEach {
                    (name, value) ->
                check(existingColorNames.add(name)) {
                    "Branding color already exists: $name"
                }

                val color =
                    colorsDocument.createElement(
                        "color",
                    )

                color.setAttribute(
                    "name",
                    name,
                )

                color.textContent =
                    value

                resources.appendChild(color)
            }
        }
        copyResources(
            "bunny-branding",
            ResourceGroup(
                "mipmap",
                "bunny_branding_bunny.xml",
                "bunny_branding_bunny_round.xml",
                "bunny_branding_bunny_manager.xml",
                "bunny_branding_bunny_manager_round.xml",
                "bunny_branding_vendetta_manager.xml",
                "bunny_branding_vendetta_manager_round.xml",
            ),
            ResourceGroup(
                "drawable-nodpi",
                "bunny_branding_preview_discord.xml",
                "bunny_branding_preview_bunny.xml",
                "bunny_branding_preview_bunny_manager.xml",
                "bunny_branding_preview_vendetta.xml",
                "bunny_branding_preview_vendetta_manager.xml",
                "bunny_branding_preview_brand_inverted.xml",
                "bunny_branding_preview_matte_dark.xml",
                "bunny_branding_preview_matte_light.xml",
                "bunny_branding_preview_brand_dark.xml",
                "bunny_branding_preview_pastel.xml",
                "bunny_branding_preview_pirate.xml",
                "bunny_branding_preview_camo.xml",
                "bunny_branding_preview_sunset.xml",
                "bunny_branding_preview_galaxy.xml",
                "bunny_branding_preview_y2k.xml",
                "bunny_branding_preview_cherry_blossom.xml",
                "bunny_branding_preview_beanie.xml",
                "bunny_branding_preview_gaming.xml",
                "bunny_branding_preview_circuit.xml",
                "bunny_branding_preview_holo_waves.xml",
                "bunny_branding_preview_blush.xml",
                "bunny_branding_preview_angry.xml",
                "bunny_branding_preview_manga.xml",
                "bunny_branding_preview_controller.xml",
                "bunny_branding_preview_mushroom.xml",
                "bunny_branding_preview_blurple_twilight.xml",
                "bunny_branding_preview_in_rainbows.xml",
                "bunny_branding_preview_midnight_prism.xml",
                "bunny_branding_preview_color_wave.xml",
            ),
            ResourceGroup(
                "drawable",
                "bunny_branding_brand_dark_foreground.xml",
                "bunny_branding_bunny_manager_foreground.xml",
                "bunny_branding_vendetta_manager_foreground.xml",
                "bunny_branding_bunny_background.xml",
            ),
            ResourceGroup(
                "mipmap-anydpi-v26",
                "bunny_branding_angry.xml",
                "bunny_branding_angry_round.xml",
                "bunny_branding_beanie.xml",
                "bunny_branding_beanie_round.xml",
                "bunny_branding_blurple_twilight.xml",
                "bunny_branding_blurple_twilight_round.xml",
                "bunny_branding_blush.xml",
                "bunny_branding_blush_round.xml",
                "bunny_branding_brand_dark.xml",
                "bunny_branding_brand_dark_round.xml",
                "bunny_branding_brand_inverted.xml",
                "bunny_branding_brand_inverted_round.xml",
                "bunny_branding_bunny.xml",
                "bunny_branding_bunny_manager.xml",
                "bunny_branding_bunny_manager_round.xml",
                "bunny_branding_bunny_round.xml",
                "bunny_branding_camo.xml",
                "bunny_branding_camo_round.xml",
                "bunny_branding_cherry_blossom.xml",
                "bunny_branding_cherry_blossom_round.xml",
                "bunny_branding_circuit.xml",
                "bunny_branding_circuit_round.xml",
                "bunny_branding_color_wave.xml",
                "bunny_branding_color_wave_round.xml",
                "bunny_branding_controller.xml",
                "bunny_branding_controller_round.xml",
                "bunny_branding_discord.xml",
                "bunny_branding_discord_round.xml",
                "bunny_branding_galaxy.xml",
                "bunny_branding_galaxy_round.xml",
                "bunny_branding_gaming.xml",
                "bunny_branding_gaming_round.xml",
                "bunny_branding_holo_waves.xml",
                "bunny_branding_holo_waves_round.xml",
                "bunny_branding_in_rainbows.xml",
                "bunny_branding_in_rainbows_round.xml",
                "bunny_branding_manga.xml",
                "bunny_branding_manga_round.xml",
                "bunny_branding_matte_dark.xml",
                "bunny_branding_matte_dark_round.xml",
                "bunny_branding_matte_light.xml",
                "bunny_branding_matte_light_round.xml",
                "bunny_branding_midnight_prism.xml",
                "bunny_branding_midnight_prism_round.xml",
                "bunny_branding_mushroom.xml",
                "bunny_branding_mushroom_round.xml",
                "bunny_branding_pastel.xml",
                "bunny_branding_pastel_round.xml",
                "bunny_branding_pirate.xml",
                "bunny_branding_pirate_round.xml",
                "bunny_branding_sunset.xml",
                "bunny_branding_sunset_round.xml",
                "bunny_branding_vendetta.xml",
                "bunny_branding_vendetta_manager.xml",
                "bunny_branding_vendetta_manager_round.xml",
                "bunny_branding_vendetta_round.xml",
                "bunny_branding_y2k.xml",
                "bunny_branding_y2k_round.xml",
            ),
            ResourceGroup(
                "mipmap-hdpi",
                "bunny_branding_angry.webp",
                "bunny_branding_angry_foreground.webp",
                "bunny_branding_angry_round.webp",
                "bunny_branding_beanie.webp",
                "bunny_branding_beanie_foreground.webp",
                "bunny_branding_beanie_round.webp",
                "bunny_branding_blurple_twilight.png",
                "bunny_branding_blurple_twilight_foreground.png",
                "bunny_branding_blurple_twilight_round.png",
                "bunny_branding_blush.webp",
                "bunny_branding_blush_foreground.webp",
                "bunny_branding_blush_round.webp",
                "bunny_branding_brand_dark.webp",
                "bunny_branding_brand_dark_round.webp",
                "bunny_branding_brand_inverted.webp",
                "bunny_branding_brand_inverted_foreground.webp",
                "bunny_branding_brand_inverted_round.webp",
                "bunny_branding_camo.webp",
                "bunny_branding_camo_foreground.webp",
                "bunny_branding_camo_round.webp",
                "bunny_branding_cherry_blossom.webp",
                "bunny_branding_cherry_blossom_background.webp",
                "bunny_branding_cherry_blossom_foreground.webp",
                "bunny_branding_cherry_blossom_round.webp",
                "bunny_branding_circuit.webp",
                "bunny_branding_circuit_foreground.webp",
                "bunny_branding_circuit_round.webp",
                "bunny_branding_color_wave.png",
                "bunny_branding_color_wave_foreground.png",
                "bunny_branding_color_wave_round.png",
                "bunny_branding_controller.webp",
                "bunny_branding_controller_foreground.webp",
                "bunny_branding_controller_round.webp",
                "bunny_branding_galaxy.webp",
                "bunny_branding_galaxy_background.webp",
                "bunny_branding_galaxy_foreground.webp",
                "bunny_branding_galaxy_round.webp",
                "bunny_branding_gaming.webp",
                "bunny_branding_gaming_background.webp",
                "bunny_branding_gaming_foreground.webp",
                "bunny_branding_gaming_round.webp",
                "bunny_branding_holo_waves.webp",
                "bunny_branding_holo_waves_foreground.webp",
                "bunny_branding_holo_waves_round.webp",
                "bunny_branding_in_rainbows.png",
                "bunny_branding_in_rainbows_foreground.png",
                "bunny_branding_in_rainbows_round.png",
                "bunny_branding_manga.webp",
                "bunny_branding_manga_foreground.webp",
                "bunny_branding_manga_round.webp",
                "bunny_branding_matte_dark.webp",
                "bunny_branding_matte_dark_foreground.webp",
                "bunny_branding_matte_dark_round.webp",
                "bunny_branding_matte_light.webp",
                "bunny_branding_matte_light_foreground.webp",
                "bunny_branding_matte_light_round.webp",
                "bunny_branding_midnight_prism.png",
                "bunny_branding_midnight_prism_foreground.png",
                "bunny_branding_midnight_prism_round.png",
                "bunny_branding_mushroom.webp",
                "bunny_branding_mushroom_foreground.webp",
                "bunny_branding_mushroom_round.webp",
                "bunny_branding_pastel.webp",
                "bunny_branding_pastel_foreground.webp",
                "bunny_branding_pastel_round.webp",
                "bunny_branding_pirate.webp",
                "bunny_branding_pirate_foreground.webp",
                "bunny_branding_pirate_round.webp",
                "bunny_branding_sunset.webp",
                "bunny_branding_sunset_foreground.webp",
                "bunny_branding_sunset_round.webp",
                "bunny_branding_y2k.webp",
                "bunny_branding_y2k_foreground.webp",
                "bunny_branding_y2k_round.webp",
            ),
            ResourceGroup(
                "mipmap-mdpi",
                "bunny_branding_angry.webp",
                "bunny_branding_angry_foreground.webp",
                "bunny_branding_angry_round.webp",
                "bunny_branding_beanie.webp",
                "bunny_branding_beanie_foreground.webp",
                "bunny_branding_beanie_round.webp",
                "bunny_branding_blurple_twilight.png",
                "bunny_branding_blurple_twilight_foreground.png",
                "bunny_branding_blurple_twilight_round.png",
                "bunny_branding_blush.webp",
                "bunny_branding_blush_foreground.webp",
                "bunny_branding_blush_round.webp",
                "bunny_branding_brand_dark.webp",
                "bunny_branding_brand_dark_round.webp",
                "bunny_branding_brand_inverted.webp",
                "bunny_branding_brand_inverted_foreground.webp",
                "bunny_branding_brand_inverted_round.webp",
                "bunny_branding_camo.webp",
                "bunny_branding_camo_foreground.webp",
                "bunny_branding_camo_round.webp",
                "bunny_branding_cherry_blossom.webp",
                "bunny_branding_cherry_blossom_background.webp",
                "bunny_branding_cherry_blossom_foreground.webp",
                "bunny_branding_cherry_blossom_round.webp",
                "bunny_branding_circuit.webp",
                "bunny_branding_circuit_foreground.webp",
                "bunny_branding_circuit_round.webp",
                "bunny_branding_color_wave.png",
                "bunny_branding_color_wave_foreground.png",
                "bunny_branding_color_wave_round.png",
                "bunny_branding_controller.webp",
                "bunny_branding_controller_foreground.webp",
                "bunny_branding_controller_round.webp",
                "bunny_branding_galaxy.webp",
                "bunny_branding_galaxy_background.webp",
                "bunny_branding_galaxy_foreground.webp",
                "bunny_branding_galaxy_round.webp",
                "bunny_branding_gaming.webp",
                "bunny_branding_gaming_background.webp",
                "bunny_branding_gaming_foreground.webp",
                "bunny_branding_gaming_round.webp",
                "bunny_branding_holo_waves.webp",
                "bunny_branding_holo_waves_foreground.webp",
                "bunny_branding_holo_waves_round.webp",
                "bunny_branding_in_rainbows.png",
                "bunny_branding_in_rainbows_foreground.png",
                "bunny_branding_in_rainbows_round.png",
                "bunny_branding_manga.webp",
                "bunny_branding_manga_foreground.webp",
                "bunny_branding_manga_round.webp",
                "bunny_branding_matte_dark.webp",
                "bunny_branding_matte_dark_foreground.webp",
                "bunny_branding_matte_dark_round.webp",
                "bunny_branding_matte_light.webp",
                "bunny_branding_matte_light_foreground.webp",
                "bunny_branding_matte_light_round.webp",
                "bunny_branding_midnight_prism.png",
                "bunny_branding_midnight_prism_foreground.png",
                "bunny_branding_midnight_prism_round.png",
                "bunny_branding_mushroom.webp",
                "bunny_branding_mushroom_foreground.webp",
                "bunny_branding_mushroom_round.webp",
                "bunny_branding_pastel.webp",
                "bunny_branding_pastel_foreground.webp",
                "bunny_branding_pastel_round.webp",
                "bunny_branding_pirate.webp",
                "bunny_branding_pirate_foreground.webp",
                "bunny_branding_pirate_round.webp",
                "bunny_branding_sunset.webp",
                "bunny_branding_sunset_foreground.webp",
                "bunny_branding_sunset_round.webp",
                "bunny_branding_y2k.webp",
                "bunny_branding_y2k_foreground.webp",
                "bunny_branding_y2k_round.webp",
            ),
            ResourceGroup(
                "mipmap-nodpi",
                "bunny_branding_bunny_foreground.png",
            ),
            ResourceGroup(
                "mipmap-xhdpi",
                "bunny_branding_angry.webp",
                "bunny_branding_angry_foreground.webp",
                "bunny_branding_angry_round.webp",
                "bunny_branding_beanie.webp",
                "bunny_branding_beanie_foreground.webp",
                "bunny_branding_beanie_round.webp",
                "bunny_branding_blurple_twilight.png",
                "bunny_branding_blurple_twilight_foreground.png",
                "bunny_branding_blurple_twilight_round.png",
                "bunny_branding_blush.webp",
                "bunny_branding_blush_foreground.webp",
                "bunny_branding_blush_round.webp",
                "bunny_branding_brand_dark.webp",
                "bunny_branding_brand_dark_round.webp",
                "bunny_branding_brand_inverted.webp",
                "bunny_branding_brand_inverted_foreground.webp",
                "bunny_branding_brand_inverted_round.webp",
                "bunny_branding_bunny.xml",
                "bunny_branding_bunny_round.xml",
                "bunny_branding_camo.webp",
                "bunny_branding_camo_foreground.webp",
                "bunny_branding_camo_round.webp",
                "bunny_branding_cherry_blossom.webp",
                "bunny_branding_cherry_blossom_background.webp",
                "bunny_branding_cherry_blossom_foreground.webp",
                "bunny_branding_cherry_blossom_round.webp",
                "bunny_branding_circuit.webp",
                "bunny_branding_circuit_foreground.webp",
                "bunny_branding_circuit_round.webp",
                "bunny_branding_color_wave.png",
                "bunny_branding_color_wave_foreground.png",
                "bunny_branding_color_wave_round.png",
                "bunny_branding_controller.webp",
                "bunny_branding_controller_foreground.webp",
                "bunny_branding_controller_round.webp",
                "bunny_branding_discord.png",
                "bunny_branding_discord_foreground.png",
                "bunny_branding_discord_round.png",
                "bunny_branding_galaxy.webp",
                "bunny_branding_galaxy_background.webp",
                "bunny_branding_galaxy_foreground.webp",
                "bunny_branding_galaxy_round.webp",
                "bunny_branding_gaming.webp",
                "bunny_branding_gaming_background.webp",
                "bunny_branding_gaming_foreground.webp",
                "bunny_branding_gaming_round.webp",
                "bunny_branding_holo_waves.webp",
                "bunny_branding_holo_waves_foreground.webp",
                "bunny_branding_holo_waves_round.webp",
                "bunny_branding_in_rainbows.png",
                "bunny_branding_in_rainbows_foreground.png",
                "bunny_branding_in_rainbows_round.png",
                "bunny_branding_manga.webp",
                "bunny_branding_manga_foreground.webp",
                "bunny_branding_manga_round.webp",
                "bunny_branding_matte_dark.webp",
                "bunny_branding_matte_dark_foreground.webp",
                "bunny_branding_matte_dark_round.webp",
                "bunny_branding_matte_light.webp",
                "bunny_branding_matte_light_foreground.webp",
                "bunny_branding_matte_light_round.webp",
                "bunny_branding_midnight_prism.png",
                "bunny_branding_midnight_prism_foreground.png",
                "bunny_branding_midnight_prism_round.png",
                "bunny_branding_mushroom.webp",
                "bunny_branding_mushroom_foreground.webp",
                "bunny_branding_mushroom_round.webp",
                "bunny_branding_pastel.webp",
                "bunny_branding_pastel_foreground.webp",
                "bunny_branding_pastel_round.webp",
                "bunny_branding_pirate.webp",
                "bunny_branding_pirate_foreground.webp",
                "bunny_branding_pirate_round.webp",
                "bunny_branding_sunset.webp",
                "bunny_branding_sunset_foreground.webp",
                "bunny_branding_sunset_round.webp",
                "bunny_branding_vendetta.png",
                "bunny_branding_vendetta_foreground.png",
                "bunny_branding_vendetta_round.png",
                "bunny_branding_y2k.webp",
                "bunny_branding_y2k_foreground.webp",
                "bunny_branding_y2k_round.webp",
            ),
            ResourceGroup(
                "mipmap-xxhdpi",
                "bunny_branding_angry.webp",
                "bunny_branding_angry_foreground.webp",
                "bunny_branding_angry_round.webp",
                "bunny_branding_beanie.webp",
                "bunny_branding_beanie_foreground.webp",
                "bunny_branding_beanie_round.webp",
                "bunny_branding_blurple_twilight.png",
                "bunny_branding_blurple_twilight_foreground.png",
                "bunny_branding_blurple_twilight_round.png",
                "bunny_branding_blush.webp",
                "bunny_branding_blush_foreground.webp",
                "bunny_branding_blush_round.webp",
                "bunny_branding_brand_dark.webp",
                "bunny_branding_brand_dark_round.webp",
                "bunny_branding_brand_inverted.webp",
                "bunny_branding_brand_inverted_foreground.webp",
                "bunny_branding_brand_inverted_round.webp",
                "bunny_branding_bunny.xml",
                "bunny_branding_bunny_round.xml",
                "bunny_branding_camo.webp",
                "bunny_branding_camo_foreground.webp",
                "bunny_branding_camo_round.webp",
                "bunny_branding_cherry_blossom.webp",
                "bunny_branding_cherry_blossom_background.webp",
                "bunny_branding_cherry_blossom_foreground.webp",
                "bunny_branding_cherry_blossom_round.webp",
                "bunny_branding_circuit.webp",
                "bunny_branding_circuit_foreground.webp",
                "bunny_branding_circuit_round.webp",
                "bunny_branding_color_wave.png",
                "bunny_branding_color_wave_foreground.png",
                "bunny_branding_color_wave_round.png",
                "bunny_branding_controller.webp",
                "bunny_branding_controller_foreground.webp",
                "bunny_branding_controller_round.webp",
                "bunny_branding_discord.png",
                "bunny_branding_discord_foreground.png",
                "bunny_branding_discord_round.png",
                "bunny_branding_galaxy.webp",
                "bunny_branding_galaxy_background.webp",
                "bunny_branding_galaxy_foreground.webp",
                "bunny_branding_galaxy_round.webp",
                "bunny_branding_gaming.webp",
                "bunny_branding_gaming_background.webp",
                "bunny_branding_gaming_foreground.webp",
                "bunny_branding_gaming_round.webp",
                "bunny_branding_holo_waves.webp",
                "bunny_branding_holo_waves_foreground.webp",
                "bunny_branding_holo_waves_round.webp",
                "bunny_branding_in_rainbows.png",
                "bunny_branding_in_rainbows_foreground.png",
                "bunny_branding_in_rainbows_round.png",
                "bunny_branding_manga.webp",
                "bunny_branding_manga_foreground.webp",
                "bunny_branding_manga_round.webp",
                "bunny_branding_matte_dark.webp",
                "bunny_branding_matte_dark_foreground.webp",
                "bunny_branding_matte_dark_round.webp",
                "bunny_branding_matte_light.webp",
                "bunny_branding_matte_light_foreground.webp",
                "bunny_branding_matte_light_round.webp",
                "bunny_branding_midnight_prism.png",
                "bunny_branding_midnight_prism_foreground.png",
                "bunny_branding_midnight_prism_round.png",
                "bunny_branding_mushroom.webp",
                "bunny_branding_mushroom_foreground.webp",
                "bunny_branding_mushroom_round.webp",
                "bunny_branding_pastel.webp",
                "bunny_branding_pastel_foreground.webp",
                "bunny_branding_pastel_round.webp",
                "bunny_branding_pirate.webp",
                "bunny_branding_pirate_foreground.webp",
                "bunny_branding_pirate_round.webp",
                "bunny_branding_sunset.webp",
                "bunny_branding_sunset_foreground.webp",
                "bunny_branding_sunset_round.webp",
                "bunny_branding_vendetta.png",
                "bunny_branding_vendetta_foreground.png",
                "bunny_branding_vendetta_round.png",
                "bunny_branding_y2k.webp",
                "bunny_branding_y2k_foreground.webp",
                "bunny_branding_y2k_round.webp",
            ),
            ResourceGroup(
                "mipmap-xxxhdpi",
                "bunny_branding_angry.webp",
                "bunny_branding_angry_foreground.webp",
                "bunny_branding_angry_round.webp",
                "bunny_branding_beanie.webp",
                "bunny_branding_beanie_foreground.webp",
                "bunny_branding_beanie_round.webp",
                "bunny_branding_blurple_twilight.png",
                "bunny_branding_blurple_twilight_foreground.png",
                "bunny_branding_blurple_twilight_round.png",
                "bunny_branding_blush.webp",
                "bunny_branding_blush_foreground.webp",
                "bunny_branding_blush_round.webp",
                "bunny_branding_brand_dark.webp",
                "bunny_branding_brand_dark_round.webp",
                "bunny_branding_brand_inverted.webp",
                "bunny_branding_brand_inverted_foreground.webp",
                "bunny_branding_brand_inverted_round.webp",
                "bunny_branding_bunny.xml",
                "bunny_branding_bunny_round.xml",
                "bunny_branding_camo.webp",
                "bunny_branding_camo_foreground.webp",
                "bunny_branding_camo_round.webp",
                "bunny_branding_cherry_blossom.webp",
                "bunny_branding_cherry_blossom_background.webp",
                "bunny_branding_cherry_blossom_foreground.webp",
                "bunny_branding_cherry_blossom_round.webp",
                "bunny_branding_circuit.webp",
                "bunny_branding_circuit_foreground.webp",
                "bunny_branding_circuit_round.webp",
                "bunny_branding_color_wave.png",
                "bunny_branding_color_wave_foreground.png",
                "bunny_branding_color_wave_round.png",
                "bunny_branding_controller.webp",
                "bunny_branding_controller_foreground.webp",
                "bunny_branding_controller_round.webp",
                "bunny_branding_discord.png",
                "bunny_branding_discord_foreground.png",
                "bunny_branding_discord_round.png",
                "bunny_branding_galaxy.webp",
                "bunny_branding_galaxy_background.webp",
                "bunny_branding_galaxy_foreground.webp",
                "bunny_branding_galaxy_round.webp",
                "bunny_branding_gaming.webp",
                "bunny_branding_gaming_background.webp",
                "bunny_branding_gaming_foreground.webp",
                "bunny_branding_gaming_round.webp",
                "bunny_branding_holo_waves.webp",
                "bunny_branding_holo_waves_foreground.webp",
                "bunny_branding_holo_waves_round.webp",
                "bunny_branding_in_rainbows.png",
                "bunny_branding_in_rainbows_foreground.png",
                "bunny_branding_in_rainbows_round.png",
                "bunny_branding_manga.webp",
                "bunny_branding_manga_foreground.webp",
                "bunny_branding_manga_round.webp",
                "bunny_branding_matte_dark.webp",
                "bunny_branding_matte_dark_foreground.webp",
                "bunny_branding_matte_dark_round.webp",
                "bunny_branding_matte_light.webp",
                "bunny_branding_matte_light_foreground.webp",
                "bunny_branding_matte_light_round.webp",
                "bunny_branding_midnight_prism.png",
                "bunny_branding_midnight_prism_foreground.png",
                "bunny_branding_midnight_prism_round.png",
                "bunny_branding_mushroom.webp",
                "bunny_branding_mushroom_foreground.webp",
                "bunny_branding_mushroom_round.webp",
                "bunny_branding_pastel.webp",
                "bunny_branding_pastel_foreground.webp",
                "bunny_branding_pastel_round.webp",
                "bunny_branding_pirate.webp",
                "bunny_branding_pirate_foreground.webp",
                "bunny_branding_pirate_round.webp",
                "bunny_branding_sunset.webp",
                "bunny_branding_sunset_foreground.webp",
                "bunny_branding_sunset_round.webp",
                "bunny_branding_vendetta.png",
                "bunny_branding_vendetta_foreground.png",
                "bunny_branding_vendetta_round.png",
                "bunny_branding_y2k.webp",
                "bunny_branding_y2k_foreground.webp",
                "bunny_branding_y2k_round.webp",
            )
        )

        document("AndroidManifest.xml").use { document ->
            val application =
                document
                    .getElementsByTagName("application")
                    .item(0)
                    as? Element
                    ?: error(
                        "AndroidManifest.xml has no application element",
                    )

            val applicationComponents =
                directChildElements(application)
                    .filter {
                        it.tagName == "activity" ||
                            it.tagName == "activity-alias"
                    }

            val launcherComponents =
                applicationComponents
                    .filter {
                        launcherIntentFilters(it)
                            .isNotEmpty()
                    }

            check(launcherComponents.isNotEmpty()) {
                "No MAIN/LAUNCHER component was found"
            }

            /*
             * The currently enabled launcher is the semantic anchor.
             * Do not rely on Discord class or alias names.
             */
            val enabledLaunchers =
                launcherComponents
                    .filter(::manifestEnabled)

            check(enabledLaunchers.size == 1) {
                "Expected exactly one enabled launcher component, found " +
                    enabledLaunchers.size
            }

            val stockDefaultLauncher =
                enabledLaunchers.single()

            val targetActivity =
                launcherTarget(
                    stockDefaultLauncher,
                )

            check(targetActivity.isNotBlank()) {
                "Enabled launcher component has no target activity"
            }

            val stockLauncherFamily =
                launcherComponents
                    .filter {
                        launcherTarget(it) ==
                            targetActivity
                    }

            check(stockLauncherFamily.isNotEmpty()) {
                "Could not resolve the stock launcher family"
            }

            val defaultLauncherFilters =
                launcherIntentFilters(
                    stockDefaultLauncher,
                )

            check(defaultLauncherFilters.isNotEmpty()) {
                "Enabled launcher has no MAIN/LAUNCHER filter"
            }

            /*
             * Do not silently duplicate unrelated deep-link or other
             * intent filters across 87 aliases.
             *
             * If Discord ever puts non-launcher filters on its launcher
             * alias, fail closed so that case can be handled deliberately.
             */
            val allDefaultIntentFilters =
                allIntentFilters(
                    stockDefaultLauncher,
                )

            check(
                allDefaultIntentFilters.size ==
                    defaultLauncherFilters.size
            ) {
                "Enabled launcher contains non-launcher intent filters"
            }

            /*
             * Android Settings/App Info reads the application icon rather
             * than the currently enabled launcher alias. Keep that static
             * package identity Bunny-owned while launcher branding remains
             * independently selectable.
             *
             * This is the Bunny client icon, not Bunny Manager.
             */
            application.setAttribute(
                "android:icon",
                "@mipmap/bunny_branding_bunny",
            )

            application.setAttribute(
                "android:roundIcon",
                "@mipmap/bunny_branding_bunny_round",
            )
            application.setAttribute(
                "android:label",
                "Bunny",
            )
            val existingBunnyAliases =
                applicationComponents
                    .filter {
                        it.tagName == "activity-alias"
                    }
                    .filter {
                        it
                            .getAttribute("android:name")
                            .startsWith(
                                BUNNY_BRANDING_ALIAS_PREFIX,
                            )
                    }

            check(existingBunnyAliases.isEmpty()) {
                "Bunny branding aliases already exist in the manifest"
            }

            var aliasesCreated = 0

            /*
             * Add all replacement aliases FIRST.
             *
             * Only after the complete replacement family exists are
             * stock MAIN/LAUNCHER filters removed.
             */
            bunnyBrandingIconModes.forEach { iconMode ->
                bunnyBrandingNameModes.forEach {
                        (nameMode, label) ->
                    val alias =
                        document.createElement(
                            "activity-alias",
                        )

                    val aliasName =
                        BUNNY_BRANDING_ALIAS_PREFIX +
                            iconMode +
                            "__" +
                            nameMode

                    val iconResource =
                        "bunny_branding_" +
                            iconMode

                    val enabled =
                        iconMode == "bunny" &&
                            nameMode == "bunny"

                    alias.setAttribute(
                        "android:name",
                        aliasName,
                    )

                    alias.setAttribute(
                        "android:enabled",
                        enabled.toString(),
                    )

                    alias.setAttribute(
                        "android:exported",
                        "true",
                    )

                    alias.setAttribute(
                        "android:icon",
                        "@mipmap/$iconResource",
                    )

                    alias.setAttribute(
                        "android:roundIcon",
                        "@mipmap/${iconResource}_round",
                    )

                    alias.setAttribute(
                        "android:label",
                        label,
                    )

                    alias.setAttribute(
                        "android:targetActivity",
                        targetActivity,
                    )

                    defaultLauncherFilters.forEach {
                            launcherFilter ->
                        alias.appendChild(
                            launcherFilter.cloneNode(true),
                        )
                    }

                    application.appendChild(alias)
                    aliasesCreated++
                }
            }

            check(aliasesCreated == 87) {
                "Expected 87 Bunny branding aliases, created " +
                    aliasesCreated
            }

            /*
             * The replacement family now exists.
             *
             * Keep Discord's original components intact because its own
             * code may still toggle their enabled state. Remove only
             * their launcher filters so they cannot create duplicate
             * app-drawer entries.
             */
            stockLauncherFamily.forEach { component ->
                launcherIntentFilters(component)
                    .toList()
                    .forEach {
                        component.removeChild(it)
                    }
            }

            check(
                stockLauncherFamily.none {
                    launcherIntentFilters(it)
                        .isNotEmpty()
                }
            ) {
                "A stock launcher MAIN/LAUNCHER filter remains"
            }

            val bunnyAliases =
                directChildElements(application)
                    .filter {
                        it.tagName == "activity-alias"
                    }
                    .filter {
                        it
                            .getAttribute("android:name")
                            .startsWith(
                                BUNNY_BRANDING_ALIAS_PREFIX,
                            )
                    }

            check(bunnyAliases.size == 87) {
                "Expected 87 Bunny aliases after mutation, found " +
                    bunnyAliases.size
            }

            val enabledBunnyAliases =
                bunnyAliases
                    .filter(::manifestEnabled)

            check(enabledBunnyAliases.size == 1) {
                "Expected exactly one enabled Bunny alias, found " +
                    enabledBunnyAliases.size
            }

            check(
                enabledBunnyAliases
                    .single()
                    .getAttribute("android:name") ==
                    ".bunny_branding_bunny__bunny"
            ) {
                "Unexpected default Bunny branding alias"
            }
        }
    }
}