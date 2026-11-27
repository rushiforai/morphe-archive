package dev.brave.extension.core;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import org.chromium.chrome.browser.tab.Tab;
import org.chromium.content_public.browser.NavigationHandle;
import org.chromium.content_public.browser.RenderFrameHost;
import org.chromium.content_public.browser.WebContents;
import org.chromium.url.GURL;

/**
 * Central tracking hub for active Tab and WebContents lifecycle in Brave.
 * Thread-safe, maintains per-Activity window state alongside global fallback state.
 */
public final class ActiveTabTracker {
    private static final String TAG = "BraveCore_TabTracker";
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final CopyOnWriteArrayList<TabLifecycleListener> LISTENERS = new CopyOnWriteArrayList<>();

    private static final class TabWindowState {
        WeakReference<Tab> tabRef = new WeakReference<>(null);
        int tabId = -1;
        String url = "";
        boolean isIncognito = false;
    }

    private static final Map<Activity, TabWindowState> WINDOW_STATES =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, WeakReference<Activity>> PROVIDER_TO_ACTIVITY =
            Collections.synchronizedMap(new WeakHashMap<>());

    private static volatile WeakReference<Tab> sActiveTabRef = new WeakReference<>(null);
    private static volatile int sActiveTabId = -1;
    private static volatile String sActiveTabUrl = "";
    private static volatile boolean sIsIncognito = false;
    private static volatile WeakReference<Activity> sActiveWindowRef = new WeakReference<>(null);

    private ActiveTabTracker() {}

    public static void addListener(TabLifecycleListener listener) {
        if (listener != null) {
            LISTENERS.addIfAbsent(listener);
        }
    }

    public static void removeListener(TabLifecycleListener listener) {
        if (listener != null) {
            LISTENERS.remove(listener);
        }
    }

    public static Tab getActiveTab() {
        return sActiveTabRef.get();
    }

    public static Tab getActiveTab(Activity activity) {
        if (activity == null) return getActiveTab();
        synchronized (WINDOW_STATES) {
            TabWindowState st = WINDOW_STATES.get(activity);
            if (st != null) {
                return st.tabRef.get();
            }
        }
        return null;
    }

    public static int getActiveTabId() {
        if (sActiveTabId >= 0) return sActiveTabId;
        Tab tab = sActiveTabRef.get();
        if (tab != null) {
            try {
                int id = tab.getId();
                if (id >= 0) {
                    sActiveTabId = id;
                    return id;
                }
            } catch (Throwable ignored) {}
        }
        return sActiveTabId;
    }

    public static int getActiveTabId(Activity activity) {
        if (activity == null) return getActiveTabId();
        synchronized (WINDOW_STATES) {
            TabWindowState st = WINDOW_STATES.get(activity);
            if (st != null) {
                if (st.tabId >= 0) return st.tabId;
                Tab t = st.tabRef.get();
                if (t != null) {
                    try {
                        int id = t.getId();
                        if (id >= 0) {
                            st.tabId = id;
                            return id;
                        }
                    } catch (Throwable ignored) {}
                }
            }
        }
        return -1;
    }

    public static String getActiveTabUrl() {
        return sActiveTabUrl;
    }

    public static String getActiveTabUrl(Activity activity) {
        if (activity == null) return getActiveTabUrl();
        synchronized (WINDOW_STATES) {
            TabWindowState st = WINDOW_STATES.get(activity);
            if (st != null) return st.url;
        }
        return "";
    }

    public static Activity resolveTabActivity(Tab tab) {
        if (tab == null) return null;
        Context ctx = null;
        try {
            ctx = tab.p();
        } catch (Throwable ignored) {}
        if (ctx == null) {
            try {
                ctx = tab.getContext();
            } catch (Throwable ignored) {}
        }
        return unwrapActivity(ctx);
    }

    private static Activity unwrapActivity(Context ctx) {
        int guard = 0;
        while (ctx instanceof ContextWrapper && guard < 16) {
            if (ctx instanceof Activity) return (Activity) ctx;
            ctx = ((ContextWrapper) ctx).getBaseContext();
            guard++;
        }
        return (ctx instanceof Activity) ? (Activity) ctx : null;
    }

    public static String getGurlSpec(GURL gurl) {
        if (gurl == null) return "";
        try {
            String s = gurl.k();
            if (s != null && !s.isEmpty()) return s;
        } catch (Throwable ignored) {}
        if (gurl.a != null && !gurl.a.isEmpty()) {
            return gurl.a;
        }
        try {
            String s = gurl.l();
            if (s != null && !s.isEmpty()) return s;
        } catch (Throwable ignored) {}
        try {
            String s = gurl.getSpec();
            if (s != null && !s.isEmpty()) return s;
        } catch (Throwable ignored) {}

        // Fallback: reflection on all String fields of GURL instance
        try {
            for (java.lang.reflect.Field f : gurl.getClass().getDeclaredFields()) {
                if (f.getType() == String.class) {
                    f.setAccessible(true);
                    Object val = f.get(gurl);
                    if (val instanceof String) {
                        String str = (String) val;
                        if (str.startsWith("http://") || str.startsWith("https://") || str.startsWith("chrome://") || str.startsWith("file://")) {
                            return str;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}

        return "";
    }

    public static boolean isIncognito() {
        return sIsIncognito;
    }

    // -------------------------------------------------------------
    // Bytecode Hook Entry Points (Invoked from Smali fingerprints)
    // -------------------------------------------------------------

    public static void onActiveTabChanged(final Tab tab) {
        onActiveTabChanged(null, tab);
    }

    public static void onActiveTabChanged(final Object provider, final Tab tab) {
        try {
            dev.brave.extension.media.ToolbarHook.ensureInitialized();
        } catch (Throwable ignored) {}

        postToMain(() -> {
            if (tab != null) {
                Activity act = resolveTabActivity(tab);
                if (act != null) {
                    updateWindowTabState(act, tab);
                    if (provider != null) {
                        PROVIDER_TO_ACTIVITY.put(provider, new WeakReference<>(act));
                    }
                    sActiveWindowRef = new WeakReference<>(act);
                }
                sActiveTabRef = new WeakReference<>(tab);
                updateCachedTabState(tab);
                Log.i(TAG, "onActiveTabChanged: tab=" + tab.getId() + ", url=" + sActiveTabUrl);
            } else {
                Activity clearedAct = null;
                if (provider != null) {
                    WeakReference<Activity> actRef = PROVIDER_TO_ACTIVITY.get(provider);
                    if (actRef != null) clearedAct = actRef.get();
                }
                if (clearedAct != null) {
                    WINDOW_STATES.remove(clearedAct);
                    Activity globalAct = sActiveWindowRef.get();
                    if (globalAct == null || globalAct == clearedAct) {
                        sActiveTabRef.clear();
                        sActiveWindowRef.clear();
                        updateCachedTabState(null);
                    }
                } else {
                    sActiveTabRef.clear();
                    sActiveWindowRef.clear();
                    updateCachedTabState(null);
                }
                Log.i(TAG, "onActiveTabChanged: null tab (cleared stale state)");
            }

            for (TabLifecycleListener l : LISTENERS) {
                try {
                    l.onActiveTabChanged(tab);
                } catch (Throwable t) {
                    Log.e(TAG, "Error in onActiveTabChanged listener", t);
                }
            }
        });
    }

    public static void onNavigationStarted(final Tab tab, final Object navHandleObj) {
        try {
            dev.brave.extension.media.ToolbarHook.ensureInitialized();
        } catch (Throwable ignored) {}

        final NavigationHandle handle;
        if (navHandleObj instanceof NavigationHandle) {
            handle = (NavigationHandle) navHandleObj;
        } else {
            if (navHandleObj != null) {
                Log.w(TAG, "Unexpected navHandleObj type in onNavigationStarted: " + navHandleObj.getClass());
            }
            handle = null;
        }

        postToMain(() -> {
            if (tab != null) {
                int tId = tab.getId();
                Activity tabAct = resolveTabActivity(tab);
                if (tabAct != null) {
                    dev.brave.extension.media.NetworkSafety.initContext(tabAct);
                }
                boolean isActiveGlobal = isCurrentlyActiveTab(tab, tId);
                boolean isActiveInWindow = isCurrentlyActiveInWindow(tab, tId, tabAct);
                if (sActiveTabRef.get() == null && sActiveTabId < 0) {
                    sActiveTabRef = new WeakReference<>(tab);
                    if (tabAct != null) sActiveWindowRef = new WeakReference<>(tabAct);
                    updateCachedTabState(tab);
                    isActiveGlobal = true;
                } else if (isActiveGlobal) {
                    updateCachedTabState(tab);
                }
                if (tabAct != null && (isActiveInWindow || getActiveTab(tabAct) == null)) {
                    updateWindowTabState(tabAct, tab);
                }

                String startUrl = "";
                if (handle != null) {
                    startUrl = getGurlSpec(handle.f);
                    if (startUrl.isEmpty()) startUrl = getGurlSpec(handle.g);
                }
                if (startUrl.isEmpty()) startUrl = resolveTabUrl(tab);
                if (isActiveGlobal && !startUrl.isEmpty()) {
                    sActiveTabUrl = startUrl;
                }
                if (tabAct != null && isActiveInWindow && !startUrl.isEmpty()) {
                    updateWindowTabUrl(tabAct, startUrl);
                }
                Log.i(TAG, "onNavigationStarted: tab=" + tId + " (active=" + isActiveGlobal + "), url=" + startUrl);

                // Immediately advance generation & clear previous page's streams/images for THIS tab only
                dev.brave.extension.media.IframeStreamResolver.clearTab(tId);
                dev.brave.extension.media.YouTubeExtractor.clearTab(tId);
                dev.brave.extension.media.MediaRegistry.advanceGenerationAndClear(tId, startUrl, true);
                dev.brave.extension.media.MediaBridge.checkAndRegisterDirectMedia(tId, startUrl, "onNavigationStarted");
            }

            for (TabLifecycleListener l : LISTENERS) {
                try {
                    l.onNavigationStarted(tab, handle);
                } catch (Throwable t) {
                    Log.e(TAG, "Error in onNavigationStarted listener", t);
                }
            }
        });
    }

    public static void onNavigationFinished(final Tab tab, final Object navHandleObj) {
        final NavigationHandle handle;
        if (navHandleObj instanceof NavigationHandle) {
            handle = (NavigationHandle) navHandleObj;
        } else {
            if (navHandleObj != null) {
                Log.w(TAG, "Unexpected navHandleObj type in onNavigationFinished: " + navHandleObj.getClass());
            }
            handle = null;
        }

        postToMain(() -> {
            if (tab != null) {
                final int tId = tab.getId();
                final Activity tabAct = resolveTabActivity(tab);
                final boolean isErrorPage = (handle != null && handle.k);
                final boolean isCommittedSuccess = (handle != null && handle.i && !handle.k);

                String finishUrl = "";
                if (handle != null) {
                    finishUrl = getGurlSpec(handle.f);
                    if (finishUrl.isEmpty()) finishUrl = getGurlSpec(handle.g);
                }
                if (finishUrl.isEmpty()) finishUrl = resolveTabUrl(tab);

                Log.i(TAG, "onNavigationFinished: tab=" + tId + ", url=" + finishUrl
                        + ", committed=" + (handle != null && handle.i) + ", error=" + isErrorPage);

                if (isCommittedSuccess) {
                    boolean isActiveGlobal = isCurrentlyActiveTab(tab, tId);
                    boolean isActiveInWindow = isCurrentlyActiveInWindow(tab, tId, tabAct);
                    if (sActiveTabRef.get() == null && sActiveTabId < 0) {
                        sActiveTabRef = new WeakReference<>(tab);
                        if (tabAct != null) sActiveWindowRef = new WeakReference<>(tabAct);
                        updateCachedTabState(tab);
                        isActiveGlobal = true;
                    } else if (isActiveGlobal) {
                        updateCachedTabState(tab);
                    }
                    if (tabAct != null && (isActiveInWindow || getActiveTab(tabAct) == null)) {
                        updateWindowTabState(tabAct, tab);
                        if (!finishUrl.isEmpty()) updateWindowTabUrl(tabAct, finishUrl);
                    }
                    if (isActiveGlobal && !finishUrl.isEmpty()) {
                        sActiveTabUrl = finishUrl;
                    }

                    // Clear stale items if URL changed (redirect or SPA commit)
                    dev.brave.extension.media.MediaRegistry.advanceGenerationAndClear(tId, finishUrl, false);
                    final long capturedGen = dev.brave.extension.media.MediaRegistry.getTabGeneration(tId);

                    dev.brave.extension.media.MediaBridge.checkAndRegisterDirectMedia(tId, finishUrl, "onNavigationFinished");

                    if (finishUrl != null && (finishUrl.startsWith("http://") || finishUrl.startsWith("https://"))) {
                        dev.brave.extension.media.IframeStreamResolver.resolveIframeAsync(finishUrl, finishUrl, tId);
                    }

                    if (tab.getWebContents() != null) {
                        final WebContents wc = tab.getWebContents();
                        final String fUrl = finishUrl;
                        scanChildFrames(wc, tId, fUrl, capturedGen);
                        MAIN_HANDLER.postDelayed(() -> scanChildFrames(wc, tId, fUrl, capturedGen), 600);
                        MAIN_HANDLER.postDelayed(() -> scanChildFrames(wc, tId, fUrl, capturedGen), 1500);
                    }
                } else if (!isErrorPage) {
                    // Uncommitted non-error finish (e.g. Chromium intercepted a direct media download):
                    // preserve direct-media URL registration without running page/frame scanning.
                    dev.brave.extension.media.MediaBridge.checkAndRegisterDirectMedia(tId, finishUrl, "onNavigationFinished");
                }
            }

            for (TabLifecycleListener l : LISTENERS) {
                try {
                    l.onNavigationFinished(tab, handle);
                } catch (Throwable t) {
                    Log.e(TAG, "Error in onNavigationFinished listener", t);
                }
            }
        });
    }

    public static void onTabDestroyed(final Tab tab) {
        postToMain(() -> {
            if (tab != null) {
                int tId = tab.getId();
                dev.brave.extension.media.IframeStreamResolver.clearTab(tId);
                dev.brave.extension.media.YouTubeExtractor.clearTab(tId);
                synchronized (WINDOW_STATES) {
                    java.util.Iterator<Map.Entry<Activity, TabWindowState>> it = WINDOW_STATES.entrySet().iterator();
                    while (it.hasNext()) {
                        TabWindowState st = it.next().getValue();
                        if (st != null && (st.tabRef.get() == tab || st.tabId == tId)) {
                            it.remove();
                        }
                    }
                }
            }
            Tab current = sActiveTabRef.get();
            if (current == tab || (tab != null && tab.getId() == sActiveTabId)) {
                sActiveTabRef.clear();
                sActiveWindowRef.clear();
                sActiveTabId = -1;
                sActiveTabUrl = "";
                sIsIncognito = false;
            }

            for (TabLifecycleListener l : LISTENERS) {
                try {
                    l.onTabDestroyed(tab);
                } catch (Throwable t) {
                    Log.e(TAG, "Error in onTabDestroyed listener", t);
                }
            }
        });
    }

    private static void updateWindowTabState(Activity act, Tab tab) {
        if (act == null || tab == null) return;
        synchronized (WINDOW_STATES) {
            TabWindowState st = WINDOW_STATES.computeIfAbsent(act, k -> new TabWindowState());
            st.tabRef = new WeakReference<>(tab);
            try {
                st.tabId = tab.getId();
                st.isIncognito = tab.isIncognito();
                st.url = resolveTabUrl(tab);
            } catch (Throwable ignored) {}
        }
    }

    private static void updateWindowTabUrl(Activity act, String url) {
        if (act == null) return;
        synchronized (WINDOW_STATES) {
            TabWindowState st = WINDOW_STATES.get(act);
            if (st != null) {
                st.url = url != null ? url : "";
            }
        }
    }

    private static boolean isCurrentlyActiveInWindow(Tab tab, int tabId, Activity act) {
        if (tab == null || act == null) return false;
        synchronized (WINDOW_STATES) {
            TabWindowState st = WINDOW_STATES.get(act);
            if (st == null) return false;
            Tab cur = st.tabRef.get();
            if (cur != null) {
                return cur == tab || (st.tabId >= 0 && tabId == st.tabId);
            }
            return st.tabId >= 0 && tabId == st.tabId;
        }
    }

    private static boolean isCurrentlyActiveTab(Tab tab, int tabId) {
        if (tab == null) return false;
        Tab current = sActiveTabRef.get();
        if (current != null) {
            return current == tab || (sActiveTabId >= 0 && tabId == sActiveTabId);
        }
        return sActiveTabId >= 0 && tabId == sActiveTabId;
    }

    public static String resolveTabUrl(Tab tab) {
        if (tab == null) return "";
        try {
            String url = getGurlSpec(tab.getUrl());
            if ((url == null || url.isEmpty()) && tab.getWebContents() != null) {
                try {
                    url = getGurlSpec(tab.getWebContents().C());
                } catch (Throwable ignored) {}
                if (url == null || url.isEmpty()) {
                    try {
                        url = getGurlSpec(tab.getWebContents().b0());
                    } catch (Throwable ignored) {}
                }
            }
            return url != null ? url : "";
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static void updateCachedTabState(Tab tab) {
        if (tab != null) {
            try {
                sActiveTabId = tab.getId();
                sIsIncognito = tab.isIncognito();
                sActiveTabUrl = resolveTabUrl(tab);
            } catch (Throwable t) {
                Log.w(TAG, "Failed reading tab state", t);
            }
        } else {
            sActiveTabId = -1;
            sActiveTabUrl = "";
            sIsIncognito = false;
        }
    }

    private static void postToMain(Runnable r) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            MAIN_HANDLER.post(r);
        }
    }

    public static void scanChildFrames(WebContents webContents, int tabId, String pageUrl, long expectedGen) {
        if (webContents == null) return;
        if (expectedGen > 0 && expectedGen != dev.brave.extension.media.MediaRegistry.getTabGeneration(tabId)) {
            return; // Stale delayed callback from previous page
        }
        try {
            RenderFrameHost mainFrame = webContents.t2();
            if (mainFrame == null) mainFrame = webContents.j();
            if (mainFrame != null) {
                scanFrameRecursive(mainFrame, tabId, pageUrl, 0);
            }
        } catch (Throwable t) {
            Log.d(TAG, "scanChildFrames error", t);
        }
    }

    private static void scanFrameRecursive(RenderFrameHost frame, int tabId, String pageUrl, int depth) {
        if (frame == null || depth > 3) return;
        try {
            GURL url = frame.w();
            String spec = getGurlSpec(url);
            if (spec != null && (spec.startsWith("http://") || spec.startsWith("https://")) && !spec.equals(pageUrl)) {
                Log.i(TAG, "Native child frame detected: " + spec);
                dev.brave.extension.media.IframeStreamResolver.resolveIframeAsync(spec, pageUrl, tabId);
            }
            List<RenderFrameHost> children = frame.r();
            if (children != null) {
                for (RenderFrameHost child : children) {
                    scanFrameRecursive(child, tabId, pageUrl, depth + 1);
                }
            }
        } catch (Throwable t) {
            Log.d(TAG, "scanFrameRecursive error", t);
        }
    }
}
