package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;

import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Navigation poller for userscript injection, installation, and Fork publishing. */
final class MonkeyRuntime implements Runnable {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Activity, MonkeyRuntime> RUNS = new WeakHashMap<>();

    final Activity activity;
    String last = "";
    int tab;
    long generation = -1;

    MonkeyRuntime(Activity activity) {
        this.activity = activity;
    }

    static void start(Activity activity) {
        if (activity instanceof UserscriptManagerActivity
                || activity instanceof UserscriptEditorActivity
                || activity instanceof UserscriptInstallActivity) return;
        stop(activity);
        MonkeyRuntime runtime = new MonkeyRuntime(activity);
        synchronized (RUNS) {
            RUNS.put(activity, runtime);
        }
        MAIN.post(runtime);
    }

    static void stop(Activity activity) {
        MonkeyRuntime runtime;
        synchronized (RUNS) {
            runtime = RUNS.remove(activity);
        }
        if (runtime != null) MAIN.removeCallbacks(runtime);
    }

    static String url(Activity activity) {
        ChromeBridge.Page page = ChromeBridge.page(activity);
        return page == null ? "" : page.url;
    }

    static List<Userscript> matches(Activity activity) {
        return MonkeyStore.matching(activity, url(activity));
    }

    static boolean run(Activity activity, Userscript script) {
        ChromeBridge.Page page = ChromeBridge.page(activity);
        return page != null
                && !page.incognito
                && ChromeBridge.exec(
                        page,
                        ScriptInjector.buildPayload(script, page.url, true)
                );
    }

    static boolean commands(Activity activity) {
        ChromeBridge.Page page = ChromeBridge.page(activity);
        return page != null && ChromeBridge.exec(page, ScriptInjector.commandMenuPayload());
    }

    static void refresh(Activity activity) {
        MonkeyRuntime runtime;
        synchronized (RUNS) {
            runtime = RUNS.get(activity);
        }
        if (runtime != null) {
            runtime.generation = -1;
            MAIN.removeCallbacks(runtime);
            MAIN.post(runtime);
        }
    }

    @Override public void run() {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        try {
            ChromeBridge.Page page = ChromeBridge.page(activity);
            if (page != null
                    && !page.incognito
                    && UrlPatternMatcher.isInjectableScheme(page.url)) {
                ForkSiteSupport.injectPendingPublish(activity, page);
                ForkSiteSupport.injectInstallClickBridge(page);
                ForkSiteSupport.consumeInstallMarker(activity, page);

                int identity = System.identityHashCode(page.tab);
                long currentGeneration = MonkeyStore.generation();
                boolean navigationChanged = identity != tab || !page.url.equals(last);
                if (navigationChanged || currentGeneration != generation) {
                    tab = identity;
                    last = page.url;
                    generation = currentGeneration;
                    for (Userscript script : MonkeyStore.matching(activity, page.url)) {
                        ChromeBridge.exec(
                                page,
                                ScriptInjector.buildPayload(script, page.url, false)
                        );
                    }
                    if (navigationChanged) {
                        ForkSiteSupport.maybePromptDirectInstall(activity, page.url);
                    }
                }
            }
        } catch (Throwable ignored) { }
        MAIN.postDelayed(this, 350);
    }
}
