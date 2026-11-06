/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.extension

import android.content.Context
import android.content.SharedPreferences
import androidx.compose.runtime.mutableIntStateOf

/**
 * The settings of the glass, as the app uses them.
 *
 * The options chosen in Morphe are the defaults (LiquidGlassPatch's getters, whose bodies the
 * patch replaces). The settings sheet, opened with a long press on the tab bar, stores changes on
 * top of them in the app's own preferences; "Reset" goes back to the Morphe options.
 */
object LiquidSettings {

    private const val FILE = "liquidmusic"

    private var preferences: SharedPreferences? = null

    /** Changes with every setting, so that drawings depending on the settings are redone. */
    private val revisionState = mutableIntStateOf(0)

    @JvmStatic
    val revision: Int get() = revisionState.intValue

    private val listener = SharedPreferences.OnSharedPreferenceChangeListener { _, _ ->
        revisionState.intValue++
    }

    @JvmStatic
    fun init(context: Context) {
        if (preferences != null) return
        preferences = context.applicationContext.getSharedPreferences(FILE, Context.MODE_PRIVATE).also {
            it.registerOnSharedPreferenceChangeListener(listener)
        }
    }

    private fun int(key: String, default: Int) = preferences?.getInt(key, default) ?: default
    private fun boolean(key: String, default: Boolean) = preferences?.getBoolean(key, default) ?: default

    @JvmStatic fun blurRadiusDp() = int("blurRadius", LiquidGlassPatch.blurRadiusDp())
    @JvmStatic fun refractionHeightDp() = int("refractionHeight", LiquidGlassPatch.refractionHeightDp())
    @JvmStatic fun refractionAmountDp() = int("refractionAmount", LiquidGlassPatch.refractionAmountDp())
    @JvmStatic fun saturationPercent() = int("saturation", LiquidGlassPatch.saturationPercent())
    @JvmStatic fun tintOpacityPercent() = int("tintOpacity", LiquidGlassPatch.tintOpacityPercent())
    @JvmStatic fun highlightPercent() = int("highlight", LiquidGlassPatch.highlightPercent())
    @JvmStatic fun chromaticAberration() = boolean("chromaticAberration", LiquidGlassPatch.chromaticAberration())
    @JvmStatic fun applyToSearchBar() = boolean("applyToSearchBar", LiquidGlassPatch.applyToSearchBar())
    @JvmStatic fun applyToSidebar() = boolean("applyToSidebar", LiquidGlassPatch.applyToSidebar())
    @JvmStatic fun liquidTabBar() = boolean("liquidTabBar", LiquidGlassPatch.liquidTabBar())
    @JvmStatic fun tabLabels() = boolean("tabLabels", LiquidGlassPatch.tabLabels())
    @JvmStatic fun hideNewTab() = boolean("hideNewTab", LiquidGlassPatch.hideNewTab())
    @JvmStatic fun hideRadioTab() = boolean("hideRadioTab", LiquidGlassPatch.hideRadioTab())
    @JvmStatic fun tabHaptics() = boolean("tabHaptics", LiquidGlassPatch.tabHaptics())
    @JvmStatic fun startTab(): String =
        preferences?.getString("startTab", null) ?: LiquidGlassPatch.startTab()

    fun set(key: String, value: Int) {
        preferences?.edit()?.putInt(key, value)?.apply()
    }

    fun set(key: String, value: Boolean) {
        preferences?.edit()?.putBoolean(key, value)?.apply()
    }

    fun set(key: String, value: String) {
        preferences?.edit()?.putString(key, value)?.apply()
    }

    /** Back to the options chosen in Morphe. */
    fun reset() {
        preferences?.edit()?.clear()?.apply()
    }
}
