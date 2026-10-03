package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public final class HomeFeedClassifierTest {
    @Test
    public void classifiesReelsAndStoriesCategories() {
        assertEquals(
                HomeFeedFilter.Kind.REELS_PANEL,
                HomeFeedFilter.classify("FB_SHORTS", "Story")
        );
        assertEquals(
                HomeFeedFilter.Kind.REELS_PANEL,
                HomeFeedFilter.classify(
                        "FB_SHORTS_IN_FEED_UNIT",
                        "Story"
                )
        );
        assertEquals(
                HomeFeedFilter.Kind.REELS_PANEL,
                HomeFeedFilter.classify(
                        "FB_SHORTS_MIDCARD_H_SCROLL",
                        "Story"
                )
        );
        assertEquals(
                HomeFeedFilter.Kind.STORIES_TRAY,
                HomeFeedFilter.classify(
                        "MULTI_FB_STORIES_TRAY",
                "Story"
            )
        );
    }

    @Test
    public void classifiesReelsFeedObjectTypes() {
        assertEquals(
                HomeFeedFilter.Kind.REELS_PANEL,
                HomeFeedFilter.classify(
                        "",
                        "GraphQLFanHubReelsUnitFeedObject"
                )
        );
        assertEquals(
                HomeFeedFilter.Kind.REELS_PANEL,
                HomeFeedFilter.classify("", "VideoHomeFeedUnit")
        );
        assertEquals(
                HomeFeedFilter.Kind.REELS_PANEL,
                HomeFeedFilter.classify("", "GraphQLShowcaseFeedUnit")
        );
    }

    @Test
    public void classifiesExactRecommendationTypes() {
        assertEquals(
                HomeFeedFilter.Kind.RECOMMENDATION_MODULE,
                HomeFeedFilter.classify(
                        "",
                        "GraphQLPaginatedPeopleYouMayKnowFeedUnit"
                )
        );
        assertEquals(
                HomeFeedFilter.Kind.RECOMMENDATION_MODULE,
                HomeFeedFilter.classify(
                        "",
                        "GroupsYouShouldJoinFeedUnit"
                )
        );
    }

    @Test
    public void classifiesInjectedStoriesAsSuggestions() {
        assertEquals(
                HomeFeedFilter.Kind.SUGGESTED_POST,
                HomeFeedFilter.classify(
                        "INJECTED_STORY",
                        "Story"
                )
        );
    }

    @Test
    public void preservesOrganicAndUnknownTypes() {
        assertEquals(
                HomeFeedFilter.Kind.ORGANIC,
                HomeFeedFilter.classify("ORGANIC", "Story")
        );
        assertEquals(
                HomeFeedFilter.Kind.UNKNOWN,
                HomeFeedFilter.classify(
                        "",
                        "MySuggestedPersonalPost"
                )
        );
    }
}
