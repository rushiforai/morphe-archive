package app.template.extension.extension;

import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewParent;
import android.widget.TextView;

/** Draws Waze's existing speed dial and limit sign in each other's bounds. */
final class SpeedometerFaces {
    private final View source;
    private final View dialBackground;
    private final View dialFace;
    private final View limit;
    private final TextView limitText;
    private final TextView usLimitText;

    SpeedometerFaces(View source) {
        this.source = source;
        dialBackground = find("speedometerBackground");
        dialFace = directChild(find("speedText"));
        limit = find("speedLimitWarnLayout");
        limitText = text("speedLimitWarn");
        usLimitText = text("speedLimitWarnUsOverlay");
    }

    private View find(String name) {
        int id = source.getResources().getIdentifier(name, "id", source.getContext().getPackageName());
        return id == 0 ? null : source.findViewById(id);
    }

    private TextView text(String name) {
        View view = find(name);
        return view instanceof TextView ? (TextView) view : null;
    }

    private View directChild(View view) {
        while (view != null && view != source) {
            ViewParent parent = view.getParent();
            if (parent == source) return view;
            view = parent instanceof View ? (View) parent : null;
        }
        return null;
    }

    boolean canSwap() {
        return ready(dialBackground) && ready(dialFace) && ready(limit)
                && (hasLimit(limitText) || hasLimit(usLimitText));
    }

    private static boolean ready(View view) {
        return view != null && view.isShown() && view.getWidth() > 0 && view.getHeight() > 0;
    }

    private static boolean hasLimit(TextView label) {
        if (label == null || !label.isShown()) return false;
        CharSequence text = label.getText();
        boolean positive = false;
        for (int i = 0; i < text.length(); i++) {
            int digit = Character.digit(text.charAt(i), 10);
            if (digit < 0) return false;
            positive |= digit > 0;
        }
        return positive;
    }

    void drawSwapped(Canvas canvas) {
        Drawable background = source.getBackground();
        if (background != null) background.draw(canvas);

        int save = canvas.save();
        fitInto(canvas, limit, dialBackground);
        limit.draw(canvas);
        canvas.restoreToCount(save);

        save = canvas.save();
        fitInto(canvas, dialBackground, limit);
        dialBackground.draw(canvas);
        canvas.translate(dialFace.getX() - dialBackground.getX(), dialFace.getY() - dialBackground.getY());
        dialFace.draw(canvas);
        canvas.restoreToCount(save);
    }

    private static void fitInto(Canvas canvas, View source, View slot) {
        float scale = Math.min((float) slot.getWidth() / source.getWidth(),
                (float) slot.getHeight() / source.getHeight());
        canvas.translate(slot.getX() + (slot.getWidth() - source.getWidth() * scale) / 2f,
                slot.getY() + (slot.getHeight() - source.getHeight() * scale) / 2f);
        canvas.scale(scale, scale);
    }
}
