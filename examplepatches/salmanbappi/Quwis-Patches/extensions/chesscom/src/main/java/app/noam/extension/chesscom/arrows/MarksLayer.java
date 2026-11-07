package app.noam.extension.chesscom.arrows;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.view.View;
import android.view.ViewGroup;

import java.util.Locale;

import app.noam.extension.chesscom.board.Board;
import app.noam.extension.chesscom.board.BoardViews;

/**
 * A board's marked squares (under the pieces) or arrows (over the resting pieces), in the
 * website's arrow geometry. Knight moves bend after their two-square leg.
 */
final class MarksLayer extends View {
    private static final float HALF_WIDTH = 8 * 0.0275f / 2;
    private static final float HEAD_LENGTH = 8 * 0.045f;
    private static final float HEAD_HALF_WIDTH = 8 * 0.065f / 2;
    private static final float TAIL_PADDING = 8 * 0.045f;
    /** Stockfish's lines, best first: blue, fading for the weaker ones. */
    private static final int[] ENGINE_COLORS = {0xCC1D6FD6, 0x801D6FD6, 0x501D6FD6};

    private final ViewGroup pieceView;
    private final View board;
    private final Arrows.Marks marks;
    private final boolean arrows;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();
    private final Paint frame = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint bar = new Paint();
    private final Paint pill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint label = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();

    MarksLayer(ViewGroup pieceView, View board, Arrows.Marks marks, boolean arrows) {
        super(pieceView.getContext());
        this.pieceView = pieceView;
        this.board = board;
        this.marks = marks;
        this.arrows = arrows;
        setWillNotDraw(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        paint.setStyle(Paint.Style.FILL);
        frame.setStyle(Paint.Style.STROKE);
        frame.setColor(Arrows.ARROW_COLOR);
        pill.setColor(0xCC1E1D1B);
        label.setColor(0xFFFFFFFF);
        label.setTypeface(Typeface.DEFAULT_BOLD);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float size = BoardViews.squareSize(board, pieceView);
        if (size <= 0) return;
        boolean flip = BoardViews.flip(board);
        if (!arrows) {
            paint.setColor(Arrows.SQUARE_COLOR);
            for (int square : marks.squares) {
                float left = Board.left(square, flip, size), top = Board.top(square, flip, size);
                canvas.drawRect(left, top, left + size, top + size, paint);
            }
            return;
        }
        int[][] engine = marks.engineMoves;
        for (int i = engine.length - 1; i >= 0; i--) {
            paint.setColor(ENGINE_COLORS[Math.min(i, ENGINE_COLORS.length - 1)]);
            drawArrow(canvas, engine[i][0], engine[i][1], size, flip);
        }
        if (!Float.isNaN(marks.engineScore)) drawEval(canvas, size, flip);
        paint.setColor(Arrows.ARROW_COLOR);
        for (int[] arrow : marks.arrows) drawArrow(canvas, arrow[0], arrow[1], size, flip);
        if (marks.drawing) {
            // Drawing mode: an orange frame round the board says pieces won't move.
            float width = size * 0.06f;
            frame.setStrokeWidth(width);
            canvas.drawRect(width / 2, width / 2, size * 8 - width / 2, size * 8 - width / 2, frame);
        }
        if (marks.drawing && marks.start != Board.NONE && marks.current != Board.NONE && marks.current != marks.start) {
            drawArrow(canvas, marks.start, marks.current, size, flip);
        }
    }

    /** A bar on the board's left edge, White's share growing from White's side, and the score. */
    private void drawEval(Canvas canvas, float size, boolean flip) {
        float height = size * 8, width = size * 0.16f;
        float white = height * whiteShare();
        bar.setColor(0xD92B2926);
        canvas.drawRect(0, 0, width, height, bar);
        bar.setColor(0xE6F2F2F2);
        if (flip) canvas.drawRect(0, 0, width, white, bar);
        else canvas.drawRect(0, height - white, width, height, bar);

        String text = scoreText();
        label.setTextSize(size * 0.26f);
        float pad = size * 0.08f, left = width + size * 0.06f, top = size * 0.06f;
        rect.set(left, top, left + label.measureText(text) + 2 * pad, top + label.getTextSize() + 1.4f * pad);
        canvas.drawRoundRect(rect, rect.height() / 2, rect.height() / 2, pill);
        canvas.drawText(text, left + pad, top + 0.7f * pad - label.ascent(), label);
    }

    /** White's winning chances, 0 to 1, on Lichess's curve. */
    private float whiteShare() {
        float score = marks.engineScore;
        if (marks.engineMate != 0) return marks.engineMate > 0 ? 1f : 0f;
        if (Math.abs(score) >= 90) return score > 0 ? 1f : 0f;
        double chances = 2 / (1 + Math.exp(-0.368208 * score)) - 1;
        return (float) (chances + 1) / 2;
    }

    private String scoreText() {
        int mate = marks.engineMate;
        if (mate != 0) return mate > 0 ? "M" + mate : "-M" + -mate;
        float score = marks.engineScore;
        if (marks.engineOver) return Math.abs(score) >= 90 ? "#" : "0.0";
        if (Math.abs(score) < 0.05f) return "0.0";
        return String.format(Locale.ROOT, "%+.1f", score);
    }

    private void drawArrow(Canvas canvas, int from, int to, float size, boolean flip) {
        float fromX = Board.left(from, flip, size) + size / 2, fromY = Board.top(from, flip, size) + size / 2;
        float toX = Board.left(to, flip, size) + size / 2, toY = Board.top(to, flip, size) + size / 2;
        float dx = toX - fromX, dy = toY - fromY;
        int files = Math.abs(to % 8 - from % 8), ranks = Math.abs(to / 8 - from / 8);
        float n = HALF_WIDTH * size, r = HEAD_LENGTH * size, a = HEAD_HALF_WIDTH * size, tail = TAIL_PADDING * size;

        float[] points;
        // Local frame: y runs along the arrow (the long leg for a knight), x across it.
        float alongX, alongY, acrossX, acrossY;
        if (files * ranks == 2) {
            boolean verticalFirst = Math.abs(dy) > Math.abs(dx);
            alongX = verticalFirst ? 0 : Math.signum(dx);
            alongY = verticalFirst ? Math.signum(dy) : 0;
            acrossX = verticalFirst ? Math.signum(dx) : 0;
            acrossY = verticalFirst ? 0 : Math.signum(dy);
            float leg = 2 * size, tip = size, neck = tip - r;
            points = new float[]{
                -n, tail, -n, leg + n, neck, leg + n, neck, leg + a, tip, leg,
                neck, leg - a, neck, leg - n, n, leg - n, n, tail,
            };
        } else {
            float length = (float) Math.hypot(dx, dy);
            if (length <= 0) return;
            alongX = dx / length;
            alongY = dy / length;
            acrossX = -alongY;
            acrossY = alongX;
            float neck = length - r;
            points = new float[]{-n, tail, -n, neck, -a, neck, 0, length, a, neck, n, neck, n, tail};
        }

        path.reset();
        for (int i = 0; i < points.length; i += 2) {
            float x = fromX + points[i] * acrossX + points[i + 1] * alongX;
            float y = fromY + points[i] * acrossY + points[i + 1] * alongY;
            if (i == 0) path.moveTo(x, y);
            else path.lineTo(x, y);
        }
        path.close();
        canvas.drawPath(path, paint);
    }
}
