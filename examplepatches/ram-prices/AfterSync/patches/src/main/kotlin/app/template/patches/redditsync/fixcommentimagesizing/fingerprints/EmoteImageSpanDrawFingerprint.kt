package app.template.patches.redditsync.fixcommentimagesizing.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lnb/c;->draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
 * ("EmoteImageSpan" per its source-file annotation, v23.06.30-13:39) — the ReplacementSpan
 * that draws every inline image/GIF embedded in a comment or post body (subreddit emotes,
 * preview.redd.it images, Giphy embeds). Draws the loaded Drawable by unconditionally
 * calling Drawable.setBounds(0, 0, s, t), where s/t are the span's fixed box width/height —
 * stretching any non-matching-aspect-ratio image to fill that box.
 */
val emoteImageSpanDrawFingerprint = fingerprint {
    returns("V")
    parameters(
        "Landroid/graphics/Canvas;",
        "Ljava/lang/CharSequence;",
        "I",
        "I",
        "F",
        "I",
        "I",
        "I",
        "Landroid/graphics/Paint;",
    )
    custom { method, classDef -> classDef.type == "Lnb/c;" && method.name == "draw" }
}
