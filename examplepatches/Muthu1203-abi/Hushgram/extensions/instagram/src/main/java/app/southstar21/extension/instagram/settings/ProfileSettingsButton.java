package app.southstar21.extension.instagram.settings;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Button in the profile page's top bar, next to the Threads and menu buttons, that opens
 * the southstar21 Patches menu.
 */
@SuppressLint("ViewConstructor")
public final class ProfileSettingsButton extends View {
    private final Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint knob = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final float density;

    private ProfileSettingsButton(Activity activity) {
        super(activity);
        density = activity.getResources().getDisplayMetrics().density;
        line.setStyle(Paint.Style.STROKE);
        line.setStrokeCap(Paint.Cap.ROUND);
        line.setStrokeWidth(2f * density);
        knob.setStyle(Paint.Style.STROKE);
        knob.setStrokeWidth(2f * density);
        setContentDescription("southstar21 Patches");
        setClickable(true);
        setOnClickListener(v -> SettingsMenu.show(activity));
    }

    /**
     * Adds the button to the profile top bar if it's showing and doesn't have it yet.
     * Cheap enough to call repeatedly: Instagram rebuilds that bar on some refreshes.
     */
    public static void ensureInstalled(Activity activity) {
        Resources res = activity.getResources();
        int buttonsId = res.getIdentifier("right_action_bar_buttons", "id", "com.instagram.android");
        if (buttonsId == 0) return;
        View found = activity.findViewById(buttonsId);
        if (!(found instanceof LinearLayout)) return;
        LinearLayout buttons = (LinearLayout) found;
        for (int i = 0; i < buttons.getChildCount(); i++) {
            if (buttons.getChildAt(i) instanceof ProfileSettingsButton) return;
        }
        if (buttons.getChildCount() == 0) return;

        // Same size as Instagram's own buttons in this bar. Their layout params can be
        // match_parent/weighted, so use the measured width.
        View ref = buttons.getChildAt(0);
        float density = res.getDisplayMetrics().density;
        int width = ref.getWidth() > 0 ? ref.getWidth() : Math.round(48 * density);
        ProfileSettingsButton button = new ProfileSettingsButton(activity);
        button.setColor(iconColor(activity));
        buttons.addView(button, 0, new LinearLayout.LayoutParams(width, ViewGroup.LayoutParams.MATCH_PARENT));
    }

    /** The profile username's color, which Instagram also uses for the bar's icons. */
    private static int iconColor(Activity activity) {
        int titleId = activity.getResources().getIdentifier("action_bar_title", "id", "com.instagram.android");
        View title = titleId == 0 ? null : activity.findViewById(titleId);
        if (title instanceof TextView) return ((TextView) title).getCurrentTextColor();
        int mode = activity.getResources().getConfiguration().uiMode
                & android.content.res.Configuration.UI_MODE_NIGHT_MASK;
        return mode == android.content.res.Configuration.UI_MODE_NIGHT_YES ? Color.WHITE : Color.BLACK;
    }

    private void setColor(int color) {
        line.setColor(color);
        knob.setColor(color);
        invalidate();
    }

    /** A "sliders" icon: three lines with a knob on each, in a 24dp box like Instagram's icons. */
    @Override
    protected void onDraw(Canvas canvas) {
        float size = 24 * density;
        float left = (getWidth() - size) / 2f;
        float top = (getHeight() - size) / 2f;
        float r = 2.6f * density;
        float[] rows = {0.22f, 0.5f, 0.78f};
        float[] knobs = {0.68f, 0.32f, 0.58f};
        for (int i = 0; i < rows.length; i++) {
            float y = top + size * rows[i];
            float kx = left + size * knobs[i];
            canvas.drawLine(left + 2 * density, y, kx - r, y, line);
            canvas.drawLine(kx + r, y, left + size - 2 * density, y, line);
            canvas.drawCircle(kx, y, r, knob);
        }
    }
}
