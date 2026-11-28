package app.whatsapp.patches.promotional

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.whatsapp.patches.shared.Constants.WHATSAPP_COMPATIBILITY
import app.whatsapp.patches.shared.propsHookPatch

private const val EXTENSION_CLASS = "Lapp/whatsapp/extension/PatchSettingsExtension;"

/**
 * Promotional UI Cleanup patch.
 *
 * Reduces supported promotional and advertising-related interface elements in WhatsApp
 * by overriding verified promotional AB-Props (22904, 14306) and pausing WAMO ad verification
 * when enabled in Patch Settings.
 *
 * Preserves Status, Channels, personal/group chats, notifications, calls, and privacy settings.
 */
@Suppress("unused")
val promotionalCleanupPatch = patch(
    name = "Promotional UI Cleanup",
    description = "Reduces supported promotional and advertising-related interface elements.",
    default = true
) {
    compatibleWith(WHATSAPP_COMPATIBILITY)

    dependsOn(propsHookPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Hook WAMO ad-verify method ("is_wfal_paused") if present and return PAUSED enum when enabled.
        AdVerifyFingerprint.methodOrNull?.let { method ->
            val returnType = method.returnType
            if (method.parameters.size == 1 && returnType.startsWith("L") && returnType.endsWith(";")) {
                val provider = runCatching { method.getFreeRegisterProvider(0, 2) }.getOrNull()
                val condReg = runCatching { provider?.getFreeRegister4Bit() }.getOrNull()
                val enumReg = runCatching { provider?.getFreeRegister4Bit() }.getOrNull()

                if (condReg != null && enumReg != null) {
                    method.addInstructions(
                        0,
                        """
                            invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->shouldPauseWamoAds(Ljava/lang/Object;)Z
                            move-result v$condReg
                            if-eqz v$condReg, :morphe_orig_ad
                            sget-object v$enumReg, $returnType->PAUSED:$returnType
                            return-object v$enumReg
                            :morphe_orig_ad
                            nop
                        """
                    )
                }
            }
        }
    }
}
