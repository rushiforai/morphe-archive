/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReactionAlertsTest {
    private static final ReactionAlerts.Sources REAL_SOURCES = ReactionAlerts.sources;
    private static final ReactionAlerts.Updates REAL_UPDATES = ReactionAlerts.updates;
    private static final long SELF = 99;
    private static final long FRIEND = 5;
    private static final long GROUP = -1000000000042L;
    private static final int NOW = 1_790_000_000;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Account account;

    @Before public void reset() {
        restore();
        account = new Account();
        ReactionAlerts.sources = controller -> account;
        // The test's "update" is the list of reactions itself.
        ReactionAlerts.updates = update -> cast(update);
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.REACTION_ALERTS);
        Settings.REACTION_ALERTS.resetToDefault();
        ReactionAlerts.sources = REAL_SOURCES;
        ReactionAlerts.updates = REAL_UPDATES;
        ReactionAlerts.forget();
        HookStatus.clear();
    }

    @SuppressWarnings("unchecked")
    private static List<ReactionAlerts.Reaction> cast(Object update) {
        return (List<ReactionAlerts.Reaction>) update;
    }

    private static ReactionAlerts.Reaction reaction(long dialog, int id, long from, String emoji, int date) {
        return new ReactionAlerts.Reaction(dialog, id, 0, from, emoji, date, true, false);
    }

    @Test public void onByDefaultASomeoneElsesNewReactionToYourMessageShowsOnce() {
        assertTrue(Settings.REACTION_ALERTS.get());
        account.rows.put(FRIEND + ":7", new ReactionAlerts.Stored("lunch at noon?", true));
        List<ReactionAlerts.Reaction> update = Collections.singletonList(reaction(FRIEND, 7, FRIEND, "thumbs", NOW - 5));
        ReactionAlerts.changed(update, null);
        ReactionAlerts.changed(update, null);
        assertEquals(Collections.singletonList(FRIEND + ":7:lunch at noon?"), account.shown);
    }

    @Test public void offOrPausedNothingIsRead() {
        Settings.REACTION_ALERTS.save(false);
        ReactionAlerts.updates = update -> { throw new AssertionError("read with the switch off"); };
        ReactionAlerts.changed(new Object(), null);
        Settings.REACTION_ALERTS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ReactionAlerts.on());
            ReactionAlerts.changed(new Object(), null);
            PauseForTests.resume();
        }
        SettingReadsForTests.breakReads(Settings.REACTION_ALERTS);
        assertFalse(ReactionAlerts.on());
        assertTrue(account.shown.isEmpty());
    }

    @Test public void onlyTheNewestUnreadEmojiReactionFromSomeoneElseCounts() {
        List<ReactionAlerts.Reaction> skipped = Arrays.asList(
                new ReactionAlerts.Reaction(FRIEND, 7, 0, FRIEND, "heart", NOW, false, false),
                new ReactionAlerts.Reaction(FRIEND, 7, 0, FRIEND, "heart", NOW, true, true),
                reaction(FRIEND, 7, SELF, "heart", NOW),
                reaction(FRIEND, 7, 0, "heart", NOW),
                reaction(FRIEND, 7, FRIEND, null, NOW),
                reaction(FRIEND, 7, FRIEND, "", NOW),
                reaction(FRIEND, 0, FRIEND, "heart", NOW),
                reaction(0, 7, FRIEND, "heart", NOW),
                reaction(FRIEND, 7, FRIEND, "heart", NOW - ReactionAlerts.RECENT - 1),
                reaction(FRIEND, 7, FRIEND, "heart", NOW + ReactionAlerts.AHEAD + 1));
        assertNull(ReactionAlerts.pick(skipped, SELF, NOW));
        ReactionAlerts.Reaction older = reaction(GROUP, 9, FRIEND, "fire", NOW - ReactionAlerts.RECENT);
        ReactionAlerts.Reaction newer = reaction(GROUP, 9, 6, "laugh", NOW - 1);
        List<ReactionAlerts.Reaction> mixed = new ArrayList<>(skipped);
        mixed.add(older);
        mixed.add(newer);
        assertSame(newer, ReactionAlerts.pick(mixed, SELF, NOW));
        assertSame(older, ReactionAlerts.pick(Collections.singletonList(older), SELF, NOW));
    }

    @Test public void aReactionToSomeoneElsesMessageStaysQuietAndAnUnstoredOneShowsWithoutText() {
        account.rows.put(GROUP + ":9", new ReactionAlerts.Stored("their message", false));
        ReactionAlerts.changed(Collections.singletonList(reaction(GROUP, 9, FRIEND, "heart", NOW)), null);
        assertTrue(account.shown.isEmpty());
        ReactionAlerts.changed(Collections.singletonList(reaction(GROUP, 10, FRIEND, "heart", NOW)), null);
        assertEquals(Collections.singletonList(GROUP + ":10:null"), account.shown);
    }

    @Test public void aDifferentReactionOrAnotherAccountShowsAgain() {
        ReactionAlerts.changed(Collections.singletonList(reaction(FRIEND, 7, FRIEND, "heart", NOW)), null);
        ReactionAlerts.changed(Collections.singletonList(reaction(FRIEND, 7, FRIEND, "thumbs", NOW + 1)), null);
        account.self = SELF + 1;
        ReactionAlerts.changed(Collections.singletonList(reaction(FRIEND, 7, FRIEND, "thumbs", NOW + 1)), null);
        assertEquals(3, account.shown.size());
    }

    @Test public void remembersOnlyTheNewestReactions() {
        for (int i = 1; i <= ReactionAlerts.REMEMBERED + 1; i++) {
            assertTrue(ReactionAlerts.first(SELF, reaction(FRIEND, i, FRIEND, "heart", NOW)));
        }
        assertTrue("the oldest was forgotten", ReactionAlerts.first(SELF, reaction(FRIEND, 1, FRIEND, "heart", NOW)));
        assertFalse(ReactionAlerts.first(SELF, reaction(FRIEND, ReactionAlerts.REMEMBERED + 1, FRIEND, "heart", NOW)));
    }

    @Test public void aFailingTelegramNeverThrowsIntoTheUpdateLoop() {
        account.failStored = true;
        ReactionAlerts.changed(Collections.singletonList(reaction(FRIEND, 7, FRIEND, "heart", NOW)), null);
        assertTrue(account.shown.isEmpty());
        ReactionAlerts.sources = controller -> { throw new IllegalStateException("no account"); };
        ReactionAlerts.changed(Collections.singletonList(reaction(FRIEND, 8, FRIEND, "heart", NOW)), null);
        ReactionAlerts.updates = update -> { throw new IllegalStateException("moved field"); };
        ReactionAlerts.changed(new Object(), null);
    }

    @Test public void aQuotedMessageIsOneShortLine() {
        assertEquals("", ReactionAlertsBridge.quote(null));
        assertEquals("two lines", ReactionAlertsBridge.quote(" two\nlines "));
        StringBuilder longer = new StringBuilder();
        for (int i = 0; i < ReactionAlertsBridge.QUOTED + 20; i++) longer.append('a');
        String quoted = ReactionAlertsBridge.quote(longer.toString());
        assertEquals(ReactionAlertsBridge.QUOTED + 1, quoted.length());
        assertEquals((char) 0x2026, quoted.charAt(quoted.length() - 1));
        // An emoji cut in half would show as a broken character.
        String emoji = longer.substring(0, ReactionAlertsBridge.QUOTED - 1) + new String(Character.toChars(0x1F602)) + "tail";
        String cut = ReactionAlertsBridge.quote(emoji);
        assertFalse(Character.isHighSurrogate(cut.charAt(cut.length() - 2)));
    }

    /** One account: the stored messages it has, and what it showed, as chat:id:text. Runs queue work at once. */
    private static final class Account implements ReactionAlerts.Source {
        final Map<String, ReactionAlerts.Stored> rows = new HashMap<>();
        final List<String> shown = new ArrayList<>();
        long self = SELF;
        boolean failStored;

        @Override public long self() { return self; }
        @Override public int now() { return NOW; }
        @Override public void post(Runnable work) { work.run(); }

        @Override public ReactionAlerts.Stored stored(long dialog, int id) {
            if (failStored) throw new IllegalStateException("database closed");
            return rows.get(dialog + ":" + id);
        }

        @Override public void show(ReactionAlerts.Reaction reaction, String text) {
            shown.add(reaction.dialog + ":" + reaction.id + ":" + text);
        }
    }
}
