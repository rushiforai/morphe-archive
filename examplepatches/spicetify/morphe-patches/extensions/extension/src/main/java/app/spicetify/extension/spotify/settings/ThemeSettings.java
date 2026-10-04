package app.spicetify.extension.spotify.settings;

import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import app.spicetify.extension.spotify.theme.SpicetifyTheme;
import app.spicetify.extension.spotify.theme.ThemeBackground;
import app.spicetify.extension.spotify.theme.ThemeException;
import app.spicetify.extension.spotify.theme.ThemePresets;
import app.spicetify.extension.spotify.theme.ThemeResolver;
import app.spicetify.extension.spotify.theme.ThemeRuntime;
import app.spicetify.extension.spotify.theme.ThemeState;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * The Appearance page: a list of themes, the Spicetify Marketplace, a theme pasted from desktop
 * Spicetify, and individually picked colors as the custom option. While a theme draws an image behind
 * Spotify, its blur switch.
 */
final class ThemeSettings {
    private static final Pattern HEX = Pattern.compile("#?([0-9a-fA-F]{6}|[0-9a-fA-F]{8})");
    static final int[] BACKGROUNDS = {0xFF000000, 0xFF121212, 0xFF0B1026, 0xFF1E1E2E, 0xFF282A36, 0xFF2E3440};
    static final int[] SURFACES = {0xFF121212, 0xFF282828, 0xFF1C2340, 0xFF313244, 0xFF44475A, 0xFF3B4252};
    static final int[] ACCENTS = {0xFF1ED760, 0xFF509BF5, 0xFFF573A0, 0xFFFF6437, 0xFFF59B23, 0xFFCBA6F7};
    /** Spotify's own background, surface and accent, shown where a theme keeps them. */
    private static final int[] SPOTIFY = {0xFF121212, 0xFF282828, 0xFF1ED760};

    private ThemeSettings() {}

    static void build(SpicetifySettingsScreen activity, LinearLayout content) {
        if (!ThemeRuntime.supported()) {
            content.addView(intro(activity, "Themes need Android 11 or later. On this Android version, Spotify keeps its own colors."));
            return;
        }
        content.addView(intro(activity, "A theme applies fully after Spotify restarts. "
                + "Some screens and hardcoded colors keep Spotify's own colors."));

        ThemeState.Selection current = ThemeState.load(activity);
        for (ThemePresets.Preset preset : ThemePresets.ALL) {
            boolean materialYou = ThemePresets.MATERIAL_YOU.equals(preset.kind) || ThemePresets.MATERIAL_YOU_BLACK.equals(preset.kind);
            if (materialYou && Build.VERSION.SDK_INT < Build.VERSION_CODES.S) continue;
            ThemeState.Selection theme = ThemeState.Selection.preset(preset.kind, preset.name);
            boolean selected = preset.kind.equals(current.kind);
            SpotifyStyle.themeRow(content, preset.name, null, colors(activity, theme), selected, view -> {
                if (!selected) save(activity, content, preset.name, theme);
            });
        }
        if (ThemeState.SCHEME.equals(current.kind)) {
            // A Marketplace or pasted theme is listed while it's in use; choosing another theme replaces it.
            SpotifyStyle.themeRow(content, current.label, null, colors(activity, current), true, view -> {});
            List<String> warnings = ThemeResolver.warnings(current.colors);
            if (!warnings.isEmpty()) content.addView(intro(activity, TextUtils.join(" ", warnings)));
        }
        if (ThemeBackground.hasImage(activity)) {
            SpotifyStyle.toggleRow(content, "Blur background image", "Blur the theme's image behind Spotify's pages.",
                    ThemeBackground.blurEnabled(activity), (button, enabled) -> {
                        ThemeBackground.setBlur(activity, enabled);
                        // Spotify draws the image when its screen is created.
                        PatchSettings.markRestartRequired();
                        activity.refreshRestartBar();
                    });
        }
        SpotifyStyle.actionRow(content, "Spicetify Marketplace", "Browse community themes and use their colors",
                view -> activity.openPage(SpicetifySettingsScreen.PAGE_MARKETPLACE));
        SpotifyStyle.actionRow(content, "Paste a Spicetify theme", "Use a color.ini, or CSS with --spice-* colors",
                view -> paste(activity, content));
        boolean custom = ThemeState.CUSTOM.equals(current.kind);
        // Custom starts from the colors of the theme in use.
        int[] colors = colors(activity, current);
        SpotifyStyle.themeRow(content, "Custom", "Pick each color yourself", colors, custom, view -> {
            if (!custom) save(activity, content, "your colors", custom(colors[0], colors[1], colors[2]));
        });
        if (!custom) return;

        SpotifyStyle.sectionTitle(content, "Custom colors", true).setPadding(SpotifyStyle.dp(activity, 16),
                SpotifyStyle.dp(activity, 24), SpotifyStyle.dp(activity, 16), SpotifyStyle.dp(activity, 8));
        SpotifyStyle.colorRow(content, "Background", colors[0],
                view -> pick(activity, "Background color", colors[0], BACKGROUNDS,
                        color -> save(activity, content, "your colors", custom(color, colors[1], colors[2]))));
        SpotifyStyle.colorRow(content, "Surface", colors[1],
                view -> pick(activity, "Surface color", colors[1], SURFACES,
                        color -> save(activity, content, "your colors", custom(colors[0], color, colors[2]))));
        SpotifyStyle.colorRow(content, "Accent", colors[2],
                view -> pick(activity, "Accent color", colors[2], ACCENTS,
                        color -> save(activity, content, "your colors", custom(colors[0], colors[1], color))));
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

    private static TextView intro(Context context, String text) {
        TextView intro = SpotifyStyle.body(context, text);
        intro.setPadding(SpotifyStyle.dp(context, 16), SpotifyStyle.dp(context, 16), SpotifyStyle.dp(context, 16), SpotifyStyle.dp(context, 8));
        return intro;
    }

    /** A theme's background, surface and accent: its main, card and button roles, or Spotify's own. */
    static int[] colors(Context context, ThemeState.Selection theme) {
        Map<String, Integer> roles = ThemeRuntime.roleColors(context, theme);
        String[] names = {"main", "card", "button"};
        int[] colors = new int[names.length];
        for (int i = 0; i < names.length; i++) {
            Integer color = roles.get(names[i]);
            colors[i] = color == null ? SPOTIFY[i] : color;
        }
        return colors;
    }

    private static ThemeState.Selection custom(int background, int surface, int accent) {
        Map<String, Integer> colors = new LinkedHashMap<>();
        colors.put("main", background);
        colors.put("card", surface);
        colors.put("button", accent);
        return new ThemeState.Selection(ThemeState.CUSTOM, "Custom", colors);
    }

    private static void pick(SpicetifySettingsScreen activity, String title, int current, int[] presets, Choice choice) {
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

    /**
     * Pastes a desktop Spicetify theme: a color.ini, whose schemes are offered when there's more than
     * one, or CSS with --spice-* colors. An accent key, such as Catppuccin's mauve, replaces the button color.
     */
    private static void paste(SpicetifySettingsScreen activity, LinearLayout content) {
        LinearLayout body = SpotifyStyle.column(activity);
        EditText text = new EditText(activity);
        text.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        text.setHint("Paste a color.ini, or CSS with --spice-* colors");
        SpotifyStyle.style(text);
        text.setTypeface(SpotifyStyle.font(activity, SpotifyStyle.Font.REGULAR));
        text.setGravity(Gravity.TOP | Gravity.START);
        int padding = SpotifyStyle.dp(activity, 12);
        text.setPadding(padding, padding, padding, padding);
        // A long file scrolls inside the field, and many schemes sideways, so the accent field stays close.
        text.setMinLines(4);
        text.setMaxLines(6);
        body.addView(text);

        LinearLayout picker = SpotifyStyle.column(activity);
        picker.setVisibility(View.GONE);
        label(picker, "Color scheme");
        RadioGroup schemes = new RadioGroup(activity);
        schemes.setOrientation(LinearLayout.HORIZONTAL);
        HorizontalScrollView row = new HorizontalScrollView(activity);
        row.addView(schemes);
        picker.addView(row);
        body.addView(picker);

        EditText accent = new EditText(activity);
        accent.setId(View.generateViewId());
        label(body, "Accent key (optional)").setLabelFor(accent.getId());
        accent.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        accent.setSingleLine(true);
        accent.setHint("For example mauve");
        SpotifyStyle.style(accent);
        accent.setTypeface(SpotifyStyle.font(activity, SpotifyStyle.Font.REGULAR));
        body.addView(accent);

        text.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence value, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence value, int start, int before, int count) {
                text.setError(null);
                listSchemes(value.toString(), picker, schemes);
            }
            @Override public void afterTextChanged(Editable value) {}
        });

        // Like the sheet's choices list, the fields scroll. They take the height the title and buttons
        // leave, so Apply stays on the sheet on a short screen or at a large font size.
        ScrollView fields = new ScrollView(activity);
        fields.addView(body);
        SpotifySheet sheet = new SpotifySheet(activity, "Paste a Spicetify theme", null)
                .view(fields)
                .primary("Apply", () -> applyPasted(activity, content, text, schemes, accent))
                .secondary("Cancel");
        LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) fields.getLayoutParams();
        params.height = 0;
        params.weight = 1;
        sheet.create();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            // The sheet sits above the keyboard rather than under it, so Apply stays reachable while typing.
            WindowManager.LayoutParams attributes = sheet.getWindow().getAttributes();
            attributes.setFitInsetsTypes(WindowInsets.Type.ime() | WindowInsets.Type.statusBars());
            sheet.getWindow().setAttributes(attributes);
        }
        sheet.show();
    }

    /** Lists a pasted file's schemes when it has more than one, keeping the one chosen. */
    private static void listSchemes(String text, View picker, RadioGroup schemes) {
        String chosen = chosen(schemes);
        schemes.removeAllViews();
        List<SpicetifyTheme.Scheme> parsed;
        try {
            parsed = SpicetifyTheme.parse(text);
        } catch (ThemeException invalid) {
            parsed = Collections.emptyList();
        }
        picker.setVisibility(parsed.size() > 1 ? View.VISIBLE : View.GONE);
        if (parsed.size() < 2) return;
        RadioButton checked = null;
        for (SpicetifyTheme.Scheme scheme : parsed) {
            RadioButton radio = new RadioButton(schemes.getContext());
            radio.setId(View.generateViewId());
            radio.setText(scheme.name);
            SpotifyStyle.style(radio);
            schemes.addView(radio);
            // Desktop Spicetify takes the first scheme unless one is chosen.
            if (checked == null || scheme.name.equals(chosen)) checked = radio;
        }
        schemes.check(checked.getId());
    }

    /** The scheme chosen in the list, or null when there's no list. */
    private static String chosen(RadioGroup schemes) {
        RadioButton checked = schemes.findViewById(schemes.getCheckedRadioButtonId());
        return checked == null ? null : checked.getText().toString();
    }

    /** Applies the chosen scheme of the pasted file. A problem shows on its field and keeps the sheet open. */
    private static boolean applyPasted(SpicetifySettingsScreen activity, LinearLayout content, EditText text,
            RadioGroup schemes, EditText accent) {
        text.setError(null);
        accent.setError(null);
        List<SpicetifyTheme.Scheme> parsed;
        try {
            parsed = SpicetifyTheme.parse(text.getText().toString());
        } catch (ThemeException invalid) {
            return problem(text, invalid.getMessage());
        }
        SpicetifyTheme.Scheme scheme = parsed.get(0);
        String chosen = chosen(schemes);
        for (SpicetifyTheme.Scheme each : parsed) if (each.name.equals(chosen)) scheme = each;
        String key = accent.getText().toString().trim().toLowerCase(Locale.ROOT);
        Map<String, Integer> colors;
        try {
            colors = ThemeResolver.resolve(scheme.colors, key.isEmpty() ? "button" : key).colors;
        } catch (ThemeException missing) {
            return problem(accent, missing.getMessage());
        }
        String name = "Pasted theme (" + scheme.name + ")";
        if (colors.isEmpty()) return problem(text, name + " has no colors Spotify can use.");
        save(activity, content, "the pasted theme", new ThemeState.Selection(ThemeState.SCHEME, name, colors));
        return true;
    }

    /** Shows a problem on its field, focused, since Android shows the message only then. Keeps the sheet open. */
    private static boolean problem(EditText field, String message) {
        field.requestFocus();
        field.setError(message);
        return false;
    }

    /** A field label, as on the server files page. */
    private static TextView label(LinearLayout parent, String name) {
        Context context = parent.getContext();
        TextView label = SpotifyStyle.text(context, name, 14, Color.WHITE, SpotifyStyle.Font.BOLD);
        label.setPadding(0, SpotifyStyle.dp(context, 16), 0, SpotifyStyle.dp(context, 8));
        parent.addView(label);
        return label;
    }

    /**
     * Applies and saves a theme, with the image it draws behind Spotify, or none. Spotify's views and
     * Compose screens built from then on take it, and colors some screens read once take it after a
     * restart, so a restart is offered. Returns false, after saying so, when Spotify can't load the
     * theme's colors.
     */
    static boolean apply(SpicetifySettingsScreen activity, String name, ThemeState.Selection theme, byte[] image) {
        if (!ThemeRuntime.select(activity, theme, image)) {
            new SpotifySheet(activity, "Colors not applied",
                    "Spotify could not load the new colors, so the theme is unchanged.")
                    .primary("OK", () -> true).show();
            return false;
        }
        PatchSettings.markRestartRequired();
        activity.refreshRestartBar();
        SpotifyRestart.prompt(activity, "Restart Spotify to finish applying " + name + "?");
        return true;
    }

    /** Applies a theme chosen on this page, then lists it as the theme in use. */
    private static void save(SpicetifySettingsScreen activity, LinearLayout content, String name, ThemeState.Selection theme) {
        if (!apply(activity, name, theme, null)) return;
        content.removeAllViews();
        build(activity, content);
    }
}
