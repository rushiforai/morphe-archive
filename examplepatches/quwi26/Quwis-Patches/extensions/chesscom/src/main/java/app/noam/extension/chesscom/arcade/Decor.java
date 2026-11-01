package app.noam.extension.chesscom.arcade;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.animation.AnimationUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.noam.extension.chesscom.board.Board;

/**
 * What Arcade draws under the pieces: the last move outlined in the mover's colour and the
 * website's move hints. State is kept per painter, so per board.
 */
final class Decor {
    private Decor() {}

    private static final Paint OUTLINE = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static final Paint SPRITE = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.ANTI_ALIAS_FLAG);
    private static final RectF RECT = new RectF();

    static {
        OUTLINE.setStyle(Paint.Style.STROKE);
    }

    private static final class Highlight {
        String key;
        int[] squares = new int[0];
        boolean white = true;
        int[] previous = new int[0];
        boolean previousWhite = true;
        long changed;
    }

    private static final Map<Object, Highlight> HIGHLIGHTS = new WeakHashMap<>();

    static void drawLastMove(Object show, Object squares, Canvas canvas, boolean flip, float size, Object board,
                             Object painter) {
        long now = AnimationUtils.currentAnimationTimeMillis();
        Highlight state = HIGHLIGHTS.get(painter);
        if (state == null) {
            state = new Highlight();
            HIGHLIGHTS.put(painter, state);
        }
        int[] current = Boolean.TRUE.equals(show) && squares instanceof Iterable ? squares((Iterable<?>) squares) : new int[0];
        String key = Arrays.toString(current);
        if (!key.equals(state.key)) {
            state.previous = state.squares;
            state.previousWhite = state.white;
            state.squares = current;
            state.white = moverWhite(Board.position(board), current);
            state.key = key;
            state.changed = now;
        }
        float fade = Arcade.easeOutQuad((now - state.changed) / (float) Arcade.HIGHLIGHT_FADE_MS);
        outline(canvas, state.squares, state.white, fade, flip, size);
        if (fade < 1f) {
            outline(canvas, state.previous, state.previousWhite, 1f - fade, flip, size);
            Arcade.animateBoards(state.changed + Arcade.HIGHLIGHT_FADE_MS);
        }
    }

    private static int[] squares(Iterable<?> items) {
        List<Integer> list = new ArrayList<>();
        for (Object item : items) {
            int square = Board.square(item);
            if (square != Board.NONE) list.add(square);
        }
        int[] result = new int[list.size()];
        for (int i = 0; i < result.length; i++) result[i] = list.get(i);
        return result;
    }

    /** The side that made the move: the colour of the piece now standing on one of its squares. */
    private static boolean moverWhite(char[] position, int[] squares) {
        if (position != null) {
            for (int square : squares) if (position[square] != 0) return Character.isUpperCase(position[square]);
        }
        return true;
    }

    private static void outline(Canvas canvas, int[] squares, boolean white, float opacity, boolean flip, float size) {
        if (squares.length == 0 || opacity <= 0) return;
        float width = size * Arcade.OUTLINE_RATIO;
        OUTLINE.setStrokeWidth(width);
        OUTLINE.setColor(ArcadeLayer.accent(white, Math.round(255 * opacity)));
        for (int square : squares) {
            float left = Board.left(square, flip, size), top = Board.top(square, flip, size);
            canvas.drawRect(left + width / 2, top + width / 2, left + size - width / 2, top + size - width / 2, OUTLINE);
        }
    }

    private static final int SHOW = 0, OVER = 1, OUT = 2, HIDE = 3;

    private static final class Hint {
        final int square;
        final boolean capture;
        int state;
        long start;

        Hint(int square, boolean capture, int state, long start) {
            this.square = square;
            this.capture = capture;
            this.state = state;
            this.start = start;
        }

        Sprites.Sheet sheet() {
            switch (state) {
                case OVER: return capture ? Sprites.CAPTURE_HINT_OVER : Sprites.MOVE_HINT_OVER;
                case OUT: return capture ? Sprites.CAPTURE_HINT_OUT : Sprites.MOVE_HINT_OUT;
                case HIDE: return capture ? Sprites.CAPTURE_HINT_HIDE : Sprites.MOVE_HINT_HIDE;
                default: return capture ? Sprites.CAPTURE_HINT_SHOW : Sprites.MOVE_HINT_SHOW;
            }
        }
    }

    private static final Map<Object, Map<Integer, Hint>> HINTS = new WeakHashMap<>();

    /** False while the hint sprites are not loaded: the app then draws its own dots. */
    static boolean drawHints(Object show, Object hints, Canvas canvas, boolean flip, float size, Object painter) {
        if (Sprites.MOVE_HINT_SHOW.bitmap == null || Sprites.CAPTURE_HINT_SHOW.bitmap == null) {
            Sprites.prepare();
            return false;
        }
        long now = AnimationUtils.currentAnimationTimeMillis();
        Map<Integer, Hint> state = HINTS.get(painter);
        if (state == null) {
            state = new LinkedHashMap<>();
            HINTS.put(painter, state);
        }

        Set<Integer> current = new HashSet<>();
        if (Boolean.TRUE.equals(show) && hints instanceof Iterable) {
            for (Object item : (Iterable<?>) hints) {
                int hint = Board.hint(item);
                if (hint == Board.NONE) continue;
                boolean capture = hint < 0;
                int square = capture ? -1 - hint : hint;
                current.add(square);
                Hint existing = state.get(square);
                if (existing == null || existing.state == HIDE || existing.capture != capture) {
                    state.put(square, new Hint(square, capture, SHOW, now));
                }
            }
        }

        int hover = Arcade.hoverSquare();
        boolean animating = false;
        for (Iterator<Hint> iterator = state.values().iterator(); iterator.hasNext(); ) {
            Hint hint = iterator.next();
            if (hint.state != HIDE && !current.contains(hint.square)) {
                hint.state = HIDE;
                hint.start = now;
            } else if (hint.state != HIDE && hint.square == hover && hint.state != OVER) {
                hint.state = OVER;
                hint.start = now;
            } else if (hint.state == OVER && hint.square != hover) {
                hint.state = OUT;
                hint.start = now;
            }

            Sprites.Sheet sheet = hint.sheet();
            if (sheet.bitmap == null) {
                if (hint.state == HIDE) iterator.remove();
                continue;
            }
            int frame = Sprites.Sheet.frameAt(now - hint.start);
            if (frame >= sheet.frames()) {
                if (hint.state == HIDE) {
                    iterator.remove();
                    continue;
                }
                frame = sheet.frames() - 1;
            } else {
                animating = true;
            }
            float left = Board.left(hint.square, flip, size), top = Board.top(hint.square, flip, size);
            RECT.set(left, top, left + size, top + size);
            sheet.draw(canvas, frame, RECT, SPRITE);
        }
        if (animating) Arcade.animateBoards(now + 100);
        return true;
    }
}
