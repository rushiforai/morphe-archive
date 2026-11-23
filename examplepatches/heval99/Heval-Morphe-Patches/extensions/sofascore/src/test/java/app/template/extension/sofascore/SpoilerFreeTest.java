package app.template.extension.sofascore;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.lang.reflect.Field;

import org.junit.Test;

import app.template.extension.hevalcontrols.HevalSettings;

/** The pure parts of Spoiler-free mode: the shared decision, the row decisions, score field selection and the pass-through. */
public class SpoilerFreeTest {
    /** Four same-typed cells (name, game score, set score, score) plus unrelated fields. */
    @SuppressWarnings("unused")
    static final class Line {
        static String ignoredStatic = "x";
        int number = 1;
        Object other;
        String d_score;
        String a_name;
        String c_set;
        String b_game;
    }

    /** Three same-typed fields: not the expected shape. */
    @SuppressWarnings("unused")
    static final class Odd {
        String a;
        String b;
        String c;
    }

    @Test
    public void scoreFieldsAreTheLastThreeByName() {
        Field[] fields = SpoilerFree.scoreFieldsOf(Line.class);
        assertEquals(3, fields.length);
        assertEquals("b_game", fields[0].getName());
        assertEquals("c_set", fields[1].getName());
        assertEquals("d_score", fields[2].getName());
    }

    @Test
    public void unexpectedShapeSelectsNothing() {
        assertEquals(0, SpoilerFree.scoreFieldsOf(Odd.class).length);
    }

    /** A stand-in for Sofascore's Event: only the status getter the decision reads. */
    public static final class FakeEvent {
        private final String type;

        FakeEvent(String type) {
            this.type = type;
        }

        public String getStatusType() {
            if (type == null) throw new NullPointerException("no status");
            return type;
        }
    }

    @Test
    public void unmarkedMatchesNeverHide() {
        for (String type : new String[] {"inprogress", "finished", "notstarted", null, "unknown"}) {
            assertFalse(type, SpoilerFree.hidesScore(false, false, type, false));
            assertFalse(type, SpoilerFree.hidesScore(false, false, type, true));
        }
    }

    @Test
    public void markedMatchesHideUntilFullTime() {
        for (String type : new String[] {"inprogress", "interrupted", "willcontinue", "notstarted", "postponed",
            "canceled", "suspended", "delayed", "preliminary"}) {
            assertTrue(type, SpoilerFree.hidesScore(true, false, type, false));
        }
        assertFalse(SpoilerFree.hidesScore(true, false, "finished", false));
    }

    @Test
    public void competitionMarkCountsLikeAMatchMark() {
        assertTrue(SpoilerFree.hidesScore(false, true, "inprogress", false));
        assertFalse(SpoilerFree.hidesScore(false, true, "finished", false));
        assertTrue(SpoilerFree.hidesScore(false, true, "finished", true));
    }

    @Test
    public void keepFinalHiddenAlsoHidesFinishedMatches() {
        assertTrue(SpoilerFree.hidesScore(true, false, "finished", true));
        assertTrue(SpoilerFree.hidesScore(true, false, "inprogress", true));
    }

    @Test
    public void missingOrUnknownStatusHidesAMarkedMatch() {
        assertTrue(SpoilerFree.hidesScore(true, false, null, false));
        assertTrue(SpoilerFree.hidesScore(true, false, "", false));
        assertTrue(SpoilerFree.hidesScore(true, false, "Finished", false));
        assertTrue(SpoilerFree.hidesScore(true, false, "somethingnew", false));
    }

    @Test
    public void statusTypeIsReadOrNull() {
        assertEquals("finished", SpoilerFree.statusType(new FakeEvent("finished")));
        assertNull(SpoilerFree.statusType(new FakeEvent(null)));
        assertNull(SpoilerFree.statusType(new Object()));
        assertNull(SpoilerFree.statusType(null));
        // Off device nothing is marked, so the Event-level decision shows the score.
        assertFalse(SpoilerFree.hidesScore(new FakeEvent("inprogress")));
        assertFalse(SpoilerFree.hidesScore((Object) null));
    }

    @Test
    public void rowDecisionsFollowTheLatestMapping() {
        int id = 987_654_321;
        // Not decided yet: the match's own mark.
        assertTrue(SpoilerFree.rowHidden(id, true));
        assertFalse(SpoilerFree.rowHidden(id, false));
        // Live and marked (or its competition marked): hidden, also for the tick copy.
        SpoilerFree.noteRow(id, false, true);
        assertTrue(SpoilerFree.rowHidden(id, false));
        // Full time, match marked: the next mapping shows it, even though the match is still marked.
        SpoilerFree.noteRow(id, true, false);
        assertFalse(SpoilerFree.rowHidden(id, true));
        // Un-marked: back to the live mark lookup.
        SpoilerFree.noteRow(id, false, false);
        assertFalse(SpoilerFree.rowHidden(id, false));
        assertTrue(SpoilerFree.rowHidden(id, true));
    }

    @Test
    public void maskRowPassesTheStatusThroughWhenTheFeatureIsOff() {
        // Without an Android runtime the settings are not available, so the feature reads as off.
        assertFalse(HevalSettings.isEnabled(SpoilerFree.LISTS));
        Object status = new Object();
        Line home = new Line();
        home.d_score = "2";
        assertSame(status, SpoilerFree.maskRow(1, null, status, home, new Line()));
        assertEquals("2", home.d_score);
        assertEquals(null, SpoilerFree.maskRow(1, null, null, null, null));
    }

    /** Event 12436870 is marked, nothing else. */
    private static final SpoilerFree.Marks MARKED = new SpoilerFree.Marks() {
        @Override
        public boolean isMatchMarked(String eventId) {
            return "12436870".equals(eventId);
        }
    };

    private static String push(String target, Object id, String icon) {
        StringBuilder json = new StringBuilder("{\"channel\":\"c\",\"title\":\"A - B\",\"message\":\"1 - 0\",\"groupKey\":\"g\"");
        if (icon != null) json.append(",\"icon\":\"").append(icon).append('"');
        json.append(",\"open\":{\"target\":\"").append(target).append("\",\"id\":").append(id).append("}}");
        return json.toString();
    }

    @Test
    public void livePushesOfAMarkedMatchAreDropped() {
        for (String icon : new String[] {"football_current_score", "halftime", "start", "prestart", "period_start", "redcard",
            "substitution", "missed_penalty", "lineups", "highlights", "tennis_period_score", "somethingnew"}) {
            assertTrue(icon, SpoilerFree.blocksPush(push("details", 12436870, icon), MARKED, false));
            assertTrue(icon, SpoilerFree.blocksPush(push("details", 12436870, icon), MARKED, true));
        }
        assertTrue(SpoilerFree.blocksPush(push("highlights", 12436870, "highlights"), MARKED, false));
        assertTrue(SpoilerFree.blocksPush(push("lineups", "\"12436870\"", "lineups"), MARKED, false));
    }

    @Test
    public void theFullTimePushPassesUnlessFinalScoresStayHidden() {
        assertFalse(SpoilerFree.blocksPush(push("details", 12436870, "finish"), MARKED, false));
        assertTrue(SpoilerFree.blocksPush(push("details", 12436870, "finish"), MARKED, true));
        // Case matters: only Sofascore's own "finish" counts.
        assertTrue(SpoilerFree.blocksPush(push("details", 12436870, "Finish"), MARKED, false));
    }

    @Test
    public void aPushWithoutAReadableIconIsDropped() {
        assertTrue(SpoilerFree.blocksPush(push("details", 12436870, null), MARKED, false));
        assertTrue(SpoilerFree.blocksPush("{\"icon\":7,\"open\":{\"target\":\"details\",\"id\":12436870}}", MARKED, false));
    }

    @Test
    public void otherPushesPass() {
        assertFalse(SpoilerFree.blocksPush(push("details", 1, "football_current_score"), MARKED, false));
        assertFalse(SpoilerFree.blocksPush(push("team", 12436870, "football_current_score"), MARKED, false));
        assertFalse(SpoilerFree.blocksPush("{\"icon\":\"start\"}", MARKED, false));
        assertFalse(SpoilerFree.blocksPush("not json", MARKED, false));
        assertFalse(SpoilerFree.blocksPush("", MARKED, false));
        assertFalse(SpoilerFree.blocksPush((String) null, MARKED, false));
    }
}
