package dev.twitchpatches.extension.emotes;

import android.text.Layout;
import android.text.Spanned;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.TextView;

public final class ReplayEmoteTouch implements View.OnTouchListener {
    private final View.OnTouchListener original;
    private EmoteClickSpan pressed;
    private float x;
    private float y;

    private ReplayEmoteTouch(View.OnTouchListener original) { this.original = original; }

    public static void install(TextView view, View.OnTouchListener original) {
        view.setOnTouchListener(new ReplayEmoteTouch(original));
    }

    @Override public boolean onTouch(View view, MotionEvent event) {
        TextView text = (TextView) view;
        if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
            pressed = at(text, event);
            x = event.getX();
            y = event.getY();
            if (pressed != null) return true;
        } else if (pressed != null) {
            EmoteClickSpan span = pressed;
            int action = event.getActionMasked();
            int slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
            if (action == MotionEvent.ACTION_CANCEL || Math.abs(event.getX() - x) > slop || Math.abs(event.getY() - y) > slop) {
                pressed = null;
                return false;
            }
            if (action == MotionEvent.ACTION_UP) {
                pressed = null;
                if (at(text, event) == span) span.onClick(view);
            }
            return true;
        }
        return original != null && original.onTouch(view, event);
    }

    private static EmoteClickSpan at(TextView view, MotionEvent event) {
        if (!(view.getText() instanceof Spanned) || view.getLayout() == null) return null;
        Layout layout = view.getLayout();
        float x = event.getX() - view.getTotalPaddingLeft() + view.getScrollX();
        float y = event.getY() - view.getTotalPaddingTop() + view.getScrollY();
        if (y < 0 || y >= layout.getHeight()) return null;
        int line = layout.getLineForVertical((int) y);
        if (x < layout.getLineLeft(line) || x > layout.getLineRight(line)) return null;
        int offset = layout.getOffsetForHorizontal(line, x);
        Spanned text = (Spanned) view.getText();
        for (EmoteClickSpan span : text.getSpans(Math.max(0, offset - 1), Math.min(text.length(), offset + 1), EmoteClickSpan.class)) {
            int start = text.getSpanStart(span), end = text.getSpanEnd(span);
            if (layout.getLineForOffset(start) != line) continue;
            float left = layout.getPrimaryHorizontal(start);
            float right = layout.getLineForOffset(end) == line ? layout.getPrimaryHorizontal(end) : layout.getLineRight(line);
            if (x >= Math.min(left, right) && x < Math.max(left, right)) return span;
        }
        return null;
    }
}
