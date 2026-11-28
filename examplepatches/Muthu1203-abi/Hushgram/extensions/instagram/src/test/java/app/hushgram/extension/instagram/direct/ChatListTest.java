/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushgram.extension.shared.SettingsContextRule;

/** The text the locked and hidden chats are kept in, each chat with its account, and the lists from before accounts were. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 37)
public class ChatListTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private static final String ME = "1234";
    private static final String OTHER = "5678";
    private static final String ALICE = "340282366841710300949128111";
    private static final String BOB = "340282366841710300949128222";
    /** A group both accounts are in: the same thread id on each. */
    private static final String GROUP = "340282366841710300949128333";

    @Test
    public void eachChatKeepsItsAccountThreadAndName() {
        List<ChatList.Row> rows = ChatList.parse(ChatList.HEADER + "\n" + ME + "\t" + ALICE + "\tAlice\n\n"
                + OTHER + "\t" + GROUP + "\tFriends\n" + ME + "\t\tNo id\n" + ME + "\n" + ME + "\t" + ALICE + "\tTwice");

        assertEquals("a line with no id is skipped, and a chat is kept once per account", 2, rows.size());
        assertEquals(ME, rows.get(0).account);
        assertEquals(ALICE, rows.get(0).id);
        assertEquals("Alice", rows.get(0).name);
        assertEquals(Collections.singletonList("Alice"), names(ChatList.shown(rows, ME)));
        assertEquals(Collections.singletonList("Friends"), names(ChatList.shown(rows, OTHER)));
        assertTrue("nothing is shown for an account that isn't known", ChatList.shown(rows, null).isEmpty());
        assertEquals("written back the same", rows.size(), ChatList.parse(ChatList.format(rows)).size());
        assertEquals("", ChatList.format(new ArrayList<>()));
        assertTrue(ChatList.parse(null).isEmpty());
        assertTrue(ChatList.parse("").isEmpty());
    }

    @Test
    public void aGroupBothAccountsAreInIsKeptForEachApart() {
        List<ChatList.Row> rows = ChatList.added(new ArrayList<>(), ME, GROUP, "Friends");

        assertTrue(ChatList.protects(rows, ME, GROUP));
        assertFalse("locked on one account, it stays open on the other", ChatList.protects(rows, OTHER, GROUP));
        assertTrue("with no account known, any account's chat counts", ChatList.protects(rows, null, GROUP));
        assertTrue(ChatList.shown(rows, OTHER).isEmpty());

        rows = ChatList.added(rows, OTHER, GROUP, "Our group");
        rows = ChatList.removed(rows, ME, GROUP);
        assertFalse(ChatList.protects(rows, ME, GROUP));
        assertTrue("taken off one account's list, it stays on the other's", ChatList.protects(rows, OTHER, GROUP));
        assertEquals(Collections.singletonList("Our group"), names(ChatList.shown(rows, OTHER)));
        assertEquals(Collections.emptySet(), ChatList.ids(rows, ME));
        assertEquals(Collections.singleton(GROUP), ChatList.ids(rows, null));
    }

    @Test
    public void anOldListKeepsEveryChatForEveryAccountAndNeverShowsItsNames() {
        List<ChatList.Row> rows = ChatList.parse(ALICE + "\tAlice\n\n" + BOB + "\n\tNobody");

        assertEquals(2, rows.size());
        for (ChatList.Row row : rows) {
            assertTrue(row.old());
            assertEquals("an old name is never kept", "", row.name);
        }
        for (String account : Arrays.asList(ME, OTHER, null)) {
            assertTrue(String.valueOf(account), ChatList.protects(rows, account, ALICE));
            assertTrue(String.valueOf(account), ChatList.protects(rows, account, BOB));
        }
        assertEquals(Arrays.asList(ChatList.placeholder(ALICE), ChatList.placeholder(BOB)), names(ChatList.shown(rows, ME)));
        assertEquals(names(ChatList.shown(rows, ME)), names(ChatList.shown(rows, OTHER)));
        assertFalse("the old names aren't in what's written either", ChatList.format(rows).contains("Alice"));
        // An old line's name stays hidden even if one turns up in a newer list.
        assertEquals("", ChatList.parse(ChatList.HEADER + "\n\t" + ALICE + "\tAlice").get(0).name);
    }

    @Test
    public void anOldChatIsLetGoOneAccountAtATime() {
        List<ChatList.Row> rows = ChatList.parse(ALICE + "\tAlice");

        rows = ChatList.removed(rows, ME, ALICE);

        assertFalse(ChatList.protects(rows, ME, ALICE));
        assertTrue("the other account still has it", ChatList.protects(rows, OTHER, ALICE));
        assertTrue(ChatList.protects(rows, null, ALICE));
        List<ChatList.Row> again = ChatList.parse(ChatList.format(rows));
        assertEquals("letting it go is written down", Collections.singleton(ME), again.get(0).released);
        assertFalse(ChatList.protects(again, ME, ALICE));
        assertTrue(ChatList.protects(again, OTHER, ALICE));
        assertSame("letting it go twice changes nothing", again, ChatList.removed(again, ME, ALICE));

        again = ChatList.removed(again, OTHER, ALICE);
        assertFalse(ChatList.protects(again, OTHER, ALICE));
        assertTrue("an account no one has seen yet still has it", ChatList.protects(again, "9999", ALICE));
    }

    @Test
    public void anOldChatGoesToAnAccountOnlyWhenThatAccountOpensIt() {
        List<ChatList.Row> rows = ChatList.parse(ALICE + "\tAlice\n" + BOB + "\tBob");

        List<ChatList.Row> other = ChatList.added(rows, ME, "777", "Someone new");
        assertEquals("a new chat on one account hands the old ones to nobody", 3, other.size());
        assertTrue(other.get(0).old());
        assertTrue(other.get(1).old());

        List<ChatList.Row> named = ChatList.named(rows, ME, ALICE, "Alice Smith");
        assertEquals(3, named.size());
        assertEquals(Arrays.asList("Alice Smith", ChatList.placeholder(BOB)), names(ChatList.shown(named, ME)));
        assertEquals("the other account still sees no name", Arrays.asList(ChatList.placeholder(ALICE), ChatList.placeholder(BOB)),
                names(ChatList.shown(named, OTHER)));
        assertTrue(ChatList.protects(named, OTHER, ALICE));

        List<ChatList.Row> released = ChatList.removed(ChatList.parse(ALICE), ME, ALICE);
        assertSame("an account that let it go isn't given it back by opening it", released,
                ChatList.named(released, ME, ALICE, "Alice Smith"));
    }

    @Test
    public void namingChangesOnlyWhatItShould() {
        List<ChatList.Row> rows = ChatList.added(new ArrayList<>(), ME, ALICE, "Alice");

        assertSame("a chat that isn't on the list", rows, ChatList.named(rows, ME, BOB, "Bob"));
        assertSame("another account's chat", rows, ChatList.named(rows, OTHER, ALICE, "Alice"));
        assertSame("the same name", rows, ChatList.named(rows, ME, ALICE, " Alice "));
        assertSame("no name", rows, ChatList.named(rows, ME, ALICE, " "));
        assertSame("the placeholder", rows, ChatList.named(rows, ME, ALICE, ChatList.placeholder(ALICE)));
        assertEquals("Alice Smith", ChatList.named(rows, ME, ALICE, "Alice\tSmith").get(0).name);
        assertEquals("a placeholder is never kept as the name", "", ChatList.added(rows, ME, ALICE, ChatList.placeholder(ALICE)).get(0).name);
    }

    @Test
    public void aNameThatOnlyStandsInIsNeverKept() {
        for (String standIn : Arrays.asList("", " ", "...", "…", "-", " • ", "?", ChatList.placeholder(ALICE))) {
            assertTrue("'" + standIn + "'", ChatList.standsIn(ALICE, ChatList.clean(standIn)));
            List<ChatList.Row> rows = ChatList.added(new ArrayList<>(), ME, ALICE, standIn);
            assertEquals("'" + standIn + "' is no name", "", rows.get(0).name);
            assertEquals(Collections.singletonList(ChatList.placeholder(ALICE)), names(ChatList.shown(rows, ME)));
            assertSame("'" + standIn + "' doesn't rename a chat", rows, ChatList.named(rows, ME, ALICE, standIn));
            List<ChatList.Row> read = ChatList.parse(ChatList.HEADER + "\n" + ME + "\t" + ALICE + "\t" + standIn);
            assertEquals("'" + standIn + "' kept before is read as no name", "", read.get(0).name);
        }
        for (String name : Arrays.asList("Al", "7", "🔥🔥", "Chat 9999", "A.")) {
            assertFalse(name, ChatList.standsIn(ALICE, name));
            assertEquals(name, ChatList.added(new ArrayList<>(), ME, ALICE, name).get(0).name);
        }
    }

    @Test
    public void aRealNameTakesTheStandInsPlace() {
        List<ChatList.Row> rows = ChatList.parse(ChatList.HEADER + "\n" + ME + "\t" + ALICE + "\t...\n" + OTHER + "\t" + ALICE + "\tAl");

        rows = ChatList.named(rows, ME, ALICE, "Alice Smith");

        assertEquals(Collections.singletonList("Alice Smith"), names(ChatList.shown(rows, ME)));
        assertEquals("the other account's name stays", Collections.singletonList("Al"), names(ChatList.shown(rows, OTHER)));
        assertEquals(Collections.singletonList("Alice Smith"), names(ChatList.shown(ChatList.parse(ChatList.format(rows)), ME)));
    }

    private static List<String> names(List<ChatLocks.Chat> chats) {
        List<String> names = new ArrayList<>();
        for (ChatLocks.Chat chat : chats) names.add(chat.name);
        return names;
    }
}
