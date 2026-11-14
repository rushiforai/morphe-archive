package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Keep the real tab-strip View clickable even when the native ActionBar and
 * the ContentFrameLayout need to appear in a different visual order.
 *
 * The native tab host still owns its tab View. Only its render parent changes
 * to the decor's transparent view layer. A height-matched spacer remains in
 * the host's layout, so tab page measurement, caching and scroll restoration
 * do not need to be recreated when arrangements change.
 */
final class AppBarPlacement202 {
    private static final WeakHashMap<Activity, Controller> CONTROLLERS = new WeakHashMap<>();
    private AppBarPlacement202() {}

    private static Activity activity(Context context) {
        for (int i = 0; i < 12 && context != null; i++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) break;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    static void attach(LinearLayout parent, View strip) {
        if (parent == null || strip == null) return;
        Activity host = activity(strip.getContext());
        if (host == null) return;
        Controller c;
        synchronized (CONTROLLERS) {
            c = CONTROLLERS.get(host);
            if (c == null) {
                c = new Controller(host);
                CONTROLLERS.put(host, c);
            }
        }
        c.bind(parent, strip);
        c.install();
        strip.post(c::apply);
    }

    static void refreshCurrent() {
        synchronized (CONTROLLERS) {
            for (Controller controller : CONTROLLERS.values()) {
                if (controller == null) continue;
                controller.apply();
            }
        }
    }

    // The real strip is now a clickable decor child; native gesture routing
    // must not dispatch a second touch event to it.
    static boolean touch(Activity activity, MotionEvent event) { return false; }

    private static View find(View view, String suffix) {
        if (view == null) return null;
        if (view.getClass().getName().endsWith(suffix)) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = find(group.getChildAt(i), suffix);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static final class Controller implements ViewTreeObserver.OnGlobalLayoutListener {
        private final WeakReference<Activity> owner;
        private WeakReference<LinearLayout> parent;
        private WeakReference<View> strip;
        private WeakReference<View> spacer;
        private WeakReference<FrameLayout> overlay;
        private WeakReference<View> appBar, content;
        private boolean listening, updating;
        private int lastMode = -1;

        Controller(Activity host) { owner = new WeakReference<>(host); }

        void bind(LinearLayout p, View bar) {
            View previous = strip == null ? null : strip.get();
            if (previous != null && previous != bar) {
                cleanup();
            }
            parent = new WeakReference<>(p);
            strip = new WeakReference<>(bar);
        }

        void install() {
            if (listening) return;
            Activity a = owner.get();
            if (a == null) return;
            View decor = a.getWindow().getDecorView();
            if (decor == null || !decor.getViewTreeObserver().isAlive()) return;
            decor.getViewTreeObserver().addOnGlobalLayoutListener(this);
            listening = true;
        }

        @Override public void onGlobalLayout() { apply(); }

        private void cleanup() {
            View p = spacer == null ? null : spacer.get();
            if (p != null && p.getParent() instanceof ViewGroup)
                ((ViewGroup)p.getParent()).removeView(p);
            View bar = strip == null ? null : strip.get();
            FrameLayout layer = overlay == null ? null : overlay.get();
            if (bar != null && layer != null && bar.getParent() == layer)
                layer.removeView(bar);
            spacer = null;
            lastMode = -1;
        }

        void apply() {
            if (updating) return;
            Activity host = owner.get();
            View bar = strip == null ? null : strip.get();
            LinearLayout nativeParent = parent == null ? null : parent.get();
            if (host == null || bar == null || nativeParent == null) return;
            if (!nativeParent.isAttachedToWindow() || bar.getVisibility() == View.GONE)
                return;
            ViewGroup decor = (ViewGroup) host.getWindow().getDecorView();
            if (decor == null) return;
            View chrome = appBar == null ? null : appBar.get();
            View frame = content == null ? null : content.get();
            if (chrome == null || frame == null || chrome.getRootView() != decor
                    || frame.getRootView() != decor) {
                chrome = find(decor, "ActionBarContainer");
                frame = find(decor, "ContentFrameLayout");
                if (chrome == null || frame == null) return;
                appBar = new WeakReference<>(chrome);
                content = new WeakReference<>(frame);
            }
            int h = chrome.getHeight(), f = frame.getHeight();
            if (h <= 0 || f <= h || chrome.getVisibility() != View.VISIBLE) return;
            int mode = MultiTabPlacement.layout(MultiTabPlacement.prefs(host));
            int t = PanelUi.dp(host, MultiTabPlacement.heightDp(MultiTabPlacement.prefs(host)));
            int[] placements = AppBarLayoutMath202.calculate(mode, h, f, t);

            updating = true;
            try {
                FrameLayout layer = overlay == null ? null : overlay.get();
                if (layer == null || layer.getParent() != decor) {
                    layer = new FrameLayout(host);
                    layer.setTag("nicoid-tab-decor-layer");
                    layer.setClipChildren(false);
                    layer.setClipToPadding(false);
                    layer.setClickable(false);
                    decor.addView(layer, new FrameLayout.LayoutParams(-1, -1));
                    overlay = new WeakReference<>(layer);
                }
                View placeholder = spacer == null ? null : spacer.get();
                if (placeholder == null || placeholder.getParent() != nativeParent) {
                    if (bar.getParent() != nativeParent) return;
                    int originalIndex = nativeParent.indexOfChild(bar);
                    nativeParent.removeView(bar);
                    placeholder = new View(host);
                    placeholder.setTag("nicoid-tab-layout-spacer");
                    placeholder.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                    nativeParent.addView(placeholder, originalIndex,
                            new LinearLayout.LayoutParams(-1, t));
                    spacer = new WeakReference<>(placeholder);
                }
                if (bar.getParent() != layer) {
                    if (bar.getParent() instanceof ViewGroup)
                        ((ViewGroup) bar.getParent()).removeView(bar);
                    layer.addView(bar, new FrameLayout.LayoutParams(-1, t));
                }
                int desiredIndex = MultiTabPlacement.tabAtBottom(mode)
                        ? nativeParent.getChildCount() - 1 : 0;
                if (nativeParent.indexOfChild(placeholder) != desiredIndex) {
                    nativeParent.removeView(placeholder);
                    nativeParent.addView(placeholder, desiredIndex,
                            new LinearLayout.LayoutParams(-1, t));
                } else if (placeholder.getLayoutParams().height != t) {
                    ViewGroup.LayoutParams params = placeholder.getLayoutParams();
                    params.height = t;
                    placeholder.setLayoutParams(params);
                }
                if (bar.getLayoutParams().height != t) {
                    ViewGroup.LayoutParams params = bar.getLayoutParams();
                    params.height = t;
                    bar.setLayoutParams(params);
                }
                // Android draws elevated native action bars independently of
                // view insertion order. This elevation is for correct z-order
                // only; no background or shadow is introduced.
                if (layer.getElevation() <= chrome.getElevation())
                    layer.setElevation(chrome.getElevation() + 1f);
                int[] chromeScreen = new int[2], layerScreen = new int[2];
                chrome.getLocationOnScreen(chromeScreen);
                layer.getLocationOnScreen(layerScreen);
                float nativeChromeY = chromeScreen[1] - chrome.getTranslationY();
                float targetTabY = nativeChromeY + placements[2] - layerScreen[1];
                if (bar.getTranslationY() != targetTabY) bar.setTranslationY(targetTabY);
                if (chrome.getTranslationY() != placements[0])
                    chrome.setTranslationY(placements[0]);
                if (frame.getTranslationY() != placements[1])
                    frame.setTranslationY(placements[1]);
                lastMode = mode;
            } finally {
                updating = false;
            }
        }
    }
}
