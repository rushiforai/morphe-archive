package app.template.patches.minimalist.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** The SharedPreferences key the app stores the one-time "full version" purchase under. */
internal const val FULL_VERSION = "full version"

/** The log line the purchase setter prints; unique in the APK. */
internal const val SETTER_LOG = "setting full version to "

/**
 * The local purchase flag reader: a no-arg boolean getter over the SharedPreferences key
 * "full version". Used to seed the purchase StateFlow at startup and by the settings screens.
 */
internal object FullVersionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(FULL_VERSION),
)

/**
 * The purchase setter (boolean, purchase) that writes the pref and updates the StateFlow. R8
 * renamed the method, but the log line "setting full version to " is unique.
 */
internal object FullVersionSetterFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(SETTER_LOG),
    custom = { method, _ ->
        val params = method.parameterTypes.map(CharSequence::toString)
        params.size == 2 && params[0] == "Z"
    },
)
