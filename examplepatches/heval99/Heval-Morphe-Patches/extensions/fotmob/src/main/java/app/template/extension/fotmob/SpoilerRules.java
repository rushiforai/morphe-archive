package app.template.extension.fotmob;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The pure decisions of "Spoiler-free mode" (no Android or settings access, so JVM unit tests run
 * them: SpoilerRulesTest). A marked match hides its score while it is live and shows it again once
 * it is over, unless "Keep final scores hidden" is on. FotMob's match status is the name of its
 * Match.MatchStatus enum constant (kept names, also the "status" value of a match push).
 */
final class SpoilerRules {
    /**
     * The statuses after which the match is over: its score is final. A status outside this set
     * (live, paused, not started, postponed, unknown or unreadable) keeps the score of a marked
     * match hidden. NotStarted, Postponed, ToBeFinished and KickOffDelayed draw no score anyway.
     * After90Minutes ("After fulltime") is the break before extra time: FotMob's own finished check
     * leaves it out, so it stays hidden. The patch's FINISHED_STATUSES lists the same names
     * (FotMobSmokeTest compares them with this set in the patched dex).
     */
    static final Set<String> FINISHED = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "Finished", "AfterExtraTime", "AfterPenalties", "AwardedWin", "Aborted", "Cancelled")));

    /**
     * The score at the start of the live-update text: "2 - 1" with thin spaces (U+2009) around the
     * dash; Java's \s does not cover those, so the separator class lists them.
     */
    private static final Pattern LEADING_SCORE =
            Pattern.compile("^[\\s\\u2009\\u200A\\u202F]*\\d+([\\s\\u2009\\u200A\\u202F]*-[\\s\\u2009\\u200A\\u202F]*)\\d+");

    private SpoilerRules() {
    }

    /** Whether {@code status} (a MatchStatus name, null when unknown) means the match is over. */
    static boolean isFinished(String status) {
        return status != null && FINISHED.contains(status);
    }

    /**
     * Whether a match's score is hidden: it is marked, and it is not over yet or the user keeps
     * final scores hidden too. An unknown status counts as live, so a marked match stays masked.
     */
    static boolean hides(boolean marked, String status, boolean keepFinal) {
        if (!marked) return false;
        return keepFinal || !isFinished(status);
    }

    /**
     * A score text ("2 - 1", "(3 - 2)" with a direction mark) of a hidden match: every number
     * becomes "?". The text is formatted with the default locale, so any Unicode decimal digit counts
     * (Arabic-Indic digits too). A text without digits stays as it is (it holds no score).
     */
    static String maskScore(String text) {
        if (text == null) return null;
        return text.replaceAll("\\p{Nd}+", "?");
    }

    /**
     * The live-update header text "2 - 1 • 67'" of a hidden match: the leading score becomes
     * "? - ?" and the status after it stays. When the text does not start with a score (FotMob
     * changed it), all of it is hidden rather than risk showing the score.
     */
    static String maskLeadingScore(String text) {
        if (text == null) return null;
        Matcher matcher = LEADING_SCORE.matcher(text);
        if (!matcher.find()) return "";
        return "?" + matcher.group(1) + "?" + text.substring(matcher.end());
    }
}
