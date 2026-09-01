package app.morphe.patches.oraimohealth.offline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.oraimohealth.shared.COMPATIBILITY_ORAIMO_HEALTH

/**
 * Fingerprint matching isConnected in Transsion NetworkUtil.
 */
object NetworkUtilIsConnectedFingerprint : Fingerprint(
    definingClass = "Lcom/transsion/net/utils/NetworkUtil;",
    name = "isConnected",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Fingerprint matching isConnected in UtilCode NetworkUtils.
 */
object UtilCodeNetworkUtilsIsConnectedFingerprint : Fingerprint(
    definingClass = "Lcom/blankj/utilcode/util/NetworkUtils;",
    name = "isConnected",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Fingerprint matching registerNetworkStatusChangedListener in UtilCode NetworkUtils.
 */
object UtilCodeNetworkUtilsRegisterListenerFingerprint : Fingerprint(
    definingClass = "Lcom/blankj/utilcode/util/NetworkUtils;",
    name = "registerNetworkStatusChangedListener",
    returnType = "V",
    parameters = listOf("Lcom/blankj/utilcode/util/NetworkUtils\$OnNetworkStatusChangedListener;")
)

/**
 * Bytecode patch that neutralizes network connectivity checks across Transsion and UtilCode libraries.
 */
@Suppress("unused")
val offlineNetworkPatch = bytecodePatch(
    name = "Offline Network Mode",
    description = "Forces network utilities to report disconnected and disables network change listeners.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ORAIMO_HEALTH)

    execute {
        NetworkUtilIsConnectedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        UtilCodeNetworkUtilsIsConnectedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        UtilCodeNetworkUtilsRegisterListenerFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
