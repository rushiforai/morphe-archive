package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.wordfeudwordfinder.extension.core.WfError;
import java.time.Instant;
import org.junit.Test;

public class ErrorDetailsTest {
    @Test
    public void format() {
        String s = ErrorDetails.format(WfError.wlNet(), "5.7.1", "1.0.0", 2,
                Instant.parse("2026-11-01T12:34:56Z"));
        assertEquals("code=WL-NET\nwordfeud=5.7.1\npatch=1.0.0\nruleset=2\ntime=2026-11-01T12:34:56Z", s);
    }

    @Test
    public void formatKeepsMillisAndFullCode() {
        String s = ErrorDetails.format(WfError.mvServer("not_your_turn"), "5.7.1", "dev", 14,
                Instant.parse("2026-01-02T03:04:05.678Z"));
        assertEquals("code=MV-SERVER-not_your_turn\nwordfeud=5.7.1\npatch=dev\nruleset=14\n"
                + "time=2026-01-02T03:04:05.678Z", s);
    }

    @Test
    public void detailLineFromMessage() {
        String s = ErrorDetails.format(WfError.gsData("event 12 packed_move: letter Q not on rack [A, B, *]"),
                "5.7.1", "dev", 2, Instant.parse("2026-11-01T00:00:00Z"));
        assertEquals("code=GS-DATA\ndetail=event 12 packed_move: letter Q not on rack [A, B, *]\n"
                + "wordfeud=5.7.1\npatch=dev\nruleset=2\ntime=2026-11-01T00:00:00Z", s);
    }

    @Test
    public void detailIsOneLineAndCapped() {
        StringBuilder sb = new StringBuilder("a\r\nb\nc");
        for (int i = 0; i < 400; i++) sb.append('x');
        String s = ErrorDetails.format(WfError.gsData(sb.toString()), "w", "p", 1, 0L);
        String detail = s.split("\n")[1];
        assertEquals("detail=a  b c" + "x".repeat(ErrorDetails.MAX_DETAIL - 6), detail);
        assertEquals(6, s.split("\n").length);
    }

    @Test
    public void noDetailLineWithoutMessage() {
        assertEquals("code=WL-NET\nwordfeud=w\npatch=p\nruleset=1\ntime=1970-01-01T00:00:00Z",
                ErrorDetails.format(WfError.wlNet(), "w", "p", 1, 0L));
        assertEquals("code=unknown\nwordfeud=w\npatch=p\nruleset=1\ntime=1970-01-01T00:00:00Z",
                ErrorDetails.format(null, "w", "p", 1, 0L));
    }

    @Test
    public void unknownValues() {
        String s = ErrorDetails.format(WfError.gsData("secret detail"), null, "", -1,
                Instant.parse("2026-11-01T00:00:00Z"));
        assertEquals("code=GS-DATA\ndetail=secret detail\nwordfeud=unknown\npatch=unknown\nruleset=unknown\n"
                + "time=2026-11-01T00:00:00Z", s);
    }

    @Test
    public void millisOverloadMatchesInstantText() {
        long[] samples = {0L, 1L, 999L, 1_000L, 1_793_449_296_000L, 1_793_449_296_005L, 1_767_323_045_678L,
                951_782_400_123L /* 2000-02-29 */};
        for (long ms : samples) {
            assertEquals(Long.toString(ms), Instant.ofEpochMilli(ms).toString(), ErrorDetails.isoUtc(ms));
            assertEquals(ErrorDetails.format(WfError.wlHash(), "a", "b", 1, Instant.ofEpochMilli(ms)),
                    ErrorDetails.format(WfError.wlHash(), "a", "b", 1, ms));
        }
    }

    @Test
    public void retryOnlyForWordListErrorsThatCanSucceed() {
        assertTrue(ErrorDetails.retryable(WfError.wlNet()));
        assertTrue(ErrorDetails.retryable(WfError.wlHttp(503)));
        assertTrue(ErrorDetails.retryable(WfError.wlHash()));
        assertTrue(ErrorDetails.retryable(WfError.wlDisk()));
        assertFalse(ErrorDetails.retryable(WfError.wlNone()));
        assertFalse(ErrorDetails.retryable(WfError.gsData("x")));
        assertFalse(ErrorDetails.retryable(WfError.gsEvent("swap")));
        assertFalse(ErrorDetails.retryable(WfError.mvSession()));
        assertFalse(ErrorDetails.retryable(WfError.mvNet()));
        assertFalse(ErrorDetails.retryable(WfError.mvServer("x")));
        assertFalse(ErrorDetails.retryable(null));
    }

    @Test
    public void refreshDiagnosticLineWhenPresent() {
        String base = "code=WL-NET\nwordfeud=5.7.1\npatch=dev\nruleset=2\ntime=1970-01-01T00:00:00Z";
        assertEquals(base, ErrorDetails.format(WfError.wlNet(), "5.7.1", "dev", 2, 0L, null));
        assertEquals(base, ErrorDetails.format(WfError.wlNet(), "5.7.1", "dev", 2, 0L, " "));
        assertEquals(base + "\nrefresh=RouteBounce: jni=none",
                ErrorDetails.format(WfError.wlNet(), "5.7.1", "dev", 2, 0L, "RouteBounce:\njni=none"));
    }

    @Test
    public void routeAndStoreLinesWhenPresent() {
        String base = "code=GS-DATA\ndetail=game not loaded yet\nwordfeud=5.7.1\npatch=dev\nruleset=unknown"
                + "\ntime=1970-01-01T00:00:00Z";
        WfError e = WfError.gsData("game not loaded yet");
        assertEquals(base, ErrorDetails.format(e, "5.7.1", "dev", -1, 0L, null, null, null));
        app.wordfeudwordfinder.extension.game.GameStore.DetailSummary d =
                new app.wordfeudwordfinder.extension.game.GameStore.DetailSummary(1000L, 3,
                        java.util.Arrays.asList(77L), 1, 0, null, 12);
        assertEquals(base + "\nrefresh=x\nroute=/game/123\nstore=games/detail 1970-01-01T00:00:01Z: games=3 failed=1"
                + " [77] skipped=0 known=12",
                ErrorDetails.format(e, "5.7.1", "dev", -1, 0L, "x", "/game/123", d));
        assertEquals(base + "\nroute=/game/1 ", ErrorDetails.format(e, "5.7.1", "dev", -1, 0L, null, "/game/1\n", null));
    }

    @Test
    public void storeLineHoldsTheOpenGamesSource() {
        app.wordfeudwordfinder.extension.game.GameStore.DetailSummary d =
                new app.wordfeudwordfinder.extension.game.GameStore.DetailSummary(1000L, 3,
                        new java.util.ArrayList<Long>(), 0, 0, null, 12);
        app.wordfeudwordfinder.extension.game.GameStore.UpdateSource src =
                new app.wordfeudwordfinder.extension.game.GameStore.UpdateSource("game/<id>/move/", 2000L,
                        1793538961.5, false, "user/games/detail/", 3000L);
        assertEquals("games/detail 1970-01-01T00:00:01Z: games=3 failed=0 skipped=0 known=12; game 7: "
                + "game/<id>/move/ 1970-01-01T00:00:02Z updated=1793538961 turn=other skipped user/games/detail/ "
                + "1970-01-01T00:00:03Z", ErrorDetails.storeLine(d, 7L, src));
        assertEquals("game 7: unknown", ErrorDetails.storeLine(null, 7L, null));
        assertNull(ErrorDetails.storeLine(null, null, src));
        app.wordfeudwordfinder.extension.game.GameStore.UpdateSource plain =
                new app.wordfeudwordfinder.extension.game.GameStore.UpdateSource("game/<id>/", 0L, -1, true, null, 0L);
        String text = ErrorDetails.format(null, "w", "p", 2, 0L, null, null, null, 7L, plain);
        assertTrue(text, text.endsWith("\nstore=game 7: game/<id>/ 1970-01-01T00:00:00Z turn=me"));
    }

    @Test
    public void serverLineWhenPresent() {
        WfError e = WfError.mvServer("illegal_word");
        String base = ErrorDetails.format(e, "5.7.1", "dev", 2, 0L, null, null, null, null, null);
        assertEquals(base, ErrorDetails.format(e, "5.7.1", "dev", 2, 0L, null, null, null, null, null, null));
        assertEquals(base + "\nserver=type=illegal_word keys=type",
                ErrorDetails.format(e, "5.7.1", "dev", 2, 0L, null, null, null, null, null,
                        "type=illegal_word keys=type"));
    }
}
