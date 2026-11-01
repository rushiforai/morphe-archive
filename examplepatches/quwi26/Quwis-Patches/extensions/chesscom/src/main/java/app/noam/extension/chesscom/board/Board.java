package app.noam.extension.chesscom.board;

import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import kotlin.sequences.Sequence;

/**
 * The app's board model, read from what its data classes print: "e4", "Piece(WHITE KNIGHT)",
 * "PieceAnimation(from=e2, to=e4, ...)". Squares are 0..63 (file + 8 × rank, a1 = 0), pieces are
 * FEN letters.
 */
public final class Board {
    public static final int NONE = -1;

    private static final Pattern SQUARE = Pattern.compile("([a-hA-H])R?([1-8])");
    private static final Pattern PIECE = Pattern.compile("Piece\\((WHITE|BLACK) (PAWN|KNIGHT|BISHOP|ROOK|QUEEN|KING)\\)");
    private static final Pattern MOVE = Pattern.compile(
        "from=([^,]+), to=([^,]+), piece=(Piece\\([^)]*\\)), capturedPiece=(Piece\\([^)]*\\)|null), isEnPassant=(true|false)");
    private static final Pattern SQUARE_PIECE = Pattern.compile("square=([^,]+), piece=(Piece\\([^)]*\\))");
    private static final Pattern HINT = Pattern.compile("square=([^,]+), isCapture=(true|false)");

    public static final class Move {
        public int from, to;
        public char piece;
        public char captured;
        public boolean enPassant;

        public boolean white() {
            return Character.isUpperCase(piece);
        }

        /** Where the captured piece stood (en passant takes the pawn beside the target). */
        public int capturedSquare() {
            return enPassant ? (to % 8) + 8 * (from / 8) : to;
        }
    }

    private Board() {}

    public static int square(Object square) {
        if (square == null) return NONE;
        Matcher matcher = SQUARE.matcher(String.valueOf(square));
        if (!matcher.find()) return NONE;
        int file = Character.toLowerCase(matcher.group(1).charAt(0)) - 'a';
        int rank = matcher.group(2).charAt(0) - '1';
        return file + 8 * rank;
    }

    /** FEN letter of a printed piece, or 0. */
    public static char piece(Object piece) {
        if (piece == null) return 0;
        Matcher matcher = PIECE.matcher(String.valueOf(piece));
        if (!matcher.find()) return 0;
        char letter;
        switch (matcher.group(2)) {
            case "PAWN": letter = 'p'; break;
            case "KNIGHT": letter = 'n'; break;
            case "BISHOP": letter = 'b'; break;
            case "ROOK": letter = 'r'; break;
            case "QUEEN": letter = 'q'; break;
            default: letter = 'k'; break;
        }
        return "WHITE".equals(matcher.group(1)) ? Character.toUpperCase(letter) : letter;
    }

    public static Move move(Object animation) {
        Matcher matcher = MOVE.matcher(String.valueOf(animation));
        if (!matcher.find()) return null;
        Move move = new Move();
        move.from = square(matcher.group(1));
        move.to = square(matcher.group(2));
        move.piece = piece(matcher.group(3));
        move.captured = piece(matcher.group(4));
        move.enPassant = "true".equals(matcher.group(5));
        return move.from == NONE || move.to == NONE || move.piece == 0 ? null : move;
    }

    /** A legal-move hint: the square, negative when it captures; NONE if unreadable. */
    public static int hint(Object hint) {
        Matcher matcher = HINT.matcher(String.valueOf(hint));
        if (!matcher.find()) return NONE;
        int square = square(matcher.group(1));
        if (square == NONE) return NONE;
        return "true".equals(matcher.group(2)) ? -1 - square : square;
    }

    /** The pieces of the app's board object by square, or null. */
    public static char[] position(Object board) {
        if (board == null) return null;
        try {
            Method method = piecesMethod(board.getClass());
            if (method == null) return null;
            Sequence<?> pieces = (Sequence<?>) method.invoke(board);
            if (pieces == null) return null;
            char[] position = new char[64];
            for (Iterator<?> iterator = pieces.iterator(); iterator.hasNext(); ) {
                Matcher matcher = SQUARE_PIECE.matcher(String.valueOf(iterator.next()));
                if (!matcher.find()) continue;
                int square = square(matcher.group(1));
                if (square != NONE) position[square] = piece(matcher.group(2));
            }
            return position;
        } catch (Throwable throwable) {
            return null;
        }
    }

    /** The position interface's one method listing its pieces (squares with pieces). */
    private static Method piecesMethod(Class<?> type) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            for (Class<?> api : c.getInterfaces()) {
                for (Method method : api.getMethods()) {
                    if (method.getParameterTypes().length == 0 && Sequence.class.isAssignableFrom(method.getReturnType())) {
                        return method;
                    }
                }
            }
        }
        return null;
    }

    /** The square of the king that {@code white} (the side that just moved) gives check to, or NONE. */
    public static int checkedKing(char[] position, boolean white) {
        if (position == null) return NONE;
        char king = white ? 'k' : 'K';
        int target = NONE;
        for (int square = 0; square < 64; square++) if (position[square] == king) target = square;
        if (target == NONE) return NONE;
        for (int square = 0; square < 64; square++) {
            char piece = position[square];
            if (piece == 0 || Character.isUpperCase(piece) != white) continue;
            if (attacks(position, square, piece, target)) return target;
        }
        return NONE;
    }

    private static boolean attacks(char[] position, int from, char piece, int target) {
        int df = target % 8 - from % 8, dr = target / 8 - from / 8;
        switch (Character.toLowerCase(piece)) {
            case 'p':
                return Math.abs(df) == 1 && dr == (Character.isUpperCase(piece) ? 1 : -1);
            case 'n':
                return Math.abs(df * dr) == 2;
            case 'k':
                return Math.max(Math.abs(df), Math.abs(dr)) == 1;
            case 'b':
                return Math.abs(df) == Math.abs(dr) && clear(position, from, target);
            case 'r':
                return (df == 0 || dr == 0) && clear(position, from, target);
            case 'q':
                return (df == 0 || dr == 0 || Math.abs(df) == Math.abs(dr)) && clear(position, from, target);
            default:
                return false;
        }
    }

    /** No piece stands strictly between two squares on a line. */
    private static boolean clear(char[] position, int from, int to) {
        int stepFile = Integer.signum(to % 8 - from % 8), stepRank = Integer.signum(to / 8 - from / 8);
        int file = from % 8 + stepFile, rank = from / 8 + stepRank;
        while (file + 8 * rank != to) {
            if (position[file + 8 * rank] != 0) return false;
            file += stepFile;
            rank += stepRank;
        }
        return true;
    }

    /** Left edge of a square in board pixels. */
    public static float left(int square, boolean flip, float size) {
        int file = square % 8;
        return (flip ? 7 - file : file) * size;
    }

    /** Top edge of a square in board pixels. */
    public static float top(int square, boolean flip, float size) {
        int rank = square / 8;
        return (flip ? rank : 7 - rank) * size;
    }
}
