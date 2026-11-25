package dev.custom.gboardpatches.ui;

import android.graphics.Color;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * Recolors Gboard settings rows to pure black with white text.
 *
 * The row holder's fields are R8-renamed in 18.6.3 (s..w), so the row view is located by
 * declared type rather than by name: the outermost View instance on the holder wins.
 */
public final class AmoledSettingsRuntime {

    private AmoledSettingsRuntime() {
    }

    public static void applyPreference(Object preference, Object holder) {
        try {
            final View itemView = resolveItemView(holder);
            if (itemView == null) {
                return;
            }
            // Hooked at method entry, where the holder parameter register is still typed as the
            // holder rather than a reused local. Posting keeps the recolor happening after the
            // row has finished binding, which is what the old return-site hook relied on.
            itemView.post(new Runnable() {
                @Override
                public void run() {
                    try {
                        itemView.setBackgroundColor(Color.BLACK);
                        tint(itemView);
                    } catch (Throwable ignored) {
                    }
                }
            });
        } catch (Throwable ignored) {
        }
    }

    private static View resolveItemView(Object holder) {
        if (holder == null) {
            return null;
        }
        View best = null;
        int bestChildren = -1;
        Class<?> type = holder.getClass();
        while (type != null) {
            java.lang.reflect.Field[] fields = type.getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {
                try {
                    fields[i].setAccessible(true);
                    Object value = fields[i].get(holder);
                    if (!(value instanceof View)) {
                        continue;
                    }
                    View candidate = (View) value;
                    int children = candidate instanceof ViewGroup
                        ? ((ViewGroup) candidate).getChildCount()
                        : 0;
                    if (children > bestChildren) {
                        bestChildren = children;
                        best = candidate;
                    }
                } catch (Throwable ignored) {
                }
            }
            type = type.getSuperclass();
        }
        return best;
    }

    private static void tint(View view) {
        if (view instanceof TextView) {
            ((TextView) view).setTextColor(Color.WHITE);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                tint(group.getChildAt(i));
            }
        }
    }
}
