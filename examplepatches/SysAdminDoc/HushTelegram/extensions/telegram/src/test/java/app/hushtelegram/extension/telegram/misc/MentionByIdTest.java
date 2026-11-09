/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MentionByIdTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** An entity as the test sees it: where it starts, how long it is, and who it names. */
    private static final class Fake {
        final int offset;
        final int length;
        final Object user;

        Fake(int offset, int length, Object user) {
            this.offset = offset;
            this.length = length;
            this.user = user;
        }
    }

    private final Set<Long> known = new HashSet<>(Arrays.asList(123456789L, 555000111L));
    private final MentionById.Entities fakeEntities = new MentionById.Entities() {
        @Override public Object mention(Object inputUser, int offset, int length) {
            return new Fake(offset, length, inputUser);
        }

        @Override public int offset(Object entity) {
            return ((Fake) entity).offset;
        }

        @Override public int length(Object entity) {
            return ((Fake) entity).length;
        }
    };

    @Before public void setUp() {
        Settings.MENTION_BY_ID.resetToDefault();
        HookStatus.clear();
        MentionById.users = (account, id) -> known.contains(id) ? "user" + id : null;
        MentionById.entities = fakeEntities;
    }

    @After public void tearDown() {
        Settings.MENTION_BY_ID.resetToDefault();
        HookStatus.clear();
    }

    private static CharSequence[] box(String text) {
        return new CharSequence[] {text};
    }

    /** The controller is any object: Accounts reads its account, which is -1 here, so a test sets the lookup. */
    private ArrayList<Object> run(String text, ArrayList<Object> list) {
        return MentionById.add(new TestController(), box(text), list);
    }

    private static final class TestController {
        int currentAccount = 0;
    }

    @Test public void nothingChangesWithTheSwitchOff() {
        ArrayList<Object> list = new ArrayList<>();
        assertSame(list, run("hi @123456789", list));
        assertEquals(0, list.size());
        assertNull(run("hi @123456789", null));
    }

    @Test public void anAtSignAndIdBecomesAMentionOverTheTypedText() {
        Settings.MENTION_BY_ID.save(true);
        ArrayList<Object> result = run("hi @123456789 there", null);
        assertEquals(1, result.size());
        Fake mention = (Fake) result.get(0);
        assertEquals(3, mention.offset);
        assertEquals(10, mention.length);
        assertEquals("user123456789", mention.user);
    }

    @Test public void theLinkFormWorksToo() {
        Settings.MENTION_BY_ID.save(true);
        ArrayList<Object> result = run("tg://user?id=555000111", null);
        assertEquals(1, result.size());
        assertEquals(22, ((Fake) result.get(0)).length);
    }

    @Test public void anUnknownPersonLeavesTheTextAndTheListAlone() {
        Settings.MENTION_BY_ID.save(true);
        assertNull(run("hi @999999999", null));
        ArrayList<Object> list = new ArrayList<>();
        assertEquals(0, run("hi @999999999", list).size());
    }

    @Test public void mentionsSortIntoTheEntitiesThatWereThere() {
        Settings.MENTION_BY_ID.save(true);
        ArrayList<Object> list = new ArrayList<>();
        list.add(new Fake(0, 2, "bold"));
        list.add(new Fake(30, 4, "styled"));
        ArrayList<Object> result = run("hi @123456789 @555000111", list);
        assertEquals(4, result.size());
        assertEquals("bold", ((Fake) result.get(0)).user);
        assertEquals(3, ((Fake) result.get(1)).offset);
        assertEquals(14, ((Fake) result.get(2)).offset);
        assertEquals("styled", ((Fake) result.get(3)).user);
    }

    @Test public void textAlreadyCoveredByAnEntityIsNotMentioned() {
        Settings.MENTION_BY_ID.save(true);
        ArrayList<Object> list = new ArrayList<>();
        list.add(new Fake(5, 4, "link"));
        assertEquals(1, run("hi @123456789", list).size());
    }

    @Test public void handlesAndShortNumbersAreNotIds() {
        Settings.MENTION_BY_ID.save(true);
        assertNull(run("@name1234567 @1234 mail@123456789 a@b", null));
    }

    @Test public void aBrokenLookupLeavesTheListAsItCameIn() {
        Settings.MENTION_BY_ID.save(true);
        MentionById.users = (account, id) -> {
            throw new ClassNotFoundException("no controller");
        };
        ArrayList<Object> list = new ArrayList<>();
        assertSame(list, run("hi @123456789", list));
        assertEquals(0, list.size());
    }

    @Test public void notATextArrayIsLeftAlone() {
        Settings.MENTION_BY_ID.save(true);
        assertNull(MentionById.add(new TestController(), "text", null));
        assertNull(MentionById.add(new TestController(), new CharSequence[] {null}, null));
    }
}
