import os

path = r'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

target = """    public static void enforceHighRefreshRateIme(android.inputmethodservice.InputMethodService service) {
        if (service == null) return;
        try {
            android.app.Dialog dialog = service.getWindow();
            if (dialog != null) {
                Window window = dialog.getWindow();
                if (window != null) {
                    enforceHighRefreshRate(window);
                }
            }
        } catch (Throwable ignored) {
        }
    }"""

replacement = """    public static void enforceHighRefreshRateIme(android.inputmethodservice.InputMethodService service) {
        if (service == null) return;
        try {
            android.app.Dialog dialog = service.getWindow();
            if (dialog != null) {
                Window window = dialog.getWindow();
                if (window != null) {
                    enforceHighRefreshRate(window);
                    applyKeyboardStyling(service, window);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void applyKeyboardStyling(android.inputmethodservice.InputMethodService service, Window window) {
        if (service == null || window == null) return;
        try {
            SharedPreferences boardPrefs = service.getSharedPreferences("gboard_pro_board_ui_prefs", Context.MODE_PRIVATE);
            boolean amoledBlack = boardPrefs.getBoolean("amoled_black_enabled", false);
            if (!amoledBlack) {
                try {
                    amoledBlack = android.preference.PreferenceManager.getDefaultSharedPreferences(service)
                            .getBoolean("amoled_black_enabled", false);
                } catch (Throwable ignored) {
                }
            }

            if (amoledBlack) {
                window.setBackgroundDrawable(new ColorDrawable(0xFF000000));
                View decor = window.getDecorView();
                if (decor != null) {
                    decor.setBackgroundColor(0xFF000000);
                }
            } else {
                SharedPreferences appPrefs = service.getSharedPreferences(PREF_APPEARANCE, Context.MODE_PRIVATE);
                String theme = appPrefs.getString(KEY_UI_THEME, "default");
                if (!"default".equals(theme)) {
                    Palette p = Palette.forContext(service);
                    window.setBackgroundDrawable(new ColorDrawable(p.windowBackground));
                    View decor = window.getDecorView();
                    if (decor != null) {
                        decor.setBackgroundColor(p.windowBackground);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static Drawable createThemeSwatchDrawable(Context context, String themeKey, int sizePx) {
        GradientDrawable gradient = new GradientDrawable();
        gradient.setShape(GradientDrawable.RECTANGLE);
        gradient.setCornerRadius(sizePx / 4.0f);
        gradient.setOrientation(GradientDrawable.Orientation.TL_BR);

        if ("rainbow".equals(themeKey)) {
            gradient.setColors(new int[]{0xFFFF5722, 0xFFFFB74D, 0xFFBA68C8});
        } else if ("botanical".equals(themeKey)) {
            gradient.setColors(new int[]{0xFF00796B, 0xFF43A047, 0xFFC0CA33});
        } else if ("ocean".equals(themeKey)) {
            gradient.setColors(new int[]{0xFF1A237E, 0xFF1E88E5, 0xFF9575CD});
        } else {
            gradient.setColors(new int[]{0xFF006492, 0xFF00897B, 0xFF4DD0E1});
        }

        int strokeColor = 0x33000000;
        gradient.setStroke(dp(context, 1.5f), strokeColor);
        return gradient;
    }"""

norm_content = content.replace('\r\n', '\n')
norm_target = target.replace('\r\n', '\n')
norm_rep = replacement.replace('\r\n', '\n')

if norm_target in norm_content:
    norm_content = norm_content.replace(norm_target, norm_rep, 1)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(norm_content)
    print("GboardM3Helper.java updated successfully!")
else:
    print("Target not found in GboardM3Helper.java")
