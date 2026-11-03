package app.noam.extension.chesscom.arrows;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;

import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Set;

import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.theme.Accent;

/**
 * A control bar button the patch puts in the layout: tag "draw" toggles drawing, "clear" removes
 * the marks. It wraps one of the app's own BottomButtons so it matches its neighbours.
 */
public final class ArrowsButton extends FrameLayout {
    private static final String BOTTOM_BUTTON = "com.chess.internal.views.BottomButton";

    private final boolean reviews;
    private final boolean clear;
    private View button;
    private Method setColor, setColorStateList;
    /** Tags already written to the log, so each bar button reports once per process. */
    private static final Set<String> LOGGED = new HashSet<>();

    public ArrowsButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        // Read the tag from the attributes too: the view reads it itself only after layout starts.
        String tag = attrs == null ? null : attrs.getAttributeValue("http://schemas.android.com/apk/res/android", "tag");
        if (tag == null) tag = getTag() == null ? "" : getTag().toString();
        reviews = tag.startsWith("reviews_");
        clear = tag.endsWith("clear");
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
        refresh();
        if (LOGGED.add(tag)) {
            Utils.log("Arrow button " + tag + ": reviews on " + Arrows.reviewsEnabled() +
                ", games on " + Arrows.gamesEnabled() + ", visible " + (getVisibility() == VISIBLE));
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        refresh();
    }

    /**
     * Review bars save space: Clear only appears while drawing is on, and folds away with it.
     * Game bars keep both buttons. The draw button takes the accent colour while drawing.
     */
    void refresh() {
        if (button == null) return;
        boolean enabled = Arrows.featureEnabled(reviews);
        if (clear) {
            boolean shown = enabled && (!reviews || Arrows.drawing(this));
            setVisibility(shown ? VISIBLE : GONE);
            if (shown) button.setAlpha(Arrows.hasMarks(this) ? 1f : 0.5f);
            return;
        }
        setVisibility(enabled ? VISIBLE : GONE);
        if (!enabled) return;
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
