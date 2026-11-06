package app.wordfeudwordfinder.extension.solver;

import app.wordfeudwordfinder.extension.game.BoardLayout;
import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.words.WordGraph;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Appel-Jacobson move generation (spec section 7): anchor squares, cross-checks per square, left part plus
 * extension to the right. Vertical moves are found by running the same row pass on the transposed board.
 *
 * <p>Board letters: an upper-case char is a normal tile. A lower-case char that is not itself a key of the
 * ruleset's tile points is taken to be a blank showing that letter (worth 0); it is matched in upper case.
 */
public final class MoveGenerator {
    private MoveGenerator() {}

    private static final String[] BONUS = {null, "DL", "TL", "DW", "TW"};
    private static final int[] LETTER_MULT = {1, 2, 3, 1, 1};
    private static final int[] WORD_MULT = {1, 1, 1, 2, 3};

    /**
     * Most moves returned: with two blanks the full list easily holds 100k+ moves, too much memory inside the host
     * app. The best ones by score are kept ({@link MoveCollector}).
     */
    public static final int MAX_MOVES = 3000;

    /**
     * The best {@link #MAX_MOVES} legal moves, best first ({@link MoveSorter#BEST_FIRST}), one per word and
     * placement (the highest-scoring blank/no-blank variant).
     */
    public static List<Move> generate(char[][] board, List<String> rack, BoardLayout layout, Ruleset rs,
                                      WordGraph wg, AtomicBoolean cancel) {
        return generate(board, rack, layout, rs, wg, cancel, Rules.BLANKS_ENABLED);
    }

    /** As {@link #generate(char[][], List, BoardLayout, Ruleset, WordGraph, AtomicBoolean)}; tests can allow blanks. */
    static List<Move> generate(char[][] board, List<String> rack, BoardLayout layout, Ruleset rs, WordGraph wg,
                               AtomicBoolean cancel, boolean allowBlanks) {
        return generate(board, rack, layout, rs, wg, cancel, allowBlanks, MAX_MOVES);
    }

    /** Tests can also change the cap. */
    static List<Move> generate(char[][] board, List<String> rack, BoardLayout layout, Ruleset rs, WordGraph wg,
                               AtomicBoolean cancel, boolean allowBlanks, int maxMoves) {
        if (cancel == null) cancel = new AtomicBoolean(false);
        if (cancel.get() || board == null || rack == null || layout == null || wg == null) {
            return Collections.emptyList();
        }
        final int n = Rules.SIZE;
        int[][] squares = layout.getSquares();
        if (board.length != n || squares.length != n) return Collections.emptyList();

        Map<Character, Integer> values = new HashMap<>();
        if (rs != null) {
            for (Map.Entry<String, Integer> e : rs.getTilePoints().entrySet()) {
                char c = app.wordfeudwordfinder.extension.core.Tiles.code(e.getKey()); // "CH" -> its code
                if (c != 0 && e.getValue() != null) values.put(c, e.getValue());
            }
        }

        // Normalised board: word letters plus a blank flag.
        char[][] letters = new char[n][n];
        boolean[][] blank = new boolean[n][n];
        boolean emptyBoard = true;
        for (int y = 0; y < n; y++) {
            if (board[y] == null || board[y].length != n || squares[y].length != n) return Collections.emptyList();
            for (int x = 0; x < n; x++) {
                char c = board[y][x];
                if (c == '\0') continue;
                emptyBoard = false;
                if (Character.isLowerCase(c) && !values.containsKey(c)) {
                    letters[y][x] = Character.toUpperCase(c);
                    blank[y][x] = true;
                } else {
                    letters[y][x] = c;
                }
            }
        }

        // Rack: distinct letters with counts, plus blanks.
        List<Character> distinct = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();
        int blanks = 0;
        for (String t : rack) {
            if (t == null) continue;
            if (Rules.isBlank(t)) {
                blanks++;
                continue;
            }
            if (t.length() != 1) continue;
            char c = t.charAt(0);
            int i = distinct.indexOf(c);
            if (i < 0) {
                distinct.add(c);
                counts.add(1);
            } else {
                counts.set(i, counts.get(i) + 1);
            }
        }
        if (!allowBlanks) blanks = 0;
        char[] rackChars = new char[distinct.size()];
        int[] rackCounts = new int[distinct.size()];
        for (int i = 0; i < rackChars.length; i++) {
            rackChars[i] = distinct.get(i);
            rackCounts[i] = counts.get(i);
        }
        if (rackChars.length == 0 && blanks == 0) return Collections.emptyList();

        MoveCollector out = new MoveCollector(maxMoves);
        for (int pass = 0; pass < 2; pass++) {
            boolean horizontal = pass == 0;
            char[][] g = horizontal ? letters : transpose(letters);
            boolean[][] gb = horizontal ? blank : transpose(blank);
            int[][] sq = horizontal ? squares : transpose(squares);
            Pass p = new Pass(g, gb, sq, horizontal, emptyBoard, wg, values, rackChars, rackCounts, blanks,
                    cancel, out);
            if (!p.run()) return Collections.emptyList();
        }
        if (cancel.get()) return Collections.emptyList();
        return out.result();
    }

    private static char[][] transpose(char[][] a) {
        char[][] t = new char[a.length][a.length];
        for (int y = 0; y < a.length; y++) for (int x = 0; x < a.length; x++) t[x][y] = a[y][x];
        return t;
    }

    private static boolean[][] transpose(boolean[][] a) {
        boolean[][] t = new boolean[a.length][a.length];
        for (int y = 0; y < a.length; y++) for (int x = 0; x < a.length; x++) t[x][y] = a[y][x];
        return t;
    }

    private static int[][] transpose(int[][] a) {
        int[][] t = new int[a.length][a.length];
        for (int y = 0; y < a.length; y++) for (int x = 0; x < a.length; x++) t[x][y] = a[y][x];
        return t;
    }

    /**
     * One orientation. Works on rows of {@code g}: words run along a row (index c), cross words along a column
     * (index r). For the vertical pass {@code g} is the transposed board, so r is the board x and c the board y.
     */
    private static final class Pass {
        final int n = Rules.SIZE;
        final char[][] g;
        final boolean[][] gBlank;
        final int[][] sq;
        final boolean horizontal;
        final boolean emptyBoard;
        final WordGraph wg;
        final Map<Character, Integer> values;
        final char[] rackChars;
        final int[] rackCounts;
        int blanks;
        final AtomicBoolean cancel;
        final MoveCollector out;

        // Per-square cross-check data for the current orientation.
        final boolean[][] anchor;
        final boolean[][] hasCross;
        /** Letters allowed on an empty square because of its cross word; null when there is no cross word. */
        final String[][] allowed;
        final int[][] crossSum;
        final String[][] crossPrefix;
        final String[][] crossSuffix;

        // Word under construction in the current row.
        int row;
        int anchorCol;
        final char[] word = new char[Rules.SIZE];
        final boolean[] isNew = new boolean[Rules.SIZE];
        final boolean[] isBlankTile = new boolean[Rules.SIZE];
        int placedCount;

        Pass(char[][] g, boolean[][] gBlank, int[][] sq, boolean horizontal, boolean emptyBoard, WordGraph wg,
             Map<Character, Integer> values, char[] rackChars, int[] rackCounts, int blanks,
             AtomicBoolean cancel, MoveCollector out) {
            this.g = g;
            this.gBlank = gBlank;
            this.sq = sq;
            this.horizontal = horizontal;
            this.emptyBoard = emptyBoard;
            this.wg = wg;
            this.values = values;
            this.rackChars = rackChars;
            this.rackCounts = rackCounts.clone();
            this.blanks = blanks;
            this.cancel = cancel;
            this.out = out;
            anchor = new boolean[n][n];
            hasCross = new boolean[n][n];
            allowed = new String[n][n];
            crossSum = new int[n][n];
            crossPrefix = new String[n][n];
            crossSuffix = new String[n][n];
        }

        int value(char c, boolean isBlank) {
            if (isBlank) return 0;
            Integer v = values.get(c);
            return v == null ? 0 : v;
        }

        /** Returns false when cancelled. */
        boolean run() {
            computeCrossChecks();
            for (int r = 0; r < n; r++) {
                row = r;
                for (int c = 0; c < n; c++) {
                    if (!anchor[r][c]) continue;
                    if (cancel.get()) return false;
                    anchorCol = c;
                    if (c > 0 && g[r][c - 1] != '\0') {
                        // Fixed left part: the board letters directly left of the anchor.
                        int start = c - 1;
                        while (start > 0 && g[r][start - 1] != '\0') start--;
                        int node = wg.root();
                        int len = 0;
                        for (int k = start; k < c && node >= 0; k++) {
                            node = wg.child(node, g[r][k]);
                            word[len] = g[r][k];
                            isNew[len] = false;
                            isBlankTile[len] = gBlank[r][k];
                            len++;
                        }
                        if (node >= 0) extendRight(start, c, node, len);
                    } else {
                        int limit = 0;
                        for (int k = c - 1; k >= 0 && g[r][k] == '\0' && !anchor[r][k]; k--) limit++;
                        leftPart(wg.root(), 0, limit);
                    }
                }
            }
            return !cancel.get();
        }

        private void computeCrossChecks() {
            StringBuilder pre = new StringBuilder();
            StringBuilder suf = new StringBuilder();
            for (int r = 0; r < n; r++) {
                for (int c = 0; c < n; c++) {
                    if (g[r][c] != '\0') continue;
                    boolean up = r > 0 && g[r - 1][c] != '\0';
                    boolean down = r < n - 1 && g[r + 1][c] != '\0';
                    boolean left = c > 0 && g[r][c - 1] != '\0';
                    boolean right = c < n - 1 && g[r][c + 1] != '\0';
                    anchor[r][c] = up || down || left || right
                            || (emptyBoard && r == Rules.CENTER && c == Rules.CENTER);
                    if (!up && !down) continue;
                    hasCross[r][c] = true;
                    pre.setLength(0);
                    suf.setLength(0);
                    int sum = 0;
                    int k = r;
                    while (k > 0 && g[k - 1][c] != '\0') k--;
                    for (; k < r; k++) {
                        pre.append(g[k][c]);
                        sum += value(g[k][c], gBlank[k][c]);
                    }
                    for (k = r + 1; k < n && g[k][c] != '\0'; k++) {
                        suf.append(g[k][c]);
                        sum += value(g[k][c], gBlank[k][c]);
                    }
                    crossSum[r][c] = sum;
                    crossPrefix[r][c] = pre.toString();
                    crossSuffix[r][c] = suf.toString();
                    StringBuilder ok = new StringBuilder();
                    int node = wg.walk(wg.root(), pre);
                    if (node >= 0) {
                        for (int e = wg.edgeStart(node); e < wg.edgeEnd(node); e++) {
                            int end = wg.walk(wg.edgeTarget(e), suf);
                            if (end >= 0 && wg.isTerminal(end)) ok.append(wg.edgeChar(e));
                        }
                    }
                    allowed[r][c] = ok.toString();
                }
            }
        }

        /** Builds left parts of up to {@code limit} tiles on the empty, non-anchor squares left of the anchor. */
        private void leftPart(int node, int len, int limit) {
            if (cancel.get()) return; // checked per step: with blanks one anchor can take long
            extendRight(anchorCol - len, anchorCol, node, len);
            if (limit <= 0) return;
            for (int e = wg.edgeStart(node); e < wg.edgeEnd(node); e++) {
                char ch = wg.edgeChar(e);
                int child = wg.edgeTarget(e);
                int i = rackIndex(ch);
                if (i >= 0) {
                    rackCounts[i]--;
                    push(len, ch, false);
                    leftPart(child, len + 1, limit - 1);
                    placedCount--;
                    rackCounts[i]++;
                }
                if (blanks > 0) {
                    blanks--;
                    push(len, ch, true);
                    leftPart(child, len + 1, limit - 1);
                    placedCount--;
                    blanks++;
                }
            }
        }

        private void push(int len, char ch, boolean isBlank) {
            word[len] = ch;
            isNew[len] = true;
            isBlankTile[len] = isBlank;
            placedCount++;
        }

        private int rackIndex(char ch) {
            for (int i = 0; i < rackChars.length; i++) if (rackChars[i] == ch && rackCounts[i] > 0) return i;
            return -1;
        }

        private void extendRight(int start, int col, int node, int len) {
            if (cancel.get()) return;
            if (col < n && g[row][col] != '\0') {
                char ch = g[row][col];
                int child = wg.child(node, ch);
                if (child >= 0) {
                    word[len] = ch;
                    isNew[len] = false;
                    isBlankTile[len] = gBlank[row][col];
                    extendRight(start, col + 1, child, len + 1);
                }
                return;
            }
            if (col > anchorCol && len >= 2 && placedCount > 0 && wg.isTerminal(node)) record(start, len);
            if (col >= n) return;
            String ok = allowed[row][col];
            for (int e = wg.edgeStart(node); e < wg.edgeEnd(node); e++) {
                char ch = wg.edgeChar(e);
                if (ok != null && ok.indexOf(ch) < 0) continue;
                int child = wg.edgeTarget(e);
                int i = rackIndex(ch);
                if (i >= 0) {
                    rackCounts[i]--;
                    push(len, ch, false);
                    extendRight(start, col + 1, child, len + 1);
                    placedCount--;
                    rackCounts[i]++;
                }
                if (blanks > 0) {
                    blanks--;
                    push(len, ch, true);
                    extendRight(start, col + 1, child, len + 1);
                    placedCount--;
                    blanks++;
                }
            }
        }

        /** The score {@link #record} computes, without building the move. */
        private int score(int start, int len) {
            int mainSum = 0;
            int wordMult = 1;
            int crossTotal = 0;
            for (int i = 0; i < len; i++) {
                int col = start + i;
                if (!isNew[i]) {
                    mainSum += value(word[i], isBlankTile[i]);
                    continue;
                }
                int type = sq[row][col];
                if (type < 0 || type >= BONUS.length) type = 0;
                int tile = value(word[i], isBlankTile[i]) * LETTER_MULT[type];
                mainSum += tile;
                wordMult *= WORD_MULT[type];
                if (hasCross[row][col]) crossTotal += (crossSum[row][col] + tile) * WORD_MULT[type];
            }
            int score = mainSum * wordMult + crossTotal;
            if (placedCount == Rules.RACK_SIZE) score += Rules.BINGO_BONUS;
            return score;
        }

        private void record(int start, int len) {
            // A single tile forms a word in both directions; the horizontal pass reports it when its
            // horizontal word has two or more letters, so the vertical pass skips it then.
            if (!horizontal && placedCount == 1) {
                for (int i = 0; i < len; i++) {
                    if (isNew[i] && hasCross[row][start + i]) return;
                }
            }
            if (score(start, len) < out.minScore()) return; // cannot get into the kept moves: build nothing
            int mainSum = 0;
            int wordMult = 1;
            int crossTotal = 0;
            List<int[]> placed = new ArrayList<>(placedCount);
            List<String> placedLetters = new ArrayList<>(placedCount);
            List<String> allWords = new ArrayList<>(1 + placedCount);
            List<String> bonuses = new ArrayList<>(2);
            String main = new String(word, 0, len);
            allWords.add(main);
            for (int i = 0; i < len; i++) {
                int col = start + i;
                char ch = word[i];
                if (!isNew[i]) {
                    mainSum += value(ch, isBlankTile[i]);
                    continue;
                }
                int type = sq[row][col];
                if (type < 0 || type >= BONUS.length) type = 0;
                int tile = value(ch, isBlankTile[i]) * LETTER_MULT[type];
                mainSum += tile;
                wordMult *= WORD_MULT[type];
                String letter = isBlankTile[i] ? String.valueOf(Character.toLowerCase(ch)) : String.valueOf(ch);
                if (hasCross[row][col]) {
                    crossTotal += (crossSum[row][col] + tile) * WORD_MULT[type];
                    allWords.add(crossPrefix[row][col] + ch + crossSuffix[row][col]);
                }
                placed.add(horizontal ? new int[] {col, row} : new int[] {row, col});
                placedLetters.add(letter);
                if (BONUS[type] != null) bonuses.add(BONUS[type] + ":" + letter);
            }
            int score = mainSum * wordMult + crossTotal;
            if (placedCount == Rules.RACK_SIZE) score += Rules.BINGO_BONUS;
            int x = horizontal ? start : row;
            int y = horizontal ? row : start;
            out.add(new Move(main, x, y, horizontal, placed, placedLetters, score, allWords, bonuses,
                    len > placedCount));
        }
    }
}
