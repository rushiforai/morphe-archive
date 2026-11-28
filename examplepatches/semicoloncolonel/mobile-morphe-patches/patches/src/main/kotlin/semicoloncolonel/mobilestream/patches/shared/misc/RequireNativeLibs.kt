package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.resourcePatch

private val ABIS = listOf("arm64-v8a", "armeabi-v7a", "x86_64", "x86")

/**
 * A check that refuses an input without [library], for an app whose native
 * libraries are in the ABI split APK rather than in base.apk. Patching a
 * base.apk or a single .apk alone drops them, and the patched app crashes at
 * launch. The installed copy patched with "Use installed app", and the full
 * .apkm bundle, both keep them. The app's patches depend on this check, so
 * such an input fails with [appName] and the sources that work.
 */
internal fun requireNativeLibsPatch(appName: String, library: String): ResourcePatch = resourcePatch {
    execute {
        val present = ABIS.any { abi ->
            try {
                get("lib/$abi/$library", true).exists()
            } catch (e: Exception) {
                false
            }
        }
        if (!present) {
            throw PatchException(
                "$appName's native libraries are missing from this input, so the patched app would crash at " +
                    "launch. Install $appName from Google Play and patch it with \"Use installed app\", or patch " +
                    "the full .apkm bundle. A base.apk or a single .apk does not have them.",
            )
        }
    }
}
