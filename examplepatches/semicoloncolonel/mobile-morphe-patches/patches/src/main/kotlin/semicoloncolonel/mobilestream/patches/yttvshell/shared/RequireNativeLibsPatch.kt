package semicoloncolonel.mobilestream.patches.yttvshell.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

// ─────────────────────────────────────────────────────────────────────────────
// YouTube for Android TV 7.32.300 keeps its engine, libchrobalt.so, and its
// other native libraries in the ABI split (split_config.armeabi_v7a.apk) of
// the bundle, not in base.apk. Patching the bundle's base.apk alone builds a
// YT TV+ that closes at launch in CobaltActivity.onCreate. This check refuses
// such an input with a message instead. APKMirror's single-APK variant and the
// full bundle both have the libraries.
// ─────────────────────────────────────────────────────────────────────────────

private val ABIS = listOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64")

internal val requireNativeLibsPatch = resourcePatch {
    execute {
        val present = ABIS.any { abi ->
            try {
                get("lib/$abi/libchrobalt.so", true).exists()
            } catch (e: Exception) {
                false
            }
        }
        if (!present) {
            throw PatchException(
                "YouTube for Android TV's native libraries are missing from this input, so YT TV+ would close " +
                    "at launch. Download version 7.32.300 from APKMirror, the variant marked APK, or the full " +
                    "bundle with its armeabi_v7a split. A base.apk alone does not have them.",
            )
        }
    }
}
