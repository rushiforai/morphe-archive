package app.morphe.jadx

import app.morphe.jadx.ui.GuiPlugin
import app.morphe.jadx.eval.MorpheResolver
import jadx.api.plugins.JadxPlugin
import jadx.api.plugins.JadxPluginContext
import jadx.api.plugins.JadxPluginInfo
import jadx.api.plugins.JadxPluginInfoBuilder

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
        val sourceApk = context.args.inputFiles.firstOrNull()
        if (sourceApk == null || !sourceApk.exists() || sourceApk.extension != "apk") {
            Log.error { "No APK file found, aborting..." }
            return
        }
        Log.info { "jadx-morphe plugin is enabled" }

        context.registerOptions(options)

        MorpheResolver.init(sourceApk, context.files().pluginTempDir.toFile())
        context.guiContext?.let {
            GuiPlugin().init(context, options)
        }
    }
}