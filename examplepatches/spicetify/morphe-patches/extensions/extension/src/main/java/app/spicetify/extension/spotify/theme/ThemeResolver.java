package app.spicetify.extension.spotify.theme;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** Turns a Spicetify color scheme into Spotify color roles. Roles it leaves out keep Spotify's colors. */
public final class ThemeResolver {
    static final List<String> ROLES = Collections.unmodifiableList(Arrays.asList(
            "main", "main-elevated", "card", "highlight", "highlight-elevated", "text", "subtext",
            "button", "button-active", "on-button", "button-disabled", "selected-row", "tab-active",
            "notification", "notification-error", "shadow"));
    private static final int BLACK = 0xFF000000;
    private static final int WHITE = 0xFFFFFFFF;
    private static final int STOCK_MAIN = 0xFF121212;
    private static final int STOCK_SUBTEXT = 0xFFB3B3B3;

    public static final class Result {
        public final Map<String, Integer> colors;

        Result(Map<String, Integer> colors) {
            this.colors = Collections.unmodifiableMap(colors);
        }
    }

    private ThemeResolver() {}

    public static Result resolve(Map<String, Integer> scheme, String accentKey) {
        Map<String, Integer> roles = new LinkedHashMap<>();
        for (String role : ROLES) {
            if (role.equals("button") || role.equals("on-button")) continue;
            Integer color = scheme.get(role);
            if (color != null) roles.put(role, color);
        }
        Integer accent = scheme.get(accentKey);
        if (accent == null && !accentKey.equals("button")) {
            throw new ThemeException("Accent key \"" + accentKey + "\" is not in this color scheme.");
        }
        if (accent != null) roles.put("button", accent);

        Integer main = roles.get("main");
        if (main != null) {
            // Spotify's stock surfaces are #121212 mixed toward white by these amounts.
            int toward = roles.containsKey("text") ? roles.get("text") : WHITE;
            roles.putIfAbsent("main-elevated", ArgbColors.mix(main, toward, 0.06));
            roles.putIfAbsent("highlight", ArgbColors.mix(main, toward, 0.04));
            roles.putIfAbsent("highlight-elevated", ArgbColors.mix(main, toward, 0.10));
        }
        Integer button = roles.get("button");
        if (button != null) {
            Integer active = roles.get("button-active");
            // A custom accent key replaces the scheme's own pressed color, which belongs to the old accent.
            if (!accentKey.equals("button") || active == null || active.equals(button)) {
                roles.put("button-active", ArgbColors.mix(button, BLACK, 0.125));
            }
            roles.put("on-button", ArgbColors.contrast(button, BLACK) >= ArgbColors.contrast(button, WHITE) ? BLACK : WHITE);
        }
        return new Result(roles);
    }

    /**
     * The roles over a background image: main turns clear, as desktop Galaxy's page background does,
     * keeping an alpha of 1 so it's never Compose's Color.Transparent, and card keeps a quarter of its
     * color, so cards still show over the image. Called after {@link #resolve}, so roles derived from
     * main keep the opaque color.
     */
    static Map<String, Integer> seeThrough(Map<String, Integer> roles) {
        Map<String, Integer> clear = new LinkedHashMap<>(roles);
        clear.computeIfPresent("main", (role, color) -> color & 0x00FFFFFF | ComposeTheme.SEE_THROUGH);
        clear.computeIfPresent("card", (role, color) -> (color & 0x00FFFFFF) | 0x40000000);
        return clear;
    }

    /** Readability warnings for role colors, checked against Spotify's stock colors for roles they leave alone. */
    public static List<String> warnings(Map<String, Integer> roles) {
        int main = roles.getOrDefault("main", STOCK_MAIN);
        int text = roles.getOrDefault("text", WHITE);
        int subtext = roles.getOrDefault("subtext", STOCK_SUBTEXT);
        List<String> warnings = new ArrayList<>();
        double textContrast = ArgbColors.contrast(text, main);
        if (textContrast < 4.5) {
            warnings.add(String.format(Locale.ROOT, "Text on the background has a contrast of %.1f:1, below 4.5:1.", textContrast));
        }
        double subtextContrast = ArgbColors.contrast(subtext, main);
        if (subtextContrast < 3.0) {
            warnings.add(String.format(Locale.ROOT, "Secondary text on the background has a contrast of %.1f:1, below 3:1.", subtextContrast));
        }
        if (ArgbColors.luminance(main) > 0.4) {
            warnings.add("The background is light. Spotify draws some text in white, which will be hard to read.");
        }
        return warnings;
    }
}
