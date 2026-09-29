/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.misc.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Skips the native signature gate.
 *
 * 13.5.1 runs the guard before anything else in `MainActivity.onCreate`:
 *
 * ```
 * if (!signatureGuard.a(callback)) return;
 * ```
 *
 * The guard loads the native `atherkeys` library and asks it to verify the APK's
 * signing certificate, then runs the callback when the check fails. A re-signed build
 * therefore never reaches the UI. This patch rewrites the guard to return true, so the
 * app starts and the callback never runs.
 *
 * Equivalent smali (verified against 13.5.1, versionCode 324):
 * ```
 * .method public final a(Lcom/athermobileapp/navigation/c;)Z
 *     .locals 0
 *     const/4 p0, 0x1
 *     return p0
 * .end method
 * ```
 */
@Suppress("unused")
val signatureGuardPatch = bytecodePatch(
    name = "Bypass signature guard",
    description = "Stops the native signature check that closes the app when the APK is " +
        "not signed by Ather.",
) {
    compatibleWith("com.athermobileapp")

    execute {
        // Ather 13.5.0 has no such class, so the patch only applies where it exists.
        SignatureGuardFingerprint.matchOrNull()?.method?.addInstructions(0, "const/4 p0, 0x1\nreturn p0")
    }
}
