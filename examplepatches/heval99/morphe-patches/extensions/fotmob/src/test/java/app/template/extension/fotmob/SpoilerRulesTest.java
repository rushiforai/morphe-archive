package app.template.extension.fotmob;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import org.junit.Test;

/** Spoiler-free mode's decisions: hide while live, show after full time unless final scores stay hidden. */
public class SpoilerRulesTest {
    /** Every Match.MatchStatus constant of FotMob 242 that is not "over". */
    private static final List<String> NOT_OVER = Arrays.asList(
            "NotStarted", "Started", "Pause", "FirstHalf", "SecondHalf", "FirstExtraHalf", "PauseExtraTime",
            "SecondExtraHalf", "SilverGoalFirstHalf", "SilverGoalSecondHalf", "SilverGoal", "GoldenGoal",
            "PenaltiesAreHappening", "Postponed", "ToBeFinished", "KickOffDelayed", "WaitingForPenalties",
            "WaitingForExtratime", "Interrupted", "After90Minutes");
    private static final List<String> OVER = Arrays.asList(
            "Finished", "AfterExtraTime", "AfterPenalties", "AwardedWin", "Aborted", "Cancelled");

    @Test
    public void finishedSetMatchesFotMobsOwnFinishedStatuses() {
        assertEquals(new HashSet<>(OVER), SpoilerRules.FINISHED);
    }

    @Test
    public void after90MinutesIsTheBreakBeforeExtraTimeAndStaysHidden() {
        assertFalse(SpoilerRules.isFinished("After90Minutes"));
        assertTrue(SpoilerRules.hides(true, "After90Minutes", false));
    }

    @Test
    public void unmarkedMatchesAreNeverHidden() {
        for (String status : NOT_OVER) {
            assertFalse(status, SpoilerRules.hides(false, status, false));
            assertFalse(status, SpoilerRules.hides(false, status, true));
        }
        for (String status : OVER) assertFalse(status, SpoilerRules.hides(false, status, true));
        assertFalse(SpoilerRules.hides(false, null, true));
    }

    @Test
    public void markedMatchIsHiddenWhileLive() {
        for (String status : NOT_OVER) assertTrue(status, SpoilerRules.hides(true, status, false));
    }

    @Test
    public void markedMatchShowsItsScoreAfterFullTime() {
        for (String status : OVER) assertFalse(status, SpoilerRules.hides(true, status, false));
    }

    @Test
    public void keepFinalHidesFinishedMatchesToo() {
        for (String status : OVER) assertTrue(status, SpoilerRules.hides(true, status, true));
        for (String status : NOT_OVER) assertTrue(status, SpoilerRules.hides(true, status, true));
    }

    @Test
    public void unknownStatusCountsAsLive() {
        assertTrue(SpoilerRules.hides(true, null, false));
        assertTrue(SpoilerRules.hides(true, "", false));
        assertTrue(SpoilerRules.hides(true, "SomethingNew", false));
        assertTrue(SpoilerRules.hides(true, "finished", false)); // names are case sensitive
    }

    @Test
    public void scoreTextsLoseEveryNumber() {
        assertEquals("? ‎- ?", SpoilerRules.maskScore("2 ‎- 1"));
        assertEquals(" (? - ?)", SpoilerRules.maskScore(" (10 - 9)"));
        // Arabic-Indic digits from a default-locale String.format ("٢ - ١", "١٠ - ٩").
        assertEquals("? - ?", SpoilerRules.maskScore("٢ - ١"));
        assertEquals("? - ?", SpoilerRules.maskScore("١٠ - ٩"));
        assertEquals("", SpoilerRules.maskScore(""));
        assertEquals(null, SpoilerRules.maskScore(null));
    }

    @Test
    public void leadingScoreIsMaskedAndTheMinuteStays() {
        assertEquals("? - ? • 67'", SpoilerRules.maskLeadingScore("2 - 1 • 67'"));
        assertEquals("? - ? • HT", SpoilerRules.maskLeadingScore("10 - 0 • HT"));
        assertEquals("? - ? • 90+3'", SpoilerRules.maskLeadingScore("3 - 3 • 90+3'"));
    }

    @Test
    public void unexpectedHeaderIsHiddenCompletely() {
        // No leading score: FotMob changed the text, so none of it is shown rather than risk the score.
        assertEquals("", SpoilerRules.maskLeadingScore("Arsenal 2 - 1 Chelsea"));
        assertEquals("", SpoilerRules.maskLeadingScore("67'"));
        assertEquals(null, SpoilerRules.maskLeadingScore(null));
    }
}
