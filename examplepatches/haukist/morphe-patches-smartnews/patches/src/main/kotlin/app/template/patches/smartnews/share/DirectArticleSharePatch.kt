package app.template.patches.smartnews.share

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SMARTNEWS

@Suppress("unused")
val directArticleSharePatch = bytecodePatch(
    name = "Direct article share URL",
    description = "Shares and copies the original article URL directly instead of SmartNews tracking redirect links (l.smartnews.com).",
    default = true
) {
    compatibleWith(COMPATIBILITY_SMARTNEWS)

    execute {
        // Force p3 (enableDynamicLinks) to false (0x0).
        // Since p3 is register v20 (> v15), const/16 must be used instead of const/4.
        // This causes LinkShareActionControllerFactory to pass null for ArticleDynamicLinksCreator,
        // activating the built-in fallback path that uses the original article URL directly.
        CreateLinkShareActionControllerFingerprint.method.addInstruction(0, "const/16 p3, 0x0")
    }
}
