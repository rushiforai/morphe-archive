/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import androidx.annotation.Nullable;

import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Takes the "Threads you might like" card out from between reels, for Clean up Reels (#85).
 *
 * <p>The cards Facebook puts between reels, people you may know, groups to join, games and a
 * Threads post with an Open Threads button among them, are Reels items of one class, the mid-card
 * item. Each keeps a unit whose model answers the card's type as a constant of a GraphQL enum, and
 * the Threads card's is {@link #THREADS_MID_CARD}. The item class and the three reads are Redex
 * names, so the patch passes the item's class name in with each page and fills in
 * {@link #midCardType}.
 *
 * <p>The card comes off each section's item list through the walk every page filter shares
 * ({@link ReelSections}), the lists the screen reads, so it never reaches the viewer. While the
 * switch is on, every item the walk reads is counted on the report's Kinds line: a mid-card by its
 * type, anything else as {@link #NOT_A_MID_CARD}. So a report names any other card too.
 *
 * <p>Off, paused, before the settings are ready, or when anything fails, the page goes on as
 * Facebook sent it.
 */
public final class ReelMidCards {
    /** The mid-card type of the Threads card. */
    static final String THREADS_MID_CARD = "THREADS_MIDCARD";

    /** The source every event of this filter carries in the diagnostic report. */
    private static final String SOURCE = "ReelMidCards";

    /** The diagnostic counter route: each page of sections handed in, and every item read. */
    static final String SECTIONS_ROUTE = "Reel mid-cards";

    /** What an item counts as. Only the Threads card comes off. */
    static final String MID_CARD = "mid-card ";
    static final String THREADS_CARD = MID_CARD + THREADS_MID_CARD;
    static final String NOT_A_MID_CARD = "not a mid-card";
    static final String NO_TYPE = "mid-card without a type";
    static final String NOT_PATCHED = "type reader not patched";
    static final String READ_FAILED = "read failed";

    /** What {@link #midCardType} answers until the patch fills it in. */
    static final Object UNPATCHED = new Object();

    /** A mid-card item's type, read through the stub the patch filled in or a test's stand-in. */
    interface Types {
        /** The item's type, an enum constant or null, or {@link #UNPATCHED}. */
        @Nullable
        Object type(Object item);
    }

    static final Types PATCHED = ReelMidCards::midCardType;

    private ReelMidCards() {
    }

    /**
     * Injection point, first thing in the Reels controller's method taking a page of sections. The
     * same page with no Threads card left in any section, or the very same page when the switch is
     * off or there was none. Never throws.
     *
     * @param page         the sections about to be added to the Reels list.
     * @param midCardClass binary name of the mid-card item class, for example {@code X.8bO}.
     */
    public static List<?> withoutThreadsCards(List<?> page, String midCardClass) {
        return withoutThreadsCards(page, midCardClass, PATCHED);
    }

    /** {@link #withoutThreadsCards(List, String)} with the type read passed in, so a test can stand in for the stub. */
    static List<?> withoutThreadsCards(List<?> page, String midCardClass, Types types) {
        HookStatus.invoked(FamilyNames.REEL_DECLUTTER);
        FeedFilterCounters.sawList(SECTIONS_ROUTE, page == null ? 0 : page.size());
        if (page == null || page.isEmpty() || !switchedOn()) return page;

        try {
            ReelSections.Result result = ReelSections.strip(page, item -> {
                String kind = kindOf(item, midCardClass, types);
                FeedFilterCounters.sawKind(SECTIONS_ROUTE, kind);
                return THREADS_CARD.equals(kind);
            }, FamilyNames.REEL_DECLUTTER, SOURCE);
            if (result.dropped == 0) return page;

            FeedFilterCounters.removed(SECTIONS_ROUTE, result.dropped, THREADS_CARD);
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "dropped " + result.dropped + " Threads card(s) from " + page.size() + " section(s)");

            return result.page;
        } catch (Throwable failure) {
            // Anything thrown here would go on into Facebook's Reels page insert.
            HookStatus.threw(FamilyNames.REEL_DECLUTTER, "Threads card filter", failure);
            Logger.diagnosticError(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "could not filter a page of sections", failure);
            return page;
        }
    }

    /** The switch. Off, unreadable, or asked before the settings are ready, the page passes as it came. */
    private static boolean switchedOn() {
        try {
            return Utils.settingsReady() && Settings.HIDE_REEL_THREADS_CARDS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.REEL_DECLUTTER, "Threads card switch read", t);
            return false;
        }
    }

    /**
     * What [item] counts as: a mid-card by its type, a mid-card whose type can't be read, or
     * anything else. Never throws.
     */
    static String kindOf(@Nullable Object item, String midCardClass, Types types) {
        if (item == null || !isOfClass(item, midCardClass)) return NOT_A_MID_CARD;

        Object type;
        try {
            type = types.type(item);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REEL_DECLUTTER, "mid-card type", failure);
            return READ_FAILED;
        }
        if (type == UNPATCHED) {
            HookStatus.missingMember(FamilyNames.REEL_DECLUTTER, "method", "mid-card item", "type");
            return NOT_PATCHED;
        }
        if (!(type instanceof Enum)) return NO_TYPE;

        HookStatus.bound(FamilyNames.REEL_DECLUTTER, "mid-card type");
        return MID_CARD + ((Enum<?>) type).name();
    }

    /** Whether [item] is the class named [className] or extends it. */
    private static boolean isOfClass(Object item, @Nullable String className) {
        if (className == null) return false;

        for (Class<?> type = item.getClass(); type != null; type = type.getSuperclass()) {
            if (className.equals(type.getName())) return true;
        }

        return false;
    }

    /**
     * Injection point, filled in by the patch: the mid-card item's type, a constant of Facebook's
     * mid-card type enum, or null when the item holds none. The patch replaces this body with the
     * item's three reads. Only an object of the class the patch names may be passed.
     */
    public static Object midCardType(Object item) {
        return UNPATCHED;
    }
}
