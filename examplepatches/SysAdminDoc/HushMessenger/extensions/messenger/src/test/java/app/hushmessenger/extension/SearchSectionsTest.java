package app.hushmessenger.extension;

import android.os.Looper;
import com.facebook.messaging.model.threadkey.ThreadKey;
import com.facebook.messaging.model.threads.ThreadSummary;
import com.facebook.user.model.User;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class SearchSectionsTest {
    /** Messenger's section types, by the names its enum gives them. */
    enum Type { NULL_STATE_SUGGESTIONS, NULL_STATE_RECENTLY_VIEWED_REELS, NULL_STATE_AI_BOTS, NULL_STATE_SEE_ALL_AI_BOTS, NULL_STATE_CONTACTS, SERVER_BLENDED, SERVER_MORE_PEOPLE }

    enum Item { CONTACT, PAGE, CONNECTED_AI_BOT, USER_GENERATED_CHARACTER_BOT, META_AI_VOICE, NON_CONTACT, DISCOVER_PEOPLE }

    enum ThreadType { ONE_TO_ONE, GROUP, AI_BOT, BIZ_AI_AGENT, META_AI_VOICE_THREAD, OPTIMISTIC_META_AI_THREAD }

    /** A section as the section constructor leaves it: its type in an obfuscated field, next to things that aren't. */
    static final class Section {
        final String A02 = "header";
        final Type A00;
        Section(Type type) { A00 = type; }
        @Override public String toString() { return A00.name(); }
    }

    static final class Row {
        final Object A00;
        final ThreadKey A01;
        Row(Item item, ThreadKey key) { A00 = item; A01 = key; }
    }

    /** A row as a typed search builds it: the person it found or the chat, next to the type search filed it under. */
    static final class Found {
        final User A0F;
        final ThreadSummary A07;
        final ThreadKey A06 = null;
        final Object A0A;
        Found(Item item, User user, ThreadSummary chat) { A0A = item; A0F = user; A07 = chat; }
    }

    /** Where a typed search files an entry. Messenger declares the field as an interface its enums implement. */
    interface Group { }

    enum Heading implements Group { NONCONTACTS, PAGES, AI_BOTS, META_AI_TYPEAHEAD, CONTACTS, CONTACTS_GROUPS, IG_NONCONTACT_FOLLOWINGS }

    /** A typed search's entry as Messenger builds it: one row or one heading, next to the group it sits in. */
    static final class Entry {
        final Group A00;
        final Heading A01;
        final Found A03;
        final Integer A04 = null;
        Entry(Group group, Heading heading, Found row) { A00 = group; A01 = heading; A03 = row; }
    }

    /** What the patch writes into the extension once it has proved Messenger's own check. */
    private static final String AI_USER_ROUTE = "Lcom/facebook/user/model/User;->A0A()Z";

    static final class Params {
        final int A00 = 3;
        final ThreadKey A01;
        Params(ThreadKey key) { A01 = key; }
    }

    private static ThreadKey key(ThreadType type) {
        return new ThreadKey(type, 42L);
    }

    private static final Section SUGGESTED = new Section(Type.NULL_STATE_SUGGESTIONS);
    private static final Section REELS = new Section(Type.NULL_STATE_RECENTLY_VIEWED_REELS);
    private static final Section AI = new Section(Type.NULL_STATE_AI_BOTS);
    private static final Section SEE_ALL_AI = new Section(Type.NULL_STATE_SEE_ALL_AI_BOTS);
    private static final Section CONTACTS = new Section(Type.NULL_STATE_CONTACTS);
    private static final List<Section> ALL = Arrays.asList(SUGGESTED, CONTACTS, REELS, AI, SEE_ALL_AI);

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        SearchSections.resetForTests();
    }

    private static void turnOn(String... keys) {
        android.content.SharedPreferences.Editor edit = Settings.preferences.edit();
        for (String key : keys) edit.putBoolean(key, true);
        edit.commit();
    }

    @Test public void withEverySwitchOffTheListsComeBackAsTheyWere() {
        assertSame(ALL, SearchSections.sections(ALL));
        List<Row> rows = Arrays.asList(new Row(Item.CONNECTED_AI_BOT, null), new Row(Item.CONTACT, null));
        assertSame(rows, SearchSections.items(Type.NULL_STATE_AI_BOTS, rows));
        assertFalse(SearchSections.blocksChat(new Params(key(ThreadType.AI_BOT))));
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void eachSwitchDropsOnlyItsOwnSection() {
        turnOn(SearchSections.SUGGESTED);
        assertEquals(Arrays.asList(CONTACTS, REELS, AI, SEE_ALL_AI), SearchSections.sections(ALL));
        assertTrue(Settings.lastActive(SearchSections.SUGGESTED) > 0);
        assertEquals(0, Settings.lastActive(SearchSections.REELS));

        reset();
        turnOn(SearchSections.REELS);
        assertEquals(Arrays.asList(SUGGESTED, CONTACTS, AI, SEE_ALL_AI), SearchSections.sections(ALL));
        assertTrue(Settings.lastActive(SearchSections.REELS) > 0);

        reset();
        turnOn("meta_ai");
        assertEquals("Hide Meta AI drops Meta AI's own sections", Arrays.asList(SUGGESTED, CONTACTS, REELS), SearchSections.sections(ALL));
        assertTrue(Settings.lastActive("meta_ai") > 0);

        reset();
        turnOn(SearchSections.SUGGESTED, SearchSections.REELS, "meta_ai");
        assertEquals(Collections.singletonList(CONTACTS), SearchSections.sections(ALL));
    }

    @Test public void aListWithNothingToDropIsTheSameList() {
        turnOn(SearchSections.SUGGESTED, SearchSections.REELS, "meta_ai");
        List<Section> plain = Arrays.asList(CONTACTS, CONTACTS);
        assertSame(plain, SearchSections.sections(plain));
        assertNull(SearchSections.sections(null));
        assertEquals(0, Settings.lastActive(SearchSections.SUGGESTED));
    }

    @Test public void hideMetaAiDropsItsRowsFromEverySection() {
        turnOn("meta_ai");
        Row contact = new Row(Item.CONTACT, key(ThreadType.ONE_TO_ONE));
        Row page = new Row(Item.PAGE, null);
        Row group = new Row(Item.CONTACT, key(ThreadType.GROUP));
        List<Row> rows = Arrays.asList(contact, new Row(Item.CONNECTED_AI_BOT, null), page,
            new Row(Item.USER_GENERATED_CHARACTER_BOT, null), new Row(Item.META_AI_VOICE, null),
            new Row(Item.CONTACT, key(ThreadType.AI_BOT)), new Row(Item.CONTACT, key(ThreadType.META_AI_VOICE_THREAD)), group);
        assertEquals("Typed-search people stay, a group with a bot in it too", Arrays.asList(contact, page, group),
            SearchSections.items(Type.NULL_STATE_CONTACTS, rows));
        assertEquals(Collections.emptyList(), SearchSections.items(Type.NULL_STATE_AI_BOTS, Collections.singletonList(contact)));
        assertTrue(Settings.lastActive("meta_ai") > 0);
    }

    @Test public void aBotThatSearchFiledUnderPagesGoesByMessengersOwnCheck() {
        turnOn("meta_ai");
        SearchSections.useAiUserRoute(AI_USER_ROUTE);
        Found verifiedBot = new Found(Item.PAGE, new User("Meta AI", "AiBot", false), null);
        Found cachedBot = new Found(Item.PAGE, new User("Meta AI", null, true), null);
        Found namesake = new Found(Item.CONTACT, new User("Meta AI", "User", false), null);
        Found page = new Found(Item.PAGE, new User("Meta", "Page", false), null);
        Found botChat = new Found(Item.CONTACT, null, new ThreadSummary("Meta AI", key(ThreadType.AI_BOT)));
        Found chat = new Found(Item.CONTACT, null, new ThreadSummary("Mom", key(ThreadType.ONE_TO_ONE)));
        Found groupWithBot = new Found(Item.CONTACT, null, new ThreadSummary("Trip", key(ThreadType.GROUP)));
        // A chat that sits under another holds both keys, and people's chats stay whichever of the two is the AI's.
        Found underAi = new Found(Item.CONTACT, null, new ThreadSummary("Trip plans", key(ThreadType.AI_BOT), key(ThreadType.GROUP)));
        Found aiUnderGroup = new Found(Item.CONTACT, null, new ThreadSummary("Trip", key(ThreadType.GROUP), key(ThreadType.AI_BOT)));
        Found empty = new Found(Item.CONTACT, null, new ThreadSummary("Draft", null));
        List<Found> rows = Arrays.asList(verifiedBot, namesake, cachedBot, page, botChat, chat, groupWithBot, underAi, aiUnderGroup, empty);
        assertEquals("A person or a page with the bot's name stays", Arrays.asList(namesake, page, chat, groupWithBot, underAi, aiUnderGroup, empty),
            SearchSections.items(Type.SERVER_BLENDED, rows));
        assertTrue(Settings.lastActive("meta_ai") > 0);

        reset();
        SearchSections.useAiUserRoute(AI_USER_ROUTE);
        assertSame("Off leaves every row", rows, SearchSections.items(Type.SERVER_BLENDED, rows));
        assertTrue(Settings.activeAt.isEmpty());
    }

    // #204 on a phone: typing "meta ai" still listed the bot on top. A typed search's result holds no sections, only its
    // rows and headings one by one, each in a wrapper, so the row check never saw them.
    @Test public void hideMetaAiDropsItsRowsFromATypedSearch() {
        SearchSections.useAiUserRoute(AI_USER_ROUTE);
        Entry bot = new Entry(Heading.NONCONTACTS, null, new Found(Item.PAGE, new User("Meta AI", "AiBot", false), null));
        Entry people = new Entry(Heading.NONCONTACTS, Heading.NONCONTACTS, null);
        Entry namesake = new Entry(Heading.NONCONTACTS, null, new Found(Item.CONTACT, new User("Meta AI", "User", false), null));
        Entry botChat = new Entry(Heading.NONCONTACTS, null, new Found(Item.CONTACT, null, new ThreadSummary("Meta AI", key(ThreadType.AI_BOT))));
        Entry bots = new Entry(Heading.AI_BOTS, Heading.AI_BOTS, null);
        Entry character = new Entry(Heading.AI_BOTS, null, new Found(Item.CONTACT, new User("Chef", "User", false), null));
        Entry ask = new Entry(Heading.META_AI_TYPEAHEAD, null, null);
        Entry pages = new Entry(Heading.PAGES, Heading.PAGES, null);
        Entry page = new Entry(Heading.PAGES, null, new Found(Item.PAGE, new User("Meta", "Page", false), null));
        List<Entry> typed = Arrays.asList(bot, people, namesake, botChat, bots, character, ask, pages, page);
        assertSame("Off, the list is Messenger's own", typed, SearchSections.sections(typed));
        assertTrue(Settings.activeAt.isEmpty());

        turnOn(SearchSections.SUGGESTED, SearchSections.REELS);
        assertSame("The other search switches leave a typed search alone", typed, SearchSections.sections(typed));

        turnOn("meta_ai");
        assertEquals("People and pages stay, under their headings", Arrays.asList(people, namesake, pages, page), SearchSections.sections(typed));
        assertTrue(Settings.lastActive("meta_ai") > 0);
        List<Entry> plain = Arrays.asList(people, namesake, pages, page);
        assertSame(plain, SearchSections.sections(plain));
    }

    @Test public void withoutMessengersCheckAPersonsRowGoesByItsTypesAlone() {
        turnOn("meta_ai");
        Found verifiedBot = new Found(Item.PAGE, new User("Meta AI", "AiBot", false), null);
        Found typedBot = new Found(Item.CONNECTED_AI_BOT, new User("Meta AI", "AiBot", false), null);
        List<Found> rows = Arrays.asList(verifiedBot, typedBot);
        // The extension as built names no route, so nothing of Messenger's is called until the patch writes one.
        assertEquals("", HostScreens.aiUserRoute());
        assertEquals(Collections.singletonList(verifiedBot), SearchSections.items(Type.SERVER_BLENDED, rows));
        for (String route : new String[] {null, "", "A0A", "Lcom/facebook/user/model/User;->A0D()Ljava/lang/String;",
            "Lcom/facebook/user/model/User;->A01()Z", "Lcom/facebook/user/model/User;->gone()Z",
            "Lcom/facebook/user/model/UserKey;->A0A()Z", "Lapp/hushmessenger/extension/Settings;->running()Z"}) {
            SearchSections.useAiUserRoute(route);
            assertEquals(String.valueOf(route), Collections.singletonList(verifiedBot), SearchSections.items(Type.SERVER_BLENDED, rows));
        }
    }

    // #207: a typed search listed people the reporter isn't friends with right among their friends, and they kept
    // messaging strangers by mistake.
    @Test public void hidePeopleYouDontKnowDropsTheirSections() {
        List<Section> sections = Arrays.asList(CONTACTS, new Section(Type.SERVER_MORE_PEOPLE), SUGGESTED);
        assertSame("Off, the sections are Messenger's own", sections, SearchSections.sections(sections));
        assertTrue(Settings.activeAt.isEmpty());

        turnOn(SearchSections.STRANGERS);
        assertEquals("Suggested stays, it has its own switch", Arrays.asList(CONTACTS, SUGGESTED), SearchSections.sections(sections));
        assertTrue(Settings.lastActive(SearchSections.STRANGERS) > 0);
        assertEquals(0, Settings.lastActive(SearchSections.SUGGESTED));
        List<Section> plain = Arrays.asList(CONTACTS, AI);
        assertSame(plain, SearchSections.sections(plain));
    }

    @Test public void hidePeopleYouDontKnowDropsTheirRowsFromEverySection() {
        Row friend = new Row(Item.CONTACT, key(ThreadType.ONE_TO_ONE));
        Row page = new Row(Item.PAGE, null);
        Row group = new Row(Item.CONTACT, key(ThreadType.GROUP));
        List<Row> rows = Arrays.asList(friend, new Row(Item.NON_CONTACT, null), page, new Row(Item.DISCOVER_PEOPLE, null), group);
        assertSame("Off, the rows are Messenger's own", rows, SearchSections.items(Type.SERVER_BLENDED, rows));
        assertTrue(Settings.activeAt.isEmpty());

        turnOn(SearchSections.STRANGERS);
        assertEquals("Friends, pages and groups stay", Arrays.asList(friend, page, group), SearchSections.items(Type.SERVER_BLENDED, rows));
        assertTrue(Settings.lastActive(SearchSections.STRANGERS) > 0);
        List<Row> bots = Collections.singletonList(new Row(Item.CONNECTED_AI_BOT, null));
        assertSame("Meta AI's rows aren't this switch's", bots, SearchSections.items(Type.NULL_STATE_AI_BOTS, bots));
        assertEquals(0, Settings.lastActive("meta_ai"));
    }

    @Test public void hidePeopleYouDontKnowEmptiesTheirWholeSection() {
        List<Row> rows = Collections.singletonList(new Row(Item.CONTACT, key(ThreadType.ONE_TO_ONE)));
        assertSame(rows, SearchSections.items(Type.SERVER_MORE_PEOPLE, rows));
        turnOn(SearchSections.STRANGERS);
        assertEquals(Collections.emptyList(), SearchSections.items(Type.SERVER_MORE_PEOPLE, rows));
        assertTrue(Settings.lastActive(SearchSections.STRANGERS) > 0);
    }

    @Test public void hidePeopleYouDontKnowDropsThemFromATypedSearch() {
        Entry friends = new Entry(Heading.CONTACTS, Heading.CONTACTS, null);
        Entry friend = new Entry(Heading.CONTACTS, null, new Found(Item.CONTACT, new User("Mom", "User", false), null));
        Entry strangers = new Entry(Heading.NONCONTACTS, Heading.NONCONTACTS, null);
        Entry stranger = new Entry(Heading.NONCONTACTS, null, new Found(Item.CONTACT, new User("Mo", "User", false), null));
        Entry following = new Entry(Heading.IG_NONCONTACT_FOLLOWINGS, null, new Found(Item.CONTACT, new User("Moe", "User", false), null));
        Entry filedElsewhere = new Entry(Heading.CONTACTS, null, new Found(Item.NON_CONTACT, new User("Moira", "User", false), null));
        Entry groups = new Entry(Heading.CONTACTS_GROUPS, Heading.CONTACTS_GROUPS, null);
        Entry trip = new Entry(Heading.CONTACTS_GROUPS, null, new Found(Item.CONTACT, null, new ThreadSummary("Trip", key(ThreadType.GROUP))));
        Entry pages = new Entry(Heading.PAGES, Heading.PAGES, null);
        Entry page = new Entry(Heading.PAGES, null, new Found(Item.PAGE, new User("Mochi", "Page", false), null));
        List<Entry> typed = Arrays.asList(friends, friend, strangers, stranger, following, filedElsewhere, groups, trip, pages, page);
        turnOn(SearchSections.SUGGESTED, SearchSections.REELS, "meta_ai");
        assertSame("The other search switches leave these people alone", typed, SearchSections.sections(typed));
        assertEquals(0, Settings.lastActive(SearchSections.STRANGERS));

        turnOn(SearchSections.STRANGERS);
        assertEquals("Friends, groups and pages stay, under their headings", Arrays.asList(friends, friend, groups, trip, pages, page),
            SearchSections.sections(typed));
        assertTrue(Settings.lastActive(SearchSections.STRANGERS) > 0);
        List<Entry> plain = Arrays.asList(friends, friend, groups, trip);
        assertSame(plain, SearchSections.sections(plain));
    }

    @Test public void searchSwitchesAloneLeaveTheRowsAlone() {
        turnOn(SearchSections.SUGGESTED, SearchSections.REELS);
        List<Row> rows = Collections.singletonList(new Row(Item.CONNECTED_AI_BOT, null));
        assertSame(rows, SearchSections.items(Type.NULL_STATE_CONTACTS, rows));
    }

    @Test public void blockMetaAiChatsKeepsOnlyAiChatsClosedAndSaysSo() {
        turnOn(SearchSections.AI_CHATS);
        for (ThreadType type : new ThreadType[] {ThreadType.AI_BOT, ThreadType.BIZ_AI_AGENT, ThreadType.META_AI_VOICE_THREAD, ThreadType.OPTIMISTIC_META_AI_THREAD})
            assertTrue(type.name(), SearchSections.blocksChat(new Params(key(type))));
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Meta AI chats are blocked in HushMessenger settings.", ShadowToast.getTextOfLatestToast());
        assertTrue(Settings.lastActive(SearchSections.AI_CHATS) > 0);

        Settings.activeAt.clear();
        assertFalse(SearchSections.blocksChat(new Params(key(ThreadType.ONE_TO_ONE))));
        assertFalse("A group with an AI in it still opens", SearchSections.blocksChat(new Params(key(ThreadType.GROUP))));
        assertFalse(SearchSections.blocksChat(new Params(null)));
        assertFalse(SearchSections.blocksChat(null));
        assertEquals(0, Settings.lastActive(SearchSections.AI_CHATS));
    }

    @Test public void hideMetaAiAloneStillOpensItsChats() {
        turnOn("meta_ai");
        assertFalse(SearchSections.blocksChat(new Params(key(ThreadType.AI_BOT))));
    }

    @Test public void pauseAndSafeModeOpenEveryChatAndKeepEverySection() {
        for (String state : new String[] {"paused", "safe"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(SearchSections.AI_CHATS, true).putBoolean(SearchSections.SUGGESTED, true)
                .putBoolean("meta_ai", true).putBoolean(SearchSections.STRANGERS, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            Settings.activeAt.clear();
            assertFalse(state, SearchSections.blocksChat(new Params(key(ThreadType.AI_BOT))));
            assertSame(state, ALL, SearchSections.sections(ALL));
            List<Section> morePeople = Arrays.asList(CONTACTS, new Section(Type.SERVER_MORE_PEOPLE));
            assertSame(state, morePeople, SearchSections.sections(morePeople));
            List<Row> rows = Arrays.asList(new Row(Item.CONTACT, null), new Row(Item.NON_CONTACT, null));
            assertSame(state, rows, SearchSections.items(Type.SERVER_BLENDED, rows));
            assertTrue(state, Settings.activeAt.isEmpty());
        }
    }

    @Test public void aListThatFailsComesBackUntouched() {
        turnOn(SearchSections.SUGGESTED, "meta_ai");
        List<Object> broken = new AbstractList<Object>() {
            @Override public Object get(int index) { throw new IllegalStateException("gone"); }
            @Override public int size() { return 2; }
        };
        assertSame(broken, SearchSections.sections(broken));
        assertSame(broken, SearchSections.items(Type.NULL_STATE_CONTACTS, broken));

        reset();
        turnOn(SearchSections.STRANGERS);
        assertSame(broken, SearchSections.sections(broken));
        assertSame(broken, SearchSections.items(Type.SERVER_BLENDED, broken));
    }

    @Test public void theSwitchesSitWithSearchAndMetaAiAndStartOff() {
        String[][] expected = {
            {SearchSections.SUGGESTED, "Hide Suggested in search", "inbox"},
            {SearchSections.REELS, "Hide recent reels in search", "inbox"},
            {SearchSections.STRANGERS, "Hide people you don't know in search", "inbox"},
            {SearchSections.AI_CHATS, "Block Meta AI chats", "navigation"},
        };
        for (String[] want : expected) {
            String[] spec = null;
            for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals(want[0])) spec = control;
            assertNotNull(want[0], spec);
            assertEquals(want[1], spec[1]);
            assertEquals(want[2], spec[3]);
            assertTrue(want[0], Settings.installed.contains(want[0]));
            assertFalse(want[0], Settings.preferences.getBoolean(want[0], false));
        }
    }
}
