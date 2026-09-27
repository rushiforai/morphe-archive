package app.mahirsn.extension.youtube.history;

import android.content.Context;
import android.content.res.Resources;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.Locale;

/**
 * The app's own look: its strings, drawables, theme colors and text views, looked up by name so
 * everything added here matches YouTube and the Morphe buttons next to it (and its language).
 */
final class Ui {
    static int id(Context ctx, String type, String name) {
        return ctx.getResources().getIdentifier(name, type, ctx.getPackageName());
    }

    /** A string of the app, in the app's language; the fallback when the app has none by that name. */
    static String str(Context ctx, String name, String fallback) {
        int res = id(ctx, "string", name);
        return res != 0 ? ctx.getString(res) : fallback;
    }

    /** A color attribute of the app's theme, such as ytTextPrimary. */
    static int attr(Context ctx, String name, int fallback) {
        int res = id(ctx, "attr", name);
        TypedValue v = new TypedValue();
        if (res == 0 || !ctx.getTheme().resolveAttribute(res, v, true)) return fallback;
        if (v.type >= TypedValue.TYPE_FIRST_COLOR_INT && v.type <= TypedValue.TYPE_LAST_COLOR_INT) return v.data;
        try {
            return ctx.getColor(v.resourceId);
        } catch (Resources.NotFoundException e) {
            return fallback;
        }
    }

    static int color(Context ctx, String name, int fallback) {
        int res = id(ctx, "color", name);
        return res != 0 ? ctx.getColor(res) : fallback;
    }

    static int dimen(Context ctx, String name, int fallback) {
        int res = id(ctx, "dimen", name);
        return res != 0 ? ctx.getResources().getDimensionPixelSize(res) : fallback;
    }

    /** YouTube's own text view (its font), or a plain one. */
    static TextView text(Context ctx, CharSequence s, float sp, int color) {
        TextView t;
        try {
            t = (TextView) Class.forName("com.google.android.libraries.youtube.common.ui.YouTubeTextView")
                    .getConstructor(Context.class).newInstance(ctx);
        } catch (Throwable e) {
            t = new TextView(ctx);
        }
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTextColor(color);
        t.setIncludeFontPadding(false);
        return t;
    }

    static View find(View root, String idName) {
        int res = id(root.getContext(), "id", idName);
        return res == 0 ? null : root.findViewById(res);
    }

    static <T extends View> T find(ViewGroup group, Class<T> type) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (type.isInstance(child) && child.getVisibility() == View.VISIBLE) return type.cast(child);
            if (child instanceof ViewGroup) {
                T found = find((ViewGroup) child, type);
                if (found != null) return found;
            }
        }
        return null;
    }

    static int dp(Context ctx, float v) {
        return (int) (v * ctx.getResources().getDisplayMetrics().density + 0.5f);
    }

    static String clock(long ms) {
        long s = ms / 1000;
        return s >= 3600
                ? String.format(Locale.ROOT, "%d:%02d:%02d", s / 3600, s % 3600 / 60, s % 60)
                : String.format(Locale.ROOT, "%d:%02d", s / 60, s % 60);
    }

    private Ui() {
    }
}
