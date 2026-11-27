package app.template.patches.redditsync.fixpostbodyimages

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.fixpostbodyimages.fingerprints.postCommentHolderBindFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Per explicit report: images embedded directly in a post's own body (selftext) — as
 * opposed to a comment — render as completely blank boxes, not a fallback link, not a
 * distorted image, just empty space.
 *
 * Confirmed by hand via apktool: post bodies and comment bodies both render through the
 * exact same HTML→Spanned pipeline, SyncHtmlToSpannedConverter (Lnc/d;->e(...), already
 * patched by fixCommentImageSizingPatch (formerly two separate patches, since merged)), driven by an Lnc/a;
 * ("Options.java") object that carries an available-width field (Lnc/a;->e:I, set via the
 * builder method Lnc/a;->d(I)Lnc/a;) that Lnc/d;->e(...) gates all image rendering on
 * (`if-lez` on that field rejects any image when it's `<= 0`).
 *
 * CommentsHtmlTextView.J(Lxa/d;Ljava/lang/String;)V — the working reference implementation
 * that renders a comment's body — always computes a real available width (screen width via
 * Lt7/y0;->b()I, minus the parent container's and the TextView's own left/right padding)
 * and calls Lnc/a;->d(I) with it before rendering.
 *
 * PostCommentHolder.h(Lxa/d;I)V — the RecyclerView view holder that renders a post's own
 * body the same way — builds its own Lnc/a; and calls Lnc/a;->e(Lxa/d;)Lnc/a; (the post
 * reference) but never calls Lnc/a;->d(I)Lnc/a; at all. That field then keeps Java/Dalvik's
 * default int value of 0, permanently failing the `if-lez` gate for every post body,
 * regardless of what the image itself is — confirmed NOT a regression from any patch in
 * this project; this branch has been unreachable for post bodies both before and after
 * every other change here.
 *
 * This patch inserts the same width computation CommentsHtmlTextView.J() already does,
 * anchored right after PostCommentHolder.h()'s own `Lnc/a;->e(Lxa/d;)Lnc/a;` call (unique
 * in this method) — using the "content" HtmlTextView field (already loaded into a register
 * at that point to receive the final render call) in place of the "this" TextView reference
 * CommentsHtmlTextView.J() uses, since here the holder itself isn't a View.
 */
val fixPostBodyImagesPatch = bytecodePatch(
    name = "Fix blank images in post bodies",
    description = "Fixes images embedded directly in a post's own body (not a comment) " +
        "showing as blank boxes in Sync for Reddit, by giving that render path the " +
        "available-width value it was never being given.",
    default = true,
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        val method = postCommentHolderBindFingerprint.method
        val implementation = method.implementation!!

        val setPostIndex = implementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == "Lnc/a;" && it.name == "e" && it.returnType == "Lnc/a;"
                } == true
        }

        if (setPostIndex == -1) {
            error(
                "Could not find the \"Lnc/a;->e(Lxa/d;)Lnc/a;\" call that attaches the post " +
                    "to its render-options object in PostCommentHolder.h(). This build's " +
                    "method structure may differ from what was inspected — re-check with " +
                    "apktool.",
            )
        }

        // The options object is in p1 right after the move-result-object that follows the
        // anchor call (setPostIndex + 1); the "content" HtmlTextView field is already in p2
        // at this point (loaded a few instructions earlier to receive the final render
        // call). v0/v1 (this method's only 2 locals) are free to clobber here: the
        // original code overwrites v0 with an unrelated value on the very next instruction
        // and never reads v1 again until this point, matching CommentsHtmlTextView.J()'s
        // own width computation register-for-register, just with p2 standing in for "this".
        method.addInstructions(
            setPostIndex + 2,
            """
                invoke-static {}, Lt7/y0;->b()I
                move-result v0

                invoke-virtual {p2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
                move-result-object v1
                check-cast v1, Landroid/view/View;
                invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I
                move-result v1
                sub-int/2addr v0, v1

                invoke-virtual {p2}, Landroid/widget/TextView;->getPaddingLeft()I
                move-result v1
                sub-int/2addr v0, v1

                invoke-virtual {p2}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
                move-result-object v1
                check-cast v1, Landroid/view/View;
                invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I
                move-result v1
                sub-int/2addr v0, v1

                invoke-virtual {p2}, Landroid/widget/TextView;->getPaddingRight()I
                move-result v1
                sub-int/2addr v0, v1

                invoke-virtual {p1, v0}, Lnc/a;->d(I)Lnc/a;
            """,
        )
    }
}
