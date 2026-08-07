package dev.petalaa.patches.androidauto

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS

/**
 * Bytecode patch that neutralizes the native anti-repack integrity check
 * ([SecurityDetect.irpj]) which kills the process when the APK has been
 * re-signed (a necessary step for any patched APK).
 *
 * The check lives in [MapApplication.onCreate] → Runnable → [MapApplication.g]
 * → [SecurityDetect.irpj] → native SD.irpj() in libaegissec.so.
 *
 * This patch makes [SecurityDetect.irpj] unconditionally return false,
 * preventing the kill-switch while keeping the rest of the method intact.
 */
@Suppress("unused")
val antiRepackPatch = bytecodePatch(
    name = "Anti-Repack Bypass",
    description = "Neutralizes the native integrity check (SecurityDetect.irpj) " +
            "that kills the process upon detecting APK re-signing.",
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    execute {
        SecurityDetectIrpjFingerprint.method.returnEarly(false)
    }
}
