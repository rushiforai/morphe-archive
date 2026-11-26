/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.patches.music.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.hasResourceId
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOME_BROWSE_ID = "FEmusic_home"
private const val VIEW_GROUP = "Landroid/view/ViewGroup;"
private const val VIEW = "Landroid/view/View;"
private const val STRING = "Ljava/lang/String;"

private object HomeBackdropContainerFingerprint : Fingerprint(
    name = "onCreateView",
    filters = listOf(
        resourceLiteral(ResourceType.LAYOUT, "top_level_browse_fragment"),
        resourceLiteral(ResourceType.ID, "background_image_container"),
        methodCall(name = "findViewById", location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        opcode(Opcode.CHECK_CAST, location = MatchAfterImmediately()),
        opcode(Opcode.IPUT_OBJECT, location = MatchAfterImmediately()),
    ),
)

internal fun BytecodePatchContext.installMusicLightHomeHooks() {
    // 9.40+ has a separate Elements full-bleed backdrop. Older versions only host browse photos.
    if (!hasResourceId(ResourceType.ID, "background_elements")) {
        printWarn("Music light theme: the Home full-bleed contrast hook requires the 9.40+ backdrop layout.")
        return
    }

    runCatching { installLightHomeBackdrop() }.onFailure {
        printWarn("Music light theme: the Home full-bleed contrast hook is unavailable (${it.message}).")
    }
}

private fun BytecodePatchContext.installLightHomeBackdrop() {
    val layout = HomeBackdropContainerFingerprint.method
    val backdropField = checkNotNull(
        layout.getInstruction(HomeBackdropContainerFingerprint.instructionMatches.last().index)
            .getReference<FieldReference>(),
    )
    val fragment = mutableClassDefBy(layout.definingClass)
    check(backdropField.definingClass == fragment.type && backdropField.type == VIEW_GROUP)

    // The existing Home check reads the current browse response and its browse ID. Reuse those
    // same references without depending on obfuscated names or the unrelated flag in that method.
    val uiElement = fragment.methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == "I" &&
                method.implementation?.instructions?.any { it.hasString(HOME_BROWSE_ID) } == true
    }
    val uiCode = uiElement.implementation!!.instructions
    val homeIndex = uiCode.indexOfFirst { it.hasString(HOME_BROWSE_ID) }
    val browseIdCall = checkNotNull(uiCode.getOrNull(homeIndex - 2)?.getReference<MethodReference>())
    val responseRead = checkNotNull(uiCode.getOrNull(homeIndex - 4))
    val responseField = checkNotNull(responseRead.getReference<FieldReference>())
    check(responseRead.opcode == Opcode.IGET_OBJECT && responseField.definingClass == fragment.type &&
            browseIdCall.definingClass == responseField.type && browseIdCall.parameterTypes.isEmpty() &&
            browseIdCall.returnType == STRING)

    val renderBackdrop = fragment.methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == "V" &&
                method.implementation?.instructions?.let { instructions ->
                    instructions.any { it.getReference<FieldReference>() == backdropField } &&
                            instructions.any { it.hasString("ElementPresenter#LAYOUT_PARAMS") }
                } == true
    }
    check(renderBackdrop.implementation!!.registerCount in 3..16)

    // Hide only the separately layered Home backdrop, leaving the feed, card title scrims and
    // optional full-bleed backgrounds on other browse pages alone. Visibility preserves layout.
    renderBackdrop.addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->isEnabled()Z
            move-result v0
            if-eqz v0, :stock
            iget-object v0, p0, $responseField
            if-eqz v0, :stock
            invoke-virtual {v0}, $browseIdCall
            move-result-object v0
            const-string v1, "$HOME_BROWSE_ID"
            invoke-virtual {v1, v0}, $STRING->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :stock
            iget-object v0, p0, $backdropField
            if-eqz v0, :stock
            const/4 v1, 0x4
            invoke-virtual {v0, v1}, $VIEW->setVisibility(I)V
        """,
        ExternalLabel("stock", renderBackdrop.getInstruction(0)),
    )
}

private fun Instruction.hasString(value: String) = getReference<StringReference>()?.string == value
