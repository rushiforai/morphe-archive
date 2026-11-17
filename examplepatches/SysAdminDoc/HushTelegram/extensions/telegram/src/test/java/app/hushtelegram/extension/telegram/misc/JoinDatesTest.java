/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.Context;
import android.widget.TextView;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.Locale;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {JoinDatesTest.Members.class}, instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class JoinDatesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /**
     * Stands in for Telegram's members: an Integer is a member who joined then, a {@link Member} a
     * channel member whose date can be written over, a {@link Wrapped} the group member wrapping one.
     * The fixture test checks the real reads.
     */
    @Implements(value = JoinDates.class, isInAndroidSdk = false)
    public static class Members {
        @Implementation protected static int participantDate(Object participant) {
            if (participant instanceof Integer) return (Integer) participant;
            if (participant instanceof Member) return ((Member) participant).date;
            if (participant instanceof Wrapped) return participantDate(((Wrapped) participant).inner);
            return 0;
        }

        @Implementation protected static Object channelMember(Object participant) {
            return participant instanceof Wrapped ? ((Wrapped) participant).inner : null;
        }
    }

    static final class Member {
        int date;
        Member(int date) { this.date = date; }
    }

    static final class Wrapped {
        final Member inner;
        Wrapped(Member inner) { this.inner = inner; }
    }

    /** 12 March 2024, 14:05 UTC. */
    private static final int JOINED = 1_710_252_300;
    private static final String SEEN = "last seen recently";

    private Locale locale;

    @Before public void reset() {
        locale = Locale.getDefault();
        Locale.setDefault(Locale.US);
        restore();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.MEMBER_JOIN_DATES);
        Settings.MEMBER_JOIN_DATES.resetToDefault();
        JoinDates.clearForTests();
        HookStatus.clear();
        if (locale != null) Locale.setDefault(locale);
    }

    @Test public void offByDefaultTheLastSeenLineIsTelegramsOwn() {
        assertFalse(Settings.MEMBER_JOIN_DATES.get());
        TextView row = new TextView(context());
        assertEquals(SEEN, line(JOINED, row, SEEN));
    }

    @Test public void onTheRowsMemberDateGoesAfterLastSeen() {
        Settings.MEMBER_JOIN_DATES.save(true);
        TextView row = new TextView(context());
        String shown = line(JOINED, row, SEEN);
        assertEquals(SEEN + " · joined " + JoinDates.when(context(), JOINED), shown);
        assertTrue(shown, shown.contains("2024"));
        // The same row writing "online" gets it too, and a second row keeps its own member's date.
        assertEquals("online · joined " + JoinDates.when(context(), JOINED), write(row, "online"));
        TextView other = new TextView(context());
        assertEquals(SEEN + " · joined " + JoinDates.when(context(), JOINED + 86_400), line(JOINED + 86_400, other, SEEN));
        assertEquals(SEEN + " · joined " + JoinDates.when(context(), JOINED), write(row, SEEN));
    }

    @Test public void aMemberWithoutADateOrARowBoundAgainAddsNothing() {
        Settings.MEMBER_JOIN_DATES.save(true);
        TextView row = new TextView(context());
        assertEquals(SEEN, line(0, row, SEEN));
        assertEquals("not a member", SEEN, line("a user from search", row, SEEN));
        line(JOINED, row, SEEN);
        // The list reuses the row for someone Telegram sent no date for.
        assertEquals(SEEN, line(null, row, SEEN));
        // A row never bound by a member list, and a row that isn't a view, keep their text.
        assertEquals(SEEN, write(new TextView(context()), SEEN));
        JoinDates.member(JOINED);
        JoinDates.cell("not a view");
        JoinDates.updating("not a view");
        assertEquals(SEEN, JoinDates.status(SEEN));
        assertNull(JoinDates.status(null));
        line(JOINED, row, SEEN);
        assertEquals("", write(row, ""));
    }

    @Test public void aMemberFromTheSavedListShowsItsOwnDateNotTheSaveTime() {
        // Telegram reads the list back with the switch still off: each member, then the save time written over its date.
        int savedAt = JOINED + 200 * 86_400;
        Member member = new Member(JOINED);
        Member owner = new Member(0);
        for (Member read : new Member[] {member, owner}) {
            JoinDates.stored(read);
            read.date = savedAt;
        }
        Settings.MEMBER_JOIN_DATES.save(true);
        TextView row = new TextView(context());
        String own = SEEN + " · joined " + JoinDates.when(context(), JOINED);
        assertEquals(own, line(member, row, SEEN));
        // The profile's list binds the group member wrapping it, whose own date Telegram copied after the write.
        assertEquals(own, line(new Wrapped(member), row, SEEN));
        // The owner came with no date: nothing, rather than the save time as "joined".
        assertEquals(SEEN, line(owner, row, SEEN));
        assertEquals(SEEN, line(new Wrapped(owner), row, SEEN));
        // A member from Telegram's servers was never saved and keeps its own date.
        Member fresh = new Member(JOINED + 86_400);
        assertEquals(SEEN + " · joined " + JoinDates.when(context(), JOINED + 86_400), line(new Wrapped(fresh), row, SEEN));
        JoinDates.stored(null);
        assertTrue(HookStatus.missing(FamilyNames.SHOW_LOCAL_IDS).isEmpty());
    }

    @Test public void pauseAnEarlyStartOrAnUnreadableSwitchKeepsTelegramsLine() {
        Settings.MEMBER_JOIN_DATES.save(true);
        TextView row = new TextView(context());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertEquals(reason.name(), SEEN, line(JOINED, row, SEEN));
            PauseForTests.resume();
        }
        line(JOINED, row, SEEN);
        SettingsContextRule.withoutContext(() -> assertEquals(SEEN, write(row, SEEN)));
        SettingReadsForTests.breakReads(Settings.MEMBER_JOIN_DATES);
        assertEquals(SEEN, write(row, SEEN));
        assertFalse(HookStatus.missing(FamilyNames.SHOW_LOCAL_IDS).isEmpty());
    }

    /** A list binds [member] to [row], then the row writes [text] as its last seen line. */
    private static String line(Object member, TextView row, String text) {
        JoinDates.member(member);
        JoinDates.cell(row);
        return write(row, text);
    }

    private static String write(TextView row, String text) {
        JoinDates.updating(row);
        return JoinDates.status(text);
    }

    private static Context context() { return RuntimeEnvironment.getApplication(); }
}
