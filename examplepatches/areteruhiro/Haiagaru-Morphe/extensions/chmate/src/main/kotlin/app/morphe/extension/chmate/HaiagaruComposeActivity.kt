package app.morphe.extension.chmate

import android.content.res.AssetManager
import android.content.res.Resources
import android.content.res.Configuration
import android.os.Build
import android.os.Bundle
import android.os.ParcelFileDescriptor
import androidx.activity.ComponentActivity
import java.io.File

/** Private, separately numbered UI resources avoid replacing ChMate's resource table. */
open class HaiagaruComposeActivity : ComponentActivity() {
    private var uiResources: Resources? = null
    override fun getResources(): Resources = uiResources ?: super.getResources()

    override fun onCreate(savedInstanceState: Bundle?) {
        uiResources = resourcesFor(this)
        super.onCreate(savedInstanceState)
    }
    @Suppress("DEPRECATION")
    override fun onConfigurationChanged(newConfig: Configuration) {
        // Our separate resource table must follow rotation too; retaining the launch
        // configuration left the video viewer believing it was still in portrait.
        uiResources?.updateConfiguration(newConfig, super.getResources().displayMetrics)
        super.onConfigurationChanged(newConfig)
    }

    companion object {
        internal fun resourcesFor(context: android.content.Context): Resources {
        val base = context.resources
        val resourceFile = File(context.codeCacheDir, "haiagaru-ui-${context.packageManager.getPackageInfo(context.packageName, 0).lastUpdateTime}.apk")
        if (!resourceFile.isFile) {
            val temporary = File(resourceFile.path + ".tmp")
            context.assets.open("haiagaru-ui-res.apk").use { input -> temporary.outputStream().use(input::copyTo) }
            check(temporary.renameTo(resourceFile)) { "Unable to install UI resources" }
        }
        return if (Build.VERSION.SDK_INT >= 30) {
            Resources(base.assets, base.displayMetrics, base.configuration).apply {
                val loader = android.content.res.loader.ResourcesLoader()
                ParcelFileDescriptor.open(resourceFile, ParcelFileDescriptor.MODE_READ_ONLY).use {
                    loader.addProvider(android.content.res.loader.ResourcesProvider.loadFromApk(it))
                }
                addLoaders(loader)
            }
        } else {
            if (Build.VERSION.SDK_INT >= 28) org.lsposed.hiddenapibypass.HiddenApiBypass.addHiddenApiExemptions(
                "Landroid/content/res/AssetManager;")
            @Suppress("DEPRECATION")
            val manager = AssetManager::class.java.getDeclaredConstructor().newInstance()
            val add = AssetManager::class.java.getMethod("addAssetPath", String::class.java)
            add.invoke(manager, context.applicationInfo.sourceDir)
            context.applicationInfo.splitSourceDirs?.forEach { add.invoke(manager, it) }
            check((add.invoke(manager, resourceFile.path) as Int) != 0)
            Resources(manager, base.displayMetrics, base.configuration)
        }
        }
        internal fun dialogContext(activity: android.app.Activity): android.content.Context {
            if (activity is HaiagaruComposeActivity) return activity
            val resources = resourcesFor(activity)
            return object : android.view.ContextThemeWrapper(activity, android.R.style.Theme_Material_Light_NoActionBar) {
                override fun getResources(): Resources = resources
                override fun getAssets(): AssetManager = resources.assets
            }
        }
    }
}
