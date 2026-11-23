package app.jofslash.extension.booking;

import android.util.Log;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Used by the Label Preferred properties patch. Booking.com marks properties of its Preferred
 * Partner Programme with a thumbs-up ("Preferred") or a "Preferred Plus" badge. Properties join that
 * programme by paying Booking.com a higher commission, so the badge is not a quality mark. The
 * patch keeps the badge and puts a short label next to it that says so.
 *
 * The search results list is a server-driven page: there {@link SabaJsonFilter} adds the label to
 * its JSON. On the property page and on the app's own property cards (the map), the badge is a
 * Compose function; the patch calls {@link #badge} right after it draws the badge icon.
 */
@SuppressWarnings("unused")
public final class PreferredLabel {
    private static final String TAG = "JoFSlash";

    private PreferredLabel() {
    }

    /** The label next to the badge, the same for Preferred and Preferred Plus. */
    static String label(boolean plus) {
        return Strings.PREFERRED_LABEL;
    }

    private static Method buiBadge;
    private static Object outlined;
    private static boolean failed;

    /** Called from the Preferred badge on the property page, with the composer drawing it. */
    public static void preferredBadge(Object composer) {
        badge(composer, false);
    }

    /** Called from the Preferred Plus badge on the property page. */
    public static void preferredPlusBadge(Object composer) {
        badge(composer, true);
    }

    /** Called from the badge on the app's own property cards, with its Property.PreferredType. */
    public static void cardBadge(Object composer, Object preferredType) {
        if (preferredType == null) return;
        badge(composer, String.valueOf(preferredType).toLowerCase(java.util.Locale.ROOT).contains("plus"));
    }

    /**
     * Draws the label as Booking's own outlined badge (the style of its "Promoted" badge):
     * BuiBadgeKt.BuiBadge(modifier, text, icon, variant, alt, composer, changed, defaults).
     */
    private static void badge(Object composer, boolean plus) {
        if (composer == null || !find()) return;
        try {
            // 27648 and 5 as the app passes them for its "Promoted" badge: modifier and icon are
            // left to their defaults.
            buiBadge.invoke(null, null, label(plus), null, outlined, false, composer, 27648, 5);
        } catch (InvocationTargetException e) {
            // Thrown while drawing: let the app handle it as it would its own badge.
            Throwable cause = e.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new RuntimeException(cause);
        } catch (IllegalAccessException e) {
            failed = true;
            Log.w(TAG, "Couldn't draw the Preferred label", e);
        }
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static synchronized boolean find() {
        if (buiBadge != null) return true;
        if (failed) return false;
        try {
            Class<?> kt = Class.forName("com.booking.bui.compose.badge.BuiBadgeKt");
            for (Method m : kt.getDeclaredMethods()) {
                Class<?>[] p = m.getParameterTypes();
                if (m.getName().equals("BuiBadge") && p.length == 8 && p[1] == String.class
                        && p[3].isEnum() && p[4] == boolean.class) {
                    outlined = Enum.valueOf((Class<Enum>) p[3], "Outlined");
                    m.setAccessible(true);
                    buiBadge = m;
                    return true;
                }
            }
            Log.w(TAG, "Couldn't find BuiBadge");
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't find BuiBadge", t);
        }
        failed = true;
        return false;
    }
}
