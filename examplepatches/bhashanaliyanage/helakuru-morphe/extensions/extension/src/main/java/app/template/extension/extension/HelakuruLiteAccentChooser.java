package app.template.extension.extension;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.preference.Preference;
import android.view.Gravity;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.List;

/** Wallpaper-backed swatches are resolved when displayed and when the IME opens. */
public final class HelakuruLiteAccentChooser {
    public static final String PREFERENCE_KEY = "morphe_frosted_accent";
    public static final String DEFAULT_ACCENT = "accent1_900";
    private static final String[] PALETTES = {"accent1", "accent2", "accent3", "neutral1", "neutral2"};
    private static final int[] SHADES = {0, 10, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000};

    private HelakuruLiteAccentChooser() { }

    public static Integer resolve(Context context, String selection) {
        if ("white".equals(selection)) return Color.WHITE;
        if ("black".equals(selection)) return Color.BLACK;
        for (String palette : PALETTES) {
            for (int shade : SHADES) {
                if (!(palette + "_" + shade).equals(selection)) continue;
                int id = context.getResources().getIdentifier("system_" + selection, "color", "android");
                if (id == 0) return null;
                try {
                    return context.getResources().getColor(id);
                } catch (RuntimeException ignored) {
                    return null;
                }
            }
        }
        return null;
    }

    public static String nameForSelection(String selection) {
        if ("theme".equals(selection)) return "Follow theme";
        if ("white".equals(selection)) return "White";
        if ("black".equals(selection)) return "Black";
        for (String palette : PALETTES) {
            if (selection != null && selection.startsWith(palette + "_")) {
                return paletteName(palette) + " / " + selection.substring(palette.length() + 1);
            }
        }
        return "Accent 1 / 900";
    }

    private static String paletteName(String palette) {
        return (palette.startsWith("accent") ? "Accent " : "Neutral ")
                + palette.charAt(palette.length() - 1);
    }

    public static void updateSummary(Preference preference, SharedPreferences preferences) {
        preference.setSummary(nameForSelection(preferences.getString(PREFERENCE_KEY, DEFAULT_ACCENT)));
    }

    public static void show(Context context, SharedPreferences preferences, Preference preference) {
        show(context, preferences, preference, PREFERENCE_KEY, DEFAULT_ACCENT, "Accent color", false);
    }

    public static void show(Context context, SharedPreferences preferences, Preference preference,
                            String preferenceKey, String defaultValue, String title,
                            boolean includeFollowTheme) {
        String[] selection = {preferences.getString(preferenceKey, defaultValue)};
        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(context, 16);
        content.setPadding(padding, padding, padding, padding);
        List<Runnable> refresh = new ArrayList<>();
        TextView selected = new TextView(context);
        content.addView(selected);
        refresh.add(() -> selected.setText("Selected: " + nameForSelection(selection[0])));

        if (includeFollowTheme) {
            LinearLayout fixed = row(context, content, "Theme");
            addSwatch(context, fixed, "theme", "Theme", selection, refresh);
        }

        LinearLayout fixed = row(context, content, "Fixed colors");
        addSwatch(context, fixed, "white", "White", selection, refresh);
        addSwatch(context, fixed, "black", "Black", selection, refresh);
        for (String palette : PALETTES) {
            LinearLayout row = row(context, content, paletteName(palette));
            for (int shade : SHADES) {
                addSwatch(context, row, palette + "_" + shade, String.valueOf(shade), selection, refresh);
            }
        }
        for (Runnable update : refresh) update.run();
        ScrollView scroll = new ScrollView(context);
        scroll.addView(content);
        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(scroll)
                .setNegativeButton("Cancel", null)
                .setPositiveButton("Save", (dialogInterface, which) -> {
                    preferences.edit().putString(preferenceKey, selection[0]).apply();
                    preference.setSummary(nameForSelection(selection[0]));
                }).create();
        dialog.setOnShowListener(ignored -> HelakuruLiteSettingsExtension.applyDialogInsets(dialog));
        dialog.show();
    }

    private static LinearLayout row(Context context, LinearLayout content, String title) {
        TextView heading = new TextView(context);
        heading.setText(title);
        heading.setPadding(0, dp(context, 16), 0, dp(context, 6));
        content.addView(heading);
        HorizontalScrollView scroll = new HorizontalScrollView(context);
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        scroll.addView(row);
        content.addView(scroll);
        return row;
    }

    private static void addSwatch(Context context, LinearLayout row, String id, String label,
                                   String[] selection, List<Runnable> refresh) {
        Integer resolved = "theme".equals(id) ? Color.WHITE : resolve(context, id);
        int color = resolved == null ? Color.GRAY : resolved;
        double luminance = (Color.red(color) * .2126 + Color.green(color) * .7152
                + Color.blue(color) * .0722) / 255;
        int foreground = luminance > .5 ? Color.BLACK : Color.WHITE;
        TextView swatch = new TextView(context);
        swatch.setGravity(Gravity.CENTER);
        swatch.setTextColor(foreground);
        swatch.setTextSize(13);
        swatch.setEnabled(resolved != null);
        swatch.setContentDescription(nameForSelection(id) + (resolved == null ? ", unavailable" : ""));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(context, 64), dp(context, 64));
        params.setMargins(dp(context, 3), dp(context, 3), dp(context, 3), dp(context, 3));
        row.addView(swatch, params);
        refresh.add(() -> {
            boolean chosen = id.equals(selection[0]);
            swatch.setText((chosen ? "✓\n" : "") + label);
            swatch.setSelected(chosen);
            GradientDrawable background = new GradientDrawable();
            background.setColor(color);
            background.setCornerRadius(dp(context, 8));
            background.setStroke(dp(context, chosen ? 3 : 1), foreground);
            swatch.setBackground(background);
        });
        swatch.setOnClickListener(view -> {
            selection[0] = id;
            for (Runnable update : refresh) update.run();
        });
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
