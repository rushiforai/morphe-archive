/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.ridestats

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the ride-stats feature flag.
 *
 * ```
 * public final boolean k()
 * ```
 *
 * The method reads the server flag `app_ridestats` through
 * `FeatureAccess.e(String, boolean)` and returns it. The flag is false by default,
 * and the app hides the ride-stats screens while it stays false.
 *
 * The class name is obfuscated in 13.5.0, so the fingerprint pins the defining class
 * plus the flag string the method reads.
 */
internal object RideStatsFlagFingerprint : Fingerprint(
    definingClass = "Lcom/ather/domain/featureAccess/a;",
    name = "k",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    strings = listOf("app_ridestats"),
)

/**
 * Turns Ather's ride-stats screens back on.
 *
 * `app_ridestats` is a server flag that defaults to false. The ride data behind the
 * screens is still delivered by the API, so only the client-side gate hides them.
 *
 * The method body is replaced instead of patched in place, which keeps the method
 * valid no matter how the obfuscated class is laid out.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321):
 * ```
 * .method public final k()Z
 *     .locals 0
 *
 *     const/4 p0, 0x1
 *
 *     return p0
 * .end method
 * ```
 */
@Suppress("unused")
val enableRideStatsPatch = bytecodePatch(
    name = "Enable ride stats",
    description = "Turns on the ride-stats feature flag that the app ships disabled.",
) {
    compatibleWith("com.athermobileapp")

    execute {
        RideStatsFlagFingerprint.method.apply {
            val body = implementation ?: throw IllegalStateException(
                "FeatureAccess ride-stats flag has no body to replace.",
            )

            removeInstructions(0, body.instructions.size)
            addInstructions(
                0,
                """
                    const/4 p0, 0x1

                    return p0
                """,
            )
        }
    }
}
