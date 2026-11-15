package app.drbushytop.patches.relay.media

import app.drbushytop.patches.relay.Relay
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel

internal const val REDDIT_MEDIA_CLASS = "Lapp/drbushytop/extension/relay/RedditMedia;"

@Suppress("unused")
val openRedditImagesInViewerPatch = bytecodePatch(
    name = "Open Reddit images in the image viewer",
    description = "Opens i.redd.it and preview.redd.it images (.jpeg, .webp, ...) in Relay's " +
        "image viewer. Relay only recognised .jpg and .png, so these went to the browser, " +
        "which Reddit now redirects to the comment thread. Also plays Reddit's MP4 copies of " +
        "GIFs in Relay's video player.",
    default = true,
) {
    compatibleWith(*Relay.compatibility)
    extendWith(Relay.EXTENSION)

    execute {
        IsPlainImageUrlFingerprint.method.returnEarlyIf("isRedditImage")
        IsVideoFileUrlFingerprint.method.returnEarlyIf("isRedditVideo")
    }
}

/**
 * Makes one of Relay's `MediaUrlFetcher#X(HttpUrl)` predicates also answer true when
 * `RedditMedia#[check](url)` does.
 */
private fun MutableMethod.returnEarlyIf(check: String) {
    // p1 is an okhttp3.HttpUrl. Only Object#toString is called on it, so the injected code
    // survives Patcheddit relocating Relay's OkHttp classes to its private copy.
    // v0 is the method's first local, unused before the original code runs.
    addInstructionsWithLabels(
        0,
        """
            invoke-virtual { p1 }, Ljava/lang/Object;->toString()Ljava/lang/String;
            move-result-object v0
            invoke-static { v0 }, $REDDIT_MEDIA_CLASS->$check(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :original
            return v0
        """,
        ExternalLabel("original", getInstruction(0)),
    )
}
