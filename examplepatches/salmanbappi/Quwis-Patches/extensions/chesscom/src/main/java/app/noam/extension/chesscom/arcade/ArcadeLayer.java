package app.noam.extension.chesscom.arcade;

import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.LinearInterpolator;

import java.util.ArrayList;

import app.noam.extension.chesscom.board.Board;

/**
 * One board's Arcade effects. Each piece view holds two: one under all pieces, as on the website,
 * and one over the resting pieces for the check flash.
 */
final class ArcadeLayer extends View {
    final ViewGroup pieceView;
    final boolean above;
    private final ArrayList<Effect> effects = new ArrayList<>();
    private final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.ANTI_ALIAS_FLAG);
    private final Paint outline = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();

    /** The square under a dragged piece, and that piece's colour. */
    private int hoverSquare = Board.NONE;
    private Boolean dragWhite;
    private View dragged;
    private ValueAnimator pulse;

    ArcadeLayer(ViewGroup pieceView, boolean above) {
        super(pieceView.getContext());
        this.pieceView = pieceView;
        this.above = above;
        setWillNotDraw(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        outline.setStyle(Paint.Style.STROKE);
    }

    void add(Effect effect) {
        if (effect instanceof KingCheck) {
            for (int i = effects.size() - 1; i >= 0; i--) {
                if (effects.get(i) instanceof KingCheck && !((KingCheck) effects.get(i)).started()) effects.remove(i);
            }
        }
        effects.add(effect);
        postInvalidateOnAnimation();
    }

    /** The website's grab: a burst under the piece and a slow pulse while it is held. */
    void startDrag(View piece) {
        endDrag();
        dragged = piece;
        dragWhite = null;
        Burst grab = new Burst(null, now(), Arcade.BURST_SCALE, Board.NONE, piece, true);
        grab.tag = piece;
        add(grab);

        final float base = piece.getScaleX();
        pulse = ValueAnimator.ofFloat(0f, 1f);
        pulse.setDuration(Arcade.PULSE_MS);
        pulse.setRepeatCount(ValueAnimator.INFINITE);
        pulse.setInterpolator(new LinearInterpolator());
        pulse.addUpdateListener(animation -> {
            if (piece.getVisibility() != VISIBLE) {
                animation.cancel();
                return;
            }
            float scale = base * Arcade.keyframes(animation.getAnimatedFraction(), 0.5f, 1f, Arcade.MOVE_SCALE, 1f, true);
            piece.setScaleX(scale);
            piece.setScaleY(scale);
        });
        pulse.start();
    }

    void endDrag() {
        if (pulse != null) pulse.cancel();
        pulse = null;
        if (dragged != null) {
            for (int i = effects.size() - 1; i >= 0; i--) if (effects.get(i).tag == dragged) effects.remove(i);
        }
        dragged = null;
        setHover(Board.NONE);
        invalidate();
    }

    void setHover(int square) {
        if (hoverSquare == square) return;
        hoverSquare = square;
        invalidate();
    }

    /** Colour of the dragged piece, read once it is known. */
    private Boolean dragWhite() {
        if (dragWhite == null && dragged != null) dragWhite = Arcade.pieceWhite(dragged);
        return dragWhite;
    }

    private static long now() {
        return AnimationUtils.currentAnimationTimeMillis();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float size = Arcade.squareSize(pieceView);
        if (size <= 0) return;
        boolean flip = Arcade.flip(pieceView);
        long now = now();

        if (!above && hoverSquare != Board.NONE && dragWhite() != null) {
            float width = size * Arcade.OUTLINE_RATIO;
            float left = Board.left(hoverSquare, flip, size), top = Board.top(hoverSquare, flip, size);
            outline.setStrokeWidth(width);
            outline.setColor(dragWhite() ? Arcade.WHITE_ACCENT : Arcade.BLACK_ACCENT);
            canvas.drawRect(left + width / 2, top + width / 2, left + size - width / 2, top + size - width / 2, outline);
        }

        boolean running = false;
        for (int i = 0; i < effects.size(); ) {
            if (effects.get(i).draw(canvas, now, this, size, flip)) {
                running = true;
                i++;
            } else {
                effects.remove(i);
            }
        }
        if (running) postInvalidateOnAnimation();
    }

    abstract static class Effect {
        Object tag;

        /** Draws one frame; false once the effect is over. */
        abstract boolean draw(Canvas canvas, long now, ArcadeLayer layer, float size, boolean flip);
    }

    /**
     * A sprite sheet played once, centred on a square or on a piece it follows. With no sheet it
     * is the grab burst, whose colour comes from the dragged piece.
     */
    static final class Burst extends Effect {
        private final Sprites.Sheet sheet;
        private final long start;
        private final float scale;
        private final int square;
        private final View follow;
        private final boolean hold;
        private float x = Float.NaN, y = Float.NaN;

        Burst(Sprites.Sheet sheet, long start, float scale, int square, View follow, boolean hold) {
            this.sheet = sheet;
            this.start = start;
            this.scale = scale;
            this.square = square;
            this.follow = follow;
            this.hold = hold;
        }

        @Override
        boolean draw(Canvas canvas, long now, ArcadeLayer layer, float size, boolean flip) {
            if (now < start) return true;
            Sprites.Sheet sheet = this.sheet;
            if (sheet == null) {
                Boolean white = layer.dragWhite();
                if (white == null) return true;
                sheet = Sprites.grab(white);
            }
            long elapsed = now - start;
            if (sheet.bitmap == null) return elapsed < 1000;
            int frame = Sprites.Sheet.frameAt(elapsed);
            if (frame >= sheet.frames()) {
                if (!hold) return false;
                frame = sheet.frames() - 1;
            }
            if (follow != null && follow.getVisibility() == VISIBLE) {
                x = follow.getX() + follow.getWidth() / 2f;
                y = follow.getY() + follow.getHeight() / 2f;
            } else if (square != Board.NONE) {
                x = Board.left(square, flip, size) + size / 2;
                y = Board.top(square, flip, size) + size / 2;
            }
            if (Float.isNaN(x)) return false;
            float half = size * scale / 2;
            layer.rect.set(x - half, y - half, x + half, y + half);
            layer.paint.setAlpha(255);
            sheet.draw(canvas, frame, layer.rect, layer.paint);
            return true;
        }
    }

    /** The light trail behind a moving piece: its tail leaves late and the trail fades at the end. */
    static final class Trail extends Effect {
        private final View piece;
        private final Arcade.MoveState state;
        private final boolean white, vertical, downward, eased;
        private final float fromX, fromY, toX, toY;

        Trail(View piece, Arcade.MoveState state, boolean white, float fromX, float fromY, float toX, float toY,
              boolean vertical, boolean eased) {
            this.piece = piece;
            this.state = state;
            this.white = white;
            this.fromX = fromX;
            this.fromY = fromY;
            this.toX = toX;
            this.toY = toY;
            this.vertical = vertical;
            this.downward = vertical && toY > fromY;
            this.eased = eased;
        }

        @Override
        boolean draw(Canvas canvas, long now, ArcadeLayer layer, float size, boolean flip) {
            float t = state.progress(now);
            if (t >= 1f || piece.getVisibility() != VISIBLE) return false;
            Sprites.Sheet sheet = Sprites.trail(white);
            if (sheet.bitmap == null) return true;

            float headX = piece.getX() + piece.getWidth() / 2f;
            float headY = piece.getY() + piece.getHeight() / 2f;
            float tail = Arcade.keyframes(t, downward ? 0.5f : 0.3f, 0f, 0f, 1f, eased);
            float tailX = fromX + (toX - fromX) * tail;
            float tailY = fromY + (toY - fromY) * tail;
            float opacity = t <= 0.6f ? 1f : 1f - Arcade.ease((t - 0.6f) / 0.4f, eased);
            float offset = vertical ? size * Arcade.TRAIL_OFFSET_RATIO : 0f;

            float dx = headX - tailX, dy = headY - tailY;
            float length = (float) Math.hypot(dx, dy);
            if (length < 1f) return true;
            float width = size * Arcade.TRAIL_WIDTH_RATIO;
            int saved = canvas.save();
            canvas.translate(tailX, tailY + offset);
            canvas.rotate((float) Math.toDegrees(Math.atan2(dy, dx)));
            layer.rect.set(0, -width / 2, length, width / 2);
            layer.paint.setAlpha(Math.round(255 * opacity));
            sheet.draw(canvas, 0, layer.rect, layer.paint);
            canvas.restoreToCount(saved);
            layer.paint.setAlpha(255);
            return true;
        }
    }

    /** After a move: if it gives check, the website's flash over the checked king. */
    static final class KingCheck extends Effect {
        private final boolean white;
        private final long start;
        private Burst burst;
        private boolean checked;

        KingCheck(boolean white, long start) {
            this.white = white;
            this.start = start;
        }

        boolean started() {
            return checked;
        }

        @Override
        boolean draw(Canvas canvas, long now, ArcadeLayer layer, float size, boolean flip) {
            if (now < start) return true;
            if (!checked) {
                checked = true;
                int king = Board.checkedKing(Board.position(Arcade.board(layer.pieceView)), white);
                if (king == Board.NONE) return false;
                burst = new Burst(Sprites.KING_CHECK, now, Arcade.CHECK_SCALE, king, null, false);
            }
            return burst != null && burst.draw(canvas, now, layer, size, flip);
        }
    }

    static int accent(boolean white, int alpha) {
        int color = white ? Arcade.WHITE_ACCENT : Arcade.BLACK_ACCENT;
        return Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color));
    }
}
