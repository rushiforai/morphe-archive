/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.patches.music.navigation.components

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.utils.extension.Constants.NAVIGATION_CLASS_DESCRIPTOR
import app.morphe.patches.music.utils.playservice.is_8_51_or_greater
import app.morphe.patches.music.utils.resourceid.colorGrey
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.getResourceId
import app.morphe.util.Utils.printWarn
import app.morphe.util.findMutableClassOrThrow
import app.morphe.util.fingerprint.methodOrThrow
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.indexOfFirstLiteralInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val NAVIGATION_GLASS = "Lapp/morphe/extension/music/patches/MusicGlassNavigationBar;"
private const val MINIPLAYER_GLASS = "Lapp/morphe/extension/music/patches/MusicGlassMiniplayer;"
private const val WATCHPAGE = "Lcom/google/android/apps/youtube/music/watchpage"
private const val YOUTUBE_TEXT_VIEW = "Lcom/google/android/libraries/youtube/common/ui/YouTubeTextView;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"

/** The theme also runs when navigation, player, or glass customization is not selected. */
internal fun BytecodePatchContext.installMusicLightBarHooks() {
    runCatching { installLightPivotBarHook() }.onFailure {
        printWarn("Music light theme: native pivot bar paint hook is unavailable (${it.message}).")
    }
    runCatching { installLightMiniplayerHook() }.onFailure {
        printWarn("Music light theme: native miniplayer layout hook is unavailable (${it.message}).")
    }
    runCatching { installLightMiniplayerTitleHook() }.onFailure {
        printWarn("Music light theme: native miniplayer title hook is unavailable (${it.message}).")
    }
}

private fun BytecodePatchContext.installLightPivotBarHook() {
    val method = tabLayoutFingerprint.methodOrThrow()
    val colorIndex = method.indexOfFirstLiteralInstructionOrThrow(colorGrey)
    val colorResultIndex = method.indexOfFirstInstructionOrThrow(colorIndex, Opcode.MOVE_RESULT)
    val paintIndex = method.indexOfFirstInstructionOrThrow(colorResultIndex) {
        opcode == Opcode.INVOKE_VIRTUAL && getReference<MethodReference>()?.name == "setBackgroundColor"
    }
    val color = method.getInstruction<OneRegisterInstruction>(colorResultIndex).registerA
    val pivot = method.getInstruction<FiveRegisterInstruction>(paintIndex).registerC

    // Resolve the stock color before either optional custom- or album-color override runs.
    method.addInstruction(
        paintIndex + 1,
        "invoke-static/range {v$pivot .. v$pivot}, $NAVIGATION_GLASS->onLightPivotBarPainted(Landroid/view/View;)V",
    )
    method.addInstructions(
        colorResultIndex + 1,
        """
            invoke-static/range {v$color .. v$color}, $NAVIGATION_CLASS_DESCRIPTOR->resolveLightNavigationBarDefault(I)I
            move-result v$color
        """,
    )
}

private fun BytecodePatchContext.installLightMiniplayerHook() {
    val layoutClass = if (is_8_51_or_greater) {
        "$WATCHPAGE/ui/WatchWhileLayout;"
    } else {
        "$WATCHPAGE/mpp/MppWatchWhileLayout;"
    }
    val method = findMutableClassOrThrow(layoutClass).methods.single {
        it.name == "onFinishInflate" && it.parameters.isEmpty() && it.returnType == "V"
    }
    method.addInstruction(
        0,
        "invoke-static/range {p0 .. p0}, $MINIPLAYER_GLASS->onLightWatchLayoutInflated(Landroid/view/View;)V",
    )
}

private fun BytecodePatchContext.installLightMiniplayerTitleHook() {
    val titleId = getResourceId(ResourceType.ID, "mini_player_title")
    check(titleId > 0) { "Missing native miniplayer title resource" }
    val swipeTitleId = getResourceId(ResourceType.ID, "swipeable_mini_player_title")
    val method = findMutableClassOrThrow(YOUTUBE_TEXT_VIEW).methods.single {
        it.name == "setText" && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) ==
                listOf(CHAR_SEQUENCE, "Landroid/widget/TextView\$BufferType;")
    }
    check(method.implementation!!.registerCount >= 5) { "No locals in the native miniplayer title bind" }
    val colorHook = "$MINIPLAYER_GLASS->useLightMiniplayerTitleColor(Landroid/view/View;$CHAR_SEQUENCE)$CHAR_SEQUENCE"

    val checkSwipeTitle = if (swipeTitleId > 0) {
        """
            if-eq v0, v1, :miniplayer_title
            const v1, $swipeTitleId
        """
    } else {
        ""
    }
    // Both miniplayer renderers bind via this overload. Reject all other view IDs before changing the text.
    method.addInstructionsWithLabels(
        0,
        """
            invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getId()I
            move-result v0
            const v1, $titleId
            $checkSwipeTitle
            if-ne v0, v1, :stock
            :miniplayer_title
            invoke-static/range {p0 .. p1}, $colorHook
            move-result-object p1
        """,
        ExternalLabel("stock", method.getInstruction(0)),
    )
}
