package app.fakh.patches.linkedin.navigation

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

private const val TAB_CLASS = "Lcom/linkedin/android/home/bottomnav/SlimNotificationBadge;"

/** SlimNotificationBadge.setIconDrawable(int), which puts the icon on a navigation bar tab. */
private object SetTabIconFingerprint : Fingerprint(
    definingClass = TAB_CLASS,
    name = "setIconDrawable",
    returnType = "V",
    parameters = listOf("I"),
)

@Suppress("unused")
val materialNavigationIconsPatch = patch(
    name = "Material icons in the navigation bar",
    description = "Material icons for the navigation bar tabs. Adds a switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Theme")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isMaterialTabIconsIncluded")

        SetTabIconFingerprint.method.apply {
            // The app reads the id back when the tab is redrawn, so it is stored even when the extension draws the icon.
            if (SetTabIconFingerprint.classDef.fields.none { it.name == "iconDrawableId" && it.type == "I" }) {
                throw PatchException("SlimNotificationBadge.iconDrawableId not found")
            }
            // At method entry p0 and p1 are untouched and v0 is free.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p1 }, $EXTENSION_PACKAGE/NavigationBar;->setTabIcon(Landroid/view/View;I)Z
                    move-result v0
                    if-eqz v0, :stock
                    iput p1, p0, $TAB_CLASS->iconDrawableId:I
                    return-void
                """,
                ExternalLabel("stock", getInstruction(0)),
            )
        }
    }
}
