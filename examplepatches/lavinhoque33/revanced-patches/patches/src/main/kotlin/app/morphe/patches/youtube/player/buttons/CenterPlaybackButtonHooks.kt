/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-22.
 */

package app.morphe.patches.youtube.player.buttons

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.patches.youtube.utils.extension.Constants.PLAYER_PATH
import app.morphe.patches.youtube.utils.playservice.is_21_13_or_greater
import app.morphe.util.ResourceGroup
import app.morphe.util.Utils.printWarn
import app.morphe.util.copyResources
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION = "$PLAYER_PATH/CenterPlaybackButtonPatch;"
private const val IMAGE_VIEW = "Landroid/widget/ImageView;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val CONTEXT = "Landroid/content/Context;"
private const val RESOURCES = "Landroid/content/res/Resources;"
private const val THEME = "Landroid/content/res/Resources\$Theme;"
private const val CONTEXT_LOAD = "$CONTEXT->getDrawable(I)$DRAWABLE"
private const val RESOURCE_LOAD = "$RESOURCES->getDrawable(I$THEME)$DRAWABLE"

private object CenterPlaybackRendererFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "accessibility_play"),
        resourceLiteral(ResourceType.STRING, "accessibility_pause"),
        resourceLiteral(ResourceType.STRING, "accessibility_replay"),
        resourceLiteral(ResourceType.DRAWABLE, "player_replay"),
        methodCall(smali = CONTEXT_LOAD),
    ),
)

private object CenterPlaybackShadowFingerprint : Fingerprint(
    returnType = DRAWABLE,
    parameters = listOf("I"),
    filters = listOf(
        methodCall(smali = RESOURCE_LOAD),
        resourceLiteral(ResourceType.INTEGER, "modern_icon_shadow_size"),
        resourceLiteral(ResourceType.INTEGER, "modern_icon_shadow_offset_x"),
        resourceLiteral(ResourceType.INTEGER, "modern_icon_shadow_offset_y"),
        resourceLiteral(ResourceType.INTEGER, "modern_icon_shadow_alpha"),
    ),
)

internal val centerPlaybackButtonResourcesPatch = resourcePatch {
    execute {
        copyResources(
            "youtube/centerplayback",
            ResourceGroup("drawable", "morphe_center_replay.xml", "morphe_center_replay_selector.xml"),
        )
    }
}

internal fun BytecodePatchContext.hookCenterPlaybackDrawables() {
    val renderer = CenterPlaybackRendererFingerprint.matchAll(0..Int.MAX_VALUE).singleOrNull()
    if (renderer == null) {
        printWarn("Play/Pause/Replay button size: native glyph renderer not found; keeping stock glyphs.")
        return
    }

    val replayLoad = renderer.instructionMatches.last().index
    val method = renderer.method
    val load = method.getInstruction(replayLoad) as? FiveRegisterInstruction
    // The replay block loads its ImageView from the renderer before resolving the replay drawable.
    val view = (replayLoad - 1 downTo maxOf(0, replayLoad - 6)).firstNotNullOfOrNull { index ->
        val instruction = method.getInstruction(index)
        if (instruction.opcode == Opcode.IGET_OBJECT && instruction.getReference<FieldReference>()?.type == IMAGE_VIEW) {
            (instruction as TwoRegisterInstruction).registerA
        } else {
            null
        }
    }

    if (load != null && view != null && view in 0..15 && view != load.registerC && view != load.registerD) {
        method.replaceInstruction(
            replayLoad,
            "invoke-static { v${load.registerC}, v${load.registerD}, v$view }, " +
                "$EXTENSION->loadReplay(${CONTEXT}I$IMAGE_VIEW)$DRAWABLE",
        )
    } else {
        printWarn("Play/Pause/Replay button size: native replay loader not found; keeping the stock replay glyph.")
    }

    if (is_21_13_or_greater && !hookShadowSource(renderer.classDef)) {
        printWarn("Play/Pause/Replay button size: native shadow source not found; keeping stock glyph rendering.")
    }
}

private fun BytecodePatchContext.hookShadowSource(renderer: MutableClass): Boolean {
    val shadow = runCatching { CenterPlaybackShadowFingerprint.match(renderer) }.getOrNull() ?: return false
    val method = shadow.method
    val index = shadow.instructionMatches.first().index
    val load = method.getInstruction(index) as? FiveRegisterInstruction ?: return false
    val result = method.getInstruction(index + 1) as? OneRegisterInstruction ?: return false
    val viewLoad = method.getInstruction(0) as? TwoRegisterInstruction ?: return false
    val viewField = viewLoad.getReference<FieldReference>() ?: return false
    if (viewLoad.opcode != Opcode.IGET_OBJECT || viewField.type != IMAGE_VIEW ||
        method.getInstruction(index + 1).opcode != Opcode.MOVE_RESULT_OBJECT ||
        result.registerA !in 0..15 || result.registerA in listOf(load.registerC, load.registerD, load.registerE)
    ) return false

    // Use the load's result register to pass the ImageView. The original move-result overwrites it.
    val view = result.registerA
    method.replaceInstruction(
        index,
        "invoke-static { v${load.registerC}, v${load.registerD}, v${load.registerE}, v$view }, " +
            "$EXTENSION->loadShadowSource(${RESOURCES}I$THEME$IMAGE_VIEW)$DRAWABLE",
    )
    method.addInstruction(index, "iget-object v$view, v${viewLoad.registerB}, $viewField")
    return true
}
