package app.spectre.patches.theme

import app.morphe.patcher.patch.resourcePatch
import app.spectre.patches.shared.Constants.COMPATIBILITY_MAL

@Suppress("unused")
val amoledThemePatch = resourcePatch(
    name = "AMOLED black theme",
    description = "Replaces the dark theme backgrounds with solid pure black (#000000).",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAL)

    execute {
        val colorsFile = get("res/values-night/colors.xml")
        if (colorsFile.exists()) {
            var content = colorsFile.readText(Charsets.UTF_8)
            val replacements = mapOf(
                "name=\"white\">#121212<" to "name=\"white\">#000000<",
                "name=\"white50\">#80121212<" to "name=\"white50\">#80000000<",
                "name=\"colorPrimaryDark\">#222222<" to "name=\"colorPrimaryDark\">#000000<",
                "name=\"bottomNavBackground\">@color/colorPrimaryDark<" to "name=\"bottomNavBackground\">#000000<",
                "name=\"listBackground\">#070707<" to "name=\"listBackground\">#000000<",
                "name=\"drawerBackground\">#272727<" to "name=\"drawerBackground\">#000000<",
                "name=\"elevatedHeaderBackground\">#272727<" to "name=\"elevatedHeaderBackground\">#000000<",
                "name=\"filter\">#801e1e1e<" to "name=\"filter\">#80000000<",
                "name=\"grayBackground\">#202020<" to "name=\"grayBackground\">#000000<",
                "name=\"malOffWhite\">#171717<" to "name=\"malOffWhite\">#000000<",
                "name=\"settingsGroupBackground\">#272727<" to "name=\"settingsGroupBackground\">#000000<",
                "name=\"settingsItemBackground\">#1e1e1e<" to "name=\"settingsItemBackground\">#000000<",
                "name=\"divider\">#2e2e2e<" to "name=\"divider\">#1a1a1a<",
                "name=\"forum_post_footer_background\">#454545<" to "name=\"forum_post_footer_background\">#1a1a1a<",
                "name=\"forum_post_quote_background\">#383838<" to "name=\"forum_post_quote_background\">#141414<",
                "name=\"privacySettingSelected\">#656565<" to "name=\"privacySettingSelected\">#2a2a2a<"
            )
            for ((orig, repl) in replacements) {
                content = content.replace(orig, repl)
            }
            colorsFile.writeText(content, Charsets.UTF_8)
        }
    }
}
