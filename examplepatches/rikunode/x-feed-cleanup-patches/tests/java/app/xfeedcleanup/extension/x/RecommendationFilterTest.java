package app.xfeedcleanup.extension.x;

/** Dependency-free regression checks for X recommendation entry IDs. */
public final class RecommendationFilterTest {
    public static void main(String[] args) throws Exception {
        // Post-detail Discover more: the missing case in the original patch.
        expectHidden("tweetdetailrelatedtweets-123456789");
        expectHidden("tweetdetailrelatedtweets");
        expectVisible("tweetdetail-123456789");
        expectVisible("tweetdetail-relatedposts-123456789");
        expectVisible("tweetdetail");
        // Preserve the original Search filter.
        expectHidden("toptabsrpusermodule-123456789");

        // Never drop the original post, genuine replies, or conversation containers.
        expectVisible("tweet-123456789");
        expectVisible("conversationthread-123456789");
        expectVisible("who-to-follow-123456789");
        expectVisible("cursor-bottom-0");
        expectVisible(null);

        // Verify the exact X 12.31/12.32 tile model chain, not guessed entry prefixes.
        expectSportsHidden(com.x.models.timelines.items.TimelineTileFixtures.scoreCard());
        expectSportsVisible(com.x.models.timelines.items.TimelineTileFixtures.standardTile());
        expectSportsVisible(com.x.models.timelines.items.TimelineTileFixtures.missingContent());
        expectSportsVisible(com.x.models.timelines.items.TimelineTileFixtures.missingTile());
        expectSportsVisible(com.x.models.timelines.items.TimelineTileFixtures.misleadingText());
        expectSportsVisible(new TimelineItem("scoreboard-mlb-123"));
        expectSportsVisible(new TimelineItem("sports-score-mlb-123"));
        expectSportsVisible(new TimelineItem("tweet-123456"));
        expectSportsVisible(null);

        // Search relevance survey is its own URT item, never an ordinary post.
        expectPromptHidden(new com.x.models.timelines.items.m1("relevance-prompt-42"));
        expectPromptHidden(new com.x.models.timelines.items.m1(null));
        expectPromptVisible(new TimelineItem("relevance-prompt-42"));
        expectPromptVisible(new TimelineItem("tweet-1"));
        expectPromptVisible(com.x.models.timelines.items.TimelineTileFixtures.scoreCard());
        expectPromptVisible(com.x.models.timelines.items.TimelineTileFixtures.standardTile());
        expectPromptVisible(com.x.models.timelines.items.TimelineTileFixtures.misleadingText());
        expectPromptVisible(null);

        // Check the model's verified entry-id accessor remains usable.
        java.lang.reflect.Method accessor = RecommendationFilter.class
                .getDeclaredMethod("entryId", Object.class);
        accessor.setAccessible(true);
        Object id = accessor.invoke(null, new TimelineItem("tweetdetail-42"));
        if (!"tweetdetail-42".equals(id)) {
            throw new AssertionError("Entry-id accessor stopped finding a public c() method");
        }
        System.out.println("RecommendationFilter: entry IDs, native ScoreCard and Search RelevancePrompt type passed");
    }

    private static void expectHidden(String id) {
        if (!RecommendationFilter.isFindMoreEntryId(id)) {
            throw new AssertionError("Expected Discover more entry to be filtered: " + id);
        }
    }

    private static void expectVisible(String id) {
        if (RecommendationFilter.isFindMoreEntryId(id)) {
            throw new AssertionError("Unrelated timeline entry would be hidden: " + id);
        }
    }

    private static void expectSportsHidden(Object item) {
        if (!RecommendationFilter.isSportsScoreTile(item)) {
            throw new AssertionError("Expected score-card tile to be filtered: " + item);
        }
    }

    private static void expectSportsVisible(Object item) {
        if (RecommendationFilter.isSportsScoreTile(item)) {
            throw new AssertionError("Unrelated timeline item would be hidden: " + item);
        }
    }

    private static void expectPromptHidden(Object item) {
        if (!RecommendationFilter.isSearchRelevancePrompt(item)) {
            throw new AssertionError("Search relevance survey was not recognized");
        }
    }

    private static void expectPromptVisible(Object item) {
        if (RecommendationFilter.isSearchRelevancePrompt(item)) {
            throw new AssertionError("Ordinary timeline item would be hidden: " + item);
        }
    }

    public static final class TimelineItem {
        private final String id;

        TimelineItem(String id) { this.id = id; }
        public String c() { return id; }
    }
}
