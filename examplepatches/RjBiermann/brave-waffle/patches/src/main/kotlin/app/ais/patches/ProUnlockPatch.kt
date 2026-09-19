package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * The server sends `pro` (unixtime seconds, PRO expiry) and `unixtime` (server time)
 * in the login response. Everywhere in the app the PRO check is `getPro() > getUnixtime()`.
 *
 * Hooking the single getter `LoginStatus.getPro()J` to return Long.MAX_VALUE
 * makes every local PRO check succeed.
 */
object ProStatusFingerprint : Fingerprint(
    definingClass = "Lcom/streamdev/aiostreamer/datatypes/login/LoginStatus;",
    name = "getPro",
    returnType = "J"
)

/**
 * `x93.b()` copies the LoginStatus (through the getter) into the RSA-encrypted
 * hash sent with every API request. The server validates the reported `pro`
 * value: any future expiry in the hash is rejected with an
 * "Application Error - Please redownload the app" dialog.
 *
 * `setPro()` is only ever called from that request-hash builder — server
 * responses reach the field via GSON reflection, so a no-op setter keeps the
 * request hash reporting `pro = 0` while local checks stay unlocked.
 */
object ProStatusSetterFingerprint : Fingerprint(
    definingClass = "Lcom/streamdev/aiostreamer/datatypes/login/LoginStatus;",
    name = "setPro",
    parameters = listOf("J")
)

@Suppress("unused")
val proUnlockPatch = bytecodePatch(
    name = "Unlock PRO",
    description = "Unlocks all PRO features permanently.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        ProStatusFingerprint.method.addInstructions(
            0,
            """
                const-wide v0, 0x7fffffffffffffffL
                return-wide v0
            """
        )

        ProStatusSetterFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
