package app.noam.extension.chesscom.gamereview;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Lichess's own move judgments and accuracy, as in lila (modules/tree Advice.scala,
 * modules/analyse AccuracyPercent.scala), scalachess (eval WinPercent) and scalalib (Maths).
 * Scores are the engine's white-POV pawns, with a forced mate as +/-(MATE_SCORE - n).
 */
final class LichessMath {
    // Move classifications as chess.com's review reads them.
    static final String BOOK = "book";
    static final String BEST = "best";
    static final String EXCELLENT = "excellent";
    static final String GOOD = "good";
    static final String INACCURACY = "inaccuracy";
    static final String MISTAKE = "mistake";
    static final String BLUNDER = "blunder";
    static final String MISS = "miss";

    /** The engine's scores are pawns, with a forced mate as +/-(99 - n): anything past 50 is a mate. */
    static final float MATE_SCORE = 99f;
    static final float MATE_THRESHOLD = 50f;

    /** lila's evals.initial: the start position is +0.15 for white. */
    private static final double INITIAL_CP = 15;
    private static final double CEILING = 1000;

    private LichessMath() {}

    /** White-POV mate: +n white mates, -n black mates, 0 for none (a mated position counts). */
    static int mate(float score, int mate) {
        if (mate != 0) return mate;
        if (score >= MATE_THRESHOLD) return 1;
        if (score <= -MATE_THRESHOLD) return -1;
        return 0;
    }

    private static double winningChances(double cp) {
        return 2 / (1 + Math.exp(-0.00368208 * cp)) - 1;
    }

    /** WinPercent.fromScore, white POV, 0..100: centipawns ceiled at 1000, a mate at the ceiling. */
    static double winPercent(float score, int mate) {
        int m = mate(score, mate);
        double cp = m != 0 ? Math.signum(m) * CEILING : Math.max(-CEILING, Math.min(CEILING, score * 100.0));
        return 50 + 50 * winningChances(cp);
    }

    /**
     * Advice.apply(prev, info) for the move from `before` to `after`: a judgment from the mover's
     * drop in winning chances, or from a mate created or lost. Null when Lichess says nothing.
     */
    static String judgment(float before, int beforeMate, float after, int afterMate, boolean moverWhite) {
        int mBefore = mate(before, beforeMate), mAfter = mate(after, afterMate);
        if (mBefore == 0 && mAfter == 0) {
            double d = winningChances(after * 100.0) - winningChances(before * 100.0);
            double delta = moverWhite ? -d : d;
            if (delta >= .3) return BLUNDER;
            if (delta >= .2) return MISTAKE;
            if (delta >= .1) return INACCURACY;
            return null;
        }
        // MateAdvice, from the mover's point of view.
        int sign = moverWhite ? 1 : -1;
        int povBefore = mBefore * sign, povAfter = mAfter * sign;
        double cpBefore = mBefore == 0 ? before * 100.0 * sign : 0;
        double cpAfter = mAfter == 0 ? after * 100.0 * sign : 0;
        if (mBefore == 0 && povAfter < 0) {
            if (cpBefore < -999) return INACCURACY;
            if (cpBefore < -700) return MISTAKE;
            return BLUNDER;
        }
        if (povBefore > 0 && (mAfter == 0 || povAfter < 0)) {
            if (cpAfter > 999) return INACCURACY;
            if (cpAfter > 700) return MISTAKE;
            return BLUNDER;
        }
        return null;
    }

    /**
     * chess.com's mark for a move Lichess doesn't judge that isn't the engine's own: Excellent while
     * the mover loses at most 2% of expected points (0.04 of Lichess's winning chances), Good up
     * to Lichess's inaccuracy at 5%, where chess.com's starts too. Keeping or facing a mate is Excellent.
     */
    static String unjudged(float before, int beforeMate, float after, int afterMate, boolean moverWhite) {
        if (mate(before, beforeMate) != 0 || mate(after, afterMate) != 0) return EXCELLENT;
        double d = winningChances(after * 100.0) - winningChances(before * 100.0);
        return (moverWhite ? -d : d) <= .04 ? EXCELLENT : GOOD;
    }

    /** The mover had a forced mate and let it go (Lichess's "Lost forced checkmate sequence"). */
    static boolean lostMate(float before, int beforeMate, float after, int afterMate, boolean moverWhite) {
        int sign = moverWhite ? 1 : -1;
        int povBefore = mate(before, beforeMate) * sign, povAfter = mate(after, afterMate) * sign;
        return povBefore > 0 && povAfter <= 0;
    }

    /** AccuracyPercent.fromWinPercents, both from the mover's point of view. */
    static double moveAccuracy(double before, double after) {
        if (after >= before) return 100;
        double raw = 103.1668100711649 * Math.exp(-0.04354415386753951 * (before - after)) - 3.166924740191411;
        return Math.max(0, Math.min(100, raw + 1));
    }

    /**
     * Each move's {accuracy, volatility weight} as AccuracyPercent.gameAccuracy pairs them, from
     * the white-POV win percents after every ply (the start position is added here).
     */
    static List<double[]> weightedMoves(double[] afterEachPly, boolean whiteStarts) {
        return weightedMoves(50 + 50 * winningChances(INITIAL_CP), afterEachPly, whiteStarts);
    }

    /** The same, from a given white-POV win percent before the first ply. */
    static List<double[]> weightedMoves(double before, double[] afterEachPly, boolean whiteStarts) {
        int plies = afterEachPly.length;
        double[] all = new double[plies + 1];
        all[0] = before;
        System.arraycopy(afterEachPly, 0, all, 1, plies);

        int window = Math.max(2, Math.min(8, plies / 10));
        List<double[]> windows = new ArrayList<>();
        for (int i = 0; i < Math.min(window, all.length) - 2; i++) windows.add(slice(all, 0, window));
        if (all.length <= window) windows.add(all);
        else for (int i = 0; i + window <= all.length; i++) windows.add(slice(all, i, i + window));

        List<double[]> moves = new ArrayList<>();
        for (int i = 0; i + 1 < all.length && i < windows.size(); i++) {
            boolean white = (i % 2 == 0) == whiteStarts;
            double previous = all[i], next = all[i + 1];
            double accuracy = white ? moveAccuracy(previous, next) : moveAccuracy(next, previous);
            double weight = Math.max(0.5, Math.min(12, standardDeviation(windows.get(i))));
            moves.add(new double[]{accuracy, weight});
        }
        return moves;
    }

    /** A side's accuracy: the mean of the weighted mean and the harmonic mean. */
    static float accuracy(List<double[]> moves) {
        if (moves.isEmpty()) return 100f;
        double value = 0, weights = 0, inverse = 0;
        for (double[] move : moves) {
            value += move[0] * move[1];
            weights += move[1];
            inverse += 1 / Math.max(1, move[0]);
        }
        if (weights == 0) return 100f;
        return (float) ((value / weights + moves.size() / inverse) / 2);
    }

    /** White-POV centipawns as Lichess counts them: within 1000 either way, a mate at the edge. */
    static int cp(float score, int mate) {
        int m = mate(score, mate);
        if (m != 0) return m > 0 ? (int) CEILING : (int) -CEILING;
        return (int) Math.max(-CEILING, Math.min(CEILING, Math.round(score * 100.0)));
    }

    /**
     * AccuracyCP.mean: a side's average centipawn loss, from the centipawns after every ply (the
     * start position is added here). Evals are paired before and after each of the side's moves.
     */
    static int acpl(int[] afterEachPly, boolean whiteStarts, boolean white) {
        List<Integer> evals = new ArrayList<>();
        if (white == whiteStarts) evals.add((int) INITIAL_CP);
        for (int cp : afterEachPly) evals.add(cp);
        long sum = 0;
        int count = 0;
        for (int i = 0; i + 1 < evals.size(); i += 2) {
            int loss = (evals.get(i + 1) - evals.get(i)) * (white ? -1 : 1);
            sum += Math.max(0, loss);
            count++;
        }
        return count == 0 ? 0 : (int) Math.round((double) sum / count);
    }

    /** Lichess's game summary: the opening, then each side's accuracy, centipawn loss and marks. */
    static String summary(String opening, float whiteAccuracy, int whiteAcpl, int whiteInaccuracies,
                          int whiteMistakes, int whiteBlunders, float blackAccuracy, int blackAcpl,
                          int blackInaccuracies, int blackMistakes, int blackBlunders) {
        StringBuilder out = new StringBuilder();
        if (opening != null) out.append(opening).append(".\n");
        out.append(side("White", whiteAccuracy, whiteAcpl, whiteInaccuracies, whiteMistakes, whiteBlunders)).append('\n');
        out.append(side("Black", blackAccuracy, blackAcpl, blackInaccuracies, blackMistakes, blackBlunders));
        return out.toString();
    }

    private static String side(String name, float accuracy, int acpl, int inaccuracies, int mistakes, int blunders) {
        return name + ": " + Math.round(accuracy) + "% accuracy, " + acpl + " average centipawn loss, "
            + count(inaccuracies, "inaccuracy", "inaccuracies") + ", " + count(mistakes, "mistake", "mistakes")
            + ", " + count(blunders, "blunder", "blunders") + ".";
    }

    private static String count(int n, String one, String many) {
        return n + " " + (n == 1 ? one : many);
    }

    /**
     * scalachess's Divider: the ply the middlegame starts at and the ply the endgame starts at
     * (-1 for none), from the position before every ply and after the last one.
     */
    static int[] division(String[] fens) {
        int middle = -1, end = -1;
        for (int i = 0; i < fens.length && middle < 0; i++) {
            char[] board = squares(fens[i]);
            if (majorsAndMinors(board) <= 10 || backrankSparse(board) || mixedness(board) > 150) middle = i;
        }
        if (middle >= 0) {
            for (int i = 0; i < fens.length; i++) {
                if (majorsAndMinors(squares(fens[i])) <= 6) {
                    end = i;
                    break;
                }
            }
        }
        if (middle >= 0 && end >= 0 && middle >= end) middle = -1;
        return new int[]{middle, end};
    }

    /**
     * AccuracyPercent.phaseAccuracies: each side's accuracy in the opening, middlegame and
     * endgame ([side][phase], white first; null where Lichess has none), from the white-POV win
     * percents after every evaluated ply. Each phase is scored on its own from the eval before it.
     * Like lila, plies are counted from the starting FEN's move number while the division counts
     * positions from the start, which only matters for games from a set-up position.
     */
    static Float[][] phaseAccuracies(int[] division, double[] winAfter, boolean whiteStarts, int startPly) {
        Float[][] out = new Float[2][3];
        int middle = division[0], end = division[1];
        if (middle < 0) return out;
        for (int phase = 0; phase < 3; phase++) {
            int first = -1, last = -1;
            for (int k = 0; k < winAfter.length; k++) {
                int ply = startPly + k + 1;
                int of = ply < middle ? 0 : end >= 0 && end <= ply ? 2 : 1;
                if (of != phase) continue;
                if (first < 0) first = k;
                last = k;
            }
            if (first < 0) continue;
            double before = first > 0 ? winAfter[first - 1] : 50 + 50 * winningChances(INITIAL_CP);
            boolean firstWhite = (first % 2 == 0) == whiteStarts;
            double[] slice = slice(winAfter, first, last + 1);
            List<double[]> moves = weightedMoves(before, slice, firstWhite);
            List<double[]> white = new ArrayList<>(), black = new ArrayList<>();
            for (int i = 0; i < moves.size(); i++) ((i % 2 == 0) == firstWhite ? white : black).add(moves.get(i));
            // Lichess gives a phase only when both sides have moves in it.
            if (white.isEmpty() || black.isEmpty()) continue;
            out[0][phase] = accuracy(white);
            out[1][phase] = accuracy(black);
        }
        return out;
    }

    /** How many plies were played before a FEN's position (its move number and side to move). */
    static int startPly(String fen) {
        String[] fields = fen == null ? new String[0] : fen.trim().split(" +");
        int fullMove = fields.length > 5 ? Integer.parseInt(fields[5]) : 1;
        return (fullMove - 1) * 2 + (fields.length > 1 && fields[1].equals("b") ? 1 : 0);
    }

    /** A FEN's pieces by square, a1 = 0, ' ' for an empty one. */
    private static char[] squares(String fen) {
        char[] board = new char[64];
        Arrays.fill(board, ' ');
        String[] ranks = fen.trim().split(" ")[0].split("/");
        for (int r = 0; r < 8 && r < ranks.length; r++) {
            int file = 0;
            for (char c : ranks[r].toCharArray()) {
                if (Character.isDigit(c)) file += c - '0';
                else if (file < 8) board[(7 - r) * 8 + file++] = c;
            }
        }
        return board;
    }

    private static int majorsAndMinors(char[] board) {
        int count = 0;
        for (char c : board) if (c != ' ' && "KkPp".indexOf(c) < 0) count++;
        return count;
    }

    /** Fewer than four pieces left on either side's back rank: the pieces have been developed. */
    private static boolean backrankSparse(char[] board) {
        int white = 0, black = 0;
        for (int file = 0; file < 8; file++) {
            if (board[file] != ' ' && Character.isUpperCase(board[file])) white++;
            if (board[56 + file] != ' ' && Character.isLowerCase(board[56 + file])) black++;
        }
        return white < 4 || black < 4;
    }

    private static int mixedness(char[] board) {
        int total = 0;
        for (int y = 0; y < 7; y++) {
            for (int x = 0; x < 7; x++) {
                int white = 0, black = 0;
                for (int square : new int[]{x + 8 * y, x + 1 + 8 * y, x + 8 * (y + 1), x + 1 + 8 * (y + 1)}) {
                    char c = board[square];
                    if (c == ' ') continue;
                    if (Character.isUpperCase(c)) white++;
                    else black++;
                }
                total += regionScore(y + 1, white, black);
            }
        }
        return total;
    }

    private static int regionScore(int y, int white, int black) {
        switch (white) {
            case 0:
                switch (black) {
                    case 1: return 1 + y;
                    case 2: return y < 6 ? 2 + (6 - y) : 0;
                    case 3:
                    case 4: return y < 7 ? 3 + (7 - y) : 0;
                    default: return 0;
                }
            case 1:
                switch (black) {
                    case 0: return 1 + (8 - y);
                    case 1: return 5 + Math.abs(4 - y);
                    case 2: return 4 + (7 - y);
                    case 3: return 5 + (7 - y);
                    default: return 0;
                }
            case 2:
                switch (black) {
                    case 0: return y > 2 ? 2 + (y - 2) : 0;
                    case 1: return 4 + (y - 1);
                    case 2: return 7;
                    default: return 0;
                }
            case 3:
                switch (black) {
                    case 0: return y > 1 ? 3 + (y - 1) : 0;
                    case 1: return 5 + (y - 1);
                    default: return 0;
                }
            case 4:
                return black == 0 && y > 1 ? 3 + (y - 1) : 0;
            default:
                return 0;
        }
    }

    private static double[] slice(double[] values, int from, int to) {
        double[] out = new double[Math.min(to, values.length) - from];
        System.arraycopy(values, from, out, 0, out.length);
        return out;
    }

    private static double standardDeviation(double[] values) {
        double mean = 0;
        for (double v : values) mean += v;
        mean /= values.length;
        double sum = 0;
        for (double v : values) sum += (v - mean) * (v - mean);
        return Math.sqrt(sum / values.length);
    }
}
