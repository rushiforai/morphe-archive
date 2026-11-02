package app.spicetify.patches.spotify.theme

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.spicetify.patches.spotify.settings.themeSettingsPatch
import app.spicetify.patches.spotify.spotifyCompatibility
import javax.xml.parsers.DocumentBuilderFactory

private const val ROLE_MAP_CLASS = "Lapp/spicetify/extension/spotify/theme/ThemeRoleMap;"

/** Filled by [themeResourcesPatch], which [themePatch] depends on. */
private var roleTableForExtension: String? = null
private var composeTableForExtension: String? = null

private val themeResourcesPatch = resourcePatch {
    execute {
        val roleMap = loadRoleMap()
        // Read-only: the colors keep their stock values; only overlayable.xml changes.
        val colors = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(get("res/values/colors.xml"))
        roleTableForExtension = roleTable(colors, roleMap)
        composeTableForExtension = composeTable(colors, roleMap, loadComposePaths())
        val overlayable = get("res/values/overlayable.xml")
        val declaration = overlayableXml(roleMap.values.flatten())
        if (overlayable.exists()) {
            val inner = declaration.substringAfter("<resources>\n").substringBefore("</resources>")
            overlayable.writeText(overlayable.readText().replaceFirst("</resources>", "$inner</resources>"))
        } else {
            overlayable.writeText(declaration)
        }
    }
}

@Suppress("unused")
val themePatch = bytecodePatch(
    name = "Theme colors",
    description = "Choose a theme, such as OLED, or your own colors in Spicetify settings. Requires Android 11 or later. " +
        "Some screens and hardcoded colors keep Spotify's colors.",
    default = false,
) {
    compatibleWith(spotifyCompatibility)
    dependsOn(themeSettingsPatch, themeResourcesPatch, themeComposePatch)

    execute {
        injectTable(ROLE_MAP_CLASS, "encoded", roleTableForExtension)
        injectTable(COMPOSE_THEME_CLASS, "table", composeTableForExtension)
    }
}

/** Makes the extension's placeholder method return the table the resource patch built. */
private fun BytecodePatchContext.injectTable(className: String, method: String, table: String?) {
    requireNotNull(table) { "The theme resource patch did not run first." }
    mutableClassDefBy(className).methods.single { it.name == method }
        .replaceInstruction(0, "const-string v0, \"$table\"")
}
