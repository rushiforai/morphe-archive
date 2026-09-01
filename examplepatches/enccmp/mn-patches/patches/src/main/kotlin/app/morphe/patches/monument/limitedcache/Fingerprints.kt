package app.morphe.patches.monument.limitedcache

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * `SharedPrefsHelper.getThumbnailsCacheSize()` — returns the thumbnail cache size preference.
 *
 * In 4.3.5 it reads `getInt("config.thumbnails_cache_size", 0)`, where `0` means "unlimited"
 * (the "Unlimited cache size" switch is checked when the value is 0). The method name is
 * obfuscated, so it is matched by its return type plus the unique preference-key string and the
 * `SharedPreferences.getInt` call — the setter, which also uses the string, returns void.
 */
internal object ThumbnailsCacheSizeGetterFingerprint : Fingerprint(
    returnType = "I",
    filters = listOf(
        string("config.thumbnails_cache_size"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getInt",
        ),
    ),
)
