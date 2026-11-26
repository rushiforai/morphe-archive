/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.StringSetting;

/**
 * Hide pins you've already seen (#52): a pin that came on screen on Home stays out of Home's later
 * pages for a day, a week, a month or for good, and on a switch of its own, search results work the
 * same way.
 *
 * <p>Seen means the pin's grid cell started an impression, which is Pinterest's own mark that a pin
 * is on screen, whether it was opened or only scrolled past. Every grid's cells do that, boards and
 * More to explore included, so a pin only counts when a Home page brought it, or a search page while
 * the search switch is on: {@link #homePage} and {@link #searchPage} note what they keep, and
 * {@link #shown} records only those. Each page that arrives later leaves out what's been seen.
 */
public final class SeenPins {
    private SeenPins() {}

    /** The family token a seen pin is taken out under, counted apart in Filter feed's report. */
    static final String SEEN = "seen pin";

    public static final String DAY = "day";
    public static final String WEEK = "week";
    public static final String MONTH = "month";
    public static final String FOREVER = "forever";
    public static final String[] DURATIONS = {DAY, WEEK, MONTH, FOREVER};

    /** How long a seen pin stays out, one of {@link #DURATIONS}. Anything else reads as forever. */
    public static final StringSetting FOR = new StringSetting("hushpinterest_seen_pins_for", FOREVER, false, false);

    /** How many of the pins the last pages brought are remembered as candidates for a sighting. */
    static final int BROUGHT_LIMIT = 4_000;
    static final int HOME = 1;
    static final int SEARCH = 2;
    static final long NO_PIN = Long.MIN_VALUE;

    /** Pin ID to where it came from ({@link #HOME}, {@link #SEARCH} or both), newest last. */
    private static final LinkedHashMap<Long, Integer> BROUGHT = new LinkedHashMap<Long, Integer>() {
        @Override protected boolean removeEldestEntry(Map.Entry<Long, Integer> eldest) {
            return size() > BROUGHT_LIMIT;
        }
    };

    /** Replaces the clock in tests, in milliseconds; null reads the real one. */
    static Long nowForTests;

    /**
     * Rewritten to read the pin a grid cell shows, by the cell's class. Until then a cell is taken as
     * its own pin, which only a test hands it, since nothing calls {@link #shown} before the rewrite.
     */
    private static Object pinOf(Object cell) { return cell; }

    /** Whether the Home switch is on and the settings can be read; never throws. */
    static boolean active() {
        try {
            return Utils.settingsReady() && Settings.HIDE_SEEN_PINS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "switch read", t);
            return false;
        }
    }

    /** Whether the search switch is on, the search hook went in and the settings can be read; never throws. */
    static boolean searchActive() {
        try {
            return Utils.settingsReady() && PatchFamily.Capability.FEED_SAVED_SEARCH.installed()
                    && Settings.HIDE_SEEN_PINS_SEARCH.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "switch read", t);
            return false;
        }
    }

    /**
     * Injected first thing in each pin grid cell's impression start, with the cell. Records its pin
     * as seen when a Home page brought it and the Home switch is on, or a search page and the search
     * switch is on. Never throws.
     */
    public static void shown(Object cell) {
        try {
            if (cell == null || !Utils.settingsReady() || !PatchFamily.Capability.FEED_SEEN_PINS.installed()) return;
            boolean home = Settings.HIDE_SEEN_PINS.get();
            boolean search = Settings.HIDE_SEEN_PINS_SEARCH.get();
            if (!home && !search) return;
            HookStatus.invoked(FamilyNames.FILTER_FEED);
            long id = id(pinOf(cell));
            if (id == NO_PIN) return;
            Integer from;
            synchronized (BROUGHT) {
                from = BROUGHT.get(id);
            }
            if (from == null || !(home && (from & HOME) != 0 || search && (from & SEARCH) != 0)) return;
            SeenPinStore.record(id, minute());
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "seen pin", t);
        }
    }

    /** Called with Home's page items in place: takes out what's been seen while the Home switch is on. */
    static void homePage(List<?> items) {
        if (PatchFamily.Capability.FEED_SEEN_PINS.installed() && active()) prune(items, HOME);
    }

    /**
     * Called with each page of search results after Hide saved pins in search had its turn. Hands back
     * a copy without the pins that have been seen, or the same page when none were. Never throws.
     */
    static List<?> searchPage(List<?> items) {
        try {
            if (items == null || items.isEmpty() || !PatchFamily.Capability.FEED_SEEN_PINS.installed() || !searchActive()) return items;
            List<Object> kept = new ArrayList<>(items);
            prune(kept, SEARCH);
            return kept.size() == items.size() ? items : kept;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "seen search page", t);
            return items;
        }
    }

    /** Takes seen pins out of [items] in place, and out of any module in it, and notes the pins that stay as brought by [from]. */
    static void prune(List<?> items, int from) {
        if (items == null || items.isEmpty()) return;
        int since = since();
        boolean debug = FeedFilter.debugLogging();
        List<String[]> removed = new ArrayList<>();
        ModuleItems.Verdict verdict = item -> seenSince(item, since) ? SEEN : null;
        int out = 0, kept = 0;
        try {
            for (Iterator<?> each = items.iterator(); each.hasNext();) {
                Object item = each.next();
                // Never debug here: judge's "Kept" line names a pin's ad fields, and Home's page hook runs
                // before the list filter, so an ad this pass leaves in would read as one that got through.
                if (FeedFilter.judge(item, verdict, FamilyNames.FILTER_FEED, false, removed) != null) {
                    each.remove();
                    out++;
                } else if (brought(item, from)) {
                    kept++;
                }
            }
        } finally {
            for (String[] entry : removed) HookStatus.counted(entry[0], entry[1]);
        }
        if (debug) {
            int left = out, noted = kept;
            Logger.printDebug(() -> "Seen pins: " + left + " left out of a " + (from == HOME ? "Home" : "search")
                    + " page, " + noted + " pins on it noted");
        }
    }

    private static boolean seenSince(Object item, int since) {
        long id = id(item);
        return id != NO_PIN && SeenPinStore.seenSince(id, since);
    }

    /** Notes [item], when it's a pin, as brought by [from]. */
    private static boolean brought(Object item, int from) {
        long id = id(item);
        if (id == NO_PIN) return false;
        synchronized (BROUGHT) {
            Integer was = BROUGHT.remove(id);
            BROUGHT.put(id, was == null ? from : was | from);
        }
        return true;
    }

    /** [model]'s pin ID as a number, or {@link #NO_PIN} for anything that isn't a pin with one. */
    static long id(Object model) {
        if (model == null) return NO_PIN;
        Map<String, Field> fields = ModelFields.of(model.getClass());
        if (!PinWords.isPin(fields)) return NO_PIN;
        Object id = ModelFields.read(fields, model, "id");
        if (!(id instanceof String) || ((String) id).isEmpty()) return NO_PIN;
        try {
            long value = Long.parseLong((String) id);
            return value == NO_PIN ? NO_PIN : value;
        } catch (NumberFormatException notANumber) {
            return NO_PIN;
        }
    }

    /** The first minute a pin seen then still counts as seen, by {@link #FOR}. */
    static int since() {
        int now = minute();
        switch (Utils.settingsReady() ? FOR.get() : FOREVER) {
            case DAY: return now - (int) TimeUnit.DAYS.toMinutes(1);
            case WEEK: return now - (int) TimeUnit.DAYS.toMinutes(7);
            case MONTH: return now - (int) TimeUnit.DAYS.toMinutes(30);
            default: return Integer.MIN_VALUE;
        }
    }

    static int minute() {
        Long forced = nowForTests;
        return (int) TimeUnit.MILLISECONDS.toMinutes(forced != null ? forced : System.currentTimeMillis());
    }

    /** How many pins are remembered as seen. */
    public static int remembered() {
        return SeenPinStore.size();
    }

    /** Forgets every seen pin, so each can show again, and says how many there were. */
    public static int forget() {
        return SeenPinStore.forget();
    }

    /** How many pins the last Forget took that can still come back. */
    public static int forgotten() {
        return SeenPinStore.forgottenCount();
    }

    /** Puts back what the last Forget took and says how many came back. */
    public static int bringBack() {
        return SeenPinStore.bringBack();
    }

    static void clearForTests() {
        synchronized (BROUGHT) {
            BROUGHT.clear();
        }
        nowForTests = null;
        SeenPinStore.deleteForTests();
    }
}
