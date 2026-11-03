package app.morphe.extension.pinedrama.navigation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

/**
 * A long press on any tab at the top of the feed opens HushPine's settings. The settings patch hands
 * every top tab PineDrama binds to {@link TopTabSettingsShortcut#onTopTab} with its tag. These build
 * the tab the way PineDrama 47.5.3 does: a clickable LinearLayout that takes its tap in performClick,
 * with no listener of its own.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class TopTabSettingsShortcutTest {
    /** The tags PineDrama's top tab protocols answer. The server picks which of them the strip holds. */
    private static final String SHORT_VIDEO = "For You";
    private static final String AI_FICTION = "homepage_ai_series";
    private static final String FOLLOWING = "Following";
    private static final String DRAMA = "Drama";
    /** A tab this code has never heard of, for the next one the server adds. */
    private static final String UNSEEN = "homepage_something_new";

    private ActivityController<Activity> owner;
    private Activity activity;

    /** PineDrama's top tab: its tap is its own performClick (switch to the tab, or reload it). */
    static final class TopTab extends LinearLayout {
        int taps;

        TopTab(Context context) {
            super(context);
            setClickable(true);
        }

        @Override
        public boolean performClick() {
            super.performClick();
            taps++;
            return true;
        }
    }

    @Before public void setUp() {
        TopTabSettingsShortcut.resetForTests();
        owner = Robolectric.buildActivity(Activity.class).setup().visible();
        activity = owner.get();
        Utils.setContext(activity);
        PausedProcess.set(false);
        nextStarted();
    }

    @After public void tearDown() {
        PausedProcess.set(false);
        TopTabSettingsShortcut.resetForTests();
        owner.pause().stop().destroy();
    }

    private TopTab tab() {
        TopTab tab = new TopTab(activity);
        FrameLayout strip = new FrameLayout(activity);
        strip.addView(tab, new FrameLayout.LayoutParams(300, 120));
        activity.setContentView(strip);
        ShadowLooper.idleMainLooper();
        assertTrue("the tab isn't on screen", tab.isAttachedToWindow() && tab.getWidth() == 300);
        return tab;
    }

    private static MotionEvent event(int action, long downTime, float x, float y) {
        return MotionEvent.obtain(downTime, SystemClock.uptimeMillis(), action, x, y, 0);
    }

    /** A finger held on the tab for {@code heldMs}, then lifted. */
    private static void press(View tab, long heldMs) {
        long down = SystemClock.uptimeMillis();
        tab.dispatchTouchEvent(event(MotionEvent.ACTION_DOWN, down, 150, 60));
        ShadowLooper.idleMainLooper(heldMs, TimeUnit.MILLISECONDS);
        tab.dispatchTouchEvent(event(MotionEvent.ACTION_UP, down, 150, 60));
        ShadowLooper.idleMainLooper();
    }

    private static long longPress() {
        return ViewConfiguration.getLongPressTimeout() + 100;
    }

    private static Intent nextStarted() {
        return Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity();
    }

    private static void assertOpenedSettings() {
        Intent opened = nextStarted();
        assertNotNull("a long press on a top tab didn't open HushPine settings", opened);
        assertEquals("morphe_settings", opened.getAction());
        assertNull("it opened settings somewhere other than their home page",
                opened.getStringExtra("morphe_settings_section"));
    }

    /** Which tabs the strip holds is up to the server, so none of them is special. */
    @Test public void aLongPressOnAnyTopTabOpensHushPineSettings() {
        for (String tag : new String[]{SHORT_VIDEO, AI_FICTION, FOLLOWING, DRAMA, UNSEEN}) {
            TopTab tab = tab();
            TopTabSettingsShortcut.onTopTab(tab, tag);

            press(tab, longPress());

            assertOpenedSettings();
            assertEquals(tag + " gave no long-press vibration",
                    HapticFeedbackConstants.LONG_PRESS, Shadows.shadowOf(tab).lastHapticFeedbackPerformed());
            assertEquals("letting go after the long press on " + tag + " was also a tap", 0, tab.taps);
        }
    }

    @Test public void aTapIsStillPineDramas() {
        TopTab tab = tab();
        TopTabSettingsShortcut.onTopTab(tab, DRAMA);

        press(tab, 80);

        assertEquals("the tap didn't reach PineDrama's tab", 1, tab.taps);
        assertNull("a tap opened the settings", nextStarted());
    }

    /** PineDrama reuses its top tab views, and binds the same one again as tabs come and go. */
    @Test public void aTabBoundAgainOpensTheSettingsOnce() {
        TopTab tab = tab();
        TopTabSettingsShortcut.onTopTab(tab, AI_FICTION);
        TopTabSettingsShortcut.onTopTab(tab, AI_FICTION);
        press(tab, longPress());
        assertOpenedSettings();
        assertNull("binding the tab twice opened the settings twice", nextStarted());

        TopTabSettingsShortcut.onTopTab(tab, SHORT_VIDEO);
        press(tab, longPress());
        assertOpenedSettings();
        assertNull("the tab's next tag opened the settings twice", nextStarted());
        assertEquals("the long press was also a tap", 0, tab.taps);
    }

    @Test public void aLongPressPineDramaGaveTheTabStaysPineDramas() {
        TopTab tab = tab();
        AtomicInteger own = new AtomicInteger();
        tab.setOnLongClickListener(view -> {
            own.incrementAndGet();
            return true;
        });
        TopTabSettingsShortcut.onTopTab(tab, DRAMA);

        press(tab, longPress());

        assertEquals("PineDrama's own long press didn't run", 1, own.get());
        assertNull("the long press was taken from PineDrama", nextStarted());
        assertNull("TalkBack was offered a second long press beside PineDrama's",
                openAction(tab.createAccessibilityNodeInfo()));
    }

    /**
     * TalkBack can't time a press, so each top tab names the long press as an action TalkBack lists.
     * The tab keeps its click, and the action doesn't tap the tab.
     */
    @Test public void talkBackGetsANamedActionThatOpensTheSettings() {
        TopTab tab = tab();
        TopTabSettingsShortcut.onTopTab(tab, FOLLOWING);

        AccessibilityNodeInfo info = tab.createAccessibilityNodeInfo();
        AccessibilityNodeInfo.AccessibilityAction action = openAction(info);
        assertNotNull("a top tab offers TalkBack no way to the settings", action);
        assertTrue("PineDrama's tap went missing from the actions",
                info.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
        assertTrue(tab.performAccessibilityAction(action.getId(), null));
        assertOpenedSettings();
        assertEquals("the action tapped the tab as well", 0, tab.taps);
    }

    /** A delegate PineDrama gave the tab still answers for it under the action. */
    @Test public void pineDramasOwnAccessibilityDelegateStillAnswers() {
        TopTab tab = tab();
        tab.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setContentDescription("Drama, selected");
            }
        });
        TopTabSettingsShortcut.onTopTab(tab, DRAMA);

        AccessibilityNodeInfo info = tab.createAccessibilityNodeInfo();
        assertEquals("PineDrama's own description was lost", "Drama, selected", String.valueOf(info.getContentDescription()));
        assertNotNull(openAction(info));
    }

    /** PineDrama can set a delegate after the first bind. The next bind wraps it, once. */
    @Test public void aDelegatePineDramaSetsLaterIsWrappedOnTheNextBind() {
        TopTab tab = tab();
        TopTabSettingsShortcut.onTopTab(tab, DRAMA);
        tab.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setContentDescription("Drama, selected");
            }
        });
        assertNull(openAction(tab.createAccessibilityNodeInfo()));

        TopTabSettingsShortcut.onTopTab(tab, DRAMA);
        TopTabSettingsShortcut.onTopTab(tab, DRAMA);

        AccessibilityNodeInfo info = tab.createAccessibilityNodeInfo();
        assertNotNull("the bind after PineDrama's delegate didn't bring the action back", openAction(info));
        assertEquals("PineDrama's later delegate was lost", "Drama, selected", String.valueOf(info.getContentDescription()));
        long offered = info.getActionList().stream()
                .filter(action -> "Open HushPine settings".equals(String.valueOf(action.getLabel()))).count();
        assertEquals("binding again stacked the action", 1, offered);
    }

    private static AccessibilityNodeInfo.AccessibilityAction openAction(AccessibilityNodeInfo info) {
        for (AccessibilityNodeInfo.AccessibilityAction action : info.getActionList()) {
            if ("Open HushPine settings".equals(String.valueOf(action.getLabel()))) return action;
        }
        return null;
    }

    @Test public void slidingOffTheTabLetsGo() {
        TopTab tab = tab();
        TopTabSettingsShortcut.onTopTab(tab, DRAMA);
        long down = SystemClock.uptimeMillis();

        tab.dispatchTouchEvent(event(MotionEvent.ACTION_DOWN, down, 150, 60));
        tab.dispatchTouchEvent(event(MotionEvent.ACTION_MOVE, down, 150, 900));
        ShadowLooper.idleMainLooper(longPress(), TimeUnit.MILLISECONDS);
        tab.dispatchTouchEvent(event(MotionEvent.ACTION_UP, down, 150, 900));
        ShadowLooper.idleMainLooper();

        assertNull("a finger that slid off the tab still opened the settings", nextStarted());
        assertEquals("letting go off the tab was a tap", 0, tab.taps);
    }

    /** No switch reads it, so it's still the way back to the switch while HushPine is paused. */
    @Test public void pauseLeavesItWorking() {
        PausedProcess.set(true);
        TopTab tab = tab();
        TopTabSettingsShortcut.onTopTab(tab, DRAMA);

        press(tab, longPress());

        assertOpenedSettings();
    }

    /** The tag only goes in the log, so a tab that answers none still works. */
    @Test public void aTabWithoutATagStillOpensTheSettings() {
        TopTab tab = tab();
        TopTabSettingsShortcut.onTopTab(tab, null);

        press(tab, longPress());

        assertOpenedSettings();
    }

    @Test public void aMissingTabChangesNothing() {
        TopTab tab = tab();
        TopTabSettingsShortcut.onTopTab(null, DRAMA);

        press(tab, longPress());

        assertNull(nextStarted());
        assertEquals("a tab nothing was handed over for lost PineDrama's tap", 1, tab.taps);
    }

    /** A press the listener can't follow is left to the tab, and doesn't throw into PineDrama. */
    @Test public void aPressItCantFollowIsTheTabs() {
        TopTab tab = tab();

        assertFalse("a touch it failed on wasn't left to the tab",
                new TopTabSettingsShortcut.Press().onTouch(tab, null));
    }
}
