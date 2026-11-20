package e.e.a;

import android.content.Context;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.Locale;

/** Adds the existing list-transfer action to the multi-select footer. */
public final class BulkMove211 {
    private static final String TAG = "nicoid-v211-bulk-move";
    private BulkMove211() {}

    public static void installNative(LinearLayout footer, Object owner) {
        if (footer == null || owner == null || !nativeMylist(owner)) return;
        add(footer, owner, false);
    }

    public static void installLocal(LinearLayout footer, Object owner) {
        if (footer == null || owner == null) return;
        add(footer, owner, true);
    }

    private static boolean nativeMylist(Object owner) {
        try {
            int kind = owner.getClass().getField("g0").getInt(owner);
            return (kind == 5 || kind == 9)
                    && owner.getClass().getField("h0").getInt(owner) != 4;
        } catch (Exception e) {
            return false;
        }
    }

    private static int dp(Context c, int value) {
        return Math.round(value * c.getResources().getDisplayMetrics().density);
    }

    private static String moveText(Context c) {
        try {
            Method translate = Class.forName("e.e.a.UiStrings").getDeclaredMethod("translate", String.class);
            translate.setAccessible(true);
            return (String) translate.invoke(null, "移動");
        } catch (Exception ignored) {
            Locale language = c.getResources().getConfiguration().locale;
            return "ja".equals(language.getLanguage()) ? "移動"
                    : "zh".equals(language.getLanguage()) ? "移動" : "Move";
        }
    }

    private static Button newButton(Context c) {
        Button b;
        try {
            Method factory = Class.forName("e.e.a.PanelUi").getDeclaredMethod("button", Context.class, String.class);
            factory.setAccessible(true);
            b = (Button) factory.invoke(null, c, moveText(c));
            Method theme = Class.forName("e.e.a.UiDialogs").getDeclaredMethod("actionButton", Button.class, boolean.class);
            theme.setAccessible(true);
            theme.invoke(null, b, false);
        } catch (Exception ignored) {
            b = new Button(c);
            b.setText(moveText(c));
        }
        b.setTextSize(13);
        b.setMinWidth(0);
        b.setMinimumWidth(0);
        b.setTag(TAG);
        b.setEnabled(false);
        return b;
    }

    private static void add(LinearLayout footer, Object owner, boolean local) {
        for (int n = 0; n < footer.getChildCount(); n++) {
            if (TAG.equals(footer.getChildAt(n).getTag())) return;
        }
        Context c = footer.getContext();
        Button b = newButton(c);
        b.setOnClickListener(v -> {
            if (!b.isEnabled()) return;
            try {
                if (local) {
                    Method move = owner.getClass().getDeclaredMethod("moveSelected");
                    move.setAccessible(true);
                    move.invoke(owner);
                } else {
                    // NativeMylistMove215 now confirms AFTER selecting the destination.
                    // Do not duplicate confirmation before showing the folder list.
                    Class<?> listener = Class.forName("com.sauzask.nicoid.NicoidVideoListFragment$j");
                    Constructor<?> constructor = listener.getConstructor(owner.getClass());
                    ((View.OnClickListener) constructor.newInstance(owner)).onClick(null);
                }
            } catch (Exception e) {
                android.util.Log.w("nicoid-bulk", "Bulk transfer action unavailable", e);
                Toast.makeText(c, moveText(c) + " failed", Toast.LENGTH_SHORT).show();
            }
        });
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, dp(c, 48));
        lp.leftMargin = dp(c, 8);
        footer.addView(b, Math.min(1, footer.getChildCount()), lp);
    }

    public static void refresh(LinearLayout footer, int selectedCount) {
        if (footer == null) return;
        for (int n = 0; n < footer.getChildCount(); n++) {
            View child = footer.getChildAt(n);
            if (TAG.equals(child.getTag())) child.setEnabled(selectedCount > 0);
        }
    }
}