package app.template.extension.timemark;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Saved state for the Timemark patch settings, in the host app's private
 * SharedPreferences. Mirrors the setting set of hxreborn's BeReal patch
 * (CUSTOM_LOCATION / LOCATION_LATITUDE / LOCATION_LONGITUDE / LOCATION_LABEL);
 * the storage here is a plain SharedPreferences wrapper instead of the Morphe
 * extension library's setting types, which this bundle's extension module does
 * not carry. Empty latitude/longitude means "no location picked".
 */
public final class PatchSettings {

    private static final String PREFS_NAME = "morphe_timemark_patches";

    static final String KEY_CUSTOM_LOCATION = "timemark_custom_location";
    static final String KEY_LATITUDE = "timemark_location_latitude";
    static final String KEY_LONGITUDE = "timemark_location_longitude";
    static final String KEY_LABEL = "timemark_location_label";

    private PatchSettings() {
    }

    private static SharedPreferences prefs() {
        final Context context = PatchContext.context();
        return context == null ? null : context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    public static boolean customLocation() {
        final SharedPreferences prefs = prefs();
        return prefs != null && prefs.getBoolean(KEY_CUSTOM_LOCATION, false);
    }

    public static String latitude() {
        final SharedPreferences prefs = prefs();
        return prefs == null ? "" : prefs.getString(KEY_LATITUDE, "");
    }

    public static String longitude() {
        final SharedPreferences prefs = prefs();
        return prefs == null ? "" : prefs.getString(KEY_LONGITUDE, "");
    }

    public static String label() {
        final SharedPreferences prefs = prefs();
        return prefs == null ? "" : prefs.getString(KEY_LABEL, "");
    }

    static void setCustomLocation(boolean enabled) {
        final SharedPreferences prefs = prefs();
        if (prefs != null) {
            prefs.edit().putBoolean(KEY_CUSTOM_LOCATION, enabled).apply();
        }
    }

    static void saveCoordinates(String latitude, String longitude, String label) {
        final SharedPreferences prefs = prefs();
        if (prefs != null) {
            prefs.edit()
                    .putString(KEY_LATITUDE, latitude)
                    .putString(KEY_LONGITUDE, longitude)
                    .putString(KEY_LABEL, label)
                    .apply();
        }
    }

    static void clearLocation() {
        final SharedPreferences prefs = prefs();
        if (prefs != null) {
            prefs.edit()
                    .remove(KEY_LATITUDE)
                    .remove(KEY_LONGITUDE)
                    .remove(KEY_LABEL)
                    .putBoolean(KEY_CUSTOM_LOCATION, false)
                    .apply();
        }
    }
}
