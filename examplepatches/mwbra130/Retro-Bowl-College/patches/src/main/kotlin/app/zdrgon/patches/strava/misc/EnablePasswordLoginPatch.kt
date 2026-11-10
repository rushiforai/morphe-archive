package app.zdrgon.patches.strava.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.strava.shared.Constants.COMPATIBILITY_STRAVA

private const val OTP_RESPONSE_CLASS =
    "Lcom/strava/authorization/data/RequestOtpLogInNetworkResponse;"

/**
 * Re-enables email + password login.
 *
 * When the app requests a one-time-code login, Strava's server answers
 * with a RequestOtpLogInNetworkResponse whose usePassword flag decides
 * whether the app may offer password entry. When the flag is false the
 * app forces the OTP-only flow — and in 486.9 the login UI has no other
 * password entry point, so an account the server flags this way can only
 * ever use the code flow.
 *
 * This patch forces getUsePassword() to return true, so the app falls
 * through to the standard email + password login. Authentication itself
 * is unchanged: the password is still verified by Strava's servers
 * exactly as in the official app. Nothing about the account, the code
 * flow, or any server response is forged.
 */
@Suppress("unused")
val enablePasswordLoginPatch = bytecodePatch(
    name = "Enable password login",
    description = "Shows the email and password login option instead of forcing the one-time " +
        "email code flow. Your password is still checked by Strava's servers exactly as in " +
        "the official app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    execute {
        val classDef = classDefBy(OTP_RESPONSE_CLASS)
        val mutableClass = mutableClassDefBy(classDef)

        val getter = mutableClass.methods.first { method ->
            method.name == "getUsePassword" &&
                method.returnType == "Z" &&
                method.parameterTypes.isEmpty()
        }

        getter.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
