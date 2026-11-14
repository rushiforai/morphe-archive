package app.hushmessenger.extension;

import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;
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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ChatHidingTest {
    public static final class Key {
        final String id;

        public Key(String id) {
            this.id = id;
        }

        @Override public String toString() {
            return id;
        }
    }

    public static final class Secret {
        public String text;
    }

    public static final class User {
        public String id;
    }

    public static final class Info {
        public User user;
        public Secret name;
    }

    public static final class Participant {
        public Info info;

        Participant(String id, String name) {
            info = new Info();
            info.user = new User();
            info.user.id = id;
            info.name = new Secret();
            info.name.text = name;
        }
    }

    public static final class Rows extends ArrayList<Object> {
        public static Rows copyOf(Collection<?> rows) {
            Rows copy = new Rows();
            copy.addAll(rows);
            return copy;
        }

        static Rows of(Object... rows) {
            return copyOf(Arrays.asList(rows));
        }
    }

    /** A chat with no name of its own is named after its people. */
    public static final class Summary {
        public Key key;
        public String name;
        public Rows people = new Rows();

        Summary(String id) {
            key = new Key(id);
        }

        @Override public String toString() {
            return key.id;
        }
    }

    public enum Icons { MUTE, EYE, EYE_CROSS, STAR, STAR_CROSS, CLOCK }

    /** Messenger's row builder: a factory, an id, an icon, a title and a description, then a static build. */
    public static final class Builder {
        public int id;
        public String description;
        Icons picture;
        CharSequence label;

        public static Builder create() {
            return new Builder();
        }

        public void icon(Icons icon) {
            picture = icon;
        }

        public void title(CharSequence title) {
            label = title;
        }

        /** 587's builder fills the description through a setter. */
        int described;

        public void describe(String text) {
            description = text;
            described++;
        }

        public static Built build(Builder builder, String name) {
            return new Built(builder, name);
        }
    }

    public static final class Built {
        final Builder builder;
        final String name;

        Built(Builder builder, String name) {
            this.builder = builder;
            this.name = name;
        }
    }

    public static final class Menu {
        public Summary chat;

        Menu(Summary chat) {
            this.chat = chat;
        }
    }

    public static final class Supplier {
        public int count;
        int subscribed;

        private static void subscribe(Supplier supplier, boolean retry) {
            assertTrue(retry);
            supplier.subscribed++;
        }
    }

    private static final String TEST = "Lapp/hushmessenger/extension/ChatHidingTest$";
    private static final String SUMMARY = TEST + "Summary;";
    private static final String BUILDER = TEST + "Builder;";
    private static final String SUPPLIER = TEST + "Supplier;";
    /** Also Special contacts' route: its menu row and tap ride on these same hooks. */
    static final String ROUTE = String.join("|",
        SUMMARY + "->key:" + TEST + "Key;",
        SUMMARY + "->name:Ljava/lang/String;",
        SUMMARY + "->people:" + TEST + "Rows;",
        TEST + "Participant;->info:" + TEST + "Info;",
        TEST + "Info;->user:" + TEST + "User;",
        TEST + "User;->id:Ljava/lang/String;",
        TEST + "Info;->name:" + TEST + "Secret;",
        TEST + "Secret;->text:Ljava/lang/String;",
        TEST + "Menu;->chat:" + SUMMARY,
        BUILDER + "->create()" + BUILDER,
        BUILDER + "->id:I",
        BUILDER + "->icon(" + TEST + "Icons;)V",
        BUILDER + "->title(Ljava/lang/CharSequence;)V",
        BUILDER + "->description:Ljava/lang/String;",
        BUILDER + "->build(" + BUILDER + "Ljava/lang/String;)" + TEST + "Built;",
        SUPPLIER + "->subscribe(" + SUPPLIER + "Z)V",
        SUPPLIER + "->count:I");

    private Context context;
    private final Object mute = new Object();

    @Before public void reset() throws Exception {
        context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().putBoolean(ChatHiding.KEY, true).commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        ShadowToast.reset();
        File folder = context.getDatabasePath(ChatHiding.KEY).getParentFile();
        folder.mkdirs();
        for (File old : folder.listFiles()) old.delete();
        account("100");
        restart();
    }

    private void account(String id) throws IOException {
        assertTrue(new File(context.getDatabasePath(ChatHiding.KEY).getParentFile(), "msys_database_" + id).createNewFile());
    }

    private void signOut(String id) {
        assertTrue(new File(context.getDatabasePath(ChatHiding.KEY).getParentFile(), "msys_database_" + id).delete());
    }

    /** Messenger's next process: nothing kept in memory, the hidden chats still in its preferences. */
    private static void restart() throws Exception {
        ChatHiding.resetForTests();
        ChatHiding.route = ChatHiding.Route.of(ROUTE, ChatHidingTest.class.getClassLoader());
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private String text(String key) {
        return new SettingsText(context).get(key);
    }

    /** The menu's rows as Messenger hands them over: its own, then empty slots up to its count. */
    private ArrayList<Object> menuRows(Summary chat) {
        ArrayList<Object> rows = new ArrayList<>(Arrays.asList(mute, null, null));
        ChatHiding.menuRows(new Menu(chat), rows);
        return rows;
    }

    private static List<String> names(Object rows) {
        List<String> names = new ArrayList<>();
        for (Object row : (List<?>) rows) names.add(row.toString());
        return names;
    }

    private static List<String> chosen() {
        List<String> chats = new ArrayList<>();
        for (String[] chat : ChatHiding.chosen()) chats.add(chat[0] + "=" + chat[1]);
        return chats;
    }

    @Test public void aHiddenChatStaysOffTheListWhenANewMessageBringsItBack() {
        Summary chat = new Summary("chat");
        Summary plain = new Summary("plain");
        Supplier supplier = new Supplier();
        Rows stock = Rows.of(plain, chat);
        assertSame("Nothing hidden yet", stock, ChatHiding.inboxRows(supplier, stock));

        assertTrue(ChatHiding.menuTapped(new Menu(chat), ChatHiding.ROW_ID));
        idle();
        assertEquals(text("hidden_chats_hidden"), ShadowToast.getTextOfLatestToast());
        assertEquals("The list reads itself again", 1, supplier.subscribed);

        Object hidden = ChatHiding.inboxRows(supplier, Rows.of(plain, chat));
        assertTrue(hidden instanceof Rows);
        assertEquals(Collections.singletonList("plain"), names(hidden));
        // A new message gives Messenger a fresh row for the same chat.
        Summary moved = new Summary("chat");
        assertEquals(Collections.singletonList("plain"), names(ChatHiding.inboxRows(supplier, Rows.of(moved, plain))));
        Rows without = Rows.of(plain);
        assertSame("A list without it is left alone", without, ChatHiding.inboxRows(supplier, without));
        assertTrue(Settings.lastActive(ChatHiding.KEY) > 0);
    }

    @Test public void theMenuRowFillsTheFirstEmptySlotWithHideThenShow() {
        Summary chat = new Summary("chat");
        ArrayList<Object> rows = menuRows(chat);
        assertEquals(3, rows.size());
        assertSame(mute, rows.get(0));
        assertNull("Only the first empty slot", rows.get(2));
        Built hide = (Built) rows.get(1);
        assertEquals(ChatHiding.ROW_ID, hide.builder.id);
        assertEquals(text("hidden_chats_hide"), hide.builder.label.toString());
        assertEquals(text("hidden_chats_hide"), hide.builder.description);
        assertEquals(Icons.EYE_CROSS, hide.builder.picture);
        assertEquals("hush_hide_chat", hide.name);

        assertTrue(ChatHiding.menuTapped(new Menu(chat), ChatHiding.ROW_ID));
        Built show = (Built) menuRows(chat).get(1);
        assertEquals(text("hidden_chats_show"), show.builder.label.toString());
        assertEquals(Icons.EYE, show.builder.picture);

        Supplier supplier = new Supplier();
        ChatHiding.inboxRows(supplier, Rows.of(chat));
        assertTrue(ChatHiding.menuTapped(new Menu(chat), ChatHiding.ROW_ID));
        idle();
        assertEquals(text("hidden_chats_shown"), ShadowToast.getTextOfLatestToast());
        assertEquals(1, supplier.subscribed);
        Rows back = Rows.of(chat);
        assertSame(back, ChatHiding.inboxRows(supplier, back));
    }

    @Test public void a587RouteFillsTheDescriptionThroughTheBuildersSetter() throws Exception {
        String field = BUILDER + "->description:Ljava/lang/String;";
        ChatHiding.route = ChatHiding.Route.of(ROUTE.replace(field, BUILDER + "->describe(Ljava/lang/String;)V"), ChatHidingTest.class.getClassLoader());
        Built hide = (Built) menuRows(new Summary("chat")).get(1);
        assertEquals(text("hidden_chats_hide"), hide.builder.description);
        assertEquals(1, hide.builder.described);
        for (String wrong : Arrays.asList(BUILDER + "->title(Ljava/lang/CharSequence;)V", BUILDER + "->create()" + BUILDER, BUILDER + "->id:I")) {
            assertThrows(wrong, IllegalStateException.class, () -> ChatHiding.Route.of(ROUTE.replace(field, wrong), ChatHidingTest.class.getClassLoader()));
        }
    }

    @Test public void aFullMenuGetsTheRowOnTheEndAndMessengersOwnTapsGoOn() {
        // Messenger's plain long-press menu (Archive, Mark as unread, Delete) comes back full, with no empty slot.
        ArrayList<Object> full = new ArrayList<>(Arrays.asList(mute, mute));
        ChatHiding.menuRows(new Menu(new Summary("chat")), full);
        assertEquals(3, full.size());
        assertSame(mute, full.get(1));
        Built hide = (Built) full.get(2);
        assertEquals(ChatHiding.ROW_ID, hide.builder.id);
        assertEquals(text("hidden_chats_hide"), hide.builder.label.toString());
        ArrayList<Object> other = new ArrayList<>(Arrays.asList(mute, null));
        ChatHiding.menuRows(new Object(), other);
        assertNull("Another menu's rows", other.get(1));

        assertFalse(ChatHiding.menuTapped(new Menu(new Summary("chat")), 0x4b));
        assertTrue(chosen().isEmpty());
        assertEquals(0, ShadowToast.shownToastCount());
    }

    @Test public void offPauseSafeModeAndAMissingControlHandBackMessengersListAndKeepTheChoice() throws Exception {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            reset();
            Set<String> installed = Settings.installed;
            Summary chat = new Summary("chat");
            assertTrue(state, ChatHiding.menuTapped(new Menu(chat), ChatHiding.ROW_ID));

            Settings.preferences.edit().putBoolean(ChatHiding.KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);
            if (state.equals("missing")) Settings.installed = Collections.emptySet();

            Rows stock = Rows.of(new Summary("plain"), chat);
            assertSame(state, stock, ChatHiding.inboxRows(new Supplier(), stock));
            assertEquals(state, Arrays.asList(mute, null, null), menuRows(chat));
            assertTrue(state, ChatHiding.menuTapped(new Menu(chat), ChatHiding.ROW_ID));
            assertEquals(state + " doesn't change the choice", Collections.singletonList("chat="), chosen());

            Settings.installed = installed;
            Settings.preferences.edit().putBoolean(ChatHiding.KEY, true).putBoolean("paused", false).putBoolean("safe_mode", false).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(context);
            restart();
            assertEquals(state + " kept it hidden for later", Collections.singletonList("plain"),
                names(ChatHiding.inboxRows(new Supplier(), Rows.of(new Summary("plain"), new Summary("chat")))));
        }
    }

    @Test public void eachAccountKeepsItsOwnHiddenChats() throws Exception {
        assertTrue(ChatHiding.menuTapped(new Menu(new Summary("mine")), ChatHiding.ROW_ID));
        signOut("100");
        account("200");
        restart();
        Rows theirs = Rows.of(new Summary("mine"));
        assertSame(theirs, ChatHiding.inboxRows(new Supplier(), theirs));
        assertTrue(chosen().isEmpty());

        signOut("200");
        account("100");
        restart();
        assertTrue(names(ChatHiding.inboxRows(new Supplier(), Rows.of(new Summary("mine")))).isEmpty());
    }

    @Test public void settingsListsEachChatByNameAndUnhideBringsItBack() throws Exception {
        Summary club = new Summary("club");
        club.name = "Book\tclub";
        Summary group = new Summary("group");
        group.people = Rows.of(new Participant("100", "Me"), new Participant("7", "Ana"), new Participant("8", "Ben"), "not a person");
        Summary unnamed = new Summary("unnamed");
        for (Summary chat : new Summary[] {club, group, unnamed}) assertTrue(ChatHiding.menuTapped(new Menu(chat), ChatHiding.ROW_ID));
        assertEquals("Its own name, or everyone in it but this account", Arrays.asList("club=Book club", "group=Ana, Ben", "unnamed="), chosen());

        restart();
        assertEquals("Kept across a restart", Arrays.asList("club=Book club", "group=Ana, Ben", "unnamed="), chosen());

        Supplier supplier = new Supplier();
        assertEquals(Collections.singletonList("plain"), names(ChatHiding.inboxRows(supplier, Rows.of(club, new Summary("plain")))));
        idle();
        int toasts = ShadowToast.shownToastCount();
        assertTrue(ChatHiding.unhide("club"));
        assertFalse("Already back", ChatHiding.unhide("club"));
        idle();
        assertEquals(1, supplier.subscribed);
        assertEquals("Settings says it, not the chat list", toasts, ShadowToast.shownToastCount());
        assertEquals(Arrays.asList("group=Ana, Ben", "unnamed="), chosen());
        assertEquals(Arrays.asList("club", "plain"), names(ChatHiding.inboxRows(supplier, Rows.of(club, new Summary("plain")))));
    }

    @Test public void settingsListsAChatHiddenWhileThePageSatBehindTheChatList() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals(View.VISIBLE, root.findViewWithTag("hidden_chats_empty").getVisibility());
            assertNull(root.findViewWithTag("hidden_chats_unhide_club"));

            // The S22 case: settings stays open under Messenger, a chat gets hidden from the list, then Back returns here.
            screen.pause().stop();
            Summary club = new Summary("club");
            club.name = "Book club";
            assertTrue(ChatHiding.menuTapped(new Menu(club), ChatHiding.ROW_ID));
            screen.restart().resume();

            Button unhide = root.findViewWithTag("hidden_chats_unhide_club");
            assertNotNull("Listed when the page comes back", unhide);
            assertEquals(View.GONE, root.findViewWithTag("hidden_chats_empty").getVisibility());
            LinearLayout list = root.findViewWithTag("hidden_chats_list");
            assertEquals("One line and one chat, not a second copy", 2, list.getChildCount());

            unhide.performClick();
            assertTrue(chosen().isEmpty());
            assertNull(root.findViewWithTag("hidden_chats_unhide_club"));
            assertEquals(View.VISIBLE, root.findViewWithTag("hidden_chats_empty").getVisibility());
        }
    }

    @Test public void withNoAccountToSaveUnderTheTapSaysItCouldntHide() throws Exception {
        signOut("100");
        restart();
        assertTrue(ChatHiding.menuTapped(new Menu(new Summary("chat")), ChatHiding.ROW_ID));
        idle();
        assertEquals(text("hidden_chats_failed"), ShadowToast.getTextOfLatestToast());
        assertTrue(chosen().isEmpty());
    }

    @Test public void aBuildWithNoRouteStaysStock() {
        ChatHiding.route = null;
        Summary chat = new Summary("chat");
        Rows stock = Rows.of(chat);
        assertSame(stock, ChatHiding.inboxRows(new Supplier(), stock));
        assertEquals(Arrays.asList(mute, null, null), menuRows(chat));
        assertFalse(ChatHiding.menuTapped(new Menu(chat), 0x4b));
        assertTrue(chosen().isEmpty());
    }
}
