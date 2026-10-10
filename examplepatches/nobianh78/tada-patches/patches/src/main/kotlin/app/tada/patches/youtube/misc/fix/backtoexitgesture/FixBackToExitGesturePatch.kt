/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.youtube.misc.fix.backtoexitgesture

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.shared.misc.settings.preference.SwitchPreference
import app.tada.patches.youtube.misc.backgesture.addBackPressedHook
import app.tada.patches.youtube.misc.backgesture.addPredictiveBackGestureHook
import app.tada.patches.youtube.misc.backgesture.backGesturePatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.misc.playertype.playerTypeHookPatch
import app.tada.patches.youtube.misc.playservice.versionCheckPatch
import app.tada.patches.youtube.misc.settings.PreferenceScreen
import app.tada.patches.youtube.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.insertLiteralOverride
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/FixBackToExitGesturePatch;"

internal val fixBackToExitGesturePatch = bytecodePatch(
    description = "Fixes the swipe back to exit gesture."
) {
    dependsOn(
        sharedExtensionPatch,
        playerTypeHookPatch,
        backGesturePatch,
        versionCheckPatch,
        settingsPatch,
    )

    execute {
        PreferenceScreen.MISC.addPreferences(
            SwitchPreference("tada_back_button_always_exits_feed", summary = true)
        )

        RecyclerViewTopScrollingFingerprint.let {
            it.method.addInstructionsAtControlFlowLabel(
                it.instructionMatches.last().index + 1,
                "invoke-static { }, $EXTENSION_CLASS->onTopView()V"
            )
        }

        BackToRefreshFeatureFlagFingerprint.matchAll().forEach {
            it.method.insertLiteralOverride(
                it.instructionMatches.first().index,
                "$EXTENSION_CLASS->allowBackButtonToScrollToTopOfFeed(Z)Z"
            )
        }

        ScrollPositionFingerprint.instructionMatches[1].getMethodCalled().apply {
            val index = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL && getReference<MethodReference>()?.definingClass ==
                        "Landroid/support/v7/widget/RecyclerView;"
            }

            addInstruction(
                index,
                "invoke-static { }, $EXTENSION_CLASS->onScrollingViews()V"
            )
        }

        addBackPressedHook(EXTENSION_CLASS, "onBackInvoked", afterActivityBackPressed = true)
        addPredictiveBackGestureHook(EXTENSION_CLASS)
    }
}
