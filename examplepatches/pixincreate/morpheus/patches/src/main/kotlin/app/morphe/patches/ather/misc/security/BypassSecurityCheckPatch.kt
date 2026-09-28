/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.misc.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Neutralises Ather's client-side environment gate.
 *
 * The 13.5.1 build hides the check behind obfuscated names. `w.b(Z)` returns the
 * check result `v` and normally returns:
 *  - `t` (`DeveloperOptionsEnabled`) when Settings.Global `development_settings_enabled` is 1,
 *  - `s` (`Compromised`) when root, LSPosed or Frida indicators are found,
 *  - `u` (`Secure`) otherwise.
 *
 * `MainActivity.s()` stores that result in the Compose state behind the
 * `developerOptionsGate` screen. This patch rewrites the method to return `Secure`
 * unconditionally, so the app stops nagging about Developer Options and no longer
 * refuses to run on rooted / GrapheneOS devices.
 *
 * Equivalent smali (verified against 13.5.1, versionCode 324):
 * ```
 * .method public static b(Z)Lcom/ather/common/utils/coreUtils/v;
 *     .locals 0
 *     sget-object v0, Lcom/ather/common/utils/coreUtils/u;->a:Lcom/ather/common/utils/coreUtils/u;
 *     return-object v0
 * .end method
 * ```
 */
@Suppress("unused")
val bypassSecurityCheckPatch = bytecodePatch(
    name = "Bypass security check",
    description = "Stops the Developer Options warning and the root / Frida detection " +
        "that otherwise block the app from starting.",
) {
    compatibleWith("com.athermobileapp")

    execute {
        SecurityCheckFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/ather/common/utils/coreUtils/u;->a:Lcom/ather/common/utils/coreUtils/u;
                return-object v0
            """,
        )
    }
}
