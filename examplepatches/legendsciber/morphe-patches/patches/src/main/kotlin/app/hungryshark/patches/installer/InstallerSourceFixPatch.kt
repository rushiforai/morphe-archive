package app.hungryshark.patches.installer

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.hungryshark.patches.shared.Constants.COMPATIBILITY_HUNGRYSHARK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val INSTALLER_PACKAGE_NAME = "com.android.vending"

@Suppress("unused")
val hungrySharkInstallerSourceFix = bytecodePatch(
    name = "Hungry Shark Installer Source Fix",
    description = "Spoofs the installer source as Google Play for every install-source check in the game and its SDKs, so sideloaded installs are treated as store installs and the Google Play Store redirect is fixed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HUNGRYSHARK)

    execute {
        val fingerprints = listOf(
            InstallerPackageNameFingerprint,
            InstallingPackageNameFingerprint,
            InitiatingPackageNameFingerprint,
        )
        for (fingerprint in fingerprints) {
            for (match in fingerprint.matchAll()) {
                val moveResultIndex = match.instructionMatches[0].index + 1
                val instruction = match.method.getInstruction(moveResultIndex)
                if (instruction.opcode != Opcode.MOVE_RESULT_OBJECT) {
                    continue
                }
                val register = (instruction as OneRegisterInstruction).registerA
                match.method.replaceInstruction(
                    moveResultIndex,
                    "const-string v$register, \"$INSTALLER_PACKAGE_NAME\"",
                )
            }
        }
    }
}
