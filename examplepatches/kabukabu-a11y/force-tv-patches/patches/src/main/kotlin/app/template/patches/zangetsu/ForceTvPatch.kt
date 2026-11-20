package app.template.patches.zangetsu

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_ZANGETSU
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Makes Zangetsu believe it runs on an Android TV, so the phone build
 * uses its TV interface on any device. No root and no leanback system
 * feature are needed, because the app's own detection is what changes.
 *
 * Two detection points exist in the app and both are flipped:
 *
 * 1. The Dart UI asks the native side over the
 *    "com.spyou.watch_app/device" MethodChannel ("isTv"). The handler
 *    ORs the UiModeManager mode type with the leanback features and
 *    boxes the boolean for MethodChannel.Result.success. On the false
 *    path it assigns const/4 vX, 0x0 shortly after the
 *    "android.software.leanback_only" check, so flipping that one
 *    constant to 0x1 makes every path answer true.
 *
 * 2. The vendored CloudStream plugin host keeps its own layout flag in
 *    Globals, resolved by isAutoTv() plus the leanback features.
 *    Making isAutoTv() return true immediately resolves the layout
 *    to TV, so plugins behave as on a television too.
 */
@Suppress("unused")
val forceTvPatch = patch(
    name = "Force TV mode for Zangetsu",
    description = "Makes Zangetsu treat the device as an Android TV, so the regular phone build shows its TV interface on any device.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ZANGETSU)

    execute {
        // 2) Plugin host layout: return true before anything else runs.
        //    The original instructions stay in place but are unreachable.
        IsAutoTvFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // 1) Device channel: flip the false-path constant of the isTv
        //    branch. The fingerprint's second filter matched the
        //    "android.software.leanback_only" string instruction, and
        //    the const/4 with literal 0 follows within a few
        //    instructions (invoke, move-result, if, goto, const).
        val method = IsTvChannelFingerprint.method
        val anchorIndex = IsTvChannelFingerprint.instructionMatches[1].index
        val window = (anchorIndex + 1)..(anchorIndex + 12)
        val constIndex = window.first { index ->
            val instruction = method.getInstruction(index)
            instruction is NarrowLiteralInstruction &&
                instruction.opcode == Opcode.CONST_4 &&
                instruction.narrowLiteral == 0
        }
        val register = method.getInstruction<OneRegisterInstruction>(constIndex).registerA
        method.replaceInstruction(constIndex, "const/4 v$register, 0x1")
    }
}
