package io.github.sabopura.morphe.extension.twitch.chat;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.text.Spannable;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.ReplacementSpan;
import android.text.style.StyleSpan;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.EmoteSupport;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Draws a chatter's name with their 7TV paint. The name becomes one unit of its line, like an emote image:
 * a gradient is laid out in the name's own box, and a span that only restyles the text is never told where
 * that box is. Main thread only.
 */
public final class NamePaintSpan extends ReplacementSpan {
    private static final int MAX_SHADERS = 32;
    /** The text size of names in the web chat, which 7TV's shadow offsets and blurs are written for. */
    private static final float WEB_TEXT_PX = 13;
    private static final TextPaint WORK = new TextPaint();
    private static final StyleSpan BOLD = new StyleSpan(Typeface.BOLD);
    private static final Map<Key, Shader> SHADERS = new LinkedHashMap<Key, Shader>(16, .75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Key, Shader> eldest) {
            return size() > MAX_SHADERS;
        }
    };

    private final NamePaint paint;
    private final String name;
    private final int base;
    private final Bitmap image;
    /** Whether the name colour shows through the paint, so that it is drawn first. */
    private final boolean underlaid;
    private int width;
    /** The shader of the box the name was last drawn in. */
    private Shader shader;
    private int shaderWidth, shaderHeight;
    private boolean broken;
    /** The row's highlight, which a text line does not draw behind a replacement; read at the first draw. */
    private int background;
    private boolean backgroundRead;

    private NamePaintSpan(NamePaint paint, String name, int base, Bitmap image) {
        this.paint = paint;
        this.name = name;
        this.base = base;
        this.image = image;
        underlaid = !paint.opaque();
    }

    /**
     * Puts the chatter's 7TV paint on the name of a row Twitch built. A chatter without a paint and a paint
     * whose image has not loaded yet keep Twitch's look.
     */
    static boolean apply(TextView view, Spannable text, String room, String userId) {
        SevenTvBadges.ensure(room);
        NamePaint paint = userId == null ? null : SevenTvBadges.paintOf(userId);
        if (paint == null) return false;
        Bitmap image = null;
        if (paint.function == NamePaint.IMAGE) {
            image = EmoteSupport.paintImage(view.getContext(), paint.image);
            if (image == null) return false;
        }
        return paint(text, paint, image, view.getPaint(),
                view.getWidth() - view.getTotalPaddingLeft() - view.getTotalPaddingRight());
    }

    /**
     * Paints the name in a row: the first text that is both coloured and bold from the same place, followed
     * by the colon or the space of an action. {@code room} is the width of a line of the row, or 0 while it
     * is not known. False when the row has no such name or the name is wider than a line.
     */
    static boolean paint(Spannable text, NamePaint paint, Bitmap image, TextPaint line, int room) {
        ForegroundColorSpan[] colours = text.getSpans(0, text.length(), ForegroundColorSpan.class);
        StyleSpan[] styles = text.getSpans(0, text.length(), StyleSpan.class);
        int[] colourStarts = new int[colours.length], boldStarts = new int[styles.length];
        for (int i = 0; i < colours.length; i++) colourStarts[i] = text.getSpanStart(colours[i]);
        for (int i = 0; i < styles.length; i++)
            boldStarts[i] = (styles[i].getStyle() & Typeface.BOLD) != 0 ? text.getSpanStart(styles[i]) : -1;
        int found = NamePaint.nameSpan(colourStarts, boldStarts);
        if (found < 0) return false;
        int start = colourStarts[found], end = text.getSpanEnd(colours[found]);
        if (end <= start || end >= text.length() || text.charAt(end) != ':' && text.charAt(end) != ' ') return false;
        // A painted name cannot wrap. One wider than the chat keeps Twitch's look, which can.
        WORK.set(line);
        BOLD.updateMeasureState(WORK);
        if (room > 0 && WORK.measureText(text, start, end) > room) return false;
        // Twitch leaves the login it adds to a name in another script out of the bold; 7TV paints both in bold.
        // One style over the whole name also keeps the line from handing the name over in two pieces.
        for (StyleSpan style : styles) {
            if ((style.getStyle() & Typeface.BOLD) == 0 || text.getSpanStart(style) != start
                    || text.getSpanEnd(style) >= end) continue;
            text.removeSpan(style);
            text.setSpan(new StyleSpan(Typeface.BOLD), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        int own = colours[found].getForegroundColor();
        text.setSpan(new NamePaintSpan(paint, text.subSequence(start, end).toString(), paint.base != 0 ? paint.base : own,
                image), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return true;
    }

    /**
     * Whether a piece of the name is the one that stands for all of it. A text line hands a replacement over
     * in pieces where the name wraps or its style changes, having given the whole width to the first.
     */
    private boolean leads(CharSequence text, int start) {
        return !(text instanceof Spanned) || ((Spanned) text).getSpanStart(this) == start;
    }

    @Override
    public int getSize(Paint line, CharSequence text, int start, int end, Paint.FontMetricsInt metrics) {
        if (metrics != null) line.getFontMetricsInt(metrics);
        if (!leads(text, start)) return 0;
        return width = (int) Math.ceil(line.measureText(name));
    }

    @Override
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom,
                     Paint line) {
        if (!leads(text, start) || width <= 0) return;
        if (!backgroundRead) {
            BackgroundColorSpan[] behind = text instanceof Spanned
                    ? ((Spanned) text).getSpans(start, end, BackgroundColorSpan.class) : null;
            // A text line draws the last of them only.
            background = behind == null || behind.length == 0 ? 0 : behind[behind.length - 1].getBackgroundColor();
            backgroundRead = true;
        }
        WORK.set(line);
        WORK.setStyle(Paint.Style.FILL);
        // A paint's image is small and stretched over the name.
        WORK.setFilterBitmap(true);
        if (background != 0) {
            WORK.setColor(background);
            canvas.drawRect(x, top, x + width, bottom, WORK);
        }
        float ascent = WORK.ascent();
        Shader gradient = paint.function == NamePaint.SOLID ? null : shader(Math.round(WORK.descent() - ascent));
        float scale = WORK.getTextSize() / WEB_TEXT_PX;
        int shadows = paint.shadowColors.length;
        canvas.save();
        canvas.translate(x, y + ascent);
        WORK.setColor(base);
        // The name colour lies under the paint, and each shadow under the one before it.
        for (int i = shadows - 1; i >= 0; i--) {
            // CSS gives the blur as the deviation of its Gaussian; Android derives that from a radius.
            WORK.setShadowLayer(Math.max(.01f, (paint.shadows[i * 3 + 2] * scale - .5f) / .57735f),
                    paint.shadows[i * 3] * scale, paint.shadows[i * 3 + 1] * scale, paint.shadowColors[i]);
            canvas.drawText(name, 0, -ascent, WORK);
        }
        WORK.clearShadowLayer();
        if (shadows == 0 && (gradient == null || underlaid)) canvas.drawText(name, 0, -ascent, WORK);
        if (gradient != null) {
            WORK.setShader(gradient);
            canvas.drawText(name, 0, -ascent, WORK);
            WORK.setShader(null);
        }
        canvas.restore();
    }

    /** The paint's shader for the name's box, or null when it cannot be made: the name keeps its colour. */
    private Shader shader(int height) {
        if (broken || height <= 0) return null;
        if (shader != null && shaderWidth == width && shaderHeight == height) return shader;
        try {
            Key key = new Key(paint, width, height);
            Shader made = SHADERS.get(key);
            if (made == null) SHADERS.put(key, made = build(height));
            shaderWidth = width;
            shaderHeight = height;
            return shader = made;
        } catch (RuntimeException | LinkageError failure) {
            Diagnostics.note("chat.name-paint", failure);
            broken = true;
            return null;
        }
    }

    private Shader build(int height) {
        Shader.TileMode tile = paint.repeat ? Shader.TileMode.REPEAT : Shader.TileMode.CLAMP;
        if (paint.function == NamePaint.LINEAR) {
            float[] ends = paint.line(width, height);
            return new LinearGradient(ends[0], ends[1], ends[2], ends[3], paint.colors, paint.positions, tile);
        }
        Shader made;
        Matrix matrix = new Matrix();
        if (paint.function == NamePaint.RADIAL) {
            made = new RadialGradient(width / 2f, height / 2f, paint.radius(width, height), paint.colors,
                    paint.positions, tile);
            if (!paint.ellipse) return made;
            matrix.setScale(1, (float) height / width, width / 2f, height / 2f);
        } else {
            // CSS stretches the image over the name's box.
            made = new BitmapShader(image, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            matrix.setScale((float) width / image.getWidth(), (float) height / image.getHeight());
        }
        made.setLocalMatrix(matrix);
        return made;
    }

    /** A paint in a box of one size. A paint 7TV changed is another object, so it never meets its old shaders. */
    private static final class Key {
        final NamePaint paint;
        final int width, height;

        Key(NamePaint paint, int width, int height) {
            this.paint = paint;
            this.width = width;
            this.height = height;
        }

        @Override
        public boolean equals(Object other) {
            return other instanceof Key && ((Key) other).paint == paint && ((Key) other).width == width
                    && ((Key) other).height == height;
        }

        @Override
        public int hashCode() {
            return (System.identityHashCode(paint) * 31 + width) * 31 + height;
        }
    }
}
