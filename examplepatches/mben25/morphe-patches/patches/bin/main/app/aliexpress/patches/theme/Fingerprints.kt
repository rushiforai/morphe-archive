package app.aliexpress.patches.theme

import app.morphe.patcher.Fingerprint

/**
 * Device blacklist of AliExpress' built-in dark mode (`u90/b.c()Z` in 8.162.8).
 *
 * Returns true when dark mode must be withheld from this device: it hardcodes the
 * `redmi` / `xiaomi` / `poco` brands, the KR/JP country codes, and also reads the
 * Orange-pushed `brand_black_list`, `device_mode_black_list` and `system_api_black_list`.
 * Its result gates `u90/f.f()`, which both enables dark mode and decides whether
 * Settings shows the "Dark mode" row, so on a Redmi the whole feature is invisible.
 */
internal object DarkModeDeviceBlacklistFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("brand_black_list", "device_mode_black_list"),
)

/**
 * In-app "Dark mode" switch state (`u90/c.d()Z` in 8.162.8).
 *
 * `is_local_dark_mode_open` is the switch, `is_local_dark_mode_changed` is set the first time
 * the user flips it, and until then the default comes from the Orange flag
 * `local_enable_dark_mode_v2` (false for everyone). All three are strings in the
 * `ae_enable_startup_optimize_sp` prefs, read through the sibling `b(String, String)Z` helper.
 */
internal object LocalDarkModeEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("is_local_dark_mode_open", "is_local_dark_mode_changed", "local_enable_dark_mode_v2"),
)
