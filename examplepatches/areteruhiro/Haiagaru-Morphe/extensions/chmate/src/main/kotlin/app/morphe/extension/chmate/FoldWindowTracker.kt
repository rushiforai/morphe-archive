package app.morphe.extension.chmate

import android.app.Activity
import android.os.Build
import android.util.Log
import androidx.window.layout.FoldingFeature
import androidx.window.layout.WindowInfoTracker
import java.util.WeakHashMap
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.collect

/** Observe OEM folding features without changing the host Activity's base class. Main thread only. */
internal object FoldWindowTracker {
    private class Session(val scope: CoroutineScope, var tablet: Boolean? = null)
    private val sessions = WeakHashMap<Activity, Session>()
    private const val PREFS = "haiagaru_fold_detection"
    private const val DEVICE = "verifiedFoldingDevice"
    private fun deviceKey() = "${Build.MANUFACTURER}/${Build.DEVICE}/${Build.MODEL}/${Build.FINGERPRINT}"

    @JvmStatic fun start(activity: Activity, changed: Runnable) {
        if (sessions.containsKey(activity) || activity.isDestroyed) return
        val scope = CoroutineScope(SupervisorJob() + Dispatchers.Main.immediate)
        val session = Session(scope)
        sessions[activity] = session
        scope.launch {
            try {
                WindowInfoTracker.getOrCreate(activity).windowLayoutInfo(activity).collect { info ->
                    val folding = info.displayFeatures.any { it is FoldingFeature }
                    val prefs = activity.getSharedPreferences(PREFS, 0)
                    if (folding) prefs.edit().putString(DEVICE, deviceKey()).apply()
                    val verified = prefs.getString(DEVICE, "") == deviceKey()
                    val multiWindow = Build.VERSION.SDK_INT >= 24 && activity.isInMultiWindowMode
                    val next = FoldPosturePolicy.tablet(folding, verified, multiWindow)
                    session.tablet = next
                    changed.run()
                }
            } catch (cancelled: CancellationException) {
                throw cancelled
            } catch (error: Exception) {
                // Missing/unsupported OEM Window Extensions must leave native manual mode untouched.
                session.tablet = null
                Log.w("HaiagaruFold", "Folding information unavailable; keeping manual layout", error)
                changed.run()
            }
        }
    }
    @JvmStatic fun tablet(activity: Activity): Boolean? = sessions[activity]?.tablet
    @JvmStatic fun stop(activity: Activity) { sessions.remove(activity)?.scope?.cancel() }
    @JvmStatic fun stopAll() { sessions.values.toList().forEach { it.scope.cancel() }; sessions.clear() }
}
