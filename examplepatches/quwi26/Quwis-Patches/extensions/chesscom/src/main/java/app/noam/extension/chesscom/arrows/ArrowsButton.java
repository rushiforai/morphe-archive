package app.noam.extension.chesscom.arrows;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;

import java.lang.reflect.Method;

import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.theme.Accent;

/**
 * A control bar button the patch puts in the layout: tag "draw" toggles drawing, "clear" removes
 * the marks. It wraps one of the app's own BottomButtons so it matches its neighbours.
 */
public final class ArrowsButton extends FrameLayout {
    private static final String BOTTOM_BUTTON = "com.chess.internal.views.BottomButton";

    private final boolean clear;
    private View button;
    private Method setColor, setColorStateList;

    public ArrowsButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        clear = "clear".equals(getTag());
        if (!Arrows.enabled()) {
            setVisibility(GONE);
            return;
        }
        try {
            Class<?> type = Class.forName(BOTTOM_BUTTON);
            button = (View) type.getConstructor(Context.class, AttributeSet.class).newInstance(context, attrs);
            button.setId(NO_ID);
            setColor = type.getMethod("setColor", int.class);
            setColorStateList = type.getMethod("setColorStateList", int.class);
        } catch (Throwable throwable) {
            Utils.logError("Arrow button failed", throwable);
            setVisibility(GONE);
            return;
        }
        setContentDescription(null);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        addView(button, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        button.setOnClickListener(view -> {
            if (clear) Arrows.clear(this);
            else Arrows.toggleDrawing(this);
        });
        Arrows.register(this);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        refresh();
    }

    /** The draw button takes the app's accent colour while drawing; Clear is dimmed when there is nothing to clear. */
    void refresh() {
        if (button == null) return;
        if (clear) {
            button.setAlpha(Arrows.hasMarks(this) ? 1f : 0.5f);
            return;
        }
        try {
            if (Arrows.drawing(this)) {
                setColor.invoke(button, Accent.current());
            } else {
                int color = Utils.resourceId("primary_text", "color");
                if (color != 0) setColorStateList.invoke(button, color);
            }
        } catch (Throwable throwable) {
            Utils.logError("Arrow button tint failed", throwable);
        }
    }
}
