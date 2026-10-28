/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.wellbeing;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.spoof.region.RegionSpoof;

import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.BitSet;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The hours of the week the feed lock applies by itself, as the reader typed them: "Mon-Fri
 * 21:00-07:00; Sat Sun 13:00-15:00".
 *
 * <p>Each time is a wall-clock time on the phone's own clock, start included and end not, and
 * the hours are kept as one bit per minute of the week, so overlapping times merge by themselves.
 * A time that ends before it starts runs past midnight into the next day, and one that runs past
 * Sunday night carries on into Monday. The answer is worked out from the wall clock each time it
 * is asked, never from a timer that has to be right: a start the clocks skip over on the night
 * they go forward is in force from the first minute that does exist after it, a minute the clocks
 * repeat when they go back is inside the same hours both times, and a new zone or a reboot is
 * simply the clock read again. The budget counts its own time, so nothing here charges it twice.
 *
 * <p>Nothing runs while TikTok is away. On screen, one main-thread check is planned for the next
 * boundary, so a feed sitting paused when the hours begin is still covered, and it comes again
 * within {@link #LONGEST_WAIT_MS} whatever the boundary, which is how a clock or zone changed
 * under it is followed.
 */
public final class FeedSchedule {
    static final int MINUTES_PER_DAY = 24 * 60;
    static final int MINUTES_PER_WEEK = 7 * MINUTES_PER_DAY;
    /** The longest the on-screen check waits, so a changed clock or zone is caught up with. */
    static final long LONGEST_WAIT_MS = 5 * 60_000L;
    /** How long an answer is reused. The pager's touch methods ask on every touch. */
    static final long ANSWER_MS = 60_000L;

    /** One entry: optional days, then a start and an end. "Mon-Fri 21:00-07:00", "22-6". */
    private static final Pattern ENTRY = Pattern.compile(
            "^(?:(.*\\S)\\s+)?(\\d{1,2})(?::(\\d{2}))?\\s*-\\s*(\\d{1,2})(?::(\\d{2}))?$");
    private static final Pattern ENTRIES = Pattern.compile("[;\\n]+");
    private static final Pattern DAY_TOKENS = Pattern.compile("[\\s,]+");
    private static final String[] ENGLISH_DAYS = {
            "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"};

    interface WallClock {
        long now();
    }

    interface Zone {
        TimeZone get();
    }

    private static volatile WallClock clock = System::currentTimeMillis;
    private static volatile Zone zone = RegionSpoof::phoneTimeZone;

    /** The hours parsed from the text they came from, so a draw or a touch doesn't parse again. */
    private static volatile Hours parsed = new Hours("", new BitSet(), null);
    /** The last answer, good from {@code at} until {@code until}, for the text it was worked out from. */
    private static volatile Answer answer;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable CHECK = FeedSchedule::boundaryReached;

    private FeedSchedule() {
    }

    /** Parsed hours: the minutes of the week they lock, or what is wrong with the text. */
    static final class Hours {
        final String text;
        final BitSet minutes;
        @Nullable final String problem;

        Hours(String text, BitSet minutes, @Nullable String problem) {
            this.text = text;
            this.minutes = minutes;
            this.problem = problem;
        }

        boolean locksAnything() {
            return problem == null && !minutes.isEmpty();
        }
    }

    private static final class Answer {
        final String text;
        final boolean on;
        final long at;
        final long until;
        final long next;

        Answer(String text, boolean on, long at, long until, long next) {
            this.text = text;
            this.on = on;
            this.at = at;
            this.until = until;
            this.next = next;
        }
    }

    /**
     * Whether the saved hours lock the feed right now. Paused, the setting answers its unpatched
     * value, empty, so this is off then. Asked on every touch of the feed's pager, so the case
     * with no hours set is one read, and an answer is reused until the next boundary or a minute.
     */
    public static boolean coversNow() {
        String text = Settings.FEED_LOCK_HOURS.get();
        if (text == null || text.isEmpty()) return false;
        return current(text).on;
    }

    /** When the saved hours next start or stop locking, or zero when that never changes. */
    public static long nextChangeAt() {
        String text = Settings.FEED_LOCK_HOURS.get();
        if (text == null || text.isEmpty()) return 0;
        return current(text).next;
    }

    private static Answer current(String text) {
        long now = clock.now();
        Answer known = answer;
        if (known != null && known.text.equals(text) && now >= known.at && now < known.until) {
            return known;
        }
        Hours hours = hours(text);
        Answer fresh;
        if (!hours.locksAnything()) {
            fresh = new Answer(text, false, now, now + ANSWER_MS, 0);
        } else {
            TimeZone here = zone.get();
            boolean on = hours.minutes.get(minuteOfWeek(now, here));
            long next = nextChange(hours.minutes, now, here);
            long until = Math.min(now + ANSWER_MS, next > now ? next : Long.MAX_VALUE);
            fresh = new Answer(text, on, now, until, next);
        }
        answer = fresh;
        return fresh;
    }

    /** The text parsed, reusing the last parse while the text is the same. */
    static Hours hours(String text) {
        Hours known = parsed;
        if (known.text.equals(text)) return known;
        Hours fresh = parse(text);
        parsed = fresh;
        return fresh;
    }

    /** What is wrong with typed hours, or null when they can be used. Empty is fine: no hours. */
    @Nullable
    public static String problem(String text) {
        return hours(text == null ? "" : text).problem;
    }

    /**
     * Whether going from {@code from} to {@code to} unlocks any minute {@code from} locked, which
     * is a loosening the way turning the lock off is. Hours that can't be read lock nothing.
     */
    public static boolean loosens(String from, String to) {
        BitSet before = hours(from == null ? "" : from).locksAnything()
                ? (BitSet) hours(from).minutes.clone() : new BitSet();
        Hours after = hours(to == null ? "" : to);
        if (after.locksAnything()) before.andNot(after.minutes);
        return !before.isEmpty();
    }

    static Hours parse(String text) {
        BitSet minutes = new BitSet(MINUTES_PER_WEEK);
        if (text == null || text.trim().isEmpty()) return new Hours(text == null ? "" : text, minutes, null);
        for (String raw : ENTRIES.split(text)) {
            String entry = raw.trim();
            if (entry.isEmpty()) continue;
            Matcher match = ENTRY.matcher(entry);
            int start = match.matches() ? clockMinute(match.group(2), match.group(3), false) : -1;
            int end = match.matches() ? clockMinute(match.group(4), match.group(5), true) : -1;
            boolean[] days = match.matches() ? days(match.group(1)) : null;
            if (start < 0 || end < 0 || days == null) {
                return new Hours(text, new BitSet(), L10n.f(
                        "Couldn't read %1$s. Write days and hours like Mon-Fri 21:00-07:00.", entry));
            }
            // 24:00 ends the day, so 0:00-24:00 is the whole day rather than an empty span.
            if (start == end) {
                return new Hours(text, new BitSet(), L10n.f(
                        "%1$s starts and ends at the same time. Give it a different end time.", entry));
            }
            int length = end > start ? end - start : end + MINUTES_PER_DAY - start;
            for (int day = 0; day < 7; day++) {
                if (!days[day]) continue;
                int from = day * MINUTES_PER_DAY + start;
                for (int minute = 0; minute < length; minute++) {
                    minutes.set((from + minute) % MINUTES_PER_WEEK);
                }
            }
        }
        return new Hours(text, minutes, null);
    }

    /** "21", "7:30", "24:00" as a minute of the day, or -1. 24:00 only ends a time. */
    private static int clockMinute(String hourText, @Nullable String minuteText, boolean end) {
        int hour = Integer.parseInt(hourText);
        int minute = minuteText == null ? 0 : Integer.parseInt(minuteText);
        if (minute > 59) return -1;
        if (hour == 24 && minute == 0 && end) return MINUTES_PER_DAY;
        if (hour > 23) return -1;
        return hour * 60 + minute;
    }

    /**
     * The days an entry names, Monday first, or null when one can't be read. None named means
     * every day. Days are English names or the phone language's own, whole or cut short ("Mo",
     * "Tue", "Thurs"), a range ("Fri-Mon" runs over the weekend), "weekdays" or "weekends".
     */
    @Nullable
    private static boolean[] days(@Nullable String text) {
        boolean[] days = new boolean[7];
        if (text == null || text.trim().isEmpty()) {
            java.util.Arrays.fill(days, true);
            return days;
        }
        String joined = text.trim().replaceAll("\\s*-\\s*", "-");
        for (String token : DAY_TOKENS.split(joined)) {
            if (token.isEmpty()) continue;
            String word = token.toLowerCase(Locale.getDefault());
            if (word.equals("daily") || word.equals("everyday")) {
                java.util.Arrays.fill(days, true);
                continue;
            }
            if (word.equals("weekdays")) {
                for (int day = 0; day < 5; day++) days[day] = true;
                continue;
            }
            if (word.equals("weekends") || word.equals("weekend")) {
                days[5] = true;
                days[6] = true;
                continue;
            }
            int dash = word.indexOf('-');
            if (dash >= 0) {
                int first = day(word.substring(0, dash));
                int last = day(word.substring(dash + 1));
                if (first < 0 || last < 0) return null;
                for (int day = first; ; day = (day + 1) % 7) {
                    days[day] = true;
                    if (day == last) break;
                }
                continue;
            }
            int day = day(word);
            if (day < 0) return null;
            days[day] = true;
        }
        return days;
    }

    /** One day's name as Monday 0 to Sunday 6, or -1. */
    private static int day(String word) {
        String name = word.endsWith(".") ? word.substring(0, word.length() - 1) : word;
        if (name.length() >= 2) {
            for (int day = 0; day < 7; day++) {
                String english = ENGLISH_DAYS[day];
                // "th" and "tu", "sa" and "su" are told apart by their second letter.
                if (english.startsWith(name)) return day;
                if (name.equals("thurs") && day == 3) return day;
            }
        }
        DateFormatSymbols symbols = DateFormatSymbols.getInstance(Locale.getDefault());
        String[][] lists = {symbols.getWeekdays(), symbols.getShortWeekdays()};
        for (String[] list : lists) {
            for (int calendarDay = Calendar.SUNDAY; calendarDay <= Calendar.SATURDAY; calendarDay++) {
                String local = list[calendarDay];
                if (local == null || local.isEmpty()) continue;
                String plain = local.toLowerCase(Locale.getDefault());
                if (plain.endsWith(".")) plain = plain.substring(0, plain.length() - 1);
                if (plain.equals(name)) return mondayFirst(calendarDay);
            }
        }
        return -1;
    }

    private static int mondayFirst(int calendarDay) {
        return (calendarDay + 5) % 7;
    }

    /** The minute of the week on the wall clock at {@code at}, Monday 0:00 being 0. */
    static int minuteOfWeek(long at, TimeZone here) {
        Calendar calendar = Calendar.getInstance(here, Locale.ROOT);
        calendar.setTimeInMillis(at);
        return mondayFirst(calendar.get(Calendar.DAY_OF_WEEK)) * MINUTES_PER_DAY
                + calendar.get(Calendar.HOUR_OF_DAY) * 60 + calendar.get(Calendar.MINUTE);
    }

    /**
     * The first moment after {@code now} the hours start or stop locking, or zero when they never
     * change (every minute or none). Worked out on the wall clock, then moved by the change of
     * offset when the clocks change on the way: back, the wall clock reaches it that much later;
     * forward, it is reached that much sooner, or, when the clocks skip over it, at the first
     * moment after the skip.
     */
    static long nextChange(BitSet minutes, long now, TimeZone here) {
        int week = minuteOfWeek(now, here);
        boolean on = minutes.get(week);
        int found = on ? minutes.nextClearBit(week + 1) : minutes.nextSetBit(week + 1);
        if (found < 0 || found >= MINUTES_PER_WEEK) {
            int wrapped = on ? minutes.nextClearBit(0) : minutes.nextSetBit(0);
            if (wrapped < 0 || wrapped >= week) return 0;
            found = wrapped + MINUTES_PER_WEEK;
        }
        long minuteStart = now - Math.floorMod(now + here.getOffset(now), 60_000L);
        long wall = minuteStart + (found - week) * 60_000L;
        int before = here.getOffset(now);
        int shift = here.getOffset(wall) - before;
        if (shift == 0) return wall;
        long moved = wall - shift;
        if (shift < 0 || here.getOffset(moved) != before) return moved;
        // The clocks go forward between the two and skip over the boundary itself: it takes
        // effect at the jump, the first minute that exists past it.
        long low = moved;
        long high = wall;
        while (high - low > 1) {
            long middle = low + (high - low) / 2;
            if (here.getOffset(middle) == before) low = middle;
            else high = middle;
        }
        return high;
    }

    /**
     * What the hours mean as a row line: locked now until when, or when they next lock. Null when
     * there are none, or they can't be read, which the row's check says.
     */
    @Nullable
    public static String statusLine(String text) {
        Hours hours = hours(text == null ? "" : text);
        if (!hours.locksAnything()) return null;
        if (hours.minutes.cardinality() == MINUTES_PER_WEEK) return L10n.t("Locked all week");
        long now = clock.now();
        TimeZone here = zone.get();
        long next = nextChange(hours.minutes, now, here);
        return hours.minutes.get(minuteOfWeek(now, here))
                ? L10n.f("Locked now, until %1$s", dayTimeLabel(next))
                : L10n.f("Next lock starts %1$s", dayTimeLabel(next));
    }

    /**
     * A moment of the coming week on the phone's clock: "Mon 7:00 AM", or "Mon 07:00". Six days
     * or more away it names the date too, since today's weekday alone reads as a time already gone.
     */
    public static String dayTimeLabel(long at) {
        TimeZone here = zone.get();
        Locale locale = Locale.getDefault();
        boolean farOff = at - clock.now() >= 6L * MINUTES_PER_DAY * 60_000L;
        SimpleDateFormat weekday = new SimpleDateFormat(farOff
                ? android.text.format.DateFormat.getBestDateTimePattern(locale, "EEEMMMd") : "EEE", locale);
        weekday.setTimeZone(here);
        Context context = Utils.getContext();
        // 4:00 AM or 04:00 as the phone is set, like the budget's times.
        java.text.DateFormat time = context == null
                ? java.text.DateFormat.getTimeInstance(java.text.DateFormat.SHORT)
                : android.text.format.DateFormat.getTimeFormat(context);
        time.setTimeZone(here);
        Date date = new Date(at);
        return weekday.format(date) + " " + time.format(date);
    }

    /** TikTok came to the front: read the clock afresh and plan the check for the next boundary. */
    static void onForeground() {
        answer = null;
        planNextCheck();
    }

    /** TikTok left the screen: nothing is checked until it comes back. */
    static void onBackground() {
        MAIN.removeCallbacks(CHECK);
    }

    /** The hours were changed: the lock follows them now rather than at the next boundary. */
    public static void changed() {
        answer = null;
        MAIN.removeCallbacks(CHECK);
        MAIN.post(CHECK);
    }

    private static void planNextCheck() {
        MAIN.removeCallbacks(CHECK);
        if (!SettingsStatus.blockAuthorEnabled || !hours(Settings.FEED_LOCK_HOURS.get()).locksAnything()) {
            return;
        }
        long now = clock.now();
        long next = nextChangeAt();
        long wait = next <= now ? LONGEST_WAIT_MS : Math.min(LONGEST_WAIT_MS, next - now);
        MAIN.postDelayed(CHECK, Math.max(1_000L, wait));
    }

    private static void boundaryReached() {
        try {
            answer = null;
            // The panel goes up over a feed sitting paused, which sends no progress to ask, and
            // comes down by the panel's own tick once the hours are over.
            SessionLockOverlay.ensureRunning();
            SessionLockOverlay.sync();
        } catch (Throwable failure) {
            Logger.printException(() -> "The feed lock hours could not be checked", failure);
        }
        planNextCheck();
    }

    static void resetForTests() {
        MAIN.removeCallbacks(CHECK);
        answer = null;
        parsed = new Hours("", new BitSet(), null);
        clock = System::currentTimeMillis;
        zone = RegionSpoof::phoneTimeZone;
    }

    static void setClockForTests(WallClock wallClock, TimeZone fixed) {
        clock = wallClock == null ? System::currentTimeMillis : wallClock;
        zone = fixed == null ? RegionSpoof::phoneTimeZone : () -> fixed;
        answer = null;
    }
}
