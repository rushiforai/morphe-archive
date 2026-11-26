package com.sarp.tiktokliquidglass

import android.content.Context
import android.content.SharedPreferences
import android.os.Handler
import android.os.Looper
import java.util.concurrent.CopyOnWriteArrayList

/**
 * Centralized SharedPreferences configuration store for MergenV1.
 * All toggles default cleanly and enforce Seçenek B via [isModEffectivelyActive].
 */
object MergenPrefs {

    private const val PREFS_NAME = "mergenv1_prefs"

    // Live Faz 0 keys
    const val KEY_MASTER_ENABLED = "master_enabled"
    const val KEY_LIQUID_GLASS_BAR = "liquid_glass_bar"
    const val KEY_EDGE_TO_EDGE_VIDEO = "edge_to_edge_video"
    const val KEY_LIFT_CAPTIONS = "lift_captions"
    const val KEY_HAPTICS_ENABLED = "haptics_enabled"

    // Reserved Faz 1-3 keys
    const val KEY_MORPHING_BAR = "morphing_bar"
    const val KEY_DYNAMIC_PILL = "dynamic_pill"
    const val KEY_DYNAMIC_PILL_X = "dynamic_pill_x"
    const val KEY_DYNAMIC_PILL_Y = "dynamic_pill_y"
    const val KEY_PEEK_SHEETS = "peek_sheets"
    const val KEY_PROFILE_PEEK = "profile_peek"
    const val KEY_EDGE_CONTROL_PANEL = "edge_control_panel"
    const val KEY_UI_STYLE = "ui_style"
    const val KEY_CAMERA_CALIBRATED = "camera_calibrated"
    const val KEY_CAMERA_X_FRAC = "camera_x_frac"
    const val KEY_CAMERA_Y_DP = "camera_y_dp"
    const val KEY_CAMERA_SIZE_DP = "camera_size_dp"
    const val KEY_GESTURE_SENSITIVITY = "gesture_sensitivity"
    const val KEY_GLASS_LENS_EFFECT = "glass_lens_effect"
    const val KEY_NUDGE_REMINDER = "nudge_reminder"
    const val KEY_RADIAL_MENU = "radial_menu"
    const val KEY_KINETIC_SEEKBAR = "kinetic_seekbar"
    const val KEY_CIRCULAR_PROGRESS = "circular_progress"
    const val KEY_AUTO_SCROLL = "auto_scroll"
    const val KEY_TRANSITION_STYLE = "transition_style"
    const val KEY_DANMAKU = "danmaku"
    const val KEY_DANMAKU_DENSITY = "danmaku_density"
    const val KEY_ANIMATION_PROFILE = "animation_profile"
    const val KEY_WELCOME_SEEN = "welcome_seen"
    const val KEY_LANGUAGE_OVERRIDE = "language_override"

    private val mainHandler = Handler(Looper.getMainLooper())
    private val listeners = CopyOnWriteArrayList<() -> Unit>()

    private fun prefs(context: Context): SharedPreferences =
        context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    fun isMasterEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_MASTER_ENABLED, true)

    fun setMasterEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_MASTER_ENABLED, value).apply()
        notifyChanged()
    }

    fun isLiquidGlassBarEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_LIQUID_GLASS_BAR, true)

    fun setLiquidGlassBarEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_LIQUID_GLASS_BAR, value).apply()
        notifyChanged()
    }

    fun isEdgeToEdgeVideoEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_EDGE_TO_EDGE_VIDEO, true)

    fun setEdgeToEdgeVideoEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_EDGE_TO_EDGE_VIDEO, value).apply()
        notifyChanged()
    }

    fun isLiftFeedCaptionsEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_LIFT_CAPTIONS, true)

    fun setLiftFeedCaptionsEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_LIFT_CAPTIONS, value).apply()
        notifyChanged()
    }

    fun isHapticsEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_HAPTICS_ENABLED, true)

    fun setHapticsEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_HAPTICS_ENABLED, value).apply()
        notifyChanged()
    }

    // Faz 1: Katmanlı Cam Arayüz
    fun isMorphingBarEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_MORPHING_BAR, true)

    fun setMorphingBarEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_MORPHING_BAR, value).apply()
        notifyChanged()
    }

    fun isDynamicPillEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_DYNAMIC_PILL, true)

    fun setDynamicPillEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_DYNAMIC_PILL, value).apply()
        notifyChanged()
    }

    fun getDynamicPillOffsetX(context: Context): Float =
        prefs(context).getFloat(KEY_DYNAMIC_PILL_X, 0f)

    fun setDynamicPillOffsetX(context: Context, value: Float) {
        prefs(context).edit().putFloat(KEY_DYNAMIC_PILL_X, value).apply()
        notifyChanged()
    }

    fun getDynamicPillOffsetY(context: Context): Float =
        prefs(context).getFloat(KEY_DYNAMIC_PILL_Y, 0f)

    fun setDynamicPillOffsetY(context: Context, value: Float) {
        prefs(context).edit().putFloat(KEY_DYNAMIC_PILL_Y, value).apply()
        notifyChanged()
    }

    fun setDynamicPillOffsets(context: Context, offsetX: Float, offsetY: Float) {
        prefs(context).edit()
            .putFloat(KEY_DYNAMIC_PILL_X, offsetX)
            .putFloat(KEY_DYNAMIC_PILL_Y, offsetY)
            .apply()
        notifyChanged()
    }

    fun isPeekSheetsEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_PEEK_SHEETS, true)

    fun setPeekSheetsEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_PEEK_SHEETS, value).apply()
        notifyChanged()
    }

    fun isProfilePeekEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_PROFILE_PEEK, true)

    fun setProfilePeekEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_PROFILE_PEEK, value).apply()
        notifyChanged()
    }

    fun isEdgeControlPanelEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_EDGE_CONTROL_PANEL, true)

    fun setEdgeControlPanelEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_EDGE_CONTROL_PANEL, value).apply()
        notifyChanged()
    }

    fun isAutoScrollEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_AUTO_SCROLL, false)

    fun setAutoScrollEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_AUTO_SCROLL, value).apply()
        notifyChanged()
    }

    fun isKyant0Style(context: Context): Boolean =
        prefs(context).getString(KEY_UI_STYLE, "mergen") == "kyant0"

    fun setKyant0Style(context: Context, kyant0: Boolean) {
        prefs(context).edit().putString(KEY_UI_STYLE, if (kyant0) "kyant0" else "mergen").apply()
        notifyChanged()
    }

    fun isCameraCalibrated(context: Context): Boolean =
        prefs(context).getBoolean(KEY_CAMERA_CALIBRATED, false)

    fun setCameraCalibrated(context: Context, calibrated: Boolean) {
        prefs(context).edit().putBoolean(KEY_CAMERA_CALIBRATED, calibrated).apply()
    }

    fun getCameraXFraction(context: Context): Float =
        prefs(context).getFloat(KEY_CAMERA_X_FRAC, 0.5f).coerceIn(0.06f, 0.94f)

    fun getCameraYDp(context: Context): Float =
        prefs(context).getFloat(KEY_CAMERA_Y_DP, 12f).coerceIn(0f, 90f)

    fun getCameraSizeDp(context: Context): Float =
        prefs(context).getFloat(KEY_CAMERA_SIZE_DP, 24f).coerceIn(14f, 44f)

    fun setCameraGeometry(context: Context, xFrac: Float, yDp: Float, sizeDp: Float) {
        prefs(context).edit()
            .putBoolean(KEY_CAMERA_CALIBRATED, true)
            .putFloat(KEY_CAMERA_X_FRAC, xFrac.coerceIn(0.06f, 0.94f))
            .putFloat(KEY_CAMERA_Y_DP, yDp.coerceIn(0f, 90f))
            .putFloat(KEY_CAMERA_SIZE_DP, sizeDp.coerceIn(14f, 44f))
            .apply()
        notifyChanged()
    }

    /** 0 = Düşük, 1 = Orta, 2 = Yüksek */
    fun getGestureSensitivity(context: Context): Int =
        prefs(context).getInt(KEY_GESTURE_SENSITIVITY, 1).coerceIn(0, 2)

    fun setGestureSensitivity(context: Context, level: Int) {
        prefs(context).edit().putInt(KEY_GESTURE_SENSITIVITY, level.coerceIn(0, 2)).apply()
        notifyChanged()
    }

    fun getGestureThresholdScale(context: Context): Float = when (getGestureSensitivity(context)) {
        0 -> 1.30f
        2 -> 0.72f
        else -> 1.0f
    }

    fun isGlassLensEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_GLASS_LENS_EFFECT, true)

    fun setGlassLensEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_GLASS_LENS_EFFECT, value).apply()
        notifyChanged()
    }

    fun isNudgeReminderEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_NUDGE_REMINDER, true)

    fun setNudgeReminderEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_NUDGE_REMINDER, value).apply()
        notifyChanged()
    }

    // Faz 2 (Birleşik Final): Kinetik Etkileşim & Medya Deneyimi
    fun isRadialMenuEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_RADIAL_MENU, true)

    fun setRadialMenuEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_RADIAL_MENU, value).apply()
        notifyChanged()
    }

    fun isKineticSeekbarEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_KINETIC_SEEKBAR, true)

    fun setKineticSeekbarEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_KINETIC_SEEKBAR, value).apply()
        notifyChanged()
    }

    fun isCircularProgressEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_CIRCULAR_PROGRESS, true)

    fun setCircularProgressEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_CIRCULAR_PROGRESS, value).apply()
        notifyChanged()
    }

    fun getTransitionStyle(context: Context): String {
        val v = prefs(context).getString(KEY_TRANSITION_STYLE, "depth") ?: "depth"
        return when (v) {
            "none", "depth", "stack", "cinematic" -> v
            else -> "depth"
        }
    }

    fun setTransitionStyle(context: Context, style: String) {
        val clean = when (style) {
            "none", "depth", "stack", "cinematic" -> style
            else -> "depth"
        }
        prefs(context).edit().putString(KEY_TRANSITION_STYLE, clean).apply()
        notifyChanged()
    }

    fun isDanmakuEnabled(context: Context): Boolean =
        prefs(context).getBoolean(KEY_DANMAKU, false)

    fun setDanmakuEnabled(context: Context, value: Boolean) {
        prefs(context).edit().putBoolean(KEY_DANMAKU, value).apply()
        notifyChanged()
    }

    /** 0 = Az, 1 = Orta, 2 = Yoğun */
    fun getDanmakuDensity(context: Context): Int =
        prefs(context).getInt(KEY_DANMAKU_DENSITY, 1).coerceIn(0, 2)

    fun setDanmakuDensity(context: Context, level: Int) {
        prefs(context).edit().putInt(KEY_DANMAKU_DENSITY, level.coerceIn(0, 2)).apply()
        notifyChanged()
    }

    /** 0 = Akıcı (Fluid), 1 = Keskin (Snappy), 2 = Azaltılmış (Reduced) */
    fun getAnimationProfile(context: Context): Int =
        prefs(context).getInt(KEY_ANIMATION_PROFILE, 0).coerceIn(0, 2)

    fun setAnimationProfile(context: Context, profile: Int) {
        prefs(context).edit().putInt(KEY_ANIMATION_PROFILE, profile.coerceIn(0, 2)).apply()
        notifyChanged()
    }

    fun hasSeenWelcome(context: Context): Boolean =
        prefs(context).getBoolean(KEY_WELCOME_SEEN, false)

    fun setWelcomeSeen(context: Context, seen: Boolean) {
        prefs(context).edit().putBoolean(KEY_WELCOME_SEEN, seen).apply()
    }

    /** 0 = Auto (EN default / TR in Turkey), 1 = English, 2 = Turkish */
    fun getLanguageOverride(context: Context): Int =
        prefs(context).getInt(KEY_LANGUAGE_OVERRIDE, 0).coerceIn(0, 2)

    fun setLanguageOverride(context: Context, mode: Int) {
        prefs(context).edit().putInt(KEY_LANGUAGE_OVERRIDE, mode.coerceIn(0, 2)).apply()
        notifyChanged()
    }

    fun getBoolean(context: Context, key: String, default: Boolean = false): Boolean =
        prefs(context).getBoolean(key, default)

    fun getFloat(context: Context, key: String, default: Float = 0f): Float =
        prefs(context).getFloat(key, default)

    fun getString(context: Context, key: String, default: String = "none"): String =
        prefs(context).getString(key, default) ?: default

    /**
     * Master gate: MergenV1 works immediately without requiring MergenCore authentication.
     */
    fun isModEffectivelyActive(context: Context): Boolean = isMasterEnabled(context)

    fun addListener(listener: () -> Unit) {
        listeners.addIfAbsent(listener)
    }

    fun removeListener(listener: () -> Unit) {
        listeners.remove(listener)
    }

    fun notifyChanged() {
        val dispatch = Runnable {
            for (listener in listeners) {
                try {
                    listener()
                } catch (_: Throwable) {
                }
            }
        }
        if (Looper.myLooper() == Looper.getMainLooper()) {
            dispatch.run()
        } else {
            mainHandler.post(dispatch)
        }
    }
}
