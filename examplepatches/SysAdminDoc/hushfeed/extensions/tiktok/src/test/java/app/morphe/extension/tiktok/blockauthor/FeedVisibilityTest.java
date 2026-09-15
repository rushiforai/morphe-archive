package app.morphe.extension.tiktok.blockauthor;

import static org.junit.Assert.*;

import android.app.Activity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import app.morphe.extension.shared.diagnostics.HookStatus;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
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
     * What a reshuffled resource table looks like from here: the tab names resolve to nothing.
     * The block button then cannot tell the feed from any other screen, and the Hook status row
     * has to say so, the way the caption, comment, inbox and share sheet lookups do.
     */
    @Test public void aBuildWithoutTheTabIdsSaysSoOnTheHookStatusRow() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = controller.get();
            HookStatus.clear();
            FeedVisibility.resolveForTests(activity.getPackageName(), "o1k", 0);
            FeedVisibility.resolveForTests(activity.getPackageName(), "o1l", 0);

            assertNull(FeedVisibility.homeTabView(activity));
            assertNull(FeedVisibility.inboxTabView(activity));

            assertEquals(java.util.Arrays.asList("view id 'o1k'", "view id 'o1l'"),
                    HookStatus.missing("bottom navigation"));
            assertTrue(String.join(" ", HookStatus.report()).contains("bottom navigation"));
        } finally {
            HookStatus.clear();
        }
    }
}
