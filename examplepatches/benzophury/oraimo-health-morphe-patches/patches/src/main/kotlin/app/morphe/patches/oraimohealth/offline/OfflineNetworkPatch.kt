package app.morphe.patches.oraimohealth.offline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.oraimohealth.shared.COMPATIBILITY_ORAIMO_HEALTH

/**
 * Fingerprint matching isConnected in Transsion NetworkUtil (v2.0.4).
 */
object NetworkUtilIsConnectedFingerprint : Fingerprint(
    definingClass = "Lcom/transsion/net/utils/NetworkUtil;",
    name = "isConnected",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Fingerprint matching obfuscated Transsion NetworkUtil.isConnected in v2.0.6 (on/d.R).
 */
object ObfuscatedNetworkUtilIsConnectedFingerprint : Fingerprint(
    definingClass = "Lon/d;",
    name = "R",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Universal fingerprint matching Transsion isConnected in any version by its signature and framework constants.
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
 * Fingerprint matching isConnected in UtilCode NetworkUtils (v2.0.4).
 */
object UtilCodeNetworkUtilsIsConnectedFingerprint : Fingerprint(
    definingClass = "Lcom/blankj/utilcode/util/NetworkUtils;",
    name = "isConnected",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Fingerprint matching registerNetworkStatusChangedListener in UtilCode NetworkUtils (v2.0.4).
 */
object UtilCodeNetworkUtilsRegisterListenerFingerprint : Fingerprint(
    definingClass = "Lcom/blankj/utilcode/util/NetworkUtils;",
    name = "registerNetworkStatusChangedListener",
    returnType = "V",
    parameters = listOf("Lcom/blankj/utilcode/util/NetworkUtils\$OnNetworkStatusChangedListener;")
)

/**
 * Fingerprint matching registerNetworkStatusChangedListener in obfuscated UtilCode (v2.0.6, e0.b).
 */
object ObfuscatedUtilCodeRegisterListenerFingerprint : Fingerprint(
    definingClass = "Lcom/blankj/utilcode/util/e0;",
    name = "b",
    returnType = "V",
    parameters = listOf("Lcom/blankj/utilcode/util/d0;")
)

/**
 * Universal fingerprint matching UtilCode network change BroadcastReceiver onReceive across all versions.
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

        // Neutralize Transsion NetworkUtil isConnected across versions (v2.0.4 and v2.0.6)
        listOfNotNull(
            UniversalNetworkUtilIsConnectedFingerprint.methodOrNull,
            NetworkUtilIsConnectedFingerprint.methodOrNull,
            ObfuscatedNetworkUtilIsConnectedFingerprint.methodOrNull
        ).distinct().forEach { method ->
            method.addInstructions(0, stubFalse)
        }

        // Neutralize UtilCode connectivity check (v2.0.4)
        UtilCodeNetworkUtilsIsConnectedFingerprint.methodOrNull?.addInstructions(0, stubFalse)

        // Disable UtilCode network change listener registration (v2.0.4 and v2.0.6)
        UtilCodeNetworkUtilsRegisterListenerFingerprint.methodOrNull?.addInstructions(0, stubVoid)
        ObfuscatedUtilCodeRegisterListenerFingerprint.methodOrNull?.addInstructions(0, stubVoid)

        // Disable UtilCode BroadcastReceiver from firing network change callbacks (v2.0.4 and v2.0.6)
        UtilCodeConnectivityReceiverFingerprint.methodOrNull?.addInstructions(0, stubVoid)
    }
}
