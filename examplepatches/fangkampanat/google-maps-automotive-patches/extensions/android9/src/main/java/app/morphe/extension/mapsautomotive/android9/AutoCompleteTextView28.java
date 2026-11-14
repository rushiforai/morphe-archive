package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.widget.AutoCompleteTextView;
import android.widget.ListPopupWindow;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Android 10 members of AutoCompleteTextView (patch "Android 9 (API 28)"). Refreshing runs the view's own (protected,
 * public API) performFiltering on the current text, or closes the drop-down when the text is too short, as Android 10
 * does; the popup's input method mode is set on its ListPopupWindow, reached through the field mPopup (on Android 9's
 * light greylist).
 */
public final class AutoCompleteTextView28 {
    public static final String OWNER = "Landroid/widget/AutoCompleteTextView;";
    private static Field popup;
    private static boolean popupLooked;
    private static Method performFiltering;
    private static boolean filteringLooked;

    private AutoCompleteTextView28() {
    }

    public static void refreshAutoCompleteResults(AutoCompleteTextView view) {
        if (Build.VERSION.SDK_INT >= 29) {
            view.refreshAutoCompleteResults();
            return;
        }
        if (!view.enoughToFilter()) {
            view.dismissDropDown();
            return;
        }
        synchronized (AutoCompleteTextView28.class) {
            if (!filteringLooked) {
                filteringLooked = true;
                try {
                    Method method = AutoCompleteTextView.class.getDeclaredMethod("performFiltering", CharSequence.class, int.class);
                    method.setAccessible(true);
                    performFiltering = method;
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    performFiltering = null;
                }
            }
        }
        try {
            if (performFiltering != null) performFiltering.invoke(view, view.getText(), 0);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // The results refresh with the next text change.
        }
    }

    public static void setInputMethodMode(AutoCompleteTextView view, int mode) {
        if (Build.VERSION.SDK_INT >= 29) {
            view.setInputMethodMode(mode);
            return;
        }
        synchronized (AutoCompleteTextView28.class) {
            if (!popupLooked) {
                popupLooked = true;
                try {
                    Field field = AutoCompleteTextView.class.getDeclaredField("mPopup");
                    field.setAccessible(true);
                    popup = field;
                } catch (ReflectiveOperationException | RuntimeException ignored) {
                    popup = null;
                }
            }
        }
        try {
            Object window = popup == null ? null : popup.get(view);
            if (window instanceof ListPopupWindow) ((ListPopupWindow) window).setInputMethodMode(mode);
        } catch (IllegalAccessException | RuntimeException ignored) {
            // The popup keeps its mode.
        }
    }
}
