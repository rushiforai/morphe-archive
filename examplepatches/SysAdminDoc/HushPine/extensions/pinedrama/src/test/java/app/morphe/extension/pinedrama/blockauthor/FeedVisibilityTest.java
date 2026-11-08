package app.morphe.extension.pinedrama.blockauthor;

import static org.junit.Assert.*;

import android.app.Activity;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import app.morphe.extension.shared.diagnostics.HookStatus;
import com.ss.android.ugc.aweme.common.widget.VerticalViewPager;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class FeedVisibilityTest {
    @Test public void compactHeaderStillCountsAsAVisibleCommentSheet() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout content = activity.findViewById(android.R.id.content);
            FrameLayout sheet = new FrameLayout(activity);
            sheet.setId(0x7f0a1001);
            TextView title = new TextView(activity);
            title.setId(0x7f0a1002);
            sheet.addView(title, new FrameLayout.LayoutParams(200, 80));
            content.addView(sheet, new FrameLayout.LayoutParams(500, 700));
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:idd", sheet.getId());
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:m6k", title.getId());

            assertTrue(FeedVisibility.isCommentSheetVisible(activity));
            title.setVisibility(View.GONE);
            assertTrue("the compact header made the block button cover comment actions",
                    FeedVisibility.isCommentSheetVisible(activity));
            title.setVisibility(View.VISIBLE);
            sheet.setVisibility(View.GONE);
            assertFalse(FeedVisibility.isCommentSheetVisible(activity));
        }
    }

    @Test public void cachedCommentSheetBelowTheScreenDoesNotHideFeedControls() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout content = activity.findViewById(android.R.id.content);
            FrameLayout sheet = new FrameLayout(activity);
            sheet.setId(0x7f0a1001);
            TextView title = new TextView(activity);
            title.setId(0x7f0a1002);
            sheet.addView(title, new FrameLayout.LayoutParams(200, 80));
            content.addView(sheet, new FrameLayout.LayoutParams(500, 700));
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:idd", sheet.getId());
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:m6k", title.getId());
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            assertTrue(FeedVisibility.isCommentSheetVisible(activity));
            sheet.setTranslationY(content.getHeight() + 100f);
            assertFalse("PineDrama's off-screen cached sheet hid the feed controls",
                    FeedVisibility.isCommentSheetVisible(activity));
        }
    }

    /**
     * A creator's profile opened from the feed by the name or the avatar is a page of the same
     * horizontal pager as the feed. The pager scrolls the feed's page, bottom navigation and
     * all, one screen width to the left, where the Home tab stays VISIBLE and selected: on
     * 46.2.3 it answered shown and selected with a global visible rect of [-1080,2043][-864,2181]
     * while the profile covered the feed, and the three chips stayed drawn over the profile's
     * grid, live, for the video underneath. A tab has to have pixels on screen to count.
     */
    @Test public void aProfileScrolledOverTheFeedIsNotTheFeed() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout pager = new FrameLayout(activity);
            FrameLayout feedPage = new FrameLayout(activity);
            feedPage.addView(new VerticalViewPager(activity), new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            View homeTab = new View(activity);
            homeTab.setId(0x7f0a4b89);
            homeTab.setSelected(true);
            feedPage.addView(homeTab, new FrameLayout.LayoutParams(60, 40, Gravity.BOTTOM));
            pager.addView(feedPage, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            activity.setContentView(pager);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue("the window never laid out", homeTab.getWidth() > 0 && pager.getWidth() > 0);
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", homeTab.getId());
            try {
                assertTrue(FeedVisibility.isOnFeed(activity));
                assertTrue(FeedVisibility.onRecommendationFeed(activity));

                // The name tap: the pager scrolls to the profile page, one screen width right.
                pager.scrollTo(pager.getWidth(), 0);
                assertTrue("the tab still reads shown and selected",
                        homeTab.isShown() && homeTab.isSelected());
                assertFalse("a profile scrolled over the feed counted as the feed",
                        FeedVisibility.isOnFeed(activity));
                assertFalse(FeedVisibility.onRecommendationFeed(activity));

                // Back: the feed's page returns under the finger.
                pager.scrollTo(0, 0);
                assertTrue(FeedVisibility.isOnFeed(activity));
                assertTrue(FeedVisibility.onRecommendationFeed(activity));
            } finally {
                // The id cache is process-wide and this class shares a loader with every other
                // test: a tab id left resolved answers for whatever runs next.
                FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", 0);
            }
        }
    }

    /**
     * The top tabs on 47.6.3 are pages of one sideways pager above the bottom bar: For You and
     * Following each hold a video feed's pager, and Shop and the Nearby tab hold a store and a
     * grid with search boxes. The Home tab stays shown and selected on all four, so the filtered
     * count sat over Shop's search box (S22, 2026-10-23). The pages here sit where TikTok lays
     * them, a screen width apart, and the pager scrolls between them.
     */
    @Test public void shopAndNearbyAreNotTheRecommendationFeed() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout root = new FrameLayout(activity);
            FrameLayout topTabs = new FrameLayout(activity);
            FrameLayout forYou = page(activity, true);
            FrameLayout shop = page(activity, false);
            FrameLayout following = page(activity, true);
            FrameLayout nearby = page(activity, false);
            topTabs.addView(forYou, matchParent());
            topTabs.addView(shop, matchParent());
            topTabs.addView(nearby, matchParent());
            root.addView(topTabs, matchParent());
            View homeTab = new View(activity);
            homeTab.setId(0x7f0a4b89);
            homeTab.setSelected(true);
            root.addView(homeTab, new FrameLayout.LayoutParams(60, 40, Gravity.BOTTOM));
            activity.setContentView(root);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            int width = topTabs.getWidth();
            assertTrue("the window never laid out", width > 0 && homeTab.getWidth() > 0);
            shop.setTranslationX(width);
            nearby.setTranslationX(2 * width);
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", homeTab.getId());
            try {
                assertTrue(FeedVisibility.onRecommendationFeed(activity));

                topTabs.scrollTo(width, 0);
                assertTrue("the tab still reads shown and selected",
                        homeTab.isShown() && homeTab.isSelected());
                assertFalse("Shop counted as the recommendation feed",
                        FeedVisibility.onRecommendationFeed(activity));
                // The lock's own check asks for the tab alone and still covers it.
                assertTrue(FeedVisibility.onFeedTab(activity));

                topTabs.scrollTo(2 * width, 0);
                assertFalse("the Nearby tab counted as the recommendation feed",
                        FeedVisibility.onRecommendationFeed(activity));

                topTabs.scrollTo(0, 0);
                assertTrue(FeedVisibility.onRecommendationFeed(activity));

                // Following's page built after For You's was found: the next search finds it.
                topTabs.addView(following, matchParent());
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                following.setTranslationX(-width);
                topTabs.scrollTo(-width, 0);
                Shadows.shadowOf(Looper.getMainLooper())
                        .idleFor(java.time.Duration.ofMillis(FeedVisibility.FEED_PAGER_SEARCH_GAP_MS));
                assertTrue("Following's feed was not found",
                        FeedVisibility.onRecommendationFeed(activity));
                topTabs.scrollTo(width, 0);
                assertFalse(FeedVisibility.onRecommendationFeed(activity));
                topTabs.scrollTo(-width, 0);
                assertTrue(FeedVisibility.onRecommendationFeed(activity));

                // A feed's pager hidden on its page is not on show.
                following.getChildAt(0).setVisibility(View.GONE);
                Shadows.shadowOf(Looper.getMainLooper())
                        .idleFor(java.time.Duration.ofMillis(FeedVisibility.FEED_PAGER_SEARCH_GAP_MS));
                assertFalse(FeedVisibility.onRecommendationFeed(activity));
            } finally {
                FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", 0);
            }
        }
    }

    /**
     * A cold start asks before the feed's pager is built, and the pass that brings it can come
     * right after. Until this activity has a feed pager, every ask searches, so the label can't
     * wait for a layout pass that never comes.
     */
    @Test public void aFeedBuiltRightAfterAFailedLookIsFoundAtOnce() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout root = new FrameLayout(activity);
            View homeTab = new View(activity);
            homeTab.setId(0x7f0a4b89);
            homeTab.setSelected(true);
            root.addView(homeTab, new FrameLayout.LayoutParams(60, 40, Gravity.BOTTOM));
            activity.setContentView(root);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", homeTab.getId());
            try {
                assertFalse("no feed's pager yet", FeedVisibility.onRecommendationFeed(activity));
                root.addView(new VerticalViewPager(activity), 0, matchParent());
                assertTrue("the feed built right after a failed look was missed",
                        FeedVisibility.onRecommendationFeed(activity));
            } finally {
                FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", 0);
            }
        }
    }

    /** A top tab page, holding a video feed's pager when it is one of the feeds. */
    private static FrameLayout page(Activity activity, boolean feed) {
        FrameLayout page = new FrameLayout(activity);
        if (feed) page.addView(new VerticalViewPager(activity), matchParent());
        return page;
    }

    private static FrameLayout.LayoutParams matchParent() {
        return new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }

    /**
     * An ancestor that has not laid out, or that draws outside itself, cannot prove the tab is
     * gone; one that has laid out at nothing can. The first two used to answer "not the feed" on
     * the feed, which costs the reader the button and lifts the daily hold, since
     * {@code SessionLockOverlay} hides its panel on the same question.
     */
    @Test public void onlyAnAncestorThatCanHideTheTabCountsAgainstIt() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout outer = new FrameLayout(activity);
            activity.setContentView(outer);
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            // Added after the last pass and never idled, so this group has not laid out.
            FrameLayout fresh = new FrameLayout(activity);
            View homeTab = new View(activity);
            homeTab.setId(0x7f0a4b89);
            homeTab.setSelected(true);
            fresh.addView(homeTab, new FrameLayout.LayoutParams(60, 40));
            outer.addView(fresh, new FrameLayout.LayoutParams(200, 200));
            homeTab.layout(0, 0, 60, 40);
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", homeTab.getId());
            try {
                assertFalse("the fixture's ancestor has laid out after all", fresh.isLaidOut());
                assertTrue("an ancestor that has not laid out counted as hiding the tab",
                        FeedVisibility.isOnFeed(activity));

                // Laid out, and drawing outside itself: a child beyond its box is on screen,
                // which is the whole point of clipChildren being false.
                fresh.layout(0, 0, 10, 10);
                fresh.setClipChildren(false);
                homeTab.layout(200, 200, 260, 240);
                assertTrue("a group that does not clip counted as hiding the tab",
                        FeedVisibility.isOnFeed(activity));

                // With clipping on, the same geometry is genuinely out of sight.
                fresh.setClipChildren(true);
                assertFalse("a clipped group did not hide a tab laid out outside it",
                        FeedVisibility.isOnFeed(activity));

                // And a group collapsed to nothing hides what is inside it, which is one of the
                // ways a bar goes away without GONE.
                fresh.layout(0, 0, 0, 0);
                homeTab.layout(0, 0, 60, 40);
                assertFalse("a group collapsed to nothing counted as showing the tab",
                        FeedVisibility.isOnFeed(activity));
            } finally {
                FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", 0);
            }
        }
    }

    /**
     * What a reshuffled resource table looks like from here: the tab names resolve to nothing.
     * The block button then cannot tell the feed from any other screen, and the Hook status row
     * has to say so, the way the caption, comment, inbox and share sheet lookups do.
     */
    @Test public void aBuildWithoutTheTabIdsSaysSoOnTheHookStatusRow() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            HookStatus.clear();
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", 0);
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs8", 0);

            assertNull(FeedVisibility.homeTabView(activity));
            assertNull(FeedVisibility.inboxTabView(activity));

            assertEquals(java.util.Arrays.asList(
                            "view id 'Home tab (47.6.3:hs7)'",
                            "view id 'Inbox tab (47.6.3:hs8)'"),
                    HookStatus.missing("bottom navigation"));
            assertTrue(String.join(" ", HookStatus.report()).contains("bottom navigation"));
        } finally {
            HookStatus.clear();
        }
    }

    /**
     * A resource name that exists in the table but whose view is not in the activity tree is a
     * closed surface (comments not open, story not playing), not a missing anchor. No miss
     * should be recorded, because the name proving it exists is enough to say the build is fine.
     */
    @Test public void aResolvingNameWithNoAttachedViewRecordsNoMiss() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            HookStatus.clear();
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", 0x7f0a4703);
            try {
                assertNull(FeedVisibility.homeTabView(activity));
                assertTrue("a resolving name without an attached view was reported as missing",
                        HookStatus.missing("bottom navigation").isEmpty());
            } finally {
                FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", 0);
                HookStatus.clear();
            }
        }
    }

    @Test public void aTabFoundAfterStartupClearsItsTransientMissingReport() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout content = activity.findViewById(android.R.id.content);
            int homeId = 0x7f0a4703;
            FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", homeId);
            HookStatus.clear();
            try {
                // Name resolves but view not yet in tree: no miss with the new behaviour.
                assertNull(FeedVisibility.homeTabView(activity));
                assertTrue("resolving name without view should not report missing",
                        HookStatus.missing("bottom navigation").isEmpty());

                View homeTab = new View(activity);
                homeTab.setId(homeId);
                homeTab.setSelected(true);
                content.addView(homeTab, new FrameLayout.LayoutParams(
                        216, 138, Gravity.BOTTOM));
                Shadows.shadowOf(Looper.getMainLooper()).idle();

                assertSame(homeTab, FeedVisibility.homeTabView(activity));
                assertTrue(HookStatus.missing("bottom navigation").isEmpty());
            } finally {
                FeedVisibility.resolveForTests(activity.getPackageName(), "47.6.3:hs7", 0);
                HookStatus.clear();
            }
        }
    }
}
