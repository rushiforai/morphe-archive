path = r'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java'
with open(path, 'r', encoding='utf-8') as f:
    text = f.read()

target = """    public static void enforceHighRefreshRateIme(android.inputmethodservice.InputMethodService service) {
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
    }"""

replacement = """    public static void enforceHighRefreshRateIme(android.inputmethodservice.InputMethodService service) {
        if (service == null) return;
        try {
            android.app.Dialog dialog = service.getWindow();
            if (dialog != null) {
                Window window = dialog.getWindow();
                if (window != null) {
                    enforceHighRefreshRate(window);
                    // Crucial fix for photo_1_2026-10-29_12-48-19.jpg:
                    // The InputMethodService Window and DecorView cover the ENTIRE screen.
                    // The window MUST ALWAYS have a transparent background so it never blocks
                    // or blacks out the user's application above the keyboard.
                    window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                    View decor = window.getDecorView();
                    if (decor != null) {
                        decor.setBackgroundColor(Color.TRANSPARENT);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static void applyKeyboardStyling(android.inputmethodservice.InputMethodService service, Window window) {
        // Intentionally NO-OP for Window / DecorView background!
        // The IME Window and DecorView span the ENTIRE display. Painting them opaque
        // occludes the host application (WhatsApp, Telegram, browser, etc.).
        // The IME Window must strictly remain transparent.
    }"""

norm_text = text.replace('\r\n', '\n')
norm_target = target.replace('\r\n', '\n')
norm_rep = replacement.replace('\r\n', '\n')

if norm_target in norm_text:
    norm_text = norm_text.replace(norm_target, norm_rep, 1)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(norm_text)
    print("Fixed IME window transparency in GboardM3Helper successfully!")
else:
    print("Target not found in GboardM3Helper!")
