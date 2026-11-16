package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val UNDELETE = "Lapp/mightymorphing/extension/joey/Undelete;"
private const val SETTINGS = "Lapp/mightymorphing/extension/joey/MorpheSettings;"

/** The comment row's text. It builds the HTML with W() and hands it to Joey's HtmlDispaly. */
private object CommentBodyFingerprint : Fingerprint(
    definingClass = "Ln9/k;",
    name = "D",
    returnType = "V",
    parameters = listOf(),
)

/** The post card's text. jc.l.b(e) is true only for the full text at the top of the comments screen. */
private object PostBodyFingerprint : Fingerprint(
    definingClass = "Ljc/d;",
    name = "D",
    returnType = "V",
    parameters = listOf(),
)

/**
 * HtmlDispaly.s: picks up to four links in a comment or post for Joey's link preview cards.
 * The restore button is a link too, so without this it got a card that could never load.
 */
private object LinkPreviewPickFingerprint : Fingerprint(
    definingClass = "Lo/o/joey/CustomViews/HtmlDispaly;",
    name = "s",
    returnType = "V",
    parameters = listOf("Lorg/jsoup/nodes/f;", "Lig/d;"),
)

@Suppress("unused")
val undeletePatch = bytecodePatch(
    name = "Arctic Shift restore",
    description = "[v1.4.5: Link preview fix.] Removed and deleted comments, and removed posts on the comments screen, get an Arctic Shift Restore button that brings back the archived text. Nothing is fetched until you tap it. Works with Modern UI or Classic. Turn it on in Joey Settings - Morphe Settings. Initial release, please report any issues or suggestions for improvements.",
) {
    compatibleWith(JOEY)

    extendWith("extensions/extension.mpe")

    execute {
        // After W() returns the comment's HTML (v1). v2 is free until Joey's next sget.
        // Hooked here, not in W(), because Inline comment media replaces W() entirely.
        val comment = CommentBodyFingerprint.method
        val built = comment.indexOfReference("Ln9/k;->W()Ljava/lang/String;")
        comment.insertAt(
            built + 2,
            """
            iget-object v2, p0, Ln9/k;->g:Lnet/dean/jraw/models/Comment;
            invoke-static {v2, v1}, $UNDELETE->comment(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            """,
        )

        // A comment whose author and text are both [deleted] (deleted by its author) skips W():
        // Joey shows its own "[deleted]" label instead. That label (v1, after getString) gets the
        // same treatment. v2 is free here too.
        val label = comment.indexOfReference("Landroid/content/Context;->getString(I)Ljava/lang/String;")
        comment.insertAt(
            label + 2,
            """
            iget-object v2, p0, Ln9/k;->g:Lnet/dean/jraw/models/Comment;
            invoke-static {v2, v1}, $UNDELETE->comment(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v1
            """,
        )

        // Comments screen only. When the post was removed, the extension shows the restore link
        // in the post's text view and Joey's own text is skipped. v0 and v1 are free at the start.
        val post = PostBodyFingerprint.method
        post.insertAt(
            0,
            """
            iget-object v0, p0, Ljc/d;->e:Ljc/l;
            invoke-static {v0}, Ljc/l;->b(Ljc/l;)Z
            move-result v0
            if-eqz v0, :undelete_post_joey
            iget-object v0, p0, Ljc/d;->b:Lnet/dean/jraw/models/Submission;
            iget-object v1, p0, Ljc/d;->f:Lx8/f0;
            iget-object v1, v1, Lx8/f0;->e:Lo/o/joey/CustomViews/HtmlDispaly;
            invoke-static {v0, v1}, $UNDELETE->post(Ljava/lang/Object;Landroid/view/View;)Z
            move-result v0
            if-eqz v0, :undelete_post_joey
            return-void
            """,
            ExternalLabel("undelete_post_joey", post.instructions[0]),
        )

        // Joey's link touch handler. Only taps on the restore link are taken; .locals 5, nothing
        // live yet. Inline comment media adds its own check here too, in either order.
        val touch = CommentLinkTouchFingerprint.method
        touch.insertAt(
            0,
            """
            invoke-static {p1, p2, p3}, $UNDELETE->touch(Landroid/widget/TextView;Landroid/text/Spannable;Landroid/view/MotionEvent;)Z
            move-result v0
            if-eqz v0, :undelete_touch_joey
            const/4 v0, 0x1
            return v0
            """,
            ExternalLabel("undelete_touch_joey", touch.instructions[0]),
        )

        // The restore link becomes a small button once Joey has built the text. Inline comment
        // media adds its own call here too, in either order.
        CommentSpannableFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0, p1}, $UNDELETE->chips(Landroid/widget/TextView;Landroid/text/SpannableStringBuilder;)V
            """,
        )

        // Link previews: the restore link's href (v4) reads as empty, which Joey already skips.
        // v5 is set straight after, so nothing else is disturbed.
        val pick = LinkPreviewPickFingerprint.method
        val href = pick.indexOfReference("Lorg/jsoup/nodes/p;->a(Ljava/lang/String;)Ljava/lang/String;")
        pick.insertAt(
            href + 2,
            """
            invoke-static {v4}, $UNDELETE->previewHref(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v4
            """,
        )

        // Morphe Settings row and the Removed content card.
        SettingsHookFingerprint.method.insertAt(
            0,
            """
            invoke-static {}, $SETTINGS->enableUndelete()V
            invoke-static {p0}, $SETTINGS->attach(Landroid/app/Activity;)V
            """,
        )
    }
}
