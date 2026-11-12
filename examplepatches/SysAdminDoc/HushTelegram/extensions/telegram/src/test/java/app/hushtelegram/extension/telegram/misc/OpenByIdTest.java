/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.hushtelegram.extension.shared.L10nTablesForTests;
import app.hushtelegram.extension.shared.SettingsContextRule;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class OpenByIdTest {
    private static final String NOT_A_NUMBER = "Type the ID in numbers";
    private static final String NOT_SEEN = "This app hasn't seen that ID yet";
    private static final String TRY_AGAIN = "Couldn't open that. Try again.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final OpenById.Tables real = OpenById.tables;

    @After public void restore() { OpenById.tables = real; }

    /** Tables holding the given users and chats, which note each lookup and keep posted work until run. */
    private static final class Fake implements OpenById.Tables {
        final Set<Long> users;
        final Set<Long> chats;
        final List<String> asked = new ArrayList<>();
        final List<Runnable> posted = new ArrayList<>();
        RuntimeException readFailure;
        ReflectiveOperationException postFailure;

        Fake(Long[] users, Long[] chats) {
            this.users = new HashSet<>(Arrays.asList(users));
            this.chats = new HashSet<>(Arrays.asList(chats));
        }

        @Override public void post(int account, Runnable work) throws ReflectiveOperationException {
            if (postFailure != null) throw postFailure;
            posted.add(work);
        }

        @Override public boolean user(int account, long id) {
            asked.add("user " + account + " " + id);
            if (readFailure != null) throw readFailure;
            return users.contains(id);
        }

        @Override public boolean chat(int account, long id) {
            asked.add("chat " + account + " " + id);
            if (readFailure != null) throw readFailure;
            return chats.contains(id);
        }

        void runPosted() {
            for (Runnable work : new ArrayList<>(posted)) work.run();
            posted.clear();
        }
    }

    /** What a lookup told its caller: the link, whether it failed, and how often it was told. */
    private static final class Answer implements OpenById.Found {
        String link;
        boolean failed;
        int told;

        @Override public void found(String link, boolean failed) {
            this.link = link;
            this.failed = failed;
            told++;
        }
    }

    @Test public void aPlainNumberIsAUserOrAChat() {
        OpenById.Wanted wanted = OpenById.parse("777000");
        assertNotNull(wanted);
        assertEquals(777000L, wanted.id);
        assertFalse(wanted.chatOnly);
        // Spaces from a copied ID, a thin one included, don't count.
        assertEquals(1234567890L, OpenById.parse(" 1234 567" + (char) 0x2009 + "890 ").id);
    }

    @Test public void botStyleChatIdsLoseTheirMarks() {
        OpenById.Wanted group = OpenById.parse("-4567");
        assertEquals(4567L, group.id);
        assertTrue(group.chatOnly);
        OpenById.Wanted channel = OpenById.parse("-1001234567890");
        assertEquals(1234567890L, channel.id);
        assertTrue(channel.chatOnly);
        // A large group written with a minus alone stays the number it is.
        assertEquals(999999999999L, OpenById.parse("-999999999999").id);
    }

    @Test public void anythingElseIsNoId() {
        for (String typed : new String[]{null, "", "   ", "0", "-0", "-", "--5", "+5", "12a", "abc", "1.5",
                "12345678901234567", "-1000000000000"}) {
            assertNull(typed, OpenById.parse(typed));
            assertFalse(typed, OpenById.valid(typed));
        }
        assertTrue(OpenById.valid("42"));
    }

    @Test public void aUserComesBeforeAChatWithTheSameNumber() throws Exception {
        Fake tables = new Fake(new Long[]{42L}, new Long[]{42L, 99L});
        assertEquals("tg://openmessage?user_id=42", OpenById.link(tables, 0, OpenById.parse("42")));
        assertEquals("tg://openmessage?chat_id=99", OpenById.link(tables, 0, OpenById.parse("99")));
        assertNull(OpenById.link(tables, 0, OpenById.parse("5")));
        assertEquals(Arrays.asList("user 0 42", "user 0 99", "chat 0 99", "user 0 5", "chat 0 5"), tables.asked);
    }

    @Test public void aChatOnlyIdNeverOpensTheUserWithThatNumber() throws Exception {
        Fake tables = new Fake(new Long[]{42L}, new Long[]{});
        assertNull(OpenById.link(tables, 1, OpenById.parse("-42")));
        assertEquals(Arrays.asList("chat 1 42"), tables.asked);
        tables.chats.add(42L);
        assertEquals("tg://openmessage?chat_id=42", OpenById.link(tables, 1, OpenById.parse("-42")));
        assertEquals("tg://openmessage?chat_id=42", OpenById.link(tables, 1, OpenById.parse("-1000000000042")));
        // -100 with a short number after it is a basic group's ID, not a channel's.
        assertEquals(10042L, OpenById.parse("-10042").id);
    }

    @Test public void theLookupRunsOnTheStorageQueueAndAnswersOnTheMainThread() {
        Fake tables = new Fake(new Long[]{}, new Long[]{1234567890L});
        OpenById.tables = tables;
        Answer answer = new Answer();
        assertTrue(OpenById.find(2, "-1001234567890", answer));
        // Nothing is read until the queue runs the work.
        assertTrue(tables.asked.isEmpty());
        assertEquals(1, tables.posted.size());
        tables.runPosted();
        assertEquals(Arrays.asList("chat 2 1234567890"), tables.asked);
        ShadowLooper.idleMainLooper();
        assertEquals(1, answer.told);
        assertEquals("tg://openmessage?chat_id=1234567890", answer.link);
        assertFalse(answer.failed);
    }

    @Test public void anIdThisPhoneHasntSeenAnswersWithNoLink() {
        Fake tables = new Fake(new Long[]{}, new Long[]{});
        OpenById.tables = tables;
        Answer answer = new Answer();
        assertTrue(OpenById.find(0, "31337", answer));
        tables.runPosted();
        ShadowLooper.idleMainLooper();
        assertEquals(1, answer.told);
        assertNull(answer.link);
        assertFalse(answer.failed);
    }

    @Test public void tablesThatCantBeReadAnswerFailed() {
        Fake tables = new Fake(new Long[]{31337L}, new Long[]{});
        tables.readFailure = new IllegalStateException("renamed");
        OpenById.tables = tables;
        Answer answer = new Answer();
        assertTrue(OpenById.find(0, "31337", answer));
        tables.runPosted();
        ShadowLooper.idleMainLooper();
        assertEquals(1, answer.told);
        assertNull(answer.link);
        assertTrue(answer.failed);
    }

    @Test public void aLookupThatCantStartTellsNobody() {
        Fake tables = new Fake(new Long[]{31337L}, new Long[]{});
        OpenById.tables = tables;
        Answer answer = new Answer();
        assertFalse(OpenById.find(0, "not an id", answer));
        assertFalse(OpenById.find(-1, "31337", answer));
        assertTrue(tables.posted.isEmpty());
        tables.postFailure = new NoSuchMethodException("postRunnable");
        assertFalse(OpenById.find(0, "31337", answer));
        ShadowLooper.idleMainLooper();
        assertEquals(0, answer.told);
        assertTrue(tables.asked.isEmpty());
    }

    @Test public void theToastsFitTwoLinesInEveryLanguage() {
        for (String text : new String[]{NOT_A_NUMBER, NOT_SEEN, TRY_AGAIN}) {
            assertFitsATwoLineToast("en", text);
            for (String language : new String[]{"bg", "de", "es", "in", "pt-rbr", "tr"}) {
                String row = L10nTablesForTests.of(language).get(text);
                assertNotNull(language + ": " + text, row);
                assertFitsATwoLineToast(language, row);
            }
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }
}
