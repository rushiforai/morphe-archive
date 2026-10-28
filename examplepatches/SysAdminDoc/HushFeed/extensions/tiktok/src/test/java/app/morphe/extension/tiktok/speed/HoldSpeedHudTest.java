package app.morphe.extension.tiktok.speed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

/**
 * Slide to change the hold speed (#248): the steps a slide lands on, the one bubble and everything
 * that takes it down, and that the slid speed is what the lock and TikTok's words get.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class HoldSpeedHudTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<Float> applied = new ArrayList<>();
    private final Object component = new Object();
    private ActivityController<Activity> owner;
    private float density;

    @Before
    public void setUp() {
        owner = Robolectric.buildActivity(Activity.class).setup().visible();
        Utils.setActivity(owner.get());
        density = owner.get().getResources().getDisplayMetrics().density;
        SettingsStatus.holdSpeedSlideEnabled = true;
        Settings.HOLD_SPEED_SLIDE.save(true);
        Settings.HOLD_SPEED.save("2");
        HoldSpeedHud.applierForTests = (gesture, speed) -> {
            assertSame(component, gesture);
            applied.add(speed);
        };
        forget();
    }

    @After
    public void tearDown() {
        forget();
        HoldSpeedHud.applierForTests = null;
        SettingsStatus.holdSpeedSlideEnabled = false;
        Settings.HOLD_SPEED_SLIDE.resetToDefault();
        Settings.HOLD_SPEED.resetToDefault();
        Utils.setActivity(null);
        owner.pause().stop().destroy();
    }

    private static void forget() {
        HoldSpeedHud.onHoldRelease();
        ReflectionHelpers.setStaticField(HoldSpeedHud.class, "slidSpeed", Float.NaN);
        ReflectionHelpers.setStaticField(HoldSpeedHud.class, "heldVideo", "");
        ReflectionHelpers.setStaticField(PlaybackSpeedPatch.class, "onScreen", null);
    }

    private static void move(float x) {
        MotionEvent event = MotionEvent.obtain(0, 0, MotionEvent.ACTION_MOVE, x, 500, 0);
        HoldSpeedHud.onHoldTouch(event);
        event.recycle();
    }

    /** Holds, marks the finger at 100, and slides {@code dp} sideways. */
    private void holdAndSlide(float dp) {
        HoldSpeedHud.onHoldPress(component);
        move(100);
        move(100 + dp * density);
    }

    private int bubbles() {
        ViewGroup content = owner.get().findViewById(android.R.id.content);
        int count = 0;
        for (int i = 0; i < content.getChildCount(); i++) {
            if (content.getChildAt(i) instanceof HoldSpeedHud.Bubble) count++;
        }
        return count;
    }

    private static String label() {
        return ((HoldSpeedHud.Bubble) HoldSpeedHud.bubble()).label();
    }

    @Test
    public void aSlideStepsAQuarterPastTheDeadZoneAndStopsAtTheEnds() {
        assertEquals(2f, HoldSpeedHud.speedFor(2f, 0, 1), 0f);
        assertEquals(2f, HoldSpeedHud.speedFor(2f, 16, 1), 0f);
        assertEquals(2.25f, HoldSpeedHud.speedFor(2f, 17, 1), 0f);
        assertEquals(2.25f, HoldSpeedHud.speedFor(2f, 43, 1), 0f);
        assertEquals(2.5f, HoldSpeedHud.speedFor(2f, 44, 1), 0f);
        assertEquals(1.75f, HoldSpeedHud.speedFor(2f, -17, 1), 0f);
        assertEquals(2.25f, HoldSpeedHud.speedFor(2f, 34, 2), 0f);
        assertEquals(3f, HoldSpeedHud.speedFor(2f, 1000, 1), 0f);
        assertEquals(0.5f, HoldSpeedHud.speedFor(2f, -1000, 1), 0f);
    }

    @Test
    public void aHoldShowsOneBubbleAtTheHoldSpeed() {
        HoldSpeedHud.onHoldPress(component);
        HoldSpeedHud.onHoldPress(component);
        assertEquals(1, bubbles());
        assertEquals("2x", label());
        Settings.HOLD_SPEED.save("1.5");
        HoldSpeedHud.onHoldPress(component);
        assertEquals(1, bubbles());
        assertEquals("1.5x", label());
    }

    @Test
    public void slidingPlaysTheNewSpeedAndTheLockAndWordsGetIt() {
        holdAndSlide(17);
        assertEquals(List.of(2.25f), applied);
        assertEquals("2.25x", label());
        assertEquals(2.25f, PlaybackSpeedPatch.holdSpeed(2f), 0f);
        assertEquals("Speed: 2.25x", PlaybackSpeedPatch.holdSpeedText("Speed: 2x"));
        // Back inside the dead zone is the hold speed again; a move that changes nothing calls nothing.
        move(105);
        move(106);
        assertEquals(List.of(2.25f, 2f), applied);
        assertEquals("2x", label());
        // Letting go takes the bubble down; a pull-down lock on that release still gets the slid speed.
        move(100 - 20 * density);
        HoldSpeedHud.onHoldRelease();
        assertEquals(0, bubbles());
        assertEquals(1.75f, PlaybackSpeedPatch.holdSpeed(2f), 0f);
        // The next hold starts over at the hold speed.
        HoldSpeedHud.onHoldPress(component);
        assertEquals(2f, PlaybackSpeedPatch.holdSpeed(2f), 0f);
        assertEquals("2x", label());
    }

    @Test
    public void movesAfterLettingGoDoNothing() {
        holdAndSlide(17);
        HoldSpeedHud.onHoldRelease();
        move(100 + 80 * density);
        assertEquals(List.of(2.25f), applied);
        assertNull(HoldSpeedHud.bubble());
    }

    @Test
    public void anotherVideoOnScreenEndsTheHoldAndForgetsTheSlide() {
        PlaybackSpeedPatch.onPlayerProgress(new Object(), "a");
        holdAndSlide(17);
        PlaybackSpeedPatch.onPlayerProgress(new Object(), "a");
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(1, bubbles());
        PlaybackSpeedPatch.onPlayerProgress(new Object(), "b");
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(0, bubbles());
        assertEquals(2f, PlaybackSpeedPatch.holdSpeed(2f), 0f);
        move(100 + 80 * density);
        assertEquals(List.of(2.25f), applied);
    }

    @Test
    public void losingWindowFocusTakesTheBubbleDown() {
        holdAndSlide(17);
        View shown = HoldSpeedHud.bubble();
        assertNotNull(shown);
        shown.onWindowFocusChanged(false);
        assertEquals(0, bubbles());
        move(100 + 80 * density);
        assertEquals(List.of(2.25f), applied);
    }

    @Test
    public void pauseEndsTheHoldAndHandsBackTikToksSpeed() {
        holdAndSlide(17);
        PausedProcess.set(true);
        try {
            move(100 + 80 * density);
            assertEquals(0, bubbles());
            assertEquals(List.of(2.25f), applied);
            assertTrue(Float.isNaN(HoldSpeedHud.slidSpeed()));
        } finally {
            PausedProcess.set(false);
        }
    }

    @Test
    public void switchingItOffMidHoldEndsIt() {
        holdAndSlide(17);
        Settings.HOLD_SPEED_SLIDE.save(false);
        move(100 + 80 * density);
        assertEquals(0, bubbles());
        assertEquals(2f, PlaybackSpeedPatch.holdSpeed(2f), 0f);
    }

    @Test
    public void offThereIsNoBubbleAndTikToksBannerShows() {
        Settings.HOLD_SPEED_SLIDE.save(false);
        holdAndSlide(80);
        assertEquals(0, bubbles());
        assertTrue(applied.isEmpty());
        assertEquals(2f, PlaybackSpeedPatch.holdSpeed(2f), 0f);
        // TikTok's banner shows while the switch is off; on, its parts are hidden for the bubble,
        // and a part TikTok itself left hidden stays hidden when the switch goes off again.
        android.widget.LinearLayout banner = new android.widget.LinearLayout(owner.get());
        android.widget.TextView label = new android.widget.TextView(owner.get());
        android.widget.ImageView icon = new android.widget.ImageView(owner.get());
        icon.setVisibility(View.GONE);
        banner.addView(label);
        banner.addView(icon);
        PlaybackSpeedPatch.holdSpeedBanner(banner);
        assertEquals(View.VISIBLE, label.getVisibility());
        Settings.HOLD_SPEED_SLIDE.save(true);
        PlaybackSpeedPatch.holdSpeedBanner(banner);
        assertEquals(View.INVISIBLE, label.getVisibility());
        assertEquals(View.GONE, icon.getVisibility());
        Settings.HOLD_SPEED_SLIDE.save(false);
        PlaybackSpeedPatch.holdSpeedBanner(banner);
        assertEquals(View.VISIBLE, label.getVisibility());
        assertEquals(View.GONE, icon.getVisibility());
    }

    @Test
    public void anUnpatchedBuildHasNoSlide() {
        SettingsStatus.holdSpeedSlideEnabled = false;
        holdAndSlide(80);
        assertEquals(0, bubbles());
        assertFalse(HoldSpeedHud.enabled());
        assertTrue(applied.isEmpty());
    }
}
