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
 * `SecurityCheck.performSecurityCheck(Z)` normally returns:
 *  - `DeveloperOptionsEnabled` when Settings.Global `development_settings_enabled` is 1,
 *  - `Compromised` when root or Frida indicators are found,
 *  - `Secure` otherwise.
 *
 * MainActivity blocks the UI on anything other than `Secure`. This patch rewrites
 * the method to return `Secure.INSTANCE` unconditionally, so the app stops nagging
 * about Developer Options and no longer refuses to run on rooted / GrapheneOS
 * devices.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321):
 * ```
 * .method public final performSecurityCheck(Z)L.../SecurityCheck$CheckResult;
 *     .locals 0
 *     sget-object p0, L.../SecurityCheck$CheckResult$Secure;->INSTANCE:L.../SecurityCheck$CheckResult$Secure;
 *     return-object p0
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
        PerformSecurityCheckFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/ather/common/utils/coreUtils/SecurityCheck${'$'}CheckResult${'$'}Secure;->INSTANCE:Lcom/ather/common/utils/coreUtils/SecurityCheck${'$'}CheckResult${'$'}Secure;
                return-object v0
            """,
        )
    }
}
