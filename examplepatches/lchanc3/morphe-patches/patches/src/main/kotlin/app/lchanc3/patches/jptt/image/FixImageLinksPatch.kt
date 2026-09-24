package app.lchanc3.patches.jptt.image

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_IMAGE_LINK_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val fixImageLinksPatch = bytecodePatch(
    name = "Fix image links",
    description = "Shows the picture for links an image host answers with a web page: " +
        "an imgur album or .mp4, an address missing the i. subdomain, a meee.com.tw " +
        "page. Only the preview and the full size image change, not the article text.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        // p1 is the task's varargs array, whose first element is the link to
        // resolve. Everything downstream reads it from there, and the article
        // text is carried separately, so rewriting the element in place changes
        // the picture without touching what is on screen.
        ArticleUrlDoInBackgroundFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, " +
                "$EXTENSION_IMAGE_LINK_CLASS->rewriteFirst([Ljava/lang/String;)V",
        )
    }
}
