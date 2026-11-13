package app.template.extension.extension;

import android.app.AlertDialog;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.drawable.GradientDrawable;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.content.res.ColorStateList;
import android.inputmethodservice.Keyboard;
import android.os.SystemClock;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.os.Build;
import android.widget.LinearLayout;
import android.widget.CompoundButton;
import android.widget.SeekBar;
import android.widget.TextView;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.content.res.Configuration;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.graphics.Color;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;

/** Settings UI and drawing helpers for the Lite Frosted Glass patch. */
public final class HelakuruLiteSettingsExtension {
    private static final String ENABLED = "morphe_live_keyboard_blur_lite";
    private static final String BLUR_STRENGTH = "morphe_frosted_blur_strength";
    private static final String BLUR_MODE = "morphe_frosted_blur_mode";
    private static final String PAUSE_WHILE_TYPING = "morphe_frosted_pause_blur_while_typing";
    private static final String RESUME_BLUR_DELAY = "morphe_frosted_resume_blur_delay";
    private static final String TRANSPARENCY_FOLLOWS_THEME = "morphe_frosted_transparency_follow_theme";
    private static final String TRANSPARENCY_AMOUNT = "morphe_frosted_transparency_amount";
    private static final String COLOR_THEME = "morphe_frosted_color_theme";
    private static final String KEY_SIZE = "morphe_key_background_size";
    private static final String TILE_COLOR = "morphe_key_tile_color";
    private static final String TILE_TRANSPARENCY = "morphe_key_tile_transparency";
    private static final int DEFAULT_TILE_TRANSPARENCY = 82;
    private static final int DEFAULT_KEY_SIZE = 90;
    private static final Map<View, int[]> ORIGINAL_PADDING = new WeakHashMap<>();
    private static final Map<Activity, Boolean> SETTINGS_THEME_PREPARED = new WeakHashMap<>();
    private static final Map<Canvas, View> DRAW_CANVAS_VIEWS = new WeakHashMap<>();
    private static final Map<View, KeyboardMode> KEYBOARD_MODES = new WeakHashMap<>();

    private HelakuruLiteSettingsExtension() {
    }

    /** Called before PreferenceActivity.onCreate so its views inflate with the device's night mode. */
    public static void prepareSettingsActivityTheme(Object activityObject) {
        if (!(activityObject instanceof Activity)) return;
        Activity activity = (Activity) activityObject;
        synchronized (SETTINGS_THEME_PREPARED) {
            if (SETTINGS_THEME_PREPARED.containsKey(activity)) return;
            try {
                String packageName = activity.getPackageName();
                boolean dark = (activity.getResources().getConfiguration().uiMode
                        & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
                int dayNight = activity.getResources().getIdentifier(
                        dark ? "Theme.AppCompat.NoActionBar" : "Theme.AppCompat.Light.NoActionBar",
                        "style", packageName);
                int liteOverrides = activity.getResources().getIdentifier(
                        "MorpheSettingsColors", "style", packageName);
                if (dayNight != 0) {
                    activity.setTheme(dayNight);
                    if (liteOverrides != 0) activity.getTheme().applyStyle(liteOverrides, true);
                }
                SETTINGS_THEME_PREPARED.put(activity, Boolean.TRUE);
            } catch (Throwable ignored) { }
        }
    }

    /** Applies edge-to-edge safe areas and connects every injected preference subpage. */
    public static void applySettingsWindow(Object activityObject) {
        if (!(activityObject instanceof PreferenceActivity)) return;
        PreferenceActivity activity = (PreferenceActivity) activityObject;
        try {
            Window window = activity.getWindow();
            applySystemBarAppearance(window, activity);
            PreferenceScreen root = activity.getPreferenceScreen();
            if (root != null) installSubpageInsets(activity, root, new HashSet<PreferenceScreen>());
        } catch (Throwable ignored) { }
    }

    private static void installSubpageInsets(PreferenceActivity activity, PreferenceGroup group,
                                             Set<PreferenceScreen> visited) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference preference = group.getPreference(i);
            if (!(preference instanceof PreferenceScreen)) {
                if (preference instanceof PreferenceGroup) {
                    installSubpageInsets(activity, (PreferenceGroup) preference, visited);
                }
                continue;
            }
            PreferenceScreen screen = (PreferenceScreen) preference;
            if (!visited.add(screen)) continue;
            screen.setOnPreferenceClickListener(clicked -> {
                activity.getWindow().getDecorView().postDelayed(() -> {
                    Dialog dialog = screen.getDialog();
                    if (dialog == null || dialog.getWindow() == null) return;
                    dialog.getWindow().getDecorView().post(() -> applyDialogInsets(dialog));
                    if ("morphe_frosted_glass_page".equals(screen.getKey())) {
                        dialog.getWindow().getDecorView().post(() ->
                                HelakuruLitePreviewExtension.bindFrostedSettings(dialog, activity));
                    }
                }, 60L);
                return false;
            });
            installSubpageInsets(activity, screen, visited);
        }
    }

    public static void bindSettings(Object activityObject) {
        if (!(activityObject instanceof PreferenceActivity)) {
            return;
        }
        final PreferenceActivity activity = (PreferenceActivity) activityObject;
        try {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(activity);
            SharedPreferences.Editor defaults = preferences.edit();
            if (!preferences.contains(BLUR_STRENGTH)) defaults.putInt(BLUR_STRENGTH, 32);
            if (!preferences.contains(BLUR_MODE)) defaults.putString(BLUR_MODE, "background");
            if (!preferences.contains(PAUSE_WHILE_TYPING)) defaults.putBoolean(PAUSE_WHILE_TYPING, false);
            if (!preferences.contains(RESUME_BLUR_DELAY)) defaults.putInt(RESUME_BLUR_DELAY, 200);
            if (!preferences.contains(TRANSPARENCY_FOLLOWS_THEME)) {
                defaults.putBoolean(TRANSPARENCY_FOLLOWS_THEME, true);
            }
            if (!preferences.contains(TRANSPARENCY_AMOUNT)) defaults.putInt(TRANSPARENCY_AMOUNT, 50);
            if (!preferences.contains(COLOR_THEME)) defaults.putString(COLOR_THEME, "monet");
            if (!preferences.contains(KEY_SIZE)) defaults.putInt(KEY_SIZE, DEFAULT_KEY_SIZE);
            defaults.apply();

            Preference blur = find(activity, BLUR_STRENGTH);
            Preference blurMode = find(activity, BLUR_MODE);
            Preference pauseWhileTyping = find(activity, PAUSE_WHILE_TYPING);
            Preference resumeBlurDelay = find(activity, RESUME_BLUR_DELAY);
            Preference transparencyMode = find(activity, "morphe_frosted_transparency_mode");
            Preference transparencyAmount = find(activity, "morphe_frosted_transparency_amount");
            Preference colorTheme = find(activity, "morphe_frosted_color_theme");
            Preference enabled = find(activity, ENABLED);
            Preference accent = find(activity, HelakuruLiteAccentChooser.PREFERENCE_KEY);
            if (accent != null) {
                HelakuruLiteAccentChooser.updateSummary(accent, preferences);
                accent.setEnabled(isEnabled(preferences)
                        && "monet".equals(preferences.getString(COLOR_THEME, "monet")));
                accent.setOnPreferenceClickListener(preference -> {
                    HelakuruLiteAccentChooser.show(activity, preferences, accent);
                    return true;
                });
            }

            if (blur != null) {
                updateNumberSummary(blur, preferences.getInt(BLUR_STRENGTH, 32), " dp");
                blur.setOnPreferenceClickListener(preference -> {
                    showSlider(activity, "Blur strength", " dp", 0, 80,
                            preferences.getInt(BLUR_STRENGTH, 32), value -> {
                                preferences.edit().putInt(BLUR_STRENGTH, value).apply();
                                updateNumberSummary(blur, value, " dp");
                            });
                    return true;
                });
            }

            if (resumeBlurDelay != null) {
                int delay = clamp(preferences.getInt(RESUME_BLUR_DELAY, 200), 0, 2000);
                updateNumberSummary(resumeBlurDelay, delay, " ms");
                resumeBlurDelay.setOnPreferenceClickListener(preference -> {
                    showSlider(activity, "Resume blur delay", " ms", 0, 2000, 50,
                            preferences.getInt(RESUME_BLUR_DELAY, 200), value -> {
                                preferences.edit().putInt(RESUME_BLUR_DELAY, value).apply();
                                updateNumberSummary(resumeBlurDelay, value, " ms");
                            });
                    return true;
                });
                resumeBlurDelay.setEnabled(
                        preferences.getBoolean(ENABLED, false)
                                && preferences.getBoolean(PAUSE_WHILE_TYPING, false)
                                && Build.VERSION.SDK_INT >= 31);
            }

            if (blurMode != null) {
                updateBlurModeSummary(blurMode, preferences.getString(BLUR_MODE, "background"));
                blurMode.setOnPreferenceClickListener(preference -> {
                    String[] choices = {"Background blur", "Blur behind (whole screen)"};
                    int selected = "behind".equals(preferences.getString(BLUR_MODE, "background")) ? 1 : 0;
                    AlertDialog settingsDialog = new AlertDialog.Builder(activity)
                            .setTitle("Blur method")
                            .setSingleChoiceItems(choices, selected, (dialog, which) -> {
                                String mode = which == 1 ? "behind" : "background";
                                preferences.edit().putString(BLUR_MODE, mode).apply();
                                updateBlurModeSummary(blurMode, mode);
                                dialog.dismiss();
                            })
                            .setNegativeButton("Cancel", null)
                            .create();
                    showSettingsDialog(settingsDialog);
                    return true;
                });
            }

            if (transparencyMode != null) {
                updateTransparencyModeSummary(transparencyMode, preferences);
                transparencyMode.setOnPreferenceClickListener(preference -> {
                    AlertDialog settingsDialog = new AlertDialog.Builder(activity)
                            .setTitle("Background transparency")
                            .setSingleChoiceItems(
                                    new String[]{"Follow Helakuru theme", "Custom amount"},
                                    preferences.getBoolean(TRANSPARENCY_FOLLOWS_THEME, true) ? 0 : 1,
                                    (dialog, which) -> {
                                        boolean follows = which == 0;
                                        preferences.edit().putBoolean(TRANSPARENCY_FOLLOWS_THEME, follows).apply();
                                        updateTransparencyModeSummary(transparencyMode, preferences);
                                        if (transparencyAmount != null) {
                                            transparencyAmount.setEnabled(!follows && isEnabled(preferences));
                                        }
                                        dialog.dismiss();
                                    })
                            .setNegativeButton("Cancel", null)
                            .create();
                    showSettingsDialog(settingsDialog);
                    return true;
                });
            }

            if (transparencyAmount != null) {
                updateNumberSummary(transparencyAmount,
                        preferences.getInt(TRANSPARENCY_AMOUNT, 50), "% transparent");
                transparencyAmount.setEnabled(
                        !preferences.getBoolean(TRANSPARENCY_FOLLOWS_THEME, true)
                                && isEnabled(preferences));
                transparencyAmount.setOnPreferenceClickListener(preference -> {
                    showSlider(activity, "Background transparency", "% transparent", 0, 100,
                            preferences.getInt(TRANSPARENCY_AMOUNT, 50), value -> {
                                preferences.edit().putInt(TRANSPARENCY_AMOUNT, value).apply();
                                updateNumberSummary(transparencyAmount, value, "% transparent");
                            });
                    return true;
                });
            }

            if (colorTheme != null) {
                updateColorSummary(colorTheme, preferences);
                colorTheme.setOnPreferenceClickListener(preference -> {
                    String[] choices = {"Monet", "Helakuru theme"};
                    int selected = "monet".equals(preferences.getString(COLOR_THEME, "monet")) ? 0 : 1;
                    AlertDialog settingsDialog = new AlertDialog.Builder(activity)
                            .setTitle("Keyboard color theme")
                            .setSingleChoiceItems(choices, selected, (dialog, which) -> {
                                preferences.edit().putString(COLOR_THEME, which == 0 ? "monet" : "helakuru").apply();
                                updateColorSummary(colorTheme, preferences);
                                setEnabled(accent, which == 0 && isEnabled(preferences));
                                dialog.dismiss();
                            })
                            .setNegativeButton("Cancel", null)
                            .create();
                    showSettingsDialog(settingsDialog);
                    return true;
                });
            }

            if (enabled != null) {
                enabled.setOnPreferenceChangeListener((preference, newValue) -> {
                    boolean active = Boolean.TRUE.equals(newValue);
                    setEnabled(transparencyMode, active);
                    setEnabled(accent, active && "monet".equals(preferences.getString(COLOR_THEME, "monet")));
                    if (transparencyAmount != null) {
                        transparencyAmount.setEnabled(active && !preferences.getBoolean(TRANSPARENCY_FOLLOWS_THEME, true));
                    }
                    if (colorTheme != null) colorTheme.setEnabled(active);
                    if (blur != null) blur.setEnabled(active && Build.VERSION.SDK_INT >= 31);
                    setEnabled(blurMode, active && Build.VERSION.SDK_INT >= 31);
                    setEnabled(pauseWhileTyping, active && Build.VERSION.SDK_INT >= 31);
                    setEnabled(resumeBlurDelay, active
                            && preferences.getBoolean(PAUSE_WHILE_TYPING, false)
                            && Build.VERSION.SDK_INT >= 31);
                    return true;
                });
                boolean active = preferences.getBoolean(ENABLED, false);
                setEnabled(transparencyMode, active);
                if (transparencyAmount != null) {
                    transparencyAmount.setEnabled(active && !preferences.getBoolean(TRANSPARENCY_FOLLOWS_THEME, true));
                }
                if (colorTheme != null) colorTheme.setEnabled(active);
                if (blur != null) {
                    blur.setEnabled(active && Build.VERSION.SDK_INT >= 31);
                    if (Build.VERSION.SDK_INT < 31) {
                        blur.setSummary("Requires Android 12 or later");
                    }
                }
                setEnabled(blurMode, active && Build.VERSION.SDK_INT >= 31);
                setEnabled(pauseWhileTyping, active && Build.VERSION.SDK_INT >= 31);
                setEnabled(resumeBlurDelay, active
                        && preferences.getBoolean(PAUSE_WHILE_TYPING, false)
                        && Build.VERSION.SDK_INT >= 31);
                if (blurMode != null && Build.VERSION.SDK_INT < 31) {
                    blurMode.setSummary("Requires Android 12 or later");
                }
                if (pauseWhileTyping != null && Build.VERSION.SDK_INT < 31) {
                    pauseWhileTyping.setSummary("Requires Android 12 or later");
                }
            }
            if (pauseWhileTyping != null) {
                pauseWhileTyping.setOnPreferenceChangeListener((preference, newValue) -> {
                    setEnabled(resumeBlurDelay,
                            preferences.getBoolean(ENABLED, false)
                                    && Boolean.TRUE.equals(newValue)
                                    && Build.VERSION.SDK_INT >= 31);
                    return true;
                });
            }
            applySettingsWindow(activity);
        } catch (Throwable ignored) {
            // Keep the stock settings screen usable if a preference differs in an app build.
        }
    }

    public static void bindThemeEditor(Object fragmentObject, Object rootObject) {
        if (!(rootObject instanceof View)) return;
        final View root = (View) rootObject;
        try {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(root.getContext());
            TextView size = findTextControl(root, "morphe_key_background_size");
            if (size != null) {
                updateKeySizeLabel(size, preferences.getInt(KEY_SIZE, DEFAULT_KEY_SIZE));
                settingRow(size).setOnClickListener(view -> showSlider(root.getContext(), "Key background size", "%", 70, 100,
                        preferences.getInt(KEY_SIZE, DEFAULT_KEY_SIZE), value -> {
                            preferences.edit().putInt(KEY_SIZE, value).apply();
                            updateKeySizeLabel(size, value);
                        }));
            }
            TextView color = findTextControl(root, "morphe_key_tile_color");
            if (color != null) {
                updateTileColorLabel(color, preferences.getString(TILE_COLOR, "theme"));
                settingRow(color).setOnClickListener(view -> HelakuruLiteAccentChooser.show(root.getContext(), preferences,
                        new Preference(root.getContext()) {
                            @Override public void setSummary(CharSequence summary) {
                                super.setSummary(summary);
                                updateTileColorLabel(color, preferences.getString(TILE_COLOR, "theme"));
                            }
                        }, TILE_COLOR, "theme", "Key tile color", true));
            }
            TextView transparency = findTextControl(root, "morphe_key_tile_transparency");
            if (transparency != null) {
                updateTileTransparencyLabel(transparency,
                        preferences.getInt(TILE_TRANSPARENCY, DEFAULT_TILE_TRANSPARENCY));
                settingRow(transparency).setOnClickListener(view -> showSlider(root.getContext(), "Key tile transparency",
                        "% transparent", 0, 100,
                        preferences.getInt(TILE_TRANSPARENCY, DEFAULT_TILE_TRANSPARENCY), value -> {
                            preferences.edit().putInt(TILE_TRANSPARENCY, value).apply();
                            updateTileTransparencyLabel(transparency, value);
                        }));
            }
            int switchId = root.getResources().getIdentifier("key_boarder_toggle", "id", root.getContext().getPackageName());
            View toggleView = switchId == 0 ? null : root.findViewById(switchId);
            if (toggleView instanceof CompoundButton) {
                CompoundButton toggle = (CompoundButton) toggleView;
                toggle.setContentDescription("Key border");
                int rowId = root.getResources().getIdentifier("morphe_key_controls_row", "id", root.getContext().getPackageName());
                View switchRow = rowId == 0 ? null : root.findViewById(rowId);
                if (switchRow != null) switchRow.setOnClickListener(view -> toggle.performClick());
                // Lite owns the checked-change listener. Observe its state without replacing it,
                // including changes made when Lite switches the active theme.
                Runnable update = () -> {
                    boolean enabled = toggle.isChecked();
                    for (TextView value : new TextView[]{size, color, transparency}) {
                        if (value == null) continue;
                        View row = settingRow(value);
                        if (row.isEnabled() != enabled) row.setEnabled(enabled);
                        float alpha = enabled ? 1f : 0.4f;
                        if (row.getAlpha() != alpha) row.setAlpha(alpha);
                    }
                };
                update.run();
                root.getViewTreeObserver().addOnPreDrawListener(() -> {
                    update.run();
                    return true;
                });
            }
            HelakuruLitePreviewExtension.bindThemeEditor(fragmentObject, root);
        } catch (Throwable ignored) {
            // The theme editor remains functional if this optional row cannot be bound.
        }
    }

    /** Bind every draw pass, including borderless themes which never draw key tiles. */
    public static void bindKeyboardCanvas(Object viewObject, Canvas canvas) {
        if (canvas != null && viewObject instanceof View) {
            synchronized (DRAW_CANVAS_VIEWS) {
                DRAW_CANVAS_VIEWS.put(canvas, (View) viewObject);
            }
        }
    }

    /** Drop the short-lived mode cache after Lite changes language or keyboard layout. */
    public static void invalidateKeyboardMode(Object serviceObject) {
        if (serviceObject == null) return;
        try {
            Field keyboardField = findField(serviceObject.getClass(), "keyboardView");
            if (keyboardField == null) return;
            keyboardField.setAccessible(true);
            Object keyboardObject = keyboardField.get(serviceObject);
            if (!(keyboardObject instanceof View)) return;
            View keyboardView = (View) keyboardObject;
            synchronized (KEYBOARD_MODES) {
                KEYBOARD_MODES.remove(keyboardView);
            }
            keyboardView.invalidate();
        } catch (Throwable ignored) {
            // State changes still complete normally if Lite changes its view field.
        }
    }

    /** Scale only the drawable; the stock inset remains available to language labels/icons. */
    public static void drawKeyBackground(GradientDrawable drawable, Canvas canvas,
                                         Object viewObject, Keyboard.Key key) {
        if (canvas != null && viewObject instanceof View) {
            synchronized (DRAW_CANVAS_VIEWS) {
                DRAW_CANVAS_VIEWS.put(canvas, (View) viewObject);
            }
        }
        boolean special = isLighterSpecialKey(key);
        ColorStateList stockFill = getDrawableColor(drawable);
        SharedPreferences preferences = null;
        try {
            if (viewObject instanceof View) {
                preferences = PreferenceManager.getDefaultSharedPreferences(
                        ((View) viewObject).getContext());
                int nativeColor = stockFill == null ? 0x2DFFFFFF : stockFill.getDefaultColor();
                boolean pressed = isPressedDrawable(viewObject, drawable);
                int transparency = clamp(preferences.getInt(TILE_TRANSPARENCY,
                        DEFAULT_TILE_TRANSPARENCY), 0, 100);
                int alpha = Math.round((100 - transparency) * 255f / 100f);
                if (pressed) alpha = Math.round(alpha * (26f / 45f));
                String selection = preferences.getString(TILE_COLOR, "theme");
                int rgb = 0x00FFFFFF;
                if (!"theme".equals(selection)) {
                    Integer custom = HelakuruLiteAccentChooser.resolve(((View) viewObject).getContext(), selection);
                    if (custom != null) rgb = custom;
                }
                int fill = Color.argb(alpha, Color.red(rgb), Color.green(rgb), Color.blue(rgb));
                if (special) fill = blendTowardWhite(fill, 0.12f);
                drawable.setColor(ColorStateList.valueOf(fill));
                float scale = clamp(preferences.getInt(KEY_SIZE, DEFAULT_KEY_SIZE), 70, 100) / 100f;
                float centerX = key.x + key.width / 2f;
                float centerY = key.y + key.height / 2f;
                int code = key.codes == null || key.codes.length == 0 ? 0 : key.codes[0];
                float left = centerX - key.width * scale / 2f;
                float right = centerX + key.width * scale / 2f;
                if (code == 32 && viewObject instanceof android.inputmethodservice.KeyboardView) {
                    // The regular proportional inset becomes disproportionately wide on Lite's
                    // 40%-width space key. Match each visible side gap to its adjacent key.
                    float leftInset = neighboringKeyInset(
                            ((android.inputmethodservice.KeyboardView) viewObject).getKeyboard(), key, true, scale);
                    float rightInset = neighboringKeyInset(
                            ((android.inputmethodservice.KeyboardView) viewObject).getKeyboard(), key, false, scale);
                    left = key.x + leftInset;
                    right = key.x + key.width - rightInset;
                }
                drawable.setBounds(Math.round(left),
                        Math.round(centerY - key.height * scale / 2f),
                        Math.round(right),
                        Math.round(centerY + key.height * scale / 2f));
            }
        } catch (Throwable ignored) {
            // Keep the bounds already computed by Lite if the preference cannot be read.
        }
        try {
            drawable.draw(canvas);
        } finally {
            if (stockFill != null) drawable.setColor(stockFill);
        }
    }

    private static float neighboringKeyInset(Keyboard keyboard, Keyboard.Key spaceKey,
                                              boolean leftSide, float scale) {
        if (keyboard == null) return spaceKey.height * (1f - scale) / 2f;
        Keyboard.Key nearest = null;
        int nearestDistance = Integer.MAX_VALUE;
        int spaceRight = spaceKey.x + spaceKey.width;
        int spaceBottom = spaceKey.y + spaceKey.height;
        for (Keyboard.Key candidate : keyboard.getKeys()) {
            if (candidate == spaceKey || candidate.codes == null || candidate.codes.length == 0) continue;
            int overlap = Math.min(spaceBottom, candidate.y + candidate.height)
                    - Math.max(spaceKey.y, candidate.y);
            if (overlap <= 0) continue;
            int distance = leftSide ? spaceKey.x - (candidate.x + candidate.width)
                    : candidate.x - spaceRight;
            if (distance >= 0 && distance < nearestDistance) {
                nearest = candidate;
                nearestDistance = distance;
            }
        }
        float adjacentWidth = nearest == null ? spaceKey.height : nearest.width;
        return adjacentWidth * (1f - scale) / 2f;
    }

    private static int blendTowardWhite(int color, float amount) {
        int oldAlpha = Color.alpha(color);
        int alpha = Math.round(oldAlpha + (255 - oldAlpha) * amount);
        float whiteContribution = amount * 255f;
        float retainedContribution = oldAlpha * (1f - amount);
        float total = whiteContribution + retainedContribution;
        int red = Math.round((Color.red(color) * retainedContribution + 255 * whiteContribution) / total);
        int green = Math.round((Color.green(color) * retainedContribution + 255 * whiteContribution) / total);
        int blue = Math.round((Color.blue(color) * retainedContribution + 255 * whiteContribution) / total);
        return Color.argb(alpha, red, green, blue);
    }

    private static ColorStateList getDrawableColor(GradientDrawable drawable) {
        try {
            Method method = GradientDrawable.class.getMethod("getColor");
            Object result = method.invoke(drawable);
            return result instanceof ColorStateList ? (ColorStateList) result : null;
        } catch (Throwable ignored) {
            // API 23 does not expose getColor(); leave its stock drawable untouched.
            return null;
        }
    }

    private static boolean isLighterSpecialKey(Keyboard.Key key) {
        if (key == null || key.codes == null || key.codes.length == 0) return false;
        switch (key.codes[0]) {
            case -1: // Shift
            case -2: // ?123 / symbol mode
            case -5: // Backspace
            case 10: // Return
            case 44: // Comma
            case 46: // Period
            case 84: // Search
                return true;
            default:
                return false;
        }
    }

    public static void drawKeyLabel(Canvas canvas, String label, Keyboard.Key key,
                                    float stockBaseline, Paint paint) {
        View view;
        synchronized (DRAW_CANVAS_VIEWS) {
            view = DRAW_CANVAS_VIEWS.get(canvas);
        }
        drawKeyLabel(view, canvas, label, key, stockBaseline, paint);
    }

    public static void drawKeyLabel(Object keyboardViewObject, Canvas canvas, String label,
                                    Keyboard.Key key, float stockBaseline, Paint paint) {
        if (!(keyboardViewObject instanceof View)) {
            synchronized (DRAW_CANVAS_VIEWS) {
                keyboardViewObject = DRAW_CANVAS_VIEWS.get(canvas);
            }
        }
        if (key == null) {
            if (label != null) canvas.drawText(label, 0f, stockBaseline, paint);
            return;
        }
        KeyboardMode mode = keyboardMode(keyboardViewObject);
        boolean sinhala = mode.sinhala;
        if (sinhala && key != null && key.codes != null && key.codes.length > 0
                && key.codes[0] == 32) {
            label = "සිංහල";
        }
        if (sinhala && mode.phonetic) {
            drawSinhalaHint(canvas, label, key, paint, keyboardViewObject);
        }
        int code = key.codes != null && key.codes.length > 0 ? key.codes[0] : 0;
        float centerX = key.x + key.width / 2f;
        if (code == 32 || code == -3) {
            canvas.drawText(label, centerX, stockBaseline, paint);
            return;
        }
        Rect bounds = new Rect();
        paint.getTextBounds(label, 0, label.length(), bounds);
        float baseline;
        float x;
        if (bounds.isEmpty()) {
            Paint.FontMetrics metrics = paint.getFontMetrics();
            baseline = key.y + key.height / 2f - (metrics.ascent + metrics.descent) / 2f;
            x = centerX;
        } else {
            baseline = key.y + key.height / 2f - (bounds.top + bounds.bottom) / 2f;
            // getTextBounds uses a left-aligned origin; account for the paint's alignment.
            float advance = paint.measureText(label);
            float alignment = paint.getTextAlign() == Paint.Align.CENTER ? advance / 2f
                    : paint.getTextAlign() == Paint.Align.RIGHT ? advance : 0f;
            x = centerX - (bounds.left + bounds.right) / 2f + alignment;
        }
        canvas.drawText(label, x, baseline, paint);
    }

    private static void drawSinhalaHint(Canvas canvas, String label, Keyboard.Key key,
                                       Paint basePaint, Object keyboardViewObject) {
        if (label == null || label.length() != 1 || key == null) return;
        char letter = label.charAt(0);
        String hint = sinhalaHintFor(letter);
        if (hint == null) return;

        Paint hintPaint = new Paint(basePaint);
        hintPaint.setTextAlign(Paint.Align.CENTER);
        hintPaint.setTextSize(Math.max(8f, basePaint.getTextSize() * 0.42f));
        hintPaint.setAlpha(Math.round(basePaint.getAlpha() * 0.68f));
        float x = key.x + key.width / 2f;
        float y = key.y + key.height * 0.27f;
        canvas.drawText(hint, x, y, hintPaint);
    }

    private static String sinhalaHintFor(char letter) {
        switch (letter) {
            case 'q': return "ද";
            case 'w': return "ව";
            case 'e': return "එ";
            case 'r': return "ර";
            case 't': return "ට";
            case 'y': return "ය";
            case 'u': return "උ";
            case 'i': return "ඉ";
            case 'o': return "ඔ";
            case 'p': return "ප";
            case 'a': return "අ";
            case 's': return "ස";
            case 'd': return "ඩ";
            case 'f': return "ෆ";
            case 'g': return "ග";
            case 'h': return "හ";
            case 'j': return "ජ";
            case 'k': return "ක";
            case 'l': return "ල";
            case 'x': return "ං";
            case 'c': return "ක";
            case 'v': return "ව";
            case 'b': return "බ";
            case 'n': return "න";
            case 'm': return "ම";
            case 'E': return "ඓ";
            case 'R': return "සෘ";
            case 'T': return "ඨ";
            case 'I': return "ඊ";
            case 'P': return "ඵ";
            case 'A': return "ඇ";
            case 'S': return "ෂ";
            case 'D': return "ඪ";
            case 'G': return "ඝ";
            case 'H': return "ඃ";
            case 'J': return "ඣ";
            case 'L': return "ළ";
            case 'X': return "ඞ";
            case 'B': return "ඹ";
            case 'N': return "ණ";
            default: return null;
        }
    }

    private static Object keyboardService(Object keyboardViewObject) {
        if (!(keyboardViewObject instanceof View)) return null;
        Context context = ((View) keyboardViewObject).getContext();
        while (context instanceof ContextWrapper) {
            // InputMethodService is itself a ContextWrapper. Stop here instead of
            // unwrapping it into ContextImpl, which has no keyboard mode fields.
            if (context instanceof android.inputmethodservice.InputMethodService) return context;
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return context;
    }

    private static KeyboardMode keyboardMode(Object keyboardViewObject) {
        if (!(keyboardViewObject instanceof View)) return KeyboardMode.NONE;
        View view = (View) keyboardViewObject;
        long now = SystemClock.uptimeMillis();
        synchronized (KEYBOARD_MODES) {
            KeyboardMode cached = KEYBOARD_MODES.get(view);
            if (cached != null && now - cached.readAt < 50L) return cached;
        }
        KeyboardMode mode = new KeyboardMode(false, false, now);
        try {
            Object service = keyboardService(view);
            if (service != null) {
                Field languageField = findField(service.getClass(), "language");
                Field layoutField = findField(service.getClass(), "activeLayout");
                if (languageField != null && layoutField != null) {
                    languageField.setAccessible(true);
                    layoutField.setAccessible(true);
                    Object layout = layoutField.get(service);
                    boolean sinhala = languageField.getInt(service) == 2;
                    boolean phonetic = false;
                    if (layout != null) {
                        Method name = layout.getClass().getMethod("name");
                        phonetic = "PHONETIC".equals(name.invoke(layout));
                    }
                    mode = new KeyboardMode(sinhala, phonetic, now);
                }
            }
        } catch (Throwable ignored) {
            // Preserve the cached inactive state if this app build changes its field layout.
        }
        synchronized (KEYBOARD_MODES) {
            KEYBOARD_MODES.put(view, mode);
        }
        return mode;
    }

    private static Field findField(Class<?> type, String name) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) { }
        }
        return null;
    }

    private static final class KeyboardMode {
        static final KeyboardMode NONE = new KeyboardMode(false, false, 0L);
        final boolean sinhala;
        final boolean phonetic;
        final long readAt;

        KeyboardMode(boolean sinhala, boolean phonetic, long readAt) {
            this.sinhala = sinhala;
            this.phonetic = phonetic;
            this.readAt = readAt;
        }
    }

    /** Applies the more rounded Gboard-like silhouette to mode and action keys. */
    public static void applyActionKeyStyle(Object viewObject, Object keyObject) {
        if (viewObject == null || keyObject == null) return;
        try {
            Field codesField = keyObject.getClass().getField("codes");
            int[] codes = (int[]) codesField.get(keyObject);
            if (codes == null || codes.length == 0) return;
            int code = codes[0];
            int width = keyObject.getClass().getField("width").getInt(keyObject);
            int height = keyObject.getClass().getField("height").getInt(keyObject);
            // These drawables are shared by every key, so restore the normal
            // rounded-rectangle radius before styling the next key in the loop.
            float radius = (code == -2 || code == 10 || code == 84)
                    ? Math.min(width, height) * 0.36f : 10.0f;
            setDrawableRadius(viewObject, "keyBackground", radius);
            setDrawableRadius(viewObject, "keyBackgroundPressed", radius);
        } catch (Throwable ignored) {
            // The stock drawing path remains available if Lite changes these internals.
        }
    }

    private static void setDrawableRadius(Object viewObject, String fieldName, float radius) throws Exception {
        Field field = viewObject.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        Object drawable = field.get(viewObject);
        if (drawable instanceof GradientDrawable) {
            ((GradientDrawable) drawable).setCornerRadius(radius);
        }
    }

    private static Preference find(PreferenceActivity activity, String key) {
        return activity.findPreference(key);
    }

    private static void setEnabled(Preference preference, boolean enabled) {
        if (preference != null) preference.setEnabled(enabled);
    }

    private static boolean isEnabled(SharedPreferences preferences) {
        return preferences.getBoolean(ENABLED, false);
    }

    private static void updateTransparencyModeSummary(Preference preference, SharedPreferences preferences) {
        preference.setSummary(preferences.getBoolean(TRANSPARENCY_FOLLOWS_THEME, true)
                ? "Follow Helakuru theme" : "Use a custom transparency amount");
    }

    private static void updateBlurModeSummary(Preference preference, String mode) {
        preference.setSummary("behind".equals(mode)
                ? "Blur behind (whole screen)"
                : "Blur within the keyboard window");
    }

    private static void updateColorSummary(Preference preference, SharedPreferences preferences) {
        preference.setSummary("monet".equals(preferences.getString(COLOR_THEME, "monet"))
                ? "Monet" : "Helakuru theme");
    }

    private static void updateNumberSummary(Preference preference, int value, String suffix) {
        preference.setSummary(value + suffix);
    }

    private static void updateKeySizeLabel(TextView label, int value) {
        updateRowValue(label, "Key background size", value + "%");
    }

    private static View settingRow(TextView value) {
        return value.getParent() instanceof View ? (View) value.getParent() : value;
    }

    private static void updateRowValue(TextView label, String title, String value) {
        label.setText(value + "  ›");
        settingRow(label).setContentDescription(title + ", " + value);
    }

    private static TextView findTextControl(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        View found = id == 0 ? null : root.findViewById(id);
        return found instanceof TextView ? (TextView) found : null;
    }

    private static void updateTileColorLabel(TextView label, String selection) {
        updateRowValue(label, "Key tile color", HelakuruLiteAccentChooser.nameForSelection(selection));
    }

    private static void updateTileTransparencyLabel(TextView label, int value) {
        updateRowValue(label, "Key tile transparency", value + "%");
    }

    private static boolean isPressedDrawable(Object viewObject, GradientDrawable drawable) {
        try {
            Field field = viewObject.getClass().getDeclaredField("keyBackgroundPressed");
            field.setAccessible(true);
            return field.get(viewObject) == drawable;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void showSlider(Context context, String title, String suffix, int min, int max,
                                   int current, ValueChanged callback) {
        showSlider(context, title, suffix, min, max, 1, current, callback);
    }

    private static void showSlider(Context context, String title, String suffix, int min, int max,
                                   int step, int current, ValueChanged callback) {
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = Math.round(24 * context.getResources().getDisplayMetrics().density);
        layout.setPadding(padding, padding / 2, padding, 0);
        int safeStep = Math.max(1, step);
        int selectedValue = min + ((clamp(current, min, max) - min + safeStep / 2) / safeStep) * safeStep;

        TextView valueLabel = new TextView(context);
        valueLabel.setText(selectedValue + suffix);
        layout.addView(valueLabel, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        SeekBar seekBar = new SeekBar(context);
        seekBar.setMax((max - min) / safeStep);
        seekBar.setProgress((clamp(current, min, max) - min + safeStep / 2) / safeStep);
        seekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                valueLabel.setText((progress * safeStep + min) + suffix);
            }
            @Override public void onStartTrackingTouch(SeekBar bar) { }
            @Override public void onStopTrackingTouch(SeekBar bar) { }
        });
        layout.addView(seekBar, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle(title)
                .setView(layout)
                .setNegativeButton("Cancel", null)
                .setPositiveButton("Save", (dialogInterface, which) ->
                        callback.changed(seekBar.getProgress() * safeStep + min))
                .create();
        dialog.setOnShowListener(ignored -> applyDialogInsets(dialog));
        dialog.show();
    }

    public static void applyDialogInsets(Dialog dialog) {
        if (dialog == null || dialog.getWindow() == null) return;
        Window window = dialog.getWindow();
        setEdgeToEdge(window);
        applySystemBarAppearance(window, dialog.getContext());
        View content = window.findViewById(android.R.id.content);
        if (content == null) content = window.getDecorView();
        applyInsets(content);
    }

    private static void applyInsets(View insetView) {
        if (insetView == null) return;
        insetView.setOnApplyWindowInsetsListener((view, insets) -> {
            int[] base;
            synchronized (ORIGINAL_PADDING) {
                base = ORIGINAL_PADDING.get(view);
                if (base == null) {
                    base = new int[]{view.getPaddingLeft(), view.getPaddingTop(),
                            view.getPaddingRight(), view.getPaddingBottom()};
                    ORIGINAL_PADDING.put(view, base);
                }
            }
            int left = insets.getSystemWindowInsetLeft();
            int top = insets.getSystemWindowInsetTop();
            int right = insets.getSystemWindowInsetRight();
            int bottom = insets.getSystemWindowInsetBottom();
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets system = insets.getInsets(
                        WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                left = Math.max(left, system.left);
                top = Math.max(top, system.top);
                right = Math.max(right, system.right);
                bottom = Math.max(bottom, system.bottom);
            }
            if (Build.VERSION.SDK_INT >= 28 && insets.getDisplayCutout() != null) {
                left = Math.max(left, insets.getDisplayCutout().getSafeInsetLeft());
                top = Math.max(top, insets.getDisplayCutout().getSafeInsetTop());
                right = Math.max(right, insets.getDisplayCutout().getSafeInsetRight());
                bottom = Math.max(bottom, insets.getDisplayCutout().getSafeInsetBottom());
            }
            view.setPadding(base[0] + left, base[1] + top, base[2] + right, base[3] + bottom);
            return insets;
        });
        insetView.requestApplyInsets();
    }

    private static void applySystemBarAppearance(Window window, Context context) {
        if (window == null || context == null) return;
        boolean lightSurface = (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) != Configuration.UI_MODE_NIGHT_YES;
        View decor = window.getDecorView();
        int flags = decor.getSystemUiVisibility();
        int mask = View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        if (Build.VERSION.SDK_INT >= 26) mask |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        flags &= ~mask;
        if (lightSurface) flags |= mask;
        decor.setSystemUiVisibility(flags);
    }

    private static void setEdgeToEdge(Window window) {
        if (window == null) return;
        window.addFlags(android.view.WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
        window.setStatusBarColor(Color.TRANSPARENT);
        window.setNavigationBarColor(Color.TRANSPARENT);
        if (Build.VERSION.SDK_INT >= 30) {
            window.setDecorFitsSystemWindows(false);
        } else {
            View decor = window.getDecorView();
            decor.setSystemUiVisibility(decor.getSystemUiVisibility()
                    | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION);
        }
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    private static void showSettingsDialog(AlertDialog dialog) {
        dialog.setOnShowListener(ignored -> applyDialogInsets(dialog));
        dialog.show();
    }

    private interface ValueChanged {
        void changed(int value);
    }
}
