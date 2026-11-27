package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.os.Looper;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.Switch;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
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
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

/**
 * #191: a button picked in settings is drawn invisible or at a share of how it looks, and keeps its place, its size,
 * the area that answers a tap and what it did before, on any Messenger screen and in its menus.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class InvisibleButtonsTest {
    /** The day the tests run on, as [InvisibleButtons.today] counts. */
    private static final long TODAY = 20_000L;
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
        InvisibleButtons.today = () -> TODAY;
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

    /** #191: HushMessenger's own buttons that show words are listed by them, and text on Messenger's own views isn't. */
    @Test public void hushMessengersOwnTextButtonsAreListedByTheirWordsAndMessengersTextIsnt() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            TextView save = new TextView(activity);
            save.setText("Save");
            save.setClickable(true);
            save.setLayoutParams(new FrameLayout.LayoutParams(80, 40));
            InvisibleButtons.own(save, save.getText());
            TextView person = new TextView(activity);
            person.setText("Alex Rivera");
            person.setClickable(true);
            person.setLayoutParams(new FrameLayout.LayoutParams(120, 40));
            View call = button(activity, "Call", 48);
            ViewGroup root = chat(activity, call, save, person);

            InvisibleButtons.setLevel("Save", 25);
            InvisibleButtons.chatShown(new Object(), root);

            assertEquals(List.of("Call", "Save"), InvisibleButtons.seen());
            assertEquals(0.25f, save.getAlpha(), 0.001f);
            assertEquals("a person's name on Messenger's view stays off the list", 1f, person.getAlpha(), 0f);
            save.setContentDescription("Save photo");
            assertEquals("a spoken name still comes first", "Save photo", InvisibleButtons.nameOf(save));
            save.setContentDescription(null);
            InvisibleButtons.own(save, null);
            assertNull(InvisibleButtons.nameOf(save));
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
            assertEquals(InvisibleButtons.PLACE_MENU, InvisibleButtons.places().get("Forward"));
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
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            ViewGroup root = chat(activity, button(activity, "Brand new", 48));
            String language = InvisibleButtons.languageOf(root);
            StringBuilder older = new StringBuilder("Call");
            StringBuilder when = new StringBuilder(TODAY + "\t" + language + "\tCall");
            for (int i = 1; i < InvisibleButtons.REMEMBERED; i++) {
                older.append("\nButton ").append(i);
                when.append('\n').append(TODAY).append('\t').append(language).append("\tButton ").append(i);
            }
            Settings.preferences.edit().putString("invisible_buttons_seen", older.toString())
                .putString(InvisibleButtons.SEEN_ON, when.toString()).commit();
            InvisibleButtons.setLevel("Call", 0);
            InvisibleButtons.chatShown(new Object(), root);
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

    /** [view] at a spot of its own in a FrameLayout, so buttons don't sit on top of each other. */
    private static View at(View view, int left, int top, int width, int height) {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(width, height, Gravity.TOP | Gravity.LEFT);
        params.leftMargin = left;
        params.topMargin = top;
        view.setLayoutParams(params);
        return view;
    }

    private static int[] middleOf(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return new int[] {at[0] + view.getWidth() / 2, at[1] + view.getHeight() / 2};
    }

    /** A finger down and up at [point] on screen, the way the phone hands a tap to the view on top. */
    private static void tap(View view, int[] point) {
        long now = android.os.SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, point[0], point[1], 0);
        MotionEvent up = MotionEvent.obtain(now, now + 60, MotionEvent.ACTION_UP, point[0], point[1], 0);
        view.dispatchTouchEvent(down);
        view.dispatchTouchEvent(up);
        down.recycle();
        up.recycle();
    }

    private static void layWindow(View window, int height) {
        window.measure(View.MeasureSpec.makeMeasureSpec(400, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        window.layout(0, 0, 400, height);
    }

    @Test public void eachButtonKeepsWhereItSitsAroundTheChatsMessages() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = at(button(activity, "Call", 48), 300, 0, 48, 40);
            RecyclerView messages = new RecyclerView(activity);
            at(messages, 0, 40, 400, 120);
            View jump = at(button(activity, "Jump to latest", 48), 176, 110, 48, 40);
            View send = at(button(activity, "Send", 48), 340, 160, 48, 40);
            TextView save = new TextView(activity);
            save.setText("Save");
            save.setClickable(true);
            at(save, 0, 160, 80, 40);
            InvisibleButtons.own(save, save.getText());
            ViewGroup root = chat(activity, call, messages, jump, send, save);

            InvisibleButtons.chatShown(new Object(), root);

            Map<String, String> places = InvisibleButtons.places();
            assertEquals("above the messages", InvisibleButtons.PLACE_HEADER, places.get("Call"));
            assertEquals("over the messages", InvisibleButtons.PLACE_CHAT, places.get("Jump to latest"));
            assertEquals("below them", InvisibleButtons.PLACE_COMPOSER, places.get("Send"));
            assertEquals("HushMessenger's own, wherever it sits", InvisibleButtons.PLACE_OURS, places.get("Save"));
            assertEquals(4, places.size());
        }
    }

    /** Translucent chat bars runs the messages under both bars and pads the list, so the padding is where they stop. */
    @Test public void underTranslucentBarsTheListsPaddingIsWhereTheMessagesStop() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            RecyclerView messages = new RecyclerView(activity);
            at(messages, 0, 0, 400, 200);
            messages.setPadding(0, 40, 0, 40);
            messages.setClipToPadding(false);
            View call = at(button(activity, "Call", 48), 300, 0, 48, 40);
            View send = at(button(activity, "Send", 48), 340, 160, 48, 40);
            ViewGroup root = chat(activity, messages, call, send);

            InvisibleButtons.chatShown(new Object(), root);

            assertEquals(Map.of("Call", InvisibleButtons.PLACE_HEADER, "Send", InvisibleButtons.PLACE_COMPOSER), InvisibleButtons.places());
        }
    }

    @Test public void aButtonFirstSeenOnTheChatListStaysTheScreensAndOlderNamesHaveNoPlace() {
        // Picked before places were kept, so it stays listed with no place.
        Settings.preferences.edit().putString("invisible_buttons_seen", "Old one")
            .putString(InvisibleButtons.LEVELS, "0\tOld one").commit();
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            chat(activity, button(activity, "New message", 48));
            InvisibleButtons.screenShown(activity);
        }
        assertEquals(Map.of("New message", InvisibleButtons.PLACE_SCREEN), InvisibleButtons.places());
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            RecyclerView messages = new RecyclerView(activity);
            at(messages, 0, 40, 400, 160);
            ViewGroup root = chat(activity, at(button(activity, "New message", 48), 300, 0, 48, 40), messages);
            InvisibleButtons.chatShown(new Object(), root);
        }
        assertEquals("the first place stays", Map.of("New message", InvisibleButtons.PLACE_SCREEN), InvisibleButtons.places());
        assertEquals(List.of("Old one", "New message"), InvisibleButtons.seen());
    }

    @Test public void settingsGroupsTheButtonsByWhereTheyWereSeenAndOlderOnesGoLast() {
        Settings.preferences.edit().putString("invisible_buttons_seen", "Call\nSend\nNew message\nOld one")
            .putString(InvisibleButtons.PLACES, "header\tCall\ncomposer\tSend\nscreen\tNew message").commit();
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            ViewGroup list = page.get().getWindow().getDecorView().findViewWithTag("invisible_buttons_list");
            List<Object> order = new ArrayList<>();
            for (int i = 0; i < list.getChildCount(); i++) order.add(list.getChildAt(i).getTag());
            assertEquals(List.of("invisible_buttons_group_screen", "invisible_buttons_row_New message",
                "invisible_buttons_group_header", "invisible_buttons_row_Call",
                "invisible_buttons_group_composer", "invisible_buttons_row_Send",
                "invisible_buttons_group_other", "invisible_buttons_row_Old one"), order);
            TextView header = list.findViewWithTag("invisible_buttons_group_header");
            assertEquals(new SettingsText(page.get()).get("invisible_buttons_group_header"), header.getText().toString());
            assertTrue("a heading for TalkBack", header.isAccessibilityHeading());
        }
        Settings.preferences.edit().remove(InvisibleButtons.PLACES).commit();
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            ViewGroup list = page.get().getWindow().getDecorView().findViewWithTag("invisible_buttons_list");
            assertNotNull(list.findViewWithTag("invisible_buttons_row_Old one"));
            assertNull("only older names: one plain list, as before", list.findViewWithTag("invisible_buttons_group_other"));
        }
    }

    /** #191: HushMessenger's own buttons are listed as its own wherever they sit, and so are ones an older build filed. */
    @Test public void hushMessengersOwnButtonsGoInTheirGroupWhereverTheySit() {
        Settings.preferences.edit()
            .putString("invisible_buttons_seen", "Page up\nOur arrow")
            .putString(InvisibleButtons.PLACES, "screen\tPage up\nscreen\tOur arrow")
            .putString(InvisibleButtons.LEVELS, "0\tPage up\n50\tOur arrow").commit();
        assertEquals("a name only HushMessenger's buttons use, filed by an older build", InvisibleButtons.PLACE_OURS,
            InvisibleButtons.places().get("Page up"));
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = at(button(activity, "Call", 48), 300, 0, 48, 40);
            RecyclerView messages = new RecyclerView(activity);
            at(messages, 0, 40, 400, 120);
            View arrow = at(button(activity, "Our arrow", 40), 12, 100, 40, 40);
            InvisibleButtons.ownView(arrow);
            LinearLayout sheet = new LinearLayout(activity);
            at(sheet, 100, 60, 200, 40);
            InvisibleButtons.ownView(sheet);
            sheet.addView(button(activity, "Play again", 40));
            ViewGroup root = chat(activity, call, messages, arrow, sheet);

            InvisibleButtons.chatShown(new Object(), root);

            Map<String, String> places = InvisibleButtons.places();
            assertEquals("Messenger's", InvisibleButtons.PLACE_HEADER, places.get("Call"));
            assertEquals("over the messages, and ours", InvisibleButtons.PLACE_OURS, places.get("Our arrow"));
            assertEquals("a button inside one of ours", InvisibleButtons.PLACE_OURS, places.get("Play again"));
            String stored = Settings.preferences.getString(InvisibleButtons.PLACES, "");
            assertTrue("the older entry is put right", stored.contains("ours\tOur arrow"));
            assertTrue(stored.contains("ours\tPage up"));
            assertEquals(0.5f, arrow.getAlpha(), 0.001f);
        }
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            ViewGroup list = page.get().getWindow().getDecorView().findViewWithTag("invisible_buttons_list");
            List<Object> order = new ArrayList<>();
            for (int i = 0; i < list.getChildCount(); i++) order.add(list.getChildAt(i).getTag());
            int ours = order.indexOf("invisible_buttons_group_ours");
            assertTrue(String.valueOf(order), ours >= 0);
            assertEquals(List.of("invisible_buttons_group_ours", "invisible_buttons_row_Page up",
                "invisible_buttons_row_Our arrow", "invisible_buttons_row_Play again"), order.subList(ours, order.size()));
        }
    }

    /** #191: what Messenger draws from a message is never listed, and what an older build kept of it goes. */
    @Test public void textFromAMessageIsNeverListedAndWhatWasKeptOfItGoes() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = at(button(activity, "Call", 48), 300, 0, 48, 40);
            View address = at(button(activity, "https://example.com/a", 48), 240, 0, 48, 40);
            RecyclerView messages = new RecyclerView(activity);
            at(messages, 0, 40, 400, 100);
            // A pinned message across the top of the chat.
            View pinned = at(button(activity, "See you at six", 400), 0, 40, 400, 30);
            // A link's preview card over the message box, with a button of its own.
            LinearLayout card = new LinearLayout(activity);
            card.setClickable(true);
            card.setContentDescription("TikTok, a video someone shared");
            at(card, 0, 140, 400, 30);
            card.addView(button(activity, "Open the video", 40));
            EditText field = new EditText(activity);
            at(field, 60, 170, 280, 30);
            View camera = at(button(activity, "Camera", 48), 0, 170, 48, 30);
            ViewGroup root = chat(activity, call, address, messages, pinned, card, field, camera);
            String language = InvisibleButtons.languageOf(root);
            // What an older build kept: a link's title with no record, a web address, and a button of the message box.
            Settings.preferences.edit()
                .putString("invisible_buttons_seen", "Me at the zoo\nhttps://youtu.be/abc\nSend")
                .putString(InvisibleButtons.PLACES, "composer\tMe at the zoo\ncomposer\thttps://youtu.be/abc\ncomposer\tSend")
                .putString(InvisibleButtons.SEEN_ON, TODAY + "\t" + language + "\thttps://youtu.be/abc\n"
                    + TODAY + "\t" + language + "\tSend").commit();

            InvisibleButtons.chatShown(new Object(), root);

            assertEquals(List.of("Send", "Call", "Camera"), InvisibleButtons.seen());
            assertEquals(Map.of("Send", InvisibleButtons.PLACE_COMPOSER, "Call", InvisibleButtons.PLACE_HEADER,
                "Camera", InvisibleButtons.PLACE_COMPOSER), InvisibleButtons.places());
            assertFalse(Settings.preferences.getString(InvisibleButtons.SEEN_ON, "").contains("youtu"));
            assertTrue(InvisibleButtons.looksLikeLink("Watch at WWW.example.com"));
            assertFalse(InvisibleButtons.looksLikeLink("Call"));
        }
    }

    /** #191: a name last seen in another language or long ago leaves the list, unless it's picked. */
    @Test public void namesSeenInAnotherLanguageOrLongAgoLeaveTheListButPickedOnesStay() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            ViewGroup root = chat(activity, button(activity, "Call", 48));
            String language = InvisibleButtons.languageOf(root);
            assertFalse(language.isEmpty());
            long old = TODAY - InvisibleButtons.STALE_DAYS;
            Settings.preferences.edit()
                .putString("invisible_buttons_seen", "Novoe soobshchenie\nChats, Tab 1 of 5\nRecent one\nCall\n"
                    + "Kept a while\nPicked long ago\nPicked in Russian")
                .putString(InvisibleButtons.PLACES, "screen\tNovoe soobshchenie\nscreen\tChats, Tab 1 of 5\n"
                    + "screen\tRecent one\nheader\tCall\nscreen\tKept a while\nscreen\tPicked long ago\nscreen\tPicked in Russian")
                .putString(InvisibleButtons.SEEN_ON, String.join("\n",
                    TODAY + "\tru\tNovoe soobshchenie",
                    (old - 1) + "\t" + language + "\tChats, Tab 1 of 5",
                    (TODAY - 3) + "\t" + language + "\tRecent one",
                    (TODAY - 3) + "\t" + language + "\tCall",
                    old + "\t" + language + "\tKept a while",
                    (old - 30) + "\t" + language + "\tPicked long ago",
                    TODAY + "\tru\tPicked in Russian"))
                .putString(InvisibleButtons.LEVELS, "0\tPicked long ago\n25\tPicked in Russian").commit();

            InvisibleButtons.chatShown(new Object(), root);

            assertEquals(List.of("Recent one", "Call", "Kept a while", "Picked long ago", "Picked in Russian"),
                InvisibleButtons.seen());
            assertEquals(InvisibleButtons.seen(), InvisibleButtons.listed());
            assertEquals("never a picked one, or its button would come back",
                Map.of("Picked long ago", 0, "Picked in Russian", 25), InvisibleButtons.levels());
            List<String> when = List.of(Settings.preferences.getString(InvisibleButtons.SEEN_ON, "").split("\n"));
            assertTrue("seen again today", when.contains(TODAY + "\t" + language + "\tCall"));
            assertTrue(when.contains((TODAY - 3) + "\t" + language + "\tRecent one"));
            assertFalse("what left the list leaves its record too", String.join("\n", when).contains("Novoe"));
            String stored = Settings.preferences.getString(InvisibleButtons.PLACES, "");
            assertFalse(stored.contains("Novoe"));
            assertFalse(stored.contains("Tab 1 of 5"));
        }
    }

    /**
     * #191: the chat's name in its top bar is a button named for the chat, a comma and Messenger's "Thread details", the
     * details button's whole name. It's kept as one row with nobody's name in it, apart from the details button, and a
     * level picked for it holds in every chat. A comma with no button's name after it is left as it is.
     */
    @Test public void aChatsNameInFrontOfMessengersLabelIsLeftOutSoOneRowCoversEveryChat() {
        String title = InvisibleButtons.SOMEONE + "Thread details";
        String keyboard = "Open sticker, emoji and GIF keyboard.";
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View pat = at(button(activity, "Pat, Thread details", 150), 50, 0, 150, 40);
            View details = at(button(activity, "Thread details", 48), 340, 0, 48, 40);
            RecyclerView messages = new RecyclerView(activity);
            at(messages, 0, 40, 400, 120);
            ViewGroup root = chat(activity, at(button(activity, "Back", 48), 0, 0, 48, 40), pat, details, messages,
                at(button(activity, keyboard, 48), 0, 160, 48, 40));

            InvisibleButtons.chatShown(new Object(), root);

            assertEquals(List.of("Back", title, "Thread details", keyboard), InvisibleButtons.seen());
            Map<String, String> places = InvisibleButtons.places();
            assertEquals(InvisibleButtons.PLACE_HEADER, places.get(title));
            assertEquals(InvisibleButtons.PLACE_HEADER, places.get("Thread details"));
            assertEquals(InvisibleButtons.PLACE_COMPOSER, places.get(keyboard));
            assertEquals("a tap in pick mode finds the one row too", title, InvisibleButtons.buttonAt(root, middleOf(pat)[0], middleOf(pat)[1]).getValue());

            InvisibleButtons.setLevel(title, 0);
            clock += 1;
            InvisibleButtons.look(root, false);
            assertEquals("the chat's name goes", 0f, pat.getAlpha(), 0f);
            assertEquals("and the details button stays, a button of its own", 1f, details.getAlpha(), 0f);
        }
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View sam = at(button(activity, "Sam Lee, Jr., Thread details", 150), 50, 0, 150, 40);
            View details = at(button(activity, "Thread details", 48), 340, 0, 48, 40);
            RecyclerView messages = new RecyclerView(activity);
            at(messages, 0, 40, 400, 160);
            ViewGroup root = chat(activity, sam, details, messages);

            InvisibleButtons.chatShown(new Object(), root);

            assertEquals("the level picked in one chat holds in the next", 0f, sam.getAlpha(), 0f);
            assertEquals(1f, details.getAlpha(), 0f);
        }
        assertEquals(Map.of(title, 0), InvisibleButtons.levels());
        assertEquals(List.of("Back", title, "Thread details", keyboard), InvisibleButtons.seen());
        for (String key : List.of("invisible_buttons_seen", InvisibleButtons.PLACES, InvisibleButtons.SEEN_ON, InvisibleButtons.LEVELS)) {
            String stored = Settings.preferences.getString(key, "");
            assertFalse("nobody's name is kept: " + stored, stored.contains("Pat") || stored.contains("Sam"));
        }
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /**
     * #191: rows an earlier build kept for the chat's name in each chat fold into the one row, at the lowest of their
     * levels, and the names leave what's saved at the next walk. A choice file saved back then reads the same way.
     */
    @Test public void rowsSavedUnderAChatsNameFoldIntoOneRowAtTheLowestLevel() {
        String title = InvisibleButtons.SOMEONE + "Thread details";
        String language;
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            language = InvisibleButtons.languageOf(screen.get().getWindow().getDecorView());
        }
        Settings.preferences.edit()
            .putString("invisible_buttons_seen", "Matt, Thread details\nThread details\nMatt Parker, Thread details")
            .putString(InvisibleButtons.PLACES, "header\tMatt, Thread details\nheader\tThread details\nheader\tMatt Parker, Thread details")
            .putString(InvisibleButtons.SEEN_ON, String.join("\n",
                (TODAY - 2) + "\t" + language + "\tMatt, Thread details",
                TODAY + "\t" + language + "\tThread details",
                (TODAY - 1) + "\t" + language + "\tMatt Parker, Thread details"))
            .putString(InvisibleButtons.LEVELS, "50\tMatt, Thread details\n25\tMatt Parker, Thread details\n75\tThread details")
            .commit();
        String choiceFile = ChoiceCodec.encode(Settings.preferences, Collections.singleton(InvisibleButtons.KEY));

        assertEquals(List.of(title, "Thread details"), InvisibleButtons.seen());
        assertEquals(InvisibleButtons.seen(), InvisibleButtons.listed());
        assertEquals("the lowest level wins", Map.of(title, 25, "Thread details", 75), InvisibleButtons.levels());
        assertEquals("an old name asks for the one row", 25, InvisibleButtons.level("Matt, Thread details"));
        assertEquals(Map.of(title, InvisibleButtons.PLACE_HEADER, "Thread details", InvisibleButtons.PLACE_HEADER),
            InvisibleButtons.places());
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            ViewGroup list = page.get().getWindow().getDecorView().findViewWithTag("invisible_buttons_list");
            List<Object> order = new ArrayList<>();
            for (int i = 0; i < list.getChildCount(); i++) order.add(list.getChildAt(i).getTag());
            assertEquals(List.of("invisible_buttons_group_header", "invisible_buttons_row_" + title,
                "invisible_buttons_row_Thread details"), order);
            assertTrue(((RadioButton) list.findViewWithTag("invisible_buttons_level_25_" + title)).isChecked());
        }

        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View pat = at(button(activity, "Pat, Thread details", 150), 50, 0, 150, 40);
            View details = at(button(activity, "Thread details", 48), 340, 0, 48, 40);
            RecyclerView messages = new RecyclerView(activity);
            at(messages, 0, 40, 400, 160);
            InvisibleButtons.chatShown(new Object(), chat(activity, pat, details, messages));

            assertEquals("a chat nobody picked anything in before", 0.25f, pat.getAlpha(), 0.001f);
            assertEquals(0.75f, details.getAlpha(), 0.001f);
        }
        assertEquals("25\t" + title + "\n75\tThread details", Settings.preferences.getString(InvisibleButtons.LEVELS, ""));
        assertEquals(title + "\nThread details", Settings.preferences.getString("invisible_buttons_seen", ""));
        assertEquals("seen today, as the one row", TODAY + "\t" + language + "\t" + title,
            Settings.preferences.getString(InvisibleButtons.SEEN_ON, "").split("\n")[0]);
        for (String key : List.of(InvisibleButtons.PLACES, InvisibleButtons.SEEN_ON)) {
            assertFalse(Settings.preferences.getString(key, "").contains("Matt"));
        }

        // A choice file saved with the old names, restored where no chat has been opened yet, then a chat.
        Settings.preferences.edit().clear().putBoolean(InvisibleButtons.KEY, true).commit();
        Object saved = ChoiceCodec.parse(choiceFile).get(InvisibleButtons.LEVELS);
        assertEquals("50\tMatt, Thread details\n25\tMatt Parker, Thread details\n75\tThread details", saved);
        Settings.preferences.edit().putString(InvisibleButtons.LEVELS, (String) saved).commit();
        assertEquals(Map.of(title, 25, "Thread details", 75), InvisibleButtons.levels());
        Settings.preferences.edit().putString(InvisibleButtons.LEVELS, "50\tMatt, Thread details").commit();
        assertEquals("with no details button seen yet the old name stays as it was",
            Map.of("Matt, Thread details", 50), InvisibleButtons.levels());
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View sam = at(button(activity, "Sam, Thread details", 150), 50, 0, 150, 40);
            RecyclerView messages = new RecyclerView(activity);
            at(messages, 0, 40, 400, 160);
            InvisibleButtons.chatShown(new Object(), chat(activity, sam, at(button(activity, "Thread details", 48), 340, 0, 48, 40), messages));

            assertEquals("then the first chat opened carries it", 0.5f, sam.getAlpha(), 0.001f);
        }
        assertEquals("50\t" + title, Settings.preferences.getString(InvisibleButtons.LEVELS, ""));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void theRoundButtonPicksTheButtonTappedAndOpensItsLevelsRightThere() {
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            View call = at(button(activity, "Call", 48), 200, 0, 48, 40);
            View video = at(button(activity, "Video call", 48), 260, 0, 48, 40);
            chat(activity, call, video);
            ViewGroup window = (ViewGroup) activity.getWindow().getDecorView();
            InvisibleButtons.screenShown(activity);
            assertNull("off until its switch is on", window.findViewWithTag(InvisibleButtonsPick.DOT));

            Settings.preferences.edit().putBoolean(InvisibleButtonsPick.KEY, true).commit();
            InvisibleButtons.look(window, true);
            View dot = window.findViewWithTag(InvisibleButtonsPick.DOT);
            assertNotNull("the round button sits on the screen's window", dot);
            assertSame(window, dot.getParent());
            layWindow(window, 600);
            // A walk now that the round button has its size, so it would be listed if the walk took it.
            InvisibleButtons.look(window, true);
            SettingsText text = new SettingsText(activity);
            assertEquals(text.get("invisible_buttons_pick_dot"), dot.getContentDescription().toString());
            assertFalse("never listed itself", InvisibleButtons.seen().contains(text.get("invisible_buttons_pick_dot")));

            assertTrue(dot.performClick());
            assertEquals(text.get("invisible_buttons_pick_now"), ShadowToast.getTextOfLatestToast());
            tap(window.findViewWithTag(InvisibleButtonsPick.CATCHER), middleOf(call));
            assertNull("one tap picks", window.findViewWithTag(InvisibleButtonsPick.CATCHER));
            ViewGroup card = window.findViewWithTag(InvisibleButtonsPick.CARD);
            assertNotNull("the levels open where the button is", card);
            assertEquals("Call", ((TextView) ((ViewGroup) card.getChildAt(0)).getChildAt(0)).getText().toString());
            View none = card.findViewWithTag(InvisibleButtonsPick.LEVEL + 0);
            assertEquals(text.get("invisible_buttons_level_choice", text.percent(0), "Call"), none.getContentDescription().toString());
            assertTrue("as Messenger draws it now", card.findViewWithTag(InvisibleButtonsPick.LEVEL + 100).isSelected());
            none.performClick();

            assertEquals(0, InvisibleButtons.level("Call"));
            assertEquals("drawn at once", 0f, call.getAlpha(), 0f);
            assertEquals(1f, video.getAlpha(), 0f);
            assertNull("the card closed", window.findViewWithTag(InvisibleButtonsPick.CARD));
            assertEquals(text.get("invisible_buttons_invisible"), ShadowToast.getTextOfLatestToast());

            // An invisible button is picked the same way, which is how it's brought back.
            dot.performClick();
            tap(window.findViewWithTag(InvisibleButtonsPick.CATCHER), middleOf(call));
            card = window.findViewWithTag(InvisibleButtonsPick.CARD);
            assertTrue(card.findViewWithTag(InvisibleButtonsPick.LEVEL + 0).isSelected());
            card.findViewWithTag(InvisibleButtonsPick.LEVEL + 50).performClick();
            assertEquals(0.5f, call.getAlpha(), 0.001f);
            assertEquals(text.get("invisible_buttons_level", text.percent(50)), ShadowToast.getTextOfLatestToast());

            // A tap with no button under it, then a tap back on the round button, which only stops picking.
            dot.performClick();
            int[] window0 = new int[2];
            window.getLocationOnScreen(window0);
            tap(window.findViewWithTag(InvisibleButtonsPick.CATCHER), new int[] {window0[0] + 20, window0[1] + 400});
            assertEquals(text.get("invisible_buttons_pick_none"), ShadowToast.getTextOfLatestToast());
            assertNull(window.findViewWithTag(InvisibleButtonsPick.CARD));
            dot.performClick();
            tap(window.findViewWithTag(InvisibleButtonsPick.CATCHER), middleOf(dot));
            assertNull(window.findViewWithTag(InvisibleButtonsPick.CATCHER));
            assertNull(window.findViewWithTag(InvisibleButtonsPick.CARD));
            assertEquals(List.of("Call", "Video call"), InvisibleButtons.seen());

            // The switch going off takes it all away, a card left open included.
            dot.performClick();
            tap(window.findViewWithTag(InvisibleButtonsPick.CATCHER), middleOf(video));
            assertNotNull(window.findViewWithTag(InvisibleButtonsPick.CARD));
            Settings.preferences.edit().putBoolean(InvisibleButtonsPick.KEY, false).commit();
            InvisibleButtons.look(window, true);
            assertNull(window.findViewWithTag(InvisibleButtonsPick.DOT));
            assertNull(window.findViewWithTag(InvisibleButtonsPick.CARD));
            assertEquals("the levels picked stay", 0.5f, call.getAlpha(), 0.001f);
            assertTrue(Settings.hookErrors.isEmpty());
        }
    }

    @Config(sdk = 36)
    @Test public void aMenuTallEnoughGetsTheRoundButtonAndAShortOneDoesnt() {
        Settings.preferences.edit().putBoolean(InvisibleButtonsPick.KEY, true).commit();
        try (var screen = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = screen.get();
            chat(activity, button(activity, "Call", 48));
            Dialog menu = new Dialog(activity);
            LinearLayout card = new LinearLayout(activity);
            card.addView(button(activity, "React", 48));
            menu.setContentView(card);
            menu.show();
            shadowOf(Looper.getMainLooper()).idle();
            InvisibleButtons.findMenus();
            View window = menu.getWindow().getDecorView();

            layWindow(window, 100);
            InvisibleButtons.look(window, true);
            assertNull("it would sit over the menu's buttons", window.findViewWithTag(InvisibleButtonsPick.DOT));
            layWindow(window, 400);
            InvisibleButtons.look(window, true);
            assertNotNull(window.findViewWithTag(InvisibleButtonsPick.DOT));
            menu.dismiss();
            shadowOf(Looper.getMainLooper()).idle();
        }
    }

    @Test public void pickingOnScreenIsASwitchUnderInvisibleButtonsAndOffByDefault() {
        assertEquals(InvisibleButtons.KEY, Settings.SUB_SWITCHES.get(InvisibleButtonsPick.KEY));
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Switch pick = page.get().getWindow().getDecorView().findViewWithTag(InvisibleButtonsPick.KEY);
            assertNotNull(pick);
            assertFalse(pick.isChecked());
            pick.performClick();
            assertTrue(Settings.preferences.getBoolean(InvisibleButtonsPick.KEY, false));
        }
    }

    @Test public void aScreenWithNoViewIsNoFailure() {
        InvisibleButtons.chatShown(new Object(), null);
        InvisibleButtons.look(null, true);
        InvisibleButtons.screenShown(null);
        assertTrue(Settings.hookErrors.isEmpty());
    }
}
