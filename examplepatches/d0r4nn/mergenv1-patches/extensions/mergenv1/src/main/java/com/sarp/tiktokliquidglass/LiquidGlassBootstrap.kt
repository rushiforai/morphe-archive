package com.sarp.tiktokliquidglass

import android.app.Activity
import android.app.Application
import android.os.Bundle
import android.util.Log
import java.util.concurrent.atomic.AtomicBoolean

/**
 * Direct DEX entrypoint invoked from AwemeHostApplication.onCreate() without LSPatch/Xposed.
 */
object LiquidGlassBootstrap {

    private const val TAG = "TikTokLiquidGlass"
    private val initialized = AtomicBoolean(false)

    @JvmStatic
    fun init(app: Application) {
        if (!initialized.compareAndSet(false, true)) return
        val proc = Application.getProcessName()
        Log.i(TAG, "MergenV1 LiquidGlassBootstrap initialized (direct DEX mode, process=$proc)")

        MergenPrefs.addListener {
            LiquidGlassController.refreshAllTrackedActivities()
        }
        MergenCoreAuth.restoreSessionAsync(app)

        app.registerActivityLifecycleCallbacks(object : Application.ActivityLifecycleCallbacks {
            override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {}
            override fun onActivityStarted(activity: Activity) {}

            override fun onActivityResumed(activity: Activity) {
                LiquidGlassController.registerActivity(activity)
                LiquidGlassController.attachFocusListenerOnce(activity)
                LiquidGlassController.schedulePatch(activity)
            }

            override fun onActivityPaused(activity: Activity) {}
            override fun onActivityStopped(activity: Activity) {}
            override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {}

            override fun onActivityDestroyed(activity: Activity) {
                LiquidGlassController.unregisterActivity(activity)
            }
        })
    }
}
