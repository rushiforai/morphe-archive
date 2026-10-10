package app.noam.extension.chesscom.arcade;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.view.View;
import android.view.animation.AnimationUtils;

import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.board.BoardColors;

/** The settings preview: chess.com's knight hops about a small board with the Arcade effects. */
public final class ArcadePreview extends View {
    private static final int FILES = 6, RANKS = 3;
    /** The knight's tour on the preview board (file, rank from the bottom), capturing every other move. */
    private static final int[][] TOUR = {{1, 0}, {3, 1}, {5, 2}, {4, 0}, {2, 1}, {0, 2}};
    private static final long PAUSE_MS = 650;

    private final Paint board = new Paint();
    private final Paint sprite = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.ANTI_ALIAS_FLAG);
    private final Paint piece = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint outline = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint victim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint note = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();
    private final Rect source = new Rect();
    /** chess.com's own pieces (each image holds the piece at full size on top, smaller ones below). */
    private final Bitmap knight = piece("wn"), pawn = piece("bp");
    private final long started = AnimationUtils.currentAnimationTimeMillis();

    public ArcadePreview(Context context) {
        super(context);
        piece.setColor(Color.WHITE);
        piece.setTextAlign(Paint.Align.CENTER);
        piece.setTypeface(Typeface.DEFAULT_BOLD);
        outline.setColor(0xFF262421);
        outline.setTextAlign(Paint.Align.CENTER);
        outline.setTypeface(Typeface.DEFAULT_BOLD);
        outline.setStyle(Paint.Style.STROKE);
        victim.setColor(0xFF262421);
        victim.setTextAlign(Paint.Align.CENTER);
        note.setColor(0xFFB4B2B0);
        note.setTextAlign(Paint.Align.CENTER);
        Sprites.prepare();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float size = Math.min(getWidth() / (float) FILES, getHeight() / (float) RANKS);
        float left = (getWidth() - size * FILES) / 2, top = (getHeight() - size * RANKS) / 2;
        int light = BoardColors.enabled() ? BoardColors.light() : 0xFFEDEED1;
        int dark = BoardColors.enabled() ? BoardColors.dark() : 0xFF779952;
        for (int rank = 0; rank < RANKS; rank++) {
            for (int file = 0; file < FILES; file++) {
                board.setColor((file + rank) % 2 == 1 ? light : dark);
                float x = left + file * size, y = top + (RANKS - 1 - rank) * size;
                canvas.drawRect(x, y, x + size, y + size, board);
            }
        }

        long cycle = Arcade.MOVE_MS + PAUSE_MS;
        long elapsed = AnimationUtils.currentAnimationTimeMillis() - started;
        int move = (int) (elapsed / cycle);
        long inMove = elapsed % cycle;
        int[] from = TOUR[move % TOUR.length], to = TOUR[(move + 1) % TOUR.length];
        boolean capture = move % 2 == 0;
        float fromX = left + (from[0] + 0.5f) * size, fromY = top + (RANKS - 0.5f - from[1]) * size;
        float toX = left + (to[0] + 0.5f) * size, toY = top + (RANKS - 0.5f - to[1]) * size;
        float t = Math.min(1f, inMove / (float) Arcade.MOVE_MS);
        float along = t >= Arcade.MOVE_LANDS ? 1f : t / Arcade.MOVE_LANDS;
        float x = fromX + (toX - fromX) * along, y = fromY + (toY - fromY) * along;
        float scale = t >= Arcade.MOVE_LANDS ? 1f
            : Arcade.keyframes(t / Arcade.MOVE_LANDS, 0.5f, 1f, Arcade.MOVE_SCALE, 1f, false);

        boolean ready = Sprites.trail(true).bitmap != null;
        // The piece about to be taken shrinks away, as on the website.
        if (capture) {
            float shrink = inMove < Arcade.MOVE_MS * Arcade.CAPTURE_DELAY ? 1f
                : Math.max(0f, 1f - (inMove - Arcade.MOVE_MS * Arcade.CAPTURE_DELAY) / 150f);
            if (shrink > 0) drawPiece(canvas, pawn, "♟", toX, toY, size * shrink, victim, null);
        }
        if (ready) {
            // Under the piece: square fill after landing, capture burst, trail.
            long landed = inMove - Math.round(Arcade.MOVE_MS * Arcade.MOVE_LANDS);
            if (landed >= 0) burst(canvas, Sprites.squareFill(true), landed, toX, toY, size);
            if (capture) burst(canvas, Sprites.CAPTURE, inMove - Math.round(Arcade.MOVE_MS * Arcade.CAPTURE_DELAY), toX, toY, size);
            if (t < 1f) trail(canvas, t, fromX, fromY, toX, toY, x, y, size);
        }
        drawPiece(canvas, knight, "♞", x, y, size * scale, piece, outline);
        if (!ready) {
            note.setTextSize(size * 0.2f);
            canvas.drawText("Loading the Arcade effects from chess.com…", getWidth() / 2f, top + size * RANKS - size * 0.1f, note);
        }
        postInvalidateOnAnimation();
    }

    private void burst(Canvas canvas, Sprites.Sheet sheet, long elapsed, float x, float y, float size) {
        if (elapsed < 0 || sheet.bitmap == null) return;
        int frame = Sprites.Sheet.frameAt(elapsed);
        if (frame >= sheet.frames()) return;
        rect.set(x - size / 2, y - size / 2, x + size / 2, y + size / 2);
        sheet.draw(canvas, frame, rect, sprite);
    }

    private void trail(Canvas canvas, float t, float fromX, float fromY, float toX, float toY, float headX, float headY, float size) {
        float tail = Arcade.keyframes(t, 0.3f, 0f, 0f, 1f, false);
        float tailX = fromX + (toX - fromX) * tail, tailY = fromY + (toY - fromY) * tail;
        float dx = headX - tailX, dy = headY - tailY;
        float length = (float) Math.hypot(dx, dy);
        if (length < 1f) return;
        float width = size * Arcade.TRAIL_WIDTH_RATIO;
        float opacity = t <= 0.6f ? 1f : 1f - (t - 0.6f) / 0.4f;
        int saved = canvas.save();
        canvas.translate(tailX, tailY);
        canvas.rotate((float) Math.toDegrees(Math.atan2(dy, dx)));
        rect.set(0, -width / 2, length, width / 2);
        sprite.setAlpha(Math.round(255 * opacity));
        Sprites.trail(true).draw(canvas, 0, rect, sprite);
        sprite.setAlpha(255);
        canvas.restoreToCount(saved);
    }

    private Bitmap piece(String name) {
        int id = Utils.resourceId(name, "drawable");
        if (id == 0) return null;
        try {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inScaled = false;
            return BitmapFactory.decodeResource(getResources(), id, options);
        } catch (Throwable throwable) {
            return null;
        }
    }

    private void drawPiece(Canvas canvas, Bitmap bitmap, String glyph, float x, float y, float size, Paint fill, Paint stroke) {
        if (bitmap == null) {
            drawGlyph(canvas, glyph, x, y, size, fill, stroke);
            return;
        }
        int side = Math.min(bitmap.getWidth(), bitmap.getHeight());
        source.set(0, 0, side, side);
        rect.set(x - size / 2, y - size / 2, x + size / 2, y + size / 2);
        canvas.drawBitmap(bitmap, source, rect, sprite);
    }

    private static void drawGlyph(Canvas canvas, String glyph, float x, float y, float size, Paint fill, Paint stroke) {
        fill.setTextSize(size * 0.85f);
        float baseline = y - (fill.descent() + fill.ascent()) / 2;
        if (stroke != null) {
            stroke.setTextSize(size * 0.85f);
            stroke.setStrokeWidth(size * 0.05f);
            canvas.drawText(glyph, x, baseline, stroke);
        }
        canvas.drawText(glyph, x, baseline, fill);
    }
}
