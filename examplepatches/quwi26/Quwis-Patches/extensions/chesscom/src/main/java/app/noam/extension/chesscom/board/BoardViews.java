package app.noam.extension.chesscom.board;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * The older board is a ChessBoardView with a PieceView child, whose own getParent() (a second one
 * next to View's) returns the board. Board views keep their real method names.
 */
public final class BoardViews {
    public static final String CHESS_BOARD_VIEW = "com.chess.chessboard.view.ChessBoardView";
    public static final String ANIMATED_PIECE = "com.chess.chessboard.view.viewlayers.AnimatedPiece";
    /** The newer board some screens use, and its piece view (its child). */
    public static final String V2_BOARD = "com.chess.chessboard.v2.ChessBoardView";
    public static final String V2_PIECES = "com.chess.chessboard.v2.PiecesView";

    private static Method hostGetter;
    /** The newer board keeps its orientation behind an obfuscated getter: its setter reports it here. */
    private static final Map<View, Boolean> V2_FLIPPED = new WeakHashMap<>();

    private BoardViews() {}

    /** v2 ChessBoardView.setBoardFlipped. */
    public static void onFlipped(View board, boolean flipped) {
        synchronized (V2_FLIPPED) {
            V2_FLIPPED.put(board, flipped);
        }
    }

    public static Object host(ViewGroup pieceView) {
        if (V2_PIECES.equals(pieceView.getClass().getName())) return pieceView.getParent();
        try {
            if (hostGetter == null) {
                for (Method method : pieceView.getClass().getMethods()) {
                    if ("getParent".equals(method.getName()) && method.getParameterTypes().length == 0
                        && method.getReturnType() != ViewParent.class) {
                        hostGetter = method;
                    }
                }
            }
            return hostGetter == null ? null : hostGetter.invoke(pieceView);
        } catch (Throwable throwable) {
            return null;
        }
    }

    public static Object call(Object target, String name) {
        if (target == null) return null;
        try {
            return target.getClass().getMethod(name).invoke(target);
        } catch (Throwable throwable) {
            return null;
        }
    }

    public static boolean flip(Object board) {
        if (board != null && V2_BOARD.equals(board.getClass().getName())) {
            synchronized (V2_FLIPPED) {
                return Boolean.TRUE.equals(V2_FLIPPED.get(board));
            }
        }
        return Boolean.TRUE.equals(call(board, "getFlipBoard"));
    }

    /** The position the board shows (com.chess.chessboard.a), or null. */
    public static Object position(Object board) {
        return call(board, "getBoard");
    }

    public static float squareSize(Object board, View fallback) {
        Object size = call(call(board, "getDrawDelegate"), "getSquareSize");
        if (!(size instanceof Float)) size = call(board, "getSquareSize");
        if (size instanceof Float && (Float) size > 0) return (Float) size;
        return fallback == null ? 0 : fallback.getWidth() / 8f;
    }

    /** Index for a layer that must sit above the resting pieces but under the moving ones. */
    public static int indexUnderMovingPieces(ViewGroup pieceView) {
        for (int i = 0; i < pieceView.getChildCount(); i++) {
            if (ANIMATED_PIECE.equals(pieceView.getChildAt(i).getClass().getName())) return i;
        }
        return pieceView.getChildCount();
    }

    /** Keeps a layer the size of the piece view (which only lays out its own children). */
    public static void fill(ViewGroup pieceView, View layer) {
        pieceView.addOnLayoutChangeListener((view, left, top, right, bottom, ol, ot, or, ob) ->
            layer.layout(0, 0, right - left, bottom - top));
        if (pieceView.getWidth() > 0) layer.layout(0, 0, pieceView.getWidth(), pieceView.getHeight());
    }
}
