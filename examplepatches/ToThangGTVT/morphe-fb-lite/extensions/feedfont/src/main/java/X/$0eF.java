package X;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Typeface;

import java.io.File;

import com.moblica.common.xmob.ui.WindowManager;

import app.fblite.extension.feedfont.OriginalRasterizer;

/**
 * Replacement for Facebook Lite's server glyph rasterizer X.0eF (the build strips the "$" from class
 * names in package X, since Java cannot start a class name with a digit).
 *
 * The server sends each glyph as a box size plus vector outlines. This keeps the box, so line layout
 * does not change, and fills it with the system font. Icons (private use characters) and characters
 * the system font lacks go to the app's own rasterizer.
 *
 * Only the constructor and A03 are called from outside. Names are for Facebook Lite 530.0.0.8.106.
 */
@SuppressWarnings("unused")
public final class $0eF {
    /**
     * The server font is Roboto with an em of about 0.755 x the glyph box height, measured from the
     * widths the server sends against Roboto's advances.
     */
    private static final float ROBOTO_EM_PER_BOX_HEIGHT = 0.755f;

    /** Text the system font is compared with Roboto on: common Vietnamese and English letters, digits, punctuation. */
    private static final String SAMPLE = "Bạn đang nghĩ gì? Hôm nay trời đẹp quá, mọi người đi chơi vui vẻ nhé! "
            + "Thích Bình luận Chia sẻ Xem thêm 12 giờ trước. Được tài trợ. Không, chúng tôi sẽ cập nhật."
            + "The quick brown fox jumps over the lazy dog. Like Comment Share See more 2,5K 0123456789";

    /** Share of the sample's characters that should fit their box without being squeezed. */
    private static final float FIT_SHARE = 0.8f;

    private static float emPerBoxHeight = -1;
    private static int croppedLogged;

    /** Below this horizontal squeeze the server's own glyph is used instead of the system font. */
    private static final float MIN_SCALE_X = 0.8f;
    private static final android.util.SparseIntArray COLOR_GLYPHS = new android.util.SparseIntArray();

    private final $0e1 atlasHolder;
    private final WindowManager windowManager;
    private final int boxHeight;
    private final int underlineY;
    private final boolean underline;
    private final Object[] args;
    private final Object lock = new Object();
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
    private final Paint linePaint = new Paint();
    private final char[] one = new char[1];
    private OriginalRasterizer original;

    public $0eF($0e1 atlasHolder, WindowManager windowManager, int boxHeight, int unused1, int unused2,
                int underlineY, boolean bold, boolean unused3, boolean underline) {
        this.atlasHolder = atlasHolder;
        this.windowManager = windowManager;
        this.boxHeight = boxHeight;
        this.underlineY = underlineY;
        this.underline = underline;
        this.args = new Object[] {atlasHolder, windowManager, boxHeight, unused1, unused2, underlineY, bold, unused3, underline};

        // The atlas is an alpha mask, the app tints it when drawing.
        paint.setColor(0xFF000000);
        paint.setTypeface(Typeface.create(Typeface.DEFAULT, bold ? Typeface.BOLD : Typeface.NORMAL));
        linePaint.setColor(0xFF000000);
        linePaint.setStyle(Paint.Style.STROKE);
        linePaint.setStrokeWidth(Math.min(boxHeight / 18.0f, 3.0f));
    }

    public final $1In A03(byte[] data, char c) {
        synchronized (lock) {
            if (data == null || data.length < 2) return null;

            // Header: type, width, [4 bytes if type 8]. Types 3 and 6 are cropped boxes and go on with
            // big-endian shorts height and y offset, then left and right bearings: the app places the box
            // at x = pen + left bearing, y = line top + (line height - height) + y offset, and advances by
            // left bearing + width + right bearing (X.0KY.A03, X.1Ih.A00). Type 2 boxes are the whole cell.
            int type = data[0];
            int width = data[1];
            int pos = type == 8 ? 6 : 2;
            int height = boxHeight;
            int offsetY = 0, leftBearing = 0, rightBearing = 0;
            if ((type == 3 || type == 6) && data.length >= pos + 6) {
                height = (short) ((data[pos] << 8) | (data[pos + 1] & 0xFF));
                offsetY = (short) ((data[pos + 2] << 8) | (data[pos + 3] & 0xFF));
                leftBearing = data[pos + 4];
                rightBearing = data[pos + 5];
            }
            if (width <= 0 || height <= 0) return null;
            if (type == 3 || type == 6) {
                if (croppedLogged < 40) {
                    croppedLogged++;
                    OriginalRasterizer.debug("cropped glyph U+" + Integer.toHexString(c) + " '" + c + "' type=" + type
                            + " w=" + width + " h=" + height + " dy=" + offsetY + " bearings=" + leftBearing + "," + rightBearing
                            + " line=" + boxHeight);
                }
            }

            if (c != ' ' && !drawsWell(c, leftBearing + width + rightBearing)) {
                // X.0eE does not cache null and asks again on the next draw, so a glyph the original
                // could not draw yet shows up once it can, instead of a cached tofu box. If the original
                // is gone for good, characters the system font has are still drawn with it.
                $1In glyph = rasterizeWithOriginal(data, c);
                if (glyph != null || !canDraw(c) || !OriginalRasterizer.unavailable()) return glyph;
            }

            $1Ik atlas;
            $1Im slot;
            synchronized (atlasHolder.A02) {
                atlas = atlasHolder.A00;
                slot = atlas != null ? atlas.A01(width, height) : null;
                if (slot == null) {
                    // Same sizing as the original when the atlas is missing or full.
                    int side = Math.max(windowManager.A0C, windowManager.A0B);
                    int rows = (Math.min($0FD.A01(92, 8) * height, side) / height) * height;
                    Integer flags = $0e1.A04;
                    atlas = new $1Ik(side, rows, atlasHolder.A03, flags != null ? flags : 0);
                    atlasHolder.A00 = atlas;
                    slot = atlas.A01(width, height);
                    if (slot == null) return null;
                }
            }

            Canvas canvas = atlas.A00().A04;
            int left = slot.A01, top = slot.A03, right = slot.A02, bottom = slot.A00;
            canvas.save();
            canvas.clipRect(left, top, right, bottom);
            canvas.drawColor(0, PorterDuff.Mode.CLEAR);
            if (c != ' ') drawChar(canvas, c, left, top, width, height, offsetY, leftBearing, rightBearing);
            if (underline) canvas.drawLine(left, top + underlineY, right, top + underlineY, linePaint);
            canvas.restore();
            return new $1In(atlas, slot);
        }
    }

    /**
     * Text size per box height for this device's system font. The glyph boxes have Roboto's widths and
     * cannot be widened (the app measures text with them), so a font wider than Roboto would be squeezed.
     * Instead it is drawn slightly smaller, so that most characters keep their own proportions; only the
     * rest is squeezed. With Roboto as the system font this is the server's own size.
     */
    private static synchronized float emPerBoxHeight() {
        if (emPerBoxHeight > 0) return emPerBoxHeight;
        emPerBoxHeight = ROBOTO_EM_PER_BOX_HEIGHT;
        try {
            File robotoFile = new File("/system/fonts/Roboto-Regular.ttf");
            if (!robotoFile.exists()) return emPerBoxHeight;
            Paint roboto = new Paint();
            roboto.setTypeface(Typeface.createFromFile(robotoFile));
            roboto.setTextSize(100);
            Paint system = new Paint();
            system.setTypeface(Typeface.DEFAULT);
            system.setTextSize(100);

            float[] ratios = new float[SAMPLE.length()];
            int count = 0;
            for (int i = 0; i < SAMPLE.length(); i++) {
                String c = SAMPLE.substring(i, i + 1);
                if (c.equals(" ")) continue;
                float systemWidth = system.measureText(c);
                float robotoWidth = roboto.measureText(c);
                if (systemWidth > 0 && robotoWidth > 0) ratios[count++] = robotoWidth / systemWidth;
            }
            if (count == 0) return emPerBoxHeight;
            java.util.Arrays.sort(ratios, 0, count);
            float ratio = ratios[(int) ((1 - FIT_SHARE) * (count - 1))];
            // Never larger than the server's size: a narrower font just gets a little more room.
            emPerBoxHeight = ROBOTO_EM_PER_BOX_HEIGHT * Math.min(1f, ratio);
            OriginalRasterizer.debug("System font vs Roboto ratio " + ratio + ", em per box height " + emPerBoxHeight);
        } catch (Throwable ignored) {
            // Keep the server's size.
        }
        return emPerBoxHeight;
    }

    /**
     * Whether the system font draws c acceptably in a cell of this width. Otherwise the server's own
     * glyph, made for the box, is used: when the system font lacks c, when it would have to be squeezed a
     * lot (wide punctuation such as brackets in some fonts), or when c falls back to the color emoji
     * font (symbols such as the trademark sign), which the app's atlas turns into a blob.
     */
    private boolean drawsWell(char c, int cellWidth) {
        if (!canDraw(c)) return false;
        paint.setTextScaleX(1f);
        paint.setTextSize(boxHeight * emPerBoxHeight());
        one[0] = c;
        if (paint.measureText(one, 0, 1) * MIN_SCALE_X > cellWidth) return false;
        return c < 0x80 || Character.isLetterOrDigit(c) || !isColorGlyph(c);
    }

    /** Draws c once into a small bitmap: text glyphs keep the black paint color, emoji have their own colors. */
    private static synchronized boolean isColorGlyph(char c) {
        int cached = COLOR_GLYPHS.get(c, -1);
        if (cached != -1) return cached == 1;
        boolean color = false;
        try {
            Bitmap bitmap = Bitmap.createBitmap(48, 48, Bitmap.Config.ARGB_8888);
            Paint probe = new Paint(Paint.ANTI_ALIAS_FLAG);
            probe.setColor(0xFF000000);
            probe.setTypeface(Typeface.DEFAULT);
            probe.setTextSize(36);
            new Canvas(bitmap).drawText(String.valueOf(c), 4, 38, probe);
            int[] pixels = new int[48 * 48];
            bitmap.getPixels(pixels, 0, 48, 0, 0, 48, 48);
            bitmap.recycle();
            for (int pixel : pixels) {
                if ((pixel >>> 24) > 32 && ((pixel >> 16 & 0xFF) + (pixel >> 8 & 0xFF) + (pixel & 0xFF)) > 96) {
                    color = true;
                    break;
                }
            }
        } catch (Throwable ignored) {
            // Treat as text.
        }
        COLOR_GLYPHS.put(c, color ? 1 : 0);
        return color;
    }

    private boolean canDraw(char c) {
        // Icons use the private use area, and the server also maps some letters there (for example ĩ).
        if (Character.isSurrogate(c) || (c >= 0xE000 && c <= 0xF8FF)) return false;
        one[0] = c;
        return paint.hasGlyph(new String(one));
    }

    private $1In rasterizeWithOriginal(byte[] data, char c) {
        if (original == null) {
            original = OriginalRasterizer.create(args);
            if (original == null) return null;
        }
        return ($1In) original.rasterize(data, c);
    }

    /**
     * Draws c as it would sit in its whole cell (advance x line height), shifted so that the part
     * inside the glyph's box lands in the atlas slot at (left, top).
     */
    private void drawChar(Canvas canvas, char c, int left, int top, int width, int height,
                          int offsetY, int leftBearing, int rightBearing) {
        int cellWidth = leftBearing + width + rightBearing;
        if (cellWidth <= 0) cellWidth = width;
        paint.setTextScaleX(1f);
        paint.setTextSize(boxHeight * emPerBoxHeight());
        Paint.FontMetrics metrics = paint.getFontMetrics();
        one[0] = c;
        float advance = paint.measureText(one, 0, 1);
        if (advance > cellWidth) {
            paint.setTextScaleX(cellWidth / advance);
            advance = cellWidth;
        }
        // Cell coordinates of the text, then of the box's top-left corner.
        float x = (cellWidth - advance) / 2f;
        float baseline = (boxHeight - (metrics.descent - metrics.ascent)) / 2f - metrics.ascent;
        float boxX = leftBearing;
        float boxY = boxHeight - height + offsetY;
        canvas.drawText(one, 0, 1, left + x - boxX, top + baseline - boxY, paint);
    }
}
