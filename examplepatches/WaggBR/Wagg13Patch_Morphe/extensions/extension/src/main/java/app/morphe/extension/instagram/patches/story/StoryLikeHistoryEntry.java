package app.morphe.extension.instagram.patches.story;

/**
 * One recorded story like. Pure data + the two-clock expiry rules:
 * the story is "expired" once {@code postedAt + DAY_MS} has passed, but the
 * entry stays in the panel until {@code likedAt + DAY_MS}.
 */
public final class StoryLikeHistoryEntry {
    public static final long DAY_MS = 86_400_000L;

    public final String storyId;
    public final String authorId;
    public final String username;
    public final String displayName;
    public final long postedAt;
    public final long likedAt;
    public final String thumbnailPath;

    public StoryLikeHistoryEntry(
            String storyId,
            String authorId,
            String username,
            String displayName,
            long postedAt,
            long likedAt,
            String thumbnailPath) {
        this.storyId = storyId;
        this.authorId = authorId;
        this.username = username;
        this.displayName = displayName;
        this.postedAt = postedAt;
        this.likedAt = likedAt;
        this.thumbnailPath = thumbnailPath;
    }

    /** The story itself has left Instagram (posted + 24h). Unknown publish times are never expired. */
    public boolean isExpired(long now) {
        return postedAt > 0L && now >= postedAt + DAY_MS;
    }

    /** The entry should disappear from the panel (liked + 24h). */
    public boolean shouldRemove(long now) {
        return now >= likedAt + DAY_MS;
    }
}
