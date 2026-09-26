/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.misc.security

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Removes PairIP Play licence verification.
 *
 * Ather ships PairIP, Google's app-protection wrapper. It rewrites the app's
 * `Application` class so that `attachBaseContext` calls
 * `LicenseClient.checkLicense`, which talks to Google Play and blocks the app when
 * the install does not come from the Play Store. A re-signed build therefore refuses
 * to start.
 *
 * This patch rebuilds `attachBaseContext` with the `super` call only, so the
 * application initialises normally and the licence check never runs. The original
 * body is replaced instead of patched in place, which keeps the method valid no matter
 * how the obfuscated class is laid out.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321):
 * ```
 * .method protected attachBaseContext(Landroid/content/Context;)V
 *     .locals 0
 *
 *     invoke-super {p0, p1}, Lcom/pairip/application/Application;->attachBaseContext(Landroid/content/Context;)V
 *
 *     return-void
 * .end method
 * ```
 */
@Suppress("unused")
val pairIpLicensePatch = bytecodePatch(
    name = "Bypass PairIP licence check",
    description = "Removes Google Play licence verification, so the re-signed app starts " +
        "outside the Play Store.",
) {
    compatibleWith("com.athermobileapp")

    execute {
        PairIpAttachBaseContextFingerprint.method.apply {
            val body = implementation ?: throw IllegalStateException(
                "PairIP Application.attachBaseContext has no body to replace.",
            )

            removeInstructions(0, body.instructions.size)
            addInstructions(
                0,
                """
                    invoke-super {p0, p1}, Lcom/pairip/application/Application;->attachBaseContext(Landroid/content/Context;)V

                    return-void
                """,
            )
        }
    }
}
