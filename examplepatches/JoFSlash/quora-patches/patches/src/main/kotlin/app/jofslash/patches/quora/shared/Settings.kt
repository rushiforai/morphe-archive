package app.jofslash.patches.quora.shared

import app.jofslash.patches.quora.tabs.SetupTabsFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext

internal const val SETTINGS_CLASS = "Lapp/jofslash/extension/quora/PatchSettings;"

/**
 * Lists a native patch in the Patch settings dialog from the moment the tab bar is set up.
 * The patch's extension code checks the same [key] with PatchSettings.on.
 */
internal fun BytecodePatchContext.registerSetting(key: String, name: String) {
    // v0 and v1 are free at the start of setupTabs.
    SetupTabsFingerprint.method.addInstructions(
        0,
        """
            const-string v0, "$key"
            const-string v1, "$name"
            invoke-static { v0, v1 }, $SETTINGS_CLASS->register(Ljava/lang/String;Ljava/lang/String;)V
        """
    )
}
