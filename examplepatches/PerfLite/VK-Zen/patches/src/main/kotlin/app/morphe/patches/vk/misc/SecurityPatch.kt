package app.morphe.patches.vk.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK
import app.morphe.patches.vk.shared.references

internal object AuthBridgeIllegalAccessFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Illegal access")
)

internal object BuildInfoIsOfficialFingerprint : Fingerprint(
    definingClass = "Lcom/vk/core/apps/BuildInfo\$a;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;")
)

internal object HijackingAppsTaskFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "HijackingAppsTask.kt" },
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = emptyList()
)

// Companion show(Context, ...): the order of the other three parameters changes between releases
internal object HijackingAppsNotificationShowFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "HijackingAppsNotification.kt" &&
            classDef.type.endsWith("\$a;") &&
            method.parameterTypes.size == 4 &&
            method.parameterTypes[0].toString() == "Landroid/content/Context;"
    },
    returnType = "V"
)

// Builds the notification from NotificationCompat.Builder
internal object HijackingAppsNotificationOFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "HijackingAppsNotification.kt" && !classDef.type.contains("$") },
    returnType = "V",
    parameters = listOf("L")
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
    description = "Bypasses package verification in AuthBridge and BuildInfo to prevent profile crash and unofficial client warnings, disables dangerous app detection, and disables VPN detection in music.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK)

    execute {
        // Prevent IllegalStateException: Illegal access when opening user profile
        AuthBridgeIllegalAccessFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Return true for official package check
        BuildInfoIsOfficialFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // Disable HijackingAppsTask (background scanner for modified VK apps)
        HijackingAppsTaskFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        // Disable HijackingAppsNotification.Companion.a (showing "Dangerous app found" notification)
        HijackingAppsNotificationShowFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Disable HijackingAppsNotification.o (building "Dangerous app found" notification)
        HijackingAppsNotificationOFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }

        // Fake DeviceState.isVpnConnected() to always return false
        DeviceStateIsVpnFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }

        // Disable MusicVpnSnackbarManager.a (showing "Disconnect VPN" snackbar in Music)
        MusicVpnSnackbarManagerShowFingerprint.method.apply {
            addInstructions(
                0,
                """
                    return-void
                """
            )
        }
    }
}


