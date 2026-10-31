package app.morphe.patches.vkvideo.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vkvideo.shared.Constants.COMPATIBILITY_VK_VIDEO
import app.morphe.patches.vkvideo.shared.references

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

internal object DeviceStateIsVpnFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.sourceFile == "DeviceState.kt" && method.references("(I)Z") },
    returnType = "Z",
    parameters = emptyList()
)

@Suppress("unused")
val securityPatch = bytecodePatch(
    name = "Bypass security and package checks",
    description = "Bypasses package verification in AuthBridge and BuildInfo to prevent profile crash and unofficial client warnings, disables dangerous app detection, and disables VPN detection.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_VIDEO)

    execute {
        AuthBridgeIllegalAccessFingerprint.methodOrNull?.apply {
            addInstructions(0, "return-void")
        }

        BuildInfoIsOfficialFingerprint.methodOrNull?.apply {
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        HijackingAppsTaskFingerprint.methodOrNull?.apply {
            addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        }

        DeviceStateIsVpnFingerprint.methodOrNull?.apply {
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
    }
}
