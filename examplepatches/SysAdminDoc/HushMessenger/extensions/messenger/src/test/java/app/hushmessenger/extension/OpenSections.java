package app.hushmessenger.extension;

import java.util.LinkedHashSet;
import java.util.Set;
import org.robolectric.RuntimeEnvironment;

/** Settings sections start closed; a test that reads rows inside them opens them first, the way a person taps the headers. */
final class OpenSections {
    static final String[] APP = {"quick_access", "quick_setups", "appearance", "about", "choices", "usage"};

    private OpenSections() { }

    /** Every Controls and App section, opened before the screen is built. */
    static void all() {
        Set<String> ids = new LinkedHashSet<>();
        for (String[] spec : SettingsActivity.CONTROLS) ids.add(spec[3]);
        ids.addAll(java.util.List.of(APP));
        only(ids.toArray(new String[0]));
    }

    static void only(String... ids) {
        RuntimeEnvironment.getApplication().getSharedPreferences(SettingsActivity.SECTIONS_STORE, 0).edit()
            .putString(SettingsActivity.OPEN_SECTIONS, String.join(",", ids)).commit();
    }
}
