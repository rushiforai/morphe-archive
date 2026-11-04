package app.morphe.patches.oraimohealth.offline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.oraimohealth.shared.COMPATIBILITY_ORAIMO_HEALTH

/**
 * Fingerprint matching obfuscated Transsion NetworkUtil.isConnected in v2.0.7 (w1.z).
 */
object TranssionNetworkUtilIsConnectedFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/w1;",
    name = "z",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Universal fingerprint matching Transsion isConnected by framework constants.
 */
object UniversalNetworkUtilIsConnectedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("connectivity"),
    filters = listOf(
        methodCall("Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo\$State;"),
        fieldAccess("Landroid/net/NetworkInfo\$State;->CONNECTED:Landroid/net/NetworkInfo\$State;")
    )
)

/**
 * Fingerprint matching registerNetworkStatusChangedListener in UtilCode (e0.b).
 */
object UtilCodeRegisterListenerFingerprint : Fingerprint(
    definingClass = "Lcom/blankj/utilcode/util/e0;",
    name = "b",
    returnType = "V",
    parameters = listOf("Lcom/blankj/utilcode/util/d0;")
)

/**
 * Fingerprint matching UtilCode network change BroadcastReceiver onReceive.
 */
object UtilCodeConnectivityReceiverFingerprint : Fingerprint(
    name = "onReceive",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
    strings = listOf("android.net.conn.CONNECTIVITY_CHANGE")
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
        val stubFalse = """
            const/4 v0, 0x0
            return v0
        """

        val stubVoid = """
            return-void
        """

        // Neutralize Transsion NetworkUtil isConnected
        listOfNotNull(
            TranssionNetworkUtilIsConnectedFingerprint.methodOrNull,
            UniversalNetworkUtilIsConnectedFingerprint.methodOrNull
        ).distinct().forEach { method ->
            method.addInstructions(0, stubFalse)
        }

        // Disable UtilCode network change listener registration
        UtilCodeRegisterListenerFingerprint.methodOrNull?.addInstructions(0, stubVoid)

        // Disable UtilCode BroadcastReceiver from firing network change callbacks
        UtilCodeConnectivityReceiverFingerprint.methodOrNull?.addInstructions(0, stubVoid)
    }
}
