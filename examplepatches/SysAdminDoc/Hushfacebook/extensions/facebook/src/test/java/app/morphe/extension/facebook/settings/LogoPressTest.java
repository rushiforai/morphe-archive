/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.os.SystemClock;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;
import org.robolectric.shadows.ShadowLooper;

/**
 * A long press on the Facebook logo at the top of the home feed opens the Hushfacebook screen. The
 * settings patch sends Facebook's call that gives the logo its touch listener to
 * {@link SettingsEntry#setLogoTouchListener}, right after Facebook gives the logo its tap. These
 * build the logo the way Facebook does, a view with Facebook's click listener, then make that call.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LogoPressTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final SettingsEntry.OpenWhenResumed watcher = new SettingsEntry.OpenWhenResumed();
    private ActivityController<Activity> feed;
    /** Taps Facebook's own click listener saw. */
    private int taps;

    @Before public void openFeed() {
        RuntimeEnvironment.getApplication().registerActivityLifecycleCallbacks(watcher);
        feed = Robolectric.buildActivity(Activity.class).setup();
        ShadowLog.clear();
    }

    @After public void closeFeed() {
        RuntimeEnvironment.getApplication().unregisterActivityLifecycleCallbacks(watcher);
        PauseForTests.resume();
        feed.pause().stop().destroy();
    }

    /** The logo as Facebook builds it, in the feed's activity: a view with Facebook's tap. */
    private View logo() {
        return logo(feed.get());
    }

    private View logo(android.content.Context context) {
        View logo = new View(context);
        logo.setOnClickListener(v -> taps++);
        FrameLayout bar = new FrameLayout(feed.get());
        bar.addView(logo, new FrameLayout.LayoutParams(360, 90));
        feed.get().setContentView(bar);
        ShadowLooper.idleMainLooper();
        assertTrue("the logo isn't on screen", logo.isAttachedToWindow() && logo.getWidth() == 360);
        return logo;
    }

    private static MotionEvent event(int action, long downTime, float x, float y) {
        return MotionEvent.obtain(downTime, SystemClock.uptimeMillis(), action, x, y, 0);
    }

    /** A finger held on the logo for [heldMs], then lifted. */
    private static void press(View logo, long heldMs) {
        long down = SystemClock.uptimeMillis();
        logo.dispatchTouchEvent(event(MotionEvent.ACTION_DOWN, down, 180, 45));
        ShadowLooper.idleMainLooper(heldMs, TimeUnit.MILLISECONDS);
        logo.dispatchTouchEvent(event(MotionEvent.ACTION_UP, down, 180, 45));
        ShadowLooper.idleMainLooper();
    }

    private static long longPress() {
        return ViewConfiguration.getLongPressTimeout() + 100;
    }

    private Object screen() {
        return feed.get().getFragmentManager().findFragmentByTag("hushfacebook_settings");
    }

    private static List<String> logged() {
        List<String> lines = new ArrayList<>();
        for (ShadowLog.LogItem item : ShadowLog.getLogsForTag("morphe: SettingsEntry")) lines.add(item.msg);
        return lines;
    }

    @Test public void aLongPressOpensTheScreenOverTheFeed() {
        View logo = logo();
        SettingsEntry.setLogoTouchListener(logo, null);

        press(logo, longPress());

        assertNotNull("a long press on the logo didn't open the screen", screen());
        assertEquals("a long press gave no long-press vibration",
                HapticFeedbackConstants.LONG_PRESS, shadowOf(logo).lastHapticFeedbackPerformed());
        assertEquals("letting go after the long press was also a tap on the logo", 0, taps);
        assertTrue("no line said the logo was watched: " + logged(),
                logged().contains("Settings entry: a long press on the Facebook logo opens the settings"));
        assertTrue("no line said the long press asked for the screen: " + logged(),
                logged().contains("Settings requested by a long press on the Facebook logo"));
    }

    @Test public void aTapIsStillFacebooks() {
        View logo = logo();
        SettingsEntry.setLogoTouchListener(logo, null);

        press(logo, 80);

        assertEquals("the tap didn't reach Facebook's click listener", 1, taps);
        assertNull("a tap opened the screen", screen());
    }

    @Test public void slidingOffTheLogoLetsGo() {
        View logo = logo();
        SettingsEntry.setLogoTouchListener(logo, null);
        long down = SystemClock.uptimeMillis();

        logo.dispatchTouchEvent(event(MotionEvent.ACTION_DOWN, down, 180, 45));
        logo.dispatchTouchEvent(event(MotionEvent.ACTION_MOVE, down, 180, 900));
        ShadowLooper.idleMainLooper(longPress(), TimeUnit.MILLISECONDS);
        logo.dispatchTouchEvent(event(MotionEvent.ACTION_UP, down, 180, 900));
        ShadowLooper.idleMainLooper();

        assertNull("a finger that slid off the logo still opened the screen", screen());
    }

    /**
     * Facebook gives the logo an accessibility delegate that puts back the long-press state it saw
     * before the logo had listeners, false, every time an accessibility service reads the screen.
     * A long-click listener would go dead after the first read, so the press is timed instead.
     */
    @Test public void aScreenReaderReadingTheLogoDoesntStopIt() {
        View logo = logo();
        logo.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                host.setLongClickable(false);
            }
        });
        SettingsEntry.setLogoTouchListener(logo, null);

        logo.createAccessibilityNodeInfo().recycle();
        press(logo, longPress());

        assertNotNull("the long press stopped working once the logo was read", screen());
        assertEquals(0, taps);
    }

    /**
     * Facebook passes a listener of its own when it reads the logo's gestures itself: its World
     * Cup mode took a double tap and a long press there. That long press stays Facebook's.
     */
    @Test public void facebooksOwnListenerKeepsItsLongPress() {
        View logo = logo();
        List<Integer> seen = new ArrayList<>();
        View.OnTouchListener facebooks = (v, event) -> {
            seen.add(event.getActionMasked());
            return true;
        };
        SettingsEntry.setLogoTouchListener(logo, facebooks);

        press(logo, longPress());

        assertNull("the long press was taken from Facebook's own listener", screen());
        assertEquals("Facebook's listener didn't get the whole press",
                java.util.Arrays.asList(MotionEvent.ACTION_DOWN, MotionEvent.ACTION_UP), seen);
        assertTrue("no line said the long press stays Facebook's: " + logged(), logged().contains(
                "Settings entry: Facebook reads the logo's long press itself here, so it stays Facebook's"));
    }

    /** A long-click listener Facebook gives the logo itself is left to run. */
    @Test public void aLongPressFacebookGaveTheLogoStaysFacebooks() {
        View logo = logo();
        int[] facebooksLongPresses = {0};
        logo.setOnLongClickListener(v -> {
            facebooksLongPresses[0]++;
            return true;
        });
        SettingsEntry.setLogoTouchListener(logo, null);

        press(logo, longPress());

        assertEquals("Facebook's own long press didn't run", 1, facebooksLongPresses[0]);
        assertNull("the long press was taken from Facebook", screen());
    }

    /** No switch reads it, so it's still the way back to the switch while Hushfacebook is paused. */
    @Test public void pauseLeavesItWorking() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        View logo = logo();
        SettingsEntry.setLogoTouchListener(logo, null);

        press(logo, longPress());

        assertNotNull("Pause turned off the way back to its own switch", screen());
    }

    /**
     * A logo with no activity behind it can't show the screen. The long press then does what it
     * does without Hushfacebook: letting go is Facebook's tap. Nothing throws.
     */
    @Test public void aLongPressThatCantOpenTheScreenIsFacebooksTap() {
        View logo = logo(RuntimeEnvironment.getApplication());
        SettingsEntry.setLogoTouchListener(logo, null);

        press(logo, longPress());

        assertNull(screen());
        assertEquals("letting go wasn't Facebook's tap after the screen couldn't open", 1, taps);
        assertTrue("no line said why: " + logged(), logged().contains(
                "Settings entry: the Facebook logo isn't in an activity, so its long press is Facebook's"));
    }

    /** A press the listener can't follow is left to the logo, and doesn't throw into Facebook. */
    @Test public void aPressItCantFollowIsTheLogos() {
        View logo = logo();

        assertFalse("a touch it failed on wasn't left to the logo", new SettingsEntry.LogoPress().onTouch(logo, null));
    }
}
