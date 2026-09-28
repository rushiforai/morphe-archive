/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.composer;

import android.widget.AutoCompleteTextView;

import androidx.annotation.Nullable;

import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Tag suggestions only after @ patch asks when one of Facebook's text boxes is about to
 * look up people to tag for a word that doesn't start with @.
 *
 * <p>Every box that can tag people (a post, a comment, a caption, a story's text) is one Facebook
 * view, and on each edit it decides whether the word at the cursor is a lookup. A word starting
 * with @ asks for people and one starting with # asks for hashtags. Any other word of three or four
 * letters and more asks for people too, unless it's on a list of common words Facebook downloads:
 * that's what Facebook's code calls an implicit mention, and it's the list that opens over ordinary
 * words. Facebook can turn that last lookup off per box with a flag, which the box reads right after
 * it has seen the word doesn't start with @, and returns before looking anyone up when it's set.
 * The patch puts {@link #skipsWordWithoutAt} right after that read, so the flag's answer passes
 * through here.
 *
 * <p>With the switch on, the answer is yes, and the box returns the way it does with the flag set.
 * If a list of people from an earlier @ is still open, it's closed, as Facebook closes it when a
 * lookup finds nobody, so it can't be tapped by mistake while you type on. Words with @ or # never
 * reach this, nor do tags on photos (a search screen of their own), and the text isn't read or
 * changed.
 *
 * <p>It fails open: switch off, a pause, settings that aren't ready, or any failure in here leave
 * Facebook's own answer.
 */
public final class TagSuggestions {
    /** The diagnostic counter route: each word without @ the box asked about, and the lookups skipped. */
    static final String ROUTE = "Tag suggestions";

    /** What a skipped lookup is counted under. */
    static final String SKIPPED = "word without @";

    /** Where the Debug log lines come from. */
    static final String SOURCE = "TagSuggestions";

    /** How each Debug log line starts. */
    static final String PREFIX = "Tag suggestions: ";

    /** Skips logged one line each, since the box asks on every letter typed. */
    static final int LOGGED_ONE_BY_ONE = 40;

    /** After those, one line per this many skips. */
    static final int SUMMED_UP_BY = 50;

    /** Skips so far in this process, for the Debug log. */
    private static final AtomicInteger skips = new AtomicInteger();

    private TagSuggestions() {
    }

    /**
     * Injection point, right after the box reads its flag for a word without @. [facebookSkips] is
     * the flag, [mentionBox] the box itself. True has the box return before it looks anyone up.
     * Never throws.
     */
    public static boolean skipsWordWithoutAt(boolean facebookSkips, @Nullable Object mentionBox) {
        try {
            HookStatus.invoked(FamilyNames.TAG_SUGGESTIONS);
            FeedFilterCounters.sawList(ROUTE, 1);
            // Facebook's own no stands whatever the switch says.
            if (facebookSkips) return true;
            if (!Utils.settingsReady() || !Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT.get()) return false;
            boolean closed = closeOpenList(mentionBox);
            FeedFilterCounters.removed(ROUTE, 1, SKIPPED);
            log(closed);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAG_SUGGESTIONS, "tag suggestion", failure);
            return facebookSkips;
        }
    }

    /**
     * One line per skip for the first {@link #LOGGED_ONE_BY_ONE}, then one per {@link #SUMMED_UP_BY}.
     * No line holds the word or anything else from the text.
     */
    private static void log(boolean closed) {
        int count = skips.incrementAndGet();
        if (count <= LOGGED_ONE_BY_ONE) {
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE, () -> PREFIX + (closed
                    ? "skipped the lookup for a word without @ and closed the list of people left open."
                    : "skipped the lookup for a word without @."));
        } else if (count % SUMMED_UP_BY == 0) {
            Logger.diagnosticDebug(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> PREFIX + count + " lookups for words without @ skipped so far.");
        }
    }

    /** Starts the Debug log's count again, as a new Facebook process would. For tests. */
    static void forget() {
        skips.set(0);
    }

    /**
     * Closes [mentionBox]'s list when it's open, through the box's own dismissDropDown, which is how
     * Facebook closes it after a lookup that finds nobody. True when a list was closed.
     */
    static boolean closeOpenList(@Nullable Object mentionBox) {
        if (!(mentionBox instanceof AutoCompleteTextView)) return false;
        AutoCompleteTextView box = (AutoCompleteTextView) mentionBox;
        if (!box.isPopupShowing()) return false;
        box.dismissDropDown();
        return true;
    }
}
