package dev.materialtidal.settings

import java.io.File
import java.net.URLClassLoader

fun main(args: Array<String>) {
    require(args.isNotEmpty()) { "Usage: VerifyPatchSettingsKt <extensionsTidalClassesDir>" }
    val classesDir = File(args[0])
    require(classesDir.isDirectory) { "Missing compiled extension classes dir: $classesDir" }

    val loader = URLClassLoader(arrayOf(classesDir.toURI().toURL()), object {}.javaClass.classLoader)

    testConfigDefaultsAndRuntimeOverrides(loader)
    testTrackSwipeAndLinnOverrides(loader)
    testResetAndClearAndModifiedCount(loader)

    println("ALL PATCH SETTINGS UNIT TESTS PASSED.")
}

private fun testConfigDefaultsAndRuntimeOverrides(loader: ClassLoader) {
    val prefsCls = loader.loadClass("dev.materialtidal.extension.tidal.settings.PatchSettingsPrefs")
    val cfgCls = loader.loadClass("dev.materialtidal.extension.tidal.theme.MaterialYouConfig")

    val resetAll = prefsCls.getMethod("resetAll")
    resetAll.invoke(null)

    val setBool = prefsCls.getMethod("setBoolean", Int::class.javaPrimitiveType, Boolean::class.javaPrimitiveType)
    val setInt = prefsCls.getMethod("setInt", Int::class.javaPrimitiveType, Int::class.javaPrimitiveType)
    val clearOpt = prefsCls.getMethod("clearOption", Int::class.javaPrimitiveType)

    // Defaults on unpatched MaterialYouConfig
    check(!(cfgCls.getMethod("isPatchSettingsInstalled").invoke(null) as Boolean))
    check(!(cfgCls.getMethod("isAmoledPureBlack").invoke(null) as Boolean))
    check((cfgCls.getMethod("getMonetPaletteStyle").invoke(null) as Int) == 0)
    check((cfgCls.getMethod("getThemeMode").invoke(null) as Int) == 0)
    check((cfgCls.getMethod("getPlayerColorStyle").invoke(null) as Int) == 0)
    check((cfgCls.getMethod("getHomeCoverCornerRadiusInt").invoke(null) as Int) == 20)
    check((cfgCls.getMethod("getHomeShortcutCornerRadiusInt").invoke(null) as Int) == 20)
    check(!(cfgCls.getMethod("isPlayerWaveformSeekbarEnabled").invoke(null) as Boolean))
    check(!(cfgCls.getMethod("isSyllableLyricsEnabled").invoke(null) as Boolean))

    // Override AMOLED & Theme Mode & Monet Style
    val optAmoled = prefsCls.getField("OPT_AMOLED_PURE_BLACK").getInt(null)
    val optThemeMode = prefsCls.getField("OPT_THEME_MODE").getInt(null)
    val optMonet = prefsCls.getField("OPT_MONET_PALETTE_STYLE").getInt(null)
    val optHomeRadius = prefsCls.getField("OPT_HOME_COVER_RADIUS_DP").getInt(null)

    setBool.invoke(null, optAmoled, true)
    setInt.invoke(null, optThemeMode, 2)
    setInt.invoke(null, optMonet, 1)
    setInt.invoke(null, optHomeRadius, 14)

    check(cfgCls.getMethod("isAmoledPureBlack").invoke(null) as Boolean) { "AMOLED override not reflected" }
    check((cfgCls.getMethod("getThemeMode").invoke(null) as Int) == 2) { "Theme mode override not reflected" }
    check((cfgCls.getMethod("getMonetPaletteStyle").invoke(null) as Int) == 1) { "Monet style override not reflected" }
    check((cfgCls.getMethod("getHomeCoverCornerRadiusInt").invoke(null) as Int) == 14) { "Home cover radius override not reflected" }
    check((cfgCls.getMethod("getHomeShortcutCornerRadiusInt").invoke(null) as Int) == 14) { "Home shortcut radius override not reflected" }

    // Clear individual option
    clearOpt.invoke(null, optAmoled)
    check(!(cfgCls.getMethod("isAmoledPureBlack").invoke(null) as Boolean)) { "Cleared AMOLED option should fall back to default" }
    check((cfgCls.getMethod("getThemeMode").invoke(null) as Int) == 2) { "Other options should remain set after clearOption" }

    resetAll.invoke(null)
}

private fun testTrackSwipeAndLinnOverrides(loader: ClassLoader) {
    val prefsCls = loader.loadClass("dev.materialtidal.extension.tidal.settings.PatchSettingsPrefs")
    val swipeCls = loader.loadClass("dev.materialtidal.extension.tidal.gestures.TrackSwipeConfig")
    val linnCls = loader.loadClass("dev.materialtidal.extension.tidal.linn.LinnConfig")

    val resetAll = prefsCls.getMethod("resetAll")
    resetAll.invoke(null)

    val setBool = prefsCls.getMethod("setBoolean", Int::class.javaPrimitiveType, Boolean::class.javaPrimitiveType)
    val setInt = prefsCls.getMethod("setInt", Int::class.javaPrimitiveType, Int::class.javaPrimitiveType)
    val setString = prefsCls.getMethod("setString", Int::class.javaPrimitiveType, String::class.java)

    val optRight = prefsCls.getField("OPT_SWIPE_RIGHT_ACTION").getInt(null)
    val optLeft = prefsCls.getField("OPT_SWIPE_LEFT_ACTION").getInt(null)
    val optHaptic = prefsCls.getField("OPT_SWIPE_HAPTIC").getInt(null)
    val optThresh = prefsCls.getField("OPT_SWIPE_THRESHOLD_DP").getInt(null)

    setInt.invoke(null, optRight, 2)
    setInt.invoke(null, optLeft, 4)
    setBool.invoke(null, optHaptic, false)
    setInt.invoke(null, optThresh, 112)

    check((swipeCls.getMethod("getSwipeRightAction").invoke(null) as Int) == 2)
    check((swipeCls.getMethod("getSwipeLeftAction").invoke(null) as Int) == 4)
    check(!(swipeCls.getMethod("isHapticEnabled").invoke(null) as Boolean))
    check((swipeCls.getMethod("getSwipeThresholdDp").invoke(null) as Int) == 112)

    val optLinnQ = prefsCls.getField("OPT_LINN_AUDIO_QUALITY").getInt(null)
    val optLinnMode = prefsCls.getField("OPT_LINN_STREAM_MODE").getInt(null)
    val optLinnWake = prefsCls.getField("OPT_LINN_AUTO_WAKE").getInt(null)
    val optLinnIp = prefsCls.getField("OPT_LINN_MANUAL_IP").getInt(null)

    setInt.invoke(null, optLinnQ, 1)
    setInt.invoke(null, optLinnMode, 1)
    setBool.invoke(null, optLinnWake, false)
    setString.invoke(null, optLinnIp, "192.168.1.42:55178")

    check((linnCls.getMethod("getAudioQualityMode").invoke(null) as Int) == 1)
    check((linnCls.getMethod("getStreamDeliveryMode").invoke(null) as Int) == 1)
    check(!(linnCls.getMethod("isAutoWakeAndSwitchEnabled").invoke(null) as Boolean))
    check((linnCls.getMethod("getManualDeviceIp").invoke(null) as String) == "192.168.1.42:55178")

    resetAll.invoke(null)
    check((swipeCls.getMethod("getSwipeThresholdDp").invoke(null) as Int) == 72)
    check((linnCls.getMethod("getManualDeviceIp").invoke(null) as String) == "")
}

private fun testResetAndClearAndModifiedCount(loader: ClassLoader) {
    val prefsCls = loader.loadClass("dev.materialtidal.extension.tidal.settings.PatchSettingsPrefs")
    val resetAll = prefsCls.getMethod("resetAll")
    val getModified = prefsCls.getMethod("getModifiedCount")
    val setInt = prefsCls.getMethod("setInt", Int::class.javaPrimitiveType, Int::class.javaPrimitiveType)

    resetAll.invoke(null)
    check((getModified.invoke(null) as Int) == 0) { "Unpatched fresh prefs should have 0 modified count" }

    // Safe out-of-bounds option IDs must not throw
    val getBool = prefsCls.getMethod("getBoolean", Int::class.javaPrimitiveType, Boolean::class.javaPrimitiveType)
    val getInt = prefsCls.getMethod("getInt", Int::class.javaPrimitiveType, Int::class.javaPrimitiveType)
    val getStr = prefsCls.getMethod("getString", Int::class.javaPrimitiveType, String::class.java)
    check(getBool.invoke(null, -1, true) as Boolean)
    check((getInt.invoke(null, 999, 42) as Int) == 42)
    check((getStr.invoke(null, 999, "fallback") as String) == "fallback")

    // Setting an option on unpatched config doesn't crash getModifiedCount
    setInt.invoke(null, 0, 1)
    check((getModified.invoke(null) as Int) == 0)
    resetAll.invoke(null)

    // Test batch clearOptions & countOverriddenIn (including out-of-bounds safety)
    val optAmoled = prefsCls.getField("OPT_AMOLED_PURE_BLACK").getInt(null)
    val optBlur = prefsCls.getField("OPT_EXPRESSIVE_GLASS_BLUR").getInt(null)
    val optThresh = prefsCls.getField("OPT_SWIPE_THRESHOLD_DP").getInt(null)
    val setBool = prefsCls.getMethod("setBoolean", Int::class.javaPrimitiveType, Boolean::class.javaPrimitiveType)
    val countIn = prefsCls.getMethod("countOverriddenIn", IntArray::class.java)
    val clearOpts = prefsCls.getMethod("clearOptions", IntArray::class.java)

    setBool.invoke(null, optAmoled, true)
    setBool.invoke(null, optBlur, false)
    setInt.invoke(null, optThresh, 96)

    check((countIn.invoke(null, intArrayOf(optAmoled, optBlur, -1, 999)) as Int) == 2) {
        "countOverriddenIn should count valid overridden IDs only"
    }
    check((countIn.invoke(null, intArrayOf(optThresh)) as Int) == 1)

    clearOpts.invoke(null, intArrayOf(optAmoled, optBlur, -5))
    check((countIn.invoke(null, intArrayOf(optAmoled, optBlur)) as Int) == 0) {
        "clearOptions should clear all specified theme options"
    }
    check((countIn.invoke(null, intArrayOf(optThresh)) as Int) == 1) {
        "clearOptions must preserve overrides outside the cleared category"
    }
    resetAll.invoke(null)
}
