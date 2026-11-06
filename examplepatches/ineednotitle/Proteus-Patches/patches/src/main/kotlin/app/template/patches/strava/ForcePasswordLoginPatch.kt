package app.template.patches.strava

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.STRAVA_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Strava marked many (or all) accounts as OTP-only: log-in then shows a
 * one-time-code flow instead of the classic password field. This patch forces
 * RequestOtpLogInNetworkResponse.getUsePassword()Z to true, which makes the
 * app always offer the password flow.
 *
 * WARNING (why this is OFF by default): the same response flag also gates the
 * OTP verification step during SIGN-UP and email-change flows. If the account
 * has NO password set (true OTP-only account, i.e. it was created through the
 * OTP flow and never chose a password), forcing password mode leaves no
 * working way to authenticate at all - log-in and join both dead-end. This
 * was verified on-device by a user in 480.15: OTP log-in and account joining
 * both broke with this flag forced on.
 *
 * Enable only if: you already have a Strava password (created before the OTP
 * migration, or set in the web profile) and want the classic log-in field.
 * Keep disabled (default) when your account logs in via emailed codes.
 */
@Suppress("unused")
val forcePasswordLoginPatch = bytecodePatch(
    name = "Force password login (OTP bypass)",
    description = "Always shows the password login field instead of the OTP code flow. " +
        "OFF by default: breaks log-in AND sign-up for OTP-only accounts. Enable only " +
        "if your Strava account has an actual password.",
    default = false,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    execute {
        // Stable non-obfuscated fingerprint — unchanged across v474/v475/v480.
        Fingerprint(
            definingClass = "Lcom/strava/authorization/data/RequestOtpLogInNetworkResponse;",
            name = "getUsePassword",
            returnType = "Z",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
