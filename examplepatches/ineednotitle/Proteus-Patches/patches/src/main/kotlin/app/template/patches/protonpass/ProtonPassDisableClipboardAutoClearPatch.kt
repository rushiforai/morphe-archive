package app.template.patches.protonpass

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PROTON_PASS_COMPATIBILITY
import app.template.patches.shared.Constants.PROTON_PASS_FDROID_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters

private val ClearClipboardAfterFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/preferences/UserPreferences;",
    name = "getClearClipboardAfterValue",
    returnType = "I",
    parameters = emptyList(),
)

@Suppress("unused")
val protonPassDisableClipboardAutoClearPatch = bytecodePatch(
    name = "Disable clipboard auto-clear",
    description = "Forces the clipboard clear delay to Never so copied passwords and aliases are not removed automatically.",
    default = false,
) {
    compatibleWith(PROTON_PASS_COMPATIBILITY, PROTON_PASS_FDROID_COMPATIBILITY)

    execute {
        ClearClipboardAfterFingerprint.method.apply {
            ensureRegisters(1)
            clearBody()
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }
    }
}
