package app.morphe.patches.vkmessenger.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vkmessenger.shared.Constants.COMPATIBILITY_VK_MESSENGER
import app.morphe.patches.vkmessenger.shared.references

internal object AuthBridgeIllegalAccessFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Illegal access")
)

// isVpn(): the only no-arg boolean getter that delegates to hasTransport(int) (TRANSPORT_VPN)
internal object DeviceStateIsVpnFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.sourceFile == "DeviceState.kt" && method.references("(I)Z") },
    returnType = "Z",
    parameters = emptyList()
)

internal object MusicVpnSnackbarManagerShowFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "MusicVpnSnackbarManager.kt" },
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Z")
)

@Suppress("unused")
val securityPatch = bytecodePatch(
    name = "Bypass security and package checks",
    description = "Bypasses package verification in AuthBridge and BuildInfo to prevent profile crash and unofficial client warnings, disables dangerous app detection, and disables VPN detection.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_MESSENGER)

    execute {
        // Prevent IllegalStateException: Illegal access when opening user profile
        AuthBridgeIllegalAccessFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
            println("SecurityPatch: disabled AuthBridge illegal access check")
        }

        // Fake DeviceState.isVpn() to always return false
        DeviceStateIsVpnFingerprint.methodOrNull?.apply {
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            println("SecurityPatch: DeviceState.isVpn() forced to false")
        }

        // Disable the "Disconnect VPN" snackbar in Music
        MusicVpnSnackbarManagerShowFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
            println("SecurityPatch: disabled MusicVpnSnackbarManager")
        }
    }
}
