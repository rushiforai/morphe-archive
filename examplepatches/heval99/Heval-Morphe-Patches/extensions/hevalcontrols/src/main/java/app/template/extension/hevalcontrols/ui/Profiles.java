package app.template.extension.hevalcontrols.ui;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * The user's saved Patch settings profiles: a name and the settings text of
 * {@link app.template.extension.hevalcontrols.SettingsTransfer} per profile, in the private
 * SharedPreferences file {@code heval_profiles} (so a reset of the settings never removes them).
 * At most {@value #MAX_PROFILES} profiles; a name is 1 to {@value #MAX_NAME} characters without a
 * line break. Nothing here throws.
 */
final class Profiles {
    static final String FILE_NAME = "heval_profiles";
    static final int MAX_PROFILES = 20;
    static final int MAX_NAME = 40;

    private final SharedPreferences preferences;

    Profiles(Context context) {
        this.preferences = context.getSharedPreferences(FILE_NAME, Context.MODE_PRIVATE);
    }

    /** The cleaned name, or null when it is empty or too long. */
    static String cleanName(String name) {
        if (name == null) return null;
        String clean = name.replace('\n', ' ').replace('\r', ' ').replace('\t', ' ').trim();
        return clean.isEmpty() || clean.length() > MAX_NAME ? null : clean;
    }

    /** Profile names, alphabetical (case-insensitive). */
    List<String> names() {
        try {
            List<String> names = new ArrayList<>();
            for (Map.Entry<String, ?> entry : preferences.getAll().entrySet()) {
                if (entry.getValue() instanceof String) names.add(entry.getKey());
            }
            Collections.sort(names, String.CASE_INSENSITIVE_ORDER);
            return names;
        } catch (Throwable failure) {
            return new ArrayList<>();
        }
    }

    /** The saved settings text of {@code name}, or null. */
    String get(String name) {
        try {
            return preferences.getString(name, null);
        } catch (Throwable failure) {
            return null;
        }
    }

    /** Saves {@code text} under {@code name} (replacing a profile of that name). False when full or on error. */
    boolean save(String name, String text) {
        String clean = cleanName(name);
        if (clean == null || text == null) return false;
        try {
            if (preferences.getString(clean, null) == null && names().size() >= MAX_PROFILES) return false;
            return preferences.edit().putString(clean, text).commit();
        } catch (Throwable failure) {
            return false;
        }
    }

    boolean delete(String name) {
        try {
            return preferences.edit().remove(name).commit();
        } catch (Throwable failure) {
            return false;
        }
    }
}
