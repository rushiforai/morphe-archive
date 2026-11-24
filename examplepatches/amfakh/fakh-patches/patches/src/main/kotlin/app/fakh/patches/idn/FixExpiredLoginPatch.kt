/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.literal
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

/** The app's OkHttp authenticator: it refreshes the Cognito session on a 401 and builds the retry request. */
private object TokenAuthenticatorFingerprint : Fingerprint(
    returnType = "Lokhttp3/Request;",
    parameters = listOf("Lokhttp3/Route;", "Lokhttp3/Response;"),
    filters = listOf(literal(401)),
    custom = { _, classDef -> !classDef.type.startsWith("Lokhttp3/") && "Lokhttp3/Authenticator;" in classDef.interfaces },
)

@Suppress("unused")
val fixExpiredLoginPatch = patch(
    name = "Fix server error after idle",
    description = "Logs in again when the session has expired, instead of showing \"kesalahan server\".",
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Fix")
    extendWith("extensions/extension.mpe")

    execute {
        TokenAuthenticatorFingerprint.method.apply {
            // The refresh coroutine is launched and its Job dropped; the retry request it fills in is read right after.
            val launch = instructions.withIndex().indexOfFirst { (index, instruction) ->
                instruction.opcode == Opcode.INVOKE_STATIC && instructions.getOrNull(index + 1)?.opcode == Opcode.IGET_OBJECT
            }
            if (launch < 0) throw PatchException("IDN: the token refresh launch in the authenticator was not found.")
            val register = (instructions[launch] as FiveRegisterInstruction).registerC
            addInstructions(
                launch + 1,
                """
                    move-result-object v$register
                    invoke-static { v$register }, Lapp/fakh/extension/idn/IdnAuthRefresh;->await(Ljava/lang/Object;)V
                """,
            )
        }
    }
}
