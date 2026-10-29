package app.smartlife.patches.smartlife.ai

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.smartlife.patches.smartlife.misc.fix.signature.spoofSignaturePatch
import app.smartlife.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE

private const val EXTENSION_CLASS = "Lapp/smartlife/extension/SmartLifeSettings;"

@Suppress("unused")
val hideAiPatch = bytecodePatch(
    name = "Hide AI assistant",
    description = "Hides the \"Hey Tuya\" AI assistant added in app 7.0 (the home AI bar, the " +
        "device-panel floating ball and the B2-gated entry points). This is a runtime toggle: " +
        "it can be turned on and off in the in-app \"SmartLife Patches\" settings screen " +
        "(long-press the settings button in the profile tab, or the Settings screen toolbar). " +
        "Hidden by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE)

    // spoofSignaturePatch installs the extension and captures the app context (needed to read
    // the toggle from SharedPreferences) via the Application it reparents.
    dependsOn(spoofSignaturePatch)

    execute {
        // At the top of the AI-enabled check: if the toggle says hide, report "not supported".
        AiEnableCheckFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->hideAiAssistant()Z
                move-result v0
                if-eqz v0, :show_ai
                const/4 v0, 0x0
                return v0
                :show_ai
                nop
            """,
        )
    }
}
