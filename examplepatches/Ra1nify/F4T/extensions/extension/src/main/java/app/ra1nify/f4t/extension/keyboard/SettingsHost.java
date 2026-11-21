package app.ra1nify.f4t.extension.keyboard;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

/**
 * Hosts the F4T pages inside the stock COUI preference fragment.
 *
 * The page activity is the stock {@code DocumentEmptyActivity}; the page content is the stock
 * {@code COUIPreferenceWithAppbarFragment}, so the app bar, the list layout and the widgets are all
 * the official COUI ones. Only the preference model is built here.
 */
public final class SettingsHost {
    static final String EXTRA_PAGE = "f4t_page";
    private static final String TAG = "F4T";
    private static final String PAGE_MAIN = "main";
    private static final String PAGE_LIQUID_GLASS = "liquid_glass";
    private static final String PAGE_EFFECTS = "effects";
    private static final String PAGE_SOUNDS = "sounds";
    private static final String PAGE_ENHANCEMENTS = "enhancements";
    private static final String FRAGMENT_TAG = "f4t_page";
    private static final String ABOUT_FRAGMENT = "com.oplus.keyboard.settings.SettingsAboutFragment";
    private static final String PAGE_FRAGMENT =
            "com.oplus.keyboard.settings.SettingsHomeFragment";
    private static final String PREFERENCE_FRAGMENT =
            "com.coui.appcompat.preference.COUIPreferenceFragment";

    /** The page currently being built; set before the fragment is attached. */
    private static volatile String pendingPage;
    /** Title of the page being built, applied once the fragment view exists. */
    private static volatile String pendingTitle;

    private SettingsHost() {
    }

    /** Sets the page the next hosted COUI preference fragment must build. */
    public static void beginPage(String page) {
        pendingPage = page;
    }

    /** Called from the patched DocumentEmptyActivity.onCreate(). */
    public static void onActivityCreated(Activity activity) {
        try {
            Intent intent = activity.getIntent();
            String page = intent == null ? null : intent.getStringExtra(EXTRA_PAGE);
            if (page == null) return;
            // The support FragmentManager is only usable after the activity's own onCreate() has run,
            // and the hook is injected at the start of onCreate(), so defer one message.
            if (activity.getWindow() == null) return;
            activity.getWindow().getDecorView().post(() -> hostPage(activity, page));
        } catch (Throwable error) {
            Log.e(TAG, "could not schedule F4T page", error);
        }
    }

    private static void hostPage(Activity activity, String page) {
        try {
            Object fragmentManager = activity.getClass().getMethod("getSupportFragmentManager")
                    .invoke(activity);
            if (fragmentManager == null) return;
            Method findFragmentByTag = null;
            for (Method method : fragmentManager.getClass().getMethods()) {
                if (method.getName().equals("findFragmentByTag")) {
                    findFragmentByTag = method;
                    break;
                }
            }
            if (findFragmentByTag != null &&
                    findFragmentByTag.invoke(fragmentManager, FRAGMENT_TAG) != null) {
                return;
            }

            pendingPage = page;
            Class<?> fragmentClass = Class.forName(PAGE_FRAGMENT);
            Constructor<?> ctor = fragmentClass.getConstructor();
            Object fragment = ctor.newInstance();

            Class<?> fragmentType = Class.forName("androidx.fragment.app.Fragment");
            Object transaction = fragmentManager.getClass().getMethod("beginTransaction")
                    .invoke(fragmentManager);
            Method replace = null;
            for (Method method : transaction.getClass().getMethods()) {
                if (method.getName().equals("replace") &&
                        method.getParameterTypes().length == 2 &&
                        method.getParameterTypes()[0] == int.class &&
                        method.getParameterTypes()[1].isAssignableFrom(fragmentType)) {
                    replace = method;
                    break;
                }
            }
            if (replace == null) throw new IllegalStateException("no replace(int, Fragment)");
            replace.invoke(transaction, android.R.id.content, fragment);
            transaction.getClass().getMethod("commitAllowingStateLoss").invoke(transaction);
            Log.i(TAG, "hosting F4T page " + page + " in " + PAGE_FRAGMENT);
        } catch (Throwable error) {
            Log.e(TAG, "could not host F4T page", error);
        }
    }

    /** Called from the patched SettingsHomeFragment.onCreatePreferences() at the end. */
    public static void onPreferencesCreated(Object fragment) {
        try {
            Context context = (Context) fragment.getClass().getMethod("getContext").invoke(fragment);
            if (context == null) return;
            Object screen = fragment.getClass().getMethod("getPreferenceScreen").invoke(fragment);
            PageHost.onScreenCreated(fragment, context, screen);
        } catch (Throwable error) {
            Log.e(TAG, "could not capture stock settings screen", error);
        }
    }

    /** Fills the preference screen of any stock settings sub page with one F4T page. */
    public static void buildInto(Object fragment, String page) {
        try {
            Context context = (Context) fragment.getClass().getMethod("getContext").invoke(fragment);
            if (context == null) return;
            Object screen = createScreen(fragment, context);
            if (screen == null) return;
            buildPage(page, context, screen);
            setScreen(fragment, screen);
            pendingTitle = pageTitle(page);
            Log.i(TAG, "F4T page built into stock sub page: " + page);
        } catch (Throwable error) {
            Log.e(TAG, "could not build F4T page into sub page", error);
        }
    }

    private static Object createScreen(Object fragment, Context context) throws Exception {
        Object manager = fragment.getClass().getMethod("getPreferenceManager").invoke(fragment);
        if (manager == null) return null;
        Method create = null;
        for (Method method : manager.getClass().getMethods()) {
            if (method.getName().equals("createPreferenceScreen") &&
                    method.getParameterTypes().length == 1) {
                create = method;
                break;
            }
        }
        return create == null ? null : create.invoke(manager, context);
    }

    private static void setScreen(Object fragment, Object screen) throws Exception {
        for (Method method : fragment.getClass().getMethods()) {
            if (method.getName().equals("setPreferenceScreen") &&
                    method.getParameterTypes().length == 1) {
                method.invoke(fragment, screen);
                return;
            }
        }
    }

    private static void buildPage(String page, Context context, Object screen) {
        switch (page) {
            case PAGE_MAIN:
                buildMain(context, screen);
                break;
            case PAGE_LIQUID_GLASS:
                buildLiquidGlass(context, screen);
                break;
            case PAGE_EFFECTS:
                buildEffects(context, screen);
                break;
            case PAGE_SOUNDS:
                buildSounds(context, screen);
                break;
            case PAGE_ENHANCEMENTS:
                buildEnhancements(context, screen);
                break;
            default:
                buildMain(context, screen);
                break;
        }
    }

    /** Fills an externally created preference screen with one F4T page (route E). */
    public static void fill(Context context, Object screen, String page) {
        buildPage(page, context, screen);
    }

    /** Title of one F4T page. */
    public static String title(String page) {
        return pageTitle(page);
    }

    private static void buildMain(Context context, Object screen) {
        Object limits = category(context, "限制绕过");
        CouiUi.add(screen, limits);
        Object bypass = switchRow(context, "绕过 stock 限制",
                "白名单与深色跟随（需要液态玻璃开启）",
                FeatureSwitches.bypassAllLimitsKey(context), FeatureSwitches.DEFAULT_BYPASS_ENABLED);
        CouiUi.add(screen, bypass);

        buildLiquidGlass(context, screen);
        buildEffects(context, screen);
        buildSounds(context, screen);
        buildEnhancements(context, screen);

        Object about = category(context, "关于");
        CouiUi.add(screen, about);
        CouiUi.add(screen, row(context, "版本", "F4T keyboard debug"));
        CouiUi.add(screen, row(context, "源码", "Ra1nify/F4T"));
    }

    private static void buildLiquidGlass(Context context, Object screen) {
        Object material = category(context, "材质");
        CouiUi.add(screen, material);
        listRow(context, screen, "亮色透明度", "realOS 默认 80%",
                LiquidGlassKeys.KEY_LIGHT_ALPHA, LiquidGlassKeys.ENTRIES, LiquidGlassKeys.ALPHA_VALUES, "80");
        listRow(context, screen, "暗色透明度", "realOS 默认 60%",
                LiquidGlassKeys.KEY_DARK_ALPHA, LiquidGlassKeys.ENTRIES, LiquidGlassKeys.ALPHA_VALUES, "60");

        Object blur = category(context, "模糊");
        CouiUi.add(screen, blur);
        listRow(context, screen, "模糊半径", "realOS 默认 150",
                LiquidGlassKeys.KEY_BLUR_RADIUS, LiquidGlassKeys.BLUR_ENTRIES, LiquidGlassKeys.BLUR_VALUES, "150");
        listRow(context, screen, "底栏圆角", "realOS 默认 28 dp",
                LiquidGlassKeys.KEY_CORNER_RADIUS, LiquidGlassKeys.CORNER_ENTRIES, LiquidGlassKeys.CORNER_VALUES, "28");

        Object keys = category(context, "按键");
        CouiUi.add(screen, keys);
        listRow(context, screen, "按键透明度", "realOS 默认 54%",
                LiquidGlassKeys.KEY_KEY_ALPHA, LiquidGlassKeys.KEY_ALPHA_ENTRIES,
                LiquidGlassKeys.KEY_ALPHA_VALUES, "54");
    }

    private static void buildEffects(Context context, Object screen) {
        CouiUi.add(screen, category(context, "按键特效"));
        listRow(context, screen, "按键光效", "realOS 默认 COLOR_FLASH",
                "f4t_fx_key", new String[]{"COLOR_FLASH", "RING_SPREAD", "NONE"},
                new String[]{"COLOR_FLASH", "RING_SPREAD", "NONE"}, "COLOR_FLASH");
        listRow(context, screen, "键盘光效", "realOS 默认 RING_SPREAD",
                "f4t_fx_board", new String[]{"RING_SPREAD", "NONE"},
                new String[]{"RING_SPREAD", "NONE"}, "RING_SPREAD");
        listRow(context, screen, "动效", "realOS 默认 SPRING_DOWN",
                "f4t_fx_motion", new String[]{"SPRING_DOWN", "NONE"},
                new String[]{"SPRING_DOWN", "NONE"}, "SPRING_DOWN");
    }

    private static void buildSounds(Context context, Object screen) {
        CouiUi.add(screen, category(context, "按键音效"));
        CouiUi.add(screen, switchRow(context, "启用按键音效", "realOS 默认关闭",
                "f4t_sound_enabled", false));
        listRow(context, screen, "音效样式", "realOS 默认 RETRO",
                "f4t_sound_style", new String[]{"RETRO", "MECHANICAL", "SOFT"},
                new String[]{"RETRO", "MECHANICAL", "SOFT"}, "RETRO");
        listRow(context, screen, "音量", "realOS 默认 100%",
                "f4t_sound_volume", new String[]{"20%", "50%", "80%", "100%"},
                new String[]{"20", "50", "80", "100"}, "100");
    }

    private static void buildEnhancements(Context context, Object screen) {
        CouiUi.add(screen, category(context, "增强"));
        CouiUi.add(screen, switchRow(context, "自动填充工具条", "realOS 增强项（引擎未实现）",
                "f4t_autofill_toolbar", false));
        Object note = row(context, "内联建议悬浮条", "宿主缺少 inline API，暂不支持");
        CouiUi.set(note, "setEnabled", false);
        CouiUi.add(screen, note);
    }
    private static void buildPlaceholder(Context context, Object screen, String title, String summary) {
        Object category = category(context, title);
        CouiUi.add(screen, category);
        Object note = row(context, "该页面", summary);
        CouiUi.set(note, "setEnabled", false);
        CouiUi.add(screen, note);
    }

    private static Object category(Context context, String title) {
        Object category = CouiUi.widget(context, "COUIPreferenceCategory");
        CouiUi.set(category, "setTitle", title);
        return category;
    }

    private static Object row(Context context, String title, String summary) {
        Object preference = CouiUi.widget(context, "COUIPreference");
        CouiUi.set(preference, "setTitle", title);
        CouiUi.set(preference, "setSummary", summary);
        return preference;
    }

    private static Object switchRow(Context context, String title, String summary, String key,
                                    boolean defaultValue) {
        Object preference = CouiUi.widget(context, "COUISwitchPreference");
        CouiUi.set(preference, "setTitle", title);
        CouiUi.set(preference, "setSummary", summary);
        CouiUi.set(preference, "setKey", key);
        boolean current = FeatureSwitches.getBooleanValue(context, key, defaultValue);
        CouiUi.set(preference, "setDefaultValue", current);
        CouiUi.set(preference, "setChecked", current);
        CouiUi.mirror(context, preference, key);
        return preference;
    }

    private static void jump(Context context, Object screen, String title, String summary, String page) {
        Object preference = CouiUi.widget(context, "COUIJumpPreference");
        CouiUi.set(preference, "setTitle", title);
        CouiUi.set(preference, "setSummary", summary);
        CouiUi.onClick(preference, page);
        CouiUi.add(screen, preference);
    }

    private static void listRow(Context context, Object screen, String title, String summary,
                                String key, String[] entries, String[] values, String defaultValue) {
        Object preference = CouiUi.widget(context, "COUIListPreference");
        CouiUi.set(preference, "setTitle", title);
        // ListPreference.getSummary() runs String.format() on the summary, so a bare '%' crashes.
        CouiUi.set(preference, "setSummary", summary == null ? null : summary.replace("%", "%%"));
        CouiUi.set(preference, "setKey", key);
        CouiUi.set(preference, "setEntries", (Object) entries);
        CouiUi.set(preference, "setEntryValues", (Object) values);
        String current;
        try {
            current = String.valueOf(FeatureSwitches.getIntValue(
                    context, key, Integer.parseInt(defaultValue)));
        } catch (NumberFormatException ignored) {
            current = FeatureSwitches.getStringValue(context, key, defaultValue);
        }
        CouiUi.set(preference, "setDefaultValue", current);
        CouiUi.set(preference, "setValue", current);
        CouiUi.mirror(context, preference, key);
        CouiUi.add(screen, preference);
    }

    /** Called from the patched SettingsHomeFragment.onViewCreated(). */
    public static void onViewCreated(Object fragment, android.view.View view) {
        // The stock about page adds its own rows after onCreatePreferences, so rebuild once the view
        // exists to make the F4T page the only content.
        if (fragment != null && ABOUT_FRAGMENT.equals(fragment.getClass().getName())) {
            buildInto(fragment, PAGE_MAIN);
        }
        final String title = pendingTitle;
        if (title == null) return;
        pendingTitle = null;
        if (view == null) return;
        view.post(() -> applyTitle(fragment, title));
    }

    private static void applyTitle(Object fragment, String title) {
        try {
            Object toolbar = fragment.getClass().getMethod("getToolbar").invoke(fragment);
            if (toolbar != null) {
                toolbar.getClass().getMethod("setTitle", CharSequence.class).invoke(toolbar, title);
            }
        } catch (Throwable ignored) {
            // The activity title is the fallback when the fragment has no app bar.
        }
    }

    private static String pageTitle(String page) {
        switch (page) {
            case PAGE_LIQUID_GLASS:
                return "液态玻璃";
            case PAGE_EFFECTS:
                return "按键特效";
            case PAGE_SOUNDS:
                return "按键音效";
            case PAGE_ENHANCEMENTS:
                return "增强";
            default:
                return "F4T 设置";
        }
    }

    /** Preference keys and presets of the liquid glass page. */
    static final class LiquidGlassKeys {
        static final String KEY_LIGHT_ALPHA = "f4t_lg_light_alpha";
        static final String KEY_DARK_ALPHA = "f4t_lg_dark_alpha";
        static final String KEY_BLUR_RADIUS = "f4t_lg_blur_radius";
        static final String KEY_CORNER_RADIUS = "f4t_lg_corner_radius";
        static final String KEY_KEY_ALPHA = "f4t_lg_key_alpha";

        static final String[] ENTRIES = {"0%", "20%", "40%", "60%", "80%", "100%"};
        static final String[] ALPHA_VALUES = {"0", "20", "40", "60", "80", "100"};
        static final String[] BLUR_ENTRIES = {"60", "110", "150", "200", "300"};
        static final String[] BLUR_VALUES = {"60", "110", "150", "200", "300"};
        static final String[] CORNER_ENTRIES = {"0 dp", "8 dp", "16 dp", "28 dp", "40 dp"};
        static final String[] CORNER_VALUES = {"0", "8", "16", "28", "40"};
        static final String[] KEY_ALPHA_ENTRIES = {"0%", "20%", "40%", "54%", "80%"};
        static final String[] KEY_ALPHA_VALUES = {"0", "20", "40", "54", "80"};

        private LiquidGlassKeys() {
        }
    }
}
