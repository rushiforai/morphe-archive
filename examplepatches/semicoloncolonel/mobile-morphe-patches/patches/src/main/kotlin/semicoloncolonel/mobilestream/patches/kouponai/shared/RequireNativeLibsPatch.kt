package semicoloncolonel.mobilestream.patches.kouponai.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 is a React Native app, and its native libraries
// (libreactnative.so, libhermes.so, and the rest) are in the ABI split APK
// (split_config.arm64_v8a.apk), not in base.apk. Patching a base.apk or a
// single .apk alone drops them, and the patched app crashes at launch with
// "couldn't find DSO to load: libreactnative.so". The Play Store copy patched
// with "Use installed app", and the full .apkm bundle, both keep them.
// Every Koupon patch depends on this check, which refuses such an input with
// a clear message instead of building an app that cannot start.
// ─────────────────────────────────────────────────────────────────────────────

private val ABIS = listOf("arm64-v8a", "armeabi-v7a", "x86_64", "x86")

internal val requireNativeLibsPatch = resourcePatch {
    execute {
        val present = ABIS.any { abi ->
            try {
                get("lib/$abi/libreactnative.so", true).exists()
            } catch (e: Exception) {
                false
            }
        }
        if (!present) {
            throw PatchException(
                "Koupon's native libraries are missing from this input, so the patched app would crash at " +
                    "launch. Install Koupon from Google Play and patch it with \"Use installed app\", or patch " +
                    "the full .apkm bundle. A base.apk or a single .apk, such as the one APKPure offers, does not have them.",
            )
        }
    }
}
