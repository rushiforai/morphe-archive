package app.noam.extension.chesscom.arrows;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.noam.extension.chesscom.Features;
import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.board.Board;
import app.noam.extension.chesscom.board.BoardViews;

/**
 * Arrows and marked squares like the website's right-click ones. While drawing is on, a drag draws
 * an arrow and a tap marks a square; doing it again removes it.
 */
public final class Arrows {
    /** The website's defaults: orange arrows and red marked squares, both at 80 %. */
    static final int ARROW_COLOR = 0xCCFFAA00;
    static final int SQUARE_COLOR = 0xCCEB6150;

    static final class Marks {
        final List<int[]> arrows = new ArrayList<>();
        final Set<Integer> squares = new LinkedHashSet<>();
        final List<WeakReference<View>> layers = new ArrayList<>();
        boolean drawing;
        int start = Board.NONE;
        int current = Board.NONE;

        boolean isEmpty() {
            return arrows.isEmpty() && squares.isEmpty();
        }

        void toggleArrow(int from, int to) {
            for (Iterator<int[]> iterator = arrows.iterator(); iterator.hasNext(); ) {
                int[] arrow = iterator.next();
                if (arrow[0] == from && arrow[1] == to) {
                    iterator.remove();
                    return;
                }
            }
            arrows.add(new int[]{from, to});
        }

        void toggleSquare(int square) {
            if (!squares.remove(square)) squares.add(square);
        }

        void invalidate() {
            for (Iterator<WeakReference<View>> iterator = layers.iterator(); iterator.hasNext(); ) {
                View layer = iterator.next().get();
                if (layer == null) iterator.remove();
                else layer.invalidate();
            }
        }
    }

    private static final Map<View, Marks> MARKS = new WeakHashMap<>();
    private static final List<WeakReference<ArrowsButton>> BUTTONS = new ArrayList<>();

    private Arrows() {}

    public static boolean enabled() {
        return Features.arrowsPatched() && Features.isEnabled(Features.ARROWS);
    }

    /** The newer (v2) board, once built: its piece view gets the marks layers. */
    public static void attachBoard(ViewGroup board) {
        if (board == null || !enabled()) return;
        for (int i = 0; i < board.getChildCount(); i++) {
            View child = board.getChildAt(i);
            if (child instanceof ViewGroup && BoardViews.V2_PIECES.equals(child.getClass().getName())) {
                attach((ViewGroup) child);
                return;
            }
        }
    }

    /** Called once a board's piece view has its layers: adds the marks layers. */
    public static void attach(ViewGroup pieceView) {
        if (pieceView == null || !enabled()) return;
        try {
            Object host = BoardViews.host(pieceView);
            if (!(host instanceof View) || MARKS.containsKey(host)) return;
            View board = (View) host;
            Marks marks = new Marks();
            MarksLayer squares = new MarksLayer(pieceView, board, marks, false);
            MarksLayer arrows = new MarksLayer(pieceView, board, marks, true);
            // Marked squares under the pieces; arrows over the resting pieces, as on the website.
            pieceView.addView(squares, 0);
            pieceView.addView(arrows, BoardViews.indexUnderMovingPieces(pieceView));
            BoardViews.fill(pieceView, squares);
            BoardViews.fill(pieceView, arrows);
            marks.layers.add(new WeakReference<>(squares));
            marks.layers.add(new WeakReference<>(arrows));
            MARKS.put(board, marks);
        } catch (Throwable throwable) {
            Utils.logError("Arrow layers failed", throwable);
        }
    }

    /** ChessBoardView.onTouchEvent: true when the touch drew instead of reaching the board. */
    public static boolean onTouch(View board, MotionEvent event) {
        Marks marks = MARKS.get(board);
        if (marks == null || !marks.drawing) return false;
        int square = squareAt(board, event.getX(), event.getY());
        ViewParent parent = board.getParent();
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
                marks.start = square;
                marks.current = square;
                break;
            case MotionEvent.ACTION_MOVE:
                if (square != Board.NONE) marks.current = square;
                break;
            case MotionEvent.ACTION_UP:
                if (marks.start != Board.NONE && square != Board.NONE) {
                    if (square == marks.start) marks.toggleSquare(square);
                    else marks.toggleArrow(marks.start, square);
                }
                // Fall through: the gesture is over.
            case MotionEvent.ACTION_CANCEL:
                if (parent != null) parent.requestDisallowInterceptTouchEvent(false);
                marks.start = Board.NONE;
                marks.current = Board.NONE;
                refreshButtons();
                break;
            default:
                break;
        }
        marks.invalidate();
        return true;
    }

    private static int squareAt(View board, float x, float y) {
        float size = BoardViews.squareSize(board, board);
        if (size <= 0 || x < 0 || y < 0) return Board.NONE;
        int column = (int) (x / size), row = (int) (y / size);
        if (column > 7 || row > 7) return Board.NONE;
        boolean flip = BoardViews.flip(board);
        int file = flip ? 7 - column : column;
        int rank = flip ? row : 7 - row;
        return file + 8 * rank;
    }

    static void register(ArrowsButton button) {
        BUTTONS.add(new WeakReference<>(button));
    }

    /** The board on the same screen as {@code view}. */
    private static Marks marksNear(View view) {
        View root = view.getRootView();
        Marks fallback = null;
        for (Map.Entry<View, Marks> entry : MARKS.entrySet()) {
            View board = entry.getKey();
            if (board == null || board.getRootView() != root) continue;
            if (board.isShown()) return entry.getValue();
            fallback = entry.getValue();
        }
        return fallback;
    }

    /** Switches the board between moving pieces and drawing; false when there is no board. */
    static boolean toggleDrawing(View button) {
        Marks marks = marksNear(button);
        if (marks == null) {
            Utils.toast("Open a board first");
            return false;
        }
        marks.drawing = !marks.drawing;
        marks.start = Board.NONE;
        marks.current = Board.NONE;
        marks.invalidate();
        refreshButtons();
        return true;
    }

    static void clear(View button) {
        Marks marks = marksNear(button);
        if (marks == null) return;
        marks.arrows.clear();
        marks.squares.clear();
        marks.invalidate();
        refreshButtons();
    }

    static boolean drawing(View button) {
        Marks marks = marksNear(button);
        return marks != null && marks.drawing;
    }

    static boolean hasMarks(View button) {
        Marks marks = marksNear(button);
        return marks != null && !marks.isEmpty();
    }

    private static void refreshButtons() {
        for (Iterator<WeakReference<ArrowsButton>> iterator = BUTTONS.iterator(); iterator.hasNext(); ) {
            ArrowsButton button = iterator.next().get();
            if (button == null) iterator.remove();
            else button.refresh();
        }
        ArrowsBar.changed();
    }
}
