package app.template.patches.redditsync.centerpostmedia

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.redditsync.centerpostmedia.fingerprints.commentsHtmlTextViewRenderFingerprint
import app.template.patches.redditsync.centerpostmedia.fingerprints.htmlTextViewRenderFingerprint
import app.template.patches.redditsync.centerpostmedia.fingerprints.optionsSetPostFingerprint
import app.template.patches.redditsync.centerpostmedia.fingerprints.spannableBuilderAddSpanFingerprint
import app.template.patches.redditsync.fixcommentimagesizing.fixCommentImageSizingPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Per explicit request: media embedded in a post's own body should always be centered
 * horizontally; media in comments should stay left-aligned as it already is.
 *
 * The HTML→Spanned pipeline (SyncHtmlToSpannedConverter, patched extensively by
 * fixCommentImageSizingPatch/fixCommentImageDimensionsPatch) is shared
 * between posts and comments and has no notion of "which screen is this for" threaded through
 * its internals — deliberately not touched here, both because it's already proven fragile to
 * new branches (see feedback in fixCommentImageSizingPatch.kt's item 0 history) and because it doesn't
 * need to be: every image/GIF/video span this pipeline creates gets queued (not yet applied)
 * on a Loc/c; ("SpannableTextViewStringBuilder") builder object via Loc/c;->s(...), and that
 * queue is only actually applied — via Loc/c;->d(), called from Loc/b;->F() — AFTER the whole
 * HTML parse finishes. That gap, entirely outside the parser, is where this patch adds
 * centering: once parsing is done, walk the already-built queue, find every entry whose span
 * is one of the app's media span types, and queue an additional AlignmentSpan.Standard(CENTER)
 * over that same [start, end) range.
 *
 * EXCEPT for Lnb/c; (EmoteImageSpan, images/GIFs — the actual case people tap): AlignmentSpan
 * turned out to break tap detection for centered images. Confirmed by hand from
 * Loc/b;->onTouchEvent (the shared touch handler EVERY clickable span in the app goes
 * through): it maps a tap's raw X to a line/character offset (Layout.getOffsetForHorizontal,
 * which IS alignment-aware), then sanity-checks that X against [0, Layout.getLineWidth(line)]
 * — silently assuming the line's visible content starts at X=0, i.e. that it's left-aligned.
 * AlignmentSpan.CENTER makes that assumption false: the actual content starts at
 * Layout.getLineLeft(line), not 0. The result, confirmed on a real device: taps on the
 * now-centered image itself land outside that assumed window and get rejected, while taps in
 * the empty space to its LEFT fall inside the window and get clamped by
 * getOffsetForHorizontal to the image's own character offset — so the whole clickable area is
 * shifted left of the actual, visible image.
 *
 * Fixing onTouchEvent itself was considered and rejected: it declares only 8 registers
 * (.locals 8) and every single one is already live across the span where a fix would need to
 * read Layout.getLineLeft(...), so a real fix means fully rebuilding a method used by every
 * clickable span in the entire app (comments, settings links, everything) — far more blast
 * radius than this feature justifies.
 *
 * Instead, images are centered a completely different way that never touches line alignment
 * at all: Lnb/c; gets a new `centerWidth` field (set via `Lnb/c;->setCenterWidth(Lnb/c;I)V`,
 * added by fixCommentImageSizingPatch.kt, hence the dependsOn below) that makes its
 * getSize() report a box as wide as the whole available column instead of the image's own
 * tight-fit size, while `w4` (the existing letterbox helper, also in
 * fixCommentImageSizingPatch.kt) draws the actual image horizontally centered WITHIN that
 * wider box rather than anchored to its top-left corner. Since the reported box width now
 * genuinely matches the line's real content width, Layout.getLineWidth/getLineLeft and
 * onTouchEvent's existing (unmodified) left-aligned assumption are both simply correct again —
 * no branch, no register, no risk added to that shared method at all. The other 5 media span
 * types (Lnb/b;/Lnb/d;/Lnb/f;/Lnb/g;/Lnb/h;) still use the AlignmentSpan approach and would
 * have the same tap-zone bug if centered — none of them implement Lnb/a; (the click interface)
 * directly, but several pair with an Lmb/d; sibling span the same way images do, so this is a
 * known gap, not a guarantee they're unaffected — just out of scope for now since none of them
 * are what people actually tap on inline post media.
 *
 * The flag that makes this post-only is inverted from what you'd first reach for: a boolean
 * field on Lnc/a; ("Options.java", the render-options object every render builds) called
 * isComment, defaulting to false and set true ONLY by CommentsHtmlTextView.J() (a comment's
 * own body render) — NOT a field set true by posts. Centering triggers whenever isComment is
 * false.
 *
 * A first version did it the "obvious" way — an isPost field set true by
 * PostCommentHolder.h() (a post's own body render) — and centering triggered when isPost was
 * true. That version compiled, applied without any error, and even ran (maybeCenterMediaSpans
 * itself fired reliably) — but isPost read back as false 100% of the time on a real device,
 * and diagnostic checkpoint logging (literally the first instruction in
 * PostCommentHolder.h(), and another right after the setter call) never logged at all, on
 * several separate real-device tests, despite fixPostBodyImagesPatch's own unrelated edit to
 * that exact same method being confirmed working. The root cause was never conclusively
 * pinned down. Rather than keep guessing at bytecode-level interactions with that specific
 * method, this version avoids touching PostCommentHolder.h() (and needing any dependsOn
 * relationship with fixPostBodyImagesPatch) entirely — CommentsHtmlTextView.J() is untouched
 * by any other patch in this project, has a generous 6-register budget (vs.
 * PostCommentHolder.h()'s tight 2), and posts get centering "for free" simply by never
 * setting the new field at all, since its default value is exactly what's needed.
 *
 * Implementation notes on where each remaining piece lives, and why:
 * - The centering LOGIC (a loop + several instanceof checks + a conditional queue-add) is a
 *   brand-new STATIC method added to Loc/c; itself (`maybeCenterMediaSpans(Loc/c;Lnc/a;)V`,
 *   taking the builder as an explicit first param rather than as an instance method's
 *   implicit "this"), built from scratch via ImmutableMethod/ImmutableMethodImplementation
 *   rather than spliced into any existing method — per the hard lesson from the two
 *   verifier crashes documented in fixCommentImageSizingPatch.kt's item 0 (formerly a
 *   separate fixPreviewImagesPatch.kt, since merged): a new branch/loop is
 *   only safe inside a method with its own fresh register types, never spliced into
 *   pre-optimized existing code. It's added to Loc/c; specifically (not some unrelated
 *   class) so it can freely `iget`/`iput` Loc/c$a;'s fields exactly like Loc/c;'s own
 *   existing methods already do — legal only because it's compiled as part of the same
 *   class. Static, like every other from-scratch helper in this project: a plain public
 *   instance method belongs in dexlib2's virtualMethods, not directMethods (dex's "direct"
 *   category is only for static/private/constructor methods) — adding one to directMethods
 *   (as a first attempt here did) corrupts the dex file badly enough that ART refuses to load
 *   ANY class from it at all ("Direct/virtual method ... not in expected list"), confirmed via
 *   a real device crash log showing the whole app failing to even instantiate its Application
 *   class.
 * - The call site inside HtmlTextView.H(Lnc/a;Ljava/lang/String;)V (an existing method) is
 *   two straight-line instructions with zero new branches: read the new boolean field, then
 *   unconditionally call the helper — inserted between the existing parse call and the
 *   existing finalize call.
 * - The call site inside CommentsHtmlTextView.J(Lxa/d;Ljava/lang/String;)V that flips the new
 *   field to true is anchored on Lnc/a;'s constructor call (unique in that method).
 */
val centerPostMediaPatch = bytecodePatch(
    name = "Center media in posts",
    description = "Centers images, GIFs, and videos embedded in a post's own body " +
        "horizontally. Media in comments stays left-aligned.",
    default = true,
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))
    dependsOn(fixCommentImageSizingPatch)

    execute {
        // 1. Add the new "is this render for a comment?" field + builder-style setter to
        // Lnc/a;. Deliberately inverted from "isPost" — see the class doc for why.
        val optionsClass = optionsSetPostFingerprint.classDef
        optionsClass.instanceFields.add(
            MutableField(
                ImmutableField(
                    "Lnc/a;",
                    "isComment",
                    "Z",
                    AccessFlags.PUBLIC.value,
                    null,
                    emptySet(),
                    null,
                ),
            ),
        )

        // Static, taking the Lnc/a; receiver as an explicit first param — see the class doc
        // for the direct/virtual reasoning. 2 registers = 0 locals + 2 params.
        val setIsCommentDefinition = ImmutableMethod(
            "Lnc/a;",
            "setComment",
            listOf(
                ImmutableMethodParameter("Lnc/a;", emptySet(), "options"),
                ImmutableMethodParameter("Z", emptySet(), "isComment"),
            ),
            "Lnc/a;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList()),
        )
        val setIsComment = MutableMethod(setIsCommentDefinition)
        setIsComment.addInstructions(
            """
                iput-boolean p1, p0, Lnc/a;->isComment:Z
                return-object p0
            """,
        )
        optionsClass.directMethods.add(setIsComment)

        // 2. Add the centering-logic helper to Loc/c;, reusing its existing span-queuing
        // method (s(Ljava/lang/Object;III)V) and its existing span queue (field "b").
        val builderClass = spannableBuilderAddSpanFingerprint.classDef

        // 11 registers = 9 locals (v0-v8) + 2 params (the builder, the options object) —
        // takes the whole Lnc/a; object (rather than a plain boolean) specifically so the
        // call site inside HtmlTextView.H() (which only declares .locals 1) never needs a
        // second scratch register: it just forwards its own untouched Lnc/a; parameter
        // unchanged.
        val centerHelperImpl = ImmutableMethodImplementation(11, emptyList(), emptyList(), emptyList())
        val centerHelperDefinition = ImmutableMethod(
            "Loc/c;",
            "maybeCenterMediaSpans",
            listOf(
                ImmutableMethodParameter("Loc/c;", emptySet(), "builder"),
                ImmutableMethodParameter("Lnc/a;", emptySet(), "options"),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            centerHelperImpl,
        )
        val centerHelper = MutableMethod(centerHelperDefinition)
        centerHelper.addInstructions(
            """
                iget-boolean v0, p1, Lnc/a;->isComment:Z
                if-nez v0, :done

                iget-object v0, p0, Loc/c;->b:Ljava/util/ArrayList;
                invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
                move-result v1
                const/4 v2, 0x0

                :loop
                if-ge v2, v1, :done

                invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
                move-result-object v3
                check-cast v3, Loc/c${'$'}a;

                iget-object v4, v3, Loc/c${'$'}a;->d:Ljava/lang/Object;

                instance-of v5, v4, Lnb/c;
                if-nez v5, :is_image

                instance-of v5, v4, Lnb/b;
                if-nez v5, :is_media
                instance-of v5, v4, Lnb/d;
                if-nez v5, :is_media
                instance-of v5, v4, Lnb/f;
                if-nez v5, :is_media
                instance-of v5, v4, Lnb/g;
                if-nez v5, :is_media
                instance-of v5, v4, Lnb/h;
                if-eqz v5, :next

                :is_media
                new-instance v5, Landroid/text/style/AlignmentSpan${'$'}Standard;
                sget-object v6, Landroid/text/Layout${'$'}Alignment;->ALIGN_CENTER:Landroid/text/Layout${'$'}Alignment;
                invoke-direct {v5, v6}, Landroid/text/style/AlignmentSpan${'$'}Standard;-><init>(Landroid/text/Layout${'$'}Alignment;)V

                iget v6, v3, Loc/c${'$'}a;->a:I
                iget v7, v3, Loc/c${'$'}a;->b:I
                iget v8, v3, Loc/c${'$'}a;->c:I

                invoke-virtual {p0, v5, v6, v7, v8}, Loc/c;->s(Ljava/lang/Object;III)V
                goto :next

                :is_image
                check-cast v4, Lnb/c;
                iget v5, p1, Lnc/a;->e:I
                invoke-static {v4, v5}, Lnb/c;->setCenterWidth(Lnb/c;I)V

                :next
                add-int/lit8 v2, v2, 0x1
                goto :loop

                :done
                return-void
            """,
        )
        builderClass.directMethods.add(centerHelper)

        // 3. Wire it into HtmlTextView.H(...): call the helper unconditionally between the
        // existing parse call and the existing finalize call — no new branches added to
        // this existing method at all (the branch on isComment lives inside the helper).
        val renderMethod = htmlTextViewRenderFingerprint.method
        val renderImplementation = renderMethod.implementation!!

        val parseCallIndex = renderImplementation.instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference.let {
                (it as? MethodReference)?.let { ref ->
                    ref.definingClass == "Lnc/c;" && ref.name == "a"
                } == true
            }
        }

        if (parseCallIndex == -1) {
            error(
                "Could not find the HTML-parse call in HtmlTextView.H(). This build's " +
                    "method structure may differ from what was inspected — re-check with " +
                    "apktool.",
            )
        }

        // v0 already holds the Loc/c; builder at this point (moved there right before this
        // call); p1 is this method's own Lnc/a; parameter, untouched up to here. This method
        // declares only .locals 1 (v0), so the call forwards p1 as-is rather than needing any
        // extra scratch register.
        renderMethod.addInstructions(
            parseCallIndex + 1,
            "invoke-static {v0, p1}, Loc/c;->maybeCenterMediaSpans(Loc/c;Lnc/a;)V",
        )

        // 4. Flip the new field to true only for comments, anchored on Lnc/a;'s no-arg
        // constructor call (unique in this method).
        val commentRenderMethod = commentsHtmlTextViewRenderFingerprint.method
        val commentRenderImplementation = commentRenderMethod.implementation!!

        val optionsInitIndex = commentRenderImplementation.instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference.let {
                (it as? MethodReference)?.let { ref ->
                    ref.definingClass == "Lnc/a;" && ref.name == "<init>" && ref.parameterTypes.isEmpty()
                } == true
            }
        }

        if (optionsInitIndex == -1) {
            error(
                "Could not find the \"new Lnc/a;()\" render-options construction in " +
                    "CommentsHtmlTextView.J(). This build's method structure may differ from " +
                    "what was inspected — re-check with apktool.",
            )
        }

        // v0 holds the just-constructed Lnc/a; instance here; v1 is safe scratch — this
        // method declares .locals 6 and nothing has touched v1-v5 yet at this exact point
        // (the very next original instruction overwrites v1 anyway).
        commentRenderMethod.addInstructions(
            optionsInitIndex + 1,
            """
                const/4 v1, 0x1
                invoke-static {v0, v1}, Lnc/a;->setComment(Lnc/a;Z)Lnc/a;
            """,
        )
    }
}
