package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import app.spicetify.extension.spotify.theme.ThemeOverlay;
import java.util.List;
import java.util.regex.Pattern;

/** The Appearance page: a list of themes, with individually picked colors as the custom option. */
final class ThemeSettings {
    private static final Pattern HEX = Pattern.compile("#?([0-9a-fA-F]{6}|[0-9a-fA-F]{8})");
    static final String CUSTOM = "custom";
    static final int[] BACKGROUNDS = {0xFF000000, 0xFF121212, 0xFF0B1026, 0xFF1E1E2E, 0xFF282A36, 0xFF2E3440};
    static final int[] SURFACES = {0xFF121212, 0xFF282828, 0xFF1C2340, 0xFF313244, 0xFF44475A, 0xFF3B4252};
    static final int[] ACCENTS = {0xFF1ED760, 0xFF509BF5, 0xFFF573A0, 0xFFFF6437, 0xFFF59B23, 0xFFCBA6F7};

    /** A named set of background, surface and accent colors; the Spotify theme stores no colors. */
    static final class Theme {
        final String key;
        final String name;
        final int background;
        final int surface;
        final int accent;

        Theme(String key, String name, int background, int surface, int accent) {
            this.key = key;
            this.name = name;
            this.background = background;
            this.surface = surface;
            this.accent = accent;
        }
    }

    static final Theme SPOTIFY = new Theme(null, "Spotify", 0xFF121212, 0xFF282828, 0xFF1ED760);
    static final List<Theme> THEMES = List.of(
            SPOTIFY,
            new Theme("oled", "OLED", 0xFF000000, 0xFF121212, 0xFF1ED760),
            new Theme("midnight", "Midnight", 0xFF0B1026, 0xFF1C2340, 0xFF509BF5),
            new Theme("catppuccin", "Catppuccin Mocha", 0xFF1E1E2E, 0xFF313244, 0xFFCBA6F7),
            new Theme("dracula", "Dracula", 0xFF282A36, 0xFF44475A, 0xFFBD93F9),
            new Theme("nord", "Nord", 0xFF2E3440, 0xFF3B4252, 0xFF88C0D0),
            new Theme("rose-pine", "Ros\u00e9 Pine", 0xFF191724, 0xFF26233A, 0xFFEBBCBA),
            new Theme("sunset", "Sunset", 0xFF1A1016, 0xFF2E1B24, 0xFFFF6437));

    private ThemeSettings() {}

    static void build(SpicetifySettingsActivity activity, LinearLayout content) {
        String scope = ThemeOverlay.active() ? "" : " On this Android version, fewer screens change.";
        TextView intro = SpotifyStyle.body(activity, "Restart Spotify to apply a theme. "
                + "Some screens and hardcoded colors keep Spotify's own colors." + scope);
        intro.setPadding(SpotifyStyle.dp(activity, 16), SpotifyStyle.dp(activity, 16), SpotifyStyle.dp(activity, 16), SpotifyStyle.dp(activity, 8));
        content.addView(intro);

        String preset = PatchSettings.themePreset();
        for (Theme theme : THEMES) {
            boolean selected = theme.key == null ? preset == null : theme.key.equals(preset);
            SpotifyStyle.themeRow(content, theme.name, null, new int[] {theme.background, theme.surface, theme.accent}, selected,
                    view -> save(activity, content, theme.name, theme.key, theme.key == null ? null : theme.background,
                            theme.key == null ? null : theme.surface, theme.key == null ? null : theme.accent));
        }
        boolean custom = CUSTOM.equals(preset);
        SpotifyStyle.themeRow(content, "Custom", "Pick each color yourself",
                new int[] {ThemeOverlay.background(), ThemeOverlay.surface(), ThemeOverlay.accent()}, custom,
                view -> {
                    if (!custom) save(activity, content, "your colors", CUSTOM, ThemeOverlay.background(), ThemeOverlay.surface(), ThemeOverlay.accent());
                });
        if (!custom) return;

        SpotifyStyle.sectionTitle(content, "Custom colors", true).setPadding(SpotifyStyle.dp(activity, 16),
                SpotifyStyle.dp(activity, 24), SpotifyStyle.dp(activity, 16), SpotifyStyle.dp(activity, 8));
        SpotifyStyle.colorRow(content, "Background", ThemeOverlay.background(),
                view -> pick(activity, "Background color", ThemeOverlay.background(), BACKGROUNDS,
                        color -> save(activity, content, "your colors", CUSTOM, color, PatchSettings.themeSurface(), PatchSettings.themeAccent())));
        SpotifyStyle.colorRow(content, "Surface", ThemeOverlay.surface(),
                view -> pick(activity, "Surface color", ThemeOverlay.surface(), SURFACES,
                        color -> save(activity, content, "your colors", CUSTOM, PatchSettings.themeBackground(), color, PatchSettings.themeAccent())));
        SpotifyStyle.colorRow(content, "Accent", ThemeOverlay.accent(),
                view -> pick(activity, "Accent color", ThemeOverlay.accent(), ACCENTS,
                        color -> save(activity, content, "your colors", CUSTOM, PatchSettings.themeBackground(), PatchSettings.themeSurface(), color)));
    }

    interface Choice {
        void chosen(int color);
    }

    static Integer parse(String value) {
        String trimmed = value.trim();
        if (!HEX.matcher(trimmed).matches()) return null;
        String digits = trimmed.startsWith("#") ? trimmed.substring(1) : trimmed;
        long parsed = Long.parseLong(digits, 16);
        return digits.length() == 6 ? (int) (0xFF000000L | parsed) : (int) parsed;
    }

    private static void pick(SpicetifySettingsActivity activity, String title, int current, int[] presets, Choice choice) {
        EditText hex = new EditText(activity);
        hex.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS | InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS);
        hex.setSingleLine(true);
        hex.setText(SpotifyStyle.hex(current));
        hex.setHint("#RRGGBB");
        hex.setContentDescription("Hex color");
        SpotifyStyle.style(hex);
        hex.setTypeface(SpotifyStyle.font(activity, SpotifyStyle.Font.REGULAR));
        hex.setGravity(Gravity.CENTER);

        LinearLayout swatches = new LinearLayout(activity);
        swatches.setOrientation(LinearLayout.HORIZONTAL);
        swatches.setGravity(Gravity.CENTER);
        View[] views = new View[presets.length];
        for (int i = 0; i < presets.length; i++) {
            int color = presets[i];
            View swatch = new View(activity);
            swatch.setContentDescription(SpotifyStyle.hex(color));
            swatch.setOnClickListener(view -> hex.setText(SpotifyStyle.hex(color)));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(SpotifyStyle.dp(activity, 40), SpotifyStyle.dp(activity, 40));
            params.setMargins(SpotifyStyle.dp(activity, 6), 0, SpotifyStyle.dp(activity, 6), 0);
            swatches.addView(swatch, params);
            views[i] = swatch;
        }
        Runnable highlight = () -> {
            Integer typed = parse(hex.getText().toString());
            for (int i = 0; i < presets.length; i++) {
                views[i].setBackground(SpotifyStyle.swatch(activity, presets[i], typed != null && typed == presets[i]));
            }
        };
        highlight.run();
        hex.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) { hex.setError(null); highlight.run(); }
            @Override public void afterTextChanged(Editable text) {}
        });

        LinearLayout body = SpotifyStyle.column(activity);
        body.addView(swatches);
        LinearLayout.LayoutParams fieldParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        fieldParams.topMargin = SpotifyStyle.dp(activity, 16);
        body.addView(hex, fieldParams);

        new SpotifySheet(activity, title, null)
                .view(body)
                .primary("Save", () -> {
                    Integer color = parse(hex.getText().toString());
                    if (color == null) {
                        hex.setError("Use #RRGGBB or #AARRGGBB.");
                        return false;
                    }
                    choice.chosen(color);
                    return true;
                })
                .secondary("Cancel")
                .show();
    }

    private static void save(SpicetifySettingsActivity activity, LinearLayout content, String name, String preset,
            Integer background, Integer surface, Integer accent) {
        PatchSettings.setTheme(preset, background, surface, accent);
        content.removeAllViews();
        build(activity, content);
        boolean applied = ThemeOverlay.refresh();
        activity.refreshRestartBar();
        if (!applied && ThemeOverlay.active()) {
            new SpotifySheet(activity, "Colors not applied",
                    "Spotify could not load the new colors. They are saved and will be tried again when Spotify restarts.")
                    .primary("OK", () -> true).show();
        } else if (PatchSettings.restartRequired()) {
            SpotifyRestart.prompt(activity, "Restart Spotify to apply " + name + "?");
        }
    }
}
