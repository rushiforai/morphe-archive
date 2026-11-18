package io.github.kirby1997.patches.twitter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.kirby1997.patches.shared.Constants

// Bypasses the empty profile Media tab X shows for withheld/sensitive media by rebuilding it from
// a source the server does not withhold.
//
// The Media tab (ProfileMediaTimelineFragment, legacy timeline type 15) is loaded by
// com.twitter.api.legacy.request.urt.timelines.o, whose n0() names the GraphQL operation
// "media_timeline_v2" (MediaTimelineV2, safety_level UserScopedTimeline). When a profile's media
// is sensitive and the viewer is not authorised for sensitive content (e.g. an age/region
// restricted viewer account), the server returns that operation EMPTY - the "@%s hasn't posted
// media" state. This is a server-side restriction, not a client gate: it holds on every client
// (the web UserPhotoTimeline grid is empty for the same viewer too), so client-side "show
// sensitive media" unmasking cannot fill it - the media is never delivered to that operation.
//
// The posts-and-replies timeline "user_with_profile_tweets_and_replies_query_v2" (the request
// com.twitter.profiles.requests.c builds for the Replies tab) is NOT withheld the same way: the
// owner's own sensitive media still comes back on it. It carries the same variables (rest_id,
// includeTweetVisibilityNudge) and response path (user_result.result.timeline_response.timeline),
// so it can feed the Media tab instead, trimmed back to the owner's own posts with media.
//
// This is a FALLBACK, not an unconditional swap: swapping every profile would wreck the normal
// case, because posts-and-replies is a far sparser media source than the server's media grid (a
// non-restricted account with hundreds of photos yields only a handful of own-media items per
// 20-post page, so its Media tab would show a near-empty, non-scrolling list). Instead n0() keeps
// requesting "media_timeline_v2" and only switches to the replies operation for an owner whose
// media timeline has already come back empty. The decision lives in the extension
// (ProfileMediaTimelineFilter.operation), keyed on the owner rest_id n0() already reads from
// a0.L.c.
//
// Every legacy URT response passes through com.twitter.api.legacy.request.urt.t.a(z3, v2) on
// its way into the timeline database. onProfileMediaResponse runs at the top of that method: for
// an owner already on the fallback it trims the posts-and-replies response to own media (reposts,
// which carry the original author, are dropped); for an owner still on "media_timeline_v2" it
// records the owner when that response has no posts, so the next load of their Media tab uses the
// replies source. The extension checks the timeline type itself and leaves every other timeline
// alone. The fallback can only surface what posts-and-replies contains, so an account that mostly
// reposts has few own-media items and older own media only appears as the viewer scrolls further.
private const val MEDIA_TIMELINE_OPERATION = "media_timeline_v2"

private const val EXTENSION_CLASS =
    "Lio/github/kirby1997/extension/twitter/ProfileMediaTimelineFilter;"

object ProfileMediaTimelineRequestFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/twitter/api/legacy/request/urt/graphql/a;",
    parameters = listOf(),
    definingClass = "Lcom/twitter/api/legacy/request/urt/timelines/o;",
    name = "n0",
)

object TimelineResponseWriterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/twitter/model/timeline/urt/a1;",
    parameters = listOf(
        "Lcom/twitter/model/timeline/urt/z3;",
        "Lcom/twitter/model/timeline/v2;",
    ),
    definingClass = "Lcom/twitter/api/legacy/request/urt/t;",
    name = "a",
)

// .registers 41 with two parameters, so p1 (the response) is v39 - out of reach of the
// non-range invoke forms.
private fun filterCall(method: String) =
    "invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->$method(Ljava/lang/Object;)V"

@Suppress("unused")
val showMediaTabForSensitiveProfilesPatch = bytecodePatch(
    name = "Show media tab for sensitive profiles",
    description = "Bypasses the empty profile Media tab X shows for withheld sensitive media - the " +
        "\"@user hasn't posted media\" state the server returns when the viewer is not authorised " +
        "for sensitive content - by rebuilding the tab from the posts-and-replies timeline, which " +
        "is not withheld, trimmed to the owner's own posts with media (reposts excluded). Only " +
        "affected profiles are touched, and only after their empty media timeline is seen once; " +
        "profiles whose media grid loads normally keep the server's full grid unchanged. The " +
        "posts-and-replies source is sparser than the real grid, so an account that mostly reposts " +
        "shows few own-media items and older media fills in as you scroll.",
) {
    compatibleWith(Constants.TWITTER_12_7_1)
    extendWith("extensions/extension.mpe")

    execute {
        val request = ProfileMediaTimelineRequestFingerprint.method
        val (index, instruction) = request.instructions.withIndex().firstOrNull { (_, instruction) ->
            (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                ((instruction as ReferenceInstruction).reference as StringReference).string ==
                MEDIA_TIMELINE_OPERATION
        } ?: throw PatchException("\"$MEDIA_TIMELINE_OPERATION\" not found in the media timeline request")

        // n0() loads the operation name ("media_timeline_v2") into vN, then stores it into the
        // request builder. Leave that const-string in place and, right after it, let the extension
        // pick the operation for this owner: it returns the original unless the owner's media
        // timeline has already come back empty, in which case it returns the posts-and-replies
        // operation. The owner rest_id is a0.L.c (the long n0() itself reads to set "rest_id").
        // v2/v3 are scratch here - free at this point in n0() and distinct from the op register.
        val register = (instruction as OneRegisterInstruction).registerA
        if (register == 2 || register == 3) {
            throw PatchException("media_timeline_v2 occupies scratch register v$register in n0()")
        }
        request.addInstructions(
            index + 1,
            """
                iget-object v2, p0, Lcom/twitter/api/legacy/request/urt/a0;->L:Lcom/twitter/model/timeline/urt/e2;
                iget-wide v2, v2, Lcom/twitter/model/timeline/urt/e2;->c:J
                invoke-static {v2, v3, v$register}, $EXTENSION_CLASS->operation(JLjava/lang/String;)Ljava/lang/String;
                move-result-object v$register
            """,
        )

        TimelineResponseWriterFingerprint.method.addInstructions(0, filterCall("onProfileMediaResponse"))
    }
}

@Suppress("unused")
val hideMediaTabGifRepliesPatch = bytecodePatch(
    name = "Hide GIF replies from media tab",
    description = "Removes replies whose attached media is an animated GIF from the profile " +
        "Media tab, so reaction-GIF replies don't crowd out the account's own photos and videos.",
) {
    compatibleWith(Constants.TWITTER_12_7_1)
    extendWith("extensions/extension.mpe")

    execute {
        TimelineResponseWriterFingerprint.method.addInstructions(0, filterCall("hideGifReplies"))
    }
}
