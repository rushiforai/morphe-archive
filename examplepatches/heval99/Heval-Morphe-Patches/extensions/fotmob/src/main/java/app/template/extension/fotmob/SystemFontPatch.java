package app.template.extension.fotmob;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.os.Build;
import android.util.Log;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Use system font" for FotMob: maps the generic sans-serif families the app asks for to the
 * device's own UI font, the one Theme.DeviceDefault text uses (Google Sans Text on Pixels, the
 * selected font-overlay family elsewhere). Android exposes it as the framework strings
 * config_bodyFontFamily / config_bodyFontFamilyMedium; plain "sans-serif" stays Roboto on such
 * devices, which looks almost the same as FotMob's own Roboto Flex.
 *
 * When the device has no separate UI font (config_bodyFontFamily is missing or "sans-serif"),
 * every call returns exactly what the original call would have returned.
 *
 * A Patch settings switch (fotmob.use_system_font, restart required): while it is off every call
 * here answers what the stock code got, and the system font theme overlay is not applied.
 */
@SuppressWarnings("unused")
public final class SystemFontPatch {
    static final String FEATURE = "fotmob.use_system_font";

    /** The theme overlay the resource patch adds: the font attributes set to system families. */
    private static final String THEME_OVERLAY = "HevalSystemFontOverlay";

    private static final String SANS_SERIF = "sans-serif";

    private static volatile boolean resolved;
    private static String body;
    private static String bodyMedium;
    private static volatile int overlayId = -1;

    private SystemFontPatch() {
    }

    /** Whether the feature is on (stock when the settings engine answers off or fails). */
    public static boolean isEnabled() {
        try {
            return HevalSettings.isEnabled(FEATURE);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Replaces Typeface.create(String, int) everywhere in the app. */
    public static Typeface create(String family, int style) {
        try {
            if (isEnabled()) {
                Typeface mapped = map(family, style);
                if (mapped != null) return mapped;
            }
        } catch (Throwable ignored) {
            // Fall through to the original call.
        }
        return Typeface.create(family, style);
    }

    /**
     * XML Views: applies the system font theme overlay (the API 26+ theme's font attributes and the
     * switch style pointed at the system families, like FotMob's own Burmese theme) to the
     * activity's theme. Called from ActivityHooks.onActivityCreated, inside super.onCreate and
     * before the content view is inflated.
     */
    static void applyTheme(Activity activity) {
        try {
            if (!isEnabled()) return;
            int id = overlayId;
            if (id == -1) {
                id = activity.getResources().getIdentifier(THEME_OVERLAY, "style", activity.getPackageName());
                overlayId = id;
            }
            if (id != 0) activity.getTheme().applyStyle(id, true);
        } catch (Throwable failure) {
            Log.w("Morphe-FotMob", "System font theme not applied: " + failure.getClass().getName());
        }
    }

    /**
     * Compose: the platform typeface factory gets the generic family name (null for
     * FontFamily.Default). Default becomes "sans-serif" when the device has its own UI font, so
     * the factory's Typeface.create(String, int) call (redirected to {@link #create}) picks the
     * device font and the factory still applies the requested weight and italic on top.
     */
    public static String composeFamily(String family) {
        try {
            if ((family == null || family.isEmpty()) && isEnabled() && deviceFont() != null) return SANS_SERIF;
        } catch (Throwable ignored) {
            // Keep the original family.
        }
        return family;
    }

    private static Typeface map(String family, int style) {
        String device = deviceFont();
        if (device == null) return null;
        if (family == null || family.isEmpty() || family.equals(SANS_SERIF)) {
            return Typeface.create(device, style);
        }
        if (family.equals("sans-serif-medium")) {
            if (bodyMedium != null) return Typeface.create(bodyMedium, style);
            return weighted(device, 500, style);
        }
        if (family.equals("sans-serif-black")) return weighted(device, 900, style);
        return null;
    }

    private static Typeface weighted(String device, int weight, int style) {
        if (Build.VERSION.SDK_INT < 28) return Typeface.create(device, style);
        boolean bold = (style & Typeface.BOLD) != 0;
        boolean italic = (style & Typeface.ITALIC) != 0;
        return Typeface.create(Typeface.create(device, Typeface.NORMAL), bold ? Math.min(1000, weight + 300) : weight, italic);
    }

    /** The device UI font family, or null when it is the plain sans-serif family. */
    private static String deviceFont() {
        if (!resolved) resolve();
        return body;
    }

    private static synchronized void resolve() {
        if (resolved) return;
        // The application's resources include the framework overlays that set the device font;
        // Resources.getSystem() only sees the overlays baked in at boot.
        Resources resources = null;
        boolean final_ = false;
        try {
            Object app = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            if (app != null) {
                resources = ((android.content.Context) app).getResources();
                final_ = true;
            }
        } catch (Throwable ignored) {
            // The reflection itself is unavailable, so asking again would fail the same way:
            // settle for the system resources below once instead of retrying on every call.
            final_ = true;
        }
        if (resources == null) resources = Resources.getSystem();
        String b = string(resources, "config_bodyFontFamily");
        String m = string(resources, "config_bodyFontFamilyMedium");
        body = b == null || b.isEmpty() || b.equals(SANS_SERIF) ? null : b;
        bodyMedium = body == null || m == null || m.isEmpty() || m.equals("sans-serif-medium") ? null : m;
        // Before the Application exists (currentApplication() returned null) only the system
        // resources answer; ask again later.
        resolved = final_;
    }

    private static String string(Resources resources, String name) {
        try {
            int id = resources.getIdentifier(name, "string", "android");
            return id == 0 ? null : resources.getString(id);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
