package app.linkedin.extension;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/**
 * Material icons drawn from SVG path data on a 24x24 viewport, so the settings screen needs no
 * image resources. Path data is parsed by {@link PathData}.
 */
final class IconDrawable extends Drawable {
    static final String ARROW_BACK = "M20,11H7.83l5.59,-5.59L12,4l-8,8 8,8 1.41,-1.41L7.83,13H20v-2z";
    static final String SEARCH = "M15.5,14h-0.79l-0.28,-0.27C15.41,12.59 16,11.11 16,9.5 16,5.91 13.09,3 9.5,3S3,5.91 3,9.5 "
            + "5.91,16 9.5,16c1.61,0 3.09,-0.59 4.23,-1.57l0.27,0.28v0.79l5,4.99L20.49,19l-4.99,-5zM9.5,14C7.01,14 "
            + "5,11.99 5,9.5S7.01,5 9.5,5 14,7.01 14,9.5 11.99,14 9.5,14z";
    static final String CLOSE = "M19,6.41L17.59,5 12,10.59 6.41,5 5,6.41 10.59,12 5,17.59 6.41,19 12,13.41 17.59,19 19,17.59 13.41,12z";
    static final String CHEVRON_RIGHT = "M10,6L8.59,7.41 13.17,12l-4.58,4.59L10,18l6,-6z";
    static final String INFO = "M11,7h2v2h-2zM11,11h2v6h-2zM12,2C6.48,2 2,6.48 2,12s4.48,10 10,10 10,-4.48 10,-10S17.52,2 "
            + "12,2zM12,20c-4.41,0 -8,-3.59 -8,-8s3.59,-8 8,-8 8,3.59 8,8 -3.59,8 -8,8z";
    static final String BLOCK = "M12,2C6.48,2 2,6.48 2,12s4.48,10 10,10 10,-4.48 10,-10S17.52,2 12,2zM4,12c0,-4.42 3.58,-8 "
            + "8,-8 1.85,0 3.55,0.63 4.9,1.69L5.69,16.9C4.63,15.55 4,13.85 4,12zM12,20c-1.85,0 -3.55,-0.63 "
            + "-4.9,-1.69L18.31,7.1C19.37,8.45 20,10.15 20,12c0,4.42 -3.58,8 -8,8z";
    static final String FEED = "M3,14h4v-4H3v4zM3,19h4v-4H3v4zM3,9h4V5H3v4zM8,14h13v-4H8v4zM8,19h13v-4H8v4zM8,5v4h13V5H8z";
    static final String DOWNLOAD = "M19,9h-4V3H9v6H5l7,7 7,-7zM5,18v2h14v-2H5z";
    static final String CHAT = "M20,2H4c-1.1,0 -2,0.9 -2,2v18l4,-4h14c1.1,0 2,-0.9 2,-2V4c0,-1.1 -0.9,-2 -2,-2zM20,16H6l-2,2V4h16v12z";
    static final String SHIELD = "M12,1L3,5v6c0,5.55 3.84,10.74 9,12 5.16,-1.26 9,-6.45 9,-12V5l-9,-4z";
    static final String MORE = "M6,10c-1.1,0 -2,0.9 -2,2s0.9,2 2,2 2,-0.9 2,-2 -0.9,-2 -2,-2zM18,10c-1.1,0 -2,0.9 -2,2s0.9,2 2,2 "
            + "2,-0.9 2,-2 -0.9,-2 -2,-2zM12,10c-1.1,0 -2,0.9 -2,2s0.9,2 2,2 2,-0.9 2,-2 -0.9,-2 -2,-2z";
    static final String PEOPLE = "M16,11c1.66,0 2.99,-1.34 2.99,-3S17.66,5 16,5c-1.66,0 -3,1.34 -3,3s1.34,3 3,3zM8,11c1.66,0 "
            + "2.99,-1.34 2.99,-3S9.66,5 8,5C6.34,5 5,6.34 5,8s1.34,3 3,3zM8,13c-2.33,0 -7,1.17 -7,3.5V19h14v-2.5c0,"
            + "-2.33 -4.67,-3.5 -7,-3.5zM16,13c-0.29,0 -0.62,0.02 -0.97,0.05 1.16,0.84 1.97,1.97 1.97,3.45V19h6v-2.5c0,"
            + "-2.33 -4.67,-3.5 -7,-3.5z";
    static final String HEART = "M12,21.35l-1.45,-1.32C5.4,15.36 2,12.28 2,8.5 2,5.42 4.42,3 7.5,3c1.74,0 3.41,0.81 4.5,2.09C13.09,3.81 "
            + "14.76,3 16.5,3 19.58,3 22,5.42 22,8.5c0,3.78 -3.4,6.86 -8.55,11.54L12,21.35z";
    static final String HISTORY = "M13,3c-4.97,0 -9,4.03 -9,9L1,12l3.89,3.89 0.07,0.14L9,12L6,12c0,-3.87 3.13,-7 7,-7s7,3.13 7,7 "
            + "-3.13,7 -7,7c-1.93,0 -3.68,-0.79 -4.94,-2.06l-1.42,1.42C8.27,19.99 10.51,21 13,21c4.97,0 9,-4.03 9,-9s-4.03,"
            + "-9 -9,-9zM12,8v5l4.28,2.54 0.72,-1.21 -3.5,-2.08L13.5,8L12,8z";
    static final String BUG = "M20,8h-2.81c-0.45,-0.78 -1.07,-1.45 -1.82,-1.96L17,4.41 15.59,3l-2.17,2.17C12.96,5.06 12.49,5 12,5c-0.49,"
            + "0 -0.96,0.06 -1.41,0.17L8.41,3 7,4.41l1.62,1.63C7.88,6.55 7.26,7.22 6.81,8L4,8v2h2.09c-0.05,0.33 -0.09,0.66 "
            + "-0.09,1v1L4,12v2h2v1c0,0.34 0.04,0.67 0.09,1L4,16v2h2.81c1.04,1.79 2.97,3 5.19,3s4.15,-1.21 5.19,-3L20,18v-2h"
            + "-2.09c0.05,-0.33 0.09,-0.66 0.09,-1v-1h2v-2h-2v-1c0,-0.34 -0.04,-0.67 -0.09,-1L20,10L20,8zM14,16h-4v-2h4v2zM14,"
            + "12h-4v-2h4v2z";
    static final String CHECKLIST = "M14,10H2v2h12v-2zM14,6H2v2h12V6zM2,16h8v-2H2v2zM21.5,11.5L23,13l-6.99,7 -4.51,-4.5L13,14l3.01,3 "
            + "5.49,-5.5z";
    static final String CODE = "M9.4,16.6L4.8,12l4.6,-4.6L8,6l-6,6 6,6 1.4,-1.4zM14.6,16.6l4.6,-4.6 -4.6,-4.6L16,6l6,6 -6,6 -1.4,-1.4z";

    private final Path source;
    private final Path scaled = new Path();
    private final Matrix matrix = new Matrix();
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

    IconDrawable(String pathData, int color) {
        source = new Path();
        PathData.parse(pathData, new PathData.Sink() {
            @Override
            public void moveTo(float x, float y) {
                source.moveTo(x, y);
            }

            @Override
            public void lineTo(float x, float y) {
                source.lineTo(x, y);
            }

            @Override
            public void cubicTo(float x1, float y1, float x2, float y2, float x, float y) {
                source.cubicTo(x1, y1, x2, y2, x, y);
            }

            @Override
            public void close() {
                source.close();
            }
        });
        paint.setColor(color);
        paint.setStyle(Paint.Style.FILL);
    }

    @Override
    protected void onBoundsChange(Rect bounds) {
        matrix.setScale(bounds.width() / 24f, bounds.height() / 24f);
        matrix.postTranslate(bounds.left, bounds.top);
        source.transform(matrix, scaled);
    }

    @Override
    public void draw(Canvas canvas) {
        canvas.drawPath(scaled, paint);
    }

    @Override
    public void setAlpha(int alpha) {
        paint.setAlpha(alpha);
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        paint.setColorFilter(colorFilter);
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }

}
