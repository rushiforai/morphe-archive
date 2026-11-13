package app.extendedplaylists.extension;

import static app.morphe.extension.shared.settings.Setting.parent;
import static java.lang.Boolean.TRUE;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * Settings shown in Morphe settings, Feed, Channel page. The preferences that edit them are declared
 * in the patches, in settings/morphe_addon_prefs.xml, with the same keys.
 */
final class Settings {
    private static final String KEY = "eyp_hidden_playlists";
    /**
     * Pages already loaded and lists already fetched keep the old value, so Morphe asks for a
     * restart when one of these changes.
     */
    private static final boolean REBOOT = true;

    static final BooleanSetting HIDDEN_PLAYLISTS = new BooleanSetting(KEY, TRUE, REBOOT);
    static final BooleanSetting ADD_TAB = new BooleanSetting(KEY + "_tab", TRUE, REBOOT, parent(HIDDEN_PLAYLISTS));
    /** Lists on by default: all videos, and all members-only uploads. */
    private static final List<String> ON_BY_DEFAULT = Arrays.asList("UULF", "UUMO");
    /** One switch per hidden list, by playlist id prefix: eyp_hidden_playlists_uulf. */
    private static final Map<String, BooleanSetting> LISTS = new HashMap<>();

    static {
        for (String[] family : InnerTube.FAMILIES) for (String prefix : family) {
            String key = KEY + "_" + prefix.toLowerCase(Locale.ROOT);
            Boolean on = ON_BY_DEFAULT.contains(prefix);
            LISTS.put(prefix, new BooleanSetting(key, on, REBOOT, parent(HIDDEN_PLAYLISTS)));
        }
    }

    static boolean shows(String prefix) {
        return LISTS.get(prefix).get();
    }

    private Settings() {}
}
