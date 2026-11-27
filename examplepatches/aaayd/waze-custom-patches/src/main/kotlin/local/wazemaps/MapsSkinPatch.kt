package local.wazemaps

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.rawResourcePatch
import java.util.Properties
import java.nio.ByteBuffer
import java.nio.ByteOrder

private object ThemeResources

private fun palette(mode: String): Map<String, String> {
    val values = Properties()
    val stream = ThemeResources::class.java.getResourceAsStream("/themes/$mode.properties")
        ?: throw PatchException("Missing $mode theme")
    stream.use(values::load)
    return values.stringPropertyNames().associateWith(values::getProperty)
}

@Suppress("unused")
val mapsSkinPatch = rawResourcePatch(
    name = "Google Maps-style map skin",
    description = "Sampled Google Maps day/night map colours with explicit road, water, park, label and route colours that bypass Waze's colour transforms. Includes experimental skins.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.waze",
        name = "Waze",
        apkFileType = ApkFileType.XAPK,
        signatures = setOf("03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"),
        targets = listOf(AppTarget("5.24.5.0"))
    ))
    execute {
        // Validate every file before writing any of them.
        // Raw-resource mode keeps the compiled manifest beside its decoded path.
        val manifest = get("AndroidManifest.xml").resolveSibling("AndroidManifest.xml.bin")
        val refreshedManifest = refreshSkinVersion(manifest.readBytes())
        val replacements = listOf("", "experiment/").flatMap { variant ->
            listOf("day", "night").map { mode ->
                val path = "assets/res/skins/default/${variant}skin_values.$mode.lua"
                val file = get(path)
                if (!file.isFile) throw PatchException("Required Waze skin missing: $path")
                file to recolorSkin(file.readText(), palette(mode), palette("$mode.colors"))
            }
        }
        replacements.forEach { (file, content) -> file.writeText(content) }
        // Patcher 1.15 does not copy the raw .bin manifest into its output archive.
        // Stage the compiled replacement with the other APK-root resources instead.
        get("assets").resolveSibling("AndroidManifest.xml").writeBytes(refreshedManifest)
    }
}
