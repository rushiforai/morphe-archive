package dev.custom.gboardpatches.punctuation;

import android.view.inputmethod.InputConnection;

import java.util.Locale;

/**
 * Removes the space Gboard leaves in front of punctuation that the language sets tight against the
 * word: typing "." after "Hey " commits "Hey.", not "Hey .".
 *
 * The rule is the language's, not a blanket strip. Languages that put a space before high
 * punctuation (French is the common case: "Bonjour !") keep exactly one space there, while a
 * doubled or ordinary stray space is still collapsed. Marks that never take a leading space in any
 * of these languages (period, comma, ellipsis) always hug.
 *
 * Everything is guarded: a null connection, a selection, a multi-character commit (an autocorrect
 * or a suggestion that merely ends in punctuation) or any surprise from the connection leaves the
 * commit exactly as Gboard produced it.
 */
public final class PunctuationSpacingRuntime {

    /** Marks that never take a leading space. */
    private static final String ALWAYS_HUG = ".,\u2026";

    /** Marks that keep one space before them in French-style typography. */
    private static final String FRENCH_SPACED = ";:!?";

    private PunctuationSpacingRuntime() {
    }

    /**
     * Commit hook. Called with the funnel's InputConnection and the text about to be inserted,
     * before Gboard inserts it, so the stray space is gone by the time the mark lands.
     */
    public static void beforeCommit(InputConnection connection, CharSequence text) {
        try {
            if (connection == null || text == null || text.length() != 1) {
                return;
            }
            char mark = text.charAt(0);
            boolean alwaysHug = ALWAYS_HUG.indexOf(mark) >= 0;
            boolean frenchSpaced = FRENCH_SPACED.indexOf(mark) >= 0;
            if (!alwaysHug && !frenchSpaced) {
                return;
            }

            // A selection is about to be replaced; deleting around the cursor would edit text the
            // user is not looking at.
            CharSequence selected = connection.getSelectedText(0);
            if (selected != null && selected.length() > 0) {
                return;
            }

            CharSequence before = connection.getTextBeforeCursor(2, 0);
            if (before == null || before.length() == 0) {
                return;
            }
            int spaces = trailingSpaces(before);
            if (spaces == 0) {
                return;
            }

            int keep = frenchSpaced && expectsSpaceBefore() ? 1 : 0;
            int remove = spaces - keep;
            if (remove > 0) {
                connection.deleteSurroundingText(remove, 0);
            }
        } catch (Throwable ignored) {
            // Any surprise leaves the stock commit untouched.
        }
    }

    /** Counts the spaces (plain or non-breaking) sitting at the end of the text before the cursor. */
    private static int trailingSpaces(CharSequence before) {
        int count = 0;
        for (int i = before.length() - 1; i >= 0; i--) {
            if (!isSpace(before.charAt(i))) {
                break;
            }
            count++;
        }
        return count;
    }

    private static boolean isSpace(char c) {
        return c == ' ' || c == '\u00A0' || c == '\u202F' || Character.isWhitespace(c);
    }

    /** Whether the language in use sets high punctuation off with a space. */
    private static boolean expectsSpaceBefore() {
        String language = Locale.getDefault().getLanguage();
        return "fr".equals(language);
    }
}
