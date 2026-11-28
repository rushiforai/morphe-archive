package org.ungoogled.patches.waze

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

/** Anchor for getResourceAsStream: the patches file's class loader finds waze/ through any of its classes. */
private object WazeFilesResource

private fun wazeFile(path: String): ByteArray =
    WazeFilesResource::class.java.getResourceAsStream("/waze/$path")?.use { it.readBytes() }
        ?: throw PatchException("waze/$path is missing from the patches file")

/**
 * The Mod's assets (fonts, speed signs, UI icons, map skins, language packs, ...) and its native library, copied
 * into the app. waze/assets/index.txt lists the assets, made by tools/waze_assets_gen.py; the files of Waze's own
 * skins it names replace the stock ones of the same path.
 */
internal val wazeAssetsPatch = resourcePatch(
    description = "Adds the Waze Mod's assets and native library.",
) {
    execute {
        val index = String(wazeFile("assets/index.txt"), Charsets.UTF_8).lines().filter { it.isNotBlank() }
        for (path in index) {
            get("assets/$path", copy = false).apply { parentFile.mkdirs() }.writeBytes(wazeFile("assets/$path"))
        }

        // Resources (report menu icons, sign icons and the labels in English, Vietnamese, Japanese and Portuguese);
        // the app finds them by name. waze/res/index.txt lists them, made by tools/waze_res_gen.py. A values file adds
        // its strings to the ones of the app.
        val resources = String(wazeFile("res/index.txt"), Charsets.UTF_8).lines().filter { it.isNotBlank() }
        for (path in resources) {
            get("res/$path", copy = false).apply { parentFile.mkdirs() }.writeBytes(wazeFile("res/$path"))
        }

        // The Settings page shows these; there is no build server behind them, so a plain label.
        val info = mapOf(
            "wz_mod_version.txt" to "Waze Mod for Morphe",
            "wz_build_channel.txt" to "morphe",
            "wz_build_commit.txt" to "-",
            "wz_build_time.txt" to "-",
            "wz_ota_build_id.txt" to "0",
        )
        for ((name, text) in info) {
            get("assets/$name", copy = false).apply { parentFile.mkdirs() }.writeText(text)
        }

        // A library a patch adds is stored compressed, which a device can only load once it is extracted at install:
        // without this the system refuses the app ("Failed to extract native libraries").
        document("AndroidManifest.xml").use { manifest ->
            (manifest.getElementsByTagName("application").item(0) as org.w3c.dom.Element)
                .setAttribute("android:extractNativeLibs", "true")
        }

        // Segment, traffic light and Android Auto overlay bridge; Waze 5.27.90.900 on arm64 only.
        get("lib/arm64-v8a/libwazegw.so", copy = false).apply { parentFile.mkdirs() }
            .writeBytes(wazeFile("lib/arm64-v8a/libwazegw.so"))
    }
}
