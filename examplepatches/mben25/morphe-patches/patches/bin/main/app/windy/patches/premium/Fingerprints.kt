package app.windy.patches.premium

import app.morphe.patcher.Fingerprint

/**
 * Native premium check used by the home-screen widgets (`kr6.b()Z` in 51.0.1, `ra6.b()Z` in 51.2.1).
 *
 * It reads the `subscription` key from the Capacitor SharedPreferences mirror (written by the
 * JS store's `nativeSync`) and returns `"premium".equals(value)`. The widgets gate their
 * premium-only layouts/data on it. It is the only `()Z` method that references the
 * `subscription`, `""` and `premium` strings together.
 */
internal object IsPremiumForWidgetFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("subscription", "", "premium"),
)
