/*
 * Portions of this file are ported from Morphe:
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-11-14
 */

package app.morphe.patches.youtube.utils.fix.litho

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.youtube.utils.playservice.is_21_33_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.util.Utils.printWarn
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.mainactivity.injectOnBackPressedMethodCall
import app.morphe.patches.youtube.utils.extension.Constants.UTILS_PATH
import app.morphe.patches.youtube.utils.playservice.is_20_16_or_greater
import app.morphe.patches.youtube.utils.scrollTopParentFingerprint
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findFreeRegister
import app.morphe.util.fingerprint.matchOrThrow
import app.morphe.util.getWalkerMethod
import app.morphe.util.insertLiteralOverride
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_DOUBLE_BACK_TO_CLOSE_CLASS_DESCRIPTOR =
    "$UTILS_PATH/DoubleBackToClosePatch;"

val lithoLayoutPatch = bytecodePatch(
    description = "lithoLayoutPatch"
) {
    dependsOn(versionCheckPatch)

    execute {
        if (is_21_33_or_greater) {
            ScrollToRelatedItemsOnVideoEndFingerprint.method.addInstruction(0, "return-void")
        } else {
            printWarn("End-of-video scroll fix requires YouTube 21.33 or newer; skipped.")
        }


        // region patch double back to close

        fun MutableMethod.injectScrollView(
            index: Int,
            descriptor: String
        ) = addInstruction(
            index,
            "invoke-static {}, $EXTENSION_DOUBLE_BACK_TO_CLOSE_CLASS_DESCRIPTOR->$descriptor()V"
        )

        // Hook onBackPressed method inside MainActivity (WatchWhileActivity)
        injectOnBackPressedMethodCall(
            EXTENSION_DOUBLE_BACK_TO_CLOSE_CLASS_DESCRIPTOR,
            "closeActivityOnBackPressed"
        )

        // Inject the methods which start of ScrollView
        scrollPositionFingerprint.matchOrThrow().let {
            val walkerMethod =
                it.getWalkerMethod(it.instructionMatches.first().index + 1)
            val insertIndex = walkerMethod.implementation!!.instructions.size - 1 - 1

            walkerMethod.injectScrollView(insertIndex, "onStartScrollView")
        }

        // Inject the methods which stop of ScrollView
        if (!is_20_16_or_greater) {
            scrollTopFingerprint.matchOrThrow(scrollTopParentFingerprint).let {
                val insertIndex = it.instructionMatches.last().index

                it.method.injectScrollView(insertIndex, "onStopScrollView")
            }
        } else {
            // Resolve the interface callback so every tab controller is hooked, not an unused duplicate.
            recyclerViewTopScrollingFingerprint().matchAll(1..3).forEach {
                it.method.addInstructionsAtControlFlowLabel(
                    it.instructionMatches.last().index + 1,
                    "invoke-static {}, $EXTENSION_DOUBLE_BACK_TO_CLOSE_CLASS_DESCRIPTOR->onStopScrollView()V"
                )
            }

            val allowBackButtonScroll = "$EXTENSION_DOUBLE_BACK_TO_CLOSE_CLASS_DESCRIPTOR->" +
                    "allowBackButtonToScrollToTopOfFeed(Z)Z"

            val backToRefreshMatches = backToRefreshFeatureFlagFingerprint.matchAll(0..Int.MAX_VALUE)
            if (backToRefreshMatches.isEmpty()) {
                BackToRefreshFingerprint.let {
                    it.method.apply {
                        val index = it.instructionMatches[1].index
                        val freeRegister = findFreeRegister(index)

                        addInstructionsWithLabels(
                            index,
                            """
                                const/4 v$freeRegister, 0x1
                                invoke-static { v$freeRegister }, $allowBackButtonScroll
                                move-result v$freeRegister
                                if-eqz v$freeRegister, :do_not_scroll
                            """,
                            ExternalLabel("do_not_scroll", getInstruction(it.instructionMatches.last().index + 1))
                        )
                    }
                }
            } else {
                backToRefreshMatches.forEach {
                    it.method.insertLiteralOverride(
                        it.instructionMatches.first().index,
                        allowBackButtonScroll
                    )
                }
            }
        }

        // endregion

        // region fix swipe to refresh

        SwipeRefreshLayoutFingerprint.let {
            it.method.apply {
                val resultIndex = it.instructionMatches.last().index
                val register = getInstruction<OneRegisterInstruction>(resultIndex).registerA

                // Newer builds share the return with ListView.canScrollList(). Only override
                // the View.canScrollVertically() result, preserving the ListView branch.
                replaceInstruction(
                    resultIndex,
                    "const/4 v$register, 0x0"
                )
            }
        }

        // endregion

    }
}
