package app.noam.extension.chesscom.lichesspuzzle;

import java.util.ArrayList;
import java.util.List;

/**
 * Lichess gives a puzzle's moves in UCI; chess.com reads them as PGN movetext. This turns UCI
 * into numbered SAN from the puzzle's FEN, with disambiguation and check marks.
 */
public final class San {
    private static final int[][] KNIGHT = {{1, 2}, {2, 1}, {2, -1}, {1, -2}, {-1, -2}, {-2, -1}, {-2, 1}, {-1, 2}};
    private static final int[][] KING = {{1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1}, {0, -1}, {1, -1}};
    private static final int[][] ROOK = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    private static final int[][] BISHOP = {{1, 1}, {1, -1}, {-1, 1}, {-1, -1}};

    /** Squares a1 = 0 .. h8 = 63; ' ' is empty, uppercase white. */
    private final char[] board = new char[64];
    private boolean whiteToMove;
    private String castling;
    private int enPassant = -1;
    private int fullMove;

    private San(San other) {
        System.arraycopy(other.board, 0, board, 0, 64);
        whiteToMove = other.whiteToMove;
        castling = other.castling;
        enPassant = other.enPassant;
        fullMove = other.fullMove;
    }

    private San(String fen) {
        String[] fields = fen.trim().split(" +");
        String[] ranks = fields[0].split("/");
        for (int r = 0; r < 8; r++) {
            int file = 0;
            for (char c : ranks[7 - r].toCharArray()) {
                if (Character.isDigit(c)) {
                    for (int k = 0; k < c - '0'; k++) board[r * 8 + file++] = ' ';
                } else {
                    board[r * 8 + file++] = c;
                }
            }
        }
        whiteToMove = fields.length < 2 || fields[1].equals("w");
        castling = fields.length > 2 ? fields[2] : "-";
        enPassant = fields.length > 3 && !fields[3].equals("-") ? square(fields[3]) : -1;
        fullMove = fields.length > 5 ? Integer.parseInt(fields[5]) : 1;
    }

    /** "e2e4 e7e5" from the FEN's position as "1. e4 e5"; null when a move is not legal. */
    public static String movetext(String fen, String uci) {
        try {
            San position = new San(fen);
            StringBuilder out = new StringBuilder();
            boolean first = true;
            for (String move : uci.trim().split(" +")) {
                if (position.whiteToMove) out.append(first ? "" : " ").append(position.fullMove).append(". ");
                else if (first) out.append(position.fullMove).append("...");
                else out.append(' ');
                String san = position.play(move);
                if (san == null) return null;
                out.append(san);
                first = false;
            }
            return out.toString();
        } catch (RuntimeException e) {
            return null;
        }
    }

    /**
     * The other way: SAN moves ("Nf3", "exd5+", "O-O") from the FEN's position as UCI, stopping
     * at the first one that is not legal there.
     */
    public static List<String> uci(String fen, List<String> sans) {
        List<String> line = new ArrayList<>();
        try {
            San position = new San(fen);
            for (String san : sans) {
                String wanted = clean(san);
                String found = null;
                for (int move : position.legalMoves(position.whiteToMove)) {
                    int from = move / 64, to = move % 64;
                    boolean promotes = Character.toLowerCase(position.board[from]) == 'p' && (to / 8 == 0 || to / 8 == 7);
                    for (char promotion : promotes ? new char[]{'q', 'r', 'b', 'n'} : new char[]{0}) {
                        String candidate = name(from) + name(to) + (promotion != 0 ? String.valueOf(promotion) : "");
                        if (clean(new San(position).play(candidate)).equals(wanted)) found = candidate;
                    }
                }
                if (found == null) break;
                position.play(found);
                line.add(found);
            }
        } catch (RuntimeException ignored) {
        }
        return line;
    }

    /** The side to move is checkmated. */
    public static boolean checkmate(String fen) {
        try {
            San position = new San(fen);
            return position.inCheck(position.whiteToMove) && position.legalMoves(position.whiteToMove).isEmpty();
        } catch (RuntimeException e) {
            return false;
        }
    }

    /** The side to move is not in check and has no legal move. */
    public static boolean stalemate(String fen) {
        try {
            San position = new San(fen);
            return !position.inCheck(position.whiteToMove) && position.legalMoves(position.whiteToMove).isEmpty();
        } catch (RuntimeException e) {
            return false;
        }
    }

    /**
     * Neither side has the material to mate, as shakmaty (the chess library of Lichess's analysis
     * client) has it.
     */
    public static boolean insufficientMaterial(String fen) {
        try {
            San position = new San(fen);
            return position.insufficientMaterial(true) && position.insufficientMaterial(false);
        } catch (RuntimeException e) {
            return false;
        }
    }

    /** shakmaty's Chess::has_insufficient_material: the side cannot mate, whatever the other side does. */
    private boolean insufficientMaterial(boolean white) {
        int own = 0, knights = 0, bishops = 0, dark = 0, light = 0, anyKnights = 0, anyPawns = 0;
        boolean opponentOthers = false;
        for (int s = 0; s < 64; s++) {
            char piece = board[s];
            if (piece == ' ') continue;
            char type = Character.toLowerCase(piece);
            if (type == 'b') {
                if ((s % 8 + s / 8) % 2 == 0) dark++;
                else light++;
            }
            if (type == 'n') anyKnights++;
            if (type == 'p') anyPawns++;
            if (own(piece, white)) {
                // Pawns, rooks and queens are never insufficient material.
                if (type == 'p' || type == 'r' || type == 'q') return false;
                own++;
                if (type == 'n') knights++;
                if (type == 'b') bishops++;
            } else if (type != 'k' && type != 'q') {
                opponentOthers = true;
            }
        }
        // A lone knight, against an opponent with no pawns, knights, bishops or rooks to self-mate with.
        if (knights > 0) return own <= 2 && !opponentOthers;
        // Bishops only on one colour, with no knights or pawns on the board.
        if (bishops > 0) return (dark == 0 || light == 0) && anyKnights == 0 && anyPawns == 0;
        return true;
    }

    private static String clean(String san) {
        return san == null ? "" : san.replaceAll("[+#!?]", "").replace("0-0-0", "O-O-O").replace("0-0", "O-O");
    }

    private static int square(String name) {
        return (name.charAt(1) - '1') * 8 + (name.charAt(0) - 'a');
    }

    private static String name(int square) {
        return "" + (char) ('a' + square % 8) + (char) ('1' + square / 8);
    }

    private boolean own(char piece, boolean white) {
        return piece != ' ' && Character.isUpperCase(piece) == white;
    }

    /** Plays one UCI move and returns its SAN, or null when it is not legal here. */
    private String play(String uci) {
        int from = square(uci.substring(0, 2));
        int to = square(uci.substring(2, 4));
        char promotion = uci.length() > 4 ? uci.charAt(4) : 0;
        char piece = board[from];
        if (!own(piece, whiteToMove)) return null;
        char type = Character.toLowerCase(piece);
        // Lichess writes castling as the king's two-square move (e1g1).
        boolean castle = type == 'k' && Math.abs(to % 8 - from % 8) == 2;
        if (!legalMoves(whiteToMove).contains(from * 64 + to)) return null;

        StringBuilder san = new StringBuilder();
        boolean capture = board[to] != ' ' || (type == 'p' && to == enPassant);
        if (castle) {
            san.append(to % 8 == 6 ? "O-O" : "O-O-O");
        } else if (type == 'p') {
            if (capture) san.append((char) ('a' + from % 8)).append('x');
            san.append(name(to));
            if (promotion != 0) san.append('=').append(Character.toUpperCase(promotion));
        } else {
            san.append(Character.toUpperCase(type));
            boolean sameFile = false, sameRank = false, other = false;
            for (int move : legalMoves(whiteToMove)) {
                int f = move / 64;
                if (move % 64 != to || f == from || board[f] != piece) continue;
                other = true;
                if (f % 8 == from % 8) sameFile = true;
                if (f / 8 == from / 8) sameRank = true;
            }
            if (other) {
                if (!sameFile) san.append((char) ('a' + from % 8));
                else if (!sameRank) san.append((char) ('1' + from / 8));
                else san.append(name(from));
            }
            if (capture) san.append('x');
            san.append(name(to));
        }
        apply(from, to, promotion);
        if (inCheck(whiteToMove)) san.append(legalMoves(whiteToMove).isEmpty() ? '#' : '+');
        return san.toString();
    }

    private void apply(int from, int to, char promotion) {
        char piece = board[from];
        char type = Character.toLowerCase(piece);
        boolean white = Character.isUpperCase(piece);
        if (type == 'p' && to == enPassant) board[to + (white ? -8 : 8)] = ' ';
        if (type == 'k' && Math.abs(to % 8 - from % 8) == 2) {
            int rookFrom = to % 8 == 6 ? from + 3 : from - 4;
            int rookTo = to % 8 == 6 ? from + 1 : from - 1;
            board[rookTo] = board[rookFrom];
            board[rookFrom] = ' ';
        }
        board[to] = promotion != 0 ? (white ? Character.toUpperCase(promotion) : Character.toLowerCase(promotion)) : piece;
        board[from] = ' ';
        enPassant = type == 'p' && Math.abs(to - from) == 16 ? (from + to) / 2 : -1;
        castling = strip(castling, from);
        castling = strip(castling, to);
        if (!white) fullMove++;
        whiteToMove = !white;
    }

    /** Castling rights lost when a king or rook moves from, or a rook is taken on, the square. */
    private static String strip(String rights, int square) {
        String lost;
        switch (square) {
            case 4: lost = "KQ"; break;
            case 60: lost = "kq"; break;
            case 0: lost = "Q"; break;
            case 7: lost = "K"; break;
            case 56: lost = "q"; break;
            case 63: lost = "k"; break;
            default: return rights;
        }
        StringBuilder kept = new StringBuilder();
        for (char c : rights.toCharArray()) if (lost.indexOf(c) < 0 && c != '-') kept.append(c);
        return kept.length() == 0 ? "-" : kept.toString();
    }

    /** Legal moves of a side as from * 64 + to (promotions counted once). */
    private List<Integer> legalMoves(boolean white) {
        List<Integer> legal = new ArrayList<>();
        for (int move : pseudoMoves(white)) {
            char[] saved = board.clone();
            int savedEp = enPassant;
            String savedCastling = castling;
            boolean savedTurn = whiteToMove;
            int savedFull = fullMove;
            apply(move / 64, move % 64, (char) 0);
            boolean ok = !inCheck(white);
            System.arraycopy(saved, 0, board, 0, 64);
            enPassant = savedEp;
            castling = savedCastling;
            whiteToMove = savedTurn;
            fullMove = savedFull;
            if (ok) legal.add(move);
        }
        return legal;
    }

    private List<Integer> pseudoMoves(boolean white) {
        List<Integer> moves = new ArrayList<>();
        for (int from = 0; from < 64; from++) {
            char piece = board[from];
            if (!own(piece, white)) continue;
            int file = from % 8, rank = from / 8;
            switch (Character.toLowerCase(piece)) {
                case 'p': {
                    int dir = white ? 1 : -1;
                    int one = from + 8 * dir;
                    if (one >= 0 && one < 64 && board[one] == ' ') {
                        moves.add(from * 64 + one);
                        int two = from + 16 * dir;
                        if ((white ? rank == 1 : rank == 6) && board[two] == ' ') moves.add(from * 64 + two);
                    }
                    for (int df = -1; df <= 1; df += 2) {
                        int f = file + df, r = rank + dir;
                        if (f < 0 || f > 7 || r < 0 || r > 7) continue;
                        int target = r * 8 + f;
                        if ((board[target] != ' ' && !own(board[target], white)) || target == enPassant) {
                            moves.add(from * 64 + target);
                        }
                    }
                    break;
                }
                case 'n': steps(moves, from, white, KNIGHT, false); break;
                case 'b': steps(moves, from, white, BISHOP, true); break;
                case 'r': steps(moves, from, white, ROOK, true); break;
                case 'q': steps(moves, from, white, BISHOP, true); steps(moves, from, white, ROOK, true); break;
                case 'k': {
                    steps(moves, from, white, KING, false);
                    castles(moves, from, white);
                    break;
                }
                default: break;
            }
        }
        return moves;
    }

    private void steps(List<Integer> moves, int from, boolean white, int[][] directions, boolean slide) {
        for (int[] d : directions) {
            int f = from % 8, r = from / 8;
            while (true) {
                f += d[0];
                r += d[1];
                if (f < 0 || f > 7 || r < 0 || r > 7) break;
                int target = r * 8 + f;
                if (own(board[target], white)) break;
                moves.add(from * 64 + target);
                if (board[target] != ' ' || !slide) break;
            }
        }
    }

    private void castles(List<Integer> moves, int from, boolean white) {
        if (from != (white ? 4 : 60) || inCheck(white)) return;
        char king = white ? 'K' : 'k', queen = white ? 'Q' : 'q';
        if (castling.indexOf(king) >= 0 && board[from + 1] == ' ' && board[from + 2] == ' '
                && !attacked(from + 1, !white) && !attacked(from + 2, !white)) {
            moves.add(from * 64 + from + 2);
        }
        if (castling.indexOf(queen) >= 0 && board[from - 1] == ' ' && board[from - 2] == ' ' && board[from - 3] == ' '
                && !attacked(from - 1, !white) && !attacked(from - 2, !white)) {
            moves.add(from * 64 + from - 2);
        }
    }

    private boolean inCheck(boolean white) {
        char king = white ? 'K' : 'k';
        for (int s = 0; s < 64; s++) if (board[s] == king) return attacked(s, !white);
        return false;
    }

    /** Whether a side attacks the square. */
    private boolean attacked(int square, boolean byWhite) {
        int file = square % 8, rank = square / 8;
        int pawnRank = rank + (byWhite ? -1 : 1);
        for (int df = -1; df <= 1; df += 2) {
            int f = file + df;
            if (f >= 0 && f < 8 && pawnRank >= 0 && pawnRank < 8 && board[pawnRank * 8 + f] == (byWhite ? 'P' : 'p')) return true;
        }
        if (hits(square, byWhite, KNIGHT, false, "n") || hits(square, byWhite, KING, false, "k")) return true;
        return hits(square, byWhite, BISHOP, true, "bq") || hits(square, byWhite, ROOK, true, "rq");
    }

    private boolean hits(int square, boolean byWhite, int[][] directions, boolean slide, String types) {
        for (int[] d : directions) {
            int f = square % 8, r = square / 8;
            while (true) {
                f += d[0];
                r += d[1];
                if (f < 0 || f > 7 || r < 0 || r > 7) break;
                char piece = board[r * 8 + f];
                if (piece != ' ') {
                    if (own(piece, byWhite) && types.indexOf(Character.toLowerCase(piece)) >= 0) return true;
                    break;
                }
                if (!slide) break;
            }
        }
        return false;
    }
}
