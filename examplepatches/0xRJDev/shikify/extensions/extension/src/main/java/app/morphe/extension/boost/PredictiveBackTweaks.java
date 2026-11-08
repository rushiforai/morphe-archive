package app.morphe.extension.boost;

import android.app.Activity;
import android.app.Application;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.ViewTreeObserver;
import android.webkit.WebView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.WeakHashMap;

/** Let Android animate navigation; intercept only when Boost has UI to handle first. */
public final class PredictiveBackTweaks {
    private static boolean installed;
    private PredictiveBackTweaks() { }

    public static boolean isSupported() { return Build.VERSION.SDK_INT >= 33; }

    public static void install(Object instance) {
        if (!isSupported() || installed || !(instance instanceof Application)) return;
        ((Application) instance).registerActivityLifecycleCallbacks(new Lifecycle());
        installed = true;
    }

    /** BoostSwipeBackActivity forces a zero-duration exit even for system Back. */
    public static void legacyTransition(Activity activity, int enter, int exit) {
        if (!isSupported()) activity.overridePendingTransition(enter, exit);
    }

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        private final WeakHashMap<Activity, Api33.Guard> guards = new WeakHashMap<>();
        @Override public void onActivityResumed(Activity activity) {
            if (!activity.getClass().getName().startsWith("com.rubenmayayo.reddit.")) return;
            Api33.Guard old = guards.remove(activity);
            if (old != null) old.detach();
            Api33.Guard guard = new Api33.Guard(activity);
            guards.put(activity, guard);
            guard.attach();
        }
        @Override public void onActivityPaused(Activity activity) {
            Api33.Guard guard = guards.remove(activity);
            if (guard != null) guard.detach();
        }
        @Override public void onActivityDestroyed(Activity activity) { onActivityPaused(activity); }
        @Override public void onActivityCreated(Activity activity, Bundle state) { }
        @Override public void onActivityStarted(Activity activity) { }
        @Override public void onActivityStopped(Activity activity) { }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
    }

    // Kept in a separate class so Android 7-12 never needs to resolve android.window APIs.
    private static final class Api33 {
        private static final String UI = "com.rubenmayayo.reddit.ui.";
        static final class Guard implements ViewTreeObserver.OnPreDrawListener,
                android.window.OnBackInvokedCallback {
            final WeakReference<Activity> owner;
            final WeakReference<View> decor;
            final String handler;
            final boolean usesDrawer;
            final SharedPreferences preferences;
            android.window.OnBackInvokedDispatcher dispatcher;
            android.window.OnBackInvokedCallback callback;
            boolean registered, failed;
            long lastUpdate;
            static Method findDrawer, drawerVisible;

            Guard(Activity activity) {
                owner = new WeakReference<>(activity);
                decor = new WeakReference<>(activity.getWindow().getDecorView());
                String name;
                try { name = activity.getClass().getMethod("onBackPressed").getDeclaringClass().getName(); }
                catch (ReflectiveOperationException error) { name = "unknown"; }
                handler = name;
                usesDrawer = name.equals("uj0") || name.equals(UI+"submissions.subreddit.SubredditBaseActivity") ||
                    name.equals(UI+"submissions.subreddit.MainActivity");
                preferences = name.equals(UI+"submissions.subreddit.MainActivity")
                    ? PreferenceManager.getDefaultSharedPreferences(activity) : null;
            }

            void attach() {
                View view = decor.get();
                if (view == null) return;
                dispatcher = owner.get().getOnBackInvokedDispatcher();
                // Install before a first gesture; re-evaluate after each visible UI change.
                update();
                view.getViewTreeObserver().addOnPreDrawListener(this);
            }
            @Override public boolean onPreDraw() {
                long now = android.os.SystemClock.uptimeMillis();
                if (now - lastUpdate >= 48) { lastUpdate = now; update(); }
                return true;
            }
            void update() {
                Activity activity = owner.get();
                if (activity == null || dispatcher == null || failed) return;
                boolean needed;
                try { needed = needsLegacyBack(activity); }
                catch (ReflectiveOperationException | RuntimeException error) {
                    // An unknown UI state must preserve the original handler, especially draft prompts.
                    needed = true;
                    failed = true;
                }
                android.window.OnBackInvokedCallback desired=needed ? this:
                    (android.window.OnBackInvokedCallback)SurfaceAppearanceTweaks.overlayBack(activity);
                if(desired==callback)return;
                if(callback!=null){SurfaceAppearanceTweaks.stopOverlayBack(callback);dispatcher.unregisterOnBackInvokedCallback(callback);}
                callback=desired;
                if(callback!=null)dispatcher.registerOnBackInvokedCallback(
                    android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT,callback);
                registered=needed;
            }
            boolean needsLegacyBack(Activity activity) throws ReflectiveOperationException {
                if (focusedMediaControls(activity) != null) return true;
                if (usesDrawer) {
                    if (drawerOpen(CommentsChromeTweaks.field(activity, "c")) ||
                            drawerOpen(CommentsChromeTweaks.field(activity, "i0"))) return true;
                    return preferences != null && activity.isTaskRoot() &&
                        (preferences.getBoolean("pref_ask_exit", true) ||
                         preferences.getBoolean("pref_double_exit", true));
                }
                if (handler.equals(UI+"compose.FormatActivity"))
                    return Boolean.TRUE.equals(activity.getClass().getMethod("a1").invoke(activity));
                if (handler.equals(UI+"messages.thread.ThreadActivity")) {
                    Object reply = CommentsChromeTweaks.field(activity, "replyFieldView");
                    return reply != null && nonempty(reply.getClass().getMethod("getText").invoke(reply));
                }
                if (handler.equals(UI+"activities.WebViewActivity")) {
                    Object web = CommentsChromeTweaks.field(activity, "webView");
                    return web instanceof WebView && ((WebView) web).canGoBack();
                }
                if (handler.equals(UI+"search.MultiPickSubredditActivity")) {
                    Object adapter = CommentsChromeTweaks.field(activity, "I");
                    Object selection = CommentsChromeTweaks.field(adapter, "b");
                    return !(selection instanceof Collection) || !((Collection<?>) selection).isEmpty();
                }
                // These original handlers contain only default navigation and exit animations.
                if (handler.equals("gh") || handler.equals("ai0") || handler.equals("gq1") ||
                    handler.equals("ny") || handler.equals("android.app.Activity") ||
                    handler.equals(UI+"activities.BillingActivity") ||
                    handler.equals(UI+"activities.BillingProActivity") ||
                    handler.equals(UI+"activities.PremiumActivity")) return false;
                // Submission editors, the colour-pattern editor and future unknown overrides keep
                // their original confirmation/result handling. Never bypass a potentially dirty form.
                return true;
            }
            static boolean nonempty(Object value) {
                return value instanceof CharSequence && ((CharSequence) value).length() != 0;
            }
            static View focusedMediaControls(Activity activity) {
                Object value = CommentsChromeTweaks.field(activity, "mediaController");
                // The older GIF player intercepts KEYCODE_BACK in its focused controller view
                // to hide controls. Migrate that interception too, before an Activity exit.
                if (!(value instanceof View) || !value.getClass().getSimpleName().equals("UniversalMediaController"))
                    return null;
                View controls = (View) value;
                return controls.hasFocus() && Boolean.TRUE.equals(CommentsChromeTweaks.field(controls, "z"))
                    ? controls : null;
            }
            static boolean drawerOpen(Object controller) throws ReflectiveOperationException {
                if (controller == null) return false;
                Object builder = CommentsChromeTweaks.field(controller, "a");
                Object drawer = CommentsChromeTweaks.field(builder, "k");
                Object panel = CommentsChromeTweaks.field(builder, "l");
                Object gravity = CommentsChromeTweaks.field(builder, "q");
                if (!(drawer instanceof View) || panel == null || !(gravity instanceof Integer)) return false;
                // Exact read-only operations from Boost's uj0.g1, excluding its close() side effect.
                if (findDrawer == null) {
                    findDrawer = drawer.getClass().getMethod("f", int.class);
                    drawerVisible = drawer.getClass().getMethod("m", View.class);
                }
                Object child = findDrawer.invoke(drawer, (Integer) gravity);
                return child instanceof View && Boolean.TRUE.equals(drawerVisible.invoke(null, child));
            }
            @Override public void onBackInvoked() {
                Activity activity = owner.get();
                if (activity == null) return;
                // Explicit legacy dispatch retains Boost's checked UI behaviour. No recursive
                // platform dispatch, no speculative navigation and no action on gesture cancellation.
                View controls = focusedMediaControls(activity);
                if (controls != null) {
                    try { controls.getClass().getMethod("a").invoke(controls); }
                    catch (ReflectiveOperationException error) {
                    }
                } else activity.onBackPressed();
                update();
            }
            void detach() {
                View view = decor.get();
                if (view != null && view.getViewTreeObserver().isAlive())
                    view.getViewTreeObserver().removeOnPreDrawListener(this);
                if (callback != null && dispatcher != null){SurfaceAppearanceTweaks.stopOverlayBack(callback);dispatcher.unregisterOnBackInvokedCallback(callback);}
                callback=null;
                registered = false;
                dispatcher = null;
            }
        }
    }
}
