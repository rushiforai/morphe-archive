package app.morphe.extension.tiktok.blockauthor;

import static org.junit.Assert.*;

import android.app.Activity;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import app.morphe.extension.shared.diagnostics.HookStatus;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class FeedVisibilityTest {
    @Test public void commentsRequireTheVisibleSheetAndItsTitle() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout content = activity.findViewById(android.R.id.content);
            FrameLayout sheet = new FrameLayout(activity);
            sheet.setId(0x7f0a1001);
            TextView title = new TextView(activity);
            title.setId(0x7f0a1002);
            sheet.addView(title, new FrameLayout.LayoutParams(200, 80));
            content.addView(sheet, new FrameLayout.LayoutParams(500, 700));
            FeedVisibility.resolveForTests(activity.getPackageName(), "p_5", sheet.getId());
            FeedVisibility.resolveForTests(activity.getPackageName(), "vjb", title.getId());

            assertTrue(FeedVisibility.isCommentSheetVisible(activity));
            title.setVisibility(View.GONE);
            assertFalse(FeedVisibility.isCommentSheetVisible(activity));
            title.setVisibility(View.VISIBLE);
            sheet.setVisibility(View.GONE);
            assertFalse(FeedVisibility.isCommentSheetVisible(activity));
        }
    }

    @Test public void currentCommentSheetIdsWinOverRetained46Resources() {
        // TikTok 47.0.3 moved the live sheet from p_5/vjb to pvp/wk7 while retaining
        // the older obfuscated names in its resource table. A resolved old id can point to
        // unrelated, hidden UI and must not make the real sheet invisible to Hushfeed.
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout content = activity.findViewById(android.R.id.content);
            FrameLayout currentSheet = new FrameLayout(activity);
            currentSheet.setId(0x7f0a4704);
            TextView currentTitle = new TextView(activity);
            currentTitle.setId(0x7f0a4705);
            currentSheet.addView(currentTitle, new FrameLayout.LayoutParams(300, 80));
            content.addView(currentSheet, new FrameLayout.LayoutParams(500, 700));

            FrameLayout retainedOldSheet = new FrameLayout(activity);
            retainedOldSheet.setId(0x7f0a4604);
            retainedOldSheet.setVisibility(View.GONE);
            TextView retainedOldTitle = new TextView(activity);
            retainedOldTitle.setId(0x7f0a4605);
            retainedOldTitle.setVisibility(View.GONE);
            content.addView(retainedOldSheet, new FrameLayout.LayoutParams(1, 1));
            content.addView(retainedOldTitle, new FrameLayout.LayoutParams(1, 1));

            FeedVisibility.resolveForTests(activity.getPackageName(), "pvp", currentSheet.getId());
            FeedVisibility.resolveForTests(activity.getPackageName(), "wk7", currentTitle.getId());
            FeedVisibility.resolveForTests(activity.getPackageName(), "p_5", retainedOldSheet.getId());
            FeedVisibility.resolveForTests(activity.getPackageName(), "vjb", retainedOldTitle.getId());
            try {
                assertTrue(FeedVisibility.isCommentSheetVisible(activity));
                currentTitle.setVisibility(View.GONE);
                assertFalse(FeedVisibility.isCommentSheetVisible(activity));
            } finally {
                String[] names = {"pvp", "wk7", "p_5", "vjb"};
                for (String name : names) {
                    FeedVisibility.resolveForTests(activity.getPackageName(), name, 0);
                }
            }
        }
    }

    @Test public void poppedDetailDoesNotLeaveAnOverlayOnTheProfile() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            View video = new View(activity);
            activity.setContentView(video);
            Object page = new Object();
            FeedVisibility.onDetailView(page, video);
            assertFalse(FeedVisibility.isDetailVisible());
            FeedVisibility.onDetailResume(page);
            assertTrue(FeedVisibility.isDetailVisible());
            FeedVisibility.onDetailPause(page);
            assertFalse(FeedVisibility.isDetailVisible());
            FeedVisibility.onDetailResume(page);
            assertTrue(FeedVisibility.isDetailVisible());
            FeedVisibility.onDetailVisibility(page, false);
            assertFalse(FeedVisibility.isDetailVisible());
            FeedVisibility.onDetailVisibility(page, true);
            video.setVisibility(View.GONE);
            assertFalse(FeedVisibility.isDetailVisible());
            video.setVisibility(View.VISIBLE);
            FeedVisibility.onDetailDestroyed(page);
            assertFalse(FeedVisibility.isDetailVisible());
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
            View homeTab = new View(activity);
            homeTab.setId(0x7f0a4b89);
            homeTab.setSelected(true);
            feedPage.addView(homeTab, new FrameLayout.LayoutParams(60, 40, Gravity.BOTTOM));
            pager.addView(feedPage, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            activity.setContentView(pager);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue("the window never laid out", homeTab.getWidth() > 0 && pager.getWidth() > 0);
            FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", homeTab.getId());
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
                FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0);
            }
        }
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
            FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", homeTab.getId());
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
                FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0);
            }
        }
    }

    /**
     * A story opened from a feed avatar looks exactly like a video detail page to the hooks: the
     * main content is hidden rather than scrolled, so the Home tab is not shown, and the story
     * registers a resumed, visible detail page. The chips were drawn over the story and acted on
     * the video underneath. The viewer's own pager is what tells the two apart.
     */
    @Test public void aStoryIsNotTheDetailPageTheButtonIsKeptFor() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout root = new FrameLayout(activity);
            View detail = new View(activity);
            root.addView(detail, new FrameLayout.LayoutParams(400, 600));
            FrameLayout storyPager = new FrameLayout(activity);
            storyPager.setId(0x7f0a7001);
            root.addView(storyPager, new FrameLayout.LayoutParams(400, 600));
            activity.setContentView(root);
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            // No Home tab on this build's tree: the id resolves to nothing, which is the state
            // a hidden bottom navigation leaves the lookup in.
            FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0);
            FeedVisibility.resolveForTests(activity.getPackageName(), "vp_story_collection",
                    storyPager.getId());
            Object page = new Object();
            FeedVisibility.onDetailView(page, detail);
            FeedVisibility.onDetailResume(page);
            try {
                assertTrue("the fixture does not have a resumed detail page",
                        FeedVisibility.isDetailVisible());
                assertTrue(FeedVisibility.isStoryVisible(activity));

                // The tab lookup answering null is the "assume the feed" case, so the story has
                // to be read off a tree where the tab exists and is hidden, as it is on a phone.
                View homeTab = new View(activity);
                root.addView(homeTab, new FrameLayout.LayoutParams(60, 40));
                homeTab.setId(0x7f0a4b89);
                homeTab.setSelected(true);
                homeTab.setVisibility(View.GONE);
                FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", homeTab.getId());
                Shadows.shadowOf(Looper.getMainLooper()).idle();

                assertFalse("the chips stayed live over a story", FeedVisibility.isOnFeed(activity));

                // The same shape without the story is the detail page the button is kept for.
                storyPager.setVisibility(View.GONE);
                assertFalse(FeedVisibility.isStoryVisible(activity));
                assertTrue("a video detail page lost the button",
                        FeedVisibility.isOnFeed(activity));

                // A viewer dismissed by moving off screen, pager still attached and VISIBLE.
                storyPager.setVisibility(View.VISIBLE);
                storyPager.setTranslationY(5000f);
                assertFalse("a story moved off screen still counted as covering the feed",
                        FeedVisibility.isStoryVisible(activity));
                assertTrue("a detail page lost the button to a dismissed story",
                        FeedVisibility.isOnFeed(activity));
            } finally {
                FeedVisibility.onDetailDestroyed(page);
                FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0);
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
            FeedVisibility.resolveForTests(activity.getPackageName(), "omq", 0);
            FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0);
            FeedVisibility.resolveForTests(activity.getPackageName(), "omr", 0);
            FeedVisibility.resolveForTests(activity.getPackageName(), "o1l", 0);

            assertNull(FeedVisibility.homeTabView(activity));
            assertNull(FeedVisibility.inboxTabView(activity));

            assertEquals(java.util.Arrays.asList(
                            "view id 'Home tab (omq/o1k)'",
                            "view id 'Inbox tab (omr/o1l)'"),
                    HookStatus.missing("bottom navigation"));
            assertTrue(String.join(" ", HookStatus.report()).contains("bottom navigation"));
        } finally {
            HookStatus.clear();
        }
    }

    /**
     * TikTok 47.0.3 renamed the five bottom navigation views. The old Home resource name still
     * exists elsewhere in its table, so resolving a numeric id is not proof that the tab was
     * found. The live tree has to be checked before an older candidate can win.
     */
    @Test public void currentTabIdWinsWhenTheOlderResourceStillExistsElsewhere() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout content = activity.findViewById(android.R.id.content);
            View homeTab = new View(activity);
            homeTab.setId(0x7f0a4703);
            homeTab.setSelected(true);
            content.addView(homeTab, new FrameLayout.LayoutParams(216, 138, Gravity.BOTTOM));
            Shadows.shadowOf(Looper.getMainLooper()).idle();

            HookStatus.clear();
            FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0x7f0a4623);
            FeedVisibility.resolveForTests(activity.getPackageName(), "omq", homeTab.getId());
            try {
                assertSame(homeTab, FeedVisibility.homeTabView(activity));
                assertTrue(FeedVisibility.onRecommendationFeed(activity));
                assertTrue(HookStatus.missing("bottom navigation").isEmpty());
            } finally {
                FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0);
                FeedVisibility.resolveForTests(activity.getPackageName(), "omq", 0);
                HookStatus.clear();
            }
        }
    }

    @Test public void aTabFoundAfterStartupClearsItsTransientMissingReport() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            FrameLayout content = activity.findViewById(android.R.id.content);
            int homeId = 0x7f0a4703;
            FeedVisibility.resolveForTests(activity.getPackageName(), "omq", homeId);
            FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0);
            HookStatus.clear();
            try {
                assertNull(FeedVisibility.homeTabView(activity));
                assertEquals(java.util.Collections.singletonList(
                                "view id 'Home tab (omq/o1k)'"),
                        HookStatus.missing("bottom navigation"));

                View homeTab = new View(activity);
                homeTab.setId(homeId);
                homeTab.setSelected(true);
                content.addView(homeTab, new FrameLayout.LayoutParams(
                        216, 138, Gravity.BOTTOM));
                Shadows.shadowOf(Looper.getMainLooper()).idle();

                assertSame(homeTab, FeedVisibility.homeTabView(activity));
                assertTrue("a recovered startup lookup still made the working build look broken",
                        HookStatus.missing("bottom navigation").isEmpty());
            } finally {
                FeedVisibility.resolveForTests(activity.getPackageName(), "omq", 0);
                FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0);
                HookStatus.clear();
            }
        }
    }
}
