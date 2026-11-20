package app.morphe.patches.picsart

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val picsartHideTryProPatch = bytecodePatch(
    name = "Hide Try PRO button",
    description = "Removes the \"Try PRO\" pill from the home toolbar and the create tab.",
    default = false,
) {
    dependsOn(picsartBypassSignatureCheckPatch)
    compatibleWith(COMPATIBILITY_PICSART)

    execute {
        // shouldShowBadge(tab): suspend fun returning Boolean (boxed). Every caller
        // (home toolbar, toolbar manager, create flow) skips building the badge on false.
        // Fingerprint updated in 31.2.6: now anchored on "badge_home" string instead
        // of the obfuscated continuation class name.
        ShouldShowSubsBadgeFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """
        )
    }
}
