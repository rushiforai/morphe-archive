package app.morphe.jadx

import app.morphe.jadx.eval.MorpheResolver
import app.morphe.jadx.ui.GuiPlugin
import jadx.api.plugins.JadxPlugin
import jadx.api.plugins.JadxPluginContext
import jadx.api.plugins.JadxPluginInfo
import jadx.api.plugins.JadxPluginInfoBuilder
import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.StandardCopyOption
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream
import kotlin.io.path.div
import kotlin.io.path.exists

class Plugin : JadxPlugin {
    private val options = PluginOptions()

    companion object {
        const val ID = "jadx-morphe"
    }

    override fun getPluginInfo(): JadxPluginInfo {
        return JadxPluginInfoBuilder.pluginId(ID)
            .name("JADX Morphe")
            .description("On-the-fly evaluation of Morphe Patcher's Fingerprint matching against decompiled Smali code.")
            .homepage("https://github.com/hoo-dles/jadx-morphe")
            .requiredJadxVersion("1.5.2, r2472")
            .build()
    }

    override fun init(context: JadxPluginContext) {
        val inputFile = context.args.inputFiles.firstOrNull()
        if (inputFile == null) {
            Log.info { "No file provided, skipping loading of jadx-morphe" }
            return
        }

        if (!inputFile.exists()) {
            Log.warn { "Input file does not exist, skipping loading of jadx-morphe" }
            return
        }

        val sourceApk = inputFile.let {
            if (it.extension == "apk")
                return@let it

            if (!listOf("apkm", "apks", "xapk").contains(it.extension) || !it.exists())
                return@let null

            val hash = hashFile(it)
            val cachePath = context.files().pluginCacheDir / "$hash.apk"
            if (cachePath.exists()) {
                Log.info { "Found cached base apk at: $cachePath" }
                return@let cachePath.toFile()
            }

            extractBaseApk(it, cachePath)
        }

        if (sourceApk == null) {
            Log.warn { "Invalid file format, skipping loading of jadx-morphe" }
            return
        }

        Log.info { "jadx-morphe plugin is enabled" }

        context.registerOptions(options)

        MorpheResolver.init(sourceApk, context.files().pluginTempDir.toFile())
        context.guiContext?.let {
            GuiPlugin().init(context, options)
        }
    }

    private fun extractBaseApk(bundleFile: File, cachePath: Path): File? {
        ZipFile(bundleFile).use { splitsZip ->
            // find first split that contains a .dex file
            val baseApkEntry = splitsZip.entries().asSequence().firstOrNull { splitApk ->
                if (splitApk.isDirectory || !splitApk.name.endsWith(".apk"))
                    return@firstOrNull false

                splitsZip.getInputStream(splitApk).use { rawStream ->
                    ZipInputStream(rawStream).use { innerZip ->
                        var innerEntry = innerZip.nextEntry
                        while (innerEntry != null) {
                            if (innerEntry.name.endsWith(".dex")) {
                                return@firstOrNull true
                            }
                            innerEntry = innerZip.nextEntry
                        }
                    }
                }
                false
            }

            if (baseApkEntry != null) {
                splitsZip.getInputStream(baseApkEntry).use { input ->
                    Files.copy(input, cachePath, StandardCopyOption.REPLACE_EXISTING)
                }
                Log.info { "Extracted base apk and cached at: $cachePath" }
                return cachePath.toFile()
            }

            return null
        }
    }
}