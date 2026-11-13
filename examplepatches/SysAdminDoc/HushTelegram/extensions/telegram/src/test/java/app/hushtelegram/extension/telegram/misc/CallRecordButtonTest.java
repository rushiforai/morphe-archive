/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CallRecordButtonTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int TOP_INSET = 80;

    /** A call screen laid out like Telegram's: a minimize arrow top left, other buttons elsewhere. */
    static FrameLayout screen() {
        Context context = RuntimeEnvironment.getApplication();
        FrameLayout screen = new FrameLayout(context);
        int size = Math.round(56 * context.getResources().getDisplayMetrics().density);
        screen.addView(new View(context), new FrameLayout.LayoutParams(-1, -1));
        screen.addView(new ImageView(context), new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.RIGHT));
        FrameLayout.LayoutParams arrow = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.LEFT);
        arrow.topMargin = TOP_INSET;
        screen.addView(new ImageView(context), arrow);
        screen.addView(new FrameLayout(context), new FrameLayout.LayoutParams(-1, -2, Gravity.LEFT));
        return screen;
    }

    /** A voice chat's row of top right buttons as Telegram builds it: three 48dp icons side by side. */
    static LinearLayout row() {
        Context context = RuntimeEnvironment.getApplication();
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        int size = Math.round(48 * context.getResources().getDisplayMetrics().density);
        for (int i = 0; i < 3; i++) row.addView(new ImageView(context), new LinearLayout.LayoutParams(size, size));
        return row;
    }

    private static CallRecordButton.Dot dot(FrameLayout screen) {
        View found = CallRecordButton.find(screen);
        assertNotNull("no record button", found);
        return (CallRecordButton.Dot) found;
    }

    private static void layOut(View view) {
        view.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(2340, View.MeasureSpec.EXACTLY));
        view.layout(0, 0, 1080, 2340);
    }

    private static String toast() {
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    @Before public void setUp() {
        CallRecorder.resetForTests();
        Settings.RECORD_CALLS.resetToDefault();
        Settings.RECORD_CALL_BUTTON.save(true);
        ShadowToast.reset();
    }

    @After public void tearDown() {
        CallRecorder.resetForTests();
        Settings.RECORD_CALLS.resetToDefault();
        Settings.RECORD_CALL_BUTTON.resetToDefault();
    }

    @Test public void offByDefaultSoTheCallScreenStaysStock() {
        Settings.RECORD_CALL_BUTTON.resetToDefault();
        assertFalse(Settings.RECORD_CALL_BUTTON.get());
        FrameLayout screen = screen();
        CallRecordButton.attach(screen);
        assertEquals(4, screen.getChildCount());
        assertNull(CallRecordButton.find(screen));
    }

    @Test public void oneButtonSitsUnderTheMinimizeArrowAndFollowsIt() {
        FrameLayout screen = screen();
        ImageView arrow = CallRecordButton.minimize(screen);
        assertSame(screen.getChildAt(2), arrow);
        CallRecordButton.attach(screen);
        CallRecordButton.attach(screen);
        assertEquals("one button and its pause however often the screen is shown", 6, screen.getChildCount());
        CallRecordButton.Dot dot = dot(screen);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) dot.getLayoutParams();
        assertEquals(Gravity.TOP | Gravity.LEFT, params.gravity);
        assertEquals(arrow.getLayoutParams().width, params.width);
        assertEquals(arrow.getLayoutParams().height, params.height);

        layOut(screen);
        dot.follow();
        assertEquals(arrow.getBottom(), Math.round(dot.getY()));
        assertEquals(TOP_INSET + params.height, Math.round(dot.getY()));
        assertEquals(arrow.getLeft(), Math.round(dot.getX()));
        assertEquals(View.VISIBLE, dot.getVisibility());

        // Telegram fades the arrow out with the other controls, and hides it once the call ends.
        arrow.setAlpha(0.25f);
        dot.follow();
        assertEquals(0.25f, dot.getAlpha(), 0f);
        arrow.setVisibility(View.GONE);
        dot.follow();
        assertEquals(View.GONE, dot.getVisibility());
        arrow.setVisibility(View.VISIBLE);
        dot.follow();
        assertEquals(View.VISIBLE, dot.getVisibility());
    }

    @Test public void turningTheSwitchOffMidCallHidesTheButton() {
        FrameLayout screen = screen();
        CallRecordButton.attach(screen);
        CallRecordButton.Dot dot = dot(screen);
        Settings.RECORD_CALL_BUTTON.save(false);
        dot.follow();
        assertEquals(View.GONE, dot.getVisibility());
        dot.performClick();
        assertFalse(CallRecorder.recordingThisCall());
        assertNull(toast());
    }

    @Test public void aTapRecordsTheCallAndASecondOneStopsIt() {
        FrameLayout screen = screen();
        CallRecordButton.attach(screen);
        CallRecordButton.Dot dot = dot(screen);
        assertFalse(dot.recording());
        assertEquals("Record call", dot.getContentDescription());

        assertTrue(dot.performClick());
        assertTrue(CallRecorder.recordingThisCall());
        assertTrue(dot.recording());
        assertEquals("Recording this call", toast());
        AccessibilityNodeInfo info = AccessibilityNodeInfo.obtain();
        dot.onInitializeAccessibilityNodeInfo(info);
        assertTrue(info.isCheckable());
        assertTrue(info.isChecked());

        dot.performClick();
        assertFalse(CallRecorder.recordingThisCall());
        assertFalse(dot.recording());
        assertEquals("Recording stopped", toast());
    }

    @Test public void withRecordCallsOnTheButtonStartsRedAndATapStopsThisCall() {
        Settings.RECORD_CALLS.save(true);
        FrameLayout screen = screen();
        CallRecordButton.attach(screen);
        CallRecordButton.Dot dot = dot(screen);
        assertTrue(dot.recording());
        dot.performClick();
        assertFalse(CallRecorder.recordingThisCall());
        assertTrue("the switch itself stays on", Settings.RECORD_CALLS.get());
        assertEquals("Recording stopped", toast());
    }

    @Test public void withoutOneClearArrowTheButtonStillShowsBelowTheStatusBar() {
        FrameLayout screen = screen();
        Context context = screen.getContext();
        screen.addView(new ImageView(context), new FrameLayout.LayoutParams(40, 40, Gravity.TOP | Gravity.LEFT));
        assertNull("two square images in the corner, so neither is taken for the arrow", CallRecordButton.minimize(screen));
        CallRecordButton.attach(screen);
        CallRecordButton.Dot dot = dot(screen);
        assertEquals(Math.round(56 * context.getResources().getDisplayMetrics().density), dot.getLayoutParams().width);
        layOut(screen);
        dot.follow();
        assertEquals(View.VISIBLE, dot.getVisibility());
    }

    @Test public void theTimerReadsLikeAClock() {
        assertEquals("0:00", CallRecordButton.timer(0));
        assertEquals("0:00", CallRecordButton.timer(-5));
        assertEquals("0:42", CallRecordButton.timer(42_999));
        assertEquals("12:05", CallRecordButton.timer(725_000));
        assertEquals("1:02:09", CallRecordButton.timer(3_729_000));
    }

    @Test public void theButtonShowsTheLengthOnlyWhileTheCallRecords() {
        FrameLayout screen = screen();
        CallRecordButton.attach(screen);
        CallRecordButton.Dot dot = dot(screen);
        dot.refresh();
        assertEquals("", dot.shownTime());
        dot.performClick();
        assertEquals("0:00", dot.shownTime());
        dot.performClick();
        assertEquals("", dot.shownTime());
    }

    @Test public void thePauseButtonSitsBesideTheRecordButtonOnlyWhileTheCallRecords() {
        FrameLayout screen = screen();
        ImageView arrow = CallRecordButton.minimize(screen);
        CallRecordButton.attach(screen);
        CallRecordButton.Dot dot = dot(screen);
        CallRecordButton.Pause pause = (CallRecordButton.Pause) CallRecordButton.findPause(screen);
        assertNotNull("no pause button", pause);
        layOut(screen);
        pause.follow();
        assertEquals(View.GONE, pause.getVisibility());

        dot.performClick();
        pause.follow();
        assertEquals(View.VISIBLE, pause.getVisibility());
        assertEquals(arrow.getLeft() + arrow.getLayoutParams().width, Math.round(pause.getX()));
        assertEquals(arrow.getBottom(), Math.round(pause.getY()));
        assertEquals("Pause recording", pause.getContentDescription());

        assertTrue(pause.performClick());
        assertTrue(CallRecorder.paused());
        assertTrue(pause.paused());
        assertEquals("Recording paused", toast());
        assertEquals("Resume recording", pause.getContentDescription());
        assertTrue("paused is still this call's recording", CallRecorder.recordingThisCall());

        pause.performClick();
        assertFalse(CallRecorder.paused());
        assertEquals("Recording resumed", toast());

        // Stopping the recording takes a pause with it, and the button goes.
        pause.performClick();
        dot.performClick();
        assertFalse(CallRecorder.paused());
        pause.follow();
        assertEquals(View.GONE, pause.getVisibility());
        assertFalse(pause.paused());
    }

    @Test public void aVoiceChatGetsBothButtonsAtTheFrontOfItsTopRightRow() {
        LinearLayout row = row();
        View first = row.getChildAt(0);
        CallRecordButton.attachRow(row);
        CallRecordButton.attachRow(row);
        assertEquals("both buttons once however often the screen is built", 5, row.getChildCount());
        CallRecordButton.Dot dot = (CallRecordButton.Dot) row.getChildAt(0);
        CallRecordButton.Pause pause = (CallRecordButton.Pause) row.getChildAt(1);
        assertSame(first, row.getChildAt(2));
        assertEquals(first.getLayoutParams().width, dot.getLayoutParams().width);
        assertEquals(first.getLayoutParams().height, pause.getLayoutParams().height);

        layOut(row);
        dot.follow();
        pause.follow();
        assertEquals(View.VISIBLE, dot.getVisibility());
        assertEquals(View.GONE, pause.getVisibility());
        assertEquals("the row places the button, so nothing moves it", 0f, dot.getTranslationY(), 0f);

        dot.performClick();
        assertTrue(CallRecorder.recordingThisCall());
        assertEquals("Recording this call", toast());
        pause.follow();
        assertEquals(View.VISIBLE, pause.getVisibility());
        assertEquals(0f, pause.getTranslationX(), 0f);
        assertEquals(0f, pause.getTranslationY(), 0f);
        assertTrue(pause.performClick());
        assertTrue(CallRecorder.paused());
    }

    @Test public void aVoiceChatRowStaysStockWithTheSwitchOff() {
        Settings.RECORD_CALL_BUTTON.resetToDefault();
        LinearLayout row = row();
        CallRecordButton.attachRow(row);
        assertEquals(3, row.getChildCount());
        assertNull(CallRecordButton.find(row));
    }

    @Test public void onlyARowOfButtonsGetsTheRowButtons() {
        CallRecordButton.attachRow(null);
        FrameLayout screen = screen();
        CallRecordButton.attachRow(screen);
        assertEquals(4, screen.getChildCount());
    }

    @Test public void aScreenThatIsNoFrameGetsNoButton() {
        CallRecordButton.attach(null);
        android.widget.LinearLayout column = new android.widget.LinearLayout(RuntimeEnvironment.getApplication());
        CallRecordButton.attach(column);
        assertEquals(0, column.getChildCount());
    }
}
