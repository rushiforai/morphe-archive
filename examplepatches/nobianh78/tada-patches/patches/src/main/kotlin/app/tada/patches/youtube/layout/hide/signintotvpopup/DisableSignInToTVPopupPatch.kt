/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.layout.hide.signintotvpopup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.util.findFreeRegister
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/DisableSignInToTVPopupPatch;"

val disableSignInToTVPopupPatch = bytecodePatch(
    name = "Disable sign in to TV popup",
    description = "Adds options to disable the popups asking to sign into or connect to a TV " +
        "on the same local network.",
) {
    dependsOn(
        settingsPatch,
        sharedExtensionPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        PreferenceScreen.MISC.addPreferences(
            SwitchPreference("tada_disable_sign_in_to_tv_popup"),
            SwitchPreference("tada_disable_connect_your_devices_popup")
        )

        SignInToTVPopupFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.last().index
                val register = getInstruction<OneRegisterInstruction>(
                    index
                ).registerA
                val free = findFreeRegister(
                    index, register
                )
                val className = definingClass
                val dismissMethodName = SignInToTVPopupDismissFingerprint.method.name

                addInstructionsWithLabels(
                    index,
                    """
                        invoke-static { }, $EXTENSION_CLASS->disableSignInToTVPopup()Z
                        move-result v$free
                        if-eqz v$free, :allow_sign_in_popup
                        invoke-virtual { p0 }, $className->$dismissMethodName()V
                        :allow_sign_in_popup
                        nop
                    """
                )
            }
        }

        HandoffPromoCommandResolverFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->disableConnectYourDevicesPopup()Z
                move-result v0
                if-eqz v0, :allow_connect_popup
                return-void
                :allow_connect_popup
                nop
            """
        )
    }
}
