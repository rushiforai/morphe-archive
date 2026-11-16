package arpit.morphe.patches.juggernautai.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import arpit.morphe.patches.juggernautai.shared.Constants.COMPATIBILITY_JUGGERNAUTAI
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches `UpdatesConfiguration$Companion.getIsEnabled(Context, Map): Boolean`.
 *
 * The companion method is the single place where expo-updates decides whether the
 * feature is switched on: it first honours an override map entry named `enabled`,
 * then reads the `expo.modules.updates.ENABLED` meta-data value with
 * `PackageManager.getApplicationInfo(...).metaData`, and falls back to `true` when
 * neither is present. Both literals are R8/Kotlin constants and survive
 * obfuscation, and the exact descriptor pins the one overload.
 */
internal object ExpoUpdatesEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/util/Map;"),
    strings = listOf("enabled", "expo.modules.updates.ENABLED"),
)

/**
 * Switches Expo OTA updates off, the same state the app would run in with
 * `expo.modules.updates.ENABLED=false`.
 *
 * JuggernautAI 3.1.0 is configured to check for updates on every launch
 * (`EXPO_UPDATES_CHECK_ON_LAUNCH=ALWAYS`, `LAUNCH_WAIT_MS=0`) against
 * `https://u.expo.dev/d23b55f8-b528-43cb-92a9-d5dc30b05d7e`. The downloaded update is a
 * production JS bundle; on the next launch expo-updates serves it instead of
 * `assets/index.android.bundle`, which would silently undo any bundle patch.
 *
 * `UpdatesController.initializeWithoutStarting` builds its configuration only when
 * `getUpdatesConfigurationValidationResult` reports `VALID`, and that method returns
 * `INVALID_NOT_ENABLED` as soon as `getIsEnabled` is false. With no configuration the
 * controller stays inactive and the React host keeps loading the embedded asset, so
 * forcing this getter to `false` stops the download and the swap in one place.
 *
 * The manifest flag itself is not edited: a raw resource patch only materialises the
 * APK entries it asks ARSCLib for, and `AndroidManifest.xml` is filtered out of the
 * on-request set, so the binary manifest is not available to that patch type.
 */
@Suppress("unused")
internal val disableExpoUpdatesPatch = bytecodePatch(
    name = "Disable Expo OTA updates",
    description = "Stops the app from downloading a production JavaScript bundle over the " +
        "embedded one. Required by bundle patches so a later Expo update cannot replace " +
        "the patched JavaScript.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JUGGERNAUTAI)

    execute {
        ExpoUpdatesEnabledFingerprint.method.returnEarly(false)
    }
}
