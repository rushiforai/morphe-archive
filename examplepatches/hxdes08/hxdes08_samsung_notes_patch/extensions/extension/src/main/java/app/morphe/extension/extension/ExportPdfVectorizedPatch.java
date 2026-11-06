package app.morphe.extension.samsungnotes;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.PopupWindow;

import java.lang.reflect.Field;

@SuppressWarnings("unused")
public final class ExportPdfVectorizedPatch {

    private static final String MENU_ITEM_NAME = "action_export_pdf_vectorized";

    private static int menuItemId = -1;
    private static PopupWindow popup;

    /**
     * Wird am Anfang der beiden doOptionsItemSelected*-Methoden aufgerufen.
     * @return true, wenn der Klick behandelt wurde (Original-Methode wird übersprungen).
     */
    public static boolean onOptionsItemSelected(Object menuHost, int itemId) {
        try {
            Activity activity = getActivity(menuHost);
            if (activity == null) return false;

            if (menuItemId == -1) {
                menuItemId = activity.getResources()
                        .getIdentifier(MENU_ITEM_NAME, "id", activity.getPackageName());
            }
            if (menuItemId == 0 || itemId != menuItemId) return false;

            showEmptySubMenu(activity);
            return true;
        } catch (Throwable t) {
            return false; // im Zweifel die Original-Logik weiterlaufen lassen
        }
    }

    /** Liest das Feld "mActivity" per Reflection (Feldtyp ist im Bytecode nicht sicher bekannt). */
    private static Activity getActivity(Object host) throws IllegalAccessException {
        for (Class<?> c = host.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField("mActivity");
                field.setAccessible(true);
                Object value = field.get(host);
                return value instanceof Activity ? (Activity) value : null;
            } catch (NoSuchFieldException ignored) {
                // in der Oberklasse weitersuchen
            }
        }
        return null;
    }

    private static void showEmptySubMenu(Activity activity) {
        if (popup != null) popup.dismiss();

        float density = activity.getResources().getDisplayMetrics().density;

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setBackgroundColor(Color.WHITE);
        content.setMinimumWidth((int) (200 * density));
        content.setMinimumHeight((int) (56 * density)); // leer, aber sichtbar
        content.setElevation(8 * density);

        popup = new PopupWindow(content,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                true);
        popup.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        popup.showAtLocation(activity.getWindow().getDecorView(),
                Gravity.TOP | Gravity.END,
                (int) (16 * density), (int) (72 * density));
    }
}