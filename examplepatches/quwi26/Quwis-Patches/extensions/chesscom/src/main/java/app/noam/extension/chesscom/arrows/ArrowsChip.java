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
import java.util.ArrayList;
import java.util.Iterator;
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
    private static boolean logged, loggedOff;

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
     * the app's buttons. Clear only joins the list while drawing is on, so the bar saves its space
     * the rest of the time. The patch sets the action class name in actionType().
     */
    @SuppressWarnings("unchecked")
    public static void addActions(Object actions) {
        if (!Arrows.reviewsEnabled()) {
            if (!loggedOff) {
                loggedOff = true;
                Utils.log("Arrows review bar: reviews are off");
            }
            return;
        }
        try {
            Field field = null;
            for (Field candidate : actions.getClass().getDeclaredFields()) {
                if (List.class.isAssignableFrom(candidate.getType())) field = candidate;
            }
            if (field == null) throw new IllegalStateException("No actions in " + actions.getClass().getName());
            field.setAccessible(true);
            Object value = field.get(actions);
            if (!(value instanceof List)) return;
            // A single-action state keeps a Collections.singletonList here, which cannot grow.
            List<Object> list;
            if (value instanceof ArrayList) {
                list = (List<Object>) value;
            } else {
                list = new ArrayList<>((List<Object>) value);
                field.set(actions, list);
            }
            if (list.isEmpty()) return;
            // Reading our state here makes the bar redraw this list when drawing starts or stops.
            // The list is rebuilt from the app's own actions, so Clear is usually not there yet:
            // removing it must not stop Arrows from being added.
            boolean drawing = ArrowsBar.reviewsDrawing();
            if (!logged) {
                logged = true;
                Utils.log("Arrows review bar: actions " + list.size() + ", drawing " + drawing);
            }
            if (!drawing) removeAction(list, ArrowsBar.clearLabel());

            Class<?> type = Class.forName(actionType());
            // 4.10.23 wraps every action of this bar in a one-field class before the bar draws
            // it; ours have to be wrapped the same way or the bar's cast fails.
            Object first = list.get(0);
            boolean direct = type.isInstance(first);
            Constructor<?> wrapper = null;
            if (!direct) {
                for (Constructor<?> candidate : first.getClass().getConstructors()) {
                    Class<?>[] parameters = candidate.getParameterTypes();
                    if (parameters.length == 1 && parameters[0].isAssignableFrom(type)) wrapper = candidate;
                }
                if (wrapper == null) return;
            }
            if (!hasAction(list, ArrowsBar.arrowsLabel())) {
                add(list, action(type, ArrowsBar.arrowsLabel(), ArrowsBar.arrowsIcon(), ArrowsBar.onArrows()),
                    direct, wrapper);
            }
            if (drawing && !hasAction(list, ArrowsBar.clearLabel())) {
                add(list, action(type, ArrowsBar.clearLabel(), ArrowsBar.clearIcon(), ArrowsBar.onClear()),
                    direct, wrapper);
            }
        } catch (Throwable throwable) {
            Utils.logError("Arrows review bar", throwable);
        }
    }

    private static void add(List<Object> list, Object action, boolean direct, Constructor<?> wrapper) throws Exception {
        list.add(direct ? action : wrapper.newInstance(action));
    }

    /** Removes the action with this label; true when one was there. */
    private static boolean removeAction(List<Object> actions, String label) {
        for (Iterator<Object> iterator = actions.iterator(); iterator.hasNext(); ) {
            if (label.equals(labelOf(iterator.next()))) {
                iterator.remove();
                return true;
            }
        }
        return false;
    }

    private static Object action(Class<?> type, String label, int icon, Function0<?> onClick) throws Exception {
        Constructor<?> constructor = type.getConstructor(
            String.class, Integer.class, Function0.class, Function1.class,
            boolean.class, boolean.class, int.class);
        return constructor.newInstance(label, Integer.valueOf(icon), onClick, null, true, false, 0x78);
    }

    /** The bar action class, set by the patch. */
    private static String actionType() {
        return "";
    }

    /** The label of a bar action: its only String field, or the one of the action it wraps. */
    private static String labelOf(Object action) {
        String label = stringField(action);
        if (label != null) return label;
        for (Field field : action.getClass().getDeclaredFields()) {
            if (field.getType().isPrimitive() || field.getType() == String.class) continue;
            try {
                field.setAccessible(true);
                Object value = field.get(action);
                if (value != null) {
                    label = stringField(value);
                    if (label != null) return label;
                }
            } catch (Throwable ignored) {
                // Not readable; keep looking.
            }
        }
        return null;
    }

    /** A class's only String field. */
    private static String stringField(Object action) {
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
