package app.smartlife.patches.smartlife.ai

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.smartlife.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.smartlife.patches.smartlife.shared.config.configOverridePatch
import app.smartlife.patches.smartlife.shared.config.packConfigHookCount
import app.smartlife.patches.smartlife.shared.localRegisterCount
import app.smartlife.patches.smartlife.shared.logWarning
import app.smartlife.patches.smartlife.shared.matchAllLogged
import app.smartlife.patches.smartlife.shared.signature

private const val EXTENSION_CLASS = "Lapp/smartlife/extension/SmartLifeSettings;"

@Suppress("unused")
val hideAiPatch = bytecodePatch(
    name = "Hide AI assistant",
    description = "Hides the \"Hey Tuya\" AI assistant added in app 7.0 (the AI bar on the home " +
        "and smart tabs, the device-panel floating ball, the launcher shortcut and the other " +
        "entry points). This is a runtime toggle: it can be turned on and off in the in-app " +
        "\"SmartLife Patches\" settings screen (long-press the settings button in the profile " +
        "tab, or the Settings screen toolbar). Hidden by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE)

    // Primary: ConfigOverrides answers is_ai_assistant_support (and the nav / deep-pull flags)
    // with false while the toggle is on, at the flag getter itself. That covers every reader,
    // including copies of the AI check that R8 inlines elsewhere. It also brings in
    // spoofSignaturePatch, which installs the extension and captures the app context.
    dependsOn(configOverridePatch)

    execute {
        // Backup: gate every copy of the AI-enabled check (7.12.6 has two identical copies,
        // xdh.g() and AIAssistantEnableServiceImpl.o0(); patching only the first one is what
        // left the AI bar visible in v1.1.0).
        var gated = 0
        matchAllLogged(AiEnableCheckFingerprint, "AI-enabled check").forEach { match ->
            val method = match.method
            if (localRegisterCount(method) < 1) {
                logWarning("AI-enabled check ${method.signature}: no free register, not gated")
                return@forEach
            }
            method.addInstructionsWithLabels(
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
            gated++
        }

        if (gated == 0 && packConfigHookCount == 0) {
            throw PatchException(
                "Hide AI assistant: neither the AI-enabled check nor the PackConfig flag getter " +
                    "was found, so the AI assistant cannot be hidden on this app version"
            )
        }
        if (gated == 0) {
            logWarning("AI-enabled check not found; relying on the PackConfig flag override only")
        }
    }
}
