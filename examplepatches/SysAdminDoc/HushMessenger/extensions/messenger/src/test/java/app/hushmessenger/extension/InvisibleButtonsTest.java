package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import java.util.Collections;
import java.util.List;
import java.util.Map;
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
import static org.robolectric.Shadows.shadowOf;

/**
 * #191: a button picked in settings is drawn invisible or at a share of how it looks, and keeps its place, its size,
 * the area that answers a tap and what it did before, on any Messenger screen and in its menus.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class InvisibleButtonsTest {
    private long clock = 1_000L;

    /** A page of HushMessenger's own, by its package. */
    public static class OwnPage extends Activity { }

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

    /** Measures and lays the view out, so every button has the size and the place a walk reads. */
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

    @Test public void aPickedButtonIsDrawnInvisibleAndKeepsItsSizeAndItsTap() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = button(activity, "Call", 48);
            View video = button(activity, "Video call", 48);
            ViewGroup root = chat(activity, call, video);
            boolean[] tapped = {false};
            call.setOnClickListener(view -> tapped[0] = true);

            InvisibleButtons.setLevel("Call", 0);
            InvisibleButtons.chatShown(new Object(), root);

            assertEquals("invisible", 0f, call.getAlpha(), 0f);
            assertEquals("the one left alone", 1f, video.getAlpha(), 0f);
            assertEquals("still its own size", 48, call.getWidth());
            assertEquals("still in the bar", View.VISIBLE, call.getVisibility());
            assertTrue("a tap still lands", call.performClick());
            assertTrue(tapped[0]);
            assertTrue("the control counts as used", Settings.activeAt.containsKey(InvisibleButtons.KEY));
            assertTrue(Settings.hookErrors.isEmpty());
        }
    }

    @Test public void aLevelDrawsTheButtonAtThatShareOfMessengersOwnAlpha() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = button(activity, "Call", 48);
            call.setAlpha(0.8f);
            ViewGroup root = chat(activity, call);

            InvisibleButtons.setLevel("Call", 25);
            InvisibleButtons.chatShown(new Object(), root);
            assertEquals(0.2f, call.getAlpha(), 0.001f);

            // A change in settings is answered at the next layout, inside the quiet window.
            InvisibleButtons.setLevel("Call", 75);
            clock += 1;
            InvisibleButtons.look(root, false);
            assertEquals("a share of Messenger's alpha, not of the last level", 0.6f, call.getAlpha(), 0.001f);

            InvisibleButtons.setLevel("Call", 100);
            clock += 1;
            InvisibleButtons.look(root, false);
            assertEquals(0.8f, call.getAlpha(), 0.001f);
            assertEquals(Map.of(), InvisibleButtons.levels());
        }
    }

    @Test public void anAlphaMessengerSetsLaterIsTheOneScaledAndTheOneGivenBack() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View send = button(activity, "Send", 48);
            ViewGroup root = chat(activity, send);
            InvisibleButtons.setLevel("Send", 50);
            InvisibleButtons.chatShown(new Object(), root);
            assertEquals(0.5f, send.getAlpha(), 0.001f);

            // Messenger fades the button for its own reasons, and the level follows rather than undoing it.
            send.setAlpha(0.4f);
            clock += InvisibleButtons.LOOK_MS + 1;
            InvisibleButtons.look(root, false);
            assertEquals(0.2f, send.getAlpha(), 0.001f);

            // Taken back while Messenger has the button at an alpha of its own: Messenger's stays.
            send.setAlpha(0.9f);
            InvisibleButtons.setLevel("Send", 100);
            clock += 1;
            InvisibleButtons.look(root, false);
            assertEquals(0.9f, send.getAlpha(), 0.001f);
        }
    }

    @Test public void theFirstBuildsPicksStayInvisibleUntilTheNextChange() {
        Settings.preferences.edit().putString("invisible_buttons_hidden", "Call\nVideo call").commit();
        assertEquals(0, InvisibleButtons.level("Call"));
        assertEquals(100, InvisibleButtons.level("Search"));

        InvisibleButtons.setLevel("Video call", 50);

        assertEquals(Map.of("Call", 0, "Video call", 50), InvisibleButtons.levels());
        assertFalse("folded into the levels", Settings.preferences.contains("invisible_buttons_hidden"));
    }

    @Test public void everyButtonAScreenShowsIsListedForSettingsAndItsScrollingListsArent() {
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

            assertEquals(List.of("Search in conversation"), InvisibleButtons.seen());
        }
    }

    @Test public void theChatListAndTheOtherScreensAreLookedOverButHushMessengersOwnPagesArent() {
        InvisibleButtons.setLevel("New message", 0);
        InvisibleButtons.register(RuntimeEnvironment.getApplication());
        // Each screen builds its views when it's created, the way Messenger's do, and is looked over as it comes up.
        var screen = Robolectric.buildActivity(Activity.class).create();
        var own = Robolectric.buildActivity(OwnPage.class).create();
        try (screen; own) {
            Activity activity = screen.get();
            View compose = button(activity, "New message", 48);
            chat(activity, compose);
            View ownButton = button(own.get(), "New message", 48);
            chat(own.get(), ownButton);
            screen.start().postCreate(null).resume().visible();
            own.start().postCreate(null).resume().visible();
            assertEquals("dimmed as the screen came up", 0f, compose.getAlpha(), 0f);

            clock += InvisibleButtons.LOOK_MS + 1;
            activity.getWindow().getDecorView().getViewTreeObserver().dispatchOnGlobalLayout();
            own.get().getWindow().getDecorView().getViewTreeObserver().dispatchOnGlobalLayout();

            assertEquals("Messenger's screen, through its activity", 0f, compose.getAlpha(), 0f);
            assertEquals("a HushMessenger page is left as it is", 1f, ownButton.getAlpha(), 0f);
            assertTrue(Settings.hookErrors.isEmpty());
        }
    }

    @Config(sdk = 36)
    @Test public void aMenuOverTheScreenIsLookedOverAndItsListThatFitsIsItsButtons() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            chat(activity, button(activity, "Call", 48));
            Dialog menu = new Dialog(activity);
            LinearLayout card = new LinearLayout(activity);
            card.setOrientation(LinearLayout.VERTICAL);
            View react = button(activity, "React", 48);
            RecyclerView actions = new RecyclerView(activity);
            View forward = button(activity, "Forward", 300);
            actions.addView(forward);
            card.addView(react);
            card.addView(actions, new LinearLayout.LayoutParams(400, 120));
            menu.setContentView(card);
            menu.show();
            shadowOf(Looper.getMainLooper()).idle();
            lay(card);
            actions.layout(0, 40, 400, 160);
            forward.layout(0, 0, 300, 40);
            InvisibleButtons.setLevel("Forward", 0);

            InvisibleButtons.findMenus();

            assertEquals("a row of a menu's list is one of its buttons", 0f, forward.getAlpha(), 0f);
            assertTrue(InvisibleButtons.seen().containsAll(List.of("React", "Forward")));
            menu.dismiss();
            shadowOf(Looper.getMainLooper()).idle();
            assertEquals("the menu closed, so its buttons are Messenger's again", 1f, forward.getAlpha(), 0f);
            assertTrue(Settings.hookErrors.isEmpty());
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
            InvisibleButtons.setLevel("Call", 0);
            InvisibleButtons.chatShown(new Object(), root);
            assertEquals(0f, call.getAlpha(), 0f);

            InvisibleButtons.setLevel("Call", 100);
            clock += 1;
            InvisibleButtons.look(root, false);
            assertEquals("Messenger's own alpha, not an invented 1", 0.4f, call.getAlpha(), 0.001f);
        }
    }

    @Test public void aPickedButtonNeverFallsOffTheListSettingsShows() {
        StringBuilder older = new StringBuilder("Call");
        for (int i = 1; i < InvisibleButtons.REMEMBERED; i++) older.append("\nButton ").append(i);
        Settings.preferences.edit().putString("invisible_buttons_seen", older.toString()).commit();
        InvisibleButtons.setLevel("Call", 0);
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            InvisibleButtons.chatShown(new Object(), chat(activity, button(activity, "Brand new", 48)));
        }
        List<String> seen = InvisibleButtons.seen();
        assertEquals(InvisibleButtons.REMEMBERED, seen.size());
        assertEquals("the picked one stays", "Call", seen.get(0));
        assertFalse("the oldest unpicked one goes", seen.contains("Button 1"));
        assertEquals("Brand new", seen.get(seen.size() - 1));
    }

    @Test public void theSwitchGoingOffBringsEveryButtonBackAndSoDoesTheChatClosing() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = button(activity, "Call", 48);
            ViewGroup root = chat(activity, call);
            InvisibleButtons.setLevel("Call", 0);
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
            assertEquals(List.of("Call"), InvisibleButtons.seen());

            // A second button shows up, but a walk this soon after the last one is skipped.
            root.addView(button(activity, "Video call", 48));
            lay(root);
            clock += InvisibleButtons.LOOK_MS - 1;
            InvisibleButtons.look(root, false);
            assertEquals(List.of("Call"), InvisibleButtons.seen());

            clock += 2;
            InvisibleButtons.look(root, false);
            assertEquals(List.of("Call", "Video call"), InvisibleButtons.seen());
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
                InvisibleButtons.setLevel("Call", 0);
                if (state.equals("missing")) Settings.installed = Collections.emptySet();
                try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
                    Activity activity = screen.get();
                    View call = button(activity, "Call", 48);
                    InvisibleButtons.chatShown(new Object(), chat(activity, call));
                    InvisibleButtons.findMenus();
                    assertEquals(state, 1f, call.getAlpha(), 0f);
                    assertEquals(state, List.of(), InvisibleButtons.seen());
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

    @Test public void settingsListsTheButtonsSeenWithAStripOfLevelsForEach() {
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = page.get().getWindow().getDecorView();
            assertNotNull(root.findViewWithTag("invisible_buttons_empty"));

            // Settings stays open under Messenger, a chat shows its buttons, then Back returns here.
            page.pause().stop();
            try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
                Activity activity = screen.get();
                InvisibleButtons.chatShown(new Object(), chat(activity, button(activity, "Call", 48)));
            }
            page.restart().resume();

            assertNull(root.findViewWithTag("invisible_buttons_empty"));
            assertNotNull(root.findViewWithTag("invisible_buttons_row_Call"));
            assertTrue("as Messenger draws it", ((RadioButton) root.findViewWithTag("invisible_buttons_level_100_Call")).isChecked());
            SettingsText text = new SettingsText(page.get());
            RadioButton quarter = root.findViewWithTag("invisible_buttons_level_25_Call");
            assertEquals(text.display(text.percent(25)), quarter.getText().toString());
            assertEquals(text.get("invisible_buttons_level_choice", text.percent(25), "Call"), quarter.getContentDescription().toString());

            quarter.performClick();
            assertEquals(25, InvisibleButtons.level("Call"));
            assertTrue(((RadioButton) root.findViewWithTag("invisible_buttons_level_25_Call")).isChecked());
            assertFalse(((RadioButton) root.findViewWithTag("invisible_buttons_level_100_Call")).isChecked());

            root.findViewWithTag("invisible_buttons_level_0_Call").performClick();
            assertEquals(0, InvisibleButtons.level("Call"));
            root.findViewWithTag("invisible_buttons_level_100_Call").performClick();
            assertEquals(Map.of(), InvisibleButtons.levels());
            assertEquals("Call", ((TextView) ((ViewGroup) root.findViewWithTag("invisible_buttons_row_Call")).getChildAt(0)).getText().toString());
        }
    }

    @Test public void aScreenWithNoViewIsNoFailure() {
        InvisibleButtons.chatShown(new Object(), null);
        InvisibleButtons.look(null, true);
        InvisibleButtons.screenShown(null);
        assertTrue(Settings.hookErrors.isEmpty());
    }
}
