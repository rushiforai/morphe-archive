package io.github.kirby1997.patches.twitter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// True removal of promoted (ad / "Sponsored") posts from every timeline.
//
// Pipeline (com.x.repositories.urt.g): the persisted timeline is read as a
// Flow<List<UrtTimelineItem>>, wrapped in an onEach-style operator whose side-effect
// action is the SuspendLambda com.x.repositories.urt.e (the list is in its field n),
// then forwarded downstream to the render StateFlow. o1 emits the SAME list instance,
// so mutating it inside the action removes the items everywhere at once — no row, no gap.
// Classifier com.x.repositories.urt.b.b(UrtTimelineItem) returns non-null iff the item
// carries TimelinePromotedMetadata (the app's own ad oracle). The DB-backed list is a
// mutable ArrayList, so Iterator.remove() is safe.
//
// Registers: invokeSuspend is .locals 4; at offset 0 none of v0..v3 are live (the
// original body's first act is to reload v0), so v0/v1 are free scratch.
private const val DROP_PROMOTED_ITEMS = """
    iget-object v0, p0, Lcom/x/repositories/urt/e;->n:Ljava/lang/Object;
    check-cast v0, Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v0
    :adfilter_loop
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :adfilter_done
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/x/models/timelines/items/UrtTimelineItem;
    invoke-static {v1}, Lcom/x/repositories/urt/b;->b(Lcom/x/models/timelines/items/UrtTimelineItem;)Lcom/x/repositories/urt/b${'$'}a;
    move-result-object v1
    if-eqz v1, :adfilter_loop
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V
    goto :adfilter_loop
    :adfilter_done
"""

// The onEach side-effect run on every DB emission of the timeline item list.
object TimelineItemsOnEachFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    definingClass = "Lcom/x/repositories/urt/e;",
    name = "invokeSuspend",
)

@Suppress("unused")
val removePromotedTimelineItemsPatch = bytecodePatch(
    name = "Remove promoted timeline items",
    description = "Drops promoted (ad / \"Sponsored\") posts, event summaries, and trends from every " +
        "timeline before they are rendered. RE artifact for X 12.4.1, which is native-PairIP-wrapped " +
        "and not sideload-patchable unrooted — default-off.",
    default = false,
) {
    compatibleWith(Constants.TWITTER)

    execute {
        TimelineItemsOnEachFingerprint.method.addInstructions(0, DROP_PROMOTED_ITEMS)
    }
}
