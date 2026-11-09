package app.template.patches.playfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_PLAYFY_TV
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object FullscreenUpdate : Fingerprint(
    definingClass = "Lcom/playfy/tv/activities/PlayerActivity;",
    name = "T", returnType = "V", parameters = listOf("Z"),
)
private object MainPlayerHide : Fingerprint(
    definingClass = "Landroidx/media3/ui/PlayerView;", name = "d", returnType = "V", parameters = emptyList(),
)

/** Stock layouts already suppress controller auto-show; hide on an actual fullscreen state change. */
@Suppress("unused")
val hidePlaybackControlsPatch = bytecodePatch(
    name = "Hide playback controls at stream open",
    description = "Keeps playback controls hidden when a stream opens or the player switches between embedded and fullscreen. The controls remain available.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PLAYFY_TV)
    execute {
        check(packageMetadata.packageName == "com.playfy.tv" &&
              packageMetadata.versionName == "1.7" && packageMetadata.versionCode == "8") {
            "Unsupported Playfy version for playback controls patch."
        }
        val hideMethod = MainPlayerHide.originalMethod
        val hide = hideMethod.implementation?.instructions?.toList() ?: error("Missing controller hide method.")
        val hideCall = (hide.getOrNull(2) as? ReferenceInstruction)?.reference as? MethodReference
        check(hideMethod.accessFlags and AccessFlags.PUBLIC.value != 0 && hide.size == 4 &&
              hide[0].opcode == Opcode.IGET_OBJECT && hide[1].opcode == Opcode.IF_EQZ &&
              hide[2].opcode == Opcode.INVOKE_VIRTUAL && hideCall?.definingClass == "Lk4/q;" &&
              hideCall.name == "g" && hideCall.returnType == "V" && hideCall.parameterTypes.isEmpty() &&
              hide[3].opcode == Opcode.RETURN_VOID) { "Unexpected PlayerView hide implementation; refusing to patch." }

        val update = FullscreenUpdate.method
        val insns = update.instructions.toList()
        fun methodRef(index: Int) = (insns.getOrNull(index) as? ReferenceInstruction)?.reference as? MethodReference
        val selectedCall = insns.getOrNull(2) as? FiveRegisterInstruction
        val playerField = (insns.getOrNull(15) as? ReferenceInstruction)?.reference as? FieldReference
        check(update.implementation?.registerCount == 5 && insns.size == 32 &&
              methodRef(0)?.definingClass == "Lcom/playfy/tv/activities/PlayerActivity;" && methodRef(0)?.name == "a0" &&
              methodRef(0)?.returnType == "Landroid/widget/ImageButton;" &&
              insns[1].opcode == Opcode.MOVE_RESULT_OBJECT && (insns[1] as? OneRegisterInstruction)?.registerA == 0 &&
              insns[2].opcode == Opcode.INVOKE_VIRTUAL && selectedCall?.registerCount == 2 &&
              selectedCall.registerC == 0 && selectedCall.registerD == 4 &&
              methodRef(2)?.definingClass == "Landroid/view/View;" && methodRef(2)?.name == "setSelected" &&
              methodRef(2)?.parameterTypes?.map { it.toString() } == listOf("Z") &&
              methodRef(13)?.definingClass == "Lcom/playfy/tv/activities/PlayerActivity;" && methodRef(13)?.name == "Y" &&
              methodRef(13)?.returnType == "Lcom/playfy/tv/databinding/ActivityPlayerBinding;" &&
              insns[15].opcode == Opcode.IGET_OBJECT && (insns[15] as? TwoRegisterInstruction)?.registerA == 1 &&
              playerField?.definingClass == "Lcom/playfy/tv/databinding/ActivityPlayerBinding;" && playerField.name == "j" &&
              playerField.type == "Landroidx/media3/ui/PlayerView;" &&
              methodRef(30)?.definingClass == "Lcom/playfy/tv/activities/PlayerActivity;" && methodRef(30)?.name == "i0" &&
              insns[31].opcode == Opcode.RETURN_VOID) { "Unexpected fullscreen update sequence; refusing to patch." }

        // v0 is the existing fullscreen button, v4 is the requested state and v1 is a dead local here.
        // Skip unchanged configuration events, including the second callback after a fullscreen tap.
        update.addInstructionsWithLabels(2, """
            invoke-virtual {v0}, Landroid/view/View;->isSelected()Z
            move-result v1
            if-eq v1, v4, :fullscreen_unchanged
            invoke-virtual {v3}, Lcom/playfy/tv/activities/PlayerActivity;->Y()Lcom/playfy/tv/databinding/ActivityPlayerBinding;
            move-result-object v1
            iget-object v1, v1, Lcom/playfy/tv/databinding/ActivityPlayerBinding;->j:Landroidx/media3/ui/PlayerView;
            invoke-virtual {v1}, Landroidx/media3/ui/PlayerView;->d()V
        """, ExternalLabel("fullscreen_unchanged", update.getInstruction(2)))
    }
}
