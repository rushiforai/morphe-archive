package app.template.patches.protonpass

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PROTON_PASS_COMPATIBILITY
import app.template.patches.shared.Constants.PROTON_PASS_FDROID_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode

private val SetSecureModeFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/commonui/api/ActivitySecureModeKt;",
    name = "setSecureMode",
    returnType = "V",
    parameters = listOf(
        "Landroidx/fragment/app/FragmentActivity;",
        "Lproton/android/pass/preferences/AllowScreenshotsPreference;",
    ),
)

@Suppress("unused")
val protonPassAllowScreenshotsPatch = bytecodePatch(
    name = "Allow screenshots",
    description = "Removes FLAG_SECURE from Proton Pass activities, allowing screenshots and screen recording.",
    default = false,
) {
    compatibleWith(PROTON_PASS_COMPATIBILITY, PROTON_PASS_FDROID_COMPATIBILITY)

    execute {
        val method = SetSecureModeFingerprint.method
        val instructions = method.implementation?.instructions
            ?: throw PatchException("Proton Pass setSecureMode has no implementation")

        val moveResultIndex = instructions.indexOfFirst { it.opcode == Opcode.MOVE_RESULT }
        if (moveResultIndex < 0) {
            throw PatchException("Could not find AllowScreenshotsPreference value result in setSecureMode")
        }

        method.addInstructions(moveResultIndex + 1, "const/4 p1, 0x1")
    }
}
