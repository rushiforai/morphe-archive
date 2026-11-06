package app.ipusnas.patches.shared

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

/**
 * Lowers `minSdkVersion` in AndroidManifest.xml to 29 (Android 10).
 *
 * iPusnas 2.1.6 ships minSdkVersion=32 (Android 12L) even though the code is
 * API-29-safe: every API-30+ call in the dexes is version-guarded
 * (getInstallSourceInfo is unreachable — neutered by the Play Store redirect
 * bypass; getHistoricalProcessExitReasons is guarded by its only caller).
 * Lowering minSdk lets Android 10/11 users install the patched build.
 *
 * Android 10 notes baked into the other patches:
 *  - SaveBookToDownloads uses MediaStore.Downloads + RELATIVE_PATH (API 29+)
 *  - PairIP install-source probe is force-true before the API-30 call
 */
private val lowerMinSdkManifestPatch = resourcePatch {
    compatibleWith(Constants.COMPATIBILITY_IPUSNAS)

    execute {
        document("AndroidManifest.xml").use { document ->
            val node = document.getElementsByTagName("uses-sdk").item(0) as? org.w3c.dom.Element
            if (node != null) {
                node.setAttributeNS(
                    "http://schemas.android.com/apk/res/android",
                    "android:minSdkVersion",
                    "29"
                )
            }
        }
    }
}

val android10CompatibilityPatch = bytecodePatch(
    name = "Android 10 compatibility (minSdk 29)",
    description = "Lowers minSdkVersion to 29 so the patched app installs on Android 10 and 11. All newer-API calls in the app are version-guarded.",
) {
    compatibleWith(Constants.COMPATIBILITY_IPUSNAS)

    dependsOn(lowerMinSdkManifestPatch)

    execute { }
}
