package dev.brave.extension.core;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import dev.brave.extension.media.NetworkSafety;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import org.chromium.chrome.browser.tab.Tab;
import org.chromium.components.origin_matcher.OriginMatcher;
import org.chromium.content.browser.JavascriptInjectorImpl;
import org.chromium.content_public.browser.LoadUrlParams;
import org.chromium.content_public.browser.NavigationHandle;
import org.chromium.content_public.browser.WebContents;

/**
 * Deterministic registry for JavaScript execution and origin-scoped @JavascriptInterface
 * bridge binding. Binds dedicated per-tab bridge instances with random per-origin tokens,
 * destroys OriginMatcher native handles cleanly, and enforces main-thread safety.
 */
public final class JsInjectionHub {
    private static final String TAG = "BraveCore_JsHub";
    public static final String BRIDGE_TOKEN_PLACEHOLDER = "__BRAVE_BRIDGE_TOKEN__";
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    public enum InjectionTiming {
        ON_NAVIGATION_FINISH,
        ON_DEMAND
    }

    public interface BridgeFactory {
        Object create(int tabId, WebContents webContents, String origin, String token);
    }

    // Preserve insertion order deterministically
    private static final Map<String, ScriptEntry> SCRIPTS = Collections.synchronizedMap(new LinkedHashMap<>());
    private static final Map<String, Object> STATIC_BRIDGES = new ConcurrentHashMap<>();
    private static final Map<String, BridgeFactory> BRIDGE_FACTORIES = new ConcurrentHashMap<>();

    // Tracks bound (origin, token) per WebContents & bridge name to avoid redundant OriginMatcher allocations
    private static final Map<WebContents, Map<String, BoundBridge>> BOUND_BRIDGES =
            Collections.synchronizedMap(new WeakHashMap<>());

    // Cached factory object for JavascriptInjectorImpl
    private static volatile Object sCachedInjectorFactory = null;
    private static volatile boolean sFactoryResolved = false;

    // Cached reflection Method for Tab.loadUrl (Tab.k(LoadUrlParams))
    private static volatile Method sTabLoadUrlMethod = null;
    private static volatile boolean sTabLoadUrlLookupAttempted = false;

    // Cached reflection Method for OriginMatcher native destroy
    private static volatile Method sOriginMatcherDestroyMethod = null;
    private static volatile boolean sOriginMatcherDestroyLookupDone = false;

    private static final class BoundBridge {
        final String origin;
        final String token;

        BoundBridge(String origin, String token) {
            this.origin = origin;
            this.token = token;
        }
    }

    private static class ScriptEntry {
        final InjectionTiming timing;
        final String script;
        ScriptEntry(InjectionTiming timing, String script) {
            this.timing = timing;
            this.script = script;
        }
    }

    static {
        ActiveTabTracker.addListener(new TabLifecycleListener() {
            @Override
            public void onActiveTabChanged(Tab tab) {
                if (tab != null && tab.getWebContents() != null) {
                    String spec = ActiveTabTracker.resolveTabUrl(tab);
                    String origin = NetworkSafety.formatOrigin(spec);
                    if (origin != null) {
                        bindAllBridgesForOrigin(tab, tab.getWebContents(), origin);
                        executeTiming(tab, tab.getWebContents(), InjectionTiming.ON_NAVIGATION_FINISH);
                    }
                }
            }

            @Override
            public void onNavigationStarted(Tab tab, NavigationHandle handle) {
                if (tab != null && tab.getWebContents() != null && handle != null) {
                    String spec = ActiveTabTracker.getGurlSpec(handle.f);
                    if (spec.isEmpty()) spec = ActiveTabTracker.getGurlSpec(handle.g);
                    String origin = NetworkSafety.formatOrigin(spec);
                    if (origin != null) {
                        bindAllBridgesForOrigin(tab, tab.getWebContents(), origin);
                    }
                }
            }

            @Override
            public void onNavigationFinished(Tab tab, NavigationHandle handle) {
                if (tab == null) return;

                // Strict guard: require non-null committed handle that is not an error page
                if (handle == null || !handle.i || handle.k) {
                    Log.d(TAG, "onNavigationFinished: skipping uncommitted or error navigation");
                    return;
                }

                String spec = "";
                if (handle.f != null) {
                    spec = ActiveTabTracker.getGurlSpec(handle.f);
                }
                if ((spec == null || spec.isEmpty()) && handle.g != null) {
                    spec = ActiveTabTracker.getGurlSpec(handle.g);
                }
                if (spec == null || spec.isEmpty()) {
                    spec = ActiveTabTracker.resolveTabUrl(tab);
                }

                // Filter internal browser system pages only
                if (spec != null && (spec.startsWith("chrome://") || spec.startsWith("chrome-native://") || spec.startsWith("about:") || spec.startsWith("content://"))) {
                    Log.d(TAG, "onNavigationFinished: skipping internal page spec=" + spec);
                    return;
                }

                WebContents webContents = tab.getWebContents();
                if (webContents == null) {
                    Log.w(TAG, "onNavigationFinished: WebContents is null for tab " + tab.getId());
                    return;
                }

                String origin = NetworkSafety.formatOrigin(spec);
                if (origin == null) {
                    Log.d(TAG, "onNavigationFinished: skipping non-http(s) page spec=" + spec);
                    return;
                }

                Log.i(TAG, "onNavigationFinished: committed page " + spec + " for tab " + tab.getId() + " - binding origin-scoped bridges (" + origin + ") and injecting scripts");

                bindAllBridgesForOrigin(tab, webContents, origin);
                executeTiming(tab, webContents, InjectionTiming.ON_NAVIGATION_FINISH);
            }

            @Override
            public void onTabDestroyed(Tab tab) {
                if (tab != null && tab.getWebContents() != null) {
                    BOUND_BRIDGES.remove(tab.getWebContents());
                }
            }
        });
    }

    private JsInjectionHub() {}

    public static void registerScript(String id, InjectionTiming timing, String script) {
        if (id != null && script != null) {
            SCRIPTS.put(id, new ScriptEntry(timing, script));
        }
    }

    public static void registerPersistentBridge(String bridgeName, Object bridgeObject) {
        if (bridgeName != null && bridgeObject != null) {
            STATIC_BRIDGES.put(bridgeName, bridgeObject);
            Tab activeTab = ActiveTabTracker.getActiveTab();
            if (activeTab != null && activeTab.getWebContents() != null) {
                String origin = NetworkSafety.formatOrigin(ActiveTabTracker.resolveTabUrl(activeTab));
                if (origin != null) {
                    registerBridge(activeTab.getWebContents(), bridgeObject, bridgeName, origin);
                }
            }
        }
    }

    public static void registerPersistentBridgeFactory(String bridgeName, BridgeFactory factory) {
        if (bridgeName != null && factory != null) {
            BRIDGE_FACTORIES.put(bridgeName, factory);
            Tab activeTab = ActiveTabTracker.getActiveTab();
            if (activeTab != null && activeTab.getWebContents() != null) {
                String origin = NetworkSafety.formatOrigin(ActiveTabTracker.resolveTabUrl(activeTab));
                if (origin != null) {
                    bindFactoryBridge(activeTab, activeTab.getWebContents(), bridgeName, factory, origin);
                }
            }
        }
    }

    private static void bindAllBridgesForOrigin(Tab tab, WebContents webContents, String origin) {
        for (Map.Entry<String, BridgeFactory> entry : BRIDGE_FACTORIES.entrySet()) {
            bindFactoryBridge(tab, webContents, entry.getKey(), entry.getValue(), origin);
        }
        for (Map.Entry<String, Object> entry : STATIC_BRIDGES.entrySet()) {
            final String bridgeName = entry.getKey();
            final Object bridgeObj = entry.getValue();
            postToMain(() -> {
                BoundBridge existing = getBoundBridge(webContents, bridgeName);
                if (existing != null && origin.equals(existing.origin)) {
                    return;
                }
                if (registerBridgeOnMain(webContents, bridgeObj, bridgeName, origin)) {
                    putBoundBridge(webContents, bridgeName, new BoundBridge(origin, ""));
                }
            });
        }
    }

    private static void bindFactoryBridge(Tab tab, WebContents webContents, String bridgeName, BridgeFactory factory, String origin) {
        postToMain(() -> {
            BoundBridge existing = getBoundBridge(webContents, bridgeName);
            if (existing != null && origin.equals(existing.origin)) {
                return;
            }
            String token = NetworkSafety.generateRandomTokenHex(16);
            int tabId = tab != null ? tab.getId() : -1;
            Object bridgeObj = factory.create(tabId, webContents, origin, token);
            if (bridgeObj != null) {
                if (registerBridgeOnMain(webContents, bridgeObj, bridgeName, origin)) {
                    putBoundBridge(webContents, bridgeName, new BoundBridge(origin, token));
                }
            }
        });
    }

    private static BoundBridge getBoundBridge(WebContents wc, String bridgeName) {
        synchronized (BOUND_BRIDGES) {
            Map<String, BoundBridge> map = BOUND_BRIDGES.get(wc);
            return map != null ? map.get(bridgeName) : null;
        }
    }

    private static void putBoundBridge(WebContents wc, String bridgeName, BoundBridge bound) {
        synchronized (BOUND_BRIDGES) {
            Map<String, BoundBridge> map = BOUND_BRIDGES.computeIfAbsent(wc, k -> new HashMap<>());
            map.put(bridgeName, bound);
        }
    }

    private static String getTokenForWebContents(WebContents wc, String bridgeName) {
        BoundBridge b = getBoundBridge(wc, bridgeName);
        return b != null ? b.token : "";
    }

    public static void registerBridge(final WebContents webContents, final Object bridgeObject, final String bridgeName) {
        String origin = null;
        if (webContents != null) {
            try {
                origin = NetworkSafety.formatOrigin(ActiveTabTracker.getGurlSpec(webContents.C()));
            } catch (Throwable ignored) {}
            if (origin == null) {
                try {
                    origin = NetworkSafety.formatOrigin(ActiveTabTracker.getGurlSpec(webContents.b0()));
                } catch (Throwable ignored) {}
            }
        }
        registerBridge(webContents, bridgeObject, bridgeName, origin);
    }

    public static void registerBridge(final WebContents webContents, final Object bridgeObject, final String bridgeName, final String allowedOrigin) {
        if (webContents == null || bridgeObject == null || bridgeName == null) return;
        if (allowedOrigin == null || allowedOrigin.isEmpty()) {
            Log.d(TAG, "Skipping bridge registration for " + bridgeName + ": no valid http(s) origin");
            return;
        }

        postToMain(() -> registerBridgeOnMain(webContents, bridgeObject, bridgeName, allowedOrigin));
    }

    private static boolean registerBridgeOnMain(
            final WebContents webContents,
            final Object bridgeObject,
            final String bridgeName,
            final String allowedOrigin
    ) {
        if (webContents == null || bridgeObject == null || bridgeName == null
                || allowedOrigin == null || allowedOrigin.isEmpty()) {
            return false;
        }
        OriginMatcher originMatcher = null;
        try {
            Object factory = getInjectorFactory();
            if (factory == null) {
                Log.w(TAG, "Cannot register bridge " + bridgeName + ": JavascriptInjector factory not found");
                return false;
            }

            JavascriptInjectorImpl injector = null;
            for (Method m : webContents.getClass().getMethods()) {
                if (m.getName().equals("H1") && m.getParameterTypes().length == 2) {
                    injector = (JavascriptInjectorImpl) m.invoke(webContents, JavascriptInjectorImpl.class, factory);
                    break;
                }
            }
            if (injector != null) {
                originMatcher = new OriginMatcher();
                originMatcher.c(Collections.singletonList(allowedOrigin));
                injector.a(bridgeObject, bridgeName, originMatcher);
                Log.i(TAG, "Registered bridge " + bridgeName + " scoped to origin " + allowedOrigin);
                return true;
            } else {
                Log.w(TAG, "Could not resolve JavascriptInjectorImpl on WebContents");
                return false;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to register bridge " + bridgeName, t);
            return false;
        } finally {
            destroyOriginMatcherSafely(originMatcher);
        }
    }

    private static void destroyOriginMatcherSafely(OriginMatcher matcher) {
        if (matcher == null) return;
        try {
            Method destroyMethod = resolveOriginMatcherDestroyMethod(matcher.getClass());
            if (destroyMethod != null) {
                destroyMethod.invoke(matcher);
            }
        } catch (Throwable t) {
            Log.d(TAG, "OriginMatcher cleanup skipped: " + t.getMessage());
        }
    }

    private static Method resolveOriginMatcherDestroyMethod(Class<?> clazz) {
        if (sOriginMatcherDestroyLookupDone) return sOriginMatcherDestroyMethod;
        synchronized (JsInjectionHub.class) {
            if (!sOriginMatcherDestroyLookupDone) {
                Method candidate = null;
                try {
                    candidate = clazz.getMethod("destroy");
                } catch (NoSuchMethodException ignored) {}

                if (candidate == null) {
                    // In Chromium's OriginMatcher, destroy() is the sole public/package 0-arg void instance method
                    Method uniqueZeroArgVoid = null;
                    int count = 0;
                    for (Method m : clazz.getDeclaredMethods()) {
                        if (Modifier.isStatic(m.getModifiers())) continue;
                        if (m.getParameterTypes().length == 0
                                && m.getReturnType() == void.class
                                && !"finalize".equals(m.getName())) {
                            uniqueZeroArgVoid = m;
                            count++;
                        }
                    }
                    if (count == 1 && uniqueZeroArgVoid != null) {
                        uniqueZeroArgVoid.setAccessible(true);
                        candidate = uniqueZeroArgVoid;
                    }
                } else {
                    candidate.setAccessible(true);
                }

                sOriginMatcherDestroyMethod = candidate;
                sOriginMatcherDestroyLookupDone = true;
            }
        }
        return sOriginMatcherDestroyMethod;
    }

    /**
     * Check 2: Formats a javascript: URL, escaping % to %25 and # to %23
     * so GURL will not truncate the script at the first #.
     */
    public static String formatJavascriptUrl(String script) {
        if (script == null || script.isEmpty()) {
            return "javascript:void(0);";
        }
        String safeScript = script.replace("%", "%25").replace("#", "%23");
        return "javascript:(function(){" + safeScript + "})();";
    }

    private static void loadUrlOnTab(Tab tab, LoadUrlParams params) {
        if (tab == null || params == null) return;
        if (!sTabLoadUrlLookupAttempted) {
            synchronized (JsInjectionHub.class) {
                if (!sTabLoadUrlLookupAttempted) {
                    for (Method m : tab.getClass().getMethods()) {
                        if (m.getName().equals("k")) {
                            Class<?>[] pTypes = m.getParameterTypes();
                            if (pTypes.length == 1 && LoadUrlParams.class.isAssignableFrom(pTypes[0])) {
                                m.setAccessible(true);
                                sTabLoadUrlMethod = m;
                                break;
                            }
                        }
                    }
                    if (sTabLoadUrlMethod == null) {
                        for (Method m : tab.getClass().getMethods()) {
                            Class<?>[] pTypes = m.getParameterTypes();
                            if (pTypes.length == 1 && LoadUrlParams.class.isAssignableFrom(pTypes[0])) {
                                m.setAccessible(true);
                                sTabLoadUrlMethod = m;
                                break;
                            }
                        }
                    }
                    sTabLoadUrlLookupAttempted = true;
                }
            }
        }

        if (sTabLoadUrlMethod != null) {
            try {
                sTabLoadUrlMethod.invoke(tab, params);
                Log.i(TAG, "Successfully invoked Tab.k with javascript URL");
            } catch (Throwable t) {
                Log.w(TAG, "Failed invoking Tab.k via reflection", t);
            }
        } else {
            Log.w(TAG, "sTabLoadUrlMethod not found on Tab class: " + tab.getClass().getName());
        }
    }

    /**
     * Check 3: Executes a script on the specified Tab via Tab.loadUrl.
     * Replaces WebContents.M which triggered native SIGTRAP in release builds.
     */
    public static void executeScript(final Tab tab, final WebContents webContents, final String script) {
        if (script == null || script.isEmpty()) return;

        postToMain(() -> {
            Tab targetTab = tab;
            if (targetTab == null) {
                targetTab = ActiveTabTracker.getActiveTab();
            }
            if (targetTab != null) {
                try {
                    String resolvedScript = script;
                    if (resolvedScript.contains(BRIDGE_TOKEN_PLACEHOLDER)) {
                        WebContents wc = webContents != null ? webContents : targetTab.getWebContents();
                        String token = wc != null ? getTokenForWebContents(wc, "BraveMediaBridge") : "";
                        resolvedScript = resolvedScript.replace(BRIDGE_TOKEN_PLACEHOLDER, token);
                    }
                    String jsUrl = formatJavascriptUrl(resolvedScript);
                    Log.i(TAG, "Executing script via Tab.k (len=" + resolvedScript.length() + ")");
                    loadUrlOnTab(targetTab, new LoadUrlParams(0, jsUrl));
                    return;
                } catch (Throwable t) {
                    Log.w(TAG, "Failed to execute script via Tab.k", t);
                }
            }
            Log.w(TAG, "Cannot execute script: target Tab is null");
        });
    }

    public static void executeScript(final WebContents webContents, final String script) {
        executeScript(null, webContents, script);
    }

    private static Object getInjectorFactory() {
        if (sFactoryResolved && sCachedInjectorFactory != null) return sCachedInjectorFactory;
        synchronized (JsInjectionHub.class) {
            if (!sFactoryResolved || sCachedInjectorFactory == null) {
                try {
                    Class<?> l0aClass = Class.forName("l0a");
                    Object resolved = l0aClass.getField("a").get(null);
                    if (resolved != null) {
                        sCachedInjectorFactory = resolved;
                        sFactoryResolved = true;
                    }
                } catch (Throwable t) {
                    Log.w(TAG, "Could not resolve l0a.a factory", t);
                }
            }
        }
        return sCachedInjectorFactory;
    }

    private static void executeTiming(Tab tab, WebContents webContents, InjectionTiming timing) {
        synchronized (SCRIPTS) {
            for (ScriptEntry entry : SCRIPTS.values()) {
                if (entry.timing == timing) {
                    executeScript(tab, webContents, entry.script);
                }
            }
        }
    }

    private static void postToMain(Runnable r) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            MAIN_HANDLER.post(r);
        }
    }
}
