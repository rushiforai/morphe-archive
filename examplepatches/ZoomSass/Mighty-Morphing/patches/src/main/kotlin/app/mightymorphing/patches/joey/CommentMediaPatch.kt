package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.insertAt
import app.mightymorphing.patches.shared.writeBody
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val EXTENSION = "Lapp/mightymorphing/extension/joey/CommentMedia;"
private const val SETTINGS = "Lapp/mightymorphing/extension/joey/MorpheSettings;"

private const val COMMENT_HTML = """
    iget-object v0, p0, Ln9/k;->g:Lnet/dean/jraw/models/Comment;
    invoke-virtual {v0}, Lu7/d;->n()Lcom/fasterxml/jackson/databind/JsonNode;
    move-result-object v0
    const-string v1, "body_html"
    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/databind/JsonNode;->get(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;
    move-result-object v1
    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v1, v0}, $EXTENSION->html(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    return-object v1
"""

@Suppress("unused")
val commentMediaPatch = bytecodePatch(
    name = "Inline comment media",
    description = "Shows GIFs, pictures, subreddit emojis and reddit videos inline in the comments instead of as links. Tap to open. Extra settings to tweak in Joey - Settings - Morphe Settings.",
) {
    compatibleWith(JOEY)

    extendWith("extensions/extension.mpe")

    execute {
        // .locals 2 plus this.
        writeBody(CommentHtmlFingerprint.method, 3, COMMENT_HTML)

        // .locals 5, nothing live yet at the first instruction.
        val touch = CommentLinkTouchFingerprint.method
        touch.insertAt(
            0,
            """
            invoke-static {p1, p2, p3}, $EXTENSION->touch(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :media_skip
            instance-of v1, v0, Landroid/text/style/URLSpan;
            if-eqz v1, :media_consumed
            check-cast v0, Landroid/text/style/URLSpan;
            iget-object v1, p0, Lxa/n;->a:Lxa/a;
            invoke-virtual {v0}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;
            move-result-object v2
            invoke-interface {v1, v2, v0}, Lxa/a;->x(Ljava/lang/String;Landroid/text/style/URLSpan;)V
            :media_consumed
            const/4 v0, 0x1
            return v0
            """,
            ExternalLabel("media_skip", touch.instructions[0]),
        )

        CommentSetHtmlFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0, p1}, $EXTENSION->html(Landroid/widget/TextView;Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
            """,
        )

        val postGif = PostGifFingerprint.method
        postGif.insertAt(
            postGif.indexOfReference("setImageDrawable") + 1,
            """
            invoke-static {p0, v1}, $EXTENSION->holdGif(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
            """,
        )

        CommentSpannableFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0, p1}, $EXTENSION->bind(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;)V
            """,
        )

        // q3 is only a return. Inserting leaves that return in place, so other patches can add their own calls.
        SettingsHookFingerprint.method.insertAt(
            0,
            """
            invoke-static {}, $SETTINGS->enableMedia()V
            invoke-static {p0}, $SETTINGS->attach(Landroid/app/Activity;)V
            """,
        )
    }
}
