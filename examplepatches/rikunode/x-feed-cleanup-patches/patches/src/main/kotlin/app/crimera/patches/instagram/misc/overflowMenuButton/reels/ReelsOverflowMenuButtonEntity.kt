/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.overflowMenuButton.reels

import app.crimera.patches.instagram.misc.overflowMenuButton.posts.AddReelButtonExtensionFingerprint
import app.crimera.patches.instagram.misc.overflowMenuButton.posts.FeedReplaceAudioDialogHelperFingerprint
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.utils.changeFirstString
import app.crimera.utils.methodExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.library.instagram.patches.instagramExtensionPatch

@Suppress("unused")
val reelsOverflowMenuButtonEntity =
    bytecodePatch(
        description = "Entity class for reels overflow menu button",
    ) {
        dependsOn(instagramExtensionPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        execute {
            FeedReplaceAudioDialogHelperFingerprint.method.apply {
                val strIndex = FeedReplaceAudioDialogHelperFingerprint.stringMatches[0].index
                val addingReelButtonMethodCallIndex = indexOfFirstInstruction(strIndex, Opcode.INVOKE_DIRECT_RANGE) + 1

                val addingReelButtonMethodName = getInstruction(addingReelButtonMethodCallIndex).methodExtractor().name
                AddReelButtonExtensionFingerprint.changeFirstString(addingReelButtonMethodName)
            }
        }
    }
