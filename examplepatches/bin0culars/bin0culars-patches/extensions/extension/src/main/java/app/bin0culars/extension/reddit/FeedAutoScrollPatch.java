package app.bin0culars.extension.reddit;

import android.animation.TimeAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class FeedAutoScrollPatch {

    private static final class FeedEntry {
        final WeakReference<Object> stateRef;
        WeakReference<Object> sinkRef;
        long seq;

        FeedEntry(Object state, Object sink, long seq) {
            this.stateRef = new WeakReference<>(state);
            this.sinkRef = new WeakReference<>(sink);
            this.seq = seq;
        }
    }

    private static final class VmVisibilityAccessor {
        final Field field;
        final Method getValueMethod;

        VmVisibilityAccessor(Field field, Method getValueMethod) {
            this.field = field;
            this.getValueMethod = getValueMethod;
        }
    }

    private static WeakReference<Object> currentFeedState;
    private static WeakReference<Object> scrolledSink;
    private static WeakReference<Object> currentGridSink;
    private static boolean navBarShown = true;
    private static boolean searchScreenShown = false;
    private static boolean activityResumed = false;
    private static SharedPreferences.OnSharedPreferenceChangeListener prefChangeListener;
    private static WeakReference<View> overlayButtonRef;
    private static WeakReference<AutoScrollOverlayLayout> overlayContainerRef;
    private static TimeAnimator timeAnimator;
    private static boolean isScrolling = false;
    private static float scrolledPx = 0f;
    private static long startTimeMs = -1L;
    private static WindowInsets lastInsets;

    private static final List<FeedEntry> registry = new ArrayList<>();
    private static final List<WeakReference<View>> postViews = new ArrayList<>();
    private static long nextSeq = 0L;
    private static Method callableRefGetBoundReceiver;
    private static final Map<Class<?>, VmVisibilityAccessor> vmVisibilityCache = new HashMap<>();

    public static final class AutoScrollOverlayLayout extends FrameLayout {

        private final Rect hitRect = new Rect();
        private boolean touchingButton = false;

        public AutoScrollOverlayLayout(Context context) {
            super(context);
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent ev) {
            try {
                int action = ev.getActionMasked();
                if (action == MotionEvent.ACTION_DOWN) {
                    View button = overlayButtonRef != null ? overlayButtonRef.get() : null;
                    if (button != null && button.getVisibility() == View.VISIBLE) {
                        button.getHitRect(hitRect);
                        touchingButton = hitRect.contains((int) ev.getX(), (int) ev.getY());
                    } else {
                        touchingButton = false;
                    }
                    if (!touchingButton) {
                        if (isScrolling) {
                            stopAutoScroll();
                        }
                        return false;
                    }
                }
                if (touchingButton) {
                    boolean handled = super.dispatchTouchEvent(ev);
                    if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                        touchingButton = false;
                    }
                    return handled;
                }
            } catch (Throwable ignored) {
            }
            return false;
        }
    }

    private static float dispatchScroll(Object state, float delta) {
        // Modified during patching.
        return 0f;
    }

    public static void onGridComposing(Object sink) {
        try {
            currentGridSink = new WeakReference<>(sink);
        } catch (Throwable ignored) {
        }
    }

    public static void onListFeed(Object state, Object sink) {
        try {
            if (state == null || sink == null) {
                return;
            }
            registerFeed(state, sink);
        } catch (Throwable ignored) {
        }
    }

    public static void onGridState(Object state) {
        try {
            if (state == null || currentGridSink == null) {
                return;
            }
            Object sink = currentGridSink.get();
            if (sink == null) {
                return;
            }
            registerFeed(state, sink);
        } catch (Throwable ignored) {
        }
    }

    private static void registerFeed(Object state, Object sink) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            new Handler(Looper.getMainLooper()).post(() -> registerFeed(state, sink));
            return;
        }
        for (int i = registry.size() - 1; i >= 0; i--) {
            FeedEntry entry = registry.get(i);
            if (entry.stateRef.get() == null || entry.sinkRef.get() == null) {
                registry.remove(i);
            }
        }
        boolean found = false;
        for (int i = 0; i < registry.size(); i++) {
            FeedEntry entry = registry.get(i);
            if (entry.stateRef.get() == state) {
                entry.sinkRef = new WeakReference<>(sink);
                entry.seq = ++nextSeq;
                found = true;
                break;
            }
        }
        if (!found) {
            registry.add(new FeedEntry(state, sink, ++nextSeq));
        }
        View button = overlayButtonRef != null ? overlayButtonRef.get() : null;
        if (button != null && button.getVisibility() != View.VISIBLE) {
            updateButtonVisibility();
        }
    }

    public static void onFeedVisibilityChanged() {
        try {
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    updateButtonVisibility();
                    if (isScrolling) {
                        Object sink = scrolledSink != null ? scrolledSink.get() : null;
                        Object vm = sink != null ? feedViewModel(sink) : null;
                        if (vm == null || !isOnScreen(vm)) {
                            stopAutoScroll();
                        }
                    }
                } catch (Throwable ignored) {
                }
            });
        } catch (Throwable ignored) {
        }
    }

    public static void onPostPageViewCreated(View view) {
        try {
            if (view == null) {
                return;
            }
            if (!isTablet(view.getContext())) {
                postViews.add(new WeakReference<>(view));
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override
                    public void onViewAttachedToWindow(View v) {
                        try {
                            stopAutoScroll();
                            updateButtonVisibility();
                        } catch (Throwable ignored) {
                        }
                    }

                    @Override
                    public void onViewDetachedFromWindow(View v) {
                        try {
                            updateButtonVisibility();
                        } catch (Throwable ignored) {
                        }
                    }
                });
            }
        } catch (Throwable ignored) {
        }
    }

    private static Object feedViewModel(Object sink) {
        if (sink == null) {
            return null;
        }
        try {
            if (callableRefGetBoundReceiver == null) {
                Class<?> callableRefClass = Class.forName("kotlin.jvm.internal.CallableReference");
                callableRefGetBoundReceiver = callableRefClass.getMethod("getBoundReceiver");
                callableRefGetBoundReceiver.setAccessible(true);
            }
            Class<?> callableRefClass = callableRefGetBoundReceiver.getDeclaringClass();
            for (Field field : sink.getClass().getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object value = field.get(sink);
                    if (value != null && callableRefClass.isInstance(value)) {
                        Object receiver = callableRefGetBoundReceiver.invoke(value);
                        if (receiver != null && isRedditFeedViewModel(receiver.getClass())) {
                            return receiver;
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean isRedditFeedViewModel(Class<?> clazz) {
        Class<?> current = clazz;
        while (current != null && current != Object.class) {
            if ("com.reddit.feeds.impl.ui.RedditFeedViewModel".equals(current.getName())) {
                return true;
            }
            current = current.getSuperclass();
        }
        return false;
    }

    private static boolean isOnScreen(Object vm) {
        if (vm == null) {
            return false;
        }
        try {
            Class<?> vmClass = vm.getClass();
            VmVisibilityAccessor accessor = vmVisibilityCache.get(vmClass);
            if (accessor == null) {
                accessor = findVisibilityAccessor(vm);
                if (accessor != null) {
                    vmVisibilityCache.put(vmClass, accessor);
                }
            }
            if (accessor != null) {
                Object flow = accessor.field.get(vm);
                if (flow != null) {
                    Object val = accessor.getValueMethod.invoke(flow);
                    if (val instanceof Enum) {
                        return "ON_SCREEN".equals(((Enum<?>) val).name());
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static VmVisibilityAccessor findVisibilityAccessor(Object vm) {
        Class<?> current = vm.getClass();
        while (current != null && current != Object.class) {
            Field[] fields = current.getDeclaredFields();
            for (Field field : fields) {
                try {
                    field.setAccessible(true);
                    Object flow = field.get(vm);
                    if (flow != null && flow.getClass().getName().startsWith("kotlinx.coroutines.flow.")) {
                        Method getValue = flow.getClass().getMethod("getValue");
                        if (Modifier.isPublic(getValue.getModifiers()) && getValue.getParameterTypes().length == 0) {
                            getValue.setAccessible(true);
                            Object ret = getValue.invoke(flow);
                            if (ret instanceof Enum) {
                                String enumClassName = ((Enum<?>) ret).getDeclaringClass().getName();
                                if ("com.reddit.feeds.ui.FeedVisibility".equals(enumClassName)) {
                                    return new VmVisibilityAccessor(field, getValue);
                                }
                            }
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
            current = current.getSuperclass();
        }
        return null;
    }

    private static Object[] findOnScreenFeed() {
        try {
            for (int i = registry.size() - 1; i >= 0; i--) {
                FeedEntry entry = registry.get(i);
                if (entry.stateRef.get() == null || entry.sinkRef.get() == null) {
                    registry.remove(i);
                }
            }
            List<FeedEntry> sorted = new ArrayList<>(registry);
            Collections.sort(sorted, (a, b) -> Long.compare(b.seq, a.seq));
            for (FeedEntry entry : sorted) {
                Object state = entry.stateRef.get();
                Object sink = entry.sinkRef.get();
                if (state == null || sink == null) {
                    continue;
                }
                Object vm = feedViewModel(sink);
                if (vm != null && isOnScreen(vm)) {
                    return new Object[] { state, sink };
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    public static void onNavBarFraction(float fraction) {
        try {
            navBarShown = fraction > 0.5f;
            if (!isTablet()) {
                updateButtonVisibility();
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onActivityResumed(Activity activity) {
        try {
            if (activity == null) {
                return;
            }

            if (prefChangeListener == null) {
                Context appContext = activity.getApplicationContext();
                if (appContext != null) {
                    SharedPreferences prefs = appContext.getSharedPreferences("bin0culars_mods", Context.MODE_PRIVATE);
                    prefChangeListener = (sharedPreferences, key) -> {
                        try {
                            if ("feed_auto_scroll".equals(key)) {
                                updateButtonVisibility();
                            }
                        } catch (Throwable ignored) {
                        }
                    };
                    prefs.registerOnSharedPreferenceChangeListener(prefChangeListener);
                }
            }

            ViewGroup parent = null;
            int containerId = activity.getResources().getIdentifier("frame_container", "id", activity.getPackageName());
            if (containerId != 0) {
                View container = activity.findViewById(containerId);
                if (container instanceof ViewGroup) {
                    parent = (ViewGroup) container;
                }
            }
            if (parent == null) {
                parent = activity.findViewById(android.R.id.content);
            }
            if (parent == null) {
                return;
            }

            final String overlayTag = "bin0culars_auto_scroll_overlay";
            final String buttonTag = "bin0culars_auto_scroll_button";

            View existing = parent.findViewWithTag(overlayTag);
            AutoScrollOverlayLayout overlay;
            if (existing instanceof AutoScrollOverlayLayout) {
                overlay = (AutoScrollOverlayLayout) existing;
                View btn = overlay.findViewWithTag(buttonTag);
                if (btn != null) {
                    overlayButtonRef = new WeakReference<>(btn);
                }
                parent.bringChildToFront(overlay);
            } else {
                overlay = new AutoScrollOverlayLayout(activity);
                overlay.setTag(overlayTag);
                overlay.setClickable(false);
                overlay.setFocusable(false);
                overlay.setLayoutParams(new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT
                ));

                ImageButton button = createButton(activity);
                button.setTag(buttonTag);
                button.setVisibility(View.GONE);
                overlay.addView(button);
                overlayButtonRef = new WeakReference<>(button);

                overlay.setOnApplyWindowInsetsListener((v, insets) -> {
                    try {
                        lastInsets = insets;
                        updateButtonLayout();
                    } catch (Throwable ignored) {
                    }
                    return v.onApplyWindowInsets(insets);
                });

                parent.addView(overlay);
            }

            overlayContainerRef = new WeakReference<>(overlay);
            activityResumed = true;

            updateButtonLayout();
            updateButtonIcon();
            updateButtonVisibility();
        } catch (Throwable ignored) {
        }
    }

    public static void onActivityPaused(Activity activity) {
        try {
            activityResumed = false;
            stopAutoScroll();
            updateButtonVisibility();
        } catch (Throwable ignored) {
        }
    }

    public static void onScreenAttachChanged(boolean isSearchScreen, boolean attached) {
        try {
            if (!isSearchScreen) {
                return;
            }
            searchScreenShown = attached;
            if (attached) {
                stopAutoScroll();
            }
            updateButtonVisibility();
        } catch (Throwable ignored) {
        }
    }

    private static ImageButton createButton(Context context) {
        ImageButton button = new ImageButton(context);
        int size = dp(context, 48);
        button.setLayoutParams(new FrameLayout.LayoutParams(size, size));
        int pad = dp(context, 12);
        button.setPadding(pad, pad, pad, pad);
        button.setScaleType(ImageView.ScaleType.CENTER_INSIDE);

        updateButtonBackground(button, context);

        button.setOnClickListener(v -> {
            try {
                if (isScrolling) {
                    stopAutoScroll();
                } else {
                    startAutoScroll();
                }
            } catch (Throwable ignored) {
            }
        });

        return button;
    }

    private static void updateButtonBackground(ImageButton button, Context context) {
        try {
            int textColorPrimary = resolveColor(context, android.R.attr.textColorPrimary);
            if (textColorPrimary == 0) {
                textColorPrimary = Color.WHITE;
            }

            GradientDrawable bgShape = new GradientDrawable();
            bgShape.setShape(GradientDrawable.OVAL);

            if (!isTablet(context)) {
                int bgColor = resolveColor(context, android.R.attr.colorBackground);
                if (bgColor == 0) {
                    bgColor = Color.WHITE;
                }
                bgShape.setColor(bgColor);
                button.setElevation(dp(context, 6));
                button.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
            } else {
                button.setElevation(0f);
                int tintAlpha = (int) (255 * 0.12f);
                int bgColor = Color.argb(
                        tintAlpha,
                        Color.red(textColorPrimary),
                        Color.green(textColorPrimary),
                        Color.blue(textColorPrimary)
                );
                bgShape.setColor(bgColor);
            }

            int rippleAlpha = (int) (255 * 0.25f);
            int rippleColor = Color.argb(
                    rippleAlpha,
                    Color.red(textColorPrimary),
                    Color.green(textColorPrimary),
                    Color.blue(textColorPrimary)
            );
            RippleDrawable rippleDrawable = new RippleDrawable(
                    ColorStateList.valueOf(rippleColor),
                    bgShape,
                    bgShape
            );
            button.setBackground(rippleDrawable);
        } catch (Throwable ignored) {
        }
    }

    private static void startAutoScroll() {
        try {
            if (!BinocularsMods.isEnabled("feed_auto_scroll")) {
                return;
            }
            Object[] target = findOnScreenFeed();
            if (target == null) {
                return;
            }
            Object state = target[0];
            Object sink = target[1];
            if (state == null || sink == null) {
                return;
            }
            if (isScrolling) {
                return;
            }
            View btn = overlayButtonRef != null ? overlayButtonRef.get() : null;
            if (btn == null) {
                return;
            }
            Context context = btn.getContext();

            String choice = BinocularsMods.getChoice("feed_auto_scroll_speed");
            float dpPerSec = 80f;
            if ("slow".equals(choice)) {
                dpPerSec = 40f;
            } else if ("fast".equals(choice)) {
                dpPerSec = 160f;
            } else if ("very_fast".equals(choice)) {
                dpPerSec = 280f;
            }

            final float speed = dpPerSec;
            final float density = context.getResources().getDisplayMetrics().density;
            final float speedPxPerMs = (speed * density) / 1000f;

            currentFeedState = new WeakReference<>(state);
            scrolledSink = new WeakReference<>(sink);
            isScrolling = true;
            scrolledPx = 0f;
            startTimeMs = -1L;
            updateButtonIcon();

            if (timeAnimator != null) {
                timeAnimator.cancel();
            }
            timeAnimator = new TimeAnimator();
            timeAnimator.setTimeListener((animation, totalTime, deltaTime) -> {
                try {
                    if (!isScrolling) {
                        animation.cancel();
                        return;
                    }
                    Object curState = currentFeedState != null ? currentFeedState.get() : null;
                    if (curState == null) {
                        stopAutoScroll();
                        return;
                    }
                    if (startTimeMs < 0) {
                        startTimeMs = totalTime;
                    } else if (deltaTime > 100) {
                        startTimeMs += deltaTime;
                    }
                    float targetPx = speedPxPerMs * (totalTime - startTimeMs);
                    float delta = targetPx - scrolledPx;
                    if (delta > 0f) {
                        dispatchScroll(curState, delta);
                        scrolledPx = targetPx;
                    }
                } catch (Throwable ignored) {
                }
            });
            timeAnimator.start();
        } catch (Throwable ignored) {
        }
    }

    private static void stopAutoScroll() {
        try {
            isScrolling = false;
            scrolledPx = 0f;
            startTimeMs = -1L;
            scrolledSink = null;
            currentFeedState = null;
            if (timeAnimator != null) {
                timeAnimator.cancel();
                timeAnimator = null;
            }
            updateButtonIcon();
        } catch (Throwable ignored) {
        }
    }

    private static void updateButtonIcon() {
        try {
            View v = overlayButtonRef != null ? overlayButtonRef.get() : null;
            if (!(v instanceof ImageButton)) {
                return;
            }
            ImageButton button = (ImageButton) v;
            Context context = button.getContext();
            String drawableName = isScrolling ? "icon_stop_fill" : "icon_play_fill";
            int resId = getDrawableId(context, drawableName);
            if (resId != 0) {
                button.setImageResource(resId);
            }
            int textColorPrimary = resolveColor(context, android.R.attr.textColorPrimary);
            if (textColorPrimary != 0) {
                button.setColorFilter(textColorPrimary);
            }
            String descKey = isScrolling ? "bin0culars_auto_scroll_stop" : "bin0culars_auto_scroll_start";
            String desc = getString(context, descKey);
            if (!desc.isEmpty()) {
                button.setContentDescription(desc);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void updateButtonLayout() {
        try {
            View button = overlayButtonRef != null ? overlayButtonRef.get() : null;
            View overlay = overlayContainerRef != null ? overlayContainerRef.get() : null;
            if (button == null || overlay == null) {
                return;
            }
            Context context = button.getContext();
            if (button instanceof ImageButton) {
                updateButtonBackground((ImageButton) button, context);
            }
            int size = dp(context, 48);
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(size, size);
            lp.gravity = Gravity.BOTTOM | Gravity.LEFT;

            int bottomInset = getSystemInsetBottom(overlay);
            int leftInset = getSystemInsetLeft(overlay);

            if (isTablet(context)) {
                int leftMargin = leftInset + dp(context, 24);
                int bottomMargin = bottomInset + dp(context, 24);
                lp.leftMargin = leftMargin;
                lp.bottomMargin = bottomMargin;
            } else {
                int leftMargin = leftInset + dp(context, 16);
                int bottomMargin = bottomInset + dp(context, 72);
                lp.leftMargin = leftMargin;
                lp.bottomMargin = bottomMargin;
            }
            button.setLayoutParams(lp);
        } catch (Throwable ignored) {
        }
    }

    private static boolean postPageShown() {
        try {
            boolean shown = false;
            for (int i = postViews.size() - 1; i >= 0; i--) {
                View view = postViews.get(i).get();
                if (view == null) {
                    postViews.remove(i);
                } else if (view.isAttachedToWindow()) {
                    shown = true;
                }
            }
            return shown;
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void updateButtonVisibility() {
        try {
            if (Looper.myLooper() != Looper.getMainLooper()) {
                new Handler(Looper.getMainLooper()).post(FeedAutoScrollPatch::updateButtonVisibility);
                return;
            }
            View button = overlayButtonRef != null ? overlayButtonRef.get() : null;
            if (button == null) {
                return;
            }
            Context context = button.getContext();
            boolean enabled = BinocularsMods.isEnabled("feed_auto_scroll");
            boolean tablet = isTablet(context);
            boolean visible = enabled && activityResumed && (tablet || navBarShown) && findOnScreenFeed() != null && !postPageShown() && !searchScreenShown;

            if (!visible && isScrolling) {
                stopAutoScroll();
            }

            int newVisibility = visible ? View.VISIBLE : View.GONE;
            if (button.getVisibility() != newVisibility) {
                button.setVisibility(newVisibility);
                if (visible) {
                    updateButtonLayout();
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isTablet(Context context) {
        try {
            if (context != null) {
                return context.getResources().getConfiguration().screenWidthDp >= 600;
            }
        } catch (Throwable ignored) {
        }
        return Resources.getSystem().getConfiguration().screenWidthDp >= 600;
    }

    private static boolean isTablet() {
        View btn = overlayButtonRef != null ? overlayButtonRef.get() : null;
        Context ctx = btn != null ? btn.getContext() : null;
        return isTablet(ctx);
    }

    private static int getSystemInsetLeft(View view) {
        try {
            WindowInsets insets = (Build.VERSION.SDK_INT >= 23 && view != null) ? view.getRootWindowInsets() : null;
            if (insets == null) {
                insets = lastInsets;
            }
            if (insets != null) {
                if (Build.VERSION.SDK_INT >= 30) {
                    return insets.getInsets(WindowInsets.Type.systemBars()).left;
                } else {
                    return insets.getSystemWindowInsetLeft();
                }
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private static int getSystemInsetBottom(View view) {
        try {
            WindowInsets insets = (Build.VERSION.SDK_INT >= 23 && view != null) ? view.getRootWindowInsets() : null;
            if (insets == null) {
                insets = lastInsets;
            }
            if (insets != null) {
                if (Build.VERSION.SDK_INT >= 30) {
                    return insets.getInsets(WindowInsets.Type.systemBars()).bottom;
                } else {
                    return insets.getSystemWindowInsetBottom();
                }
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private static String getString(Context context, String name) {
        try {
            int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
            if (id != 0) {
                return context.getString(id);
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    private static int getDrawableId(Context context, String name) {
        try {
            return context.getResources().getIdentifier(name, "drawable", context.getPackageName());
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static int dp(Context context, float dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                context.getResources().getDisplayMetrics()
        );
    }

    private static int resolveColor(Context context, int attr) {
        try {
            TypedValue typedValue = new TypedValue();
            if (context.getTheme().resolveAttribute(attr, typedValue, true)) {
                if (typedValue.type >= TypedValue.TYPE_FIRST_COLOR_INT && typedValue.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                    return typedValue.data;
                }
                if (typedValue.resourceId != 0) {
                    return context.getColor(typedValue.resourceId);
                }
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }
}