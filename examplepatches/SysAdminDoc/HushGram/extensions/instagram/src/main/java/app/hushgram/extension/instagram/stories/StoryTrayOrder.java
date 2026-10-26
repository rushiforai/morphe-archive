/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import java.util.ArrayList;
import java.util.List;
import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Sends the stories you've watched to the back of Home's story tray while "View stories
 * anonymously" and "Gray out stories you've watched" are both on (#241).
 *
 * <p>With both on, a watched story's ring turns gray on the phone ({@link StorySeenRings}), but
 * Instagram only moves a gray ring to the end of the tray when one of its own server flags says to.
 * Home's feed adapter asks the reel store for the tray's reels and the store, with that flag off,
 * hands them back in the order the server sent. So the patch hands the store's answer to
 * {@link #order}, which sorts only ordinary story slots, unseen first and watched after, each
 * half in its original order. Your own story, Create and special entries keep their native slots.
 * Nothing is added or dropped.
 *
 * <p>Either switch off, a pause or settings that aren't ready give the list back as it came, and so
 * does any failure deciding.
 */
public final class StoryTrayOrder {
    /** The hook's name in the diagnostics, and what it counts. */
    static final String HOOK = "story tray order";
    static final String MOVED = "watched stories moved to the back";
    static final int PINNED = -1;

    /** Native state: 0 unseen, 1 watched, or {@link #PINNED} for entries that must stay put. */
    interface Seen {
        int of(Object reel);
    }

    private static final BooleanSupplier ON = StoryTrayOrder::grayedOut;

    private StoryTrayOrder() {
    }

    /** Whether the tray is ordered: views held back and watched stories grayed. */
    static boolean grayedOut() {
        return Utils.settingsReady() && StorySeen.anonymous() && Settings.GRAY_OUT_WATCHED_STORIES.get();
    }

    /**
     * Put by the patch on the list the reel [store] hands Home's feed adapter, just before it
     * returns. Returns [reels] itself unless the tray needs reordering. Never throws.
     */
    public static List<Object> order(List<Object> reels, Object store) {
        return order(reels, ON, reel -> seen(store, reel));
    }

    static List<Object> order(List<Object> reels, BooleanSupplier on, Seen seen) {
        try {
            if (reels == null || reels.size() < 2 || !on.getAsBoolean()) return reels;
            List<Object> unseen = new ArrayList<>(reels.size());
            List<Object> watched = new ArrayList<>();
            int[] slots = new int[reels.size()];
            int count = 0;
            for (int index = 0; index < reels.size(); index++) {
                Object reel = reels.get(index);
                if (reel == null) continue;
                int state = seen.of(reel);
                if (state == PINNED) continue;
                if (state != 0 && state != 1) throw new IllegalStateException("Unknown story tray state");
                slots[count++] = index;
                if (state == 1) watched.add(reel);
                else unseen.add(reel);
            }
            if (watched.isEmpty() || unseen.isEmpty()) return reels;
            unseen.addAll(watched);
            List<Object> ordered = new ArrayList<>(reels);
            for (int index = 0; index < count; index++) ordered.set(slots[index], unseen.get(index));
            if (ordered.equals(reels)) return reels;
            HookStatus.counted(FamilyNames.STORY_SEEN, MOVED);
            Logger.printDebug(() -> "Story tray: moved " + watched.size() + " watched stories to the back");
            return ordered;
        } catch (Throwable failure) {
            try {
                HookStatus.threw(FamilyNames.STORY_SEEN, HOOK, failure);
            } catch (Throwable ignored) {
                // There is nowhere left to report a diagnostic failure.
            }
            return reels;
        }
    }

    // ------------------------------------------------------------------ what the patch fills in

    /** Filled by the patch: a native ordinary story's seen state, or {@link #PINNED} for own/special/unknown entries. */
    static int seen(Object store, Object reel) {
        return PINNED;
    }
}
