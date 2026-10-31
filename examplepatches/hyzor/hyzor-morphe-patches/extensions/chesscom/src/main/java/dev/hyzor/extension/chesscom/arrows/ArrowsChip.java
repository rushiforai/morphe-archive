package dev.hyzor.extension.chesscom.arrows;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import dev.hyzor.extension.chesscom.Utils;

/**
 * 4.10.23's bot game bar is a Compose bar the patch cannot add buttons to, so a small in-app chip
 * over the board does the same job: Arrows toggles the drawing mode, Clear removes the marks.
 */
public final class ArrowsChip {
    private static final String TAG = "morphe_arrows_chip";

    private ArrowsChip() {}

    public static void attach(Activity activity) {
        if (activity == null || !Arrows.enabled()) return;
        try {
            View decor = activity.getWindow().getDecorView();
            if (!(decor instanceof ViewGroup)) return;
            ViewGroup root = (ViewGroup) decor;
            if (root.findViewWithTag(TAG) != null) return;

            LinearLayout bar = new LinearLayout(activity);
            bar.setTag(TAG);
            bar.setOrientation(LinearLayout.HORIZONTAL);
            GradientDrawable background = new GradientDrawable();
            background.setColor(0xCC1B1B1B);
            background.setCornerRadius(dp(activity, 18));
            background.setStroke(dp(activity, 1), 0x55FFFFFF);
            bar.setBackground(background);
            int padding = dp(activity, 6);
            bar.setPadding(padding, dp(activity, 2), padding, dp(activity, 2));

            TextView arrows = entry(activity, "Arrows");
            TextView clear = entry(activity, "Clear");
            bar.addView(arrows);
            bar.addView(space(activity));
            bar.addView(clear);

            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.gravity = Gravity.BOTTOM | Gravity.END;
            params.bottomMargin = dp(activity, 96);
            params.rightMargin = dp(activity, 8);
            root.addView(bar, params);

            arrows.setOnClickListener(view -> {
                ArrowsBar.toggle(root);
                refresh(activity, arrows, clear);
            });
            clear.setOnClickListener(view -> {
                ArrowsBar.clearMarks(root);
                refresh(activity, arrows, clear);
            });
            refresh(activity, arrows, clear);
        } catch (Throwable throwable) {
            Utils.logError("Arrows chip failed", throwable);
        }
    }

    private static void refresh(Activity activity, TextView arrows, TextView clear) {
        View decor = activity.getWindow().getDecorView();
        boolean drawing = ArrowsBar.isDrawing(decor);
        arrows.setTextColor(drawing ? 0xFFFFB74D : Color.WHITE);
        clear.setTextColor(ArrowsBar.hasMarks(decor) ? Color.WHITE : 0x66FFFFFF);
    }

    private static TextView entry(Context context, String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        view.setTextColor(Color.WHITE);
        view.setPadding(dp(context, 10), dp(context, 6), dp(context, 10), dp(context, 6));
        return view;
    }

    private static View space(Context context) {
        View view = new View(context);
        view.setLayoutParams(new LinearLayout.LayoutParams(dp(context, 4), 1));
        return view;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
