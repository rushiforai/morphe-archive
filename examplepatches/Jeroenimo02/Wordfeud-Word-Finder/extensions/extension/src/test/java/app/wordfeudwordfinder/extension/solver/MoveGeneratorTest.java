package app.wordfeudwordfinder.extension.solver;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import app.wordfeudwordfinder.extension.game.BoardLayout;
import app.wordfeudwordfinder.extension.game.GameReplay;
import app.wordfeudwordfinder.extension.game.GameState;
import app.wordfeudwordfinder.extension.game.RawGame;
import app.wordfeudwordfinder.extension.game.ResponseParser;
import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.words.WordGraph;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.BeforeClass;
import org.junit.Test;

public class MoveGeneratorTest {

    private static final long NEIGEN_GAME = 4391319402L;

    private static BoardLayout layout;
    private static Ruleset nl;
    /** Board as replayed from the fixture: NEIGEN (7,7) horizontal plus the opponent's TON at x=10, y=4..6. */
    private static char[][] fixtureBoard;

    // ---- helpers ----

    private static String fixture(String name) {
        try (InputStream in = MoveGeneratorTest.class.getResourceAsStream("/fixtures/" + name)) {
            assertNotNull("missing fixture " + name, in);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new AssertionError(e);
        }
    }

    @BeforeClass
    public static void loadFixture() throws Exception {
        ResponseParser.Parsed p = ResponseParser.parseGamesDetail(fixture("detail_neigen.json"));
        RawGame game = null;
        for (RawGame g : p.games) if (g.getId() == NEIGEN_GAME) game = g;
        assertNotNull(game);
        for (Ruleset r : p.rulesets) if (r.getId() == game.getRulesetId()) nl = r;
        for (BoardLayout b : p.boards) if (b.getId() == game.getBoardId()) layout = b;
        assertNotNull(nl);
        assertNotNull(layout);
        GameState st = GameReplay.replay(game);
        assertNull(st.unreadable());
        fixtureBoard = st.board();
    }

    /** The board right after NEIGEN: the fixture board without the opponent's TON. */
    private static char[][] boardAfterNeigen() {
        char[][] b = copy(fixtureBoard);
        assertEquals('T', b[4][10]);
        assertEquals('O', b[5][10]);
        assertEquals('N', b[6][10]);
        b[4][10] = b[5][10] = b[6][10] = '\0';
        assertEquals("NEIGEN", new String(b[7], 7, 6));
        return b;
    }

    private static char[][] copy(char[][] b) {
        char[][] c = new char[b.length][];
        for (int y = 0; y < b.length; y++) c[y] = b[y].clone();
        return c;
    }

    private static char[][] empty() { return new char[15][15]; }

    private static List<String> rack(String letters) {
        List<String> r = new ArrayList<>();
        for (char c : letters.toCharArray()) r.add(String.valueOf(c));
        return r;
    }

    private static WordGraph words(String... w) { return WordGraph.build(Arrays.asList(w)); }

    private static List<Move> gen(char[][] board, String rack, WordGraph wg) {
        return MoveGenerator.generate(board, rack(rack), layout, nl, wg, new AtomicBoolean(false));
    }

    private static Move find(List<Move> moves, String word, int x, int y, boolean horizontal) {
        Move found = null;
        for (Move m : moves) {
            if (m.word.equals(word) && m.x == x && m.y == y && m.horizontal == horizontal) {
                if (found != null) fail("duplicate move " + m);
                found = m;
            }
        }
        if (found == null) fail("missing " + word + " at (" + x + "," + y + ") " + (horizontal ? "H" : "V") + " in " + moves);
        return found;
    }

    private static boolean coversCenter(Move m) {
        for (int[] p : m.placed) if (p[0] == 7 && p[1] == 7) return true;
        return false;
    }

    private static String placementKey(Move m) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < m.placed.size(); i++) {
            sb.append(m.placed.get(i)[0]).append(',').append(m.placed.get(i)[1]).append('=')
                    .append(m.placedLetters.get(i)).append(';');
        }
        return sb.toString();
    }

    private static void assertNoDuplicatePlacements(List<Move> moves) {
        Set<String> seen = new HashSet<>();
        for (Move m : moves) assertTrue("duplicate placement " + m, seen.add(placementKey(m)));
    }

    // ---- brief tests ----

    @Test
    public void firstMoveNeigen18() {
        List<Move> moves = gen(empty(), "INEENGV", words("NEIGEN"));
        Move m = find(moves, "NEIGEN", 7, 7, true);
        assertEquals(18, m.score);
        assertEquals(6, m.placed.size());
        assertEquals(Arrays.asList("NEIGEN"), m.allWords);
        assertEquals(Arrays.asList("DW:E"), m.bonuses);
        assertFalse(m.usesBoardLetter);
        assertNoDuplicatePlacements(moves);
    }

    @Test
    public void firstMoveMustCoverCenter() {
        List<Move> moves = gen(empty(), "INEENGV", words("NEIGEN", "GEEN", "VEEN", "IN", "EN", "NEE", "GIN", "VIN"));
        assertTrue(moves.size() > 10);
        for (Move m : moves) assertTrue("does not cover the centre: " + m, coversCenter(m));
        assertNoDuplicatePlacements(moves);
    }

    @Test
    public void wroetScores() {
        List<Move> moves = gen(boardAfterNeigen(), "VWTJHOR",
                words("WROET", "ROTJE", "HIJ", "WIT", "VOER", "ROG", "VET"));
        assertEquals(16, find(moves, "WROET", 8, 4, false).score);
        assertEquals(14, find(moves, "ROTJE", 11, 3, false).score);
        assertEquals(10, find(moves, "HIJ", 9, 6, false).score);
        assertEquals(9, find(moves, "WIT", 9, 6, false).score);
        assertEquals(8, find(moves, "VOER", 8, 5, false).score);
        assertEquals(7, find(moves, "ROG", 10, 5, false).score);
        assertEquals(7, find(moves, "VET", 11, 6, false).score);

        Move wroet = find(moves, "WROET", 8, 4, false);
        assertTrue(wroet.usesBoardLetter);
        assertEquals(Arrays.asList("W", "R", "O", "T"), wroet.placedLetters);
        assertEquals(Arrays.asList("DL:W"), wroet.bonuses);
        assertEquals(Arrays.asList("WROET"), wroet.allWords);
        int[][] expected = {{8, 4}, {8, 5}, {8, 6}, {8, 8}};
        for (int i = 0; i < expected.length; i++) {
            assertEquals(expected[i][0], wroet.placed.get(i)[0]);
            assertEquals(expected[i][1], wroet.placed.get(i)[1]);
        }
        assertEquals(Arrays.asList("TL:R"), find(moves, "ROTJE", 11, 3, false).bonuses);
        assertNoDuplicatePlacements(moves);
        for (Move m : moves) assertTrue(m.usesBoardLetter);
    }

    @Test
    public void crossWordScored() {
        // A at (7,7), O at (8,8); a T at (8,7) makes AT (main, horizontal) and TO (cross, vertical).
        char[][] b = empty();
        b[7][7] = 'A';
        b[8][8] = 'O';
        List<Move> moves = gen(b, "T", words("AT", "TO"));
        Move m = find(moves, "AT", 7, 7, true);
        assertEquals(Arrays.asList("AT", "TO"), m.allWords);
        assertEquals(2, m.allWords.size());
        // A1 + T2 = 3 and T2 + O1 = 3, no bonus squares.
        assertEquals(6, m.score);
        assertEquals(1, m.placed.size());
        assertNoDuplicatePlacements(moves);
        // The single tile is reported once: not again as vertical TO with cross word AT.
        for (Move o : moves) {
            assertFalse("single tile reported twice: " + o,
                    o.placed.get(0)[0] == 8 && o.placed.get(0)[1] == 7 && !o.horizontal);
        }
    }

    @Test
    public void crossWordWithBonusSquares() {
        // Plain square: K at (10,6), A at (9,7); an E at (10,7) makes AE (main) and KE (cross).
        char[][] b = empty();
        b[6][10] = 'K';
        b[7][9] = 'A';
        List<Move> moves = gen(b, "E", words("AE", "KE"));
        Move m = find(moves, "AE", 9, 7, true);
        // (10,7) has type 0 on this layout, so plain values: A1+E1 = 2, K3+E1 = 4.
        assertEquals(0, layout.getSquares()[7][10]);
        assertEquals(6, m.score);
        // Now a cross word through a DL square: (10,6) is DL. K at (10,5), A at (9,6); E at (10,6).
        char[][] c = empty();
        c[5][10] = 'K';
        c[6][9] = 'A';
        assertEquals(1, layout.getSquares()[6][10]);
        Move n = find(gen(c, "E", words("AE", "KE")), "AE", 9, 6, true);
        // main A1 + E1*2 = 3, cross K3 + E1*2 = 5
        assertEquals(8, n.score);
        assertEquals(Arrays.asList("DL:E"), n.bonuses);
        // And a DW square: (11,7). K at (11,6), A at (10,7); E at (11,7): main (1+1)*2 = 4, cross (3+1)*2 = 8.
        char[][] d = empty();
        d[6][11] = 'K';
        d[7][10] = 'A';
        Move o = find(gen(d, "E", words("AE", "KE")), "AE", 10, 7, true);
        assertEquals(12, o.score);
        assertEquals(Arrays.asList("DW:E"), o.bonuses);
    }

    @Test
    public void edgesSafe() {
        char[][] b = empty();
        b[0][0] = 'A';    // top-left corner
        b[0][14] = 'A';   // top-right corner
        b[14][0] = 'A';   // bottom-left corner
        b[14][14] = 'A';  // bottom-right corner
        b[7][14] = 'A';   // right edge
        b[7][0] = 'A';    // left edge
        b[0][7] = 'A';    // top edge
        b[14][7] = 'A';   // bottom edge
        WordGraph wg = words("AB", "BA", "ABA", "BAB", "ABBA", "BB");
        List<Move> moves = gen(b, "BBBBBBB", wg);
        assertFalse(moves.isEmpty());
        for (Move m : moves) {
            for (int[] p : m.placed) {
                assertTrue("off board: " + m, p[0] >= 0 && p[0] < 15 && p[1] >= 0 && p[1] < 15);
                assertEquals("square already taken: " + m, '\0', b[p[1]][p[0]]);
            }
            int len = m.word.length();
            assertTrue(m.x >= 0 && m.y >= 0);
            assertTrue("word leaves the board: " + m, (m.horizontal ? m.x : m.y) + len <= 15);
            for (String w : m.allWords) assertTrue(w + " not a word in " + m, wg.contains(w));
        }
        // BA through the right-edge A: B at (13,7).
        find(moves, "BA", 13, 7, true);
        // AB from the left-edge A: B at (1,7).
        find(moves, "AB", 0, 7, true);
        // AB from the corner (14,14) cannot go right or down; only BA (from the left or from above).
        find(moves, "BA", 13, 14, true);
        find(moves, "BA", 14, 13, false);
        for (Move m : moves) {
            assertFalse("would need x=15: " + m, m.horizontal && m.y == 14 && m.x == 14);
            assertFalse("would need y=15: " + m, !m.horizontal && m.x == 14 && m.y == 14);
        }
        assertNoDuplicatePlacements(moves);
    }

    @Test
    public void crossWordsTruncatedAtEdge() {
        // A tile on row 0 next to a letter at row 1: the cross word starts at row 0, nothing above.
        char[][] b = empty();
        b[1][3] = 'B';
        b[0][2] = 'A';
        // Placing B at (3,0) gives main AB (row 0) and cross BB (column 3, rows 0..1).
        Move m = find(gen(b, "B", words("AB", "BB")), "AB", 2, 0, true);
        assertEquals(Arrays.asList("AB", "BB"), m.allWords);
        // (3,0) is a plain square: main A1 + B4 = 5, cross B4 + B4 = 8.
        assertEquals(0, layout.getSquares()[0][3]);
        assertEquals(13, m.score);
    }

    @Test
    public void noBlankMovesWhileDisabled() {
        char[][] b = boardAfterNeigen();
        WordGraph wg = words("NEIGENS", "SNEIGEN", "VET", "VEST", "ES", "NA");
        for (String blank : new String[] {"?", "*"}) {
            List<String> r = new ArrayList<>(Arrays.asList(blank, "V", "T"));
            List<Move> moves = MoveGenerator.generate(b, r, layout, nl, wg, new AtomicBoolean(false), false);
            assertFalse(moves.isEmpty()); // VET via the E of NEIGEN
            for (Move m : moves) {
                for (String l : m.placedLetters) {
                    assertTrue("blank used in " + m, l.equals("V") || l.equals("T"));
                }
            }
        }
        // Only a blank on the rack: nothing.
        assertTrue(MoveGenerator.generate(b, rack("?"), layout, nl, wg, new AtomicBoolean(false), false).isEmpty());
    }

    @Test
    public void blanksOnByDefault() {
        assertTrue(Rules.BLANKS_ENABLED);
        char[][] b = boardAfterNeigen();
        assertFalse(MoveGenerator.generate(b, rack("?"), layout, nl, words("NEIGENS"), new AtomicBoolean(false))
                .isEmpty());
    }

    @Test
    public void blanksSupportedWhenEnabled() {
        char[][] b = boardAfterNeigen();
        WordGraph wg = words("NEIGENS");
        for (String blank : new String[] {"?", "*"}) {
            List<Move> moves = MoveGenerator.generate(b, Arrays.asList(blank), layout, nl, wg,
                    new AtomicBoolean(false), true);
            Move m = find(moves, "NEIGENS", 7, 7, true);
            assertEquals(Arrays.asList("s"), m.placedLetters);
            // N1 E1 I2 G3 E1 N1 existing, blank on (13,7) counts 0; no word multiplier on old tiles.
            assertEquals(9, m.score);
        }
    }

    @Test
    public void cancelStops() {
        List<Move> moves = MoveGenerator.generate(empty(), rack("INEENGV"), layout, nl, words("NEIGEN"),
                new AtomicBoolean(true));
        assertTrue(moves.isEmpty());
    }

    @Test
    public void sevenTileMoveGetsBonus40() {
        // V5 confirmed 2026-11-02: a 7-tile move listed at 36 was awarded 76 by Wordfeud
        assertEquals(40, Rules.BINGO_BONUS);
        assertEquals(7, Rules.CENTER);
        List<Move> moves = gen(empty(), "NEIGENS", words("NEIGENS"));
        Move m = find(moves, "NEIGENS", 7, 7, true);
        assertEquals(7, m.placed.size());
        // N1 E1 I2 G3 E1 N1 S2 = 11, DW at (11,7) -> 22, plus 40
        assertEquals(62, m.score);
    }

    @Test
    public void sixTileMoveGetsNoBonus() {
        List<Move> moves = gen(empty(), "NEIGENS", words("NEIGEN", "NEIGENS"));
        Move m = find(moves, "NEIGEN", 7, 7, true);
        assertEquals(6, m.placed.size());
        assertEquals(18, m.score);
    }

    @Test
    public void emptyingAShortRackGetsNoBonus() {
        // end of game: only six tiles left; placing all of them is not a 7-tile move
        List<Move> moves = gen(empty(), "NEIGEN", words("NEIGEN"));
        Move m = find(moves, "NEIGEN", 7, 7, true);
        assertEquals(6, m.placed.size());
        assertEquals(18, m.score);
    }

    @Test
    public void everyGeneratedWordIsInTheGraph() {
        WordGraph wg = randomWords(5000, 7);
        List<Move> moves = MoveGenerator.generate(fixtureBoard, rack("VWTJHOR"), layout, nl, wg, new AtomicBoolean(false));
        for (Move m : moves) {
            assertTrue(m.word.length() >= 2);
            for (String w : m.allWords) assertTrue(w, wg.contains(w));
            for (int[] p : m.placed) assertEquals('\0', fixtureBoard[p[1]][p[0]]);
        }
        assertNoDuplicatePlacements(moves);
    }

    @Test
    public void matchesBruteForce() {
        List<String> dict = randomWordList(2500, 5);
        dict.addAll(Arrays.asList("NEIGEN", "WROET", "ROTJE", "HIJ", "WIT", "VOER", "ROG", "VET", "TON", "TONG"));
        WordGraph wg = WordGraph.build(dict);
        Object[][] cases = {
                {fixtureBoard, "VWTJHOR"},
                {boardAfterNeigen(), "VWTJHOR"},
                {empty(), "EENRTOA"},
                {fixtureBoard, "EENNA"},
        };
        for (Object[] cs : cases) {
            char[][] b = (char[][]) cs[0];
            String rk = (String) cs[1];
            List<String> got = new ArrayList<>();
            for (Move m : gen(b, rk, wg)) got.add(key(m.word, m.x, m.y, m.horizontal, m.score, m.allWords));
            List<String> want = bruteForce(b, rk, new HashSet<>(dict));
            java.util.Collections.sort(got);
            java.util.Collections.sort(want);
            assertFalse(want.isEmpty());
            assertEquals("rack " + rk, want, got);
        }
    }

    private static String key(String w, int x, int y, boolean h, int score, List<String> all) {
        return w + "|" + x + "," + y + "|" + (h ? "H" : "V") + "|" + score + "|" + all;
    }

    /** Independent oracle: tries every dictionary word at every start square and direction. */
    private static List<String> bruteForce(char[][] b, String rk, Set<String> dict) {
        int[][] sq = layout.getSquares();
        boolean emptyBoard = true;
        for (char[] r : b) for (char c : r) if (c != '\0') emptyBoard = false;
        List<String> out = new ArrayList<>();
        for (String w : dict) {
            if (w.length() < 2) continue;
            for (int dir = 0; dir < 2; dir++) {
                boolean h = dir == 0;
                int dx = h ? 1 : 0, dy = h ? 0 : 1;
                for (int y = 0; y < 15; y++) {
                    for (int x = 0; x < 15; x++) {
                        int ex = x + dx * (w.length() - 1), ey = y + dy * (w.length() - 1);
                        if (ex > 14 || ey > 14) continue;
                        if (x - dx >= 0 && y - dy >= 0 && b[y - dy][x - dx] != '\0') continue;
                        if (ex + dx <= 14 && ey + dy <= 14 && b[ey + dy][ex + dx] != '\0') continue;
                        List<Character> pool = new ArrayList<>();
                        for (char c : rk.toCharArray()) pool.add(c);
                        boolean ok = true, connected = false, usesBoard = false;
                        int placed = 0, main = 0, mult = 1, cross = 0;
                        List<String> all = new ArrayList<>();
                        all.add(w);
                        int lastNewX = -1, lastNewY = -1;
                        for (int i = 0; i < w.length() && ok; i++) {
                            int cx = x + dx * i, cy = y + dy * i;
                            char ch = w.charAt(i);
                            int v = nl.getTilePoints().get(String.valueOf(ch));
                            if (b[cy][cx] != '\0') {
                                if (b[cy][cx] != ch) ok = false;
                                main += v;
                                usesBoard = true;
                                continue;
                            }
                            if (!pool.remove((Character) ch)) { ok = false; break; }
                            placed++;
                            lastNewX = cx;
                            lastNewY = cy;
                            int t = sq[cy][cx];
                            int lm = t == 1 ? 2 : t == 2 ? 3 : 1, wm = t == 3 ? 2 : t == 4 ? 3 : 1;
                            main += v * lm;
                            mult *= wm;
                            if (emptyBoard && cx == 7 && cy == 7) connected = true;
                            int[][] nb = {{cx - 1, cy}, {cx + 1, cy}, {cx, cy - 1}, {cx, cy + 1}};
                            for (int[] p : nb) {
                                if (p[0] >= 0 && p[0] < 15 && p[1] >= 0 && p[1] < 15 && b[p[1]][p[0]] != '\0') connected = true;
                            }
                            // cross word, perpendicular
                            int px = dy, py = dx;
                            int sx = cx, sy = cy;
                            while (sx - px >= 0 && sy - py >= 0 && b[sy - py][sx - px] != '\0') { sx -= px; sy -= py; }
                            StringBuilder cw = new StringBuilder();
                            int csum = 0;
                            for (int qx = sx, qy = sy; qx < 15 && qy < 15 && (b[qy][qx] != '\0' || (qx == cx && qy == cy)); qx += px, qy += py) {
                                char cc = (qx == cx && qy == cy) ? ch : b[qy][qx];
                                cw.append(cc);
                                csum += (qx == cx && qy == cy) ? v * lm : nl.getTilePoints().get(String.valueOf(cc));
                            }
                            if (cw.length() > 1) {
                                if (!dict.contains(cw.toString())) ok = false;
                                all.add(cw.toString());
                                cross += csum * wm;
                            }
                        }
                        if (!ok || placed == 0 || !connected) continue;
                        if (!h && placed == 1) {
                            // reported by the horizontal orientation when the tile also has a horizontal word
                            boolean hNeighbour = (lastNewX > 0 && b[lastNewY][lastNewX - 1] != '\0')
                                    || (lastNewX < 14 && b[lastNewY][lastNewX + 1] != '\0');
                            if (hNeighbour) continue;
                        }
                        int score = main * mult + cross + (placed == 7 ? Rules.BINGO_BONUS : 0);
                        out.add(key(w, x, y, h, score, all));
                    }
                }
            }
        }
        return out;
    }

    @Test
    public void performanceSanity() {
        WordGraph wg = randomWords(50000, 11);
        long t0 = System.nanoTime();
        List<Move> moves = MoveGenerator.generate(fixtureBoard, rack("VWTJHOR"), layout, nl, wg, new AtomicBoolean(false));
        long ms = (System.nanoTime() - t0) / 1_000_000;
        assertTrue("took " + ms + " ms", ms < 2000);
        assertNotNull(moves);
    }

    /**
     * Two blanks on a busy board (V2 experiment): the search grows a lot, it must still finish in time. The board is
     * filled by playing the best move for random racks a number of times.
     */
    @Test
    public void performanceWithTwoBlanksOnABusyBoard() {
        WordGraph wg = randomWords(50000, 11);
        char[][] b = busyBoard(wg, 12, 5);
        int tiles = 0;
        for (char[] row : b) for (char c : row) if (c != '\0') tiles++;
        assertTrue("board has " + tiles + " tiles", tiles >= 30);
        long t0 = System.nanoTime();
        List<Move> moves = MoveGenerator.generate(b, rack("??ENRTA"), layout, nl, wg, new AtomicBoolean(false), true);
        long ms = (System.nanoTime() - t0) / 1_000_000;
        assertTrue("took " + ms + " ms", ms < 5000);
        assertTrue(moves.size() + " moves", moves.size() <= MoveGenerator.MAX_MOVES);
        boolean usesBlank = false;
        for (Move m : moves) for (String l : m.placedLetters) usesBlank |= Character.isLowerCase(l.charAt(0));
        assertTrue(usesBlank);
        // The cap keeps the best: same top move as an uncapped run.
        List<Move> all = MoveGenerator.generate(b, rack("??ENRTA"), layout, nl, wg, new AtomicBoolean(false), true,
                Integer.MAX_VALUE);
        System.out.println("two blanks, " + tiles + " tiles: " + moves.size() + " of " + all.size() + " moves in "
                + ms + " ms");
        assertTrue(all.size() > moves.size());
        List<Move> sorted = MoveSorter.sort(all, SortMode.SCORE);
        assertEquals(sorted.get(0).toString(), moves.get(0).toString());
        assertEquals(sorted.get(moves.size() - 1).toString(), moves.get(moves.size() - 1).toString());
        assertNoDuplicatePlacements(moves);
    }

    @Test
    public void blankVariantOnlyWhenItScoresMore() {
        // EE with E, E and a blank: the variants with a blank score less, only the real tiles are listed.
        List<Move> moves = MoveGenerator.generate(empty(), rack("EE?"), layout, nl, words("EE"),
                new AtomicBoolean(false), true);
        Move m = find(moves, "EE", 6, 7, true); // find() fails on a duplicate word and placement
        assertEquals(Arrays.asList("E", "E"), m.placedLetters);
        // One E and a blank: (E,e) and (e,E) are the same placement; one is kept, the blank on the plainer square.
        List<Move> one = MoveGenerator.generate(empty(), rack("E?"), layout, nl, words("EE"),
                new AtomicBoolean(false), true);
        for (Move x : one) assertEquals(1, MoveCollector.blanks(x));
        assertNoDuplicatePlacements(one);
        java.util.Set<String> seen = new HashSet<>();
        for (Move x : one) assertTrue("duplicate " + x, seen.add(x.word + x.x + "," + x.y + x.horizontal));
    }

    @Test
    public void capKeepsTheBestInScoreOrder() {
        WordGraph wg = randomWords(5000, 7);
        List<Move> all = MoveGenerator.generate(fixtureBoard, rack("VWTJHOR"), layout, nl, wg,
                new AtomicBoolean(false), false, Integer.MAX_VALUE);
        assertTrue(all.size() > 20);
        List<Move> top = MoveGenerator.generate(fixtureBoard, rack("VWTJHOR"), layout, nl, wg,
                new AtomicBoolean(false), false, 20);
        assertEquals(20, top.size());
        List<Move> sorted = MoveSorter.sort(all, SortMode.SCORE);
        for (int i = 0; i < 20; i++) assertEquals(sorted.get(i).toString(), top.get(i).toString());
    }

    @Test
    public void cancelStopsInsideTheSearch() throws Exception {
        WordGraph wg = randomWords(50000, 11);
        char[][] b = busyBoard(wg, 12, 5);
        AtomicBoolean cancel = new AtomicBoolean(false);
        long[] stoppedAt = new long[1];
        int[] found = {-1};
        Thread t = new Thread(() -> {
            found[0] = MoveGenerator.generate(b, rack("???ENRT"), layout, nl, wg, cancel, true).size();
            stoppedAt[0] = System.nanoTime();
        });
        t.start();
        Thread.sleep(20);
        long cancelledAt = System.nanoTime();
        cancel.set(true);
        t.join(5000);
        assertFalse(t.isAlive());
        assertEquals(0, found[0]); // a cancelled search returns nothing
        if (stoppedAt[0] > cancelledAt) {
            long ms = (stoppedAt[0] - cancelledAt) / 1_000_000;
            assertTrue("stopped " + ms + " ms after cancel", ms < 100);
        }
    }

    /** Plays the best (blank-free) move for {@code turns} random racks, starting on an empty board. */
    private static char[][] busyBoard(WordGraph wg, int turns, long seed) {
        Random rnd = new Random(seed);
        String bag = "EEEEENNNNAAIIOORRTTDSGKLMVWJHUBPZ";
        char[][] b = empty();
        for (int turn = 0; turn < turns; turn++) {
            StringBuilder r = new StringBuilder();
            for (int i = 0; i < 7; i++) r.append(bag.charAt(rnd.nextInt(bag.length())));
            List<Move> moves = MoveGenerator.generate(b, rack(r.toString()), layout, nl, wg, new AtomicBoolean(false),
                    false);
            Move best = null;
            for (Move m : moves) if (best == null || m.score > best.score) best = m;
            if (best == null) continue;
            for (int i = 0; i < best.placed.size(); i++) {
                int[] xy = best.placed.get(i);
                b[xy[1]][xy[0]] = best.placedLetters.get(i).charAt(0);
            }
        }
        return b;
    }

    private static WordGraph randomWords(int count, long seed) {
        return WordGraph.build(randomWordList(count, seed));
    }

    /** Random "words" over a skewed alphabet so that many of them are playable. */
    private static List<String> randomWordList(int count, long seed) {
        Random rnd = new Random(seed);
        String letters = "EEEEENNNNAAIIOORRTTDSGKLMVWJHUBPZ";
        List<String> list = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            int len = 2 + rnd.nextInt(7);
            StringBuilder sb = new StringBuilder();
            for (int k = 0; k < len; k++) sb.append(letters.charAt(rnd.nextInt(letters.length())));
            list.add(sb.toString());
        }
        return list;
    }
}
