package app.masajid.patches.security

import app.masajid.patches.shared.Constants
import app.masajid.patches.shared.returnFalse
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string

/** String literals that identify a root/bootloader/tamper detector method. */
private val ROOT_INDICATORS = listOf(
    "/system/bin/su",
    "/sbin/.magisk",
    "/data/adb/magisk",
    "/data/adb/modules",
    "ro.boot.verifiedbootstate",
    "ro.boot.flash.locked",
    "persist.magisk.zygisk",
    "com.topjohnwu.magisk",
    "lsposed",
    "magiskd",
    "which su",
)

/**
 * Obfuscated aggregator/detector classes. R8 renames these every release; verified
 * on 1.0.1. If a future version stops matching, the string-based pass below still
 * catches the detectors that carry root literals.
 */
private val OBFUSCATED_DETECTORS = listOf("La6/b;", "Ly2/b;", "Ly2/c;")

@Suppress("unused")
val bypassRootDetectionPatch = bytecodePatch(
    name = "Bypass root / bootloader detection",
    description = "Forces root, bootloader and tamper checks to return false so the app runs on rooted or modified devices.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MASAJID)

    execute {
        // Method-channel checks live on the (non-obfuscated) MainActivity:
        // checkRoot, checkBootloader, checkMockLocation and getSystemProperties.
        mutableClassDefByOrNull("Lsa/gov/moia/beneficiaryapp/MainActivity;")
            ?.methods?.filter { it.returnType == "Z" }?.forEach { it.returnFalse() }

        // Every boolean method in a class that mentions a root indicator.
        ROOT_INDICATORS.forEach { indicator ->
            Fingerprint(filters = listOf(string(indicator))).matchAllOrNull()?.forEach { match ->
                mutableClassDefByOrNull(match.classDef.type)
                    ?.methods?.filter { it.returnType == "Z" }?.forEach { it.returnFalse() }
            }
        }

        // Aggregator/detector classes addressed directly.
        OBFUSCATED_DETECTORS.forEach { type ->
            mutableClassDefByOrNull(type)
                ?.methods?.filter { it.returnType == "Z" }?.forEach { it.returnFalse() }
        }
    }
}
