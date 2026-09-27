package com.travianpatch.notifier;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * The four lines of the home-screen widget, from what the background check already saved: the next
 * incoming attack, the next thing to finish in a queue, the soonest full storage, and when the last check
 * ran. The widget only changes when a check runs (every few minutes), so every time is shown as a clock time
 * as well as "in ...". Pure logic (no Android APIs).
 */
final class WidgetText {

    private WidgetText() {
    }

    static String attack(long nextAttackMs, long attacksKnownAtMs, long nowMs) {
        if (attacksKnownAtMs <= 0 || nowMs - attacksKnownAtMs > ActionClient.ATTACK_DATA_MAX_AGE_MS) {
            return "⚔ Attacks: not checked lately";
        }
        if (nextAttackMs <= nowMs) {
            return "⚔ No attack coming";
        }
        return "⚔ Attack " + in(nextAttackMs, nowMs);
    }

    static String queue(List<QueueView.Group> groups, long nowMs) {
        QueueView.Item best = null;
        for (QueueView.Group g : groups) {
            for (QueueView.Item item : g.items) {
                if (item.finishMs > nowMs && (best == null || item.finishMs < best.finishMs)) {
                    best = item;
                }
            }
        }
        if (best == null) {
            return "🔨 Nothing building or training";
        }
        return "🔨 " + best.label + " " + in(best.finishMs, nowMs);
    }

    /** fullAtMs: soonest time a store is full (0 = none filling, <= now = full already). */
    static String storage(long fullAtMs, String what, long nowMs) {
        if (fullAtMs <= 0) {
            return "📦 Storage: nothing filling up";
        }
        String label = what == null || what.isEmpty() ? "storage" : what;
        if (fullAtMs <= nowMs) {
            return "📦 " + label + " is full";
        }
        return "📦 " + label + " full " + in(fullAtMs, nowMs);
    }

    static String checked(long lastCheckMs) {
        if (lastCheckMs <= 0) {
            return "Not checked yet · open the game once";
        }
        return "Checked " + clock(lastCheckMs) + " · tap to open";
    }

    /** "in 12 min (14:20)". */
    static String in(long atMs, long nowMs) {
        return "in " + AlertStatus.duration(atMs - nowMs) + " (" + clock(atMs) + ")";
    }

    static String clock(long ms) {
        return new SimpleDateFormat("HH:mm", Locale.US).format(new Date(ms));
    }
}
