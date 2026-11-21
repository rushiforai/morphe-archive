package app.badfella.patches.linkedin.navigation

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

/** HomeBottomNavFragment.onViewCreated(View, Bundle): the home screen with the search bar and its buttons. */
private object HomeViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/HomeBottomNavFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

@Suppress("unused")
val hideTopBarButtonsPatch = bytecodePatch(
    name = "Hide top bar buttons",
    description = "Lets you hide Post and Messaging in the Home top bar.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isTopBarButtonsIncluded")

        HomeViewCreatedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/HomeTopBar;->install(Landroid/view/View;)V"
        )
    }
}
