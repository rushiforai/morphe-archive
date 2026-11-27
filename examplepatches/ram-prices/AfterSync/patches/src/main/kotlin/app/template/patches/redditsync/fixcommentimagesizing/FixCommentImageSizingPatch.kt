package app.template.patches.redditsync.fixcommentimagesizing

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.redditsync.fixcommentimagesizing.fingerprints.emoteImageSpanDrawFingerprint
import app.template.patches.redditsync.fixcommentimagesizing.fingerprints.syncHtmlToSpannedConverterFingerprint
import app.template.patches.redditsync.fixcommentimagesizing.fingerprints.syncHtmlToSpannedImageTagFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// Widened from the stock 2000px / 0.2f (5:1) values — see item 5 below. Matches the
// values used by HK Morphe Patches' own "Fix inline images" patch, an unrelated
// third-party patch this project was found to conflict with (see item 0's "&height"
// dead-code note) — its source turned out to widen the exact same gate.
private const val MAX_INLINE_IMAGE_DIMENSION_PX = 8192
private const val WIDENED_ASPECT_RATIO_THRESHOLD = 0.05f
private const val CAPTION_RELATIVE_TEXT_SIZE = 0.75f

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Was originally two separate always-on patches ("Fix preview.redd.it comment/post
 * images" and "Fix inline comment image sizing") that both edit the exact same shared
 * method, SyncHtmlToSpannedConverter (Lnc/d;->e(Loc/c;Lnc/a;Lnc/b;)V), for sequentially
 * related reasons — one makes preview.redd.it images embed at all, the other fixes their
 * resulting size/distortion once embedded — with little practical value in keeping them
 * as separate Manager toggles since both always defaulted to on. Merged per an explicit
 * patch-consolidation request; no logic changed in the merge itself, every fix below is
 * unchanged from its original standalone patch.
 *
 * 0. When a user embeds an image directly in a comment/post body, Reddit hosts it at a
 *    URL like `https://preview.redd.it/<id>.png?width=1062&format=png&auto=webp&s=<hash>`
 *    — with a `width` query parameter but, confirmed from real examples, never a `height`
 *    one (for comments; see the width/height notes further down for why posts differ).
 *
 *    Confirmed by hand from real smali (via apktool): SyncHtmlToSpannedConverter's URL
 *    classifier only treats a `preview.redd.it` URL as an inline-embeddable image if it
 *    contains all three of "preview.redd.it", "width", AND "height" as substrings. Since
 *    real preview.redd.it comment-image URLs never contain "height", every one of them
 *    fails this gate and falls through to the generic "unrecognized link" path — which is
 *    what renders the raw URL as plain text with a footnote marker, and (since nothing
 *    downstream ever recognizes it as the image it actually is) can also end up pulling
 *    in an unrelated website-preview card for the bare URL instead of the image itself.
 *
 *    This patch removes the "height" substring requirement so width-only preview.redd.it
 *    URLs still qualify. An earlier version of this patch (published as v1.4.0, since
 *    reverted in v1.4.1) additionally tried to keep parsing a real "height" query
 *    parameter when present, falling back only when it was absent, using an inserted
 *    conditional branch — but mixing a low-level instruction removal after a higher-level
 *    labeled-branch insertion left a stale jump target, and ART's verifier rejected the
 *    entire class outright (VerifyError, confirmed via a real on-device crash log),
 *    crashing the app almost immediately since this class renders the very first screen's
 *    post previews.
 *
 *    This version avoids that failure mode entirely by never inserting a branch at that
 *    specific call site: it unconditionally reuses the already-parsed `width` value as
 *    the height too (a 1:1 aspect-ratio guess), which matches every real-world
 *    preview.redd.it comment-image URL (none of which carry a real height value anyway)
 *    and needs only a single straight-line instruction in place of the old height lookup
 *    — no labels, no jumps, nothing for a later edit to invalidate.
 *
 *    A second, separate hardcoded assumption in the same block also needed fixing (found
 *    via a real device log showing Sync's own "failed to parse this content" fallback,
 *    confirming a caught runtime exception rather than a verifier-level failure this
 *    time): right after the height fix above, the method computes
 *    `url.substring(0, url.indexOf("&height"))` to build the final display URL by
 *    truncating everything from "&height" onward. Real preview.redd.it URLs *embedded in
 *    a comment* never contain "&height" (confirmed by hand from several real examples),
 *    so `indexOf` returns -1 and `substring(0, -1)` throws a
 *    StringIndexOutOfBoundsException.
 *
 *    A first attempt at this (v1.5.1) fixed the crash by searching for the first "&"
 *    generally instead of "&height" specifically — that stopped the exception, but
 *    confirmed on-device that it silently broke image loading itself: real preview.redd.it
 *    URLs put the required signature ("&...&s=<hash>") after width, so truncating at the
 *    first "&" strips it, and Reddit's CDN needs that signature to actually serve the
 *    image (an empty reserved space where the image should be, no error, is exactly what
 *    a failed/unauthorized image load looks like).
 *
 *    A second attempt (v1.13.0-era) removed the truncation entirely instead of relocating
 *    it, on the assumption that real preview.redd.it URLs never contain "&height" at all
 *    — true for every comment example checked, but confirmed FALSE for post-body-embedded
 *    images by a real device log + curl test: a post's embedded image URL can genuinely
 *    carry a trailing "&height=<n>" (e.g. "...&s=<hash>&height=2160"), and leaving that
 *    trailing param in place made Reddit's CDN 403 the request — while the *same* image
 *    loaded fine once this fix was disabled (restoring the original truncate-at-"&height"
 *    behavior, which is a no-op for comments but strips the trailing param for posts that
 *    have it).
 *
 *    This version keeps the untouched-URL behavior for the case it was actually needed
 *    for (comments, where "&height" is genuinely absent) while restoring the truncation
 *    for the case that turned out to still need it (posts, where "&height" is genuinely
 *    present and apparently must be stripped for Reddit's CDN to accept the request). The
 *    signature ("&s=<hash>") always precedes "&height" in every real URL seen so far, so
 *    truncating there never touches it — the same reasoning the v1.5.1 first-"&" attempt
 *    got wrong.
 *
 *    A first attempt at THIS fix (v1.19.0, reverted within the same version bump before
 *    release) spliced an `if-ltz` branch directly into this existing giant method at the
 *    "&height" call site — and immediately reproduced the exact failure class this
 *    method's own history already warned about (see the v1.4.0 note above): a real device
 *    crash log showed `VerifyError: ... type Conflict unexpected as arg to if-eqz/if-nez`
 *    in this exact method, at an offset consistent with that inserted branch. Splicing a
 *    NEW branch into this method's existing, heavily hand-optimized register/type layout
 *    is fragile even when the branch itself looks correct in isolation — the surrounding
 *    method's already-inferred register types don't necessarily tolerate a new
 *    control-flow join point.
 *
 *    This version avoids that entirely by moving the conditional logic into a brand-new,
 *    independent static helper method (`truncateAtHeightParam`, added to this same
 *    class) instead of splicing anything into the existing method. A freshly-built method
 *    defines its own register types from scratch, so a branch inside IT carries none of
 *    the surrounding giant method's fragility — this is the same reasoning already
 *    validated by every from-scratch helper elsewhere in this project (e.g.
 *    EmoteImageSpan's `w4` in item 1 below, which also branches internally with no
 *    issue). The call site inside the giant method shrinks to a single `invoke-static` +
 *    `move-result-object` pair touching only the one register (the URL string) already
 *    known safe to reassign — no new registers, no new branches, nothing for the existing
 *    method's type inference to trip over.
 *
 *    A THIRD assumption in this same block needed revisiting once fixCommentImageDimensionsPatch
 *    shipped (which injects a real "&height=<n>" into some comment-embedded preview.redd.it
 *    URLs straight from Reddit's own media_metadata, before this method ever sees them —
 *    see that patch for the mechanism): the height-reuse fix above (`move p2, v1`, height
 *    := width) unconditionally discards ANY real height that might now be present in the
 *    URL, since when it was written NO comment URL ever carried one. Confirmed by hand
 *    this fully defeated fixCommentImageDimensionsPatch — real device testing after that
 *    patch shipped still showed forced-square boxes, because this line always overwrote
 *    the freshly-injected real height with the width guess regardless. Fixed the same way
 *    as the other two conditionals in this item: a new from-scratch helper
 *    (`resolveHeight`) that reads the real `height` query parameter when present and only
 *    falls back to the width guess when it's genuinely absent or unparseable, called via
 *    a 2-instruction `invoke-static`+`move-result` pair in place of the old unconditional
 *    `move`.
 *
 *    All three edits in this item are anchored on the "preview.redd.it" string constant,
 *    which appears exactly once in this method (confirmed by hand) — everything else this
 *    ~4500-line method does (every other URL type it recognizes, the video/gif/imgur/gallery
 *    handling, the website-preview-card logic for genuinely unrecognized links) is
 *    untouched.
 *
 * The remaining items were confirmed by hand via apktool as four separate, compounding
 * issues in EmoteImageSpan (Lnb/c;, "EmoteImageSpan.java"), the ReplacementSpan used to
 * draw every inline comment image (subreddit emotes, preview.redd.it images, Giphy
 * embeds), all triggered by the "inline images/GIFs in comments always render stretched
 * to a square, at the full width of the comment" report:
 *
 * 1. Lnb/c;->draw(...) unconditionally calls `Drawable.setBounds(0, 0, s, t)` — where s/t
 *    are the span's fixed box width/height — for both the static-bitmap and animated-GIF
 *    cases, stretching the actual loaded image to exactly fill that box regardless of its
 *    real aspect ratio. This patch adds a new static helper, Lnb/c;->w4
 *    (Landroid/graphics/drawable/Drawable;II)V, that reads the drawable's real
 *    getIntrinsicWidth()/getIntrinsicHeight(), scales it DOWN to FIT within the s×t box
 *    while preserving its aspect ratio (letterboxed, never cropped), and anchors it to the
 *    box's top-left corner (rather than centering it) — then replaces both of draw()'s
 *    setBounds(...) calls that size the actual *loaded* image (the static-bitmap branch and
 *    the animated-GIF branch) with a call to this helper instead. The third setBounds(...)
 *    call in this method, which sizes a generic loading-placeholder icon
 *    (RedditApplication.P) shown before the real image loads, is deliberately left
 *    untouched — a fixed-size placeholder icon doesn't need aspect-ratio awareness the way
 *    a real photo does.
 *
 *    Top-left anchoring (rather than centering) is a deliberate, explicitly requested
 *    choice: for the rare remaining cases where the box still isn't perfectly aspect-correct
 *    (see the no-metadata Giphy fallback note below), any leftover empty space collects in
 *    one corner instead of forming a symmetric border on both sides — less visually odd, and
 *    a strict improvement any time the box IS already aspect-correct (nothing to anchor
 *    differently when there's no leftover space to place).
 *
 *    A v1.17.0-era version of this helper cropped instead of letterboxed (picking the
 *    LARGER of the two axis scale ratios, clipping the canvas to the box) specifically to
 *    eliminate empty "pillarbox" margins around non-matching-aspect-ratio media. Reverted
 *    per explicit follow-up request: cropping trims real image content to force it into
 *    the box's shape, which trades one complaint (margins) for another (losing part of the
 *    image) — the user wants the full aspect ratio preserved AND no margins, which cropping
 *    can't deliver simultaneously.
 *
 *    Investigated by hand via apktool before reverting: the ACTUAL margin complaint (a
 *    landscape GIF in a near-square box) only ever came from Lnc/d;->a(...)'s no-metadata
 *    Giphy fallback (see #4 below), which is the one case in this whole file that uses a
 *    genuinely fixed, non-aspect-aware box. Every other box this span is used for is
 *    already sized using the real image dimensions before the span is even constructed:
 *    preview.redd.it images parse real width/height straight from the URL's query
 *    parameters (Lnc/d;->e(...)'s own pre-existing, unmodified math), and Giphy embeds
 *    WITH valid Reddit metadata parse real width/height from that metadata (also
 *    pre-existing, unmodified stock code, confirmed by hand a few lines away from the
 *    no-metadata fallback this file replaces). For both of those, letterboxing here is
 *    already a no-op — the box already matches the image's real shape, so there's nothing
 *    to letterbox around. Reverting to letterbox therefore removes the cropping distortion
 *    everywhere while leaving margins eliminated everywhere they were already eliminated
 *    by the box being aspect-correct to begin with; only the no-metadata Giphy fallback's
 *    fixed 200×112 box (out of scope here, see #4) can still show a residual margin on an
 *    unusual aspect ratio, since its real dimensions are never known — the same accepted
 *    limitation as before, now the ONLY remaining case rather than a general one.
 *
 * 2. Lnc/d;->y(...) (the &lt;img&gt; HTML-tag handler, used for subreddit "emote" images
 *    embedded directly in a comment body) builds every such image with a fixed 42dp-square
 *    box — small and, combined with #1's stretching, especially noticeable. Bumped to
 *    160dp. Left square (rather than widened like #4 below) deliberately: this sits deep
 *    inside a large, mostly-unexamined 8-local method, and safely widening it would need a
 *    new scratch register whose liveness across the rest of that method isn't fully
 *    understood — not worth the risk for what's a rarer code path (literal &lt;img&gt; tags
 *    in comment HTML) than the Giphy and preview.redd.it paths below.
 *
 * 3. Lnc/d;->e(...) (SyncHtmlToSpannedConverter's main method, also edited by item 0 above)
 *    sizes preview.redd.it comment images to the FULL available column width (`Lnc/a;->e`,
 *    confirmed by hand to be the rendering container's pixel width) — by far the biggest
 *    images in a comment, exactly matching the "too big, sticker-sized would be nicer"
 *    follow-up request once #1 above stopped them being stretched. Fixed by clamping that
 *    width to 160dp via `Math.min(availableWidth, 160dp)` right after it's read, before
 *    any of the existing (unmodified) proportional-height math runs on it — a value it
 *    already knows how to handle correctly for any width, having previously only ever
 *    seen the full column width. Anchored on the specific `iget p1, p1, Lnc/a;->e:I`
 *    instruction (destination and source register both `p1`, unique among several other
 *    reads of the same field elsewhere in this method for unrelated purposes) rather than
 *    a fixed offset from any string constant, since item 0's edits remove the nearest
 *    useful string anchor ("&height") in this same region — this way both items' edits
 *    stay independent of whichever runs first (they always have, even back when they were
 *    two separate patches). Uses the temporarily-free v0 register (immediately overwritten
 *    by the original, unmodified next instruction either way) rather than a new local,
 *    avoiding this method's own prior crash history with labeled-branch insertions (see
 *    item 0 above) by using `Math.min(II)I` instead of a branch.
 *
 * 4. Lnc/d;->a(Loc/c;Ljava/lang/String;)V is SyncHtmlToSpannedConverter's fallback for a
 *    `[gif](giphy|id)` embed when Reddit's `media_metadata` for it has no usable size data
 *    (confirmed by hand from a real example: Reddit's own JSON reports
 *    `"media_metadata": {"giphy|<id>": {"status": "invalid"}}` — no "s" size object at
 *    all — for a Giphy asset that Giphy itself still serves fine at
 *    https://media.giphy.com/media/<id>/giphy.mp4, i.e. Reddit's classic native
 *    comment-Giphy integration has bit-rotted server-side, not something this patch can
 *    fix at the source). The original fallback builds a static, non-animated
 *    100px-wide thumbnail wrapped in a 56dp icon-and-text "link chip"
 *    (Lnb/d;/InlineImageSpan) — never an actual inline GIF. Replaces that with a real
 *    animated embed (Lnb/c;/EmoteImageSpan, the same span class every other inline image
 *    in this file uses) at a fixed 200dp × 112dp (~16:9) box — wide rather than square,
 *    per explicit follow-up request, since most reaction GIFs/videos are landscape-shaped
 *    and a square box left visible empty margins around them even once letterboxing (#1)
 *    stopped the image itself from being stretched — pointed at the higher-res
 *    media1.giphy.com/.../200.gif URL the WITH-dimensions branch of this same method
 *    already uses. Since the real dimensions are still unknown, the box can't be made
 *    genuinely aspect-correct the way the with-dimensions case is. This is a full method
 *    body replacement built fresh via ImmutableMethod/ImmutableMethodImplementation with
 *    an explicit 6-register count (4 locals + 2 parameter registers, one more scratch
 *    register than the original/previous version needed for the two-int Lnb/c;
 *    constructor) — see the register-count pitfall documented in
 *    removeSyncUltraSetupPatch.kt for why this can't just be bumped in place.
 *
 * Items 5 and 6 below originate from investigating a real device crash in an unrelated
 * third-party patch bundle (HK Morphe Patches) that turned out to be caused by item 0's
 * "&height" edit shifting execution order relative to that bundle's own "Fix inline
 * images" patch (see item 0's dead-code note above). Reading that patch's source to fix
 * the conflict turned up two things it does that this project didn't: a wider embedding
 * gate, and image captions. Both are ported here in AfterSync's own style rather than
 * copied verbatim — see each item for why.
 *
 * 5. Lnc/d;->e(...) rejects a preview.redd.it image from embedding inline at all (falling
 *    back to a plain link) if it's wider/taller than 2000px or has an aspect ratio more
 *    extreme than 5:1 (0.2f) — a separate gate from item 0's width/height substring check,
 *    on the same "preview.redd.it"+"width"+"height" URLs that already pass it. Likely
 *    explains a previously-unexplained report that "some media types don't embed" —
 *    screenshots, infographics, and comic-strip-shaped images routinely exceed both.
 *    Widened to 8192px and 20:1 (0.05f), matching HK Morphe Patches' own values. Both are
 *    single-instruction constant replacements (register v3, used immediately by an
 *    existing, unmodified comparison) — no new branches, no new registers.
 *
 * 6. The same method appends a caption below an embedded preview.redd.it image when the
 *    markdown link's display text is genuinely different from its URL — not just an exact
 *    match, but not a link-label either (e.g. a bare autolinked URL, or Reddit's own
 *    domain-only rendering of one, like showing "preview.redd.it" as the visible text for
 *    a link whose href is the full image URL — an early version used an exact
 *    equalsIgnoreCase check and still showed these as bogus captions, so this checks
 *    whether the URL merely *contains* the display text instead, catching both cases: a
 *    real caption like "Great sunset photo" is never a substring of the URL it's attached
 *    to). HK Morphe Patches implements this with a new class bundled in via Morphe's
 *    extendWith(...) extension mechanism (compiled Java, packaged separately into the
 *    APK) plus a custom click-span class so the caption also becomes the full-screen
 *    image viewer's title. This version only ports the caption-below-the-image half: the
 *    logic is simple enough to fit in one new static helper (`maybeAppendCaption`, added
 *    to this same class) rather than needing extendWith(...)
 *    — a mechanism this project has never used. The viewer-title half is deliberately not
 *    ported: it requires intercepting the image's click behavior, and the class that
 *    handles it (Lmb/d;, CustomUrlSpan) is a large, heavily-shared click handler used by
 *    every other link type this method recognizes (settings deep links, tables, AMP
 *    redirects, etc.), not just images — too much surface area to touch safely for what's
 *    a minor extra. The call site is a single straight-line `invoke-static` inserted right
 *    after the existing image-append call, with all branching logic inside the new helper
 *    method instead of spliced into this giant existing one — the same reasoning already
 *    validated by every other helper in this file, given this method's confirmed history
 *    of VerifyError crashes from branches inserted directly into it (see item 0 above).
 *
 * 7. Per explicit report: a bare `https://i.redd.it/<id>.gif` (or `.jpeg`/`.png`) pasted as
 *    a comment's OWN text, not wrapped in markdown image syntax, never plays or shows as a
 *    real embedded image, just a small frozen thumbnail next to the raw URL text.
 *
 *    Confirmed by hand via apktool: a plain pasted link like this is a markdown
 *    reference-style link (the surrounding method only runs for Lnc/d$h;/Lnc/d$o; AST
 *    nodes, snudown's own reference-link/footnote node types), not an img tag, so it never
 *    reaches the img-tag handler (item 2) or the preview.redd.it-specific code (items
 *    0/3/5/6). This method's own per-link dispatch further down (guarded by the user's
 *    "inlineImagePreviews" setting) already recognizes a direct image/GIF extension or
 *    several known media hosts as eligible for some kind of inline preview, but builds an
 *    Lnb/d; (InlineImageSpan) for it, not an Lnb/c; (EmoteImageSpan). Per this file's own
 *    item 4 doc comment, Lnb/d; is a static, non-animated, 56dp icon-and-text "link chip"
 *    — exactly the small frozen-thumbnail-plus-text row reported, never a real playing
 *    embed, for the same reason item 4's no-metadata Giphy fallback used to have the same
 *    problem before that item's fix.
 *
 *    Fixed the same way as item 4: build an Lnb/c; instead, at the same fixed 200dp x 112dp
 *    (~16:9) box used there (this link's real dimensions are equally unknown here), instead
 *    of Lnb/d;. Also skips the Lnc/b;-based footnote-registration + superscript-numbering
 *    wrapper Lnb/d; went through on the way in — every OTHER genuine inline image this
 *    method builds (preview.redd.it, translate/sync-settings icons) is inserted directly,
 *    never through that wrapper, matching normal img-embed behavior instead of a numbered
 *    footnote reference.
 *
 *    Anchored on the Lnb/d;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V call, unique in
 *    this method (confirmed by hand; the method's other Lnb/d; construction, near its very
 *    start, uses the unrelated 1-arg constructor for an unrelated case). The 7 instructions
 *    before it build the Lnc/b$a;/footnote wrapper and the 14 after it register the
 *    footnote and insert its superscripted reference marker — replacing this whole
 *    22-instruction, self-contained block (reached only after the per-link dispatch's own
 *    pre-existing, unmodified eligibility check already passed — no new branch introduced,
 *    only what already-eligible links turn into changes) with a same-style Lnb/c;
 *    construction, matching item 4's approach exactly. v2 (the URL), v7/v8/v9 (the method's
 *    stable 2/0/1 constants) and p0 (the converter) are the same registers items 0 and 4
 *    already rely on being stable here. The final `move v0, v9` is kept as-is: whatever
 *    later in this method reads this "was a preview added for this link" flag should see
 *    the same true value it always did, since a preview (now a proper embed) is still what
 *    gets added.
 */
val fixCommentImageSizingPatch = bytecodePatch(
    name = "Fix inline comment/post images",
    description = "Fixes comment and post images hosted on preview.redd.it showing as a " +
        "raw link instead of embedding, widens the size/aspect-ratio limits that reject " +
        "large images from embedding at all, adds a caption below images whose link text " +
        "isn't just the bare URL, stops embedded images/GIFs from being stretched to a " +
        "square, caps their size, gives Giphy embeds a real animated fallback instead " +
        "of a static link chip when Reddit's own size metadata for them is missing, and " +
        "properly embeds bare i.redd.it (and similar) image/GIF links pasted directly in " +
        "a comment instead of showing a small frozen link-preview chip.",
    default = true,
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        // 0. Widen the preview.redd.it detection gate to accept width-only URLs, and fix
        // two hardcoded height assumptions in the same block — see the class doc for the
        // full crash history behind each of the three edits below.
        val htmlMethod = syncHtmlToSpannedConverterFingerprint.method
        val htmlImpl = htmlMethod.implementation!!
        val htmlConverterClass = syncHtmlToSpannedConverterFingerprint.classDef

        val base = htmlImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "preview.redd.it"
        }

        if (base == -1) {
            error(
                "Could not find the \"preview.redd.it\" inline-image detection code in " +
                    "SyncHtmlToSpannedConverter. This build's method structure may differ " +
                    "from what was inspected — re-check with apktool.",
            )
        }

        // Remove the "height".contains() gate first (instructions 11-13 relative to the
        // "preview.redd.it" const-string, 0-indexed offsets base+10/+11/+12). The
        // "height" string constant itself (instruction 10, offset base+9) is left in
        // place — it becomes unused dead code, which is harmless, rather than risk
        // touching anything else.
        repeat(3) { htmlImpl.removeInstruction(base + 10) }

        // The height lookup+parse (originally instructions 22-25, offsets base+21
        // through base+24) has now shifted down by 3 to base+18 through base+21.
        // Replace all 4 with a call to a fresh helper: p2 still holds the Uri object at
        // this point (untouched since the width parsing above used a different
        // register), v1 holds the already-parsed width (int) to fall back to.
        val resolveHeightImpl = ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())
        val resolveHeightDefinition = ImmutableMethod(
            "Lnc/d;",
            "resolveHeight",
            listOf(
                ImmutableMethodParameter("Landroid/net/Uri;", emptySet(), "uri"),
                ImmutableMethodParameter("I", emptySet(), "fallbackWidth"),
            ),
            "I",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            resolveHeightImpl,
        )
        val resolveHeight = MutableMethod(resolveHeightDefinition)
        resolveHeight.addInstructions(
            """
                const-string v0, "height"
                invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :fallback
                :try_start
                invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
                move-result v0
                return v0
                :try_end
                .catch Ljava/lang/Exception; {:try_start .. :try_end} :fallback
                :fallback
                return p1
            """,
        )
        htmlConverterClass.directMethods.add(resolveHeight)

        repeat(4) { htmlImpl.removeInstruction(base + 18) }
        htmlMethod.addInstructions(
            base + 18,
            """
                invoke-static {p2, v1}, Lnc/d;->resolveHeight(Landroid/net/Uri;I)I
                move-result p2
            """,
        )

        // Searched fresh (rather than computed as a further fixed offset from "base")
        // since it comes after the edits above and this string constant is unique in
        // the method on its own, so there's no ambiguity risk in finding it this way.
        val ampHeightIndex = htmlImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "&height"
        }

        if (ampHeightIndex == -1) {
            error(
                "Could not find the \"&height\" URL-truncation code in " +
                    "SyncHtmlToSpannedConverter. This build's method structure may differ " +
                    "from what was inspected — re-check with apktool.",
            )
        }

        // New, fully independent static helper: does the same guarded truncation, but
        // with its own fresh register allocation so the branch inside it can't conflict
        // with the giant existing method's own inferred register types.
        val truncateHelperImpl = ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())
        val truncateHelperDefinition = ImmutableMethod(
            "Lnc/d;",
            "truncateAtHeightParam",
            listOf(ImmutableMethodParameter("Ljava/lang/String;", emptySet(), "url")),
            "Ljava/lang/String;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            truncateHelperImpl,
        )
        val truncateHelper = MutableMethod(truncateHelperDefinition)
        truncateHelper.addInstructions(
            """
                const-string v0, "&height"
                invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
                move-result v0
                if-ltz v0, :no_height_param
                const/4 v1, 0x0
                invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;
                move-result-object p0
                :no_height_param
                return-object p0
            """,
        )
        htmlConverterClass.directMethods.add(truncateHelper)

        // Replace the 4 instructions that USED the "&height" const-string (indexOf,
        // its result, substring, and its result overwriting the URL register) with a
        // call to the helper above — touches only v2 (the URL string, already known
        // safe to reassign here), nothing else in this method changes. The "&height"
        // const-string itself (at ampHeightIndex) is deliberately left in place rather
        // than removed with the rest of the block: confirmed on a real device that a
        // third-party patch bundle (unrelated to this project, found via its package
        // name in a crash log — "Could not find the '&height' marker") independently
        // searches this same method for that exact string constant's presence. Same
        // reasoning already applied a few lines up for the unrelated "height" gate
        // string: leaving a no-longer-referenced string constant standing as harmless
        // dead code costs nothing and preserves compatibility with anything else
        // scanning for it, regardless of patch execution order.
        repeat(4) { htmlImpl.removeInstruction(ampHeightIndex + 1) }
        htmlMethod.addInstructions(
            ampHeightIndex + 1,
            """
                invoke-static {v2}, Lnc/d;->truncateAtHeightParam(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v2
            """,
        )

        // 1. Letterbox the loaded drawable within its box instead of stretching it.
        val emoteImageSpanClass = emoteImageSpanDrawFingerprint.classDef
        val drawMethod = emoteImageSpanDrawFingerprint.method
        val drawImpl = drawMethod.implementation!!

        val setBoundsIndices = drawImpl.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.definingClass == "Landroid/graphics/drawable/Drawable;" && it.name == "setBounds"
                } == true
        }.map { it.index }

        if (setBoundsIndices.size != 3) {
            error(
                "Expected 3 Drawable.setBounds(...) calls in EmoteImageSpan.draw() " +
                    "(placeholder icon, static bitmap, animated GIF), found " +
                    "${setBoundsIndices.size}. This build's method structure may differ " +
                    "from what was inspected — re-check with apktool.",
            )
        }

        // 12 registers = 8 locals (v0-v7) + 4 params (drawable, boxWidth, boxHeight,
        // centerWidth). centerWidth is 0 for every ordinary (non-post) image — see the
        // "Center media in posts" tap-zone fix below for why this 4th param exists and
        // where a nonzero value comes from.
        val helperImpl = ImmutableMethodImplementation(12, emptyList(), emptyList(), emptyList())
        val helperDefinition = ImmutableMethod(
            "Lnb/c;",
            "w4",
            listOf(
                ImmutableMethodParameter("Landroid/graphics/drawable/Drawable;", emptySet(), "drawable"),
                ImmutableMethodParameter("I", emptySet(), "boxWidth"),
                ImmutableMethodParameter("I", emptySet(), "boxHeight"),
                ImmutableMethodParameter("I", emptySet(), "centerWidth"),
            ),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            helperImpl,
        )
        val aspectFitBounds = MutableMethod(helperDefinition)
        aspectFitBounds.addInstructions(
            """
                invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I
                move-result v0
                invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I
                move-result v1
                if-lez v0, :fallback
                if-lez v1, :fallback

                int-to-float v2, p1
                int-to-float v3, v0
                div-float/2addr v2, v3

                int-to-float v3, p2
                int-to-float v4, v1
                div-float/2addr v3, v4

                cmpg-float v4, v2, v3
                if-ltz v4, :use_scale
                move v2, v3
                :use_scale

                int-to-float v3, v0
                mul-float/2addr v3, v2
                float-to-int v3, v3

                int-to-float v4, v1
                mul-float/2addr v4, v2
                float-to-int v4, v4

                const/4 v5, 0x0
                if-lez p3, :bounds
                sub-int v5, p3, v3
                div-int/lit8 v5, v5, 0x2

                :bounds
                const/4 v6, 0x0
                add-int v7, v5, v3
                add-int v3, v6, v4

                invoke-virtual {p0, v5, v6, v7, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
                return-void

                :fallback
                const/4 v0, 0x0
                const/4 v2, 0x0
                if-lez p3, :fallback_bounds
                sub-int v2, p3, p1
                div-int/lit8 v2, v2, 0x2

                :fallback_bounds
                add-int v3, v2, p1
                invoke-virtual {p0, v2, v0, v3, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
                return-void
            """,
        )
        emoteImageSpanClass.directMethods.add(aspectFitBounds)

        // New field + setter used by "Center media in posts" to widen this span's
        // reported layout box (via getSize() below) without changing how big the image
        // itself is drawn — see that patch for why AlignmentSpan-based centering broke
        // tap detection, and CenterPostMediaPatch.kt's dependsOn(fixCommentImageSizingPatch)
        // for why it needs this class's methods to exist first.
        emoteImageSpanClass.instanceFields.add(
            MutableField(
                ImmutableField(
                    "Lnb/c;",
                    "centerWidth",
                    "I",
                    AccessFlags.PUBLIC.value,
                    null,
                    emptySet(),
                    null,
                ),
            ),
        )

        val setCenterWidthDefinition = ImmutableMethod(
            "Lnb/c;",
            "setCenterWidth",
            listOf(
                ImmutableMethodParameter("Lnb/c;", emptySet(), "span"),
                ImmutableMethodParameter("I", emptySet(), "width"),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList()),
        )
        val setCenterWidth = MutableMethod(setCenterWidthDefinition)
        setCenterWidth.addInstructions(
            """
                iput p1, p0, Lnb/c;->centerWidth:I
                return-void
            """,
        )
        emoteImageSpanClass.directMethods.add(setCenterWidth)

        // Rebuilt from scratch (like item 4's Giphy fallback below) rather than patched in
        // place: the original declares .locals 0, using every one of its 6 param registers
        // already, so a new branch needs a fresh register count — 7 (6 params + 1 local)
        // instead of 6. A plain public instance method overriding ReplacementSpan.getSize()
        // must stay in virtualMethods, not directMethods, to still be found by virtual
        // dispatch — see the direct/virtual dexlib2 pitfall documented elsewhere in this
        // project.
        val oldGetSize = emoteImageSpanClass.virtualMethods
            .firstOrNull { it.name == "getSize" }
            ?: error(
                "Could not find EmoteImageSpan's getSize(...) override (Lnb/c;->getSize). " +
                    "This build's method structure may differ from what was inspected — " +
                    "re-check with apktool.",
            )
        emoteImageSpanClass.virtualMethods.remove(oldGetSize)

        val getSizeDefinition = ImmutableMethod(
            "Lnb/c;",
            "getSize",
            listOf(
                ImmutableMethodParameter("Landroid/graphics/Paint;", emptySet(), "paint"),
                ImmutableMethodParameter("Ljava/lang/CharSequence;", emptySet(), "text"),
                ImmutableMethodParameter("I", emptySet(), "start"),
                ImmutableMethodParameter("I", emptySet(), "end"),
                ImmutableMethodParameter("Landroid/graphics/Paint\$FontMetricsInt;", emptySet(), "fm"),
            ),
            "I",
            AccessFlags.PUBLIC.value,
            emptySet(),
            emptySet(),
            ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList()),
        )
        val getSize = MutableMethod(getSizeDefinition)
        getSize.addInstructions(
            """
                if-eqz p5, :cond_0

                iget p1, p0, Lnb/c;->t:I
                neg-int p1, p1
                iput p1, p5, Landroid/graphics/Paint${'$'}FontMetricsInt;->ascent:I

                const/4 p2, 0x0
                iput p2, p5, Landroid/graphics/Paint${'$'}FontMetricsInt;->descent:I
                iput p1, p5, Landroid/graphics/Paint${'$'}FontMetricsInt;->top:I
                iput p2, p5, Landroid/graphics/Paint${'$'}FontMetricsInt;->bottom:I

                :cond_0
                iget v0, p0, Lnb/c;->centerWidth:I
                if-lez v0, :use_tight
                return v0

                :use_tight
                iget p1, p0, Lnb/c;->s:I
                return p1
            """,
        )
        emoteImageSpanClass.virtualMethods.add(getSize)

        // Replace the 2nd (static bitmap) and 3rd (animated GIF) setBounds(...) calls —
        // in descending index order so replacing one doesn't shift the other's index.
        // Both call sites use the identical register pattern: {drawable, 0, 0, s, t}. p6 is
        // unused anywhere else in this method (confirmed by hand — draw() never reads its
        // own "top" parameter), so it's safe scratch for fetching centerWidth here.
        listOf(setBoundsIndices[2], setBoundsIndices[1]).forEach { index ->
            drawMethod.removeInstructions(index, 1)
            drawMethod.addInstructions(
                index,
                """
                    iget p6, p0, Lnb/c;->centerWidth:I
                    invoke-static {p2, p4, p5, p6}, Lnb/c;->w4(Landroid/graphics/drawable/Drawable;III)V
                """,
            )
        }

        // 2. Bump the fixed emote-image box from 42dp to 120dp.
        val imageTagMethod = syncHtmlToSpannedImageTagFingerprint.method
        val imageTagImpl = imageTagMethod.implementation!!

        val boxSizeIndices = imageTagImpl.instructions.withIndex().filter { (_, instruction) ->
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0x2a
        }.map { it.index }

        if (boxSizeIndices.size != 1) {
            error(
                "Expected exactly 1 occurrence of the 42dp emote-image box size constant " +
                    "in SyncHtmlToSpannedConverter's <img> tag handler, found " +
                    "${boxSizeIndices.size}. This build's method structure may differ from " +
                    "what was inspected — re-check with apktool.",
            )
        }
        imageTagMethod.replaceInstruction(boxSizeIndices.single(), "const/16 v2, 0xa0")

        // 3. Cap preview.redd.it comment images to a sticker-sized 160dp box instead of
        // the full available column width.
        val availableWidthIndex = htmlImpl.instructions.indexOfFirst { instruction ->
            (instruction as? Instruction22c)?.let {
                it.registerA == it.registerB &&
                    (it.reference as? FieldReference)?.let { field ->
                        field.definingClass == "Lnc/a;" && field.name == "e"
                    } == true
            } == true
        }

        if (availableWidthIndex == -1) {
            error(
                "Could not find the self-referential \"iget p1, p1, Lnc/a;->e:I\" " +
                    "available-width read in SyncHtmlToSpannedConverter's preview.redd.it " +
                    "handling. This build's method structure may differ from what was " +
                    "inspected — re-check with apktool.",
            )
        }

        htmlMethod.addInstructions(
            availableWidthIndex + 1,
            """
                const/16 v0, 0xa0
                invoke-static {v0}, Lt7/f0;->c(I)I
                move-result v0
                invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I
                move-result p1
            """,
        )

        // 4. Give Giphy embeds a real animated fallback when Reddit's own metadata for
        // them is missing/invalid, instead of a tiny static-thumbnail link chip. Uses a
        // wide (200dp × 112dp, ~16:9) box instead of a square one, per explicit request —
        // most reaction images/GIFs/videos are landscape-shaped, so this avoids the empty
        // pillar-box margins a square box leaves around them (confirmed by hand: letterboxing
        // from #1 above only avoids stretching, it doesn't stop the box itself from being
        // visibly bigger than a landscape image actually needs). Rebuilt via
        // ImmutableMethod/ImmutableMethodImplementation with an explicit 6-register count
        // (4 locals + 2 parameter registers) rather than reusing the previous version's
        // 5-register layout, since the two-int Lnb/c; constructor needs one more scratch
        // register than the single-int one did.
        val oldGiphyNoDimsFallback = htmlConverterClass.directMethods
            .firstOrNull { it.name == "a" && it.parameterTypes.size == 2 }
            ?: error(
                "Could not find SyncHtmlToSpannedConverter's no-dimensions Giphy fallback " +
                    "method (Lnc/d;->a). This build's method structure may differ from " +
                    "what was inspected — re-check with apktool.",
            )
        htmlConverterClass.directMethods.remove(oldGiphyNoDimsFallback)

        val giphyNoDimsFallbackDefinition = ImmutableMethod(
            "Lnc/d;",
            "a",
            listOf(
                ImmutableMethodParameter("Loc/c;", emptySet(), "converter"),
                ImmutableMethodParameter("Ljava/lang/String;", emptySet(), "giphyId"),
            ),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList()),
        )
        val giphyNoDimsFallback = MutableMethod(giphyNoDimsFallbackDefinition)
        giphyNoDimsFallback.addInstructions(
            """
                new-instance v0, Ljava/lang/StringBuilder;
                invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
                const-string v1, "https://media1.giphy.com/media/"
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v1, "/200.gif"
                invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object p1

                const/16 v0, 0xc8
                invoke-static {v0}, Lt7/f0;->c(I)I
                move-result v0

                const/16 v1, 0x70
                invoke-static {v1}, Lt7/f0;->c(I)I
                move-result v1

                const/4 v2, 0x2
                new-array v2, v2, [Ljava/lang/Object;

                new-instance v3, Lnb/c;
                invoke-direct {v3, p1, v0, v1}, Lnb/c;-><init>(Ljava/lang/String;II)V
                const/4 v0, 0x0
                aput-object v3, v2, v0

                new-instance v3, Lmb/d;
                invoke-direct {v3, p1}, Lmb/d;-><init>(Ljava/lang/String;)V
                const/4 v0, 0x1
                aput-object v3, v2, v0

                const-string v0, "￼"
                invoke-virtual {p0, v0, v2}, Loc/c;->c(Ljava/lang/String;[Ljava/lang/Object;)V

                const-string v0, "\n"
                invoke-virtual {p0, v0}, Loc/c;->b(Ljava/lang/CharSequence;)V

                return-void
            """,
        )
        htmlConverterClass.directMethods.add(giphyNoDimsFallback)

        // 5/6 setup: the link's markdown display text is read once into v3 near the very
        // top of this method (via Loc/c;->t(...)) but v3 gets reused as a scratch register
        // further down this same block — first for the preserved "&height" dead-code
        // string, then a float temp, then item 5's own threshold constants below — so by
        // item 6's call site it no longer holds it (confirmed on a real device via a
        // VerifyError: "register v3 has type PositiveShortConstant but expected Reference:
        // java.lang.String"). v10 is free for the rest of this block once the "height"
        // substring gate check higher up is done with it, so snapshot v3 into v10 here, at
        // the last point it's still the display text — right before the preserved
        // "&height" const-string overwrites it. Done before item 5 below since this is the
        // earlier position in the method; item 5's own indices are found fresh afterward
        // so they see this insertion already applied.
        //
        // Also snapshot v2 (the URL) into v11 here, BEFORE item 0's truncateAtHeightParam
        // call strips a trailing "&height=<n>" from it for posts: the display text being
        // compared against still has that suffix (it was captured from the raw, untouched
        // buffer), so comparing against the already-truncated v2 made a bare autolinked URL
        // fail to match itself and show up as a bogus caption — confirmed on a real device
        // (the URL shown as its own caption ended in "&height=2048", proving the mismatch
        // was exactly this truncation asymmetry). v11 is free for the same reason v10 is.
        val linkTextSnapshotIndex = htmlImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "&height"
        }
        if (linkTextSnapshotIndex == -1) {
            error(
                "Could not find the \"&height\" marker (the last point where v3 still " +
                    "holds the link's display text, before it's reused as scratch) in " +
                    "SyncHtmlToSpannedConverter. This build's method structure may differ " +
                    "from what was inspected — re-check with apktool.",
            )
        }
        htmlMethod.addInstructions(
            linkTextSnapshotIndex,
            """
                move-object v10, v3
                move-object v11, v2
            """,
        )

        // 5. Widen the dimension/aspect-ratio gate that rejects a preview.redd.it image
        // from embedding at all — see the class doc for why. Both constants are unique in
        // this method (confirmed by hand via apktool), and each replacement touches only
        // the single existing instruction that defines it (register v3, read immediately
        // afterward by an existing, unmodified comparison) — no new registers or branches.
        val aspectRatioThresholdIndex = htmlImpl.instructions.indexOfFirst { instruction ->
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0.2f.toRawBits()
        }
        if (aspectRatioThresholdIndex == -1) {
            error(
                "Could not find the 0.2f aspect ratio threshold in " +
                    "SyncHtmlToSpannedConverter's preview.redd.it handling. This build's " +
                    "method structure may differ from what was inspected — re-check with " +
                    "apktool.",
            )
        }
        htmlMethod.replaceInstruction(
            aspectRatioThresholdIndex,
            "const v3, ${WIDENED_ASPECT_RATIO_THRESHOLD.toRawBits()}",
        )

        val dimensionThresholdIndex = htmlImpl.instructions.indexOfFirst { instruction ->
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 2000
        }
        if (dimensionThresholdIndex == -1) {
            error(
                "Could not find the 2000px image dimension threshold in " +
                    "SyncHtmlToSpannedConverter's preview.redd.it handling. This build's " +
                    "method structure may differ from what was inspected — re-check with " +
                    "apktool.",
            )
        }
        htmlMethod.replaceInstruction(dimensionThresholdIndex, "const/16 v3, $MAX_INLINE_IMAGE_DIMENSION_PX")

        // 6. Append a caption below the image when its markdown link text isn't just the
        // bare URL — see the class doc for why this is a new helper rather than a branch
        // spliced into this method, and why the viewer-title half of HK Morphe Patches'
        // version isn't ported.
        val captionHelperImpl = ImmutableMethodImplementation(8, emptyList(), emptyList(), emptyList())
        val captionHelperDefinition = ImmutableMethod(
            "Lnc/d;",
            "maybeAppendCaption",
            listOf(
                ImmutableMethodParameter("Loc/c;", emptySet(), "converter"),
                ImmutableMethodParameter("Ljava/lang/String;", emptySet(), "linkText"),
                ImmutableMethodParameter("Ljava/lang/String;", emptySet(), "url"),
            ),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            captionHelperImpl,
        )
        val maybeAppendCaption = MutableMethod(captionHelperDefinition)
        maybeAppendCaption.addInstructions(
            """
                invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
                move-result v0
                if-nez v0, :no_caption

                invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
                move-result-object v3
                invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
                move-result-object v4
                invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-nez v0, :no_caption

                const-string v0, "\n"
                invoke-virtual {p0, v0}, Loc/c;->b(Ljava/lang/CharSequence;)V

                const/4 v0, 0x2
                new-array v0, v0, [Ljava/lang/Object;

                new-instance v1, Landroid/text/style/RelativeSizeSpan;
                const v2, ${CAPTION_RELATIVE_TEXT_SIZE.toRawBits()}
                invoke-direct {v1, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V
                const/4 v2, 0x0
                aput-object v1, v0, v2

                new-instance v1, Landroid/text/style/AlignmentSpan${'$'}Standard;
                sget-object v2, Landroid/text/Layout${'$'}Alignment;->ALIGN_CENTER:Landroid/text/Layout${'$'}Alignment;
                invoke-direct {v1, v2}, Landroid/text/style/AlignmentSpan${'$'}Standard;-><init>(Landroid/text/Layout${'$'}Alignment;)V
                const/4 v2, 0x1
                aput-object v1, v0, v2

                invoke-virtual {p0, p1, v0}, Loc/c;->c(Ljava/lang/String;[Ljava/lang/Object;)V

                :no_caption
                return-void
            """.trimIndent(),
        )
        htmlConverterClass.directMethods.add(maybeAppendCaption)

        // Anchor: the one EmoteImageSpan (Lnb/c;) construction after the gate above — the
        // "known dimensions, passes the gate" branch that actually embeds the image inline
        // (the other Lnb/c; construction sites elsewhere in this method are for unrelated
        // link types and the no-metadata Giphy fallback already handled in item 4).
        val imageSpanIndex = htmlImpl.instructions.withIndex().firstOrNull { (index, instruction) ->
            index > dimensionThresholdIndex &&
                instruction.opcode == Opcode.NEW_INSTANCE &&
                ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Lnb/c;"
        }?.index ?: error(
            "Could not find the EmoteImageSpan (Lnb/c;) construction for the " +
                "known-dimensions preview.redd.it image case in SyncHtmlToSpannedConverter. " +
                "This build's method structure may differ from what was inspected — " +
                "re-check with apktool.",
        )

        // The image span (+ its click-handling Lmb/d; sibling span) get appended to the
        // converter a few instructions later via Loc/c;->c(...) — the first such call
        // after the span construction above, and the point to append the caption right
        // after.
        val imageAppendIndex = htmlImpl.instructions.withIndex().firstOrNull { (index, instruction) ->
            index > imageSpanIndex &&
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                    ref is MethodReference && ref.definingClass == "Loc/c;" && ref.name == "c"
                } == true
        }?.index ?: error(
            "Could not find the Loc/c;->c(...) call that appends the known-dimensions " +
                "preview.redd.it image span in SyncHtmlToSpannedConverter. This build's " +
                "method structure may differ from what was inspected — re-check with " +
                "apktool.",
        )

        // p0 = converter, v10 = the link's markdown display text, v11 = this image's
        // UNTRUNCATED URL (both snapshotted above, before item 0's truncateAtHeightParam
        // could strip a trailing "&height=<n>" from the URL that the display text — taken
        // straight from the raw buffer — still has, which is what broke this comparison the
        // first time).
        htmlMethod.addInstructions(
            imageAppendIndex + 1,
            "invoke-static {p0, v10, v11}, Lnc/d;->maybeAppendCaption(Loc/c;Ljava/lang/String;Ljava/lang/String;)V",
        )

        // 7. Give bare i.redd.it (and similar) image/GIF links pasted directly in a
        // comment a real Lnb/c; (EmoteImageSpan) embed instead of the Lnb/d;
        // (InlineImageSpan) link-preview chip they currently get — see the class doc's
        // item 7 for the full investigation and why this mirrors item 4 exactly.
        val inlineImageSpanCtorIndex = htmlImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_DIRECT &&
                (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                    ref is MethodReference &&
                        ref.definingClass == "Lnb/d;" &&
                        ref.name == "<init>" &&
                        ref.parameterTypes == listOf("Ljava/lang/String;", "Ljava/lang/Integer;")
                } == true
        }

        if (inlineImageSpanCtorIndex == -1) {
            error(
                "Could not find the InlineImageSpan (Lnb/d;) construction for the " +
                    "inline-image-preview-eligible link case in SyncHtmlToSpannedConverter. " +
                    "This build's method structure may differ from what was inspected — " +
                    "re-check with apktool.",
            )
        }

        // The 7 instructions before the constructor call build the Lnc/b$a;/footnote
        // wrapper (2 new-instance + the ArrayList-size-based index math feeding the
        // Integer arg); the 14 after it build the click-handling Lmb/d;, register the
        // footnote via Lnc/b;->c(...), and insert its superscripted reference marker.
        val footnoteBlockStart = inlineImageSpanCtorIndex - 7
        htmlImpl.removeInstructions(footnoteBlockStart, 22)
        htmlMethod.addInstructions(
            footnoteBlockStart,
            """
                const/16 v0, 0xc8
                invoke-static {v0}, Lt7/f0;->c(I)I
                move-result v0

                const/16 v1, 0x70
                invoke-static {v1}, Lt7/f0;->c(I)I
                move-result v1

                new-array v5, v7, [Ljava/lang/Object;

                new-instance v10, Lnb/c;
                invoke-direct {v10, v2, v0, v1}, Lnb/c;-><init>(Ljava/lang/String;II)V
                aput-object v10, v5, v8

                new-instance v10, Lmb/d;
                invoke-direct {v10, v2}, Lmb/d;-><init>(Ljava/lang/String;)V
                aput-object v10, v5, v9

                const-string v0, "${'￼'}"
                invoke-virtual {p0, v0, v5}, Loc/c;->c(Ljava/lang/String;[Ljava/lang/Object;)V

                move v0, v9
            """,
        )
    }
}
