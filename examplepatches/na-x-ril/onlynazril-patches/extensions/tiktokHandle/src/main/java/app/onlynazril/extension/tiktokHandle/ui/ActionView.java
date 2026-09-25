package app.onlynazril.extension.tiktokHandle.ui;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.Gravity;
import android.widget.TextView;

/**
 * A pressable action, drawn to match the screen: hairline outline, no elevation, no platform
 * button chrome that would bring its own colour and shape between Android versions.
 *
 * The padding is only what a label needs — a platform button adds its own, and that is what makes a
 * small word sit in a large pill. The fill is a parameter because the prompt's panel is a step
 * lighter than the rows, and a button on it should read as part of that panel.
 */
public final class ActionView extends TextView {
    public ActionView(Context context, String label, Runnable action) {
        this(context, label, Tokens.SURFACE, Tokens.ACCENT, action);
    }

    public ActionView(Context context, String label, int fill, int textColor, Runnable action) {
        super(context);
        setText(label);
        setTextSize(Tokens.ACTION_SP);
        setTextColor(textColor);
        setGravity(Gravity.CENTER);
        setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_2),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_2));
        setBackground(outline(context, fill));
        setClickable(true);
        setFocusable(true);
        setOnClickListener(view -> action.run());
    }

    public static Drawable outline(Context context) {
        return outline(context, Tokens.SURFACE);
    }

    /**
     * The mask is what bounds the ripple, so it carries the same rounded shape as the outline: a
     * rectangular mask lets the press colour run past the corners and out of the button.
     */
    public static Drawable outline(Context context, int fill) {
        int radius = Tokens.dp(context, 1000);
        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setCornerRadius(radius);
        shape.setColor(fill);
        shape.setStroke(Tokens.dp(context, 1), Tokens.HAIRLINE);

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(radius);
        mask.setColor(0xFFFFFFFF);

        return new RippleDrawable(ColorStateList.valueOf(Tokens.SURFACE_PRESSED), shape, mask);
    }
}
