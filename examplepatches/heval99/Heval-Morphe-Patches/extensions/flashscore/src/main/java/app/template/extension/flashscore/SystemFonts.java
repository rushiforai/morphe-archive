package app.template.extension.flashscore;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.util.SparseArray;

/**
 * The code half of "Use system font". Flashscore loads its font resources (the Livesport text
 * families, the score digits, the display face) through ResourcesCompat.getFont; Compose and two
 * views use that path. {@link #typeface} answers the device's system font at the weight the
 * resource stands for, so text keeps its bold and extra-bold looks. The weights follow the XML half
 * of the patch: extrabold -> 900 (sans-serif-black), bold / medium -> 500 (sans-serif-medium),
 * anything else -> 400 (sans-serif).
 */
@SuppressWarnings("unused")
public final class SystemFonts {

    private static final SparseArray<Typeface> CACHE = new SparseArray<>();

    /**
     * Patched in at the start of ResourcesCompat.getFont(int, Context): the system typeface for the
     * font resource {@code id}, or null to load the app's own font (not a font resource, or any
     * error).
     */
    public static Typeface typeface(int id, Context context) {
        try {
            if (context == null) return null;
            synchronized (CACHE) {
                Typeface cached = CACHE.get(id);
                if (cached != null) return cached;
            }
            if (!"font".equals(context.getResources().getResourceTypeName(id))) return null;
            int weight = weight(context.getResources().getResourceEntryName(id));
            Typeface typeface = Build.VERSION.SDK_INT >= 28
                ? Typeface.create(Typeface.DEFAULT, weight, false)
                : Typeface.create(weight >= 900 ? "sans-serif-black" : weight >= 500 ? "sans-serif-medium" : "sans-serif", Typeface.NORMAL);
            if (typeface == null) return null;
            synchronized (CACHE) {
                CACHE.put(id, typeface);
            }
            return typeface;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** The system weight for a font resource name such as livesport_bold. */
    static int weight(String name) {
        String n = name == null ? "" : name.toLowerCase(java.util.Locale.ROOT);
        if (n.contains("extrabold") || n.contains("extra_bold") || n.contains("black")) return 900;
        if (n.contains("bold") || n.contains("medium") || n.contains("semi")) return 500;
        return 400;
    }

    private SystemFonts() { }
}
