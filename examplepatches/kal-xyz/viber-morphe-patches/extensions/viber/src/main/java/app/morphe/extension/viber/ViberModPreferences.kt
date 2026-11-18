package app.morphe.extension.viber

import android.content.Context
import android.content.SharedPreferences

/**
 * Manages preferences and toggle states for Morphe Viber mod features.
 */
object ViberModPreferences {
    private const val PREFS_NAME = "morphe_viber_preferences"

    const val KEY_BLOCK_ADS = "viber_mod_block_ads"
    const val KEY_GHOST_READ_RECEIPTS = "viber_mod_ghost_read_receipts"
    const val KEY_GHOST_TYPING_INDICATOR = "viber_mod_ghost_typing"
    const val KEY_GHOST_ONLINE_STATUS = "viber_mod_ghost_online"
    const val KEY_ANTI_DELETE_MESSAGES = "viber_mod_anti_delete"
    const val KEY_CLEAN_UI_EXPLORE = "viber_mod_clean_ui_explore"
    const val KEY_SECONDARY_DEVICE_MODE = "viber_mod_secondary_device_mode"
    const val KEY_FORCE_PHONE_LAYOUT = "viber_mod_force_phone_layout"

    private var sharedPreferences: SharedPreferences? = null

    @JvmStatic
    fun init(context: Context) {
        if (sharedPreferences == null) {
            sharedPreferences = context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        }
    }

    private fun getPrefs(): SharedPreferences? = sharedPreferences

    @JvmStatic
    fun isAdBlockEnabled(): Boolean {
        return getPrefs()?.getBoolean(KEY_BLOCK_ADS, true) ?: true
    }

    @JvmStatic
    fun isGhostReadReceiptsEnabled(): Boolean {
        return getPrefs()?.getBoolean(KEY_GHOST_READ_RECEIPTS, true) ?: true
    }

    @JvmStatic
    fun isGhostTypingIndicatorEnabled(): Boolean {
        return getPrefs()?.getBoolean(KEY_GHOST_TYPING_INDICATOR, true) ?: true
    }

    @JvmStatic
    fun isGhostOnlineStatusEnabled(): Boolean {
        return getPrefs()?.getBoolean(KEY_GHOST_ONLINE_STATUS, false) ?: false
    }

    @JvmStatic
    fun isAntiDeleteEnabled(): Boolean {
        return getPrefs()?.getBoolean(KEY_ANTI_DELETE_MESSAGES, true) ?: true
    }

    @JvmStatic
    fun isCleanUiEnabled(): Boolean {
        return getPrefs()?.getBoolean(KEY_CLEAN_UI_EXPLORE, true) ?: true
    }

    @JvmStatic
    fun isSecondaryDeviceModeEnabled(): Boolean {
        return getPrefs()?.getBoolean(KEY_SECONDARY_DEVICE_MODE, true) ?: true
    }

    @JvmStatic
    fun isForcePhoneLayoutEnabled(): Boolean {
        return getPrefs()?.getBoolean(KEY_FORCE_PHONE_LAYOUT, true) ?: true
    }
}
