package app.ahmedyarub.extension.instagram;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class ReelsFeed {
    private static volatile boolean failureLogged;

    private ReelsFeed() {
    }

    /**
     * Replaced at patch time: whether Instagram counts this Reels item as a card rather than a
     * reel (suggested accounts and creators, midcards, prompts, pivots and the like).
     */
    private static boolean isCard(Object item) {
        return false;
    }

    /** Replaced at patch time: whether this Reels item is a live broadcast. */
    private static boolean isLive(Object item) {
        return false;
    }

    /**
     * Injection point: the items the Reels feed is about to add or insert. Returns them without
     * cards and live broadcasts, or as they are when nothing is dropped.
     */
    public static List<Object> filterItems(List<Object> items) {
        if (items == null || items.isEmpty()) return items;
        try {
            List<Object> kept = new ArrayList<>(items.size());
            for (Object item : items) {
                if (item != null && (isCard(item) || isLive(item))) continue;
                kept.add(item);
            }
            return kept.size() == items.size() ? items : kept;
        } catch (Throwable e) {
            if (!failureLogged) {
                failureLogged = true;
                Logger.printException(() -> "ReelsFeed.filterItems failed", e);
            }
            return items;
        }
    }
}
