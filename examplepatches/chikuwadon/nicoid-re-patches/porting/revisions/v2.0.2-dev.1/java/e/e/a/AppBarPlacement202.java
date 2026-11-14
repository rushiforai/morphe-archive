package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Place the native AppCompat bar and the existing multi-tab strip without
 * replacing the ActionBar, its menu callbacks or the cached tab content.
 *
 * AppCompat owns the decor's measuring/layout lifecycle. Layout translations
 * retain its original hierarchy, while the content frame uses the space that
 * the bar leaves behind. Never reparent the ActionBarContainer.
 */
final class AppBarPlacement202 {
    private static final WeakHashMap<Activity, Controller> CONTROLLERS = new WeakHashMap<>();
    private AppBarPlacement202() {}

    private static Activity activity(Context context) {
        for (int attempts = 0; context != null && attempts < 12; attempts++) {
            if (context instanceof Activity) return (Activity)context;
            if (!(context instanceof ContextWrapper)) break;
            context = ((ContextWrapper)context).getBaseContext();
        }
        return null;
    }

    static void attach(LinearLayout parent, View tab) {
        if (parent == null || tab == null) return;
        Activity owner = activity(tab.getContext());
        if (owner == null) return;
        Controller controller;
        synchronized (CONTROLLERS) {
            controller = CONTROLLERS.get(owner);
            if (controller == null) {
                controller = new Controller(owner);
                CONTROLLERS.put(owner, controller);
            }
            controller.parent = new WeakReference<>(parent);
            controller.tab = new WeakReference<>(tab);
        }
        final Controller current = controller;
        tab.post(current::apply);
        current.install();
    }

    static void refreshCurrent() {
        synchronized (CONTROLLERS) {
            for (Controller controller : CONTROLLERS.values()) {
                if (controller == null) continue;
                LinearLayout parent = controller.parent == null ? null : controller.parent.get();
                View strip = controller.tab == null ? null : controller.tab.get();
                // Apply saved height and child order as well as positioning,
                // without recreating the Fragment or refetching its data.
                if (parent != null && strip != null && strip.getParent() == parent)
                    MultiTabPlacement.update(parent, strip);
                controller.apply();
            }
        }
    }

    static boolean touch(Activity owner, MotionEvent event) {
        Controller controller;
        synchronized (CONTROLLERS) {
            controller = CONTROLLERS.get(owner);
        }
        return controller != null && controller.forwardTouch(event);
    }

    private static View find(View view, String className) {
        if (view == null) return null;
        if (view.getClass().getName().endsWith(className)) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup)view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View result = find(group.getChildAt(i), className);
                if (result != null) return result;
            }
        }
        return null;
    }

    private static final class Controller implements ViewTreeObserver.OnGlobalLayoutListener {
        final WeakReference<Activity> owner;
        WeakReference<LinearLayout> parent;
        WeakReference<View> tab;
        private WeakReference<View> chrome, content;
        private boolean installed, forwarding;
        private int position = -1;

        Controller(Activity activity) {
            owner = new WeakReference<>(activity);
        }

        void install() {
            if (installed) return;
            Activity activity = owner.get();
            if (activity == null) return;
            View decor = activity.getWindow().getDecorView();
            if (decor == null || !decor.getViewTreeObserver().isAlive()) return;
            installed = true;
            decor.getViewTreeObserver().addOnGlobalLayoutListener(this);
        }

        @Override public void onGlobalLayout() { apply(); }

        void apply() {
            Activity activity = owner.get();
            View strip = tab == null ? null : tab.get();
            LinearLayout stripParent = parent == null ? null : parent.get();
            if (activity == null || strip == null || stripParent == null
                    || strip.getParent() != stripParent || !strip.isAttachedToWindow())
                return;
            View decor = activity.getWindow().getDecorView();
            if (decor == null) return;
            View app = chrome == null ? null : chrome.get();
            View frame = content == null ? null : content.get();
            if (app == null || frame == null || app.getRootView() != decor || frame.getRootView() != decor) {
                app = find(decor, "ActionBarContainer");
                frame = find(decor, "ContentFrameLayout");
                if (app == null || frame == null) return;
                chrome = new WeakReference<>(app);
                content = new WeakReference<>(frame);
            }
            int h = app.getHeight(), pageHeight = frame.getHeight();
            if (h < 1 || pageHeight < h || app.getVisibility() != View.VISIBLE) {
                if (app.getTranslationY() != 0) app.setTranslationY(0);
                if (frame.getTranslationY() != 0) frame.setTranslationY(0);
                if (strip.getTranslationY() != 0) strip.setTranslationY(0);
                return;
            }
            int mode = MultiTabPlacement.layout(MultiTabPlacement.prefs(activity));
            boolean bottomTab = MultiTabPlacement.tabAtBottom(mode);
            int desiredIndex = bottomTab ? stripParent.getChildCount() - 1 : 0;
            if (stripParent.indexOfChild(strip) != desiredIndex) {
                ViewGroup.LayoutParams lp = strip.getLayoutParams();
                stripParent.removeView(strip);
                stripParent.addView(strip, desiredIndex, lp);
                return;
            }
            int t = strip.getHeight();
            if (t <= 0) return;

            // AppCompat's content is normally beneath the action bar. The
            // optical shift of the content is only applied when app bar moves.
            float frameY = mode >= 3 ? -h : 0;
            float appY = mode == 1 ? t
                    : mode == 3 || mode == 5 ? pageHeight
                    : mode == 4 ? pageHeight - t : 0;
            float tabY = mode == 1 ? -h : mode == 4 ? h : 0;
            if (mode == 1 || mode >= 3) {
                ViewParent node = strip.getParent();
                while (node instanceof ViewGroup) {
                    ViewGroup ancestor = (ViewGroup)node;
                    ancestor.setClipChildren(false);
                    ancestor.setClipToPadding(false);
                    if (ancestor == decor) break;
                    node = ancestor.getParent();
                }
            }
            if (app.getTranslationY() != appY) app.setTranslationY(appY);
            if (frame.getTranslationY() != frameY) frame.setTranslationY(frameY);
            if (strip.getTranslationY() != tabY) strip.setTranslationY(tabY);
            position = mode;
        }

        boolean forwardTouch(MotionEvent event) {
            if (event == null) return false;
            View strip = tab == null ? null : tab.get();
            if (strip == null || (position != 1 && position != 4)) return false;
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                int[] location = new int[2];
                strip.getLocationOnScreen(location);
                float x = event.getRawX() - location[0];
                float y = event.getRawY() - location[1];
                forwarding = x >= 0 && x < strip.getWidth() && y >= 0 && y < strip.getHeight();
            }
            if (!forwarding) return false;
            int[] location = new int[2];
            strip.getLocationOnScreen(location);
            MotionEvent local = MotionEvent.obtain(event);
            local.setLocation(event.getRawX() - location[0], event.getRawY() - location[1]);
            try { strip.dispatchTouchEvent(local); }
            finally { local.recycle(); }
            if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL)
                forwarding = false;
            return true;
        }
    }
}
