package app.southstar21.extension.instagram.settings;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** A titled group of settings on a patch's page, e.g. "Appearance". */
public final class SettingsGroup {
    /** Section header, or null for none. */
    public final String title;
    /** Small print under the group, or null. */
    public final String footer;
    public final List<Setting> settings;

    public SettingsGroup(String title, String footer, Setting... settings) {
        this.title = title;
        this.footer = footer;
        this.settings = Collections.unmodifiableList(Arrays.asList(settings));
    }

    public SettingsGroup(String title, Setting... settings) {
        this(title, null, settings);
    }
}
