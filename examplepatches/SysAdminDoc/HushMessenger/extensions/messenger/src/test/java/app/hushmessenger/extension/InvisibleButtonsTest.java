package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import androidx.recyclerview.widget.RecyclerView;
import java.util.Collections;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/**
 * #191: a button picked in settings is drawn at nothing and keeps its place, its size, the area that answers a tap and
 * what it did before.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class InvisibleButtonsTest {
    private long clock = 1_000L;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().putBoolean(InvisibleButtons.KEY, true).commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        InvisibleButtons.resetForTests();
        InvisibleButtons.clock = () -> clock;
    }

    @After public void putTheClockBack() {
        InvisibleButtons.resetForTests();
    }

    /** A button the way a chat's top bar has one: clickable, a size of its own, and named for a screen reader. */
    private static View button(Context context, String name, int width) {
        View view = new View(context);
        view.setClickable(true);
        view.setContentDescription(name);
        view.setLayoutParams(new FrameLayout.LayoutParams(width, 40));
        return view;
    }

    /** Measures and lays the chat out, so every button has the size and the place a walk reads. */
    private static void lay(ViewGroup root) {
        root.measure(View.MeasureSpec.makeMeasureSpec(400, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(200, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 400, 200);
    }

    private static ViewGroup chat(Activity activity, View... buttons) {
        FrameLayout root = new FrameLayout(activity);
        for (View button : buttons) root.addView(button);
        activity.setContentView(root);
        lay(root);
        return root;
    }

    @Test public void aPickedButtonIsDrawnAtNothingAndKeepsItsSizeAndItsTap() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = button(activity, "Call", 48);
            View video = button(activity, "Video call", 48);
            ViewGroup root = chat(activity, call, video);
            boolean[] tapped = {false};
            call.setOnClickListener(view -> tapped[0] = true);

            InvisibleButtons.setHidden("Call", true);
            InvisibleButtons.chatShown(new Object(), root);

            assertEquals("drawn at nothing", 0f, call.getAlpha(), 0f);
            assertEquals("the one left alone", 1f, video.getAlpha(), 0f);
            assertEquals("still its own size", 48, call.getWidth());
            assertEquals("still in the bar", View.VISIBLE, call.getVisibility());
            assertTrue("a tap still lands", call.performClick());
            assertTrue(tapped[0]);
            assertTrue("the control counts as used", Settings.activeAt.containsKey(InvisibleButtons.KEY));
            assertTrue(Settings.hookErrors.isEmpty());
        }
    }

    @Test public void everyButtonAChatShowsIsListedForSettingsAndTheMessagesArent() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View search = button(activity, "Search in conversation", 48);
            View plain = new View(activity);
            plain.setClickable(true);
            plain.setLayoutParams(new FrameLayout.LayoutParams(48, 40));
            RecyclerView messages = new RecyclerView(activity);
            View bubble = button(activity, "Hey, are you there?", 300);
            messages.addView(bubble);
            ViewGroup root = chat(activity, search, plain, messages);
            // The list lays its own rows out, which this test does by hand: a row with a size the walk would take.
            messages.layout(0, 0, 400, 120);
            bubble.layout(0, 0, 300, 40);

            InvisibleButtons.chatShown(new Object(), root);

            assertEquals(java.util.List.of("Search in conversation"), InvisibleButtons.seen());
        }
    }

    @Test public void aNameTheScreenReaderSaysOnSeveralLinesComesBackOnOne() {
        View view = new View(RuntimeEnvironment.getApplication());
        view.setContentDescription("  Call\n  Jo  ");
        assertEquals("Call Jo", InvisibleButtons.nameOf(view));
        view.setContentDescription("   ");
        assertNull(InvisibleButtons.nameOf(view));
        view.setContentDescription("x".repeat(61));
        assertNull("a sentence rather than a button", InvisibleButtons.nameOf(view));
    }

    @Test public void takingAButtonOffThePickedListGivesBackTheAlphaMessengerHadOnIt() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = button(activity, "Call", 48);
            call.setAlpha(0.4f);
            ViewGroup root = chat(activity, call);
            InvisibleButtons.setHidden("Call", true);
            InvisibleButtons.chatShown(new Object(), root);
            assertEquals(0f, call.getAlpha(), 0f);

            // A change in settings is answered at the next layout, inside the quiet window.
            InvisibleButtons.setHidden("Call", false);
            clock += 1;
            InvisibleButtons.look(root, false);
            assertEquals("Messenger's own alpha, not an invented 1", 0.4f, call.getAlpha(), 0.001f);
        }
    }

    @Test public void theSwitchGoingOffBringsEveryButtonBackAndSoDoesTheChatClosing() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = button(activity, "Call", 48);
            ViewGroup root = chat(activity, call);
            InvisibleButtons.setHidden("Call", true);
            InvisibleButtons.chatShown(new Object(), root);
            assertEquals(0f, call.getAlpha(), 0f);

            Settings.preferences.edit().putBoolean(InvisibleButtons.KEY, false).commit();
            clock += InvisibleButtons.LOOK_MS + 1;
            InvisibleButtons.look(root, false);
            assertEquals(1f, call.getAlpha(), 0f);

            Settings.preferences.edit().putBoolean(InvisibleButtons.KEY, true).commit();
            InvisibleButtons.look(root, true);
            assertEquals(0f, call.getAlpha(), 0f);
            ((ViewGroup) root.getParent()).removeView(root);
            assertEquals("the chat closed, so the buttons are Messenger's again", 1f, call.getAlpha(), 0f);
        }
    }

    @Test public void aWalkWaitsOutTheQuietWindowSoLayoutsDontPileUp() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = button(activity, "Call", 48);
            ViewGroup root = chat(activity, call);
            InvisibleButtons.chatShown(new Object(), root);
            assertEquals(java.util.List.of("Call"), InvisibleButtons.seen());

            // A second button shows up, but a walk this soon after the last one is skipped.
            root.addView(button(activity, "Video call", 48));
            lay(root);
            clock += InvisibleButtons.LOOK_MS - 1;
            InvisibleButtons.look(root, false);
            assertEquals(java.util.List.of("Call"), InvisibleButtons.seen());

            clock += 2;
            InvisibleButtons.look(root, false);
            assertEquals(java.util.List.of("Call", "Video call"), InvisibleButtons.seen());
        }
    }

    @Test public void offPausedInSafeModeOrWithoutTheCapabilityTheButtonsAreMessengersOwn() {
        Set<String> installed = Settings.installed;
        try {
            for (String state : new String[] {"off", "paused", "safe", "missing"}) {
                Settings.initialize(RuntimeEnvironment.getApplication());
                Settings.preferences.edit().clear().putBoolean(InvisibleButtons.KEY, !state.equals("off"))
                    .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
                CrashGuard.resetForTests();
                CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
                InvisibleButtons.resetForTests();
                InvisibleButtons.clock = () -> clock;
                InvisibleButtons.setHidden("Call", true);
                if (state.equals("missing")) Settings.installed = Collections.emptySet();
                try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
                    Activity activity = screen.get();
                    View call = button(activity, "Call", 48);
                    InvisibleButtons.chatShown(new Object(), chat(activity, call));
                    assertEquals(state, 1f, call.getAlpha(), 0f);
                    assertEquals(state, java.util.List.of(), InvisibleButtons.seen());
                }
                Settings.installed = installed;
            }
        } finally {
            Settings.installed = installed;
            Settings.preferences.edit().putBoolean("paused", false).putBoolean("safe_mode", false).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        }
    }

    @Test public void aChatWithNoViewIsNoFailure() {
        InvisibleButtons.chatShown(new Object(), null);
        InvisibleButtons.look(null, true);
        assertTrue(Settings.hookErrors.isEmpty());
    }
}
