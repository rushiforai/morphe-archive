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
