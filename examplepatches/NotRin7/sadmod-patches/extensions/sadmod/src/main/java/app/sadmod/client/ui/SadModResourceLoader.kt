package app.sadmod.client.ui

import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.res.AssetManager
import android.content.res.Configuration
import android.content.res.Resources
import java.io.File

/**
 * Loads SadMod's bundled Compose/Material3 resources (`0x7f...` IDs) from `assets/sadmod_res.apk`
 * when running patched inside a host package whose own `resources.arsc` has incompatible IDs.
 */
object SadModResourceLoader {

    @Volatile
    private var cachedResources: Resources? = null

    fun getIsolatedResources(context: Context): Resources? {
        if (context.packageName == STANDALONE_PACKAGE) return null
        cachedResources?.let { return it }

        val appCtx = context.applicationContext ?: return null
        if (context === appCtx) return null

        synchronized(this) {
            cachedResources?.let { return it }

            val targetApk = File(appCtx.codeCacheDir, RES_APK_NAME)
            val tmpApk = File(appCtx.codeCacheDir, "$RES_APK_NAME.tmp")

            val copied = runCatching {
                val expectedBytes = appCtx.assets.open("sadmod_res.apk").use { it.readBytes() }
                if (!targetApk.exists() || targetApk.length() != expectedBytes.size.toLong()) {
                    if (tmpApk.exists()) tmpApk.delete()
                    if (targetApk.exists()) {
                        targetApk.setWritable(true)
                        targetApk.delete()
                    }
                    tmpApk.writeBytes(expectedBytes)
                    tmpApk.setReadOnly()
                    if (!tmpApk.renameTo(targetApk)) {
                        tmpApk.copyTo(targetApk, overwrite = true)
                        tmpApk.delete()
                    }
                }
                targetApk.setReadOnly()
                true
            }.getOrDefault(false)

            if (!copied || !targetApk.exists()) return null

            val res = runCatching {
                val appInfo = ApplicationInfo().apply {
                    packageName = appCtx.packageName
                    sourceDir = targetApk.absolutePath
                    publicSourceDir = targetApk.absolutePath
                }
                appCtx.packageManager.getResourcesForApplication(appInfo)
            }.getOrNull() ?: return null

            cachedResources = res
            val hostRes = appCtx.resources
            @Suppress("DEPRECATION")
            res.updateConfiguration(hostRes.configuration, hostRes.displayMetrics)
            return res
        }
    }

    fun getIsolatedAssets(context: Context): AssetManager? {
        return getIsolatedResources(context)?.assets
    }

    fun syncConfiguration(context: Context, newConfig: Configuration) {
        val res = cachedResources ?: return
        val appCtx = context.applicationContext ?: return
        @Suppress("DEPRECATION")
        res.updateConfiguration(newConfig, appCtx.resources.displayMetrics)
    }

    private const val STANDALONE_PACKAGE = "app.sadmod.client"
    private const val RES_APK_NAME = "sadmod_res_v1.apk"
}
