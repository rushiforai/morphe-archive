package app.wordfeudwordfinder.extension.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.View;
import app.wordfeudwordfinder.extension.game.BoardLayout;
import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.solver.Move;
import app.wordfeudwordfinder.extension.solver.Rules;

/**
 * Read-only 15x15 preview board (spec section 9): bonus squares with short labels, existing tiles, and the
 * selected move's new tiles (white, blue border) with a score bubble on the last new tile. Always square,
 * not zoomable. Lower-case board letters are blanks (worth 0).
 */
public final class BoardPreviewView extends View {
    private static final int N = Rules.SIZE;

    private final Theme theme;
    private final TileDrawable tile;
    private final Paint squarePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint labelPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF cell = new RectF();
    private final float gap;

    private char[][] board;
    private int[][] squares;
    private Ruleset ruleset;
    private Move move;
    private String lang = "en";
    /** New-tile letters of {@link #move}, indexed [y][x]; '\0' = none. */
    private final char[][] newTiles = new char[N][N];

    public BoardPreviewView(Context ctx, Theme theme) {
        super(ctx);
        this.theme = theme;
        float density = ctx.getResources().getDisplayMetrics().density;
        this.gap = Math.max(1f, density);
        this.tile = new TileDrawable(theme, Fonts.inter(ctx), Fonts.inter(ctx));
        squarePaint.setStyle(Paint.Style.FILL);
        labelPaint.setTextAlign(Paint.Align.CENTER);
        labelPaint.setTypeface(Fonts.interBold(ctx));
        labelPaint.setColor(theme.squareLabel);
    }

    /** Sets the board ([y][x], '\0' = empty), its bonus layout and the ruleset for point values. */
    public void setBoard(char[][] board, BoardLayout layout, Ruleset rs) {
        this.board = copy(board);
        this.squares = layout == null ? null : layout.getSquares();
        this.ruleset = rs;
        invalidate();
    }

    /** Language for the bonus-square labels (from {@link Strings}); null means the fallback (English). */
    public void setLanguage(String lang) {
        this.lang = lang;
        invalidate();
    }

    /** Highlights a move's new tiles; null clears the highlight. */
    public void setMove(Move m) {
        this.move = m;
        for (char[] row : newTiles) java.util.Arrays.fill(row, '\0');
        if (m != null) {
            for (int i = 0; i < m.placed.size(); i++) {
                int[] xy = m.placed.get(i);
                String l = i < m.placedLetters.size() ? m.placedLetters.get(i) : "";
                if (inside(xy[0], xy[1]) && !l.isEmpty()) newTiles[xy[1]][xy[0]] = l.charAt(0);
            }
        }
        invalidate();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int w = MeasureSpec.getSize(widthMeasureSpec);
        int h = MeasureSpec.getSize(heightMeasureSpec);
        int wm = MeasureSpec.getMode(widthMeasureSpec);
        int hm = MeasureSpec.getMode(heightMeasureSpec);
        int size;
        if (wm == MeasureSpec.UNSPECIFIED && hm == MeasureSpec.UNSPECIFIED) {
            size = Math.round(300 * getResources().getDisplayMetrics().density);
        } else if (wm == MeasureSpec.UNSPECIFIED) {
            size = h;
        } else if (hm == MeasureSpec.UNSPECIFIED) {
            size = w;
        } else {
            size = Math.min(w, h);
        }
        setMeasuredDimension(size, size);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        int size = Math.min(getWidth(), getHeight());
        if (size <= 0) return;
        // Centre the square board when the view is larger than it in one direction.
        int save = canvas.save();
        canvas.translate((getWidth() - size) / 2f, (getHeight() - size) / 2f);
        try {
            drawBoard(canvas, size);
        } finally {
            canvas.restoreToCount(save);
        }
    }

    private void drawBoard(Canvas canvas, int size) {
        squarePaint.setColor(theme.boardBackground);
        canvas.drawRect(0, 0, size, size, squarePaint);
        float c = (size - gap * (N + 1)) / N;
        if (c <= 0) return;
        labelPaint.setTextSize(c * 0.36f);
        float labelDy = -(labelPaint.descent() + labelPaint.ascent()) / 2f;

        int lastX = -1, lastY = -1;
        if (move != null && !move.placed.isEmpty()) {
            int[] last = move.placed.get(move.placed.size() - 1);
            lastX = last[0];
            lastY = last[1];
        }

        for (int y = 0; y < N; y++) {
            for (int x = 0; x < N; x++) {
                float left = gap + x * (c + gap);
                float top = gap + y * (c + gap);
                cell.set(left, top, left + c, top + c);
                char existing = letterAt(x, y);
                char added = newTiles[y][x];
                if (added != '\0') {
                    drawTile(canvas, added, TileDrawable.State.NEW);
                } else if (existing != '\0') {
                    drawTile(canvas, existing, TileDrawable.State.NORMAL);
                } else {
                    int code = squareAt(x, y);
                    squarePaint.setColor(theme.bonusColor(code));
                    canvas.drawRoundRect(cell, c * 0.12f, c * 0.12f, squarePaint);
                    String label = OverlayFormat.bonusLabel(lang, code);
                    if (label != null) canvas.drawText(label, cell.centerX(), cell.centerY() + labelDy, labelPaint);
                }
            }
        }

        if (move != null && inside(lastX, lastY)) {
            float r = c * 0.42f;
            float left = gap + lastX * (c + gap);
            float top = gap + lastY * (c + gap);
            String text = String.valueOf(move.score);
            float half = tile.badgeHalfWidth(r, text);
            // Top-right corner of the last tile, kept inside the board (pill width included).
            float cx = Math.min(left + c, size - half);
            float cy = Math.max(top, r);
            tile.drawBadge(canvas, cx, cy, r, text, 255);
        }
    }

    private void drawTile(Canvas canvas, char ch, TileDrawable.State state) {
        tile.set(OverlayFormat.displayLetter(ch), OverlayFormat.letterPoints(ruleset, ch), state, null);
        tile.setBounds(Math.round(cell.left), Math.round(cell.top), Math.round(cell.right), Math.round(cell.bottom));
        tile.draw(canvas);
    }

    private char letterAt(int x, int y) {
        if (board == null || y >= board.length || board[y] == null || x >= board[y].length) return '\0';
        return board[y][x];
    }

    private int squareAt(int x, int y) {
        if (squares == null || y >= squares.length || squares[y] == null || x >= squares[y].length) return 0;
        return squares[y][x];
    }

    private static boolean inside(int x, int y) {
        return x >= 0 && y >= 0 && x < N && y < N;
    }

    private static char[][] copy(char[][] b) {
        if (b == null) return null;
        char[][] c = new char[b.length][];
        for (int i = 0; i < b.length; i++) c[i] = b[i] == null ? null : b[i].clone();
        return c;
    }
}
