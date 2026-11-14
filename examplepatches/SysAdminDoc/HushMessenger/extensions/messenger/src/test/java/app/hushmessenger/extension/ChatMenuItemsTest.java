package app.hushmessenger.extension;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ChatMenuItemsTest {
    /** Messenger's row builder, cut down: a factory, a title setter, a description field and a static build. */
    public static final class Builder {
        public int id;
        public String description;
        CharSequence label;

        public static Builder create() {
            return new Builder();
        }

        public void title(CharSequence title) {
            label = title;
        }

        /** 587's builder fills the description through a setter. */
        public void describe(String text) {
            description = text;
        }

        public static Row build(Builder builder, String name) {
            return new Row(builder, name);
        }
    }

    /** A finished row, which copies what the builder held and refuses an empty title, name or description, as 586's does. */
    public static final class Row {
        final int id;
        final String name;
        final String description;
        final CharSequence title;

        Row(Builder builder, String name) {
            if (builder.label == null || builder.label.length() == 0 || name.isEmpty() || builder.description.isEmpty()) {
                throw new IllegalArgumentException("Failed requirement.");
            }
            this.id = builder.id;
            this.name = name;
            this.description = builder.description;
            this.title = builder.label;
        }

        @Override public String toString() {
            return name;
        }
    }

    private static final String TEST = "Lapp/hushmessenger/extension/ChatMenuItemsTest$";
    private static final String BUILDER = TEST + "Builder;";
    private static final String ROUTE = String.join("|",
        BUILDER + "->create()" + BUILDER,
        BUILDER + "->title(Ljava/lang/CharSequence;)V",
        BUILDER + "->description:Ljava/lang/String;",
        BUILDER + "->build(" + BUILDER + "Ljava/lang/String;)" + TEST + "Row;");

    private Context context;
    private final Row mute = row("mute", "Mute");
    private final Row markRead = row("mark_read", "Mark as read");
    private final Row archive = row("archive", "Archive");
    private final Row hide = row("hush_hide_chat", "Hide from chat list");

    private static Row row(String name, String title) {
        Builder builder = Builder.create();
        builder.title(title);
        builder.description = title;
        return Builder.build(builder, name);
    }

    @Before public void reset() {
        context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().putBoolean(ChatMenuItems.KEY, true).commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        ChatMenuItems.resetForTests();
        Settings.hookErrors.clear();
    }

    @After public void clearFailures() {
        Settings.hookErrors.clear();
    }

    /** The menu's rows as Messenger hands them back, run through the hook. */
    private static ArrayList<Object> menu(Object... rows) {
        ArrayList<Object> list = new ArrayList<>(Arrays.asList(rows));
        ChatMenuItems.rows(list, ROUTE);
        return list;
    }

    @Test public void learnsEachItemAndItsWordsAndHidesOnlyThePickedOnes() {
        assertEquals("Its own name in plain words until a menu shows it", "Mark read", ChatMenuItems.label("mark_read"));
        assertEquals("Nothing picked, nothing changes", Arrays.asList(mute, markRead, archive, hide), menu(mute, markRead, archive, hide));
        assertEquals("HushMessenger's own row isn't listed", Arrays.asList("mute", "mark_read", "archive"), ChatMenuItems.seen());
        assertEquals("Mark as read", ChatMenuItems.label("mark_read"));
        assertFalse("Not in use until something is picked", Settings.activeAt.containsKey(ChatMenuItems.KEY));

        ChatMenuItems.setHidden("mark_read", true);
        assertEquals("No empty slot where it was: the menu reads every entry", Arrays.asList(mute, archive, hide), menu(mute, markRead, archive, hide));
        assertTrue(Settings.activeAt.containsKey(ChatMenuItems.KEY));
        assertEquals("A menu for another chat leaves it out too", Collections.singletonList(mute), menu(markRead, mute));

        ChatMenuItems.setHidden("mark_read", false);
        assertEquals(Arrays.asList(mute, markRead, archive), menu(mute, markRead, archive));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aMenuNeverLosesAllOfMessengersItemsAndItsOwnEmptySlotsStay() {
        ChatMenuItems.setHidden("mute", true);
        ChatMenuItems.setHidden("archive", true);
        assertEquals("Every one of Messenger's items picked: the menu shows them all", Arrays.asList(mute, archive, hide, null), menu(mute, archive, hide, null));
        assertEquals(Arrays.asList(markRead, null), menu(mute, markRead, archive, null));
        assertEquals("Only empty slots", Arrays.asList(null, null), menu(null, null));
    }

    @Test public void itemsSeenOnLaterMenusJoinTheListInTheOrderTheyFirstShowed() {
        menu(mute, archive);
        menu(markRead, mute, row("delete", "Delete"));
        assertEquals(Arrays.asList("mute", "archive", "mark_read", "delete"), ChatMenuItems.seen());
        menu(row("mute", "Silence"));
        assertEquals("The words Messenger last showed", "Silence", ChatMenuItems.label("mute"));
        menu(row("archive", "Line one\nline two"));
        assertEquals("Settings shows it on one line", "Line one line two", ChatMenuItems.label("archive"));
    }

    @Test public void offPauseSafeModeAndAMissingControlHandBackTheWholeMenu() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            reset();
            ChatMenuItems.setHidden("mute", true);
            Set<String> installed = Settings.installed;
            Settings.preferences.edit().putBoolean(ChatMenuItems.KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            try {
                assertEquals(state, Arrays.asList(mute, archive), menu(mute, archive));
                assertFalse(state, Settings.activeAt.containsKey(ChatMenuItems.KEY));
            } finally {
                Settings.installed = installed;
                Settings.preferences.edit().putBoolean("paused", false).putBoolean("safe_mode", false).commit();
                CrashGuard.resetForTests();
                CrashGuard.onProcessStart(context);
            }
            assertTrue(state + " keeps the choice", ChatMenuItems.hidden().contains("mute"));
        }
    }

    @Test public void a587RouteWithTheDescriptionSetterLearnsAndHidesTheSame() {
        String route = ROUTE.replace("->description:Ljava/lang/String;", "->describe(Ljava/lang/String;)V");
        ChatMenuItems.setHidden("mark_read", true);
        ArrayList<Object> list = new ArrayList<>(Arrays.asList(mute, markRead, archive));
        ChatMenuItems.rows(list, route);
        assertEquals(Arrays.asList(mute, archive), list);
        assertEquals("Mark as read", ChatMenuItems.label("mark_read"));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aRouteThatNoLongerFitsLeavesTheMenuWholeAndRecordsTheFailure() {
        ChatMenuItems.setHidden("mute", true);
        List<String> broken = Arrays.asList(
            "not a route",
            ROUTE.replace("->title(", "->heading("),
            ROUTE.replace("->description:Ljava/lang/String;", "->id:I"));
        for (String route : broken) {
            Settings.hookErrors.clear();
            ChatMenuItems.resetForTests();
            ArrayList<Object> list = new ArrayList<>(Arrays.asList(mute, archive));
            ChatMenuItems.rows(list, route);
            assertEquals(route, Arrays.asList(mute, archive), list);
            assertTrue(route, Settings.hookErrors.containsKey(ChatMenuItems.KEY));
        }
    }

    @Test public void settingsListsTheItemsSeenAndTheButtonHidesAndShowsEach() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertNotNull(root.findViewWithTag("chat_menu_items_empty"));
            assertNull(root.findViewWithTag("chat_menu_items_row_mute"));

            // Settings stays open under Messenger, a chat gets pressed and held, then Back returns here.
            screen.pause().stop();
            menu(mute, markRead, hide);
            screen.restart().resume();

            assertNull(root.findViewWithTag("chat_menu_items_empty"));
            assertNotNull(root.findViewWithTag("chat_menu_items_row_mute"));
            assertNotNull(root.findViewWithTag("chat_menu_items_row_mark_read"));
            assertNull("HushMessenger's own row has its own switch", root.findViewWithTag("chat_menu_items_row_hush_hide_chat"));

            root.findViewWithTag("chat_menu_items_toggle_mark_read").performClick();
            assertEquals(Collections.singleton("mark_read"), ChatMenuItems.hidden());
            View item = root.findViewWithTag("chat_menu_items_row_mark_read");
            assertEquals(new SettingsText(context).get("message_actions_hidden_label", "Mark as read"),
                ((TextView) ((ViewGroup) item).getChildAt(0)).getText().toString());
            assertEquals(Arrays.asList(mute, hide), menu(mute, markRead, hide));

            root.findViewWithTag("chat_menu_items_toggle_mark_read").performClick();
            assertTrue(ChatMenuItems.hidden().isEmpty());
            assertEquals("Mark as read", ((TextView) ((ViewGroup) root.findViewWithTag("chat_menu_items_row_mark_read")).getChildAt(0)).getText().toString());
        }
    }
}
