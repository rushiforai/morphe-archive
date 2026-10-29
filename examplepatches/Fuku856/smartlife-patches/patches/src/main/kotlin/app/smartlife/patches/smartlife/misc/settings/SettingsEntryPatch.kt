package app.smartlife.patches.smartlife.misc.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.smartlife.patches.smartlife.misc.fix.signature.spoofSignaturePatch
import app.smartlife.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/smartlife/extension/SmartLifeSettingsScreen;"

@Suppress("unused")
val settingsEntryPatch = bytecodePatch(
    name = "SmartLife Patches settings",
    description = "Adds two ways to open the in-app \"SmartLife Patches\" settings screen: " +
        "long-press the settings button at the top of the profile tab, or long-press the " +
        "toolbar of the app's Settings screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE)

    // Provides the extension and the captured app context.
    dependsOn(spoofSignaturePatch)

    execute {
        // Entry 1: long-press the settings button in the profile tab.
        ProfileSettingsCellFingerprint.let { fingerprint ->
            val clickIndex = fingerprint.instructionMatches[1].index
            val viewRegister = fingerprint.method
                .getInstruction<FiveRegisterInstruction>(clickIndex).registerC
            fingerprint.method.addInstruction(
                clickIndex + 1,
                "invoke-static { v$viewRegister }, " +
                    "$EXTENSION_CLASS->attachSettingsLongPress(Landroid/view/View;)V",
            )
        }

        // Entry 2: long-press the toolbar of the in-app Settings screen.
        SettingActivityToolbarFingerprint.let { fingerprint ->
            val getToolbarIndex = fingerprint.instructionMatches[0].index
            val moveResultIndex = getToolbarIndex + 1
            val toolbarRegister = fingerprint.method
                .getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
            fingerprint.method.addInstruction(
                moveResultIndex + 1,
                "invoke-static { v$toolbarRegister }, " +
                    "$EXTENSION_CLASS->attachSettingsLongPress(Landroid/view/View;)V",
            )
        }
    }
}
