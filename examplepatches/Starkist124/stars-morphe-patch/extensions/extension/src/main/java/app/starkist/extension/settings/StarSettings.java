package app.starkist.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.util.Log;

import java.io.File;

/**
 * Storage for every setting shown on the Star settings screen.
 * Values live in the patched app's own SharedPreferences.
 */
@SuppressWarnings("unused")
public final class StarSettings {

    /** Title of the entry added to the app's settings list, and of the settings screen. */
    public static final String TITLE = "Star settings";

    private static final String PREFS_NAME = "star_settings";

    private static final String KEY_TEXT_ZOOM = "article_text_zoom";
    private static final String KEY_FONT = "article_font";
    private static final String KEY_CUSTOM_FONT_NAME = "article_custom_font_name";

    /** Text size in percent of the app's normal size, used for both articles and the rest of the app. */
    public static final int TEXT_ZOOM_DEFAULT = 100;
    public static final int TEXT_ZOOM_MIN = 50;
    public static final int TEXT_ZOOM_MAX = 150;
    public static final int TEXT_ZOOM_STEP = 5;

    private static final String GRAPHIK_ASSET = "Graphik-Regular.ttf";

    private static Typeface cachedTypeface;
    private static String cachedTypefaceKey;

    /** Fonts the article body can use. */
    public enum FontChoice {
        DEFAULT("App default", null),
        GRAPHIK("Graphik", "'Graphik App', sans-serif"),
        SERIF("Serif", "serif"),
        SANS_SERIF("Sans-serif", "sans-serif"),
        MONOSPACE("Monospace", "monospace"),
        CUSTOM("Custom font", "'StarCustomFont', monospace");

        public final String label;
        /** CSS font-family value, or null to keep the app's own font. */
        public final String cssFamily;

        FontChoice(String label, String cssFamily) {
            this.label = label;
            this.cssFamily = cssFamily;
        }
    }

    private StarSettings() {
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    public static int getTextZoom(Context context) {
        int zoom = prefs(context).getInt(KEY_TEXT_ZOOM, TEXT_ZOOM_DEFAULT);
        return Math.max(TEXT_ZOOM_MIN, Math.min(TEXT_ZOOM_MAX, zoom));
    }

    public static void setTextZoom(Context context, int zoom) {
        prefs(context).edit().putInt(KEY_TEXT_ZOOM, zoom).apply();
    }

    public static FontChoice getFont(Context context) {
        String name = prefs(context).getString(KEY_FONT, FontChoice.DEFAULT.name());
        try {
            FontChoice choice = FontChoice.valueOf(name);
            // A custom font is only usable while its file exists.
            if (choice == FontChoice.CUSTOM && !getCustomFontFile(context).isFile()) {
                return FontChoice.DEFAULT;
            }
            return choice;
        } catch (IllegalArgumentException e) {
            return FontChoice.DEFAULT;
        }
    }

    public static void setFont(Context context, FontChoice choice) {
        prefs(context).edit().putString(KEY_FONT, choice.name()).apply();
    }

    /** Display name of the font file the user picked, or null if none. */
    public static String getCustomFontName(Context context) {
        if (!getCustomFontFile(context).isFile()) return null;
        return prefs(context).getString(KEY_CUSTOM_FONT_NAME, null);
    }

    public static void setCustomFontName(Context context, String name) {
        prefs(context).edit().putString(KEY_CUSTOM_FONT_NAME, name).apply();
    }

    /** Where the user's picked font is copied to, inside the app's private storage. */
    public static File getCustomFontFile(Context context) {
        File dir = new File(context.getApplicationContext().getFilesDir(), "star_settings");
        return new File(dir, "custom_font");
    }

    /**
     * Typeface for the chosen font, for use in native (non-web) screens.
     *
     * @return The typeface, or null to keep the app's own fonts.
     */
    public static Typeface getTypeface(Context context) {
        FontChoice font = getFont(context);
        File customFile = getCustomFontFile(context);
        String key = font == FontChoice.CUSTOM ? font.name() + customFile.lastModified() : font.name();

        synchronized (StarSettings.class) {
            if (key.equals(cachedTypefaceKey)) return cachedTypeface;

            Typeface typeface = null;
            try {
                switch (font) {
                    case GRAPHIK:
                        typeface = Typeface.createFromAsset(context.getAssets(), GRAPHIK_ASSET);
                        break;
                    case SERIF:
                        typeface = Typeface.SERIF;
                        break;
                    case SANS_SERIF:
                        typeface = Typeface.SANS_SERIF;
                        break;
                    case MONOSPACE:
                        typeface = Typeface.MONOSPACE;
                        break;
                    case CUSTOM:
                        typeface = Typeface.createFromFile(customFile);
                        break;
                    default:
                        break;
                }
            } catch (Exception e) {
                Log.e("StarSettings", "Could not load font " + font, e);
            }

            cachedTypeface = typeface;
            cachedTypefaceKey = key;
            return typeface;
        }
    }

    public static void resetAll(Context context) {
        prefs(context).edit().clear().apply();
        //noinspection ResultOfMethodCallIgnored
        getCustomFontFile(context).delete();
    }
}
