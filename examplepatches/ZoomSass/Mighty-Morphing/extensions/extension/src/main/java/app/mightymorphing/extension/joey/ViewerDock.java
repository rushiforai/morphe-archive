package app.mightymorphing.extension.joey;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.view.ViewConfiguration;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.ActionMode;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.view.accessibility.AccessibilityEvent;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/**
 * The media viewer overlay only. Joey still plays the picture and still closes on a swipe.
 */
public final class ViewerDock {
    private static final String DOCK = "morphe_viewer_dock";
    /** One dock per icon row. An album keeps a row on every page. */
    private static final WeakHashMap<View, Dock> PAGES = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Boolean> ATTACHED = new WeakHashMap<>();

    private ViewerDock() {
    }

    public static void attach(Activity activity) {
        if (activity == null || !ModernUi.isModernUiEnabled(activity)) return;
        if (ATTACHED.containsKey(activity)) return;
        ATTACHED.put(activity, Boolean.TRUE);
        try {
            View decor = activity.getWindow().getDecorView();
            decor.post(() -> watch(activity));
            decor.getViewTreeObserver().addOnPreDrawListener(() -> adopt(activity));
        } catch (Throwable ignored) {
        }
    }

    /**
     * Paint the controls where Joey already put them. Moving the player row is what
     * dropped it down the screen and brought the volume slider onto pictures.
     */
    private static boolean adopt(Activity activity) {
        if (activity.isFinishing()) return true;
        int id = activity.getResources().getIdentifier(
                "media_viewer_controls_container", "id", activity.getPackageName());
        if (id == 0) return true;
        List<View> bars = new ArrayList<>();
        collect(activity.getWindow().getDecorView(), id, bars);
        boolean cancel = false;
        for (View actions : bars) {
            if (style(activity, actions)) cancel = true;
        }
        return !cancel;
    }

    private static void collect(View view, int id, List<View> out) {
        if (view.getId() == id) out.add(view);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), id, out);
    }

    /** Style one page. An album has several of these, and only one is on screen. */
    private static boolean style(Activity activity, View actions) {
        View page = actions.getParent() instanceof View ? (View) actions.getParent() : actions;
        View video = find(page, "videoView");
        boolean videoOpen = video instanceof ViewGroup && video.getVisibility() == View.VISIBLE;
        Dock dock = PAGES.get(actions);
        if (!DOCK.equals(actions.getTag())) {
            actions.setTag(DOCK);
            grow(actions, activity.getResources().getDisplayMetrics().density);
            dock = new Dock(activity, actions, video);
            PAGES.put(actions, dock);
        }
        if (dock == null) return false;
        View playback = videoOpen ? find(page, "exo_controls_container") : null;
        if (playback != null && dock.playback != playback) {
            dock.playback = playback;
            grow(playback, activity.getResources().getDisplayMetrics().density);
        }
        boolean moved = placeShade(dock, actions, videoOpen ? (ViewGroup) video : null);
        if (videoOpen && playback != null) {
            seat(dock, playback, actions);
            settle(playback);
        }
        plant(actions);
        plant(dock.playback);
        plant(shell(dock.playback, video));
        if (album(activity)) follow(dock);
        if (dock.shown && !dock.fading && (hold(actions) || hold(shell(dock.playback, video)) || hold(dock.shade))) {
            return true;
        }
        if (!album(activity) && !dock.waiting) dock.schedule();
        return moved;
    }

    /** The player hides its whole controller. Keep that shell up so the seek row does not drop. */
    private static View shell(View playback, View video) {
        View controller = playback;
        while (controller != null && controller.getParent() instanceof View && controller.getParent() != video) {
            controller = (View) controller.getParent();
        }
        return controller;
    }

    /**
     * Joey drops the seek row by resetting its padding, and hides the bar when controls are
     * collapsed. Put the padding back and keep the bar in the row. The fade only changes alpha.
     */
    private static void seat(Dock dock, View playback, View actions) {
        int height = actions.getHeight();
        float density = actions.getResources().getDisplayMetrics().density;
        if (height > 0 && height < Math.round(160 * density)) dock.row = height;
        if (dock.row <= 0 || playback.getPaddingBottom() == dock.row) return;
        playback.setPadding(playback.getPaddingLeft(), playback.getPaddingTop(), playback.getPaddingRight(), dock.row);
    }

    private static void settle(View playback) {
        plant(find(playback, "exo_progress"));
        plant(find(playback, "exo_more"));
    }

    /** Gone removes a row from the layout. Visible with alpha is what the fade uses. */
    private static void plant(View view) {
        if (view != null && view.getVisibility() != View.VISIBLE) view.setVisibility(View.VISIBLE);
    }

    /** Stay visible so Joey's padding does not drop the seek bar. One correction, then stop. */
    private static boolean hold(View view) {
        if (view == null || view.getVisibility() == View.VISIBLE) return false;
        view.setAlpha(1f);
        view.setVisibility(View.VISIBLE);
        quiet(view, false);
        return true;
    }

    private static void quiet(View view, boolean hidden) {
        view.setEnabled(!hidden);
        view.setClickable(!hidden);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) quiet(group.getChildAt(i), hidden);
    }

    /** One fade, drawn behind the controls. It does not change their size or position. */
    private static boolean placeShade(Dock dock, View actions, ViewGroup video) {
        ViewGroup host = video != null ? video : (actions.getParent() instanceof ViewGroup
                ? (ViewGroup) actions.getParent() : null);
        if (!(host instanceof FrameLayout) || dock.shade != null && dock.shade.getParent() == host) return false;
        if (dock.shade != null && dock.shade.getParent() instanceof ViewGroup) {
            ((ViewGroup) dock.shade.getParent()).removeView(dock.shade);
        }
        float density = host.getResources().getDisplayMetrics().density;
        View shade = new View(host.getContext());
        shade.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{0x00000000, 0x99000000}));
        shade.setClickable(false);
        shade.setFocusable(false);
        FrameLayout.LayoutParams place = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.round(148 * density), Gravity.BOTTOM);
        int index = host.getChildCount();
        if (video != null) {
            View progress = find(host, "exo_progress");
            View controller = progress;
            while (controller != null && controller.getParent() != host && controller.getParent() instanceof View) {
                controller = (View) controller.getParent();
            }
            if (controller != null && controller.getParent() == host) index = host.indexOfChild(controller);
        } else {
            index = host.indexOfChild(actions);
            if (index < 0) index = host.getChildCount();
        }
        host.addView(shade, index, place);
        dock.shade = shade;
        return true;
    }

    private static void grow(View view, float density) {
        if (!(view instanceof ViewGroup)) return;
        int size = Math.round(40 * density);
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getClass().getName().endsWith("halu")) {
                ViewGroup.LayoutParams params = child.getLayoutParams();
                if (params == null) continue;
                params.width = size;
                params.height = size;
                child.setLayoutParams(params);
            } else if (child instanceof ViewGroup) {
                grow(child, density);
            }
        }
    }

    private static View find(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    /** The album toolbar and the bottom icons fade as one. A separate tap was sending them opposite ways. */
    private static void follow(Dock dock) {
        View toolbar = find(dock.activity, "toolbar");
        if (toolbar == null) return;
        boolean top = toolbar.getVisibility() == View.VISIBLE && toolbar.getAlpha() > 0.5f;
        if (top == dock.shown) return;
        if (top) dock.show();
        else dock.hide();
    }

    private static boolean album(Activity activity) {
        Class<?> type = activity.getClass();
        while (type != null) {
            if (type.getName().endsWith("BaseAlbumActivity")) return true;
            type = type.getSuperclass();
        }
        return false;
    }

    /** Joey's own minimum swipe, as a fraction of the screen width. */
    private static float minDrag() {
        try {
            return Math.max(0.12f, Class.forName("za.a").getField("N").getFloat(null));
        } catch (Throwable ignored) {
            return 0.2f;
        }
    }

    /** A zoomed picture uses a sideways drag to pan, so that drag must not close the album. */
    private static boolean zoomed(View view) {
        if (view.isShown() && view.getClass().getName().endsWith("SubsamplingScaleImageView")) {
            Rect visible = new Rect();
            if (view.getGlobalVisibleRect(visible) && visible.height() > view.getHeight() / 2) {
                try {
                    float scale = (Float) view.getClass().getMethod("getScale").invoke(view);
                    float min = (Float) view.getClass().getMethod("getMinScale").invoke(view);
                    if (scale > min * 1.05f) return true;
                } catch (Throwable ignored) {
                }
            }
        }
        if (!(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (zoomed(group.getChildAt(i))) return true;
        }
        return false;
    }

    private static void watch(Activity activity) {
        Window window = activity.getWindow();
        if (window.getCallback() instanceof Relay) return;
        window.setCallback(new Relay(window.getCallback(), activity));
    }

    private static boolean playing(View video) {
        Object player = player(video);
        if (player == null) return false;
        try {
            Object state = player.getClass().getMethod("isPlaying").invoke(player);
            return Boolean.TRUE.equals(state);
        } catch (Throwable ignored) {
        }
        try {
            Object ready = player.getClass().getMethod("getPlayWhenReady").invoke(player);
            Object state = player.getClass().getMethod("getPlaybackState").invoke(player);
            return Boolean.TRUE.equals(ready) && Integer.valueOf(3).equals(state);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Object player(View video) {
        if (video == null || video.getVisibility() != View.VISIBLE) return null;
        try {
            return video.getClass().getMethod("getPlayer").invoke(video);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static View find(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
        return id == 0 ? null : activity.findViewById(id);
    }

    private static final class Dock implements Runnable {
        final Activity activity;
        final View actions;
        final View video;
        View playback;
        View shade;
        int row;
        boolean shown = true;
        boolean waiting;
        boolean fading;
        ValueAnimator motion;

        Dock(Activity activity, View actions, View video) {
            this.activity = activity;
            this.actions = actions;
            this.video = video;
        }

        void toggle() {
            if (shown) hide();
            else show();
        }

        void show() {
            if (motion != null) motion.cancel();
            fading = false;
            shown = true;
            reveal(shade);
            reveal(actions);
            reveal(playback);
            schedule();
        }

        void hide() {
            if (motion != null) motion.cancel();
            shown = false;
            waiting = false;
            fading = true;
            activity.getWindow().getDecorView().removeCallbacks(this);
            fade(shade, actions, playback);
        }

        void schedule() {
            activity.getWindow().getDecorView().removeCallbacks(this);
            waiting = false;
            if (shown && playing(video)) {
                waiting = true;
                activity.getWindow().getDecorView().postDelayed(this, 4000);
            }
        }

        @Override
        public void run() {
            if (playing(video)) hide();
        }

        private void reveal(View view) {
            if (view == null) return;
            view.animate().cancel();
            quiet(view, false);
            view.setAlpha(0f);
            if (view.getVisibility() != View.VISIBLE) view.setVisibility(View.VISIBLE);
            view.animate().alpha(1f).setDuration(240).setInterpolator(new DecelerateInterpolator()).start();
        }

        /** Alpha only. Changing visibility during the fade is what made the rows jump. */
        private void fade(View... views) {
            for (View view : views) {
                if (view != null) view.animate().cancel();
            }
            ValueAnimator animator = ValueAnimator.ofFloat(1f, 0f);
            animator.setDuration(280);
            animator.setInterpolator(new DecelerateInterpolator());
            animator.addUpdateListener(animation -> {
                float alpha = (Float) animation.getAnimatedValue();
                for (View view : views) {
                    if (view != null) view.setAlpha(alpha);
                }
            });
            animator.addListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    if (shown || motion != animation) return;
                    fading = false;
                    for (View view : views) {
                        if (view == null) continue;
                        view.setAlpha(0f);
                        quiet(view, true);
                    }
                }
            });
            motion = animator;
            animator.start();
        }

        boolean onChrome(MotionEvent event) {
            return hits(actions, event) || hits(playback, event);
        }

        private boolean hits(View view, MotionEvent event) {
            if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() < 0.5f) return false;
            int[] at = new int[2];
            view.getLocationOnScreen(at);
            float x = event.getRawX();
            float y = event.getRawY();
            return x >= at[0] && x < at[0] + view.getWidth() && y >= at[1] && y < at[1] + view.getHeight();
        }
    }

    private static final class Relay implements Window.Callback {
        final Window.Callback next;
        final Activity activity;
        final GestureDetector gestures;
        float downX;
        float downY;
        float velocityX;
        float velocityY;
        float lastRawX;
        float lastRawY;
        long sampleTime;
        boolean dragging;
        boolean blocked;
        boolean windowClear;
        View sheet;
        ColorDrawable wash;
        ValueAnimator glide;

        Relay(Window.Callback next, Activity activity) {
            this.next = next;
            this.activity = activity;
            this.gestures = new GestureDetector(activity, new GestureDetector.SimpleOnGestureListener() {
                @Override
                public boolean onSingleTapUp(MotionEvent event) {
                    if (album(activity)) return false;
                    Dock dock = dock();
                    if (dock != null && !dock.onChrome(event)) dock.toggle();
                    return false;
                }
            });
        }

        /** The icon row actually on screen. An album keeps another row on the pages beside it. */
        Dock dock() {
            Dock best = null;
            int bestArea = -1;
            for (Dock dock : PAGES.values()) {
                if (dock.activity != activity || dock.actions == null) continue;
                Rect visible = new Rect();
                if (!dock.actions.getGlobalVisibleRect(visible)) continue;
                int area = visible.width() * visible.height();
                if (area > bestArea) {
                    bestArea = area;
                    best = dock;
                }
            }
            return best;
        }

        @Override
        public boolean dispatchKeyEvent(KeyEvent event) {
            return next.dispatchKeyEvent(event);
        }

        @Override
        public boolean dispatchKeyShortcutEvent(KeyEvent event) {
            return next.dispatchKeyShortcutEvent(event);
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            try {
                if (sideways(event)) return true;
                Dock dock = dock();
                if (dock != null && event.getActionMasked() == MotionEvent.ACTION_DOWN && dock.onChrome(event)) {
                    dock.schedule();
                } else {
                    gestures.onTouchEvent(event);
                }
            } catch (Throwable ignored) {
            }
            return next.dispatchTouchEvent(event);
        }

        /**
         * A straight up or down moves between album pictures. Any other hold-and-drag
         * follows the finger the way a single picture does, then snaps back or closes.
         */
        private boolean sideways(MotionEvent event) {
            if (!album(activity) || !ModernUi.albumSwipe(activity)) return false;
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                downX = event.getRawX();
                downY = event.getRawY();
                lastRawX = downX;
                lastRawY = downY;
                velocityX = 0f;
                velocityY = 0f;
                sampleTime = event.getEventTime();
                dragging = false;
                sheet = albumSheet();
                blocked = sheet == null || zoomed(activity.getWindow().getDecorView());
                Dock dock = dock();
                if (dock != null && dock.onChrome(event)) blocked = true;
                if (glide != null) {
                    ValueAnimator running = glide;
                    glide = null;
                    running.cancel();
                }
                park();
                return false;
            }
            if (event.getPointerCount() > 1) {
                blocked = true;
                if (dragging) {
                    dragging = false;
                    glide(false);
                }
                return false;
            }
            if (blocked) return false;
            float dx = event.getRawX() - downX;
            float dy = event.getRawY() - downY;
            if (action == MotionEvent.ACTION_MOVE) {
                sample(event);
                if (!dragging) {
                    float slop = 16f * activity.getResources().getDisplayMetrics().density;
                    float ax = Math.abs(dx);
                    float ay = Math.abs(dy);
                    if (Math.max(ax, ay) < slop) return false;
                    if (ax < ay * 0.42f) {
                        blocked = true;
                        return false;
                    }
                    dragging = true;
                    revealBehind();
                    stopPager();
                    lift(true);
                    MotionEvent cancel = MotionEvent.obtain(event);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    next.dispatchTouchEvent(cancel);
                    cancel.recycle();
                }
                follow(dx, dy);
                return true;
            }
            if ((action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) && dragging) {
                dragging = false;
                glide(action == MotionEvent.ACTION_UP && farEnough(dx, dy));
                return true;
            }
            return false;
        }

        private void sample(MotionEvent event) {
            long now = event.getEventTime();
            float dt = now - sampleTime;
            if (dt > 0 && sampleTime != 0) {
                velocityX = (event.getRawX() - lastRawX) / dt * 1000f;
                velocityY = (event.getRawY() - lastRawY) / dt * 1000f;
            }
            lastRawX = event.getRawX();
            lastRawY = event.getRawY();
            sampleTime = now;
        }

        /** The album page. Its black background stays put and fades. The pictures follow the finger. */
        private View albumSheet() {
            View pager = find(activity, "viewPager");
            if (pager == null || !(pager.getParent() instanceof View)) return null;
            View parent = (View) pager.getParent();
            return parent.getParent() instanceof View ? (View) parent.getParent() : null;
        }

        /** Joey does this when a picture is grabbed, so the feed shows through the fading black. */
        private void revealBehind() {
            if (windowClear) return;
            windowClear = true;
            try {
                Class.forName("zd.p1").getMethod("b", Activity.class).invoke(null, activity);
            } catch (Throwable ignored) {
            }
            Window window = activity.getWindow();
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            View cursor = sheet;
            while (cursor != null) {
                if (cursor != sheet) cursor.setBackground(null);
                if (!(cursor.getParent() instanceof View)) break;
                cursor = (View) cursor.getParent();
            }
            window.getDecorView().setBackgroundColor(Color.TRANSPARENT);
            wash = new ColorDrawable(Color.BLACK);
            sheet.setBackground(wash);
        }

        private void stopPager() {
            View pager = find(activity, "viewPager");
            if (pager == null) return;
            try {
                int index = (Integer) pager.getClass().getMethod("getCurrentItem").invoke(pager);
                pager.getClass().getMethod("setCurrentItem", int.class, boolean.class).invoke(pager, index, false);
            } catch (Throwable ignored) {
            }
        }

        private void lift(boolean on) {
            if (!(sheet instanceof ViewGroup)) return;
            int type = on ? View.LAYER_TYPE_HARDWARE : View.LAYER_TYPE_NONE;
            ViewGroup group = (ViewGroup) sheet;
            for (int i = 0; i < group.getChildCount(); i++) {
                group.getChildAt(i).setLayerType(type, null);
            }
        }

        private void follow(float dx, float dy) {
            float progress = shift(dx, dy);
            if (wash != null) wash.setAlpha(Math.round(255f * 0.8f * (1f - progress)));
        }

        private float shift(float dx, float dy) {
            if (sheet instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) sheet;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View child = group.getChildAt(i);
                    child.setTranslationX(dx);
                    child.setTranslationY(dy);
                }
            }
            float width = Math.max(1, sheet.getWidth());
            float height = Math.max(1, sheet.getHeight());
            return Math.min(1f, Math.max(Math.abs(dx) / width, Math.abs(dy) / height));
        }

        private void park() {
            if (!(sheet instanceof ViewGroup)) return;
            ViewGroup group = (ViewGroup) sheet;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                child.setTranslationX(0f);
                child.setTranslationY(0f);
            }
            lift(false);
            if (wash != null) wash.setAlpha(255);
            else sheet.setBackgroundColor(Color.BLACK);
        }

        /** Same distances Joey uses to let go of a picture. A fast flick needs less travel. */
        private boolean farEnough(float dx, float dy) {
            int fling = ViewConfiguration.get(activity).getScaledMinimumFlingVelocity();
            boolean fast = Math.max(Math.abs(velocityX), Math.abs(velocityY)) > fling;
            float fraction = fast ? minDrag() / 2f : minDrag();
            float width = Math.max(1, sheet.getWidth());
            float height = Math.max(1, sheet.getHeight());
            return Math.abs(dx) > width * fraction || Math.abs(dy) > height * fraction;
        }

        private void glide(boolean close) {
            if (!(sheet instanceof ViewGroup) || ((ViewGroup) sheet).getChildCount() == 0) {
                if (close) closeAlbum();
                return;
            }
            View child = ((ViewGroup) sheet).getChildAt(0);
            float fromX = child.getTranslationX();
            float fromY = child.getTranslationY();
            float toX = 0f;
            float toY = 0f;
            if (close) {
                float length = (float) Math.max(1.0, Math.hypot(fromX, fromY));
                toX = fromX / length * sheet.getWidth() * 1.2f;
                toY = fromY / length * sheet.getHeight() * 1.2f;
            }
            if (glide != null) {
                ValueAnimator running = glide;
                glide = null;
                running.cancel();
            }
            ValueAnimator animator = ValueAnimator.ofFloat(0f, 1f);
            animator.setDuration(close ? 220 : 200);
            animator.setInterpolator(close ? new AccelerateInterpolator() : new DecelerateInterpolator());
            float endX = toX;
            float endY = toY;
            animator.addUpdateListener(animation -> {
                float t = (Float) animation.getAnimatedValue();
                follow(fromX + (endX - fromX) * t, fromY + (endY - fromY) * t);
                if (!close && wash != null) wash.setAlpha(Math.round(255f * (0.8f + 0.2f * t)));
            });
            animator.addListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    if (glide != animation) return;
                    if (close) closeAlbum();
                    else park();
                }
            });
            glide = animator;
            animator.start();
        }

        private void closeAlbum() {
            activity.finish();
            activity.overridePendingTransition(0, 0);
        }

        @Override
        public boolean dispatchTrackballEvent(MotionEvent event) {
            return next.dispatchTrackballEvent(event);
        }

        @Override
        public boolean dispatchGenericMotionEvent(MotionEvent event) {
            return next.dispatchGenericMotionEvent(event);
        }

        @Override
        public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
            return next.dispatchPopulateAccessibilityEvent(event);
        }

        @Override
        public View onCreatePanelView(int featureId) {
            return next.onCreatePanelView(featureId);
        }

        @Override
        public boolean onCreatePanelMenu(int featureId, Menu menu) {
            return next.onCreatePanelMenu(featureId, menu);
        }

        @Override
        public boolean onPreparePanel(int featureId, View view, Menu menu) {
            return next.onPreparePanel(featureId, view, menu);
        }

        @Override
        public boolean onMenuOpened(int featureId, Menu menu) {
            return next.onMenuOpened(featureId, menu);
        }

        @Override
        public boolean onMenuItemSelected(int featureId, MenuItem item) {
            return next.onMenuItemSelected(featureId, item);
        }

        @Override
        public void onWindowAttributesChanged(android.view.WindowManager.LayoutParams attrs) {
            next.onWindowAttributesChanged(attrs);
        }

        @Override
        public void onContentChanged() {
            next.onContentChanged();
        }

        @Override
        public void onWindowFocusChanged(boolean hasFocus) {
            next.onWindowFocusChanged(hasFocus);
        }

        @Override
        public void onAttachedToWindow() {
            next.onAttachedToWindow();
        }

        @Override
        public void onDetachedFromWindow() {
            next.onDetachedFromWindow();
        }

        @Override
        public void onPanelClosed(int featureId, Menu menu) {
            next.onPanelClosed(featureId, menu);
        }

        @Override
        public boolean onSearchRequested() {
            return next.onSearchRequested();
        }

        @Override
        public boolean onSearchRequested(SearchEvent searchEvent) {
            return next.onSearchRequested(searchEvent);
        }

        @Override
        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
            return next.onWindowStartingActionMode(callback);
        }

        @Override
        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) {
            return next.onWindowStartingActionMode(callback, type);
        }

        @Override
        public void onActionModeStarted(ActionMode mode) {
            next.onActionModeStarted(mode);
        }

        @Override
        public void onActionModeFinished(ActionMode mode) {
            next.onActionModeFinished(mode);
        }
    }
}
