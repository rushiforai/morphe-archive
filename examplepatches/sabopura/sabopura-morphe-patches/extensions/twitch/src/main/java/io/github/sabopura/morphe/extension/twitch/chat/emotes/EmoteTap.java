package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.text.Layout;
import android.text.Spanned;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.EmoteInfoSheet;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/**
 * A tap on a third-party emote or badge image opens its sheet. Twitch's own touch handling stays
 * untouched for every other gesture: this only claims the finger-up of a short, still tap that
 * lands inside an image, and tells Twitch's view the gesture was cancelled.
 */
public final class EmoteTap {
    private static final float HIT_SLOP_DP = 4;
    private static float downX, downY;
    private static long downTime;

    private static final View.OnTouchListener LISTENER = (view, event) -> {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = event.getX();
                downY = event.getY();
                downTime = event.getEventTime();
                return false;
            case MotionEvent.ACTION_UP:
                try {
                    return tapped((TextView) view, event);
                } catch (RuntimeException | LinkageError failure) {
                    Diagnostics.note("emotes.tap", failure);
                    return false;
                }
            default:
                return false;
        }
    };

    private EmoteTap() {}

    public static void bind(TextView row) {
        row.setOnTouchListener(LISTENER);
    }

    private static boolean tapped(TextView view, MotionEvent event) {
        ViewConfiguration config = ViewConfiguration.get(view.getContext());
        if (event.getEventTime() - downTime >= ViewConfiguration.getLongPressTimeout()
                || Math.hypot(event.getX() - downX, event.getY() - downY) > config.getScaledTouchSlop()
                || !Features.has(Feature.EMOTE_PREVIEW)) return false;
        EmoteInfoSpan span = spanAt(view, event.getX(), event.getY());
        if (span == null) return false;
        MotionEvent cancel = MotionEvent.obtain(event);
        cancel.setAction(MotionEvent.ACTION_CANCEL);
        view.onTouchEvent(cancel);
        cancel.recycle();
        EmoteInfoSheet.show(view.getContext(), span);
        return true;
    }

    private static EmoteInfoSpan spanAt(TextView view, float rawX, float rawY) {
        CharSequence text = view.getText();
        Layout layout = view.getLayout();
        if (!(text instanceof Spanned) || layout == null) return null;
        Spanned spanned = (Spanned) text;
        float x = rawX - view.getTotalPaddingLeft() + view.getScrollX();
        float y = rawY - view.getTotalPaddingTop() + view.getScrollY();
        int line = layout.getLineForVertical((int) y);
        if (y < layout.getLineTop(line) || y > layout.getLineBottom(line)) return null;
        int lineStart = layout.getLineStart(line), lineEnd = layout.getLineEnd(line);
        float slop = HIT_SLOP_DP * view.getResources().getDisplayMetrics().density;
        for (EmoteInfoSpan span : spanned.getSpans(lineStart, lineEnd, EmoteInfoSpan.class)) {
            int start = spanned.getSpanStart(span), end = spanned.getSpanEnd(span);
            if (start < lineStart || end > lineEnd) continue;
            float a = layout.getPrimaryHorizontal(start);
            float b = end >= lineEnd ? layout.getLineRight(line) : layout.getPrimaryHorizontal(end);
            if (x >= Math.min(a, b) - slop && x <= Math.max(a, b) + slop) return span;
        }
        return null;
    }
}
