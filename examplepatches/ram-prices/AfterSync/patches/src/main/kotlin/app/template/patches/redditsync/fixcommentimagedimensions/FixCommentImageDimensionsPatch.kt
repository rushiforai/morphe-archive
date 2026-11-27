package app.template.patches.redditsync.fixcommentimagedimensions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.redditsync.fixcommentimagedimensions.fingerprints.parseCommentJsonFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Per explicit report (with real device screenshots and matching raw JSON): comment-embedded
 * preview.redd.it images still show large empty margins even after fixCommentImageSizingPatch
 * lets their real aspect ratio through — a landscape screenshot shows tall empty bars, a
 * portrait phone screenshot shows wide empty bars, exactly what letterboxing looks like when
 * the RESERVED BOX itself is wrongly square.
 *
 * Root-caused by hand across two classes:
 *
 * 1. Lnc/d;->e(...) (SyncHtmlToSpannedConverter) can only compute a real, non-square box for a
 *    preview.redd.it image when its URL contains BOTH "width" and "height" query parameters.
 *    Confirmed from real examples: every comment-embedded preview.redd.it URL Reddit generates
 *    carries "width" but never "height" — this was already known (see
 *    fixCommentImageSizingPatch.kt's item 0, formerly a separate fixPreviewImagesPatch.kt
 *    since merged), whose fix for that was to reuse the parsed width value AS the height
 *    too ("a 1:1 aspect-ratio guess", per its own comment) so
 *    the app doesn't crash trying to parse a "height" parameter that isn't there. That guess is
 *    exactly what forces the box square for every comment image, regardless of the real photo's
 *    actual shape.
 *
 * 2. Lc9/c;->a(Landroid/content/Context;ILorg/json/JSONObject;Ljava/util/ArrayList;IZZLjava/lang/String;)V
 *    — the mega-method that turns one raw Reddit API JSON object into the app's data model —
 *    ALREADY has real logic to fix exactly this, but only for a POST's own selftext body: its
 *    selftext-handling branch scans for bare preview.redd.it URLs missing "height", looks up
 *    the URL's image ID in the same JSON's "media_metadata" object, and rewrites the URL with
 *    the real "&height=<n>" appended, straight from Reddit's own metadata — confirmed by hand
 *    via apktool, this is why the ORIGINAL post body in a thread (e.g. a megathread's own
 *    selftext) already gets a correctly aspect-corrected box while every comment underneath it
 *    doesn't. The separate branch that handles a COMMENT's own body only substitutes "emote|"
 *    and "gif" media_metadata entries — it never runs the preview.redd.it URL scan at all.
 *
 * This patch closes that gap: adds a new static helper, Lc9/c;->b7
 * (Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;, that re-implements the exact
 * same algorithm as the existing post-selftext logic (scan for preview.redd.it URLs lacking
 * "height", look up "media_metadata"/<id>/"s"/"y" for the real height, append it to the URL,
 * replace it in the text) as a fresh, self-contained method — built from scratch via
 * ImmutableMethod/ImmutableMethodImplementation rather than spliced into the existing giant
 * method, per the hard lesson from the two verifier crashes documented in
 * fixCommentImageSizingPatch.kt's item 0 (formerly a separate fixPreviewImagesPatch.kt,
 * since merged) earlier this same session: inserting a new branch/loop directly into an
 * existing, heavily-optimized method is
 * fragile even when correct in isolation, but a brand-new method's own register types are
 * always safe to branch and loop in. The call site inside the giant method is a single
 * `invoke-static` + `move-result-object` pair, anchored on the "body" string constant (unique
 * in this method, confirmed by hand) right where the comment body text is first read and
 * normalized — before it reaches the "emote"/"gif" substitution loop that already runs there.
 */
val fixCommentImageDimensionsPatch = bytecodePatch(
    name = "Fix comment image margins from missing dimensions",
    description = "Fixes comment-embedded preview.redd.it images being boxed as if they were " +
        "square (causing large empty margins around non-square photos) by giving them the " +
        "same real-dimension lookup from Reddit's own metadata that post bodies already get.",
    default = true,
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        val method = parseCommentJsonFingerprint.method
        val classDef = parseCommentJsonFingerprint.classDef
        val implementation = method.implementation!!

        // 11 registers = 9 locals (v0-v8) + 2 params (body, json), both single-word objects.
        val helperImpl = ImmutableMethodImplementation(11, emptyList(), emptyList(), emptyList())
        val helperDefinition = ImmutableMethod(
            "Lc9/c;",
            "injectPreviewRedditHeights",
            listOf(
                ImmutableMethodParameter("Ljava/lang/String;", emptySet(), "body"),
                ImmutableMethodParameter("Lorg/json/JSONObject;", emptySet(), "json"),
            ),
            "Ljava/lang/String;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            helperImpl,
        )
        val injectHeights = MutableMethod(helperDefinition)
        injectHeights.addInstructions(
            """
                move-object v0, p0

                sget-object v1, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;
                invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
                move-result-object v1

                :loop_start
                invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z
                move-result v2
                if-eqz v2, :loop_end

                invoke-virtual {v1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;
                move-result-object v2

                const-string v3, "https://preview.redd.it"
                invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v3
                if-eqz v3, :loop_start

                const-string v3, "height"
                invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v3
                if-nez v3, :loop_start

                :try_start
                const-string v3, "https://preview.redd.it/"
                const-string v4, ""
                invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object v3

                const-string v4, "\\."
                invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v3
                const/4 v4, 0x0
                aget-object v4, v3, v4

                const-string v5, "media_metadata"
                invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
                move-result-object v5
                if-eqz v5, :loop_start

                invoke-virtual {v5, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
                move-result v6
                if-eqz v6, :loop_start

                invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
                move-result-object v5

                const-string v6, "s"
                invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
                move-result-object v5
                if-eqz v5, :loop_start

                const-string v6, "y"
                invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
                move-result v6

                new-instance v7, Ljava/lang/StringBuilder;
                invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V
                invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v8, "&height="
                invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
                invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v7

                invoke-virtual {v0, v2, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object v0
                :try_end
                .catch Ljava/lang/Exception; {:try_start .. :try_end} :catch_all

                goto :loop_start

                :catch_all
                move-exception v3
                goto :loop_start

                :loop_end
                return-object v0
            """,
        )
        classDef.directMethods.add(injectHeights)

        val bodyStringIndex = implementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "body"
        }

        if (bodyStringIndex == -1) {
            error(
                "Could not find the \"body\" JSON-key lookup in the comment-parsing code. " +
                    "This build's method structure may differ from what was inspected — " +
                    "re-check with apktool.",
            )
        }

        // Instructions at bodyStringIndex..+4 are: const-string "body", getString(...),
        // move-result-object, the Lwc/p;->a(...) HTML-entity-decode call, and its
        // move-result-object — v1 holds the final decoded body text right after, v2 still
        // holds the JSON object for this comment (read again immediately afterwards by the
        // existing code, confirming it's still live here).
        method.addInstructions(
            bodyStringIndex + 5,
            """
                invoke-static {v1, v2}, Lc9/c;->injectPreviewRedditHeights(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;
                move-result-object v1
            """,
        )
    }
}
