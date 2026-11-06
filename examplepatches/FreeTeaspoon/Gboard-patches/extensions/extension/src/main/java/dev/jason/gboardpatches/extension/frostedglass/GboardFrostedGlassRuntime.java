package dev.jason.gboardpatches.extension.frostedglass;

import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.util.Log;
import android.util.DisplayMetrics;

import java.util.Map;
import java.util.WeakHashMap;
import java.util.IdentityHashMap;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicBoolean;
import org.lsposed.hiddenapibypass.HiddenApiBypass;

/** Android public-API runtime for a bounded IME background blur. */
public final class GboardFrostedGlassRuntime {
    private static final String TAG = "GboardPatchesBlur";
    private static final float WINDOW_CORNER_RADIUS_DP = 32.0f;
    private static final String KEYBOARD_ROOT_TAG = ".keyboard-base-area.keyboard-outline";
    // Floating mode uses the same semantic root without the docked outline suffix.
    private static final String FLOATING_KEYBOARD_ROOT_TAG = ".keyboard-base-area";
    private static final Map<Window, State> STATES = new WeakHashMap<>();
    private static final AtomicBoolean HIDDEN_API_READY = new AtomicBoolean();
    private static volatile WeakReference<InputMethodService> activeService =
            new WeakReference<>(null);

    private GboardFrostedGlassRuntime() {
    }

    public static void onConfigureWindow(Object receiver, boolean fullscreen,
            boolean candidatesOnly) {
        if (!(receiver instanceof InputMethodService service)) {
            return;
        }
        activeService = new WeakReference<>(service);
        Window window = windowOf(service);
        if (window == null) {
            return;
        }
        if (!GboardFrostedGlassSettingsRuntime.isEnabled()
                || fullscreen || candidatesOnly || !canUseBackgroundBlur(service)) {
            disable(window);
            return;
        }
        ensureHiddenApiAccess();
        scheduleApply(window, service);
    }

    public static void afterConfigureWindow(Window window, boolean fullscreen,
            boolean candidatesOnly) {
        if (window == null) {
            return;
        }
        InputMethodService service = activeService.get();
        Context context = service != null ? service : contextOf(window);
        if (!GboardFrostedGlassSettingsRuntime.isEnabled()
                || fullscreen || candidatesOnly || context == null
                || !canUseBackgroundBlur(context)) {
            disable(window);
            return;
        }
        ensureHiddenApiAccess();
        scheduleApply(window, context);
    }

    public static void onWindowShown(Object receiver) {
        if (!(receiver instanceof InputMethodService service)) {
            return;
        }
        activeService = new WeakReference<>(service);
        Window window = windowOf(service);
        if (window == null) {
            return;
        }
        if (!GboardFrostedGlassSettingsRuntime.isEnabled()) {
            disable(window);
            return;
        }
        ensureHiddenApiAccess();
        View decor = window.getDecorView();
        if (decor != null) {
            State state = stateFor(window);
            installDecorLayoutObserver(window, service, decor, state);
            decor.post(() -> {
                if (GboardFrostedGlassSettingsRuntime.isEnabled()
                        && canUseBackgroundBlur(service)) {
                    scheduleApply(window, service);
                }
            });
        } else {
            onConfigureWindow(receiver, false, false);
        }
    }

    public static void onWindowHidden(Object receiver) {
        Window window = receiver instanceof InputMethodService service
                ? windowOf(service) : null;
        if (window != null) {
            disable(window);
        }
        activeService = new WeakReference<>(null);
    }

    private static void reapplyAfterLayout(Window window, Context context,
            State state, long layoutGeneration) {
        if (state.layoutGeneration != layoutGeneration
                || !GboardFrostedGlassSettingsRuntime.isEnabled()) {
            return;
        }
        try {
            verifyAndApply(window, context, state);
        } catch (Throwable ignored) {
            // Delayed theme reapplication must remain fail closed.
        }
    }

    private static void installDecorLayoutObserver(Window window,
            Context context, View decor, State state) {
        if (state.decorLayoutObserverInstalled) {
            return;
        }
        View.OnLayoutChangeListener listener = (view, left, top, right, bottom,
                oldLeft, oldTop, oldRight, oldBottom) -> {
            if (!GboardFrostedGlassSettingsRuntime.isEnabled()) {
                return;
            }
            long generation = ++state.layoutGeneration;
            view.postDelayed(() -> reapplyAfterLayout(window, context, state, generation), 48L);
            view.postDelayed(() -> reapplyAfterLayout(window, context, state, generation), 144L);
        };
        decor.addOnLayoutChangeListener(listener);
        state.decorLayoutObserverInstalled = true;
        state.decorLayoutObserver = listener;
    }

    private static boolean canUseBackgroundBlur(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || context == null) {
            return false;
        }
        try {
            WindowManager manager = context.getSystemService(WindowManager.class);
            return manager != null && manager.isCrossWindowBlurEnabled();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void scheduleApply(Window window, Context context) {
        try {
            State state = stateFor(window);
            window.clearFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
            window.setLayout(WindowManager.LayoutParams.MATCH_PARENT,
                    WindowManager.LayoutParams.WRAP_CONTENT);
            window.setGravity(Gravity.BOTTOM);
            View decor = window.getDecorView();
            if (decor == null) {
                disable(window);
                return;
            }
            constrainKeyboardSurface(decor, state);
            installDecorLayoutObserver(window, context, decor, state);
            decor.postDelayed(() -> verifyAndApply(window, context, state), 32L);
        } catch (Throwable ignored) {
            disable(window);
        }
    }

    private static void verifyAndApply(Window window, Context context, State state) {
        try {
            if (!GboardFrostedGlassSettingsRuntime.isEnabled()) {
                disable(window);
                return;
            }
            int radiusPx = GboardFrostedGlassSettingsRuntime.blurRadiusPx();
            int customOpacity = GboardFrostedGlassSettingsRuntime.customOpacityPercent();
            if (!isBoundedSurface(window)) {
                if (applyMiuiLocalBlur(window, window.getDecorView(), radiusPx,
                        customOpacity, state)) {
                    Log.i(TAG, "applied local radius=" + radiusPx);
                    return;
                }
                clearBlurEffects(window, state);
                return;
            }
            if (!canUseBackgroundBlur(context)) {
                disable(window);
                return;
            }
            clearBlurEffects(window, state);
            window.clearFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
            if (!state.windowBackgroundChanged) {
                state.originalWindowBackground = window.getDecorView() == null
                        ? null : window.getDecorView().getBackground();
            }
            window.setBackgroundDrawable(transparentRoundedBackground(context));
            state.windowBackgroundChanged = true;
            window.setBackgroundBlurRadius(radiusPx);
            state.windowBlurApplied = true;
            state.applied = true;
            state.appliedRadius = radiusPx;
            Log.i(TAG, "applied bounded radius=" + radiusPx);
        } catch (Throwable ignored) {
            disable(window);
        }
    }

    static boolean isBoundedSurface(int surfaceHeight, int displayHeight) {
        return surfaceHeight > 0 && displayHeight > 0
                && surfaceHeight < Math.round(displayHeight * 0.80f);
    }

    private static boolean isBoundedSurface(Window window) {
        View decor = window.getDecorView();
        if (decor == null || decor.getHeight() <= 0) {
            return false;
        }
        DisplayMetrics metrics = new DisplayMetrics();
        try {
            window.getWindowManager().getDefaultDisplay().getRealMetrics(metrics);
        } catch (Throwable ignored) {
            metrics.heightPixels = decor.getRootView().getHeight();
        }
        return isBoundedSurface(decor.getHeight(), metrics.heightPixels);
    }

    private static State stateFor(Window window) {
        synchronized (STATES) {
            State state = STATES.get(window);
            if (state == null) {
                state = new State(window);
                STATES.put(window, state);
            }
            return state;
        }
    }

    private static boolean applyMiuiLocalBlur(Window window, View decor, int radiusPx,
            int customOpacity, State state) {
        try {
            View keyboardRoot = findUsableViewWithTag(decor, KEYBOARD_ROOT_TAG);
            if (keyboardRoot == null) {
                keyboardRoot = findUsableViewWithTag(decor, FLOATING_KEYBOARD_ROOT_TAG);
            }
            if (keyboardRoot == null) {
                Log.w(TAG, "local blur root not found");
                return false;
            }
            applyThemeOpacity(decor, customOpacity, state);
            if (state.localBlurView == keyboardRoot && state.localBlurDrawable != null) {
                Method setRadius = state.localBlurDrawable.getClass().getDeclaredMethod(
                        "setBlurRadius", int.class);
                setRadius.setAccessible(true);
                setRadius.invoke(state.localBlurDrawable, radiusPx);
                applyThemeOpacity(decor, customOpacity, state);
                keyboardRoot.invalidate();
                return true;
            }
            if (state.localBlurDrawable != null && state.localBlurView != keyboardRoot) {
                restoreLocalBackground(state);
            }
            Drawable original = keyboardRoot.getBackground();
            Object blurDrawable = null;
            try {
                blurDrawable = createBackgroundBlurDrawable(keyboardRoot, radiusPx);
            } catch (ReflectiveOperationException | RuntimeException unavailable) {
                Log.i(TAG, "background blur drawable unavailable; trying RenderNode blur");
            }
            if (blurDrawable != null) {
                Drawable combined = original == null
                        ? (Drawable) blurDrawable
                        : new LayerDrawable(new Drawable[]{original, (Drawable) blurDrawable});
                keyboardRoot.setBackground(combined);
                keyboardRoot.invalidate();
                state.localBlurView = keyboardRoot;
                state.localBlurDrawable = blurDrawable;
                state.localOriginalBackground = original;
                state.localOriginalAlpha = state.originalSurfaceAlphas.getOrDefault(
                        keyboardRoot, original == null ? 255 : original.getAlpha());
                state.applied = true;
                return true;
            }
            View rootDecor = keyboardRoot.getRootView();
            if (rootDecor == null) {
                return false;
            }
            Field renderNodeField = View.class.getDeclaredField("mRenderNode");
            renderNodeField.setAccessible(true);
            Object renderNode = renderNodeField.get(rootDecor);
            if (renderNode == null) {
                return false;
            }
            state.localRenderNode = renderNode;
            state.localBlurView = rootDecor;
            Class<?> renderNodeClass = renderNode.getClass();
            Method setMode = renderNodeClass.getDeclaredMethod(
                    "setBackgroundBlurMode", int.class);
            Method setRadius = renderNodeClass.getDeclaredMethod(
                    "setBackgroundBlurRadius", int.class);
            Method setScale = renderNodeClass.getDeclaredMethod(
                    "setBackgroundBlurScaleRatio", float.class);
            Method setPath = renderNodeClass.getDeclaredMethod(
                    "setMiBackgroundBlurPath", Path.class);
            setMode.setAccessible(true);
            setRadius.setAccessible(true);
            setScale.setAccessible(true);
            setPath.setAccessible(true);
            int[] keyboardLocation = new int[2];
            int[] decorLocation = new int[2];
            keyboardRoot.getLocationInWindow(keyboardLocation);
            rootDecor.getLocationInWindow(decorLocation);
            float left = keyboardLocation[0] - decorLocation[0];
            float top = keyboardLocation[1] - decorLocation[1];
            float right = left + keyboardRoot.getWidth();
            float bottom = top + keyboardRoot.getHeight();
            float cornerRadius = WINDOW_CORNER_RADIUS_DP
                    * keyboardRoot.getResources().getDisplayMetrics().density;
            Path blurPath = new Path();
            blurPath.addRoundRect(new RectF(left, top, right, bottom),
                    cornerRadius, cornerRadius, Path.Direction.CW);
            boolean modeApplied = Boolean.TRUE.equals(setMode.invoke(renderNode, 1));
            boolean radiusApplied = Boolean.TRUE.equals(setRadius.invoke(renderNode, radiusPx));
            setScale.invoke(renderNode, 0.5f);
            setPath.invoke(renderNode, blurPath);
            try {
                Method setGlassRadius = renderNodeClass.getDeclaredMethod(
                        "setMiGlassBlurRadius", int.class, int.class);
                Method setGlassClip = renderNodeClass.getDeclaredMethod(
                        "setMiGlassClip", float.class, float.class, float.class, float.class);
                setGlassRadius.setAccessible(true);
                setGlassClip.setAccessible(true);
                setGlassRadius.invoke(renderNode, radiusPx, Math.min(radiusPx * 2, 320));
                setGlassClip.invoke(renderNode, left, top, right, bottom);
            } catch (Throwable ignored) {
                // Older Xiaomi builds expose only the standard RenderNode blur methods.
            }
            try {
                Method enhance = renderNodeClass.getDeclaredMethod(
                        "setMiBackgroundBlurEnhanceFlag", int.class);
                enhance.setAccessible(true);
                enhance.invoke(renderNode, 1);
            } catch (Throwable ignored) {
                // Enhancement is optional; mode + radius own the effect.
            }
            // Xiaomi's RenderNode path only becomes a backdrop sample when the Window
            // compositor blur is enabled as well. The path above clips it to the keyboard root.
            window.clearFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
            window.setBackgroundBlurRadius(radiusPx);
            state.windowBlurApplied = true;
            rootDecor.invalidate();
            state.applied = modeApplied || radiusApplied;
            return state.applied;
        } catch (Throwable throwable) {
            clearBlurEffects(window, state);
            Log.w(TAG, "clipped blur unavailable: " + throwable.getClass().getSimpleName(),
                    throwable);
            return false;
        }
    }

    private static Object createBackgroundBlurDrawable(View target, int radiusPx)
            throws ReflectiveOperationException {
        Method getViewRoot = View.class.getDeclaredMethod("getViewRootImpl");
        getViewRoot.setAccessible(true);
        Object viewRoot = getViewRoot.invoke(target);
        if (viewRoot == null) {
            return null;
        }
        Method create = viewRoot.getClass().getDeclaredMethod("createBackgroundBlurDrawable");
        create.setAccessible(true);
        Object drawable = create.invoke(viewRoot);
        if (!(drawable instanceof Drawable)) {
            return null;
        }
        Method setRadius = drawable.getClass().getDeclaredMethod("setBlurRadius", int.class);
        Method setVisible = drawable.getClass().getDeclaredMethod(
                "setVisible", boolean.class, boolean.class);
        Method setCorner = drawable.getClass().getDeclaredMethod("setCornerRadius", float.class);
        setRadius.setAccessible(true);
        setVisible.setAccessible(true);
        setCorner.setAccessible(true);
        setRadius.invoke(drawable, radiusPx);
        float corner = WINDOW_CORNER_RADIUS_DP
                * target.getResources().getDisplayMetrics().density;
        setCorner.invoke(drawable, corner);
        setVisible.invoke(drawable, true, false);
        return drawable;
    }

    private static View findUsableViewWithTag(View view, String expectedTag) {
        if (view == null) {
            return null;
        }
        Object tag = view.getTag();
        if (expectedTag.equals(tag) && isUsableRoot(view)) {
            return view;
        }
            if (view instanceof android.view.ViewGroup group) {
            for (int index = 0; index < group.getChildCount(); index++) {
                View match = findUsableViewWithTag(group.getChildAt(index), expectedTag);
                if (match != null) {
                    return match;
                }
            }
        }
        return null;
    }

    private static void ensureHiddenApiAccess() {
        if (HIDDEN_API_READY.get()) {
            return;
        }
        try {
            HiddenApiBypass.addHiddenApiExemptions("L");
            HIDDEN_API_READY.set(true);
            Log.i(TAG, "hidden API access enabled");
        } catch (Throwable failure) {
            Log.w(TAG, "hidden API access unavailable: "
                    + failure.getClass().getSimpleName());
        }
    }

    private static void constrainKeyboardSurface(View decor, State state) {
        View root = findVisibleViewWithTag(decor, KEYBOARD_ROOT_TAG);
        if (root == null) {
            root = findVisibleViewWithTag(decor, FLOATING_KEYBOARD_ROOT_TAG);
        }
        if (root == null) {
            Log.w(TAG, "keyboard surface tag not found");
            return;
        }
        setWrapContentBottom(root, state);
        View parent = root.getParent() instanceof View ? (View) root.getParent() : null;
        while (parent != null && parent != decor) {
            if ("com.google.android.libraries.inputmethod.inputview.InputView"
                    .equals(parent.getClass().getName())) {
                setWrapContentBottom(parent, state);
                break;
            }
            parent = parent.getParent() instanceof View ? (View) parent.getParent() : null;
        }
        View inputArea = decor.findViewById(android.R.id.inputArea);
        if (inputArea != null) setWrapContentBottom(inputArea, state);
        root.requestLayout();
    }

    private static void setWrapContentBottom(View view, State state) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params != null) {
            if (!state.originalLayouts.containsKey(view)) {
                state.originalLayouts.put(view, new LayoutSnapshot(view));
            }
            boolean changed = params.height != ViewGroup.LayoutParams.WRAP_CONTENT;
            params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            if (params instanceof android.widget.FrameLayout.LayoutParams frame) {
                changed |= frame.gravity != Gravity.BOTTOM;
                frame.gravity = Gravity.BOTTOM;
            }
            if (changed) view.setLayoutParams(params);
        }
    }

    private static View findVisibleViewWithTag(View view, String expectedTag) {
        if (view == null) return null;
        if (expectedTag.equals(view.getTag()) && view.getVisibility() == View.VISIBLE) return view;
        if (view instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findVisibleViewWithTag(group.getChildAt(i), expectedTag);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static boolean isUsableRoot(View view) {
        return view.getVisibility() == View.VISIBLE
                && view.getWidth() > 0
                && view.getHeight() > 0
                && view.isShown();
    }

    private static void applyThemeOpacity(View view, int customOpacity, State state) {
        Object tag = view.getTag();
        if (tag instanceof String tagString && isThemeSurfaceTag(tagString)) {
            Drawable background = view.getBackground();
            if (view != state.localBlurView && background != null
                    && background != state.localBlurDrawable
                    && !state.originalSurfaceAlphas.containsKey(view)) {
                state.originalSurfaceAlphas.put(view, background.getAlpha());
            }
            if (view != state.localBlurView && background != null
                    && background != state.localBlurDrawable) {
                background.setAlpha(customOpacity >= 0
                        ? customOpacity : state.originalSurfaceAlphas.get(view));
                view.invalidate();
            }
        }
        if (view instanceof android.view.ViewGroup group) {
            for (int index = 0; index < group.getChildCount(); index++) {
                applyThemeOpacity(group.getChildAt(index), customOpacity, state);
            }
        }
    }

    private static boolean isThemeSurfaceTag(String tag) {
        return tag.equals(".keyboard-base-area")
                || tag.equals(".keyboard-base-area.keyboard-outline")
                || tag.contains(".keyboard-header-area")
                || tag.contains(".keyboard-body-area")
                || tag.startsWith(".candidates-area");
    }

    private static void restoreLocalBackground(State state) {
        for (Map.Entry<View, Integer> entry : state.originalSurfaceAlphas.entrySet()) {
            Drawable background = entry.getKey().getBackground();
            if (background != null && background != state.localBlurDrawable) {
                background.setAlpha(entry.getValue());
                entry.getKey().invalidate();
            }
        }
        if (state.localBlurView != null && state.localBlurDrawable != null) {
            state.localBlurView.setBackground(state.localOriginalBackground);
            if (state.localOriginalBackground != null) {
                state.localOriginalBackground.setAlpha(state.localOriginalAlpha);
            }
            state.localBlurView.invalidate();
        }
        state.localBlurView = null;
        state.localBlurDrawable = null;
            state.localOriginalBackground = null;
        state.localOriginalAlpha = 255;
        state.originalSurfaceAlphas.clear();
    }

    private static Drawable transparentRoundedBackground(Context context) {
        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.TRANSPARENT);
        float density = context.getResources().getDisplayMetrics().density;
        background.setCornerRadius(WINDOW_CORNER_RADIUS_DP * density);
        return background;
    }

    private static void disable(Window window) {
        State state;
        synchronized (STATES) {
            state = STATES.remove(window);
        }
        if (state == null) return;
        if (state.decorLayoutObserverInstalled) {
            View decor = window.getDecorView();
            if (decor != null) decor.removeOnLayoutChangeListener(state.decorLayoutObserver);
            state.decorLayoutObserverInstalled = false;
        }
        clearBlurEffects(window, state);
        try {
            restoreKeyboardLayout(state);
        } catch (Throwable ignored) {
            // Layout restoration is independent of blur cleanup.
        }
        try {
            window.setLayout(state.originalWidth, state.originalHeight);
            window.setGravity(state.originalGravity);
        } catch (Throwable ignored) {
            // Window geometry restoration is best effort.
        }
        Log.i(TAG, "cleared");
    }

    private static Window windowOf(InputMethodService service) {
        try {
            Dialog dialog = service.getWindow();
            return dialog == null ? null : dialog.getWindow();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Context contextOf(Window window) {
        try {
            Context context = window.getContext();
            while (context instanceof ContextWrapper wrapper && context != wrapper.getBaseContext()) {
                if (context instanceof InputMethodService) {
                    return context;
                }
                context = wrapper.getBaseContext();
            }
            return context;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void clearBlurEffects(Window window, State state) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && state.windowBlurApplied) {
            try {
                window.setBackgroundBlurRadius(0);
            } catch (Throwable ignored) {
                // Best-effort cleanup on devices with an OEM blur implementation.
            }
            state.windowBlurApplied = false;
        }
        if (state.localRenderNode != null) {
            try {
                Class<?> renderNodeClass = state.localRenderNode.getClass();
                Method setRadius = renderNodeClass.getDeclaredMethod(
                        "setBackgroundBlurRadius", int.class);
                Method setMode = renderNodeClass.getDeclaredMethod(
                        "setBackgroundBlurMode", int.class);
                setRadius.setAccessible(true);
                setMode.setAccessible(true);
                setRadius.invoke(state.localRenderNode, 0);
                setMode.invoke(state.localRenderNode, 0);
                if (state.localBlurView != null) state.localBlurView.invalidate();
            } catch (Throwable ignored) {
                // Continue restoring view backgrounds and original layout state.
            }
            state.localRenderNode = null;
        }
        restoreLocalBackground(state);
        if (state.windowBackgroundChanged) {
            window.setBackgroundDrawable(state.originalWindowBackground);
            View decor = window.getDecorView();
            if (decor != null) decor.setBackground(state.originalWindowBackground);
            state.windowBackgroundChanged = false;
        }
        state.applied = false;
    }

    private static final class State {
        final Drawable originalBackground;
        final int originalWidth;
        final int originalHeight;
        final int originalGravity;
        boolean applied;
        int appliedRadius;
        boolean windowBlurApplied;
        boolean windowBackgroundChanged;
        Drawable originalWindowBackground;
        View localBlurView;
        Object localRenderNode;
        Object localBlurDrawable;
        Drawable localOriginalBackground;
        int localOriginalAlpha = 255;
        final Map<View, Integer> originalSurfaceAlphas = new IdentityHashMap<>();
        final Map<View, LayoutSnapshot> originalLayouts = new IdentityHashMap<>();
        long layoutGeneration;
        boolean decorLayoutObserverInstalled;
        View.OnLayoutChangeListener decorLayoutObserver;

        State(Window window) {
            WindowManager.LayoutParams attributes = window.getAttributes();
            originalBackground = window.getDecorView() == null
                    ? null : window.getDecorView().getBackground();
            originalWidth = attributes == null
                    ? WindowManager.LayoutParams.MATCH_PARENT : attributes.width;
            originalHeight = attributes == null
                    ? WindowManager.LayoutParams.MATCH_PARENT : attributes.height;
            originalGravity = attributes == null ? Gravity.NO_GRAVITY : attributes.gravity;
        }
    }

    private static void restoreKeyboardLayout(State state) {
        for (Map.Entry<View, LayoutSnapshot> entry : state.originalLayouts.entrySet()) {
            View view = entry.getKey();
            LayoutSnapshot snapshot = entry.getValue();
            ViewGroup.LayoutParams params = view.getLayoutParams();
            if (params == null) continue;
            params.height = snapshot.height;
            if (params instanceof android.widget.FrameLayout.LayoutParams frame
                    && snapshot.frameGravity != null) {
                frame.gravity = snapshot.frameGravity;
            }
            view.setLayoutParams(params);
        }
        state.originalLayouts.clear();
    }

    private static final class LayoutSnapshot {
        final int height;
        final Integer frameGravity;

        LayoutSnapshot(View view) {
            ViewGroup.LayoutParams params = view.getLayoutParams();
            height = params == null ? ViewGroup.LayoutParams.WRAP_CONTENT : params.height;
            frameGravity = params instanceof android.widget.FrameLayout.LayoutParams frame
                    ? frame.gravity : null;
        }
    }

}
