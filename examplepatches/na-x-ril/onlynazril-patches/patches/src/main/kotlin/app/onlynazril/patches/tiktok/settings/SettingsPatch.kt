package app.onlynazril.patches.tiktok.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.onlynazril.patches.shared.Constants
import app.morphe.patches.tiktok.shared.requireLocals
import app.morphe.util.implementationOrPatchException
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c

private const val SETTINGS_EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/onlynazril/extension/tiktok/settings/TikTokActivityHook;"

/**
 * Hosts the Tweaks screen in TikTok's ad-personalisation activity.
 *
 * There is no row in TikTok's settings any more: the screen is reached by holding the Home tab in
 * the bottom bar, which the extension installs at runtime. What is left here is the activity
 * itself: replace its content when the intent is ours, and close it on back instead of letting
 * TikTok's own ad-personalisation screen appear.
 */
@Suppress("unused")
val settingsPatch = bytecodePatch(
    name = "Tweaks screen",
    description = "Hosts the Tweaks screen, where every other patch in this bundle is switched " +
        "on or off: the @handle stamp and its surfaces, the region, the post time, the comment " +
        "copy, the captcha, the feed filter, the download, the profile background and the custom " +
        "font. Hold the Home tab in the bottom bar to open it.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_TIKTOK)
    extendWith("extensions/tiktok.mpe")

    execute {
        val initializeSettingsMethodDescriptor =
            "$SETTINGS_EXTENSION_CLASS_DESCRIPTOR->initialize(" +
                "Lcom/bytedance/ies/ugc/aweme/commercialize/compliance/personalization/AdPersonalizationActivity;" +
                ")Z"

        AdPersonalizationActivityOnCreateFingerprint.method.apply {
            val activityImplementation = implementationOrPatchException("Settings")
            val invokeSuperIndex = indexOfFirstInstructionOrThrow { opcode == Opcode.INVOKE_SUPER }
            val invokeSuper = getInstruction(invokeSuperIndex) as? Instruction35c
                ?: throw PatchException(
                    "Settings: ${definingClass}->${name} uses an unsupported invoke-super form.",
                )
            val initializeSettingsIndex = invokeSuperIndex + 1
            val thisRegister = invokeSuper.registerC
            // The highest local. Counting parameters rather than the registers they occupy
            // put this on top of a wide parameter's upper half on any method holding one.
            val locals = activityImplementation.registerCount - numberOfParameterRegisters
            check(locals >= 1) {
                "Settings: the ad personalisation activity has no free local register."
            }
            val usableRegister = locals - 1

            addInstructionsWithLabels(
                initializeSettingsIndex,
                """
                    invoke-static {v$thisRegister}, $initializeSettingsMethodDescriptor
                    move-result v$usableRegister
                    if-eqz v$usableRegister, :do_not_open
                    return-void
                """,
                ExternalLabel("do_not_open", getInstruction(initializeSettingsIndex)),
            )
        }

        AdPersonalizationActivityOnBackPressedFingerprint.method.apply {
            requireLocals("Settings", 1)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range {p0 .. p0}, $SETTINGS_EXTENSION_CLASS_DESCRIPTOR->handleBackPressed(Lcom/bytedance/ies/ugc/aweme/commercialize/compliance/personalization/AdPersonalizationActivity;)Z
                    move-result v0
                    if-eqz v0, :morphe_settings_not_handled
                    return-void
                """,
                ExternalLabel("morphe_settings_not_handled", getInstruction(0)),
            )
        }
    }
}
