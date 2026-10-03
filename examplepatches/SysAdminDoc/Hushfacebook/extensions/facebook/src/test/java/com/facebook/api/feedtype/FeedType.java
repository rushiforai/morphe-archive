package com.facebook.api.feedtype;

/**
 * Stands in for Facebook's feed type, under its kept name: each one is known by the name it keeps,
 * which is what toString answers, and the built-in ones are public constants.
 */
public final class FeedType {
    public static final FeedType TOP_STORIES = new FeedType("top_stories");
    public static final FeedType FAVORITES = new FeedType("favorites");
    public static final FeedType MOST_RECENT = new FeedType("most_recent");
    public static final FeedType MOST_RECENT_ALL = new FeedType("most_recent_all");
    public static final FeedType MOST_RECENT_FAVORITES = new FeedType("most_recent_favorites");
    public static final FeedType MOST_RECENT_FRIEND = new FeedType("most_recent_friend");
    public static final FeedType MOST_RECENT_GROUP = new FeedType("most_recent_group");
    public static final FeedType MOST_RECENT_PAGE = new FeedType("most_recent_page");

    /** Not a feed type, so the lookup passes it by. */
    public static final String NAME = "favorites";

    /** Not a constant, so the lookup passes it by. */
    public static FeedType lastUsed = new FeedType("favorites");

    private final Object id;

    public FeedType(Object id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return id.toString();
    }
}
