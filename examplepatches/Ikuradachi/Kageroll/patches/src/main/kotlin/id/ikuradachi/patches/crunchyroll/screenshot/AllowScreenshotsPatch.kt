package id.ikuradachi.patches.crunchyroll.screenshot

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val allowScreenshotsPatch = bytecodePatch(
    name = "Allow screenshots",
    description = "Removes FLAG_SECURE from membership card and Compose dialogs to permit screenshots and disables Android 14+ screen capture detection in the Arc reader.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)

    execute {
        // 1. MembershipCardDialog: replace const/16 v0, 0x2000 with const/16 v0, 0x0
        run {
            val match = MembershipCardOnViewCreatedFingerprint.matchAll(1..1).single()
            val const16Match = match.instructionMatches.first()
            val register = const16Match.getInstruction<OneRegisterInstruction>().registerA
            match.method.replaceInstruction(const16Match.index, "const/16 v$register, 0x0")
        }

        // 2. Compose Dialogs: replace move v1, v5 with const/16 v1, -0x2001 so both branches clear FLAG_SECURE
        run {
            val match = ComposeDialogSetFlagsFingerprint.matchAll(1..1).single()
            val moveMatch = match.instructionMatches[1]
            val register = moveMatch.getInstruction<TwoRegisterInstruction>().registerA
            match.method.replaceInstruction(moveMatch.index, "const/16 v$register, -0x2001")
        }

        // 3. Arc reader: disable Android 14+ registerScreenCaptureCallback
        run {
            val match = ArcActivityCaptureCallbackFingerprint.matchAll(0..1).firstOrNull()
            if (match != null) {
                val callMatch = match.instructionMatches.first()
                match.method.replaceInstruction(callMatch.index, "return-void")
            }
        }
    }
}
