package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import java.io.File;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * #129: words or a picture of your own at the top of the chat list, in place of Messenger's "messenger" wordmark. The
 * wordmark's component hands its drawable to {@link #dress} right after loading it, and draws whatever comes back at the
 * wordmark's height, its width following the drawable's shape. Words take the wordmark's own colors, its gradient
 * included, so they follow dark mode. A picture keeps its own colors and takes the place of the words when both are
 * there. Off, Pause, safe mode, blank words with no picture and every failure keep the wordmark.
 */
public final class HomeHeader {
    static final String KEY = "home_header";
    /** The words as typed. {@link #clean} decides what shows. */
    static final String TEXT = "home_header_text";
    /** The most characters the header takes. */
    static final int MAX_LENGTH = 30;
    /** The copy of the picked picture, in Messenger's files. */
    static final String PICTURE = "hushmessenger-home-header.png";
    /** The words' height when the wordmark gives none, in dp. */
    static final int FALLBACK_HEIGHT_DP = 24;
    /** The widest the header gets, as a share of the screen's width. Wider words get smaller. */
    static final float MAX_WIDTH_SHARE = 0.55f;
    /** Messenger's blue, for words when the wordmark has no color to take. */
    static final int MESSENGER_BLUE = 0xff0866ff;

    /** The mark made for each wordmark, kept while its settings stay the same, so a render hands back the same drawable. */
    private static final Map<Drawable, Drawable> marks = new WeakHashMap<>();
    private static final Map<Drawable, String> signatures = new WeakHashMap<>();
    /** The picture read last, with the file's time and size when it was read. */
    private static Bitmap picture;
    private static long pictureModified = -1, pictureLength = -1;

    private HomeHeader() { }

    /** The wordmark Messenger just loaded, or your words or picture in its place. Never throws. */
    public static Drawable dress(Drawable wordmark) {
        if (wordmark == null) return null;
        try {
            if (!Settings.wouldUse(KEY)) return wordmark;
            Context context = Settings.appContext;
            File copy = context == null ? null : file(context);
            String signature = signature(copy);
            if (signature == null) return wordmark;
            synchronized (marks) {
                Drawable mark = marks.get(wordmark);
                if (mark == null || !signature.equals(signatures.get(wordmark))) {
                    mark = make(wordmark, copy, signature);
                    if (mark == null) return wordmark;
                    marks.put(wordmark, mark);
                    signatures.put(wordmark, signature);
                }
                Settings.activeAt.put(KEY, System.currentTimeMillis());
                return mark;
            }
        } catch (RuntimeException | OutOfMemoryError error) {
            Settings.hookFailed(KEY, "Can't put your home header in", error);
            return wordmark;
        }
    }

    /**
     * What the header shows, as one line for the restart row and the mark cache: the picture's time and size, else the
     * cleaned words. Null when there's neither, which keeps the wordmark.
     */
    static String signature(File copy) {
        if (copy != null && copy.isFile()) return "picture\n" + copy.lastModified() + "\n" + copy.length();
        SharedPreferences prefs = Settings.preferences;
        String words = clean(prefs == null ? null : prefs.getString(TEXT, ""));
        return words.isEmpty() ? null : "text\n" + words;
    }

    /** What a restart would show, for the restart row: nothing while the switch is off, paused or in safe mode. */
    static String inUse(Context context) {
        if (!Settings.wouldUse(KEY)) return "";
        String signature = signature(file(context));
        return signature == null ? "" : signature;
    }

    static File file(Context context) {
        return new File(context.getFilesDir(), PICTURE);
    }

    private static Drawable make(Drawable wordmark, File copy, String signature) {
        int height = wordmark.getIntrinsicHeight();
        if (height <= 0) height = Math.round(FALLBACK_HEIGHT_DP * Resources.getSystem().getDisplayMetrics().density);
        int maxWidth = Math.round(Resources.getSystem().getDisplayMetrics().widthPixels * MAX_WIDTH_SHARE);
        if (signature.startsWith("picture\n")) {
            Bitmap shown = load(copy);
            // A copy that won't decode leaves the words, if there are any.
            if (shown != null) return new PictureMark(shown, height, maxWidth);
            SharedPreferences prefs = Settings.preferences;
            String words = clean(prefs == null ? null : prefs.getString(TEXT, ""));
            return words.isEmpty() ? null : new TextMark(words, height, maxWidth, colors(wordmark));
        }
        return new TextMark(signature.substring(5), height, maxWidth, colors(wordmark));
    }

    /** The saved picture, read again only when the file changed. Null when it's gone or won't decode. Holds marks' lock. */
    private static Bitmap load(File copy) {
        long modified = copy.lastModified(), length = copy.length();
        if (picture != null && modified == pictureModified && length == pictureLength) return picture;
        // The bytes are read and the file closed first, so removing the picture never waits on a decoder's open handle.
        Bitmap read;
        try {
            byte[] bytes = java.nio.file.Files.readAllBytes(copy.toPath());
            read = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
        } catch (java.io.IOException | RuntimeException unreadable) {
            read = null;
        }
        if (read == null || read.getWidth() <= 0 || read.getHeight() <= 0) {
            android.util.Log.w("HushMessenger", "The home header picture won't decode, so the words or wordmark stay");
            return null;
        }
        picture = read;
        pictureModified = modified;
        pictureLength = length;
        return read;
    }

    /** The copy changed or went. Marks made from it go too, so the next render reads the file again. */
    static void forget() {
        synchronized (marks) {
            picture = null;
            pictureModified = pictureLength = -1;
            marks.clear();
            signatures.clear();
        }
    }

    /**
     * The words the header shows for [typed]: one line, without control or invisible formatting characters, trimmed, and
     * at most {@link #MAX_LENGTH} characters. Empty keeps the wordmark.
     */
    static String clean(String typed) {
        if (typed == null) return "";
        StringBuilder line = new StringBuilder();
        boolean space = false;
        int count = 0;
        for (int at = 0; at < typed.length() && count < MAX_LENGTH; ) {
            int point = typed.codePointAt(at);
            at += Character.charCount(point);
            int type = Character.getType(point);
            if (Character.isWhitespace(point) || Character.isSpaceChar(point)) {
                space = line.length() > 0;
                continue;
            }
            if (type == Character.CONTROL || type == Character.FORMAT || type == Character.UNASSIGNED
                    || type == Character.PRIVATE_USE || type == Character.SURROGATE) continue;
            if (space) {
                // A space needs room for the character after it, so the words never end on one.
                if (count + 1 >= MAX_LENGTH) break;
                line.append(' ');
                count++;
                space = false;
            }
            line.appendCodePoint(point);
            count++;
        }
        return line.toString();
    }

    /**
     * The wordmark's colors from its left, middle and right thirds, drawn small from a copy of it so the one on screen is
     * never touched. One color when the thirds match, three for a gradient when they don't, Messenger's blue when nothing
     * in it is solid enough to read.
     */
    static int[] colors(Drawable wordmark) {
        int width = wordmark.getIntrinsicWidth(), height = wordmark.getIntrinsicHeight();
        if (width <= 0 || height <= 0) return new int[] {MESSENGER_BLUE};
        float scale = Math.min(1f, 48f / height);
        int w = Math.max(3, Math.round(width * scale)), h = Math.max(1, Math.round(height * scale));
        Drawable.ConstantState state = wordmark.getConstantState();
        Drawable copy = state == null ? null : state.newDrawable();
        Drawable drawn = copy != null ? copy.mutate() : wordmark;
        Rect kept = new Rect(drawn.getBounds());
        Bitmap sample = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
        try {
            drawn.setBounds(0, 0, w, h);
            drawn.draw(new Canvas(sample));
            int[] pixels = new int[w * h];
            sample.getPixels(pixels, 0, w, 0, 0, w, h);
            long[][] sums = new long[3][4];
            for (int y = 0; y < h; y++) {
                for (int x = 0; x < w; x++) {
                    int pixel = pixels[y * w + x];
                    if (Color.alpha(pixel) < 160) continue;
                    long[] third = sums[Math.min(2, x * 3 / w)];
                    third[0] += Color.red(pixel);
                    third[1] += Color.green(pixel);
                    third[2] += Color.blue(pixel);
                    third[3]++;
                }
            }
            long[] all = new long[4];
            for (long[] third : sums) for (int i = 0; i < 4; i++) all[i] += third[i];
            if (all[3] == 0) return new int[] {MESSENGER_BLUE};
            int whole = average(all, all);
            int left = average(sums[0], all), middle = average(sums[1], all), right = average(sums[2], all);
            return apart(left, right) || apart(left, middle) || apart(middle, right) ? new int[] {left, middle, right} : new int[] {whole};
        } finally {
            if (drawn == wordmark) wordmark.setBounds(kept);
            sample.recycle();
        }
    }

    /** The opaque average of [sum], or of [fallback] when [sum] counted no pixels. */
    private static int average(long[] sum, long[] fallback) {
        long[] used = sum[3] == 0 ? fallback : sum;
        return Color.rgb((int) (used[0] / used[3]), (int) (used[1] / used[3]), (int) (used[2] / used[3]));
    }

    /** Whether two colors differ enough to read as a gradient, not as the same color drawn smooth. */
    static boolean apart(int one, int two) {
        return Math.abs(Color.red(one) - Color.red(two)) + Math.abs(Color.green(one) - Color.green(two))
            + Math.abs(Color.blue(one) - Color.blue(two)) > 48;
    }

    /**
     * The picture at the wordmark's height, its shape kept. One wider than {@link #MAX_WIDTH_SHARE} of the screen gets
     * smaller. It keeps its own colors, so a filter or tint meant for the wordmark doesn't reach it.
     */
    static final class PictureMark extends Drawable {
        final Bitmap picture;
        private final int width, height;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final RectF place = new RectF();

        PictureMark(Bitmap picture, int slot, int maxWidth) {
            this.picture = picture;
            int wide = Math.max(1, Math.round(picture.getWidth() * slot / (float) picture.getHeight()));
            int high = slot;
            if (maxWidth > 0 && wide > maxWidth) {
                high = Math.max(1, Math.round(high * maxWidth / (float) wide));
                wide = maxWidth;
            }
            width = wide;
            height = high;
        }

        @Override public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float scale = Math.min(bounds.width() / (float) picture.getWidth(), bounds.height() / (float) picture.getHeight());
            float halfWidth = picture.getWidth() * scale / 2f, halfHeight = picture.getHeight() * scale / 2f;
            place.set(bounds.exactCenterX() - halfWidth, bounds.exactCenterY() - halfHeight,
                bounds.exactCenterX() + halfWidth, bounds.exactCenterY() + halfHeight);
            canvas.drawBitmap(picture, null, place, paint);
        }

        @Override public int getIntrinsicWidth() { return width; }

        @Override public int getIntrinsicHeight() { return height; }

        @Override public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override public int getAlpha() { return paint.getAlpha(); }

        /** A filter meant for the wordmark would paint the whole picture one color, so it's left out. */
        @Override public void setColorFilter(ColorFilter filter) { }

        @Override public void setTintList(android.content.res.ColorStateList tint) { }

        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /**
     * The words at the wordmark's height in bold sans, in the wordmark's color or its gradient from start to end. The
     * words and a capital H together set the size, so short words without capitals or with descenders still fill the
     * height the way the wordmark does.
     */
    static final class TextMark extends Drawable {
        final String text;
        final int[] colors;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
        private final Rect ink = new Rect();
        private final int width, height;
        private final float inkTop, inkBottom;
        private int alpha = 255;
        private Rect shaded;

        TextMark(String text, int height, int maxWidth, int[] colors) {
            this.text = text;
            this.height = height;
            this.colors = colors;
            paint.setTypeface(Typeface.create(Typeface.SANS_SERIF, Typeface.BOLD));
            paint.setColor(colors[0]);
            paint.setTextSize(100f);
            Rect reach = reach();
            float size = reach.height() > 0 ? 100f * height / reach.height() : height;
            paint.setTextSize(size);
            paint.getTextBounds(text, 0, text.length(), ink);
            if (maxWidth > 0 && ink.width() > maxWidth) {
                paint.setTextSize(size * maxWidth / ink.width());
                paint.getTextBounds(text, 0, text.length(), ink);
            }
            Rect fitted = reach();
            inkTop = fitted.top;
            inkBottom = fitted.bottom;
            width = Math.max(1, ink.width());
        }

        /** The words' ink with a capital H's, at the paint's size. */
        private Rect reach() {
            Rect union = new Rect();
            paint.getTextBounds(text, 0, text.length(), union);
            Rect capital = new Rect();
            paint.getTextBounds("H", 0, 1, capital);
            union.union(capital);
            return union;
        }

        @Override public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (colors.length > 1 && !bounds.equals(shaded)) {
                // The gradient runs the words' width as drawn, start to end, whatever bounds the header gives.
                paint.setShader(new LinearGradient(bounds.left, 0, bounds.right, 0, colors, null, Shader.TileMode.CLAMP));
                shaded = new Rect(bounds);
            }
            float x = bounds.left + (bounds.width() - width) / 2f - ink.left;
            float y = bounds.exactCenterY() - (inkTop + inkBottom) / 2f;
            canvas.drawText(text, x, y, paint);
        }

        @Override public int getIntrinsicWidth() { return width; }

        @Override public int getIntrinsicHeight() { return height; }

        @Override public void setAlpha(int alpha) {
            this.alpha = alpha;
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override public int getAlpha() { return alpha; }

        @Override public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter);
            invalidateSelf();
        }

        @Override public ColorFilter getColorFilter() { return paint.getColorFilter(); }

        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
