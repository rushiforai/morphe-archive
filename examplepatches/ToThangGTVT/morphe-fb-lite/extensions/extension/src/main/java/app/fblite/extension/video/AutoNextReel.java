package app.fblite.extension.video;

import android.os.SystemClock;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

import app.fblite.extension.settings.MorpheSettings;

/**
 * Moves to the next reel when one ends. Reels loop in the app: when a video ends, FbVideoView tells its
 * observers (X.1cF.AYK, through the list X.1zU in FbVideoView.A0I) and starts it again. A Proxy joins
 * those observers, and on completion of a reel the Reels pager is moved on with the call a swipe makes:
 * X.10M.A04(index) on the snap handler of the vertical FbLiteRecyclerView (X.0zb).
 */
final class AutoNextReel {
    private static final long DEBOUNCE_MS = 1500;
    /** Observer lists already joined. The list keeps observers weakly, so the proxies are kept here. */
    private static final WeakHashMap<Object, Object> OBSERVED = new WeakHashMap<>();
    private static final List<Object> PROXIES = new ArrayList<>();
    private static long lastAdvance;

    private AutoNextReel() {
    }

    static void observe(View video) throws Exception {
        Object observers = VideoFeatures.field(video, VideoFeatures.videoViewClass(), "A0I");
        if (observers == null || OBSERVED.containsKey(observers)) return;
        ClassLoader app = video.getClass().getClassLoader();
        Class<?> listener = Class.forName("X.1cF", false, app);
        final WeakReference<View> ref = new WeakReference<>(video);
        Object proxy = Proxy.newProxyInstance(app, new Class<?>[] {listener}, new InvocationHandler() {
            @Override
            public Object invoke(Object self, Method method, Object[] args) {
                if (method.getDeclaringClass() == Object.class) {
                    switch (method.getName()) {
                        case "hashCode":
                            return System.identityHashCode(self);
                        case "equals":
                            return self == args[0];
                        default:
                            return "MorpheAutoNextReel";
                    }
                }
                // AYK: the video played to the end (before the app loops it).
                if (method.getName().equals("AYK")) {
                    final View v = ref.get();
                    if (v != null) VideoFeatures.MAIN.post(() -> onCompleted(v));
                }
                return null;
            }
        });
        observers.getClass().getMethod("A02", listener).invoke(observers, proxy);
        PROXIES.add(proxy);
        OBSERVED.put(observers, Boolean.TRUE);
    }

    private static void onCompleted(View video) {
        try {
            if (!video.isShown() || !MorpheSettings.isEnabled(video.getContext(), MorpheSettings.AUTO_NEXT_REEL)) return;
            long now = SystemClock.uptimeMillis();
            if (now - lastAdvance < DEBOUNCE_MS) return;

            View pager = null;
            for (Object p = video.getParent(); p instanceof View; p = ((View) p).getParent()) {
                if (p.getClass().getName().equals("X.0zb")) {
                    pager = (View) p;
                    break;
                }
            }
            if (pager == null) return;
            Class<?> pagerClass = pager.getClass();
            // Reels: a vertical, snapping list whose items fill it. The feed is not snapping.
            if ((Boolean) pagerClass.getMethod("AQS").invoke(pager)) return;
            Object snap = VideoFeatures.field(pager, pagerClass, "A07");
            Object handler = VideoFeatures.field(pager, pagerClass, "A08");
            Object layout = VideoFeatures.field(pager, pagerClass, "A05");
            if (snap == null || handler == null || layout == null) return;
            if ((Integer) VideoFeatures.field(snap, snap.getClass(), "A02") == 0) return;
            if (video.getHeight() < pager.getHeight() * 0.8f) return;

            int current = (Integer) VideoFeatures.field(layout, layout.getClass(), "A03");
            Object items = VideoFeatures.field(snap, snap.getClass(), "A04");
            Method nextSnap = snap.getClass().getMethod("A00", items.getClass().getClassLoader()
                    .loadClass("X.0yV"), int.class, int.class);
            int next = (Integer) nextSnap.invoke(null, items, current + 1, 1);
            VideoFeatures.log("Reel ended at index " + current + ", next " + next, null);
            if (next <= current) return;
            handler.getClass().getMethod("A04", int.class).invoke(handler, next);
            lastAdvance = now;
        } catch (Throwable t) {
            VideoFeatures.log("Auto next reel failed", t);
        }
    }
}
