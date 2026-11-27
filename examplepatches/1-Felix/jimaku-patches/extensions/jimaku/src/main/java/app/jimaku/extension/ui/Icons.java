package app.jimaku.extension.ui;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;

import app.jimaku.extension.shared.IconPaths;

/**
 * The extension's icons as Android paths, built from the path data {@code lib/icons.ts} keeps.
 * Material Symbols sit in a 960-unit grid from y = -960; {@link #draw} scales one into a square.
 */
public final class Icons {
    /** An icon: a filled path, or a stroked one, in its own grid. */
    public static final class Icon {
        final Path path;
        final float gridX;
        final float gridY;
        final float gridSize;
        /** The stroke width in grid units, or 0 for a filled icon. */
        final float stroke;

        Icon(Path path, float gridX, float gridY, float gridSize, float stroke) {
            this.path = path;
            this.gridX = gridX;
            this.gridY = gridY;
            this.gridSize = gridSize;
            this.stroke = stroke;
        }
    }

    public static final Icon CONTROL = new Icon(controlGlyph(false, false), 0, -960, 960, 0);
    public static final Icon CONTROL_ON = new Icon(controlGlyph(true, false), 0, -960, 960, 0);
    /** The control after a start that didn't arrive: "!" in the sparkle's place, as the extension's error corner. */
    public static final Icon CONTROL_BANG = new Icon(controlGlyph(false, true), 0, -960, 960, 0);
    public static final Icon CONTROL_ON_BANG = new Icon(controlGlyph(true, true), 0, -960, 960, 0);
    public static final Icon TUNE = new Icon(path(IconPaths.TUNE), 0, -960, 960, 0);
    public static final Icon TRANSLATE = new Icon(path(IconPaths.TRANSLATE), 0, -960, 960, 0);
    /** The sparkle alone, in its own box, as the extension's {@code spark()} draws it. */
    public static final Icon SPARKLE = new Icon(path(IconPaths.SPARKLE), 552, -910, 358, 0);
    public static final Icon CHECK = new Icon(path(IconPaths.STROKE_CHECK), 0, 0, 24, 2);
    public static final Icon NEXT = new Icon(path(IconPaths.STROKE_NEXT), 0, 0, 24, 2);
    public static final Icon SEARCH = new Icon(path(IconPaths.STROKE_SEARCH), 0, 0, 24, 2);
    public static final Icon DUAL = new Icon(dual(), 0, 0, 24, 0);
    /**
     * The Account row's: Material Symbols' account_circle (Rounded, weight 600, 48 px, Apache License
     * 2.0), as the extension's icons are drawn. Only the app has an Account row: the extension's is its popup.
     */
    public static final Icon ACCOUNT = new Icon(path(Icons.ACCOUNT_CIRCLE), 0, -960, 960, 0);

    private static final String ACCOUNT_CIRCLE =
            "M224.26-261.22q62.44-42.87 123.87-65.8 61.44-22.94 132.12-22.94t132.88 23.37q62.21 23.37 123.61 65.3"
            + "7 42.87-54.56 60.52-107 17.65-52.43 17.65-111.78 0-142.31-96.27-238.61-96.27-96.3-238.54-96.3-142.27"
            + " 0-238.64 96.3-96.37 96.3-96.37 238.61 0 59.3 17.88 111.6 17.89 52.3 61.29 107.18Zm255.55-184.82q-59"
            + ".59 0-99.9-40.54-40.3-40.53-40.3-99.76 0-59.23 40.49-99.86t100.09-40.63q59.59 0 99.9 40.82 40.3 40.8"
            + "2 40.3 100.04 0 59.23-40.49 99.58t-100.09 40.35Zm.33 380.17q-84.97 0-160.45-32.51-75.48-32.51-132.13"
            + "-89.15-56.65-56.64-89.17-131.92-32.52-75.28-32.52-160.86 0-84.95 32.63-160.28 32.63-75.32 89.11-131."
            + "8 56.48-56.48 131.78-89.39 75.3-32.92 160.92-32.92 84.95 0 160.28 32.92 75.32 32.91 131.8 89.39 56.4"
            + "8 56.48 89.39 131.88 32.92 75.41 32.92 160.37 0 84.97-32.92 160.51-32.91 75.54-89.39 132.02-56.48 56"
            + ".48-131.88 89.11-75.41 32.63-160.37 32.63Zm-.14-79.22q53.3 0 102.98-14.87 49.67-14.87 100.67-53.17-5"
            + "1.56-35.44-101.17-53.02-49.61-17.59-102.48-17.59-52.87 0-102.2 17.59-49.32 17.58-100.89 53.02 51 38."
            + "3 100.39 53.17 49.4 14.87 102.7 14.87Zm0-367.74q32.23 0 52.92-20.37 20.69-20.37 20.69-52.95 0-32.59-"
            + "20.69-53.24T480-660.04q-32.23 0-52.92 20.65-20.69 20.65-20.69 53.24 0 32.58 20.69 52.95 20.69 20.37 "
            + "52.92 20.37Zm0-73.6Zm.57 372.3Z";

    private static final Matrix matrix = new Matrix();
    private static final Path scaled = new Path();

    private Icons() {
    }

    /** Draws {@code icon} into the square at {@code left}, {@code top} of {@code size} px. */
    public static void draw(Canvas canvas, Icon icon, float left, float top, float size, Paint paint) {
        float k = size / icon.gridSize;
        matrix.setTranslate(-icon.gridX, -icon.gridY);
        matrix.postScale(k, k);
        matrix.postTranslate(left, top);
        icon.path.transform(matrix, scaled);
        Paint.Style style = paint.getStyle();
        float width = paint.getStrokeWidth();
        if (icon.stroke > 0) {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(icon.stroke * k);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        } else {
            paint.setStyle(Paint.Style.FILL);
        }
        canvas.drawPath(scaled, paint);
        paint.setStyle(style);
        paint.setStrokeWidth(width);
    }

    static Path path(String data) {
        Path path = new Path();
        SvgPath.parse(data, new SvgPath.Sink() {
            @Override
            public void moveTo(float x, float y) {
                path.moveTo(x, y);
            }

            @Override
            public void lineTo(float x, float y) {
                path.lineTo(x, y);
            }

            @Override
            public void quadTo(float x1, float y1, float x, float y) {
                path.quadTo(x1, y1, x, y);
            }

            @Override
            public void cubicTo(float x1, float y1, float x2, float y2, float x, float y) {
                path.cubicTo(x1, y1, x2, y2, x, y);
            }

            @Override
            public void close() {
                path.close();
            }
        });
        return path;
    }

    /**
     * The player control: the subtitles frame with the sparkle at its top right and a gap cut
     * around it, as the extension's {@code controlGlyph()}. Filled, the frame is the logo's: a
     * solid rounded rectangle with its two caption lines cut out. With {@code bang}, "!" stands in the
     * sparkle's place, a bar and a dot so no font is needed, with the same gap around it.
     */
    private static Path controlGlyph(boolean filled, boolean bang) {
        Path badge;
        if (bang) {
            badge = new Path();
            badge.addRoundRect(new RectF(BADGE_X - 38, -1010, BADGE_X + 38, -760), 38, 38, Path.Direction.CW);
            badge.addCircle(BADGE_X, -690, 44, Path.Direction.CW);
        } else {
            badge = path(IconPaths.SPARKLE);
            Matrix place = new Matrix();
            place.setTranslate(IconPaths.SPARKLE_SX, IconPaths.SPARKLE_SY);
            place.postScale(IconPaths.SPARKLE_SCALE, IconPaths.SPARKLE_SCALE);
            place.postTranslate(IconPaths.SPARKLE_TX, IconPaths.SPARKLE_TY);
            badge.transform(place);
        }

        Paint gapPaint = new Paint();
        gapPaint.setStyle(Paint.Style.STROKE);
        gapPaint.setStrokeJoin(Paint.Join.ROUND);
        // 1.5 px each side at 24 px, 120 grid units across, round the sparkle and "!" alike.
        gapPaint.setStrokeWidth(IconPaths.SPARKLE_GAP * IconPaths.SPARKLE_SCALE);
        Path gap = new Path();
        gapPaint.getFillPath(badge, gap);
        gap.op(badge, Path.Op.UNION);

        Path frame;
        if (filled) {
            frame = new Path();
            frame.addRoundRect(new RectF(IconPaths.FRAME_X, IconPaths.FRAME_Y,
                            IconPaths.FRAME_X + IconPaths.FRAME_WIDTH, IconPaths.FRAME_Y + IconPaths.FRAME_HEIGHT),
                    IconPaths.FRAME_RADIUS, IconPaths.FRAME_RADIUS, Path.Direction.CW);
            Path cuts = new Path();
            float r = IconPaths.LINE_STROKE;
            for (float[] line : IconPaths.LINES) {
                cuts.addRoundRect(new RectF(line[0], line[1], line[0] + line[2], line[1] + 2 * r), r, r, Path.Direction.CW);
            }
            for (float[] dot : IconPaths.DOTS) cuts.addCircle(dot[0], dot[1], r, Path.Direction.CW);
            frame.op(cuts, Path.Op.DIFFERENCE);
        } else {
            frame = path(IconPaths.SUBTITLES);
        }
        frame.op(gap, Path.Op.DIFFERENCE);
        frame.op(badge, Path.Op.UNION);
        return frame;
    }

    /** The badge's centre in the grid: the subtitles frame's top-right corner, as {@code BADGE} in {@code lib/icons.ts}. */
    private static final float BADGE_X = 860;

    /** Two caption lines, a short one over a long one: the extension's {@code dualIcon()}. */
    private static Path dual() {
        Path path = new Path();
        path.addRoundRect(new RectF(6.5f, 6f, 17.5f, 9f), 1.5f, 1.5f, Path.Direction.CW);
        path.addRoundRect(new RectF(3f, 12f, 21f, 17.5f), 2f, 2f, Path.Direction.CW);
        return path;
    }
}
