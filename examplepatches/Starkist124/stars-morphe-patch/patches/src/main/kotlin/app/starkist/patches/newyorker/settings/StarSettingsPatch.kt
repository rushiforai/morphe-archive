package app.starkist.patches.newyorker.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.starkist.patches.shared.sharedExtensionPatch
import org.w3c.dom.Element

private const val HOOKS_CLASS = "Lapp/starkist/extension/newyorker/SettingsEntryHooks;"
private const val SETTINGS_ACTIVITY = "app.starkist.extension.settings.StarSettingsActivity"

/** Declares the Star settings screen in the app's manifest so it can be opened. */
private val starSettingsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            val activity = document.createElement("activity")
            activity.setAttribute("android:name", SETTINGS_ACTIVITY)
            activity.setAttribute("android:exported", "false")
            application.appendChild(activity)
        }
    }
}

/**
 * Adds a "Star settings" row under Display Settings in the app's Settings screen.
 * Patches with options of their own depend on this one.
 */
val starSettingsPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch, starSettingsManifestPatch)

    execute {
        // p1 is the list of rows about to be shown; swap it for the list with our row added.
        SettingsListCollectorFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $HOOKS_CLASS->addSettingsEntry(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
            """
        )

        // p1 is the tapped row. If it's ours, open Star settings and skip the app's handling.
        // This method has many registers, so p1 is above v15 and needs the /range form of invoke.
        SettingsRowClickFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $HOOKS_CLASS->onSettingsRowClicked(Landroid/view/View;)Z
                    move-result v0
                    if-eqz v0, :star_continue
                    return-void
                """,
                ExternalLabel("star_continue", getInstruction(0))
            )
        }
    }
}
