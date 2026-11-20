package app.template.patches.universal

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Generic TV detection based on the leanback system features.
 *
 * The Android documentation recommends detecting a TV by asking the
 * package manager for the leanback features, so a large share of apps
 * contain a small boolean helper that loads one of these feature
 * strings and returns the result of hasSystemFeature(). Any boolean
 * method that references one of the feature strings is a candidate,
 * regardless of the app or of obfuscation, because the feature names
 * are Android platform constants that are never renamed.
 */
object LeanbackFeatureCheckFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(
        anyInstruction(
            string("android.software.leanback"),
            string("android.software.leanback_only"),
            string("android.hardware.type.television")
        )
    )
)

/**
 * Call sites of PackageManager.hasSystemFeature() with a leanback
 * feature string, in a method of any return type — including static
 * initializers and object init blocks, where many apps compute their
 * "is TV" flag exactly once (for example VLC's AndroidDevices object).
 * The boolean-method fingerprint above cannot see those, because
 * initializers do not return a boolean.
 */
object LeanbackCallSiteFingerprint : Fingerprint(
    filters = listOf(
        anyInstruction(
            string("android.software.leanback"),
            string("android.software.leanback_only"),
            string("android.hardware.type.television")
        ),
        methodCall(
            definingClass = "Landroid/content/pm/PackageManager;",
            name = "hasSystemFeature"
        )
    )
)

/**
 * Generic TV detection based on UiModeManager.
 *
 * The other platform-sanctioned way to detect a TV is comparing
 * UiModeManager.getCurrentModeType() against
 * Configuration.UI_MODE_TYPE_TELEVISION. Boolean helpers that call
 * getCurrentModeType() are almost always "is this a TV" checks.
 */
object UiModeTvCheckFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/app/UiModeManager;",
            name = "getCurrentModeType"
        )
    )
)
