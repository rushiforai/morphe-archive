package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.settingsPatch
import app.fakh.patches.shared.gms.mutableClass
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

/** LinkedIn's Application. */
private const val APPLICATION = "Lcom/linkedin/android/app/FlagshipApplication;"

@Suppress("unused")
val copyTextPatch = bytecodePatch(
    name = "Copy text",
    description = "Press and hold a post, comment or any other text to open it in a sheet where it can be " +
        "selected and copied.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isCopyTextIncluded")

        // Starts watching the touches of every activity, from the moment the app starts.
        mutableClass(APPLICATION).methods.first { it.name == "attachBaseContext" }.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/CopyText;->attach(Landroid/content/Context;)V"
        )
    }
}
