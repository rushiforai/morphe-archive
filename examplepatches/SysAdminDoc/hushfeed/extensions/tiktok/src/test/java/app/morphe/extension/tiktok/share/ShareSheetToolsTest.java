package app.morphe.extension.tiktok.share;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

import java.time.Duration;
import java.util.concurrent.atomic.AtomicInteger;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ShareSheetToolsTest {
    private Context context;

    @Before public void setUp() {
        context = RuntimeEnvironment.getApplication();
        Utils.setContext(context);
        Settings.SHARE_CONFIRM_SEND.save(false);
        ShareSheetTools.resetForTests();
        ShadowToast.reset();
    }

    @After public void tearDown() {
        Settings.SHARE_CONFIRM_SEND.save(false);
        ShareSheetTools.resetForTests();
    }

    @Test public void recycledCellsRestoreTheirOriginalWidthAfterHiding() {
        FrameLayout cell = new FrameLayout(context);
        cell.setLayoutParams(new FrameLayout.LayoutParams(120, 48));

        ShareSheetTools.setCellHidden(cell, true);
        assertEquals(View.GONE, cell.getVisibility());
        assertEquals(0, cell.getLayoutParams().width);

        ShareSheetTools.setCellHidden(cell, false);
        assertEquals(View.VISIBLE, cell.getVisibility());
        assertEquals(120, cell.getLayoutParams().width);

        cell.getLayoutParams().width = 64;
        ShareSheetTools.setCellHidden(cell, true);
        ShareSheetTools.setCellHidden(cell, false);
        assertEquals("the recycled cell returns to its first measured width", 120,
                cell.getLayoutParams().width);
    }

    @Test public void touchAndAccessibilityClickBothUseTheSameTwoStepNativeGate() {
        try (var controller = Robolectric.buildActivity(TestActivity.class).setup()) {
            context = controller.get();
            Utils.setContext(context);
            Settings.SHARE_CONFIRM_SEND.save(true);
            FrameLayout root = new FrameLayout(context);
            controller.get().setContentView(root);

            AtomicInteger touchSends = new AtomicInteger();
            FrameLayout touch = recipient("Alice", new UserRecipient("user-a"), touchSends);
            root.addView(touch, new FrameLayout.LayoutParams(100, 100));
            root.layout(0, 0, 300, 300);
            touch.layout(0, 0, 100, 100);
            AtomicInteger touchActivations = new AtomicInteger();
            touch.setOnClickListener(view -> {
                touchActivations.incrementAndGet();
                if (ShareSheetTools.allowRecipientClick(view)) {
                    touchSends.incrementAndGet();
                }
            });
            dispatchTap(touch);
            assertEquals("the first touch did not reach the native click path", 1,
                    touchActivations.get());
            assertEquals(0, touchSends.get());
            dispatchTap(touch);
            assertEquals("the second touch did not reach the native click path", 2,
                    touchActivations.get());
            assertEquals(1, touchSends.get());

            AtomicInteger accessibilitySends = new AtomicInteger();
            FrameLayout accessibility = recipient(
                    "Bob", new UserRecipient("user-b"), accessibilitySends);
            root.addView(accessibility, new FrameLayout.LayoutParams(100, 100));
            assertTrue(accessibility.performAccessibilityAction(
                    AccessibilityNodeInfo.ACTION_CLICK, null));
            assertEquals(0, accessibilitySends.get());
            assertTrue(accessibility.performAccessibilityAction(
                    AccessibilityNodeInfo.ACTION_CLICK, null));
            assertEquals(1, accessibilitySends.get());
        }
    }

    @Test public void equalDisplayNamesCannotConfirmDifferentRecipients() {
        Settings.SHARE_CONFIRM_SEND.save(true);
        AtomicInteger firstSends = new AtomicInteger();
        AtomicInteger secondSends = new AtomicInteger();
        FrameLayout first = recipient("Alex", new UserRecipient("user-one"), firstSends);
        FrameLayout second = recipient("Alex", new UserRecipient("user-two"), secondSends);

        first.performClick();
        second.performClick();
        assertEquals(0, firstSends.get());
        assertEquals(0, secondSends.get());

        second.performClick();
        assertEquals(0, firstSends.get());
        assertEquals(1, secondSends.get());
    }

    @Test public void rowRebindingAndExpiryDisarmAndRestoreTheNativeForeground() {
        Settings.SHARE_CONFIRM_SEND.save(true);
        AtomicInteger sends = new AtomicInteger();
        FrameLayout cell = recipient("Alex", new UserRecipient("old-user"), sends);
        Drawable nativeForeground = new ColorDrawable(Color.BLUE);
        cell.setForeground(nativeForeground);

        cell.performClick();
        assertEquals(0, sends.get());
        assertNotSame(nativeForeground, cell.getForeground());

        ShareSheetTools.bindRecipient(new TestHolder(cell), new UserRecipient("new-user"));
        assertSame(nativeForeground, cell.getForeground());
        cell.performClick();
        assertEquals("the rebound recipient needs its own first click", 0, sends.get());

        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(4));
        assertSame(nativeForeground, cell.getForeground());
        cell.performClick();
        assertEquals("an expired first click cannot send", 0, sends.get());
        cell.performClick();
        assertEquals(1, sends.get());
        assertSame(nativeForeground, cell.getForeground());
    }

    @Test public void missingLabelStillUsesAGenericTwoStepConfirmation() {
        Settings.SHARE_CONFIRM_SEND.save(true);
        AtomicInteger sends = new AtomicInteger();
        FrameLayout cell = recipient(null, new ConversationRecipient("thread-7"), sends);

        cell.performClick();
        assertEquals(0, sends.get());
        assertEquals("Tap again to send", String.valueOf(ShadowToast.getTextOfLatestToast()));
        cell.performClick();
        assertEquals(1, sends.get());
    }

    @Test public void disabledSettingInvokesTheNativeHandlerOncePerClick() {
        Settings.SHARE_CONFIRM_SEND.save(false);
        AtomicInteger sends = new AtomicInteger();
        FrameLayout cell = recipient("Alice", new UserRecipient("user-a"), sends);

        assertTrue(cell.performClick());
        assertEquals(1, sends.get());
    }

    @Test public void firstActivationFailureCannotReachTheNativeSendHandler() {
        Settings.SHARE_CONFIRM_SEND.save(true);
        AtomicInteger sends = new AtomicInteger();
        FrameLayout cell = new FailingHapticRecipient(context);
        Drawable nativeForeground = new ColorDrawable(Color.BLUE);
        cell.setForeground(nativeForeground);
        cell.setContentDescription("Alice");
        cell.setClickable(true);
        cell.layout(0, 0, 100, 100);
        cell.setOnClickListener(view -> {
            if (ShareSheetTools.allowRecipientClick(view)) {
                sends.incrementAndGet();
            }
        });
        ShareSheetTools.bindRecipient(new TestHolder(cell), new UserRecipient("user-a"));

        assertTrue(cell.performClick());
        assertEquals("a failed confirmation must still consume the first activation", 0,
                sends.get());
        assertSame("a failed confirmation restores TikTok's original row state", nativeForeground,
                cell.getForeground());
    }

    @Test public void disabledConfirmationStillSendsWhenArmedStateCleanupFails() {
        Settings.SHARE_CONFIRM_SEND.save(true);
        AtomicInteger sends = new AtomicInteger();
        FailingRestoreRecipient cell = new FailingRestoreRecipient(context);
        cell.setContentDescription("Alice");
        cell.setClickable(true);
        cell.layout(0, 0, 100, 100);
        cell.setOnClickListener(view -> {
            if (ShareSheetTools.allowRecipientClick(view)) {
                sends.incrementAndGet();
            }
        });
        ShareSheetTools.bindRecipient(new TestHolder(cell), new UserRecipient("user-a"));

        assertTrue(cell.performClick());
        assertEquals(0, sends.get());

        Settings.SHARE_CONFIRM_SEND.save(false);
        cell.failNextForegroundChange();
        assertTrue(cell.performClick());
        assertEquals("disabled confirmation must always reach TikTok's native handler", 1,
                sends.get());
    }

    @Test public void settingReadFailureClearsArmBeforeTheNextActivation() {
        Settings.SHARE_CONFIRM_SEND.save(true);
        AtomicInteger sends = new AtomicInteger();
        FrameLayout cell = recipient("Alice", new UserRecipient("user-a"), sends);

        assertTrue(cell.performClick());
        assertEquals(0, sends.get());

        ShareSheetTools.setConfirmationSettingReaderForTests(() -> {
            throw new IllegalStateException("simulated setting read failure");
        });
        assertTrue(cell.performClick());
        assertEquals(0, sends.get());

        ShareSheetTools.setConfirmationSettingReaderForTests(null);
        assertTrue(cell.performClick());
        assertEquals("the stale first activation cannot confirm after a failed setting read", 0,
                sends.get());
        assertTrue(cell.performClick());
        assertEquals(1, sends.get());
    }

    @Test public void shareChannelActionsLikeRepostAreNotConfirmed() {
        // Repost, Copy link, Save and the rest of the share-channel row reach the same native
        // click gate, but none of them is a bound recipient. With confirmation on, the gate
        // has to let the first tap through instead of arming the two-step send. Reposting a
        // video used to show "tap again to send" and only repost on a second tap.
        Settings.SHARE_CONFIRM_SEND.save(true);
        FrameLayout repost = new FrameLayout(context);
        repost.setContentDescription("Repost");

        assertTrue("the first tap on a non-recipient action passes straight through",
                ShareSheetTools.allowRecipientClick(repost));
        assertTrue("and it keeps passing through, never arming a confirm",
                ShareSheetTools.allowRecipientClick(repost));
        assertNull("a non-recipient action shows no confirm toast", ShadowToast.getLatestToast());
    }

    @Test public void nestedClickTargetsResolveTheModelBoundCell() {
        Settings.SHARE_CONFIRM_SEND.save(true);
        FrameLayout cell = new FrameLayout(context);
        cell.setContentDescription("  Alice  ");
        FrameLayout child = new FrameLayout(context);
        cell.addView(child);
        ShareSheetTools.bindRecipient(new TestHolder(cell), new UserRecipient("user-a"));

        assertSame(cell, ShareSheetTools.cellOf(child));
        assertEquals("Alice", ShareSheetTools.labelOf(cell));
        assertFalse(ShareSheetTools.allowRecipientClick(child));
        assertTrue(ShareSheetTools.allowRecipientClick(child));
    }

    private FrameLayout recipient(String label, Object model, AtomicInteger sends) {
        FrameLayout cell = new FrameLayout(context);
        cell.setContentDescription(label);
        cell.setClickable(true);
        cell.layout(0, 0, 100, 100);
        cell.setOnClickListener(view -> {
            if (ShareSheetTools.allowRecipientClick(view)) {
                sends.incrementAndGet();
            }
        });
        ShareSheetTools.bindRecipient(new TestHolder(cell), model);
        return cell;
    }

    private static void dispatchTap(View view) {
        long now = android.os.SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, 10, 10, 0);
        MotionEvent up = MotionEvent.obtain(now, now + 1, MotionEvent.ACTION_UP, 10, 10, 0);
        try {
            assertTrue(view.dispatchTouchEvent(down));
            assertTrue(view.dispatchTouchEvent(up));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        } finally {
            down.recycle();
            up.recycle();
        }
    }

    public static class BaseTestHolder {
        public final View itemView;
        BaseTestHolder(View itemView) {
            this.itemView = itemView;
        }
    }

    public static final class TestActivity extends Activity {
    }

    private static final class FailingHapticRecipient extends FrameLayout {
        FailingHapticRecipient(Context context) {
            super(context);
        }

        @Override public boolean performHapticFeedback(int feedbackConstant) {
            throw new IllegalStateException("simulated confirmation setup failure");
        }
    }

    private static final class FailingRestoreRecipient extends FrameLayout {
        private boolean failNextForegroundChange;

        FailingRestoreRecipient(Context context) {
            super(context);
        }

        void failNextForegroundChange() {
            failNextForegroundChange = true;
        }

        @Override public void setForeground(Drawable foreground) {
            if (failNextForegroundChange) {
                failNextForegroundChange = false;
                throw new IllegalStateException("simulated row restoration failure");
            }
            super.setForeground(foreground);
        }
    }

    public static final class TestHolder extends BaseTestHolder {
        TestHolder(View itemView) {
            super(itemView);
        }
    }

    public static final class UserRecipient {
        private final String uid;
        UserRecipient(String uid) {
            this.uid = uid;
        }
        public String getUid() {
            return uid;
        }
    }

    public static final class ConversationRecipient {
        private final String id;
        ConversationRecipient(String id) {
            this.id = id;
        }
        public String getConversationId() {
            return id;
        }
    }
}
