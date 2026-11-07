/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.extension.chesscom.gamereview;

/**
 * Minimal, allocation-light board model used by the game review.
 *
 * It does NOT generate moves or check legality: it only applies the game's own moves, to
 * normalise castling notation before it is sent to Stockfish and to cross-check positions.
 *
 * Squares are indexed 0..63 with 0 = a8 and 63 = h1 (FEN order).
 */
public final class BoardUtil {

    private BoardUtil() {}

    /** Expand the piece-placement field of a FEN into a 64 char array ('.' = empty). */
    public static char[] parseBoard(String fen) {
        char[] b = new char[64];
        java.util.Arrays.fill(b, '.');
        if (fen == null) return b;
        int sp = fen.indexOf(' ');
        String placement = sp >= 0 ? fen.substring(0, sp) : fen;
        int idx = 0;
        for (int i = 0; i < placement.length() && idx < 64; i++) {
            char c = placement.charAt(i);
            if (c == '/') continue;
            if (c >= '1' && c <= '8') {
                idx += c - '0';
            } else {
                b[idx++] = c;
            }
        }
        return b;
    }

    /** Piece placement field only. */
    public static String placement(String fen) {
        if (fen == null) return null;
        int sp = fen.indexOf(' ');
        return sp >= 0 ? fen.substring(0, sp) : fen;
    }

    public static String placement(char[] b) {
        StringBuilder sb = new StringBuilder(72);
        for (int r = 0; r < 8; r++) {
            int empty = 0;
            for (int f = 0; f < 8; f++) {
                char c = b[r * 8 + f];
                if (c == '.') {
                    empty++;
                } else {
                    if (empty > 0) { sb.append(empty); empty = 0; }
                    sb.append(c);
                }
            }
            if (empty > 0) sb.append(empty);
            if (r < 7) sb.append('/');
        }
        return sb.toString();
    }

    public static int square(String uci, int offset) {
        if (uci == null || uci.length() < offset + 2) return -1;
        int file = uci.charAt(offset) - 'a';
        int rank = uci.charAt(offset + 1) - '1';
        if (file < 0 || file > 7 || rank < 0 || rank > 7) return -1;
        return (7 - rank) * 8 + file;
    }

    public static String squareName(int sq) {
        return "" + (char) ('a' + (sq % 8)) + (char) ('1' + (7 - sq / 8));
    }

    /**
     * Convert "king takes own rook" castling notation (e1h1 / e1a1) into standard notation
     * (e1g1 / e1c1). Stockfish 19 terminates on illegal moves, so this must be done before a
     * move list is sent to the engine.
     */
    public static String normalizeCastling(char[] b, String uci) {
        if (uci == null || uci.length() < 4) return uci;
        int from = square(uci, 0);
        int to = square(uci, 2);
        if (from < 0 || to < 0) return uci;
        char p = b[from];
        if (p != 'K' && p != 'k') return uci;
        char ownRook = p == 'K' ? 'R' : 'r';
        if (b[to] == ownRook && from / 8 == to / 8) {
            int fromFile = from % 8;
            int toFile = to % 8;
            int dest = (from / 8) * 8 + (toFile > fromFile ? 6 : 2);
            return squareName(from) + squareName(dest);
        }
        return uci;
    }

    /**
     * Apply a legal UCI move in place.
     *
     * @return the captured piece ('.' if none)
     */
    public static char apply(char[] b, String uci) {
        int from = square(uci, 0);
        int to = square(uci, 2);
        if (from < 0 || to < 0) return '.';
        char p = b[from];
        if (p == '.') return '.';
        char captured = b[to];

        boolean white = Character.isUpperCase(p);
        char lower = Character.toLowerCase(p);

        // Castling written as king-takes-rook
        if (lower == 'k' && captured == (white ? 'R' : 'r')) {
            int row = from / 8;
            boolean kingSide = (to % 8) > (from % 8);
            b[from] = '.';
            b[to] = '.';
            b[row * 8 + (kingSide ? 6 : 2)] = p;
            b[row * 8 + (kingSide ? 5 : 3)] = white ? 'R' : 'r';
            return '.';
        }

        // Standard castling (king moves two files)
        if (lower == 'k' && Math.abs((to % 8) - (from % 8)) == 2 && from / 8 == to / 8) {
            int row = from / 8;
            boolean kingSide = (to % 8) > (from % 8);
            int rookFrom = row * 8 + (kingSide ? 7 : 0);
            int rookTo = row * 8 + (kingSide ? 5 : 3);
            b[rookTo] = b[rookFrom];
            b[rookFrom] = '.';
        }

        // En passant: pawn moves diagonally onto an empty square
        if (lower == 'p' && (from % 8) != (to % 8) && captured == '.') {
            int capSq = (from / 8) * 8 + (to % 8);
            captured = b[capSq];
            b[capSq] = '.';
        }

        b[to] = p;
        b[from] = '.';

        // Promotion
        if (uci.length() >= 5 && lower == 'p') {
            char promo = uci.charAt(4);
            b[to] = white ? Character.toUpperCase(promo) : Character.toLowerCase(promo);
        }
        return captured;
    }

    /** Piece value in pawns, kings and empty squares zero. */
    public static int pieceValue(char c) {
        switch (Character.toLowerCase(c)) {
            case 'p': return 1;
            case 'n':
            case 'b': return 3;
            case 'r': return 5;
            case 'q': return 9;
            default: return 0;
        }
    }

    /** Does the move land on the square where the opponent just captured? */
    public static boolean isRecapture(String prevMove, boolean prevWasCapture, String move) {
        if (!prevWasCapture || prevMove == null || move == null) return false;
        if (prevMove.length() < 4 || move.length() < 4) return false;
        return prevMove.regionMatches(2, move, 2, 2);
    }

    // Does a piece at `from` attack the square `to`? Sliders need a clear path.
    private static boolean attacks(char[] b, int from, int to) {
        char p = b[from];
        if (p == '.' || from == to) return false;
        int fr = from / 8, ff = from % 8, tr = to / 8, tf = to % 8;
        int dr = tr - fr, df = tf - ff;
        boolean white = Character.isUpperCase(p);
        switch (Character.toLowerCase(p)) {
            case 'p':
                return Math.abs(df) == 1 && dr == (white ? -1 : 1);
            case 'n':
                return (Math.abs(dr) == 2 && Math.abs(df) == 1) || (Math.abs(dr) == 1 && Math.abs(df) == 2);
            case 'k':
                return Math.max(Math.abs(dr), Math.abs(df)) == 1;
            case 'b':
                return Math.abs(dr) == Math.abs(df) && clear(b, from, to);
            case 'r':
                return (dr == 0 || df == 0) && clear(b, from, to);
            case 'q':
                return (dr == 0 || df == 0 || Math.abs(dr) == Math.abs(df)) && clear(b, from, to);
            default:
                return false;
        }
    }

    private static boolean clear(char[] b, int from, int to) {
        int fr = from / 8, ff = from % 8, tr = to / 8, tf = to % 8;
        int dr = Integer.signum(tr - fr), df = Integer.signum(tf - ff);
        int r = fr + dr, f = ff + df;
        while (r != tr || f != tf) {
            if (b[r * 8 + f] != '.') return false;
            r += dr;
            f += df;
        }
        return true;
    }

    /** Does the given side attack this square? */
    public static boolean attacked(char[] b, int square, boolean byWhite) {
        if (b == null || square < 0 || square >= 64) return false;
        for (int from = 0; from < 64; from++) {
            char p = b[from];
            if (p == '.' || Character.isUpperCase(p) != byWhite) continue;
            if (attacks(b, from, square)) return true;
        }
        return false;
    }

    /** The cheapest piece of the given side that can legally take on the square, or -1. */
    private static int cheapestAttacker(char[] b, int square, boolean byWhite) {
        int best = -1, bestValue = Integer.MAX_VALUE;
        for (int from = 0; from < 64; from++) {
            char p = b[from];
            if (p == '.' || Character.isUpperCase(p) != byWhite) continue;
            if (!attacks(b, from, square)) continue;
            // A king cannot take a defended piece.
            if (Character.toLowerCase(p) == 'k' && attacked(b, square, !byWhite)) continue;
            int value = pieceValue(p);
            if (value < bestValue) {
                bestValue = value;
                best = from;
            }
        }
        return best;
    }

    /**
     * Static exchange evaluation: what the given side wins by starting captures on the square,
     * both sides taking with their cheapest piece and either side free to stop. 0 or more.
     */
    public static int see(char[] b, int square, boolean byWhite) {
        return see(b, square, byWhite, 0);
    }

    private static int see(char[] b, int square, boolean byWhite, int depth) {
        if (depth > 16) return 0;
        char victim = b[square];
        if (victim == '.') return 0;
        int attacker = cheapestAttacker(b, square, byWhite);
        if (attacker < 0) return 0;
        char[] next = b.clone();
        char p = next[attacker];
        next[attacker] = '.';
        next[square] = p;
        int gain = pieceValue(victim) - see(next, square, !byWhite, depth + 1);
        return Math.max(0, gain);
    }

    /**
     * The mover's non-pawn pieces that the opponent can win by capturing them, SEE 2 or more.
     * A piece already like that before the move is not a sacrifice: it was not offered now.
     */
    private static boolean[] enPrise(char[] b, boolean ownerWhite) {
        boolean[] out = new boolean[64];
        for (int square = 0; square < 64; square++) {
            char p = b[square];
            if (p == '.' || p == 'p' || p == 'P') continue;
            if (Character.isUpperCase(p) != ownerWhite) continue;
            if (see(b, square, !ownerWhite) >= 2) out[square] = true;
        }
        return out;
    }

    /**
     * Whether the played move offers material: after it there is a non-pawn piece of the mover's
     * that the opponent wins material by taking (static exchange, at least two pawns) and that was
     * not already like that before the move. Following the engine's line instead cannot tell a
     * sacrifice from an ordinary exchange: in a trade the mover is briefly down a piece too.
     *
     * A capture nets out what it took (a rook taking a rook and being taken back is a trade), and a
     * move that gives check can only offer the piece that gives it: the opponent has to answer the
     * check, not collect something else on the board.
     *
     * @param before     board before the played move (not modified)
     * @param moverWhite side that played the move
     * @param played     the played move, in UCI
     */
    public static boolean isSacrifice(char[] before, boolean moverWhite, String played) {
        if (before == null || played == null || played.length() < 4) return false;
        boolean[] was = enPrise(before, moverWhite);
        char[] after = before.clone();
        char captured = apply(after, played);
        int gained = captured == '.' ? 0 : pieceValue(captured);
        int to = square(played, 2);
        if (to < 0) return false;
        if (givesCheck(after, moverWhite)) {
            // Only the checking piece can be taken as the answer to the check.
            return pieceValue(after[to]) - gained >= 2 && see(after, to, !moverWhite) >= 2;
        }
        boolean[] now = enPrise(after, moverWhite);
        for (int square = 0; square < 64; square++) {
            if (!now[square] || was[square]) continue;
            if (pieceValue(after[square]) - gained >= 2) return true;
        }
        return false;
    }

    /** Does the mover's move leave the opponent's king attacked? */
    private static boolean givesCheck(char[] b, boolean moverWhite) {
        char king = moverWhite ? 'k' : 'K';
        for (int square = 0; square < 64; square++) {
            if (b[square] == king) return attacked(b, square, moverWhite);
        }
        return false;
    }

    /**
     * The UCI move between two consecutive boards, for app versions whose move converter was
     * renamed. Castling is the king moving two files; promotions keep the new piece's letter.
     */
    public static String coordinate(char[] before, char[] after) {
        if (before == null || after == null) return null;
        // Castling: the king ends two files away on the same rank. chess.com's LAN is
        // "king takes own rook" (e1h1 / e1a1); normalizeCastling converts it for Stockfish.
        for (int from = 0; from < 64; from++) {
            char king = before[from];
            if (king != 'K' && king != 'k') continue;
            for (int to = 0; to < 64; to++) {
                if (after[to] != king || from / 8 != to / 8) continue;
                int fileDelta = (to % 8) - (from % 8);
                if (Math.abs(fileDelta) != 2) continue;
                int rookFile = fileDelta > 0 ? 7 : 0;
                return squareName(from) + squareName((from / 8) * 8 + rookFile);
            }
        }
        // Normal, capture, en passant or promotion: one piece lands on a changed square.
        for (int to = 0; to < 64; to++) {
            char mover = after[to];
            if (mover == '.' || mover == before[to]) continue;
            char lower = Character.toLowerCase(mover);
            for (int from = 0; from < 64; from++) {
                char piece = before[from];
                if (piece == '.' || after[from] != '.') continue;
                char lowerPiece = Character.toLowerCase(piece);
                boolean samePiece = lowerPiece == lower;
                boolean promotion = lowerPiece == 'p' && lower != 'p' && (to / 8 == 0 || to / 8 == 7);
                if (!samePiece && !promotion) continue;
                String move = squareName(from) + squareName(to);
                if (promotion) move += lower;
                return move;
            }
        }
        return null;
    }
}
