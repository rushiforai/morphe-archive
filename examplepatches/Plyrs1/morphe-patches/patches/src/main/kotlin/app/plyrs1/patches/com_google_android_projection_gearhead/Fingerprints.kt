package app.plyrs1.patches.com_google_android_projection_gearhead

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Fingerprint matching jao.J(), the method that reads
 * SharedPreferences("carservice").getBoolean("allow_unknown_sources", false).
 */
object IsUnknownSourcesEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("carservice", "allow_unknown_sources"),
    filters = listOf(
        string("carservice"),
        string("allow_unknown_sources"),
        methodCall(name = "getBoolean"),
    )
)

/**
 * Fingerprint matching jao.z(String, qva, boolean, boolean, boolean, ymy),
 * the main projection package validation gate.
 */
object IsPackageAllowed3pFingerprint : Fingerprint(
    returnType = "Z",
    strings = listOf(
        "CarProjectionValidator#isPackageAllowed3p",
        "com.android.vending",
        "Package DENIED; failed all other checks [%s]",
    ),
    filters = listOf(
        string("CarProjectionValidator#isPackageAllowed3p"),
        string("Package DENIED; failed all other checks [%s]"),
    )
)
