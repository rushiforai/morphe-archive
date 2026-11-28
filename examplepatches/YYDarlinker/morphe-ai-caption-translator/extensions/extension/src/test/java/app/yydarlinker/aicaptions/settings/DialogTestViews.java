package app.yydarlinker.aicaptions.settings;

import android.app.Dialog;
import android.view.View;
import android.view.ViewGroup;

public final class DialogTestViews {
    private DialogTestViews() {}

    public static <T extends View> T find(Dialog dialog, Class<T> type) {
        T result = find(dialog.getWindow().getDecorView(), type);
        if (result == null) throw new AssertionError("Missing dialog view: " + type.getSimpleName());
        return result;
    }

    private static <T extends View> T find(View view, Class<T> type) {
        if (type.isInstance(view)) return type.cast(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                T result = find(group.getChildAt(i), type);
                if (result != null) return result;
            }
        }
        return null;
    }
}
