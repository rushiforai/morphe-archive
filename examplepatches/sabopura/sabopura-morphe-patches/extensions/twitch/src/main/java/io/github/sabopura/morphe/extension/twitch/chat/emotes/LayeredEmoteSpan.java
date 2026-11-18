package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.text.style.ReplacementSpan;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/** One span owns the entire token group, keeping overlays with their base across line wrapping. */
final class LayeredEmoteSpan extends ReplacementSpan {
    private final List<CenteredImageSpan> layers = new ArrayList<>();
    private ReplacementSpan nativeBase;
    private CharSequence original;
    private int nativeStart, nativeEnd;

    LayeredEmoteSpan(TextView view, Drawable base, float scale) {
        add(view, base, scale);
    }

    LayeredEmoteSpan(ReplacementSpan base, CharSequence text, int start, int end) {
        nativeBase = base;
        original = text;
        nativeStart = start;
        nativeEnd = end;
    }

    void add(TextView view, Drawable drawable, float scale) {
        layers.add(new CenteredImageSpan(view, drawable, scale));
    }

    public int getSize(Paint p, CharSequence t, int s, int e, Paint.FontMetricsInt fm) {
        return nativeBase != null
                ? nativeBase.getSize(p, original, nativeStart, nativeEnd, fm)
                : layers.get(0).getSize(p, t, s, e, fm);
    }

    public void draw(
            Canvas c,
            CharSequence t,
            int s,
            int e,
            float x,
            int top,
            int baseline,
            int bottom,
            Paint p) {
        int w = getSize(p, t, s, e, null);
        if (nativeBase != null)
            nativeBase.draw(c, original, nativeStart, nativeEnd, x, top, baseline, bottom, p);
        for (CenteredImageSpan span : layers)
            span.draw(c, t, s, e, x + (w - span.width()) / 2f, top, baseline, bottom, p);
    }
}
