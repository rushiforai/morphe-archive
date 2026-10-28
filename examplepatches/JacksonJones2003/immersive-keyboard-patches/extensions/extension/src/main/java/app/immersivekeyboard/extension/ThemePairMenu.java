package app.immersivekeyboard.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/**
 * Adds a "Light & dark pair" card to the top of Gboard's Themes screen, where a theme can be
 * chosen for light mode and another for dark mode. {@link ThemeDarkMode} switches between
 * them when the system dark mode changes. The card also picks a wallpaper for each mode,
 * which {@link WallpaperSwitch} sets on the phone.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class ThemePairMenu {
    private static final String TAG = "ImmersiveKB";
    private static final String CARD_TAG = "immersive_keyboard_theme_pair";

    /** Built-in themes, as Gboard stores them, with the names its Themes screen shows. */
    private static final String[][] BUILT_IN = {
            {"system_auto:", "Default auto"},
            {"system_auto:light", "Default"},
            {"system_auto:dark", "Default dark"},
            {"silk:", "Dynamic color"},
            {"assets:theme_package_metadata_material_light.binarypb", "Material light"},
            {"assets:theme_package_metadata_material_dark.binarypb", "Material dark"},
            {"assets:theme_package_metadata_google_blue_light.binarypb", "Google blue light"},
            {"assets:theme_package_metadata_google_blue_dark.binarypb", "Google blue dark"},
            {"assets:theme_package_metadata_color_red.binarypb", "Red"},
            {"assets:theme_package_metadata_color_green.binarypb", "Green"},
            {"assets:theme_package_metadata_color_teal.binarypb", "Teal"},
            {"assets:theme_package_metadata_color_blue.binarypb", "Blue"},
            {"assets:theme_package_metadata_color_cyan.binarypb", "Cyan"},
            {"assets:theme_package_metadata_color_deep_purple.binarypb", "Deep purple"},
            {"assets:theme_package_metadata_color_pink.binarypb", "Pink"},
            {"assets:theme_package_metadata_color_light_pink.binarypb", "Light pink"},
            {"assets:theme_package_metadata_color_sand.binarypb", "Sand"},
            {"assets:theme_package_metadata_color_brown.binarypb", "Brown"},
            {"assets:theme_package_metadata_color_blue_grey.binarypb", "Blue grey"},
            {"assets:theme_package_metadata_color_black.binarypb", "Black"},
            {"assets:theme_package_metadata_holo_blue.binarypb", "Holo blue"},
            {"assets:theme_package_metadata_holo_white.binarypb", "Holo white"},
    };

    private ThemePairMenu() {
    }

    /** Injection point. Called with the view ThemeListingFragment creates, which may be null. */
    public static void attach(View root) {
        try {
            if (!(root instanceof FrameLayout) || root.findViewWithTag(CARD_TAG) != null) {
                return;
            }
            FrameLayout frame = (FrameLayout) root;
            if (frame.getChildCount() == 0) {
                return;
            }
            // The layout is a FrameLayout holding the theme list first. Stack the card above
            // the list instead of over it.
            View list = frame.getChildAt(0);
            frame.removeViewAt(0);
            LinearLayout column = new LinearLayout(frame.getContext());
            column.setOrientation(LinearLayout.VERTICAL);
            column.addView(new Card(frame.getContext()).view, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            column.addView(list, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
            frame.addView(column, 0, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        } catch (Throwable failure) {
            Log.w(TAG, "theme pair menu failed", failure);
        }
    }

    private static final class Card implements SharedPreferences.OnSharedPreferenceChangeListener {
        final Context context;
        final LinearLayout view;
        final Switch toggle;
        final TextView lightValue;
        final TextView darkValue;
        final TextView hint;
        final View rows;
        final Handler handler = new Handler(Looper.getMainLooper());
        final SharedPreferences gboard;
        /** The mode waiting for a theme tapped in the list below, or null. */
        Boolean picking;
        boolean reverting;
        final Switch wallpaperToggle;
        final View wallpaperRows;
        final TextView lightWallpaper;
        final TextView darkWallpaper;
        final ImageView lightPreview;
        final ImageView darkPreview;
        final TextView target;

        Card(Context context) {
            this.context = context;
            gboard = ThemeDarkMode.gboardPreferences(context);
            int pad = dp(16);

            view = new LinearLayout(context);
            view.setTag(CARD_TAG);
            view.setOrientation(LinearLayout.VERTICAL);
            view.setPadding(pad, dp(8), pad, dp(8));

            LinearLayout header = new LinearLayout(context);
            header.setGravity(Gravity.CENTER_VERTICAL);
            header.setMinimumHeight(dp(56));
            TextView title = text("Light & dark pair", 16, true);
            header.addView(title, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            toggle = new Switch(context);
            header.addView(toggle);
            view.addView(header);

            LinearLayout rowColumn = new LinearLayout(context);
            rowColumn.setOrientation(LinearLayout.VERTICAL);
            lightValue = text("", 14, false);
            darkValue = text("", 14, false);
            rowColumn.addView(row("Light mode", lightValue, true));
            rowColumn.addView(row("Dark mode", darkValue, false));
            hint = text("", 14, true);
            hint.setPadding(0, dp(4), 0, dp(8));
            hint.setTextColor(accent());
            rowColumn.addView(hint);
            rows = rowColumn;
            view.addView(rowColumn);

            LinearLayout wallpaperHeader = new LinearLayout(context);
            wallpaperHeader.setGravity(Gravity.CENTER_VERTICAL);
            wallpaperHeader.setMinimumHeight(dp(56));
            wallpaperHeader.addView(text("Wallpaper follows dark mode", 16, true),
                    new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            wallpaperToggle = new Switch(context);
            wallpaperHeader.addView(wallpaperToggle);
            view.addView(wallpaperHeader);

            LinearLayout wallpaperColumn = new LinearLayout(context);
            wallpaperColumn.setOrientation(LinearLayout.VERTICAL);
            lightWallpaper = text("", 14, false);
            darkWallpaper = text("", 14, false);
            lightPreview = new ImageView(context);
            darkPreview = new ImageView(context);
            target = text("", 14, false);
            wallpaperColumn.addView(wallpaperRow("Light mode wallpaper", lightWallpaper,
                    lightPreview, v -> chooseWallpaper(true)));
            wallpaperColumn.addView(wallpaperRow("Dark mode wallpaper", darkWallpaper,
                    darkPreview, v -> chooseWallpaper(false)));
            wallpaperColumn.addView(wallpaperRow("Set on", target, null,
                    v -> chooseTarget()));
            wallpaperRows = wallpaperColumn;
            view.addView(wallpaperColumn);

            wallpaperToggle.setChecked(WallpaperSwitch.enabled(context));
            wallpaperToggle.setOnCheckedChangeListener((button, checked) -> {
                WallpaperSwitch.setEnabled(context, checked);
                refresh();
            });

            toggle.setChecked(ThemeDarkMode.enabled(context));
            toggle.setOnCheckedChangeListener((button, checked) -> {
                ThemeDarkMode.setEnabled(context, checked);
                picking = null;
                refresh();
            });
            view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View v) {
                    gboard.registerOnSharedPreferenceChangeListener(Card.this);
                    refresh();
                }

                @Override
                public void onViewDetachedFromWindow(View v) {
                    gboard.unregisterOnSharedPreferenceChangeListener(Card.this);
                    picking = null;
                }
            });
            refresh();
        }

        private View row(String label, TextView value, boolean light) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(dp(56));
            row.setPadding(0, dp(6), 0, dp(6));
            TypedValue ripple = new TypedValue();
            if (context.getTheme().resolveAttribute(
                    android.R.attr.selectableItemBackground, ripple, true)) {
                row.setBackgroundResource(ripple.resourceId);
            }
            row.addView(text(label, 16, false));
            value.setAlpha(0.7f);
            row.addView(value);
            row.setOnClickListener(v -> choose(light));
            return row;
        }

        private View wallpaperRow(String label, TextView value, ImageView preview,
                View.OnClickListener click) {
            LinearLayout row = new LinearLayout(context);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(dp(56));
            row.setPadding(0, dp(6), 0, dp(6));
            TypedValue ripple = new TypedValue();
            if (context.getTheme().resolveAttribute(
                    android.R.attr.selectableItemBackground, ripple, true)) {
                row.setBackgroundResource(ripple.resourceId);
            }
            LinearLayout labels = new LinearLayout(context);
            labels.setOrientation(LinearLayout.VERTICAL);
            labels.addView(text(label, 16, false));
            value.setAlpha(0.7f);
            labels.addView(value);
            row.addView(labels, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            if (preview != null) {
                preview.setScaleType(ImageView.ScaleType.CENTER_CROP);
                preview.setClipToOutline(true);
                preview.setOutlineProvider(new android.view.ViewOutlineProvider() {
                    @Override
                    public void getOutline(View view, android.graphics.Outline outline) {
                        outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), dp(6));
                    }
                });
                row.addView(preview, new LinearLayout.LayoutParams(dp(28), dp(48)));
            }
            row.setOnClickListener(click);
            return row;
        }

        private void chooseWallpaper(boolean light) {
            Context host = activity(context);
            if (!(host instanceof Activity)) {
                return;
            }
            boolean vivo = VivoWallpapers.available(context);
            boolean chosen = WallpaperSwitch.hasImage(context, light);
            if (!vivo && !chosen) {
                pickWallpaper((Activity) host, light);
                return;
            }
            List<CharSequence> options = new ArrayList<>();
            List<Runnable> actions = new ArrayList<>();
            options.add("Choose from photos");
            actions.add(() -> pickWallpaper((Activity) host, light));
            if (vivo) {
                options.add("Pick in vivo Themes");
                actions.add(() -> VivoThemesPicker.pick((Activity) host, light, this::refresh));
                options.add("Built-in vivo wallpapers");
                actions.add(() -> VivoWallpapers.choose(host, light, this::refresh));
            }
            if (chosen) {
                options.add("Remove");
                actions.add(() -> {
                    WallpaperSwitch.remove(context, light);
                    refresh();
                });
            }
            new AlertDialog.Builder(host)
                    .setTitle(light ? "Light mode wallpaper" : "Dark mode wallpaper")
                    .setItems(options.toArray(new CharSequence[0]),
                            (dialog, which) -> actions.get(which).run())
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
        }

        private void pickWallpaper(Activity host, boolean light) {
            try {
                WallpaperSwitch.pick(host, light, this::refresh);
            } catch (Throwable failure) {
                Log.w(TAG, "wallpaper picker failed", failure);
                Toast.makeText(context, "Couldn't open the photo picker",
                        Toast.LENGTH_SHORT).show();
            }
        }

        private void chooseTarget() {
            new AlertDialog.Builder(activity(context))
                    .setTitle("Set wallpaper on")
                    .setSingleChoiceItems(new CharSequence[]{"Home and lock screens",
                                    "Home screen only"},
                            WallpaperSwitch.homeOnly(context) ? 1 : 0, (dialog, which) -> {
                                WallpaperSwitch.setHomeOnly(context, which == 1);
                                dialog.dismiss();
                                refresh();
                            })
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
        }

        private void showWallpaper(boolean light, TextView value, ImageView preview) {
            boolean chosen = WallpaperSwitch.hasImage(context, light);
            value.setText(chosen ? "Chosen" : "Tap to choose an image");
            preview.setVisibility(chosen ? View.VISIBLE : View.GONE);
            if (!chosen) {
                preview.setImageDrawable(null);
                return;
            }
            new Thread(() -> {
                android.graphics.Bitmap bitmap = null;
                try {
                    bitmap = WallpaperSwitch.thumbnail(context, light, dp(48));
                } catch (Throwable ignored) {
                    // No preview, the image is still used.
                }
                android.graphics.Bitmap result = bitmap;
                handler.post(() -> preview.setImageBitmap(result));
            }).start();
        }

        private void choose(boolean light) {
            List<String> values = new ArrayList<>();
            List<String> names = new ArrayList<>();
            values.add(null);
            names.add("Tap a theme in the list below…");
            for (File file : importedThemes(context)) {
                ThemeDarkMode.ThemeInfo info = ThemeDarkMode.info(file);
                values.add(ThemeDarkMode.FILE_THEME_PREFIX + file.getName());
                names.add(info != null && !info.name.isEmpty() ? info.name : file.getName());
            }
            for (String[] theme : BUILT_IN) {
                values.add(theme[0]);
                names.add(theme[1]);
            }
            new AlertDialog.Builder(activity(context))
                    .setTitle(light ? "Light mode theme" : "Dark mode theme")
                    .setItems(names.toArray(new CharSequence[0]), (dialog, which) -> {
                        String value = values.get(which);
                        if (value == null) {
                            picking = light;
                        } else {
                            picking = null;
                            set(light, value);
                        }
                        refresh();
                    })
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
        }

        private void set(boolean light, String theme) {
            ThemeDarkMode.setTheme(context, light, theme);
            if (light == ThemeDarkMode.isLight(context)) {
                ThemeDarkMode.applyNow(context);
            }
        }

        @Override
        public void onSharedPreferenceChanged(SharedPreferences preferences, String key) {
            if (!ThemeDarkMode.THEME_PREFERENCE.equals(key) || reverting) {
                return;
            }
            String selected = preferences.getString(key, "");
            if (selected == null || selected.isEmpty()) {
                return;
            }
            boolean currentLight = ThemeDarkMode.isLight(context);
            if (picking != null) {
                boolean light = picking;
                picking = null;
                ThemeDarkMode.setTheme(context, light, selected);
                if (light != currentLight) {
                    // Chosen for the other mode: keep the current mode's theme on screen.
                    String current = ThemeDarkMode.theme(context, currentLight);
                    if (current != null && !current.equals(selected)) {
                        handler.post(() -> {
                            reverting = true;
                            preferences.edit()
                                    .putString(ThemeDarkMode.THEME_PREFERENCE, current).apply();
                            reverting = false;
                        });
                    }
                    Toast.makeText(context, "Saved as the " + (light ? "light" : "dark")
                            + " mode theme", Toast.LENGTH_SHORT).show();
                }
            } else if (ThemeDarkMode.enabled(context)) {
                // A theme picked in Gboard's list becomes this mode's half of the pair.
                ThemeDarkMode.setTheme(context, currentLight, selected);
            }
            handler.post(this::refresh);
        }

        private void refresh() {
            boolean on = ThemeDarkMode.enabled(context);
            if (toggle.isChecked() != on) {
                toggle.setChecked(on);
            }
            rows.setVisibility(on ? View.VISIBLE : View.GONE);
            boolean wallpaperOn = WallpaperSwitch.enabled(context);
            if (wallpaperToggle.isChecked() != wallpaperOn) {
                wallpaperToggle.setChecked(wallpaperOn);
            }
            wallpaperRows.setVisibility(wallpaperOn ? View.VISIBLE : View.GONE);
            if (wallpaperOn) {
                showWallpaper(true, lightWallpaper, lightPreview);
                showWallpaper(false, darkWallpaper, darkPreview);
                target.setText(WallpaperSwitch.homeOnly(context) ? "Home screen only"
                        : "Home and lock screens");
            }
            lightValue.setText(name(ThemeDarkMode.theme(context, true)));
            darkValue.setText(name(ThemeDarkMode.theme(context, false)));
            if (picking != null) {
                hint.setText("Tap a theme below to use in " + (picking ? "light" : "dark")
                        + " mode");
                hint.setVisibility(View.VISIBLE);
            } else {
                hint.setVisibility(View.GONE);
            }
        }

        private String name(String theme) {
            if (theme == null) {
                return "Not chosen";
            }
            for (String[] builtIn : BUILT_IN) {
                if (builtIn[0].equals(theme)) {
                    return builtIn[1];
                }
            }
            if (theme.startsWith(ThemeDarkMode.FILE_THEME_PREFIX)) {
                File file = new File(context.getFilesDir(),
                        theme.substring(ThemeDarkMode.FILE_THEME_PREFIX.length()));
                ThemeDarkMode.ThemeInfo info = file.isFile() ? ThemeDarkMode.info(file) : null;
                if (info != null && !info.name.isEmpty()) {
                    return info.name;
                }
                if (!file.isFile()) {
                    return "Deleted theme";
                }
            }
            // Anything else, such as a downloaded theme: make its stored name readable.
            String readable = theme.substring(theme.indexOf(':') + 1)
                    .replaceAll("\\.[a-z]+$", "")
                    .replace("theme_package_metadata_", "")
                    .replace('_', ' ').trim();
            return readable.isEmpty() ? theme : readable.substring(0, 1)
                    .toUpperCase(Locale.ROOT) + readable.substring(1);
        }

        private TextView text(String value, int sp, boolean bold) {
            TextView text = new TextView(context);
            text.setText(value);
            text.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
            if (bold) {
                text.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
            }
            return text;
        }

        private int accent() {
            TypedValue value = new TypedValue();
            if (context.getTheme().resolveAttribute(android.R.attr.colorAccent, value, true)) {
                return value.data;
            }
            return 0xFF1A73E8;
        }

        private int dp(int value) {
            return Math.round(value * context.getResources().getDisplayMetrics().density);
        }
    }

    private static List<File> importedThemes(Context context) {
        File[] files = context.getFilesDir().listFiles((directory, name) ->
                name.startsWith(ThemeDarkMode.USER_THEME_PREFIX) && name.endsWith(".zip"));
        if (files == null) {
            return new ArrayList<>();
        }
        List<File> list = new ArrayList<>(Arrays.asList(files));
        list.sort((a, b) -> Long.compare(b.lastModified(), a.lastModified()));
        return list;
    }

    private static Context activity(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return current;
            }
            current = ((ContextWrapper) current).getBaseContext();
        }
        return context;
    }
}
