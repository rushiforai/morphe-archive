package app.noam.extension.chesscom.arrows;

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

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.List;

import app.noam.extension.chesscom.Utils;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/**
 * 4.10.23's bot game bar is a Compose bar the patch cannot add buttons to, so a small in-app chip
 * over the board does the same job: Arrows toggles the drawing mode, Clear removes the marks.
 */
public final class ArrowsChip {
    private static final String TAG = "morphe_arrows_chip";

    private ArrowsChip() {}

    public static void attach(Activity activity) {
        attach(activity, Arrows.gamesEnabled());
    }

    /** The Game Review screen, whose Compose UI has no bottom bar we can add buttons to. */
    public static void attachReviews(Activity activity) {
        if (reviewsInBar()) return;
        attach(activity, Arrows.reviewsEnabled());
    }

    /** True when the review bar itself carries the buttons, so the chip is not needed. */
    public static boolean reviewsInBar() {
        return false;
    }

    /**
     * Adds Arrows and Clear to the action list the review's own bottom bar draws, so they look like
     * the app's buttons. The patch sets the action class name in actionType().
     */
    @SuppressWarnings("unchecked")
    public static void addActions(Object actions) {
        if (!Arrows.reviewsEnabled()) return;
        try {
            List<Object> list = null;
            for (Field field : actions.getClass().getDeclaredFields()) {
                if (!List.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                Object value = field.get(actions);
                if (value instanceof List) list = (List<Object>) value;
            }
            if (list == null) throw new IllegalStateException("No actions in " + actions.getClass().getName());
            if (list.isEmpty()) return;

            Class<?> type = Class.forName(actionType());
            // Some states (the condensed paywall's bar) wrap each action in another class; leave those alone.
            if (!type.isInstance(list.get(0))) return;
            if (hasAction(list, ArrowsBar.arrowsLabel())) return;

            Constructor<?> constructor = type.getConstructor(
                String.class, Integer.class, Function0.class, Function1.class,
                boolean.class, boolean.class, int.class);
            list.add(constructor.newInstance(
                ArrowsBar.arrowsLabel(), Integer.valueOf(ArrowsBar.arrowsIcon()),
                ArrowsBar.onArrows(), null, true, false, 0x78));
            list.add(constructor.newInstance(
                ArrowsBar.clearLabel(), Integer.valueOf(ArrowsBar.clearIcon()),
                ArrowsBar.onClear(), null, true, false, 0x78));
        } catch (Throwable throwable) {
            Utils.logError("Arrows review bar", throwable);
        }
    }

    /** The bar action class, set by the patch. */
    private static String actionType() {
        return "";
    }

    /** The label of a bar action (its only String field). */
    private static String labelOf(Object action) {
        for (Field field : action.getClass().getDeclaredFields()) {
            if (field.getType() != String.class) continue;
            try {
                field.setAccessible(true);
                Object value = field.get(action);
                if (value instanceof String) return (String) value;
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static boolean hasAction(List<Object> actions, String label) {
        for (Object action : actions) {
            if (label.equals(labelOf(action))) return true;
        }
        return false;
    }

    private static void attach(Activity activity, boolean enabled) {
        if (activity == null || !enabled) return;
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
