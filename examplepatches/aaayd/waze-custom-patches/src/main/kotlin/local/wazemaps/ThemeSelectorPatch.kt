package local.wazemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.Properties

private const val THEME_EXTENSION = "Llocal/wazemaps/themes/ThemeSelector;"
private object SelectableThemeResources

private fun themeProperties(name: String): Map<String, String> {
    val properties = Properties()
    val input = SelectableThemeResources::class.java.getResourceAsStream("/themes/$name.properties")
        ?: throw PatchException("Missing theme: $name")
    input.use(properties::load)
    return properties.stringPropertyNames().associateWith(properties::getProperty)
}

private val selectableThemeAssets = rawResourcePatch {
    dependsOn(refreshWazeSkins)
    execute {
        // Store additional palettes separately. Original APK skins remain byte-for-byte intact.
        for (variant in listOf("", "experiment/")) {
            for (mode in listOf("day", "night")) {
                val source = get("assets/res/skins/default/${variant}skin_values.$mode.lua").readText()
                val choices = mapOf(
                    "google_v2" to recolorSkin(source, themeProperties(mode), themeProperties("$mode.colors")),
                    "oled" to recolorSkin(source, themeProperties("night"), themeProperties("oled.colors"))
                )
                for ((id, text) in choices) {
                    val file = get("assets/morphe/themes/$id/${variant}skin_values.$mode.lua")
                    file.parentFile.mkdirs()
                    file.writeText(text)
                }
                // Editor mode has separate complete schemas. Keep its road-class colours,
                // changing only the background, land areas and label contrast for OLED.
                val editor = get("assets/res/skins/default/${variant}skin_values.editor.$mode.lua").readText()
                val editorPalette = mapOf(
                    "map_background" to "000000", "map_missing" to "000000",
                    "cities" to "000000", "stations" to "000000", "parking_lots" to "000000",
                    "labels" to "C4CCD7", "labels_strong" to "C4CCD7", "labels_bgcolor" to "000000",
                    "label_cities" to "C4CCD7", "label_station" to "C4CCD7",
                    "label_vegetation" to "82B891", "label_water" to "8AB4F8",
                    "ad_labels_color" to "C4CCD7", "ad_labels_outline_color" to "000000",
                    "parks" to "102820", "rivers" to "06121D", "lakes" to "06121D", "sea" to "06121D"
                )
                val areaGroups = setOf("Cities", "Stations", "ParkingLots", "Parks", "Rivers", "Lakes", "Sea")
                val editorColors = themeProperties("oled.colors").filterKeys {
                    it in setOf("General.map_background", "General.missing", "General.labels_bgcolor") ||
                        it.substringBefore('.') in areaGroups
                }
                val editorFile = get("assets/morphe/themes/oled/${variant}skin_values.editor.$mode.lua")
                editorFile.parentFile.mkdirs()
                editorFile.writeText(recolorSkin(editor, editorPalette, editorColors))
            }
        }
    }
}

@Suppress("unused")
val themeSelectorPatch = bytecodePatch(
    name = "Selectable map themes",
    description = "Add a Themes selector below Dark mode with separate original, Google Maps and OLED choices for light and dark mode.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.waze", name = "Waze", apkFileType = ApkFileType.XAPK,
        signatures = setOf("03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"),
        targets = TESTED_WAZE_VERSIONS.map { AppTarget(it) }
    ))
    dependsOn(selectableThemeAssets)
    extendWith("extensions/theme-selector.dex")
    execute {
        bindExtension("Llocal/wazemaps/themes/ThemeSelector;", context = true, rows = true)
        for (method in resourceHooks()) {
            val returns = method.implementation!!.instructions.mapIndexedNotNull { i, instruction ->
                i.takeIf { instruction.opcode == Opcode.RETURN_VOID }
            }
            if (returns.isEmpty()) throw PatchException("Resource preparation exit missing")
            returns.reversed().forEach {
                method.addInstructions(it, "invoke-static {}, $THEME_EXTENSION->prepare()V")
            }
        }
        val render = settingsRenderer()
        val exits = render.implementation!!.instructions.mapIndexedNotNull { i, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) i to (instruction as OneRegisterInstruction).registerA else null
        }
        if (exits.isEmpty()) throw PatchException("Settings renderer exit missing")
        exits.reversed().forEach { (i, register) ->
            render.addInstructions(i, """
                invoke-static/range {v$register .. v$register}, $THEME_EXTENSION->decorate(Landroid/view/View;)Landroid/view/View;
                move-result-object v$register
            """)
        }
    }
}
