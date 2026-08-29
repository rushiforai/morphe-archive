package app.danielthemaniel.patches.pokeraid

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Replaces PokeRaid's blue/grey application palette with Android 12+'s
 * wallpaper-derived Material You (Monet) system palette.
 *
 * Status/error/success/warning and raid-type colors are intentionally left
 * alone so semantic states remain recognizable.
 */
@Suppress("unused")
val materialYouThemePatch = resourcePatch(
    name = "Material You Theme",
    description = "Uses Android 12+ wallpaper-derived Material You colors throughout PokeRaid while preserving semantic status and raid-type colors.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKERAID)

    execute {
        /*
         * PokeRaid has two palette layers:
         *
         *  1. AppTheme theme attributes used by custom PokeLounge widgets.
         *  2. Named color resources used directly by layouts/drawables.
         *
         * Patch both so MaterialComponents widgets and PokeRaid's custom
         * components agree on the same dynamic palette.
         */
        document("res/values/styles.xml").use { document ->
            val styles = document.getElementsByTagName("style")

            for (i in 0 until styles.length) {
                val style = styles.item(i) as? Element ?: continue
                if (style.getAttribute("name") != "AppTheme") continue

                fun setStyleItem(name: String, value: String) {
                    val items = style.getElementsByTagName("item")

                    for (j in 0 until items.length) {
                        val item = items.item(j) as? Element ?: continue
                        if (item.getAttribute("name") == name) {
                            item.textContent = value
                            return
                        }
                    }

                    val item = document.createElement("item")
                    item.setAttribute("name", name)
                    item.textContent = value
                    style.appendChild(item)
                }

                // Standard Material Components roles.
                setStyleItem("colorPrimary", "@android:color/system_accent1_500")
                setStyleItem("colorPrimaryDark", "@android:color/system_accent1_700")
                setStyleItem("colorPrimaryVariant", "@android:color/system_accent1_700")
                setStyleItem("colorSecondary", "@android:color/system_accent2_500")
                setStyleItem("colorSecondaryVariant", "@android:color/system_accent2_700")
                setStyleItem("colorAccent", "@android:color/system_accent2_500")

                setStyleItem("colorSurface", "@android:color/system_neutral1_0")
                setStyleItem("colorOnPrimary", "@android:color/system_accent1_0")
                setStyleItem("colorOnSecondary", "@android:color/system_accent2_0")
                setStyleItem("colorOnSurface", "@android:color/system_neutral1_900")
                setStyleItem("colorOnBackground", "@android:color/system_neutral1_900")

                setStyleItem(
                    "android:colorBackground",
                    "@android:color/system_neutral1_50"
                )
                setStyleItem(
                    "android:windowBackground",
                    "@android:color/system_neutral1_50"
                )
                setStyleItem(
                    "android:statusBarColor",
                    "@android:color/system_accent1_700"
                )
                setStyleItem(
                    "android:navigationBarColor",
                    "@android:color/system_neutral1_50"
                )

                // PokeRaid / PokeLounge custom semantic theme roles.
                setStyleItem("colorBackgroundCustom1", "@android:color/system_neutral1_50")
                setStyleItem("colorBackgroundCustom2", "@android:color/system_accent2_100")
                setStyleItem("colorBackgroundCustom3", "@android:color/system_neutral2_50")
                setStyleItem("colorBackgroundDeactivated", "@android:color/system_neutral2_100")
                setStyleItem("colorBackgroundPrimary", "@android:color/system_neutral1_100")

                setStyleItem("colorLabelQuaternary", "@android:color/system_neutral2_200")
                setStyleItem("colorLabelSecondary", "@android:color/system_neutral2_600")
                setStyleItem("colorLabelTertiary", "@android:color/system_neutral2_300")

                setStyleItem("colorNeutral0", "@android:color/system_neutral1_0")
                setStyleItem("colorNeutral10", "@android:color/system_neutral1_50")
                setStyleItem("colorNeutral20", "@android:color/system_neutral1_100")
                setStyleItem("colorNeutral30", "@android:color/system_neutral1_200")
                setStyleItem("colorNeutral40", "@android:color/system_neutral1_300")
                setStyleItem("colorNeutral50", "@android:color/system_neutral1_400")
                setStyleItem("colorNeutral60", "@android:color/system_neutral1_500")
                setStyleItem("colorNeutral70", "@android:color/system_neutral1_600")
                setStyleItem("colorNeutral80", "@android:color/system_neutral1_700")
                setStyleItem("colorNeutral90", "@android:color/system_neutral1_800")
                setStyleItem("colorNeutral100", "@android:color/system_neutral1_900")
                setStyleItem("colorNeutral110", "@android:color/system_neutral1_900")
                setStyleItem("colorNeutral120", "@android:color/system_neutral1_1000")

                setStyleItem("colorPrimary0", "@android:color/system_accent1_50")
                setStyleItem("colorPrimary10", "@android:color/system_accent1_100")
                setStyleItem("colorPrimary20", "@android:color/system_accent1_200")
                setStyleItem("colorPrimary40", "@android:color/system_accent1_500")

                setStyleItem("colorSecondary0", "@android:color/system_accent2_50")
                setStyleItem("colorSecondary10", "@android:color/system_accent2_100")
                setStyleItem("colorSecondary20", "@android:color/system_accent2_200")
                setStyleItem("colorSecondary40", "@android:color/system_accent2_500")

                setStyleItem("colorShade100", "@android:color/system_neutral1_0")
                setStyleItem("colorShade200", "@android:color/system_neutral1_50")
                setStyleItem("colorShade500", "@android:color/system_neutral2_300")
                setStyleItem("colorShade600", "@android:color/system_neutral2_600")
                setStyleItem("colorShade700", "@android:color/system_neutral1_800")
                setStyleItem("colorShade900", "@android:color/system_neutral1_1000")

                setStyleItem("colorTextContent", "@android:color/system_neutral2_700")
                setStyleItem("colorTextDeactive", "@android:color/system_neutral2_600")
                setStyleItem("colorTextFootnote", "@android:color/system_neutral2_600")
                setStyleItem("colorTextPrimary", "@android:color/system_neutral1_900")
                setStyleItem("colorTextSecondary", "@android:color/system_neutral2_800")
                setStyleItem("colorTextTertiary", "@android:color/system_neutral2_700")
                setStyleItem("colorTextTitle", "@android:color/system_neutral1_1000")

                break
            }
        }

        /*
         * Direct resource usages. Keep success/error/warning, Pokémon type,
         * raid classification, Frontliner, coupon, and ad-SDK colors stock.
         */
        val replacements = mapOf(
            "colorAccent" to "@android:color/system_accent2_500",

            "colorBackgroundCustom1" to "@android:color/system_neutral1_50",
            "colorBackgroundCustom2" to "@android:color/system_accent2_100",
            "colorBackgroundCustom3" to "@android:color/system_neutral2_50",
            "colorBackgroundPrimary" to "@android:color/system_neutral1_100",

            "colorLabelQuaternary" to "@android:color/system_neutral2_200",
            "colorLabelTertiary" to "@android:color/system_neutral2_300",

            "colorNeutral0" to "@android:color/system_neutral1_0",
            "colorNeutral10" to "@android:color/system_neutral1_50",
            "colorNeutral20" to "@android:color/system_neutral1_100",
            "colorNeutral30" to "@android:color/system_neutral1_200",
            "colorNeutral40" to "@android:color/system_neutral1_300",
            "colorNeutral50" to "@android:color/system_neutral1_400",
            "colorNeutral60" to "@android:color/system_neutral1_500",
            "colorNeutral70" to "@android:color/system_neutral1_600",
            "colorNeutral80" to "@android:color/system_neutral1_700",
            "colorNeutral90" to "@android:color/system_neutral1_800",
            "colorNeutral100" to "@android:color/system_neutral1_900",
            "colorNeutral110" to "@android:color/system_neutral1_900",
            "colorNeutral120" to "@android:color/system_neutral1_1000",

            "colorPrimary" to "@android:color/system_accent1_500",
            "colorPrimary0" to "@android:color/system_accent1_50",
            "colorPrimary10" to "@android:color/system_accent1_100",
            "colorPrimary20" to "@android:color/system_accent1_200",
            "colorPrimary40" to "@android:color/system_accent1_500",
            "colorPrimaryDark" to "@android:color/system_accent1_700",

            "colorSecondary0" to "@android:color/system_accent2_50",
            "colorSecondary10" to "@android:color/system_accent2_100",
            "colorSecondary20" to "@android:color/system_accent2_200",
            "colorSecondary40" to "@android:color/system_accent2_500",

            "colorShade100" to "@android:color/system_neutral1_0",
            "colorShade200" to "@android:color/system_neutral1_50",
            "colorShade500" to "@android:color/system_neutral2_300",
            "colorShade600" to "@android:color/system_neutral2_600",
            "colorShade700" to "@android:color/system_neutral1_800",
            "colorShade900" to "@android:color/system_neutral1_1000",

            "colorTextContent" to "@android:color/system_neutral2_700",
            "colorTextDeactive" to "@android:color/system_neutral2_600",
            "colorTextFootnote" to "@android:color/system_neutral2_600",
            "colorTextPrimary" to "@android:color/system_neutral1_900",
            "colorTextSecondary" to "@android:color/system_neutral2_800",
            "colorTextTertiary" to "@android:color/system_neutral2_700",
            "colorTextTitle" to "@android:color/system_neutral1_1000",

            "backgroundLight" to "@android:color/system_neutral1_100",
            "deactivated" to "@android:color/system_neutral2_600",
            "deactivatedBackground" to "@android:color/system_neutral2_100",

            // Material/AppCompat colors still used by some library widgets.
            "design_default_color_background" to "@android:color/system_neutral1_50",
            "design_default_color_on_background" to "@android:color/system_neutral1_900",
            "design_default_color_on_primary" to "@android:color/system_accent1_0",
            "design_default_color_on_secondary" to "@android:color/system_accent2_0",
            "design_default_color_on_surface" to "@android:color/system_neutral1_900",
            "design_default_color_primary" to "@android:color/system_accent1_500",
            "design_default_color_primary_dark" to "@android:color/system_accent1_700",
            "design_default_color_primary_variant" to "@android:color/system_accent1_700",
            "design_default_color_secondary" to "@android:color/system_accent2_500",
            "design_default_color_secondary_variant" to "@android:color/system_accent2_700",
            "design_default_color_surface" to "@android:color/system_neutral1_0",

            "background_material_light" to "@android:color/system_neutral1_50",
            "foreground_material_light" to "@android:color/system_neutral1_900",
            "dim_foreground_material_light" to "@android:color/system_neutral2_700",
            "bright_foreground_material_light" to "@android:color/system_neutral1_1000",
        )

        document("res/values/colors.xml").use { document ->
            val colors = document.getElementsByTagName("color")

            for (i in 0 until colors.length) {
                val color = colors.item(i) as? Element ?: continue
                replacements[color.getAttribute("name")]?.let { replacement ->
                    color.textContent = replacement
                }
            }
        }
    }
}
