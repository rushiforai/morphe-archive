package app.template.extension.alza;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class AlzaPriceChartInjector {
    private static final String TAG = "MorpheAlza";
    public static final String CHART_VIEW_TAG = "MORPHE_HLIDAC_CHART";
    public static final String BUTTON_VIEW_TAG = "MORPHE_BENEFIT_BUTTON";

    public static final String PREFS_NAME = "morphe_alza_prefs";
    public static final String PREF_COMPACT_MODE = "compact_mode";
    public static final String PREF_CHART_MODE = "chart_display_mode";
    public static final int CHART_MODE_OFF = 0;     // Graf úplně vypnutý
    public static final int CHART_MODE_LARGE = 1;   // Velký graf pod cenou (s možností sbalit)
    public static final int CHART_MODE_COMPACT = 2; // Kompaktní graf vedle ceny (skryje HomeCredit)
    public static final String PREF_SHOW_BENEFIT_PRICES = "show_benefit_prices";
    public static final String PREF_USE_FXALZA = "use_fxalza_links";
    public static final String PREF_CLEAN_SHARED_LINKS = "clean_shared_links";
    public static final String PREF_PROMO_ALZAPLUS = "benefit_promo_alzaplus";
    public static final String PREF_PROMO_CASHBACK = "benefit_promo_cashback";
    public static final String PREF_PROMO_TRADE_IN = "benefit_promo_trade_in";
    public static final String PREF_ALWAYS_SHOW_ALL_TIERS = "benefit_always_show_all";

    // Application context reference for SharedPreferences
    private static volatile Context sAppContext = null;
    private static volatile Boolean sCompactModeCache = null;
    private static volatile WeakReference<Activity> sCurrentActivity = null;
    private static volatile boolean sLifecycleRegistered = false;

    // Market / Country detection
    private static volatile String sExplicitCurrency = null;
    private static volatile String sDetectedDomain = null;
    private static volatile String sDetectedCurrency = null;
    private static volatile boolean sIsCountrySupported = true;

    // Dynamic bindings populated by patch fingerprints (no hardcoded obfuscated names)
    private static volatile String sAndroidViewClass = null;
    private static volatile String sAndroidViewMethod = null;
    private static volatile String sFunction1Class = null;
    private static volatile Method sAndroidViewResolvedMethod = null;
    private static volatile Object sFactoryProxy = null;
    private static volatile Object sUpdateProxy = null;
    private static volatile Object sButtonFactoryProxy = null;
    private static volatile Object sButtonUpdateProxy = null;
    private static volatile Object sSettingsFactoryProxy = null;
    private static volatile ClassLoader sLastClassLoader = null;

    // Price History patch enabled flag
    private static volatile boolean sPriceHistoryPatchEnabled = false;

    // Benefit Prices patch enabled flag
    private static volatile boolean sBenefitPricesPatchEnabled = false;

    // FxAlza patch enabled flag
    private static volatile boolean sFxAlzaPatchEnabled = false;

    // Captured product info
    private static volatile String activeCommodityId = null;
    private static volatile String activeProductName = null;
    private static volatile String sActivePrimaryPriceText = null;
    private static volatile String sActiveHeaderText = null;
    private static volatile boolean sHasDiscountBox = false;
    private static volatile WeakReference<Object> lastGodFragment = new WeakReference<Object>(null);
    private static volatile WeakReference<Object> sLastProductGodFragment = new WeakReference<Object>(null);

    public static String getActiveCommodityId() {
        return activeCommodityId;
    }

    public static String getActiveProductName() {
        return activeProductName;
    }

    public static void setActiveProductName(String name) {
        if (name != null && !name.trim().isEmpty()) {
            activeProductName = name.trim();
        }
    }

    public static String getActivePrimaryPriceText() {
        return sActivePrimaryPriceText;
    }

    public static String getActiveHeaderText() {
        return sActiveHeaderText;
    }

    public static boolean hasDiscountBox() {
        return sHasDiscountBox;
    }

    public static void enablePriceHistoryPatch() {
        sPriceHistoryPatchEnabled = true;
        Log.i(TAG, "enablePriceHistoryPatch: sPriceHistoryPatchEnabled=true");
    }

    public static void setPriceHistoryPatchEnabled(boolean enabled) {
        sPriceHistoryPatchEnabled = enabled;
        Log.i(TAG, "setPriceHistoryPatchEnabled: " + enabled);
    }

    public static boolean isPriceHistoryPatchEnabled() {
        return sPriceHistoryPatchEnabled;
    }

    public static int getChartMode() {
        if (!sPriceHistoryPatchEnabled) {
            return CHART_MODE_OFF;
        }
        Context ctx = getApplicationContext();
        if (ctx != null) {
            try {
                SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                if (prefs.contains(PREF_CHART_MODE)) {
                    return prefs.getInt(PREF_CHART_MODE, CHART_MODE_LARGE);
                }
                if (prefs.contains(PREF_COMPACT_MODE)) {
                    boolean wasCompact = prefs.getBoolean(PREF_COMPACT_MODE, false);
                    return wasCompact ? CHART_MODE_COMPACT : CHART_MODE_LARGE;
                }
            } catch (Throwable t) {
                Log.w(TAG, "getChartMode error reading prefs", t);
            }
        }
        return CHART_MODE_LARGE;
    }

    public static void setChartMode(int mode) {
        Context ctx = getApplicationContext();
        if (ctx != null) {
            try {
                ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        .edit()
                        .putInt(PREF_CHART_MODE, mode)
                        .putBoolean(PREF_COMPACT_MODE, mode == CHART_MODE_COMPACT)
                        .apply();
            } catch (Throwable t) {
                Log.w(TAG, "setChartMode error saving prefs", t);
            }
        }
    }

    public static boolean isChartVisible() {
        return sPriceHistoryPatchEnabled && getChartMode() != CHART_MODE_OFF;
    }

    /**
     * Unloads the currently active product and dismisses its GodFragment so that
     * navigating to Home returns to the main screen rather than an outdated product.
     */
    public static void unloadActiveProduct() {
        unloadActiveProduct(null);
    }

    public static void unloadActiveProduct(final Context callerContext) {
        activeCommodityId = null;
        activeProductName = null;
        sActivePrimaryPriceText = null;
        sActiveHeaderText = null;
        sHasDiscountBox = false;

        final Object productGodObj = (sLastProductGodFragment != null) ? sLastProductGodFragment.get() : null;
        sLastProductGodFragment = new WeakReference<Object>(null);
        lastGodFragment = new WeakReference<Object>(null);

        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                try {
                    int totalPopped = 0;
                    Activity act = (callerContext != null) ? findActivity(callerContext) : null;
                    if (act == null) {
                        act = getCurrentActivity();
                    }

                    // 1. Immediately update any attached views in the window decorView
                    if (act != null) {
                        updateAllAttachedViews(act);
                    }

                    // 2. Direct pop on productGodObj's FragmentManager
                    if (productGodObj != null) {
                        Object fm = getFieldValue(productGodObj, "mFragmentManager");
                        if (fm != null) {
                            int safety = 20;
                            while (getBackStackCount(fm) > 0 && safety-- > 0) {
                                if (popBackStackImmediate(fm)) {
                                    totalPopped++;
                                } else {
                                    break;
                                }
                            }
                        }
                    }

                    // 3. Search through Activity's FragmentManager hierarchy
                    if (act != null) {
                        Object actFm = null;
                        try {
                            Method mGetSupportFm = act.getClass().getMethod("getSupportFragmentManager");
                            actFm = mGetSupportFm.invoke(act);
                        } catch (Throwable ignored) {}
                        if (actFm == null) {
                            Object mFragments = getFieldValue(act, "mFragments");
                            if (mFragments != null) {
                                Object s = getFieldValue(mFragments, "a");
                                if (s != null) {
                                    actFm = getFieldValue(s, "d");
                                }
                            }
                        }

                        if (actFm != null) {
                            List<Object> actFrags = getFragmentsFromFm(actFm);
                            for (Object f : actFrags) {
                                if (f == null) continue;
                                String cName = f.getClass().getName();
                                if (cName.contains("BottomBarFragment")) {
                                    Object bottomChildFm = getChildFragmentManager(f);
                                    if (bottomChildFm != null) {
                                        List<Object> tabFrags = getFragmentsFromFm(bottomChildFm);
                                        for (Object tabFrag : tabFrags) {
                                            if (tabFrag == null) continue;
                                            String tabName = tabFrag.getClass().getName();
                                            if (tabName.contains("RootHostFragment")) {
                                                if (!isMenuTab(tabFrag)) {
                                                    Object tabFm = getChildFragmentManager(tabFrag);
                                                    if (tabFm != null) {
                                                        int bsCount = getBackStackCount(tabFm);
                                                        int safety = 20;
                                                        while (getBackStackCount(tabFm) > 0 && safety-- > 0) {
                                                            if (popBackStackImmediate(tabFm)) {
                                                                totalPopped++;
                                                            } else {
                                                                break;
                                                            }
                                                        }
                                                        Log.i(TAG, "RootHostFragment tab " + getFieldValue(tabFrag, "mTag")
                                                                + " bsCount was " + bsCount + ", popped down to " + getBackStackCount(tabFm));
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Log.i(TAG, "unloadActiveProduct finished, totalPopped=" + totalPopped);
                } catch (Throwable t) {
                    Log.w(TAG, "Error in unloadActiveProduct: " + t.getMessage(), t);
                }
            }
        });
    }

    private static Activity findActivity(Context context) {
        Context cur = context;
        while (cur instanceof ContextWrapper) {
            if (cur instanceof Activity) {
                return (Activity) cur;
            }
            cur = ((ContextWrapper) cur).getBaseContext();
        }
        return null;
    }

    private static boolean isMenuTab(Object tabFrag) {
        if (tabFrag == null) return false;
        try {
            Object tag = getFieldValue(tabFrag, "mTag");
            if (tag != null) {
                String tagStr = tag.toString();
                if (tagStr.contains("1346564") || tagStr.toLowerCase().contains("menu") || tagStr.toLowerCase().contains("account")) {
                    return true;
                }
            }
        } catch (Throwable ignored) {}
        try {
            Object args = getFieldValue(tabFrag, "mArguments");
            if (args != null) {
                String str = args.toString();
                if (str.contains("account") || str.contains("CustomerAccountDestination") || str.contains("analyticsName=menu") || str.contains("1346564")) {
                    return true;
                }
            }
        } catch (Throwable ignored) {}
        return false;
    }

    private static Field findField(Class<?> clazz, String fieldName) {
        Class<?> cur = clazz;
        while (cur != null && !cur.equals(Object.class)) {
            try {
                Field f = cur.getDeclaredField(fieldName);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException e) {
                cur = cur.getSuperclass();
            }
        }
        return null;
    }

    private static Object getFieldValue(Object target, String fieldName) {
        if (target == null) return null;
        try {
            Field f = findField(target.getClass(), fieldName);
            if (f != null) return f.get(target);
        } catch (Throwable ignored) {}
        return null;
    }

    private static List<Object> getFragmentsFromFm(Object fm) {
        List<Object> result = new ArrayList<Object>();
        if (fm == null) return result;
        // 1. Standard getFragments()
        try {
            Method m = fm.getClass().getMethod("getFragments");
            Object obj = m.invoke(fm);
            if (obj instanceof List) {
                for (Object o : (List<?>) obj) {
                    if (o != null) result.add(o);
                }
                if (!result.isEmpty()) return result;
            }
        } catch (Throwable ignored) {}
        // 2. Field c (c0) on y
        try {
            Object c0 = getFieldValue(fm, "c");
            if (c0 != null) {
                try {
                    Method mE = c0.getClass().getMethod("e");
                    Object eRes = mE.invoke(c0);
                    if (eRes instanceof List) {
                        for (Object o : (List<?>) eRes) {
                            if (o != null) result.add(o);
                        }
                        if (!result.isEmpty()) return result;
                    }
                } catch (Throwable ignored) {}
                try {
                    Method mF = c0.getClass().getMethod("f");
                    Object fRes = mF.invoke(c0);
                    if (fRes instanceof List) {
                        for (Object o : (List<?>) fRes) {
                            if (o != null) result.add(o);
                        }
                        if (!result.isEmpty()) return result;
                    }
                } catch (Throwable ignored) {}
                Object aObj = getFieldValue(c0, "a");
                if (aObj instanceof List) {
                    for (Object o : (List<?>) aObj) {
                        if (o != null) result.add(o);
                    }
                    if (!result.isEmpty()) return result;
                }
            }
        } catch (Throwable ignored) {}
        // 3. Fallback: field a on y
        try {
            Object aObj = getFieldValue(fm, "a");
            if (aObj instanceof List) {
                for (Object o : (List<?>) aObj) {
                    if (o != null) result.add(o);
                }
            }
        } catch (Throwable ignored) {}
        return result;
    }

    private static Object getChildFragmentManager(Object fragment) {
        if (fragment == null) return null;
        try {
            Method m = fragment.getClass().getMethod("getChildFragmentManager");
            Object res = m.invoke(fragment);
            if (res != null) return res;
        } catch (Throwable ignored) {}
        return getFieldValue(fragment, "mChildFragmentManager");
    }

    private static int getBackStackCount(Object fm) {
        if (fm == null) return 0;
        try {
            Method mG = fm.getClass().getMethod("G");
            return ((Integer) mG.invoke(fm)).intValue();
        } catch (Throwable ignored) {}
        try {
            Method m = fm.getClass().getMethod("getBackStackEntryCount");
            return ((Integer) m.invoke(fm)).intValue();
        } catch (Throwable ignored) {}
        try {
            Object dObj = getFieldValue(fm, "d");
            if (dObj instanceof List) {
                return ((List<?>) dObj).size();
            }
        } catch (Throwable ignored) {}
        return 0;
    }

    private static boolean popBackStackImmediate(Object fm) {
        if (fm == null) return false;
        try {
            // Reset state saved flags H and I on y so it doesn't throw IllegalStateException
            try {
                Field fH = findField(fm.getClass(), "H");
                if (fH != null) fH.setBoolean(fm, false);
                Field fI = findField(fm.getClass(), "I");
                if (fI != null) fI.setBoolean(fm, false);
            } catch (Throwable ignored) {}

            // Try Q() (obfuscated popBackStackImmediate)
            try {
                Method mQ = fm.getClass().getMethod("Q");
                Object res = mQ.invoke(fm);
                if (Boolean.TRUE.equals(res)) return true;
            } catch (Throwable ignored) {}

            // Try popBackStackImmediate()
            try {
                Method m = fm.getClass().getMethod("popBackStackImmediate");
                Object res = m.invoke(fm);
                if (Boolean.TRUE.equals(res)) return true;
            } catch (Throwable ignored) {}

            // Try popBackStack()
            try {
                Method m = fm.getClass().getMethod("popBackStack");
                m.invoke(fm);
                return true;
            } catch (Throwable ignored) {}
        } catch (Throwable t) {
            Log.w(TAG, "popBackStackImmediate failed: " + t.getMessage());
        }
        return false;
    }

    public static void updateAllAttachedViews(Activity activity) {
        if (activity == null) return;
        try {
            View decor = activity.getWindow().getDecorView();
            updateViewsRecursively(decor);
        } catch (Throwable t) {
            Log.w(TAG, "updateAllAttachedViews error: " + t.getMessage());
        }
    }

    private static void updateViewsRecursively(View v) {
        if (v == null) return;
        Object tag = v.getTag();
        if (CHART_VIEW_TAG.equals(tag) && v instanceof PriceHistoryChartView) {
            PriceHistoryChartView chart = (PriceHistoryChartView) v;
            boolean visible = isChartVisible();
            chart.setVisibility(visible ? View.VISIBLE : View.GONE);
            chart.requestLayout();
            chart.invalidate();
            if (visible && chart.getData() == null && chart.getCommodityId() != null) {
                fetchData(chart, chart.getCommodityId(), null, activeProductName);
            }
        } else if (BUTTON_VIEW_TAG.equals(tag) && v instanceof BenefitPricesButtonView) {
            BenefitPricesButtonView btn = (BenefitPricesButtonView) v;
            boolean visible = isBenefitPricesButtonVisible();
            btn.setVisibility(visible ? View.VISIBLE : View.GONE);
            btn.requestLayout();
            btn.invalidate();
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                updateViewsRecursively(vg.getChildAt(i));
            }
        }
    }

    public static void setBenefitPricesPatchEnabled(boolean enabled) {
        sBenefitPricesPatchEnabled = enabled;
        Log.i(TAG, "setBenefitPricesPatchEnabled: " + enabled);
    }

    public static boolean isBenefitPricesPatchEnabled() {
        return sBenefitPricesPatchEnabled;
    }

    public static void setFxAlzaPatchEnabled(boolean enabled) {
        sFxAlzaPatchEnabled = enabled;
        Log.i(TAG, "setFxAlzaPatchEnabled: " + enabled);
    }

    public static boolean isFxAlzaPatchEnabled() {
        return sFxAlzaPatchEnabled;
    }

    public static boolean isBenefitPricesButtonVisible() {
        if (!sBenefitPricesPatchEnabled) return false;
        Context ctx = sAppContext;
        if (ctx != null) {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            return prefs.getBoolean(PREF_SHOW_BENEFIT_PRICES, true);
        }
        return true;
    }

    public static void setBenefitPricesButtonVisible(boolean visible) {
        Context ctx = sAppContext;
        if (ctx != null) {
            ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean(PREF_SHOW_BENEFIT_PRICES, visible)
                    .apply();
        }
    }

    public static boolean isFxAlzaLinksEnabled() {
        if (!sFxAlzaPatchEnabled) return false;
        Context ctx = getApplicationContext();
        if (ctx != null) {
            try {
                return ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        .getBoolean(PREF_USE_FXALZA, true);
            } catch (Throwable ignored) {}
        }
        return true;
    }

    public static void setFxAlzaLinksEnabled(boolean enabled) {
        Context ctx = getApplicationContext();
        if (ctx != null) {
            try {
                ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        .edit()
                        .putBoolean(PREF_USE_FXALZA, enabled)
                        .apply();
            } catch (Throwable ignored) {}
        }
    }

    public static boolean isCleanSharedLinksEnabled() {
        if (!sFxAlzaPatchEnabled) return false;
        Context ctx = getApplicationContext();
        if (ctx != null) {
            try {
                return ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        .getBoolean(PREF_CLEAN_SHARED_LINKS, true);
            } catch (Throwable ignored) {}
        }
        return true;
    }

    public static void setCleanSharedLinksEnabled(boolean enabled) {
        Context ctx = getApplicationContext();
        if (ctx != null) {
            try {
                ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                        .edit()
                        .putBoolean(PREF_CLEAN_SHARED_LINKS, enabled)
                        .apply();
            } catch (Throwable ignored) {}
        }
    }

    public static String rewriteUrlToFxAlzaIfEnabled(String text) {
        if (text == null) return null;
        if (!isFxAlzaLinksEnabled()) return text;
        String result = text.replaceAll("https?://(?:www\\.|m\\.)?alza\\.cz/([^\\s\"'<>]+)", "https://fxalza.cz/$1");
        result = result.replaceAll("https?://(?:www\\.|m\\.)?alza\\.sk/([^\\s\"'<>]+)", "https://sk.fxalza.cz/$1");
        return result;
    }

    public static String processSharedText(String text) {
        if (text == null) return null;
        String result = text;
        if (isCleanSharedLinksEnabled()) {
            result = result.replaceAll("(?i)\\.?\\s*(?:A s členstvom|A s členstvím|And with an?|Und mit einer?|AlzaPlus\\+ tagsággal).*$", "");
            result = result.replaceAll("(?i)^(?:Odesláno z aplikace Alza|Odoslané z aplikácie Alza|Sent from Alza app|Abgeschickt von der Alza-App|Alza alkalmazásból küldve|Отправлено из приложения Alza|Надіслаno з додатку Alza):\\s*", "");
            result = result.trim();
        }
        if (isFxAlzaLinksEnabled()) {
            result = rewriteUrlToFxAlzaIfEnabled(result);
        }
        return result;
    }

    public static boolean isAlzaPlusPromosEnabled() {
        Context ctx = sAppContext;
        if (ctx != null) {
            return ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .getBoolean(PREF_PROMO_ALZAPLUS, true);
        }
        return true;
    }

    public static void setAlzaPlusPromosEnabled(boolean enabled) {
        Context ctx = sAppContext;
        if (ctx != null) {
            ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean(PREF_PROMO_ALZAPLUS, enabled)
                    .apply();
        }
    }

    public static boolean isCashbackPromosEnabled() {
        Context ctx = sAppContext;
        if (ctx != null) {
            return ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .getBoolean(PREF_PROMO_CASHBACK, true);
        }
        return true;
    }

    public static void setCashbackPromosEnabled(boolean enabled) {
        Context ctx = sAppContext;
        if (ctx != null) {
            ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean(PREF_PROMO_CASHBACK, enabled)
                    .apply();
        }
    }

    public static boolean isTradeInPromosEnabled() {
        Context ctx = sAppContext;
        if (ctx != null) {
            return ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .getBoolean(PREF_PROMO_TRADE_IN, true);
        }
        return true;
    }

    public static void setTradeInPromosEnabled(boolean enabled) {
        Context ctx = sAppContext;
        if (ctx != null) {
            ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean(PREF_PROMO_TRADE_IN, enabled)
                    .apply();
        }
    }

    public static boolean isAlwaysShowAllTiersEnabled() {
        Context ctx = sAppContext;
        if (ctx != null) {
            return ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .getBoolean(PREF_ALWAYS_SHOW_ALL_TIERS, true);
        }
        return true;
    }

    public static void setAlwaysShowAllTiersEnabled(boolean enabled) {
        Context ctx = sAppContext;
        if (ctx != null) {
            ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean(PREF_ALWAYS_SHOW_ALL_TIERS, enabled)
                    .apply();
        }
    }

    /**
     * Initialized by bytecode hook with names discovered by Morphe fingerprints.
     */
    public static void initComposeBindings(String androidViewClass, String androidViewMethod, String function1Class) {
        sAndroidViewClass = androidViewClass;
        sAndroidViewMethod = androidViewMethod;
        sFunction1Class = function1Class;
        Log.i(TAG, "initComposeBindings: androidView=" + sAndroidViewClass + "." + sAndroidViewMethod + ", function1=" + sFunction1Class);
    }

    public static void initComposeClass(String androidViewClass) {
        sAndroidViewClass = androidViewClass;
        Log.i(TAG, "initComposeClass: androidView=" + sAndroidViewClass);
    }

    public static Context getApplicationContext() {
        if (sAppContext != null) return sAppContext;
        try {
            Class<?> atClass = Class.forName("android.app.ActivityThread");
            Method m = atClass.getMethod("currentApplication");
            Context app = (Context) m.invoke(null);
            if (app != null) {
                setApplicationContext(app);
                return sAppContext;
            }
        } catch (Throwable ignored) {}
        return sAppContext;
    }

    public static void setApplicationContext(Context context) {
        if (context != null) {
            if (sAppContext == null) {
                sAppContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            }
            if (sAppContext instanceof Application && !sLifecycleRegistered) {
                sLifecycleRegistered = true;
                ((Application) sAppContext).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                    @Override public void onActivityResumed(Activity activity) { sCurrentActivity = new WeakReference<>(activity); }
                    @Override public void onActivityCreated(Activity activity, Bundle savedInstanceState) { sCurrentActivity = new WeakReference<>(activity); }
                    @Override public void onActivityStarted(Activity activity) { sCurrentActivity = new WeakReference<>(activity); }
                    @Override public void onActivityPaused(Activity activity) {}
                    @Override public void onActivityStopped(Activity activity) {}
                    @Override public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}
                    @Override public void onActivityDestroyed(Activity activity) {
                        if (sCurrentActivity != null && sCurrentActivity.get() == activity) {
                            sCurrentActivity = null;
                        }
                    }
                });
            }
            if (isSlovakLocale(context)) {
                if (sExplicitCurrency == null) {
                    sDetectedDomain = "alza.sk";
                    sDetectedCurrency = "€";
                    sIsCountrySupported = true;
                }
            }
        }
    }

    public static Activity getCurrentActivity() {
        if (sCurrentActivity != null) {
            Activity act = sCurrentActivity.get();
            if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                return act;
            }
        }
        return findTopActivity();
    }

    private static Activity findTopActivity() {
        try {
            Class<?> atClass = Class.forName("android.app.ActivityThread");
            Method currentAtMethod = atClass.getMethod("currentActivityThread");
            Object at = currentAtMethod.invoke(null);
            Field mActivitiesField = atClass.getDeclaredField("mActivities");
            mActivitiesField.setAccessible(true);
            Map<?, ?> mActivities = (Map<?, ?>) mActivitiesField.get(at);
            if (mActivities != null) {
                for (Object activityRecord : mActivities.values()) {
                    Field pausedField = activityRecord.getClass().getDeclaredField("paused");
                    pausedField.setAccessible(true);
                    if (!pausedField.getBoolean(activityRecord)) {
                        Field activityField = activityRecord.getClass().getDeclaredField("activity");
                        activityField.setAccessible(true);
                        Activity top = (Activity) activityField.get(activityRecord);
                        if (top != null) {
                            sCurrentActivity = new WeakReference<>(top);
                            return top;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    public static boolean isSlovak() {
        return isSlovak(sAppContext);
    }

    public static boolean isSlovak(Context context) {
        if ("€".equals(sExplicitCurrency) || "alza.sk".equalsIgnoreCase(sDetectedDomain)) {
            return true;
        }
        if ("Kč".equals(sExplicitCurrency) || "alza.cz".equalsIgnoreCase(sDetectedDomain)) {
            return false;
        }
        return isSlovakLocale(context != null ? context : sAppContext);
    }

    public static boolean isSlovakLocale(Context context) {
        if (context != null) {
            try {
                Resources res = context.getResources();
                if (res != null) {
                    Configuration conf = res.getConfiguration();
                    if (conf != null) {
                        Locale loc = null;
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && conf.getLocales() != null && !conf.getLocales().isEmpty()) {
                            loc = conf.getLocales().get(0);
                        } else {
                            loc = conf.locale;
                        }
                        if (loc != null) {
                            String lang = loc.getLanguage();
                            String country = loc.getCountry();
                            if ("sk".equalsIgnoreCase(lang) || "SK".equalsIgnoreCase(country)) {
                                return true;
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {}
        }
        try {
            Locale def = Locale.getDefault();
            if (def != null) {
                if ("sk".equalsIgnoreCase(def.getLanguage()) || "SK".equalsIgnoreCase(def.getCountry())) {
                    return true;
                }
            }
        } catch (Throwable ignored) {}
        return false;
    }

    /**
     * Checks if Compact Mode is enabled.
     * In Compact Mode: HomeCredit/alternative price is removed, and chart is smaller.
     */
    public static boolean isCompactMode() {
        return getChartMode() == CHART_MODE_COMPACT;
    }

    public static void setCompactMode(boolean compact) {
        setChartMode(compact ? CHART_MODE_COMPACT : CHART_MODE_LARGE);
    }

    public static String getDetectedDomain() {
        if ("alza.sk".equalsIgnoreCase(sDetectedDomain) || "€".equals(sExplicitCurrency) || isSlovak()) {
            return "alza.sk";
        }
        return "alza.cz";
    }

    public static String getDetectedCurrency() {
        if ("€".equals(sExplicitCurrency) || "alza.sk".equalsIgnoreCase(sDetectedDomain) || isSlovak()) {
            return "€";
        }
        return "Kč";
    }

    public static boolean isCountrySupported() {
        return sIsCountrySupported;
    }

    /**
     * Intercepts ProductPrices.getAlternativePrice().
     * In Compact Mode, returns null to eliminate the entire HomeCredit / installments block.
     * In normal mode, returns the original alternative price without field reflection.
     * Also detects market and currency from ProductPrices.
     */
    public static Object filterAlternativePrice(Object productPrices, Object originalAltPrice) {
        if (productPrices != null) {
            detectMarketFromPrices(productPrices);
            extractCommodityFromPrices(productPrices);
            extractPriceTagInfo(productPrices);
        }
        if (isPriceHistoryPatchEnabled() && isCompactMode()) {
            Log.i(TAG, "filterAlternativePrice: Compact mode active -> eliminating HomeCredit (returning null)");
            return null;
        }
        return originalAltPrice;
    }

    public static void extractPriceTagInfo(Object productPrices) {
        if (productPrices == null) return;
        try {
            // 1. Primary price text
            Method mGetPrice = null;
            try {
                mGetPrice = productPrices.getClass().getMethod("getPrice");
            } catch (Throwable ignored) {}

            Object priceObj = (mGetPrice != null) ? mGetPrice.invoke(productPrices) : null;
            if (priceObj != null) {
                try {
                    Method mPrimary = priceObj.getClass().getMethod("getPrimaryPrice");
                    Object primary = mPrimary.invoke(priceObj);
                    if (primary != null) {
                        sActivePrimaryPriceText = primary.toString().trim();
                    }
                } catch (Throwable ignored) {}
            }

            if (sActivePrimaryPriceText == null || sActivePrimaryPriceText.isEmpty()) {
                try {
                    Method mPrimary = productPrices.getClass().getMethod("getPrimaryPrice");
                    Object primary = mPrimary.invoke(productPrices);
                    if (primary != null) {
                        sActivePrimaryPriceText = primary.toString().trim();
                    }
                } catch (Throwable ignored) {}
            }

            // 2. Detect discount box ("ZLEVŇENO", action badge, beforePrice, claimedDiscount, etc.)
            boolean hasBox = false;
            String pricesStr = productPrices.toString().toLowerCase(Locale.ROOT);
            String priceObjStr = (priceObj != null) ? priceObj.toString().toLowerCase(Locale.ROOT) : "";

            if (pricesStr.contains("zlevněno") || pricesStr.contains("zlevneno") || pricesStr.contains("zľavnené") || pricesStr.contains("zlavnene") ||
                pricesStr.contains("action") || pricesStr.contains("discount") || pricesStr.contains("friday") || pricesStr.contains("sleva") ||
                pricesStr.contains("beforeprice") || pricesStr.contains("originalprice") ||
                priceObjStr.contains("beforeprice") || priceObjStr.contains("originalprice") ||
                priceObjStr.contains("discount") || priceObjStr.contains("action") || priceObjStr.contains("friday")) {
                hasBox = true;
            }

            // Expand candidate objects to inspect (1 level deep)
            List<Object> scanObjects = new ArrayList<>();
            scanObjects.add(productPrices);
            if (priceObj != null) scanObjects.add(priceObj);

            for (Object root : new Object[]{ productPrices, priceObj }) {
                if (root == null) continue;
                for (Method m : root.getClass().getMethods()) {
                    if (m.getParameterTypes().length == 0) {
                        Class<?> ret = m.getReturnType();
                        if (!ret.isPrimitive() && !ret.getName().startsWith("android.")
                                && !ret.getName().startsWith("java.lang.String") && !ret.getName().startsWith("java.lang.Number")) {
                            String mName = m.getName().toLowerCase(Locale.ROOT);
                            if (mName.contains("badge") || mName.contains("action") || mName.contains("discount")
                                    || mName.contains("label") || mName.contains("header") || mName.contains("promotion")
                                    || mName.contains("tag") || mName.contains("campaign") || mName.contains("price")) {
                                try {
                                    Object sub = m.invoke(root);
                                    if (sub != null && !scanObjects.contains(sub)) {
                                        scanObjects.add(sub);
                                    }
                                } catch (Throwable ignored) {}
                            }
                        }
                    }
                }
                for (Field f : root.getClass().getFields()) {
                    Class<?> fType = f.getType();
                    if (!fType.isPrimitive() && !fType.getName().startsWith("android.")
                            && !fType.getName().startsWith("java.lang.String") && !fType.getName().startsWith("java.lang.Number")) {
                        String fName = f.getName().toLowerCase(Locale.ROOT);
                        if (fName.contains("badge") || fName.contains("action") || fName.contains("discount")
                                || fName.contains("label") || fName.contains("header") || fName.contains("promotion")
                                || fName.contains("tag") || fName.contains("campaign") || fName.contains("price")) {
                            try {
                                Object sub = f.get(root);
                                if (sub != null && !scanObjects.contains(sub)) {
                                    scanObjects.add(sub);
                                }
                            } catch (Throwable ignored) {}
                        }
                    }
                }
            }

            for (Object obj : scanObjects) {
                if (obj == null) continue;
                for (Method m : obj.getClass().getMethods()) {
                    if (m.getParameterTypes().length == 0) {
                        String mname = m.getName().toLowerCase(Locale.ROOT);
                        if (mname.contains("before") || mname.contains("original") || mname.contains("discount")
                                || mname.contains("action") || mname.contains("badge") || mname.contains("claim")) {
                            try {
                                Object val = m.invoke(obj);
                                if (val != null) {
                                    if (val instanceof Number && ((Number) val).doubleValue() > 0) {
                                        hasBox = true;
                                    } else if (val instanceof String && !((String) val).isEmpty()) {
                                        hasBox = true;
                                    } else if (val instanceof Boolean && ((Boolean) val).booleanValue()) {
                                        hasBox = true;
                                    }
                                }
                            } catch (Throwable ignored) {}
                        }
                    }
                }
            }

            // 3. Extract longest header/badge/discount text (e.g. "BLACK FRIDAY -30 %", "ZLEVŇENO -8 %")
            String longestHeader = null;
            for (Object obj : scanObjects) {
                if (obj == null) continue;
                for (Method m : obj.getClass().getMethods()) {
                    if (m.getParameterTypes().length == 0 && m.getReturnType().equals(String.class)) {
                        String mname = m.getName().toLowerCase(Locale.ROOT);
                        try {
                            Object res = m.invoke(obj);
                            if (res instanceof String) {
                                String str = ((String) res).trim();
                                if (!str.isEmpty() && !str.equals(sActivePrimaryPriceText)) {
                                    String lower = str.toLowerCase(Locale.ROOT);
                                    if (str.contains("%") || mname.contains("label") || mname.contains("header")
                                            || mname.contains("title") || mname.contains("discount") || mname.contains("badge")
                                            || mname.contains("action") || mname.contains("text")) {
                                        if (str.contains("%") || lower.contains("zlevn") || lower.contains("friday")
                                                || lower.contains("akce") || lower.contains("black") || lower.contains("sleva")) {
                                            hasBox = true;
                                        }
                                        if (longestHeader == null || str.length() > longestHeader.length()) {
                                            longestHeader = str;
                                        }
                                    }
                                }
                            }
                        } catch (Throwable ignored) {}
                    }
                }
                for (Field f : obj.getClass().getFields()) {
                    if (f.getType().equals(String.class)) {
                        String fname = f.getName().toLowerCase(Locale.ROOT);
                        try {
                            Object res = f.get(obj);
                            if (res instanceof String) {
                                String str = ((String) res).trim();
                                if (!str.isEmpty() && !str.equals(sActivePrimaryPriceText)) {
                                    String lower = str.toLowerCase(Locale.ROOT);
                                    if (str.contains("%") || fname.contains("label") || fname.contains("header")
                                            || fname.contains("title") || fname.contains("discount") || fname.contains("badge")) {
                                        if (str.contains("%") || lower.contains("zlevn") || lower.contains("friday")
                                                || lower.contains("akce") || lower.contains("black") || lower.contains("sleva")) {
                                            hasBox = true;
                                        }
                                        if (longestHeader == null || str.length() > longestHeader.length()) {
                                            longestHeader = str;
                                        }
                                    }
                                }
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }

            // Also scan productPrices.toString() with regex for patterns like "BLACK FRIDAY -30 %" or "-8 %"
            try {
                String fullStr = productPrices.toString();
                java.util.regex.Pattern p = java.util.regex.Pattern.compile("(?i)([A-ZÁ-Ž0-9\\-\\s]{2,25}\\s*-[0-9]{1,2}\\s*%)");
                java.util.regex.Matcher matcher = p.matcher(fullStr);
                if (matcher.find()) {
                    String found = matcher.group(1).trim();
                    if (longestHeader == null || found.length() > longestHeader.length()) {
                        longestHeader = found;
                        hasBox = true;
                    }
                }
            } catch (Throwable ignored) {}
            sActiveHeaderText = longestHeader;
            sHasDiscountBox = hasBox;
            Log.i(TAG, "extractPriceTagInfo: primaryPrice=" + sActivePrimaryPriceText + ", headerText=" + sActiveHeaderText + ", hasDiscountBox=" + sHasDiscountBox);
        } catch (Throwable t) {
            Log.w(TAG, "extractPriceTagInfo error: " + t.getMessage());
        }
    }

    public static void extractCommodityFromPrices(Object productPrices) {
        if (productPrices == null) return;
        if (activeCommodityId != null && !activeCommodityId.isEmpty() && !activeCommodityId.equals("0")) return;
        try {
            for (Method m : productPrices.getClass().getMethods()) {
                if (m.getParameterTypes().length == 0) {
                    String mname = m.getName().toLowerCase();
                    if (mname.contains("productid") || mname.contains("commodityid") || mname.equals("getid")) {
                        try {
                            Object res = m.invoke(productPrices);
                            if (res instanceof Number && ((Number) res).intValue() > 0) {
                                String id = String.valueOf(((Number) res).intValue());
                                if (activeCommodityId == null || !activeCommodityId.equals(id)) {
                                    activeCommodityId = id;
                                    Log.i(TAG, "extractCommodityFromPrices: captured id=" + id + " from method " + m.getName());
                                }
                                return;
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }

            String str = productPrices.toString();
            java.util.regex.Matcher matcher = java.util.regex.Pattern.compile("(?:/product/|productId=|-d)([0-9]{4,9})").matcher(str);
            if (matcher.find()) {
                String id = matcher.group(1);
                if (activeCommodityId == null || !activeCommodityId.equals(id)) {
                    activeCommodityId = id;
                    Log.i(TAG, "extractCommodityFromPrices: captured id=" + id + " from toString");
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "extractCommodityFromPrices error: " + t.getMessage());
        }
    }

    public static void detectMarketFromPrices(Object productPrices) {
        if (productPrices == null) return;
        try {
            String str = productPrices.toString();
            if (str.contains("€")) {
                sExplicitCurrency = "€";
                sDetectedCurrency = "€";
                sDetectedDomain = "alza.sk";
                sIsCountrySupported = true;
                return;
            } else if (str.contains("Kč") || str.contains("Kc")) {
                sExplicitCurrency = "Kč";
                sDetectedCurrency = "Kč";
                sDetectedDomain = "alza.cz";
                sIsCountrySupported = true;
                return;
            }

            Method mGetPrice = productPrices.getClass().getMethod("getPrice");
            Object priceObj = mGetPrice.invoke(productPrices);
            if (priceObj != null) {
                String pStr = priceObj.toString();
                if (pStr.contains("€")) {
                    sExplicitCurrency = "€";
                    sDetectedCurrency = "€";
                    sDetectedDomain = "alza.sk";
                    sIsCountrySupported = true;
                    return;
                } else if (pStr.contains("Kč") || pStr.contains("Kc")) {
                    sExplicitCurrency = "Kč";
                    sDetectedCurrency = "Kč";
                    sDetectedDomain = "alza.cz";
                    sIsCountrySupported = true;
                    return;
                }

                Method mPrimary = priceObj.getClass().getMethod("getPrimaryPrice");
                Object primary = mPrimary.invoke(priceObj);
                String primaryStr = primary != null ? primary.toString() : "";
                if (primaryStr.contains("€")) {
                    sExplicitCurrency = "€";
                    sDetectedCurrency = "€";
                    sDetectedDomain = "alza.sk";
                    sIsCountrySupported = true;
                    return;
                } else if (primaryStr.contains("Kč") || primaryStr.contains("Kc")) {
                    sExplicitCurrency = "Kč";
                    sDetectedCurrency = "Kč";
                    sDetectedDomain = "alza.cz";
                    sIsCountrySupported = true;
                    return;
                }
            }
        } catch (Throwable ignored) {}
    }

    /**
     * Hooked on ProductDetailParams$WithId constructor to capture product ID cleanly.
     */
    public static void onProductDetailParams(int productId, Object productInfo) {
        try {
            if (productId > 0) {
                String newId = String.valueOf(productId);
                if (!newId.equals(activeCommodityId)) {
                    sExplicitCurrency = null;
                    sActivePrimaryPriceText = null;
                    sActiveHeaderText = null;
                    sHasDiscountBox = false;
                    activeProductName = null;
                }
                activeCommodityId = newId;
                if (productInfo != null) {
                    try {
                        Method m = productInfo.getClass().getMethod("getName");
                        Object name = m.invoke(productInfo);
                        if (name != null) {
                            activeProductName = name.toString();
                        }
                    } catch (Throwable ignored) {}
                }
                Log.i(TAG, "onProductDetailParams: Captured product id=" + activeCommodityId + ", name=" + activeProductName);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in onProductDetailParams", t);
        }
    }

    /**
     * Hooked on ProductDetailParams$WithMeta constructor to capture product ID and market from Meta.
     */
    public static void onProductDetailParamsWithMeta(Object meta, Object productInfo) {
        try {
            if (meta != null) {
                try {
                    Method mh = meta.getClass().getMethod("getHref");
                    Object href = mh.invoke(meta);
                    if (href != null) {
                        String hrefStr = href.toString();
                        java.util.regex.Matcher matcher = java.util.regex.Pattern.compile("(?:/product/|productId=|-d)([0-9]{4,9})").matcher(hrefStr);
                        if (matcher.find()) {
                            String newId = matcher.group(1);
                            if (!newId.equals(activeCommodityId)) {
                                sExplicitCurrency = null;
                                sActivePrimaryPriceText = null;
                                sActiveHeaderText = null;
                                sHasDiscountBox = false;
                                activeProductName = null;
                            }
                            activeCommodityId = newId;
                        }
                        if (hrefStr.contains(".sk") || hrefStr.contains("/sk/")) {
                            sExplicitCurrency = "€";
                            sDetectedDomain = "alza.sk";
                            sDetectedCurrency = "€";
                            sIsCountrySupported = true;
                        } else if (hrefStr.contains(".cz") || hrefStr.contains("/cz/")) {
                            sExplicitCurrency = "Kč";
                            sDetectedDomain = "alza.cz";
                            sDetectedCurrency = "Kč";
                            sIsCountrySupported = true;
                        } else if (hrefStr.contains(".hu") || hrefStr.contains("/hu/") ||
                                   hrefStr.contains(".de") || hrefStr.contains("/de/") ||
                                   hrefStr.contains(".at") || hrefStr.contains("/at/") ||
                                   hrefStr.contains(".co.uk") || hrefStr.contains("/uk/")) {
                            sIsCountrySupported = false;
                        } else {
                            sIsCountrySupported = true;
                        }
                    }
                } catch (Throwable ignored) {}
            }
            if (productInfo != null) {
                try {
                    Method m = productInfo.getClass().getMethod("getName");
                    Object name = m.invoke(productInfo);
                    if (name != null) {
                        activeProductName = name.toString();
                    }
                } catch (Throwable ignored) {}
            }
            Log.i(TAG, "onProductDetailParamsWithMeta: Captured product id=" + activeCommodityId + ", name=" + activeProductName);
        } catch (Throwable t) {
            Log.e(TAG, "Error in onProductDetailParamsWithMeta", t);
        }
    }

    /**
     * Lightweight hook on GodFragment.onCreateView entry to keep a weak reference for fallback resolution
     * and reset/update active commodity ID for proper back-stack navigation.
     */
    public static void onFragmentCreateViewStart(Object fragment) {
        try {
            if (fragment != null) {
                try {
                    Method getContextMethod = fragment.getClass().getMethod("getContext");
                    Context ctx = (Context) getContextMethod.invoke(fragment);
                    if (ctx != null) {
                        setApplicationContext(ctx);
                    }
                } catch (Throwable ignored) {}

                Object god = findGodFragment(fragment);
                if (god != null) {
                    lastGodFragment = new WeakReference<Object>(god);
                    boolean isProduct = resolveProductFromGodFragment(god);
                    if (isProduct) {
                        sLastProductGodFragment = new WeakReference<Object>(god);
                    }
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error in onFragmentCreateViewStart", t);
        }
    }

    private static Method resolveAndroidViewMethod(ClassLoader cl) {
        if (sAndroidViewResolvedMethod != null && sLastClassLoader == cl) {
            return sAndroidViewResolvedMethod;
        }
        Class<?> androidViewOwnerClass = null;
        if (sAndroidViewClass != null && !sAndroidViewClass.isEmpty()) {
            try {
                androidViewOwnerClass = cl.loadClass(sAndroidViewClass);
            } catch (Throwable ignored) {}
        }
        if (androidViewOwnerClass == null) {
            try {
                androidViewOwnerClass = cl.loadClass("androidx.compose.ui.viewinterop.AndroidView_androidKt");
            } catch (Throwable ignored) {}
        }
        if (androidViewOwnerClass != null) {
            String methodName = sAndroidViewMethod != null ? sAndroidViewMethod : "a";
            for (Method m : androidViewOwnerClass.getMethods()) {
                if (m.getName().equals(methodName) && m.getParameterTypes().length == 6) {
                    sAndroidViewResolvedMethod = m;
                    break;
                }
            }
            if (sAndroidViewResolvedMethod == null) {
                for (Method m : androidViewOwnerClass.getMethods()) {
                    Class<?>[] pTypes = m.getParameterTypes();
                    if (pTypes.length == 6 && pTypes[4] == int.class && pTypes[5] == int.class) {
                        sAndroidViewResolvedMethod = m;
                        break;
                    }
                }
            }
        }
        return sAndroidViewResolvedMethod;
    }

    /**
     * Injects MorpheSettingsCardView into Alza's Compose settings screens.
     */
    public static void onSettingsCompose(Object composer) {
        try {
            if (composer == null) return;
            ClassLoader cl = composer.getClass().getClassLoader();
            if (cl == null) return;

            Method androidViewMethod = resolveAndroidViewMethod(cl);
            if (androidViewMethod == null) return;

            Class<?> vwcClass = androidViewMethod.getParameterTypes()[0];
            if (sSettingsFactoryProxy == null || sLastClassLoader != cl) {
                sLastClassLoader = cl;
                sSettingsFactoryProxy = Proxy.newProxyInstance(
                        cl,
                        new Class<?>[]{vwcClass},
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                                String name = method.getName();
                                if ("invoke".equals(name) && args != null && args.length == 1 && args[0] instanceof Context) {
                                    Context context = (Context) args[0];
                                    setApplicationContext(context);
                                    return new MorpheSettingsCardView(context);
                                }
                                if ("toString".equals(name)) return "MorpheSettingsFactoryProxy";
                                if ("hashCode".equals(name)) return Integer.valueOf(System.identityHashCode(proxy));
                                if ("equals".equals(name)) {
                                    return Boolean.valueOf(args != null && args.length > 0 && proxy == args[0]);
                                }
                                return null;
                            }
                        }
                );
            }

            // AndroidView(factory=sSettingsFactoryProxy, modifier=null, update=null, composer, changed=6, default=6)
            androidViewMethod.invoke(null, sSettingsFactoryProxy, null, null, composer, 6, 6);
            Log.i(TAG, "onSettingsCompose: emitted MorpheSettingsCardView");
        } catch (Throwable t) {
            Log.e(TAG, "Error in onSettingsCompose: " + t.getMessage(), t);
        }
    }

    /**
     * Natively emits Compose AndroidView (androidx.compose.ui.viewinterop.AndroidView)
     * at the end of the price section.
     */
    public static void onPriceSectionCompose(Object composer) {
        onPriceSectionCompose(null, composer);
    }

    public static void onPriceSectionCompose(Object rowScope, Object composer) {
        try {
            if (composer == null) return;

            if (activeCommodityId == null || activeCommodityId.isEmpty()) {
                resolveProductFromGodFragment(lastGodFragment.get());
            }

            ClassLoader cl = composer.getClass().getClassLoader();
            if (cl == null) return;

            Method androidViewMethod = resolveAndroidViewMethod(cl);
            if (androidViewMethod == null) {
                Log.e(TAG, "onPriceSectionCompose: AndroidView method not resolved");
                return;
            }

            Class<?> vwcClass = androidViewMethod.getParameterTypes()[0];

            if (sFactoryProxy == null || sUpdateProxy == null || sButtonFactoryProxy == null || sButtonUpdateProxy == null || sLastClassLoader != cl) {
                sLastClassLoader = cl;
                sFactoryProxy = Proxy.newProxyInstance(
                        cl,
                        new Class<?>[]{vwcClass},
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                                String name = method.getName();
                                if (name.equals("invoke") && args != null && args.length == 1 && args[0] instanceof Context) {
                                    Context context = (Context) args[0];
                                    setApplicationContext(context);

                                    PriceHistoryChartView chartView = new PriceHistoryChartView(context);
                                    chartView.setTag(CHART_VIEW_TAG);

                                    if (activeCommodityId == null || activeCommodityId.isEmpty()) {
                                        resolveProductFromGodFragment(lastGodFragment != null ? lastGodFragment.get() : null);
                                    }

                                    String commodityId = activeCommodityId;
                                    String productName = activeProductName;
                                    if (commodityId != null && !commodityId.isEmpty() && !commodityId.equals("0")) {
                                        chartView.setCommodityId(commodityId);
                                        fetchData(chartView, commodityId, null, productName);
                                    } else {
                                        chartView.setState(PriceHistoryChartView.State.EMPTY);
                                    }
                                    Log.i(TAG, "Compose AndroidView factory: created native inline PriceHistoryChartView for " + commodityId);
                                    return chartView;
                                }
                                if (name.equals("toString")) return "PriceHistoryChartFactoryProxy";
                                if (name.equals("hashCode")) return Integer.valueOf(System.identityHashCode(proxy));
                                if (name.equals("equals")) {
                                    return Boolean.valueOf(args != null && args.length > 0 && proxy == args[0]);
                                }
                                if (method.getReturnType().equals(boolean.class)) return Boolean.FALSE;
                                if (method.getReturnType().equals(int.class)) return Integer.valueOf(0);
                                return null;
                            }
                        }
                );

                sUpdateProxy = Proxy.newProxyInstance(
                        cl,
                        new Class<?>[]{vwcClass},
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                                String name = method.getName();
                                if (name.equals("invoke") && args != null && args.length == 1) {
                                    if (args[0] instanceof PriceHistoryChartView) {
                                        PriceHistoryChartView chartView = (PriceHistoryChartView) args[0];
                                        setApplicationContext(chartView.getContext());

                                        boolean visible = isChartVisible();
                                        chartView.setVisibility(visible ? View.VISIBLE : View.GONE);
                                        chartView.requestLayout();
                                        chartView.invalidate();

                                        if (visible) {
                                            if (activeCommodityId == null || activeCommodityId.isEmpty()) {
                                                resolveProductFromGodFragment(lastGodFragment != null ? lastGodFragment.get() : null);
                                            }
                                            String commodityId = activeCommodityId;
                                            if (commodityId != null && !commodityId.isEmpty() && !commodityId.equals("0")) {
                                                if (!commodityId.equals(chartView.getCommodityId())) {
                                                    chartView.setCommodityId(commodityId);
                                                    fetchData(chartView, commodityId, null, activeProductName);
                                                } else if (chartView.getData() == null && chartView.getState() != PriceHistoryChartView.State.LOADING) {
                                                    fetchData(chartView, commodityId, null, activeProductName);
                                                }
                                            }
                                        }
                                        Log.i(TAG, "Compose AndroidView update: chartView for " + chartView.getCommodityId() + " (state=" + chartView.getState() + ", visible=" + visible + ")");
                                    }
                                    return null;
                                }
                                if (name.equals("toString")) return "PriceHistoryChartUpdateProxy";
                                if (name.equals("hashCode")) return Integer.valueOf(System.identityHashCode(proxy));
                                if (name.equals("equals")) {
                                    return Boolean.valueOf(args != null && args.length > 0 && proxy == args[0]);
                                }
                                if (method.getReturnType().equals(boolean.class)) return Boolean.FALSE;
                                if (method.getReturnType().equals(int.class)) return Integer.valueOf(0);
                                return null;
                            }
                        }
                );

                sButtonFactoryProxy = Proxy.newProxyInstance(
                        cl,
                        new Class<?>[]{vwcClass},
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                                String name = method.getName();
                                if (name.equals("invoke") && args != null && args.length == 1 && args[0] instanceof Context) {
                                    Context context = (Context) args[0];
                                    setApplicationContext(context);

                                    BenefitPricesButtonView buttonView = new BenefitPricesButtonView(context);
                                    buttonView.setTag(BUTTON_VIEW_TAG);

                                    if (activeCommodityId == null || activeCommodityId.isEmpty()) {
                                        resolveProductFromGodFragment(lastGodFragment != null ? lastGodFragment.get() : null);
                                    }

                                    String commodityId = activeCommodityId;
                                    String productName = activeProductName;
                                    if (commodityId != null && !commodityId.isEmpty() && !commodityId.equals("0")) {
                                        buttonView.setCommodityId(commodityId, productName);
                                    }
                                    Log.i(TAG, "Compose AndroidView factory: created BenefitPricesButtonView for " + commodityId);
                                    return buttonView;
                                }
                                if (name.equals("toString")) return "BenefitPricesButtonFactoryProxy";
                                if (name.equals("hashCode")) return Integer.valueOf(System.identityHashCode(proxy));
                                if (name.equals("equals")) {
                                    return Boolean.valueOf(args != null && args.length > 0 && proxy == args[0]);
                                }
                                if (method.getReturnType().equals(boolean.class)) return Boolean.FALSE;
                                if (method.getReturnType().equals(int.class)) return Integer.valueOf(0);
                                return null;
                            }
                        }
                );

                sButtonUpdateProxy = Proxy.newProxyInstance(
                        cl,
                        new Class<?>[]{vwcClass},
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                                String name = method.getName();
                                if (name.equals("invoke") && args != null && args.length == 1) {
                                    if (args[0] instanceof BenefitPricesButtonView) {
                                        BenefitPricesButtonView buttonView = (BenefitPricesButtonView) args[0];
                                        setApplicationContext(buttonView.getContext());

                                        boolean visible = isBenefitPricesButtonVisible();
                                        buttonView.setVisibility(visible ? View.VISIBLE : View.GONE);
                                        buttonView.requestLayout();
                                        buttonView.invalidate();

                                        if (visible) {
                                            if (activeCommodityId == null || activeCommodityId.isEmpty()) {
                                                resolveProductFromGodFragment(lastGodFragment != null ? lastGodFragment.get() : null);
                                            }
                                            String commodityId = activeCommodityId;
                                            if (commodityId != null && !commodityId.isEmpty() && !commodityId.equals("0")) {
                                                buttonView.setCommodityId(commodityId, activeProductName);
                                            }
                                        }
                                    }
                                    return null;
                                }
                                if (name.equals("toString")) return "BenefitPricesButtonUpdateProxy";
                                if (name.equals("hashCode")) return Integer.valueOf(System.identityHashCode(proxy));
                                if (name.equals("equals")) {
                                    return Boolean.valueOf(args != null && args.length > 0 && proxy == args[0]);
                                }
                                if (method.getReturnType().equals(boolean.class)) return Boolean.FALSE;
                                if (method.getReturnType().equals(int.class)) return Integer.valueOf(0);
                                return null;
                            }
                        }
                );
            }

            // 1. Chart view
            if (isChartVisible()) {
                androidViewMethod.invoke(null, sFactoryProxy, null, sUpdateProxy, composer, 6, 2);
                Log.i(TAG, "onPriceSectionCompose: successfully emitted native inline AndroidView");
            }

            // 2. Benefit prices button view
            if (isBenefitPricesButtonVisible()) {
                androidViewMethod.invoke(null, sButtonFactoryProxy, null, sButtonUpdateProxy, composer, 6, 2);
                Log.i(TAG, "onPriceSectionCompose: successfully emitted native inline BenefitPricesButtonView");
            }

        } catch (Throwable t) {
            Log.e(TAG, "Error in onPriceSectionCompose: " + t.getMessage(), t);
        }
    }

    private static boolean resolveProductFromGodFragment(Object godFragment) {
        if (godFragment == null) return false;
        try {
            Object destination = null;

            // 1. Try method U() (known Alza destination getter on GodFragment)
            try {
                Method mU = godFragment.getClass().getMethod("U");
                if (mU.getParameterTypes().length == 0) {
                    destination = mU.invoke(godFragment);
                }
            } catch (Throwable ignored) {}

            if (destination == null) {
                try {
                    Method mU = godFragment.getClass().getDeclaredMethod("U");
                    if (mU.getParameterTypes().length == 0) {
                        mU.setAccessible(true);
                        destination = mU.invoke(godFragment);
                    }
                } catch (Throwable ignored) {}
            }

            // 2. Try zero-argument methods on GodFragment returning non-framework objects
            if (destination == null) {
                for (Method m : godFragment.getClass().getMethods()) {
                    if (m.getParameterTypes().length == 0) {
                        Class<?> retType = m.getReturnType();
                        if (!retType.isPrimitive() && !retType.equals(void.class)) {
                            String retName = retType.getName();
                            if (!retName.startsWith("android.") && !retName.startsWith("java.") && !retName.startsWith("androidx.")) {
                                try {
                                    Object res = m.invoke(godFragment);
                                    if (res != null) {
                                        String resName = res.getClass().getName();
                                        if (resName.contains("Destination") || resName.contains("Navigation") || extractProductParams(res) != null) {
                                            destination = res;
                                            break;
                                        }
                                    }
                                } catch (Throwable ignored) {}
                            }
                        }
                    }
                }
            }

            // 3. Try fields of GodFragment
            if (destination == null) {
                for (Field f : godFragment.getClass().getDeclaredFields()) {
                    try {
                        String fTypeName = f.getType().getName();
                        if (!fTypeName.startsWith("android.") && !fTypeName.startsWith("java.") && !fTypeName.startsWith("androidx.")) {
                            f.setAccessible(true);
                            Object res = f.get(godFragment);
                            if (res != null) {
                                String resName = res.getClass().getName();
                                if (resName.contains("Destination") || resName.contains("Navigation") || extractProductParams(res) != null) {
                                    destination = res;
                                    break;
                                }
                            }
                        }
                    } catch (Throwable ignored) {}
                }
            }

            // 4. Try Fragment getArguments() Bundle
            if (destination == null) {
                try {
                    Method getArgsMethod = godFragment.getClass().getMethod("getArguments");
                    Object args = getArgsMethod.invoke(godFragment);
                    if (args instanceof Bundle) {
                        Bundle bundle = (Bundle) args;
                        for (String key : bundle.keySet()) {
                            Object val = bundle.get(key);
                            if (val != null) {
                                Object params = extractProductParams(val);
                                String cid = extractCommodityId(params, val);
                                if (cid != null && !cid.isEmpty() && !cid.equals("0")) {
                                    if (!cid.equals(activeCommodityId)) {
                                        activeProductName = null;
                                    }
                                    activeCommodityId = cid;
                                    String pname = extractProductName(params);
                                    if (pname != null) activeProductName = pname;
                                    Log.i(TAG, "resolveProductFromGodFragment from Bundle key=" + key + ": id=" + cid);
                                    return true;
                                }
                            }
                        }
                        java.util.regex.Matcher matcher = java.util.regex.Pattern.compile("(?:/product/|productId=|-d)([0-9]{4,9})").matcher(bundle.toString());
                        if (matcher.find()) {
                            String newCid = matcher.group(1);
                            if (!newCid.equals(activeCommodityId)) {
                                activeProductName = null;
                            }
                            activeCommodityId = newCid;
                            Log.i(TAG, "resolveProductFromGodFragment from Bundle regex: id=" + activeCommodityId);
                            return true;
                        }
                    }
                } catch (Throwable ignored) {}
            }

            if (destination != null) {
                Object params = extractProductParams(destination);
                String commodityId = extractCommodityId(params, destination);
                String productName = extractProductName(params);
                if (commodityId != null && !commodityId.isEmpty() && !commodityId.equals("0")) {
                    if (!commodityId.equals(activeCommodityId)) {
                        activeProductName = null;
                    }
                    activeCommodityId = commodityId;
                    if (productName != null) {
                        activeProductName = productName;
                    }
                    Log.i(TAG, "resolveProductFromGodFragment: id=" + commodityId + ", name=" + productName);
                    return true;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "resolveProductFromGodFragment error: " + t.getMessage());
        }
        return false;
    }

    private static Object findGodFragment(Object obj) {
        if (obj == null) return null;
        if (obj.getClass().getName().contains("GodFragment")) {
            return obj;
        }

        try {
            for (Field f : obj.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object val = f.get(obj);
                if (val != null && val.getClass().getName().contains("GodFragment")) {
                    return val;
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static Object extractProductParams(Object destination) {
        if (destination == null) return null;
        if (destination.getClass().getName().contains("ProductDetailParams")) {
            return destination;
        }

        try {
            Field fa = destination.getClass().getField("a");
            Object val = fa.get(destination);
            if (val != null) return val;
        } catch (Throwable ignored) {}

        for (Field f : destination.getClass().getDeclaredFields()) {
            try {
                f.setAccessible(true);
                Object val = f.get(destination);
                if (val != null) {
                    String vName = val.getClass().getName();
                    if (vName.contains("ProductDetailParams") || vName.contains("Params")) {
                        return val;
                    }
                }
            } catch (Throwable ignored) {}
        }

        for (Method m : destination.getClass().getDeclaredMethods()) {
            try {
                if (m.getParameterTypes().length == 0) {
                    Class<?> rType = m.getReturnType();
                    String rName = rType.getName();
                    if (rName.contains("ProductDetailParams") || rName.contains("Params")) {
                        m.setAccessible(true);
                        Object val = m.invoke(destination);
                        if (val != null) return val;
                    }
                }
            } catch (Throwable ignored) {}
        }

        return null;
    }

    private static String extractCommodityId(Object params, Object destination) {
        if (params != null) {
            try {
                Method m = params.getClass().getMethod("getProductId");
                Object res = m.invoke(params);
                if (res instanceof Number && ((Number) res).intValue() > 0) {
                    return String.valueOf(((Number) res).intValue());
                }
            } catch (Throwable ignored) {}

            for (Field f : params.getClass().getDeclaredFields()) {
                try {
                    f.setAccessible(true);
                    String fname = f.getName().toLowerCase();
                    if (fname.equals("productid") || fname.equals("id") || fname.equals("commodityid") || fname.equals("a")) {
                        Object val = f.get(params);
                        if (val instanceof Number && ((Number) val).intValue() > 0) {
                            return String.valueOf(((Number) val).intValue());
                        }
                    }
                } catch (Throwable ignored) {}
            }

            try {
                Method m = params.getClass().getMethod("getMeta");
                Object meta = m.invoke(params);
                if (meta != null) {
                    Method mh = meta.getClass().getMethod("getHref");
                    Object href = mh.invoke(meta);
                    if (href != null) {
                        String hrefStr = href.toString();
                        java.util.regex.Matcher matcher = java.util.regex.Pattern.compile("(?:/product/|productId=|-d)([0-9]{4,9})").matcher(hrefStr);
                        if (matcher.find()) {
                            return matcher.group(1);
                        }
                    }
                }
            } catch (Throwable ignored) {}

            try {
                String paramsStr = params.toString();
                java.util.regex.Matcher matcher = java.util.regex.Pattern.compile("(?:/product/|productId=|-d)([0-9]{4,9})").matcher(paramsStr);
                if (matcher.find()) {
                    return matcher.group(1);
                }
            } catch (Throwable ignored) {}
        }

        if (destination != null) {
            try {
                String destStr = destination.toString();
                java.util.regex.Matcher matcher = java.util.regex.Pattern.compile("(?:/product/|productId=|-d)([0-9]{4,9})").matcher(destStr);
                if (matcher.find()) {
                    return matcher.group(1);
                }
            } catch (Throwable ignored) {}
        }

        return null;
    }

    private static String extractProductName(Object params) {
        if (params == null) return null;
        try {
            Method m = params.getClass().getMethod("getProductInfo");
            Object info = m.invoke(params);
            if (info != null) {
                Method mn = info.getClass().getMethod("getName");
                Object nameObj = mn.invoke(info);
                if (nameObj != null) return nameObj.toString();
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static void fetchData(
            final PriceHistoryChartView chartView,
            final String commodityId,
            final String identifier,
            final String productName
    ) {
        if (commodityId == null || commodityId.trim().isEmpty() || commodityId.equals("0")) {
            chartView.setState(PriceHistoryChartView.State.EMPTY);
            return;
        }

        String domain = getDetectedDomain();
        Log.i(TAG, "fetchData: requesting data for commodityId=" + commodityId + " (domain=" + domain + ", currency=" + getDetectedCurrency() + ")");
        if (!sIsCountrySupported) {
            chartView.setState(PriceHistoryChartView.State.UNSUPPORTED_COUNTRY);
            return;
        }

        chartView.setState(PriceHistoryChartView.State.LOADING);

        HlidacShopuClient.getInstance().fetchPriceHistory(
                commodityId,
                null,
                identifier,
                productName,
                new HlidacShopuClient.Callback() {
                    @Override
                    public void onSuccess(PriceHistoryData data) {
                        // Discard stale async response if view was rebound to a different product
                        String currentId = chartView.getCommodityId();
                        if (currentId != null && !currentId.equals(commodityId)) {
                            Log.w(TAG, "fetchData onSuccess: discarded stale response for " + commodityId + " (current is " + currentId + ")");
                            return;
                        }
                        Log.i(TAG, "fetchData onSuccess: hasData=" + (data != null && data.hasData()));
                        chartView.setData(data);
                    }

                    @Override
                    public void onError(Throwable throwable) {
                        String currentId = chartView.getCommodityId();
                        if (currentId != null && !currentId.equals(commodityId)) {
                            Log.w(TAG, "fetchData onError: discarded stale error for " + commodityId);
                            return;
                        }
                        Log.e(TAG, "fetchData onError: " + throwable.getMessage(), throwable);
                        chartView.setState(PriceHistoryChartView.State.ERROR);
                    }
                }
        );
    }
}
