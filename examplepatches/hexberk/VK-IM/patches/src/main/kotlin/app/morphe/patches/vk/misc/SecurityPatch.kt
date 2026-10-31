package app.morphe.patches.vk.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK
import app.morphe.patches.vk.shared.references
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

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

// VK Messenger: ImApplication::checkHijackingApps reference. invoke() schedules the scan of installed apps
// whose activities share the app's task affinity; the clone matches itself (non-VK signature) and posts
// "Dangerous app found" through the generic push pipeline plus a non-fatal "Hijacking apps found" report
internal object CheckHijackingAppsFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.sourceFile == "ImApplication.kt" &&
            method.name == "invoke" &&
            classDef.methods.any { it.name == "<init>" && it.references("checkHijackingApps") }
    },
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
        // Absent in VK Messenger: the official-package list is inlined into AuthBridge's Illegal access method
        BuildInfoIsOfficialFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        // Disable HijackingAppsTask (background scanner for modified VK apps)
        // Absent in VK Messenger
        HijackingAppsTaskFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """
            )
        }

        // Disable the startup scan in VK Messenger: return the Unit that invoke() loads right before return-object
        // Absent in VK: there the scan lives in HijackingAppsTask
        CheckHijackingAppsFingerprint.methodOrNull?.apply {
            val instructions = implementation!!.instructions.toList()
            val unit = instructions.zipWithNext()
                .last { (load, ret) -> load.opcode == Opcode.SGET_OBJECT && ret.opcode == Opcode.RETURN_OBJECT }
                .let { (load, _) -> (load as ReferenceInstruction).reference }
            addInstructions(
                0,
                """
                    sget-object v0, $unit
                    return-object v0
                """
            )
        }

        // Disable HijackingAppsNotification.Companion.a (showing "Dangerous app found" notification)
        // Absent in VK Messenger: its companion only holds the constructor
        HijackingAppsNotificationShowFingerprint.methodOrNull?.apply {
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


