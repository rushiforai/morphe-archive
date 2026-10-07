package app.linkedin.patches.links

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/OpenLinksDirectlyPatch;"

/** NavigateToUrlActionViewData(Uri, UrlNavigationType, LegacyFeedUrlTrackingData, boolean, IntStack). */
private object NavigateToUrlActionFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/sdui/viewdata/action/NavigateToUrlActionViewData;",
    name = "<init>",
    parameters = listOf("Landroid/net/Uri;", "L", "L", "Z", "L"),
)

/** RichTextUtils.getLinkShimmingLink(String): wraps chat links in linkedin.com/safety/go. */
private object MessagingLinkShimFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/messaging/util/RichTextUtils;",
    name = "getLinkShimmingLink",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
)

@Suppress("unused")
val openLinksDirectlyPatch = bytecodePatch(
    name = "Open links directly",
    description = "Opens external links without LinkedIn's safety/go warning page.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isOpenLinksDirectlyIncluded")

        // Replace the Uri parameter before the constructor stores it. Range form because p1 can be above v15.
        NavigateToUrlActionFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->unwrap(Landroid/net/Uri;)Landroid/net/Uri;
                move-result-object p1
            """
        )

        MessagingLinkShimFingerprint.method.apply {
            // Static method: p0 is the link. At method entry every local register is free.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS->skipMessagingShim()Z
                    move-result v0
                    if-eqz v0, :shim
                    return-object p0
                """,
                ExternalLabel("shim", getInstruction(0))
            )
        }
    }
}
