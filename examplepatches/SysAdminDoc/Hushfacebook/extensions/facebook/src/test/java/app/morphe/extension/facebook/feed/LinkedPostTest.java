/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;

import com.facebook.graphql.model.GraphQLPagesYouMayLikeFeedUnit;
import com.facebook.graphql.model.GraphQLStory;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The post a link lands Home on stays (issue #306): Facebook serves it as the first edge of the
 * feed, flagged as a recommendation on an account that doesn't follow its author, and "Suggested
 * for you" hid it. The landing screen marks the link, the first post judged within the window
 * keeps whatever reason a rule has, ads excepted, and one link keeps one post.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LinkedPostTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC, SPONSORED, ENGAGEMENT }

    private static final Object RECOMMENDED = FeedGuardForTests.recommendationContext(true);
    private static final Object FOLLOWED = FeedGuardForTests.recommendationContext(false);

    @After
    public void restore() {
        LinkedPost.clearForTests();
        StoryFlag.cachedMembers = null;
        FeedFilterCounters.clear();
        HookStatus.clear();
        BaseSettings.DEBUG.resetToDefault();
        LogBufferManager.clearLogBuffer();
    }

    /** The guard with the suggested patch in, reading the given recommendation context from every story. */
    private static boolean guard(Object category, Object unit, Object context) {
        return FeedFilter.hideEdge(category, unit, true, true, story -> context, false, GenAiLabel.PATCHED);
    }

    private static void linkLanded(long now) {
        assertTrue(LinkedPost.screenCreated(LinkedPost.LANDING_SCREEN, now));
    }

    @Test
    public void theLandingScreensMarkALinkAndTheMarkIsSpentOnce() {
        assertFalse("Home marked a link", LinkedPost.screenCreated("FbMainTabActivity", 1000));
        assertFalse(LinkedPost.screenCreated(null, 1000));
        assertFalse("a mark with no link", LinkedPost.takeFirst(1000));

        linkLanded(1000);
        assertTrue(LinkedPost.screenCreated(LinkedPost.HIGHLIGHT_SCREEN, 1200));
        assertTrue("the first post inside the window", LinkedPost.takeFirst(1200 + LinkedPost.WINDOW_MS));
        assertFalse("the mark was spent", LinkedPost.takeFirst(1300));

        linkLanded(2000);
        assertFalse("a mark past its window", LinkedPost.takeFirst(2000 + LinkedPost.WINDOW_MS + 1));
        assertFalse("a stale mark stays spent", LinkedPost.takeFirst(2000));

        linkLanded(5000);
        assertFalse("a clock read before the link came", LinkedPost.takeFirst(4999));
        assertTrue("a read before the link spent the mark", LinkedPost.takeFirst(5000));
    }

    /** Only a post is one a link lands on: a row between posts, or nothing, never spends the mark. */
    @Test
    public void onlyAPostIsOne() {
        assertTrue(LinkedPost.isPost(new GraphQLStory()));
        assertFalse(LinkedPost.isPost(new GraphQLPagesYouMayLikeFeedUnit()));
        assertFalse(LinkedPost.isPost(new Object()));
        assertFalse(LinkedPost.isPost(null));
    }

    /**
     * The reporter's case: the landed post comes flagged as a recommendation and was hidden. After
     * a link lands, the first post stays, whatever the rule; a row between posts and an ad judged
     * before it don't spend the link; and the post after it is judged as usual.
     */
    @Test
    public void theFirstPostAfterALinkStaysWhateverRuleWouldHideIt() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        assertTrue("the control: a recommended post with no link", guard(Category.ENGAGEMENT, new GraphQLStory(), RECOMMENDED));

        linkLanded(SystemClock.uptimeMillis());
        assertTrue("a row between posts stayed", guard(Category.ORGANIC, new GraphQLPagesYouMayLikeFeedUnit(), RECOMMENDED));
        assertTrue("an ad stayed", guard(Category.SPONSORED, new GraphQLStory(), RECOMMENDED));
        assertFalse("the post the link opened was hidden", guard(Category.ENGAGEMENT, new GraphQLStory(), RECOMMENDED));
        assertTrue("one link kept a second post", guard(Category.ENGAGEMENT, new GraphQLStory(), RECOMMENDED));

        String log = LogBufferManager.buildExportText();
        assertTrue(log, log.contains("Feed filter: kept the post a link opened (is_in_feed_recommendation_story)"));
        String counters = String.join("\n", FeedFilterCounters.report());
        assertTrue(counters, counters.contains(LinkedPost.KEPT_KIND + " 1"));
        assertTrue(counters, counters.contains(FeedFilter.FEED_ROUTE + ": 5 lists, 5 items, 4 removed"));
    }

    /** A landed post no rule would hide spends the link too, and a link past its window keeps nothing. */
    @Test
    public void aPostThatStaysAnywaySpendsTheLinkAndAStaleLinkKeepsNothing() {
        linkLanded(SystemClock.uptimeMillis());
        assertFalse(guard(Category.ORGANIC, new GraphQLStory(), FOLLOWED));
        assertTrue("the link kept the post after the one it opened", guard(Category.ENGAGEMENT, new GraphQLStory(), RECOMMENDED));

        linkLanded(SystemClock.uptimeMillis() - LinkedPost.WINDOW_MS - 1);
        assertTrue("a link past its window kept a post", guard(Category.ENGAGEMENT, new GraphQLStory(), RECOMMENDED));
    }
}
