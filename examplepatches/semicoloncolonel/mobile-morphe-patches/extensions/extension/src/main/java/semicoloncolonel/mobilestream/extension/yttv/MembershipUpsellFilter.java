package semicoloncolonel.mobilestream.extension.yttv;

import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Hides the "Add to membership" upsell shelf from the YouTube TV home feed
 * and search results.
 *
 * Both are flat lists of item models (each a subclass of the base whose
 * no-argument CharSequence getter returns the shelf title). On the home feed a
 * shelf is split into separate items: a header (carries the title), its
 * horizontal card row, and dividers. In search results each shelf is one
 * titled item, and the title is capitalized ("Add To Membership"). This
 * filters the list the adapter is given, removing the shelf's item, the
 * untitled card row that follows it, and a trailing divider, so the whole
 * shelf is gone with no empty space left behind. Lists that do not contain
 * the shelf pass through unchanged.
 */
@SuppressWarnings("unused")
public final class MembershipUpsellFilter {
    private static final String TAG = "MSP-YTTV";
    private static final String TITLE = "Add to membership";
    // The item models' title getter (no-arg, returns CharSequence) on the base
    // feed-item class; its obfuscated name is stable for the targeted build.
    private static final String TITLE_GETTER = "F";

    private MembershipUpsellFilter() {
    }

    /** Returns the feed list with the upsell shelf removed. Safe on any list. */
    public static List<?> filter(List<?> items) {
        if (items == null || items.isEmpty()) {
            return items;
        }
        try {
            ArrayList<Object> out = null;
            for (int i = 0; i < (out == null ? items.size() : out.size()); i++) {
                Object header = (out == null ? items.get(i) : out.get(i));
                CharSequence title = titleOf(header);
                if (title == null || !TITLE.equalsIgnoreCase(title.toString())) {
                    continue;
                }
                if (out == null) {
                    out = new ArrayList<>(items);
                }
                // Remove the header, the untitled card row after it, and a
                // trailing divider that matches the divider before the header.
                // A titled item after it is the next shelf, and is kept.
                int end = i;
                if (i + 1 < out.size() && titleOf(out.get(i + 1)) == null) {
                    end = i + 1; // card row
                }
                if (i > 0 && end + 1 < out.size()
                        && out.get(end + 1).getClass() == out.get(i - 1).getClass()
                        && titleOf(out.get(end + 1)) == null) {
                    end = end + 1; // trailing divider
                }
                for (int k = end; k >= i; k--) {
                    out.remove(k);
                }
                i--;
            }
            if (out != null) {
                Log.i(TAG, "membership upsell shelf removed from feed");
                return out;
            }
        } catch (Throwable t) {
            Log.e(TAG, "upsell filter error", t);
        }
        return items;
    }

    private static Method titleGetter;

    private static CharSequence titleOf(Object item) {
        if (item == null) {
            return null;
        }
        try {
            Method method = titleGetter;
            if (method == null || !method.getDeclaringClass().isInstance(item)) {
                method = item.getClass().getMethod(TITLE_GETTER);
                titleGetter = method;
            }
            Object result = method.invoke(item);
            return (result instanceof CharSequence) ? (CharSequence) result : null;
        } catch (Throwable t) {
            return null;
        }
    }
}
