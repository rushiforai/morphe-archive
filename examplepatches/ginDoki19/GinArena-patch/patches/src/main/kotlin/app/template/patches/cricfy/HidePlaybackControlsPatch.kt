package app.template.patches.cricfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRICFY_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object StartupPlayerConstructor : Fingerprint(
    definingClass = "Lcom/android/vending/player/CricfyPlayerView;",
    name = "<init>", returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I"),
    filters = listOf(string("watermark")),
)

private object FullscreenConfiguration : Fingerprint(
    definingClass = "Lcom/android/vending/player/PlayerActivity;", name = "onConfigurationChanged",
    returnType = "V", parameters = listOf("Landroid/content/res/Configuration;"),
)
private object MainPlayerHide : Fingerprint(
    definingClass = "Landroidx/media3/ui/PlayerView;", name = "c", returnType = "V", parameters = emptyList(),
)

/** Experimental: apply the policy before the app binds a player, without removing controls. */
@Suppress("unused")
val hidePlaybackControlsPatch = bytecodePatch(
    name = "Hide playback controls at stream open",
    description = "Hides playback controls when a stream opens or switches fullscreen. Tap the video to show them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICFY_TV)
    execute {
        check(packageMetadata.packageName == "com.cricfytv.sports" &&
              packageMetadata.versionName == "7.4" && packageMetadata.versionCode == "54") {
            "Unsupported app/version for playback controls patch."
        }
        val ctor = StartupPlayerConstructor.repairedMethod
        val insns = ctor.instructions.toList()
        check(ctor.implementation?.registerCount == 10 && insns.size > 6) { "Unexpected constructor." }
        val superCall = insns[5] as? FiveRegisterInstruction ?: error("Unexpected superclass call.")
        val superRef = (insns[5] as? ReferenceInstruction)?.reference as? MethodReference
        val zero = insns[4]
        val bindingRef = (insns[6] as? ReferenceInstruction)?.reference as? MethodReference
        check(zero.opcode == Opcode.CONST_4 && (zero as? OneRegisterInstruction)?.registerA == 9 &&
              (zero as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
              superCall.opcode == Opcode.INVOKE_DIRECT && superCall.registerCount == 4 &&
              superCall.registerC == 6 && superCall.registerD == 7 &&
              superCall.registerE == 8 && superCall.registerF == 9 &&
              superRef?.definingClass == "Landroidx/media3/ui/PlayerView;" && superRef.name == "<init>" &&
              superRef.parameterTypes.map { it.toString() } == listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I") &&
              bindingRef?.definingClass == "Lcom/cricfytv/sports/databinding/ExoPlayerViewBinding;" && bindingRef.name == "bind") {
            "Unexpected player construction sequence; refusing to patch."
        }
        ctor.addInstructions(6, "invoke-virtual {v6, v9}, Landroidx/media3/ui/PlayerView;->setControllerAutoShow(Z)V")

        // The method is protected in the stock DEX; inspect its original live code without modifying it.
        val hide = MainPlayerHide.originalMethod.implementation?.instructions?.toList()
            ?: error("Missing PlayerView hide implementation.")
        val hideField = (hide.getOrNull(0) as? ReferenceInstruction)?.reference as? FieldReference
        val hideCall = (hide.getOrNull(2) as? ReferenceInstruction)?.reference as? MethodReference
        check(hide.size >= 4 && hide[0].opcode == Opcode.IGET_OBJECT &&
              hideField?.definingClass == "Landroidx/media3/ui/PlayerView;" &&
              hideField.type == "Landroidx/media3/ui/PlayerControlView;" &&
              hide[1].opcode == Opcode.IF_EQZ && hide[2].opcode == Opcode.INVOKE_VIRTUAL &&
              hideCall?.definingClass == "Landroidx/media3/ui/PlayerControlView;" &&
              hideCall.name == "f" && hideCall.returnType == "V" && hideCall.parameterTypes.isEmpty() &&
              hide[3].opcode == Opcode.RETURN_VOID) { "Unexpected PlayerView hide implementation; refusing to patch." }

        val config = FullscreenConfiguration.repairedMethod
        val ci = config.instructions.toList()
        fun refAt(index: Int) = (ci.getOrNull(index) as? ReferenceInstruction)?.reference as? MethodReference
        check(config.implementation?.registerCount == 3 && ci.size >= 13 &&
              ci[2].opcode == Opcode.IGET && (ci[2] as? TwoRegisterInstruction)?.registerA == 2 &&
              ci[3].opcode == Opcode.CONST_4 && (ci[3] as? OneRegisterInstruction)?.registerA == 0 &&
              (ci[3] as? NarrowLiteralInstruction)?.narrowLiteral == 2 &&
              ci[4].opcode == Opcode.IF_NE && (ci[4] as? TwoRegisterInstruction)?.registerA == 2 &&
              (ci[4] as? TwoRegisterInstruction)?.registerB == 0 &&
              ci[5].opcode == Opcode.CONST_4 && (ci[5] as? OneRegisterInstruction)?.registerA == 2 &&
              (ci[5] as? NarrowLiteralInstruction)?.narrowLiteral == 1 &&
              ci[6].opcode == Opcode.GOTO &&
              ci[7].opcode == Opcode.CONST_4 && (ci[7] as? OneRegisterInstruction)?.registerA == 2 &&
              (ci[7] as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
              refAt(8)?.definingClass == "Lcom/android/vending/player/PlayerActivity;" && refAt(8)?.name == "j0" &&
              refAt(9)?.definingClass == "Lcom/android/vending/player/PlayerActivity;" && refAt(9)?.name == "e0" &&
              ci[10].opcode == Opcode.MOVE_RESULT && (ci[10] as? OneRegisterInstruction)?.registerA == 2 &&
              refAt(11)?.definingClass == "Lcom/android/vending/player/a;" && refAt(11)?.name == "a0" &&
              ci[12].opcode == Opcode.RETURN_VOID) { "Unexpected fullscreen configuration sequence; refusing to patch." }
        val pcs = ci.runningFold(0) { pc, instruction -> pc + instruction.codeUnits }
        check(pcs[4] + (ci[4] as OffsetInstruction).codeOffset == pcs[7] &&
              pcs[6] + (ci[6] as OffsetInstruction).codeOffset == pcs[8]) {
            "Unexpected fullscreen configuration branches; refusing to patch."
        }
        // Preserve the original method's v2=new orientation boolean. v0 is a dead local here.
        // Insert at the common join using its control-flow label so both orientation branches run it.
        // v0 keeps (previousFullscreen XOR newFullscreen) through the existing update/UI calls.
        config.addInstructionsWithLabels(12, """
            if-eqz v0, :fullscreen_unchanged
            invoke-virtual {v1}, Lcom/android/vending/player/PlayerActivity;->Z()Lcom/android/vending/player/CricfyPlayerView;
            move-result-object v0
            invoke-virtual {v0}, Landroidx/media3/ui/PlayerView;->c()V
        """, ExternalLabel("fullscreen_unchanged", config.getInstruction(12)))
        config.addInstructionsAtControlFlowLabel(8, """
            invoke-virtual {v1}, Lcom/android/vending/player/PlayerActivity;->e0()Z
            move-result v0
            xor-int/2addr v0, v2
        """)

    }
}
