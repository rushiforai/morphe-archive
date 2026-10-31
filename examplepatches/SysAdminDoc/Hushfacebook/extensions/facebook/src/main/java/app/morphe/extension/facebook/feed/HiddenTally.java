/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLongArray;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.settings.Setting;

/**
 * How many posts and cards the feed guard kept out of Home since Facebook started, by kind, for
 * the tally at the top of the News feed settings.
 *
 * <p>People ask whether the switches do anything on their account (Discussion #176), and a post a
 * switch hid leaves no gap to see. The diagnostic counters already know, but only a Debug report
 * shows them, in the guard's own words. This keeps the same count in a few plain kinds.
 *
 * <p>It's memory only: nothing is saved, so a restart starts from zero, and nothing here names a
 * post, a person or a word.
 */
public final class HiddenTally {
    /** What a hidden post or card counts under, in the order the guard's rules run. */
    enum Kind {
        ADS, REELS, SUGGESTED, CARDS, GROUPS, STORIES, AI, YOUR_FILTERS, SEEN
    }

    /** How many kinds the row names before it counts the rest together. */
    static final int NAMED = 3;

    private static final Kind[] KINDS = Kind.values();
    private static final AtomicLongArray COUNTS = new AtomicLongArray(KINDS.length);

    private HiddenTally() {
    }

    /** The feed guard hid one edge of this kind. */
    static void hid(@Nullable Kind kind) {
        if (kind != null) COUNTS.incrementAndGet(kind.ordinal());
    }

    /** The counts as they stand, one read per kind, so a summary adds up while the feed loads. */
    static long[] counts() {
        long[] counts = new long[KINDS.length];
        for (int index = 0; index < counts.length; index++) counts[index] = COUNTS.get(index);
        return counts;
    }

    /**
     * The kinds that hid anything, most first. A tie keeps the order the rules run in, so two
     * looks at the same counts read the same way.
     */
    static List<Kind> largest(long[] counts) {
        List<Kind> kinds = new ArrayList<>();
        for (Kind kind : KINDS) {
            if (counts[kind.ordinal()] > 0) kinds.add(kind);
        }
        kinds.sort((a, b) -> Long.compare(counts[b.ordinal()], counts[a.ordinal()]));
        return kinds;
    }

    /**
     * The row's summary: the total and the {@link #NAMED} largest kinds with their counts, the rest
     * as one number, or why there's nothing to count.
     */
    public static String summary() {
        // Pause is decided once per process, so a paused Facebook has hidden nothing since it started.
        if (Setting.isPaused()) return L10n.t("Hushfacebook is paused");
        long[] counts = counts();
        long total = 0;
        for (long count : counts) total += count;
        if (total == 0) return L10n.t("Nothing hidden yet. Scroll Home and come back.");

        List<Kind> kinds = largest(counts);
        List<String> parts = new ArrayList<>();
        long named = 0;
        for (int index = 0; index < Math.min(NAMED, kinds.size()); index++) {
            long count = counts[kinds.get(index).ordinal()];
            named += count;
            parts.add(L10n.f("%1$s (%2$d)", label(kinds.get(index)), count));
        }
        long rest = total - named;
        if (rest > 0) parts.add(L10n.quantity(rest, "%1$d other", "%1$d others", rest));
        return L10n.quantity(total, "%1$d post or card: %2$s", "%1$d posts and cards: %2$s", total,
                L10n.join(parts));
    }

    private static String label(Kind kind) {
        switch (kind) {
            case ADS:
                return L10n.t("ads");
            case REELS:
                return L10n.t("reels");
            case SUGGESTED:
                return L10n.t("suggestions");
            case CARDS:
                return L10n.t("Memories and other cards");
            case GROUPS:
                return L10n.t("posts from groups you're not in");
            case STORIES:
                return L10n.t("rows of Stories");
            case AI:
                return L10n.t("AI posts");
            case YOUR_FILTERS:
                return L10n.t("posts your filters matched");
            default:
                return L10n.t("posts you've seen");
        }
    }

    static void clearForTests() {
        for (int index = 0; index < KINDS.length; index++) COUNTS.set(index, 0);
    }
}
