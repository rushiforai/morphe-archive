/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.stories.seen

import app.morphe.patcher.Fingerprint

/**
 * The method that builds Instagram's request telling it which stories you've seen, a method of the
 * batch it sends: the one holding both the media/seen/ path and the name it sends the ids of
 * stories it counts as seen under.
 */
internal object StorySeenRequestFingerprint : Fingerprint(
    strings = listOf("media/seen/?reel=%s&live_vod=0", "force_seen_story_ids"),
)

/**
 * The method of PendingReelSeenStateStore that reads the batches a session saved to disk. Its class
 * is the store that sends each batch.
 */
internal object PendingStorySeenStoreFingerprint : Fingerprint(
    strings = listOf("pending_reel_seen_states_", "PendingReelSeenStateStore.deserializeFromDisk"),
)

/**
 * The story viewer's header binder, the one method holding the trace section Instagram names after
 * it. It's handed the account signed in, the story on screen and the story's view holder.
 */
internal object StoryHeaderBinderFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("ReelViewerItemBinder.bindHeaderViews"),
)

/**
 * RecyclerView's ViewHolder constructor, the one method holding the message it throws for a null
 * item view. Its class keeps the item view every holder hands it, the story viewer's included.
 */
internal object ViewHolderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("itemView may not be null"),
)
