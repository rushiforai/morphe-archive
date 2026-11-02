package app.spicetify.extension.spotify.theme;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Built-in themes, as role colors. */
public final class ThemePresets {
    public static final String STOCK = "stock";
    public static final String OLED = "oled";
    public static final String MATERIAL_YOU = "material_you";
    public static final String MATERIAL_YOU_BLACK = "material_you_black";

    /** A built-in theme: the kind ThemeState saves for it, and its name. */
    public static final class Preset {
        public final String kind;
        public final String name;
        /** Background, surface and accent, which become the main, card and button roles; empty when computed. */
        final int[] colors;

        Preset(String kind, String name, int... colors) {
            this.kind = kind;
            this.name = name;
            this.colors = colors;
        }
    }

    /** In the order settings lists them. The Material You themes need Android 12. */
    public static final List<Preset> ALL = Collections.unmodifiableList(Arrays.asList(
            new Preset(STOCK, "Spotify"),
            new Preset(OLED, "OLED"),
            new Preset("midnight", "Midnight", 0xFF0B1026, 0xFF1C2340, 0xFF509BF5),
            new Preset("catppuccin", "Catppuccin Mocha", 0xFF1E1E2E, 0xFF313244, 0xFFCBA6F7),
            new Preset("dracula", "Dracula", 0xFF282A36, 0xFF44475A, 0xFFBD93F9),
            new Preset("nord", "Nord", 0xFF2E3440, 0xFF3B4252, 0xFF88C0D0),
            new Preset("rose-pine", "Rosé Pine", 0xFF191724, 0xFF26233A, 0xFFEBBCBA),
            new Preset("sunset", "Sunset", 0xFF1A1016, 0xFF2E1B24, 0xFFFF6437),
            new Preset(MATERIAL_YOU, "Material You"),
            new Preset(MATERIAL_YOU_BLACK, "Material You, black background")));

    private ThemePresets() {}

    /** A built-in theme's role colors; none for Spotify's own colors and for kinds this version doesn't know. */
    static Map<String, Integer> colors(Context context, String kind) {
        switch (kind) {
            case OLED:
                // A black background, with the surfaces above it derived the same way as for any scheme.
                return roles(0xFF000000, null, null);
            case MATERIAL_YOU:
                return materialYou(context, false);
            case MATERIAL_YOU_BLACK:
                return materialYou(context, true);
            default:
                for (Preset preset : ALL) {
                    if (preset.kind.equals(kind) && preset.colors.length == 3) {
                        return roles(preset.colors[0], preset.colors[1], preset.colors[2]);
                    }
                }
                return Collections.emptyMap();
        }
    }

    /**
     * A background, surface and accent as the main, card and button roles, with the roles derived from
     * them. A null keeps Spotify's color for that part.
     */
    static Map<String, Integer> roles(Integer background, Integer surface, Integer accent) {
        Map<String, Integer> scheme = new LinkedHashMap<>();
        if (background != null) scheme.put("main", background);
        if (surface != null) scheme.put("card", surface);
        if (accent != null) scheme.put("button", accent);
        return ThemeResolver.resolve(scheme, "button").colors;
    }

    /** Android 12 tonal palettes, following the Material 3 dark scheme. Black keeps the background black. */
    @TargetApi(Build.VERSION_CODES.S)
    static Map<String, Integer> materialYou(Context context, boolean black) {
        Map<String, Integer> roles = new LinkedHashMap<>();
        if (black) {
            roles.put("main", 0xFF000000);
            roles.put("main-elevated", context.getColor(android.R.color.system_neutral1_900));
            roles.put("card", context.getColor(android.R.color.system_neutral1_900));
            roles.put("highlight", context.getColor(android.R.color.system_neutral1_900));
            roles.put("highlight-elevated", context.getColor(android.R.color.system_neutral1_800));
        } else {
            roles.put("main", context.getColor(android.R.color.system_neutral1_900));
            roles.put("main-elevated", context.getColor(android.R.color.system_neutral1_800));
            roles.put("card", context.getColor(android.R.color.system_neutral2_800));
            roles.put("highlight", context.getColor(android.R.color.system_neutral1_800));
            roles.put("highlight-elevated", context.getColor(android.R.color.system_neutral1_700));
        }
        roles.put("text", context.getColor(android.R.color.system_neutral1_50));
        roles.put("subtext", context.getColor(android.R.color.system_neutral2_200));
        roles.put("button", context.getColor(android.R.color.system_accent1_200));
        roles.put("button-active", context.getColor(android.R.color.system_accent1_300));
        roles.put("on-button", context.getColor(android.R.color.system_accent1_800));
        roles.put("button-disabled", context.getColor(android.R.color.system_neutral2_600));
        roles.put("tab-active", context.getColor(android.R.color.system_accent2_700));
        roles.put("notification", context.getColor(android.R.color.system_accent3_300));
        return roles;
    }
}
