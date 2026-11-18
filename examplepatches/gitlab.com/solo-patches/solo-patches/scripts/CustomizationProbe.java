package app.saketh.webnovel.check;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Bundle;
import android.text.TextPaint;
import android.text.method.PasswordTransformationMethod;
import android.widget.TextView;
import java.lang.reflect.Method;

/** Runs read-only UI/font/color/timer checks in the real target app; never reads accounts or changes preferences. */
public final class CustomizationProbe extends Instrumentation {
    private Throwable failure;
    private String fontCases;
    private String expectedUiMode, expectedReaderMode;
    private boolean themeScope;
    private String expectedThemeMode;
    private String expectedReaderTheme;
    private String expectedAmoled;
    private String expectedDark;
    private boolean readerScreen;
    private boolean timerScope;
    private boolean timerDisabled;
    private Object timerController;
    private int timerProgress;
    private boolean libraryAdsScope;
    private boolean adsHidden;
    private boolean privacyScope;
    private boolean firebaseDisabled;

    @Override public void onCreate(Bundle arguments) {
        super.onCreate(arguments);
        expectedUiMode = arguments.getString("ui_font");
        expectedReaderMode = arguments.getString("reader_font");
        themeScope = !"all".equals(arguments.getString("scope"));
        readerScreen = "reader".equals(arguments.getString("scope"));
        expectedThemeMode = arguments.getString("material_you");
        expectedReaderTheme = arguments.getString("reader_theme");
        expectedAmoled = arguments.getString("amoled");
        expectedDark = arguments.getString("dark");
        timerScope = "timer".equals(arguments.getString("scope"));
        timerDisabled = "disabled".equals(arguments.getString("reward_timer"));
        readerScreen |= timerScope;
        libraryAdsScope = "library".equals(arguments.getString("scope"));
        adsHidden = "hidden".equals(arguments.getString("ads"));
        readerScreen |= libraryAdsScope;
        privacyScope = "privacy".equals(arguments.getString("scope"));
        firebaseDisabled = "disabled".equals(arguments.getString("firebase_analytics"));
        start();
    }

    @Override public void onStart() {
        runOnMainSync(new Runnable() {
            @Override public void run() {
                try { verify(); } catch (Throwable error) { failure = error; }
            }
        });
        if (failure == null && readerScreen) {
            try { verifyReaderScreen(); } catch (Throwable error) { failure = error; }
        }
        if (failure == null && timerScope) {
            android.os.SystemClock.sleep(3000);
            runOnMainSync(() -> {
                try { verifyTimer(false); } catch (Throwable error) { failure = error; }
            });
        }
        String origin = "";
        boolean ownAssertion = false;
        if (failure != null) {
            StackTraceElement[] trace = failure.getStackTrace();
            ownAssertion = failure instanceof AssertionError && trace.length != 0
                    && trace[0].getClassName().equals(getClass().getName());
            if (trace.length != 0) origin = " at " + trace[0].getClassName() + "." + trace[0].getMethodName();
            for (StackTraceElement frame : trace) {
                if (frame.getClassName().equals(getClass().getName())) {
                    origin += " via " + frame.getMethodName() + ":" + frame.getLineNumber();
                    break;
                }
            }
        }
        Bundle result = new Bundle();
        String passed = themeScope ? "PASS: native app/reader palettes, navigation pixels, alpha and saved-preset contracts"
                : "PASS: reader rendering, independent font scopes, icon/password fonts, and theme contracts; " + fontCases;
        if (timerScope) passed = "PASS: live reader reward timer " + (timerDisabled ? "disabled without widget or scheduled ticks" : "native with advancing progress");
        if (libraryAdsScope) passed = "PASS: Library recommendations " + (adsHidden ? "blocked" : "restored") + "; native books and manual check-in remain visible";
        if (privacyScope) passed = "PASS: Firebase Analytics " + (firebaseDisabled ? "deactivated" : "native") + " in installed metadata and actual SDK configuration";
        result.putString("stream", failure == null ? "\n" + passed + "\n"
                : "\nFAIL: " + failure.getClass().getSimpleName()
                    + origin
                    + (ownAssertion ? ": " + failure.getMessage() : "") + "\n");
        finish(failure == null ? Activity.RESULT_OK : Activity.RESULT_CANCELED, result);
    }

    private void verify() throws Exception {
        Context context = getTargetContext();
        ClassLoader loader = context.getClassLoader();
        if (privacyScope) {
            verifyPrivacy(context, loader);
            return;
        }
        Class<?> settings = loader.loadClass("app.saketh.extension.controls.PatchSettings");
        settings.getMethod("initialize", Context.class).invoke(null, context);
        if (libraryAdsScope) {
            require((Boolean) settings.getMethod("hideAds").invoke(null) == adsHidden,
                    "Hide ads choice did not persist");
            return;
        }
        if (timerScope) {
            require((Boolean) settings.getMethod("disableRewardTimer").invoke(null) == timerDisabled,
                    "Reward timer choice did not persist");
            return;
        }
        if (!themeScope) verifyFonts(context, loader);
        verifyTheme(context, loader, settings);
        if (!themeScope) Class.forName("com.qidian.Int.reader.utils.w", true, loader);
    }

    private void verifyPrivacy(Context context, ClassLoader loader) throws Exception {
        Bundle metadata = context.getPackageManager().getApplicationInfo(
                context.getPackageName(), android.content.pm.PackageManager.GET_META_DATA).metaData;
        boolean deactivated = metadata != null && metadata.getBoolean("firebase_analytics_collection_deactivated", false);
        require(deactivated == firebaseDisabled, "Installed Firebase Analytics policy differs from expected build");
        Class<?> engine = loader.loadClass("com.google.android.gms.measurement.internal.zzio");
        Class<?> options = loader.loadClass("com.google.android.gms.internal.measurement.zzdh");
        Object measurement = engine.getMethod("zzp", Context.class, options, Long.class).invoke(null, context, null, null);
        Object configuration = engine.getMethod("zzf").invoke(measurement);
        boolean sdkDeactivated = (Boolean) configuration.getClass().getMethod("zzA").invoke(configuration);
        require(sdkDeactivated == firebaseDisabled, "Actual measurement SDK does not honor the analytics policy");
    }

    private void verifyFonts(Context context, ClassLoader loader) throws Exception {
        Class<?> fonts = loader.loadClass("app.saketh.extension.fonts.FontHooks");
        Class<?> resolver = loader.loadClass("com.qidian.QDReader.utils.q");
        Method ui = fonts.getMethod("uiTypeface", Context.class, Typeface.class);
        Method reader = fonts.getMethod("readerTypeface", Context.class, Typeface.class);
        Typeface sans = Typeface.create("sans-serif", Typeface.NORMAL);
        Typeface expectedUi = (Typeface) ui.invoke(null, context, sans);
        Typeface actualUi = (Typeface) resolver.getMethod("o", Context.class).invoke(null, context);
        require(sameFont(actualUi, expectedUi), "App resolver does not render with the UI font");
        int lora = context.getResources().getIdentifier("lora_regular", "font", context.getPackageName());
        int loraName = context.getResources().getIdentifier("Lora", "string", context.getPackageName());
        Typeface originalReader = context.getResources().getFont(lora);
        Typeface expectedReader = (Typeface) reader.invoke(null, context, originalReader);
        Typeface actualReader = (Typeface) resolver.getMethod("k", Context.class, String.class)
                .invoke(null, context, context.getString(loraName));
        require(sameFont(actualReader, expectedReader), "Reader resolver renders with another font scope");
        Typeface fallback = (Typeface) fonts.getMethod("readerFallbackTypeface", Context.class).invoke(null, context);
        boolean readerCustom = (Boolean) fonts.getMethod("hasCustom", Context.class, boolean.class).invoke(null, context, true);
        boolean uiCustom = (Boolean) fonts.getMethod("hasCustom", Context.class, boolean.class).invoke(null, context, false);
        fontCases = "UI custom=" + uiCustom + ", reader custom=" + readerCustom;
        if (expectedUiMode != null) require(uiCustom == "custom".equals(expectedUiMode), "UI font did not persist across process restart");
        if (expectedReaderMode != null) require(readerCustom == "custom".equals(expectedReaderMode), "Reader font did not persist across process restart");
        if (!readerCustom) require(sameFont(fallback, sans), "UI font leaked into empty reader selection");
        Class<?> paintState = loader.loadClass("vr.a");
        Object state = paintState.getMethod("O").invoke(null);
        if (readerCustom) {
            TextPaint body = (TextPaint) paintState.getMethod("Y").invoke(state);
            require(sameFont(body.getTypeface(), expectedReader), "Actual chapter paint does not use the reader font");
        }
        Method apply = fonts.getMethod("apply", android.view.View.class);
        TextView label = new TextView(context);
        label.setText("Readable chapter title");
        label.setTypeface(sans, Typeface.BOLD_ITALIC);
        Typeface styled = (Typeface) ui.invoke(null, context, label.getTypeface());
        apply.invoke(null, label);
        require(sameFont(label.getTypeface(), styled), "UI font lost requested weight or italic style");
        TextView icon = new TextView(context);
        icon.setText("\ue000");
        icon.setTypeface(Typeface.MONOSPACE);
        apply.invoke(null, icon);
        require(sameFont(icon.getTypeface(), Typeface.MONOSPACE), "Private-use icon font changed");
        TextView password = new TextView(context);
        password.setTransformationMethod(PasswordTransformationMethod.getInstance());
        password.setTypeface(Typeface.MONOSPACE);
        apply.invoke(null, password);
        require(sameFont(password.getTypeface(), Typeface.MONOSPACE), "Password font changed");
    }

    private void verifyTheme(Context context, ClassLoader loader, Class<?> settings) throws Exception {
        Class<?> colors = Class.forName("com.qidian.QDReader.utils.i", true, loader);
        Class<?> theme = loader.loadClass("app.saketh.extension.theme.ThemeHooks");
        Method color = theme.getMethod("color", Context.class, int.class, int.class);
        int primary = context.getResources().getIdentifier("primary_content", "color", context.getPackageName());
        int original = context.getColor(primary);
        int actual = (Integer) color.invoke(null, context, primary, original);
        boolean enabled = (Boolean) settings.getMethod("materialYou").invoke(null);
        if (expectedThemeMode != null) require(enabled == "on".equals(expectedThemeMode), "Material You switch did not persist");
        Class<?> skin = loader.loadClass("skin.support.content.res.SkinCompatResources");
        int nativeSkinColor = (Integer) skin.getMethod("getColor", Context.class, int.class).invoke(null, context, primary);
        Method originalSkinColor = skin.getDeclaredMethod("getSkinColor", Context.class, int.class);
        originalSkinColor.setAccessible(true);
        int baseline = (Integer) originalSkinColor.invoke(skin.getMethod("getInstance").invoke(null), context, primary);
        boolean amoled = (Boolean) settings.getMethod("amoled").invoke(null);
        if (expectedAmoled != null) require(amoled == "on".equals(expectedAmoled), "AMOLED switch did not persist");
        boolean dark = (Boolean) theme.getMethod("isDark").invoke(null);
        if (expectedDark != null) require(dark == "on".equals(expectedDark), "Tracked dark mode differs from --dark");
        boolean black = amoled && dark;
        int surface = context.getResources().getIdentifier("neutral_surface", "color", context.getPackageName());
        if (enabled && android.os.Build.VERSION.SDK_INT >= 31) {
            int palette = context.getResources().getIdentifier("system_accent1_" + (dark ? "200" : "700"), "color", "android");
            require(actual == context.getColor(palette), "Accent does not follow the wallpaper palette");
            require(nativeSkinColor == context.getColor(palette), "Native skin colors bypass the wallpaper palette");
            int background = context.getResources().getIdentifier("neutral_bg", "color", context.getPackageName());
            int backgroundPalette = context.getResources().getIdentifier("system_neutral1_900", "color", "android");
            android.graphics.drawable.Drawable nativeBackground = (android.graphics.drawable.Drawable)
                    loader.loadClass("skin.support.content.res.SkinCompatVectorResources")
                            .getMethod("getDrawableCompat", Context.class, int.class).invoke(null, context, background);
            require(nativeBackground instanceof android.graphics.drawable.ColorDrawable
                    && ((android.graphics.drawable.ColorDrawable) nativeBackground).getColor() == context.getColor(backgroundPalette),
                    "Main-app XML background bypasses the wallpaper palette");
            Method resource = colors.getMethod("g", Context.class, int.class);
            int nativePrimaryId = (Integer) resource.invoke(null, context, primary);
            require(context.getColor(nativePrimaryId) == context.getColor(palette), "Native resource-ID colors bypass the wallpaper palette");
            int border = context.getResources().getIdentifier("neutral_border", "color", context.getPackageName());
            int nativeSurface = (Integer) resource.invoke(null, context, surface);
            int nativeBorder = (Integer) resource.invoke(null, context, border);
            Object rounded = loader.loadClass("com.qidian.QDReader.utils.u1")
                    .getMethod("d", float.class, float.class, int.class, int.class).invoke(null, 1f, 12f, nativeBorder, nativeSurface);
            int surfacePalette = context.getResources().getIdentifier("system_neutral1_" + (dark ? "900" : "10"), "color", "android");
            require(((android.graphics.drawable.GradientDrawable) rounded).getColor().getDefaultColor()
                    == (black ? 0xff000000 : context.getColor(surfacePalette)), "Native rounded backgrounds still use stock colors");
        } else {
            require(actual == original, "Disabled theme changed an app color");
            require(nativeSkinColor == baseline, "Disabled theme did not restore the native skin color");
        }
        int surfaceColor = (Integer) skin.getMethod("getColor", Context.class, int.class).invoke(null, context, surface);
        int surfaceId = (Integer) theme.getMethod("resourceId", int.class).invoke(null, surface);
        if (black) {
            require(surfaceColor == 0xff000000, "AMOLED dark theme left the native background gray");
            require(context.getColor(surfaceId) == 0xff000000, "AMOLED dark theme left resource-ID backgrounds gray");
            int bar = context.getResources().getIdentifier("bottomBar_color_surface", "color", context.getPackageName());
            require((Integer) skin.getMethod("getColor", Context.class, int.class).invoke(null, context, bar) == 0xff000000,
                    "AMOLED dark theme left the bottom bar gray");
            int card = context.getResources().getIdentifier("neutral_surface_medium", "color", context.getPackageName());
            int cardColor = (Integer) skin.getMethod("getColor", Context.class, int.class).invoke(null, context, card);
            require(cardColor != 0xff000000 && (enabled && android.os.Build.VERSION.SDK_INT >= 31
                    || cardColor == (Integer) originalSkinColor.invoke(skin.getMethod("getInstance").invoke(null), context, card)),
                    "AMOLED dark theme changed card surfaces");
        } else if (!enabled || android.os.Build.VERSION.SDK_INT < 31) {
            require(surfaceColor == (Integer) originalSkinColor.invoke(skin.getMethod("getInstance").invoke(null), context, surface)
                    && surfaceId == surface, "Background changed outside AMOLED dark mode");
        }
        verifyNavigation(context, loader, enabled && android.os.Build.VERSION.SDK_INT >= 31,
                (Boolean) theme.getMethod("isDark").invoke(null));
        boolean readerEnabled = expectedReaderTheme != null ? "on".equals(expectedReaderTheme)
                : (Boolean) settings.getMethod("readerMaterialYou").invoke(null);
        verifyReader(context, loader, enabled && readerEnabled && android.os.Build.VERSION.SDK_INT >= 31, amoled);
        int border = context.getResources().getIdentifier("neutral_border", "color", context.getPackageName());
        require((Integer) theme.getMethod("resourceId", int.class).invoke(null, border) == border, "Translucent border became an opaque system color");
        int translucent = (Integer) color.invoke(null, context, border, 0x40224466);
        require((translucent >>> 24) == 0x40, "Theme changed input alpha");
        ColorStateList selector = new ColorStateList(new int[][]{new int[]{android.R.attr.state_pressed}, new int[0]}, new int[]{0xffff0000, 0xff0000ff});
        ColorStateList result = (ColorStateList) theme.getMethod("stateList", Context.class, int.class, ColorStateList.class).invoke(null, context, primary, selector);
        require(result.getColorForState(new int[]{android.R.attr.state_pressed}, 0) == 0xffff0000
                && result.getDefaultColor() == 0xff0000ff, "Pressed/default color selector states changed");
    }

    private void verifyReaderScreen() throws Exception {
        Context context = getTargetContext();
        ClassLoader loader = context.getClassLoader();
        Class<?> tracker = loader.loadClass("com.qidian.Int.reader.utils.a");
        Object activities = tracker.getField("a").get(null);
        Method foreground = tracker.getMethod("g");
        int bookId = context.getResources().getIdentifier("bookNameTxt", "id", context.getPackageName());
        int libraryId = context.getResources().getIdentifier("tabLibrary", "id", context.getPackageName());
        boolean[] opened = {false};
        android.graphics.Rect visible = new android.graphics.Rect();
        boolean[] selected = {false};
        String[] mainState = {"not resumed"};
        // Library-only checks bypass the unrelated native splash-ad duration when Hide ads is off.
        startActivitySync(new android.content.Intent().setClassName(context.getPackageName(),
                libraryAdsScope ? "com.qidian.Int.reader.MainActivity" : "com.qidian.Int.reader.SplashActivity")
                .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK));
        for (int attempt = 0; attempt < 40 && !opened[0] && failure == null; attempt++) {
            waitForIdleSync();
            runOnMainSync(() -> {
                try {
                    Activity current = (Activity) foreground.invoke(activities);
                    mainState[0] = current == null ? "no foreground activity"
                            : current.getClass().getName() + " focus=" + current.hasWindowFocus()
                                + " libraryTab=" + (current.findViewById(libraryId) != null)
                                + " visibleBook=" + (visibleView(current.getWindow().getDecorView(), bookId, visible) != null);
                    if (current == null || !current.hasWindowFocus()
                            || !current.getClass().getName().equals("com.qidian.Int.reader.MainActivity")) return;
                    if (!selected[0]) {
                        android.view.View library = current.findViewById(libraryId);
                        if (library == null) return;
                        selected[0] = library.performClick();
                        return;
                    }
                    if (libraryAdsScope) {
                        opened[0] = visibleView(current.getWindow().getDecorView(), bookId, visible) != null;
                        return;
                    }
                    android.view.View book = visibleView(current.getWindow().getDecorView(), bookId, visible);
                    while (book != null && !book.hasOnClickListeners()) {
                        android.view.ViewParent parent = book.getParent();
                        book = parent instanceof android.view.View ? (android.view.View) parent : null;
                    }
                    if (book != null) opened[0] = book.performClick();
                } catch (Throwable error) { failure = error; }
            });
            if (!opened[0]) android.os.SystemClock.sleep(100);
        }
        if (failure != null) return;
        require(opened[0], "Library navigation was not ready: " + mainState[0]);
        if (libraryAdsScope) {
            android.os.SystemClock.sleep(5000);
            runOnMainSync(() -> {
                try {
                    Activity current = (Activity) foreground.invoke(activities);
                    require(current != null && current.hasWindowFocus()
                            && current.getClass().getName().equals("com.qidian.Int.reader.MainActivity"),
                            "Library ad check needs the focused main screen");
                    android.view.View root = current.getWindow().getDecorView();
                    for (String name : new String[]{"recommend_message", "recommendTv"}) {
                        int id = context.getResources().getIdentifier(name, "id", context.getPackageName());
                        require((visibleView(root, id, new android.graphics.Rect()) == null) == adsHidden,
                                "Library recommendation visibility does not match Hide ads: " + name);
                    }
                    require(visibleView(root, bookId, new android.graphics.Rect()) != null,
                            "Native Library books are no longer visible");
                    int checkIn = context.getResources().getIdentifier("gift_txt", "id", context.getPackageName());
                    require(visibleView(root, checkIn, new android.graphics.Rect()) != null,
                            "Manual Library check-in is no longer visible");
                } catch (Throwable error) { failure = error; }
            });
            return;
        }
        boolean[] checked = {false};
        String[] liveState = {"no reader activity"};
        int dragId = context.getResources().getIdentifier("reader_theme_dragbg", "id", context.getPackageName());
        int scrollId = context.getResources().getIdentifier("reader_theme_bg", "id", context.getPackageName());
        for (int attempt = 0; attempt < 60 && !checked[0] && failure == null; attempt++) {
            waitForIdleSync();
            runOnMainSync(() -> {
                try {
                    Activity current = (Activity) foreground.invoke(activities);
                    liveState[0] = current == null ? "no foreground activity" : current.getClass().getName();
                    if (current == null || !current.getClass().getName().equals("com.qidian.Int.reader.wengine.NewWReaderActivity")) return;
                    TextView body = visibleReaderText(current.getWindow().getDecorView());
                    android.view.View background = current.findViewById(dragId);
                    if (background == null) background = current.findViewById(scrollId);
                    liveState[0] += " body=" + (body != null) + " background=" + (background != null);
                    if (body == null || background == null || background.getBackground() == null) return;
                    if (timerScope) {
                        verifyTimer(true);
                        checked[0] = true;
                        return;
                    }
                    Class<?> preferences = loader.loadClass("com.qidian.QDReader.components.setting.QDReaderUserSetting");
                    Object saved = preferences.getMethod("getInstance").invoke(null);
                    boolean night = (Integer) preferences.getMethod("v").invoke(saved) == 1;
                    boolean enabled = (Boolean) loader.loadClass("app.saketh.extension.controls.PatchSettings")
                            .getMethod("readerMaterialYou").invoke(null);
                    boolean amoled = (Boolean) loader.loadClass("app.saketh.extension.controls.PatchSettings")
                            .getMethod("amoled").invoke(null);
                    int expectedText = enabled ? readerRole(context, night, "on_surface") : (Integer) loader.loadClass("wp.d")
                            .getMethod("a", Context.class, int.class).invoke(null, current,
                                    context.getResources().getIdentifier("reader_color_text", "color", context.getPackageName()));
                    int expectedBackground = amoled && night ? 0xff000000 : enabled ? readerRole(context, night, "surface") : night ? context.getColor(context.getResources()
                            .getIdentifier("reader_color_background_night", "color", context.getPackageName()))
                            : (Integer) preferences.getMethod("j").invoke(saved);
                    require(body.getCurrentTextColor() == expectedText, "Actual visible reader text retains the wrong palette");
                    int actualBackground = background.getBackground() instanceof android.graphics.drawable.ColorDrawable
                            ? ((android.graphics.drawable.ColorDrawable) background.getBackground()).getColor() : 0;
                    require(actualBackground == expectedBackground, "Actual visible reader page retains the wrong background: "
                            + Integer.toHexString(actualBackground) + " expected " + Integer.toHexString(expectedBackground));
                    checked[0] = true;
                } catch (Throwable error) { failure = error; }
            });
            if (!checked[0]) android.os.SystemClock.sleep(100);
        }
        if (failure == null) require(checked[0], "Live reader views were not ready: " + liveState[0]);
    }

    private void verifyTimer(boolean first) throws Exception {
        Context context = getTargetContext();
        ClassLoader loader = context.getClassLoader();
        Class<?> tracker = loader.loadClass("com.qidian.Int.reader.utils.a");
        Activity reader = (Activity) tracker.getMethod("g").invoke(tracker.getField("a").get(null));
        require(reader != null && reader.hasWindowFocus()
                && reader.getClass().getName().equals("com.qidian.Int.reader.wengine.NewWReaderActivity"),
                "Timer check needs the focused native reader");
        java.lang.reflect.Field field = reader.getClass().getDeclaredField("I");
        field.setAccessible(true);
        Object controller = field.get(reader);
        Class<?> scheduler = loader.loadClass("com.qidian.QDReader.utils.g0");
        java.lang.reflect.Field intervals = scheduler.getDeclaredField("f");
        intervals.setAccessible(true);
        java.util.Map<?, ?> tasks = (java.util.Map<?, ?>) intervals.get(null);
        boolean scheduled = tasks.keySet().stream()
                .anyMatch(key -> key.toString().startsWith("NewWReaderActivity_u_"));
        int iconId = context.getResources().getIdentifier("iconReward", "id", context.getPackageName());
        android.view.View icon = reader.findViewById(iconId);
        if (timerDisabled) {
            require(controller == null && !scheduled && (icon == null || !icon.isShown()),
                    "Disabled reader still owns reward controller, widget or repeating ticks");
            if (first) {
                for (String name : new String[]{"v2", "updateFarmingReward"}) {
                    Method entry = reader.getClass().getDeclaredMethod(name);
                    entry.setAccessible(true);
                    entry.invoke(reader);
                }
                require(field.get(reader) == null, "Native reward refresh recreated a disabled timer");
            }
        } else {
            require(controller != null && scheduled && icon != null && icon.isShown(),
                    "Native reward widget or scheduled timer did not return");
            java.lang.reflect.Field ring = controller.getClass().getDeclaredField("i");
            ring.setAccessible(true);
            Object progressView = ring.get(controller);
            int progress = (Integer) progressView.getClass().getMethod("getProgress").invoke(progressView);
            if (first) {
                timerController = controller;
                timerProgress = progress;
            } else {
                require(controller == timerController && progress != timerProgress,
                        "Native reward progress did not advance");
            }
        }
    }

    private static android.view.View visibleView(android.view.View view, int id, android.graphics.Rect bounds) {
        if (!view.isShown()) return null;
        if (view.getId() == id && view.getGlobalVisibleRect(bounds) && !bounds.isEmpty()) return view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                android.view.View found = visibleView(group.getChildAt(index), id, bounds);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static TextView visibleReaderText(android.view.View view) {
        if (!view.isShown()) return null;
        if (view.getClass().getName().equals("com.yuewen.webnovel.wengine.view.WTextView")) return (TextView) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                TextView found = visibleReaderText(group.getChildAt(index));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static int readerRole(Context context, boolean night, String role) {
        String name;
        if (android.os.Build.VERSION.SDK_INT >= 34) {
            name = "system_" + role + (night ? "_dark" : "_light");
        } else {
            String palette = "on_surface_variant".equals(role) ? "neutral2" : "neutral1";
            int tone = "surface".equals(role) ? (night ? 900 : 10)
                    : "on_surface".equals(role) ? (night ? 100 : 900) : (night ? 200 : 700);
            name = "system_" + palette + "_" + tone;
        }
        return context.getColor(context.getResources().getIdentifier(name, "color", "android"));
    }

    private void verifyReader(Context context, ClassLoader loader, boolean enabled, boolean amoled) throws Exception {
        Class<?> preferences = loader.loadClass("com.qidian.QDReader.components.setting.QDReaderUserSetting");
        Object saved = preferences.getMethod("getInstance").invoke(null);
        boolean night = (Integer) preferences.getMethod("v").invoke(saved) == 1;
        int savedBackground = (Integer) preferences.getMethod("j").invoke(saved);
        int savedText = (Integer) preferences.getMethod("p").invoke(saved);
        int background = amoled && night ? 0xff000000 : enabled ? readerRole(context, night, "surface") : savedBackground;
        int text = enabled ? readerRole(context, night, "on_surface") : savedText;
        Class<?> configuration = loader.loadClass("i30.g$a");
        Object provider = null;
        for (java.lang.reflect.Field field : loader.loadClass("i30.g").getFields()) {
            if (field.getType() == configuration && java.lang.reflect.Modifier.isStatic(field.getModifiers())) {
                provider = field.get(null);
            }
        }
        require(provider != null, "Native reader text provider missing");
        int visibleText = (Integer) configuration.getMethod("i", Context.class).invoke(provider, context);
        Class<?> skin = loader.loadClass("skin.support.content.res.SkinCompatResources");
        Method baselineColor = skin.getDeclaredMethod("getSkinColor", Context.class, int.class);
        baselineColor.setAccessible(true);
        int readerTextId = context.getResources().getIdentifier("reader_color_text", "color", context.getPackageName());
        int nativeText = (Integer) baselineColor.invoke(skin.getMethod("getInstance").invoke(null), context, readerTextId);
        require(visibleText == (enabled ? text : nativeText), "Visible reader text bypasses Material You or does not restore stock");
        Class<?> paintState = loader.loadClass("vr.a");
        paintState.getMethod("A0").invoke(null);
        Object state = paintState.getMethod("O").invoke(null);
        require((Integer) paintState.getMethod("g").invoke(state) == background,
                "Reader canvas background bypasses its palette");
        require(((TextPaint) paintState.getMethod("Y").invoke(state)).getColor() == (enabled ? text : savedText),
                "Reader canvas text bypasses its palette");
        android.widget.FrameLayout page = new android.widget.FrameLayout(context);
        page.addView(new android.widget.ImageView(context));
        Class<?> backgrounds = loader.loadClass("f30.a$a");
        Object backgroundProvider = null;
        for (java.lang.reflect.Field field : loader.loadClass("f30.a").getFields()) {
            if (field.getType() == backgrounds && java.lang.reflect.Modifier.isStatic(field.getModifiers())) {
                backgroundProvider = field.get(null);
            }
        }
        backgrounds.getMethod("i", android.widget.FrameLayout.class, Integer.class).invoke(backgroundProvider, page, 6);
        if (enabled || amoled && night) {
            require(page.getChildCount() == 0 && page.getBackground() instanceof android.graphics.drawable.ColorDrawable
                    && ((android.graphics.drawable.ColorDrawable) page.getBackground()).getColor() == background,
                    "Reader page artwork or saved color overrides Material You or AMOLED");
        }
        Context styled = new android.view.ContextThemeWrapper(context,
                context.getResources().getIdentifier("AppTheme_day", "style", context.getPackageName()));
        Class<?> headerType = loader.loadClass("com.yuewen.webnovel.wengine.view.WQDHeaderView");
        android.view.View header = (android.view.View) headerType.getConstructor(Context.class, boolean.class).newInstance(styled, false);
        headerType.getMethod("g").invoke(header);
        int titleId = context.getResources().getIdentifier("chapterNameTv", "id", context.getPackageName());
        TextView title = header.findViewById(titleId);
        int mediumId = context.getResources().getIdentifier("reader_color_text_medium", "color", context.getPackageName());
        int nativeMedium = (Integer) baselineColor.invoke(skin.getMethod("getInstance").invoke(null), context, mediumId);
        int muted = enabled ? readerRole(context, night, "on_surface_variant") : nativeMedium;
        require(title != null && title.getCurrentTextColor() == (enabled ? muted : nativeMedium),
                "Actual reader header did not adopt or restore its palette");
        if (enabled || amoled && night) {
            require(header.getBackground() instanceof android.graphics.drawable.ColorDrawable
                    && ((android.graphics.drawable.ColorDrawable) header.getBackground()).getColor() == background,
                    "Reader header background does not match its page");
        }
        require((Integer) skin.getMethod("getColor", Context.class, int.class).invoke(null, context, mediumId) == nativeMedium,
                "Reader-specific tint changed the shared reward-caption color");
        require((Integer) preferences.getMethod("j").invoke(saved) == savedBackground
                && (Integer) preferences.getMethod("p").invoke(saved) == savedText, "Reader theme overwrote saved native preset colors");
    }

    private void verifyNavigation(Context context, ClassLoader loader, boolean enabled, boolean dark) throws Exception {
        int style = context.getResources().getIdentifier("AppTheme_day", "style", context.getPackageName());
        Context styled = new android.view.ContextThemeWrapper(context, style);
        Class<?> type = loader.loadClass("com.qidian.Int.reader.view.MainPageTabItemView");
        android.view.View tab = (android.view.View) type.getConstructor(Context.class, android.util.AttributeSet.class)
                .newInstance(styled, null);
        android.widget.ImageView icon = tab.findViewById(0x7f0a09ac);
        Method select = type.getMethod("o", boolean.class);
        Method resource = loader.loadClass("com.qidian.QDReader.utils.i").getMethod("h", int.class);
        for (boolean active : new boolean[]{true, false}) {
            select.invoke(tab, active);
            int id = context.getResources().getIdentifier(active ? "bottom_bar_library_active" : "bottom_bar_library",
                    "drawable", context.getPackageName());
            android.graphics.drawable.Drawable expected = styled.getDrawable((Integer) resource.invoke(null, id)).mutate();
            if (enabled) {
                int palette = context.getResources().getIdentifier(
                        "system_" + (active ? "accent1_" + (dark ? "200" : "700") : "neutral1_" + (dark ? "50" : "900")),
                        "color", "android");
                expected.setTint(context.getColor(palette));
                TextView label = tab.findViewById(context.getResources().getIdentifier("tv", "id", context.getPackageName()));
                require((label.getCurrentTextColor() & 0xffffff) == (context.getColor(palette) & 0xffffff),
                        "Main navigation label bypasses the wallpaper palette");
            }
            Bitmap expectedPixels = raster(expected);
            require(expectedPixels.sameAs(raster(icon.getDrawable())), "Main navigation icon keeps stock colors or loses path alpha");
            type.getMethod("updateColor").invoke(tab);
            require(expectedPixels.sameAs(raster(icon.getDrawable())), "Navigation refresh loses its selected/inactive palette");
        }
    }

    private static Bitmap raster(android.graphics.drawable.Drawable drawable) {
        Bitmap image = Bitmap.createBitmap(96, 96, Bitmap.Config.ARGB_8888);
        drawable.setBounds(0, 0, 96, 96);
        drawable.draw(new Canvas(image));
        return image;
    }

    private static boolean sameFont(Typeface left, Typeface right) {
        if (left == null || right == null) return left == right;
        String sample = "Ag MW il 0123456789 αβ ñé";
        TextPaint first = new TextPaint(TextPaint.ANTI_ALIAS_FLAG);
        TextPaint second = new TextPaint(TextPaint.ANTI_ALIAS_FLAG);
        first.setTypeface(left); second.setTypeface(right);
        first.setTextSize(32); second.setTextSize(32);
        if (Float.compare(first.measureText(sample), second.measureText(sample)) != 0) return false;
        Bitmap a = Bitmap.createBitmap(1000, 120, Bitmap.Config.ARGB_8888);
        Bitmap b = Bitmap.createBitmap(1000, 120, Bitmap.Config.ARGB_8888);
        try {
            new Canvas(a).drawText(sample, 0, 60, first);
            new Canvas(b).drawText(sample, 0, 60, second);
            return a.sameAs(b);
        } finally {
            a.recycle(); b.recycle();
        }
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
