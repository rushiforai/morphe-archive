package dev.jason.gboardpatches.extension.frostedglass;

import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.Outline;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewTreeObserver;
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

import dev.jason.gboardpatches.extension.flagsettings.GboardFlagRuntimeContext;

/** Android public-API runtime for a bounded IME background blur. */
public final class GboardFrostedGlassRuntime {
    private static final String TAG = "GboardPatchesBlur";
    private static final String KEYBOARD_ROOT_TAG = ".keyboard-base-area.keyboard-outline";
    // Floating mode uses the same semantic root without the docked outline suffix.
    private static final String FLOATING_KEYBOARD_ROOT_TAG = ".keyboard-base-area";
    private static final Map<Window, State> STATES = new WeakHashMap<>();
    private static final Map<Window, Boolean> CONFIGURED_EXCLUSIONS = new WeakHashMap<>();
    private static final AtomicBoolean HIDDEN_API_READY = new AtomicBoolean();
    private static volatile WeakReference<InputMethodService> activeService =
            new WeakReference<>(null);

    private GboardFrostedGlassRuntime() {
    }

    public static void onConfigureWindow(Object receiver, boolean fullscreen,
            boolean candidatesOnly) {
        try {
            if (!(receiver instanceof InputMethodService service)) {
                return;
            }
            activeService = new WeakReference<>(service);
            if (!isUserUnlocked(service)) {
                return;
            }
            Window window = windowOf(service);
            if (window == null) {
                return;
            }
            synchronized (STATES) {
                CONFIGURED_EXCLUSIONS.put(window, fullscreen || candidatesOnly);
            }
            if (!GboardFrostedGlassSettingsRuntime.isEnabled()
                    || fullscreen || candidatesOnly) {
                disable(window);
                return;
            }
            ensureHiddenApiAccess();
            if (canUseBackgroundBlur(service)) scheduleApply(window, service);
            else prepareBeforeDraw(window, service);
        } catch (Throwable ignored) {
            // Lifecycle entry points must fail closed and never crash the IME.
        }
    }

    public static void afterConfigureWindow(Window window, boolean fullscreen,
            boolean candidatesOnly) {
        try {
            if (window == null) {
                return;
            }
            InputMethodService service = activeService.get();
            Context context = service != null ? service : contextOf(window);
            if (!isUserUnlocked(context)) {
                return;
            }
            synchronized (STATES) {
                CONFIGURED_EXCLUSIONS.put(window, fullscreen || candidatesOnly);
            }
            if (!GboardFrostedGlassSettingsRuntime.isEnabled()
                    || fullscreen || candidatesOnly || context == null) {
                disable(window);
                return;
            }
            ensureHiddenApiAccess();
            if (canUseBackgroundBlur(context)) scheduleApply(window, context);
            else prepareBeforeDraw(window, context);
        } catch (Throwable ignored) {
            // Lifecycle entry points must fail closed and never crash the IME.
        }
    }

    public static void onWindowShown(Object receiver) {
        try {
            if (!(receiver instanceof InputMethodService service)) {
                return;
            }
            activeService = new WeakReference<>(service);
            if (!isUserUnlocked(service)) {
                return;
            }
            Window window = windowOf(service);
            if (window == null) {
                return;
            }
            if (!GboardFrostedGlassSettingsRuntime.isEnabled()
                    || isSurfaceExcluded(window, service)) {
                disable(window);
                return;
            }
            ensureHiddenApiAccess();
            if (canUseBackgroundBlur(service)) scheduleApply(window, service);
            else prepareBeforeDraw(window, service);
        } catch (Throwable ignored) {
            // Lifecycle entry points must fail closed and never crash the IME.
        }
    }

    public static void onWindowHidden(Object receiver) {
        try {
            if (!(receiver instanceof InputMethodService service)) {
                activeService = new WeakReference<>(null);
                return;
            }
            if (!isUserUnlocked(service)) {
                activeService = new WeakReference<>(null);
                return;
            }
            Window window = windowOf(service);
            if (window != null) {
                disable(window);
            }
            activeService = new WeakReference<>(null);
        } catch (Throwable ignored) {
            activeService = new WeakReference<>(null);
        }
    }

    static boolean isUserUnlocked(Context context) {
        return GboardFlagRuntimeContext.isUserUnlocked(context);
    }

    private static void reapplyAfterLayout(Window window, Context context,
            State state, long layoutGeneration) {
        if (!isCurrent(window, state) || state.layoutGeneration != layoutGeneration
                || !isUserUnlocked(context)) {
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
        installPreDrawObserver(window, context, decor, state);
        if (state.decorLayoutObserverInstalled) {
            return;
        }
        View.OnLayoutChangeListener listener = (view, left, top, right, bottom,
                oldLeft, oldTop, oldRight, oldBottom) -> {
            if (!isCurrent(window, state) || !isUserUnlocked(context)) {
                return;
            }
            long generation = ++state.layoutGeneration;
            state.settingsLoaded = false;
            verifyAndApply(window, context, state);
            view.postDelayed(() -> reapplyAfterLayout(window, context, state, generation), 48L);
            view.postDelayed(() -> reapplyAfterLayout(window, context, state, generation), 144L);
        };
        decor.addOnLayoutChangeListener(listener);
        state.observedDecor = decor;
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
            prepareBeforeDraw(window, context);
        } catch (Throwable ignored) {
            disable(window);
        }
    }

    private static void prepareBeforeDraw(Window window, Context context) {
        View decor = window.getDecorView();
        if (decor == null) return;
        State state = stateFor(window);
        state.settingsLoaded = false;
        installDecorLayoutObserver(window, context, decor, state);
        verifyAndApply(window, context, state);
    }

    private static void verifyAndApply(Window window, Context context, State state) {
        try {
            if (!isCurrent(window, state)) return;
            if (!isUserUnlocked(context) || isSurfaceExcluded(window, context)) {
                disable(window);
                return;
            }
            if (!state.settingsLoaded) {
                if (!GboardFrostedGlassSettingsRuntime.isEnabled()) {
                    disable(window);
                    return;
                }
                state.radiusPx = GboardFrostedGlassSettingsRuntime.blurRadiusPx();
                state.customOpacity = GboardFrostedGlassSettingsRuntime.customOpacityPercent();
                state.settingsLoaded = true;
            }
            int radiusPx = state.radiusPx;
            int customOpacity = state.customOpacity;
            View root = findKeyboardRoot(window.getDecorView());
            if (root == null || !root.isAttachedToWindow()) return;
            if (state.windowBackgroundChanged && state.windowBlurRoot == root) {
                GboardFrostedGlassShape shape = GboardFrostedGlassShape.resolve(root, root.getBackground());
                if (canUseBackgroundBlur(context) && isBoundedSurface(window)
                        && canUseWindowShape(window, root, shape)) {
                    applyWindowBlur(window, root, shape, radiusPx, customOpacity, state);
                    return;
                }
                window.setBackgroundBlurRadius(0);
                state.windowBlurApplied = false;
                window.setBackgroundDrawable(state.originalWindowBackground);
                state.windowBackgroundChanged = false;
            }
            if (applyMiuiLocalBlur(window, window.getDecorView(), radiusPx,
                    customOpacity, state)) {
                return;
            }
            GboardFrostedGlassShape shape = GboardFrostedGlassShape.resolve(root, root.getBackground());
            if (!canUseBackgroundBlur(context)
                    || state.localBlurDrawable != null || state.localRenderNode != null
                    || !isBoundedSurface(window) || !canUseWindowShape(window, root, shape)) {
                disable(window);
                return;
            }
            applyWindowBlur(window, root, shape, radiusPx, customOpacity, state);
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
            View keyboardRoot = findKeyboardRoot(decor);
            if (keyboardRoot == null) return false;
            if (state.localBlurDrawable != null
                    && (state.localBlurView != keyboardRoot
                    || keyboardRoot.getBackground() != state.localCombinedBackground)) {
                restoreLocalBackground(state);
            }
            Drawable original = state.localBlurView == keyboardRoot
                    && state.localBlurDrawable != null
                    ? state.localOriginalBackground : keyboardRoot.getBackground();
            GboardFrostedGlassShape shape = GboardFrostedGlassShape.resolve(keyboardRoot, original);
            if (shape == null) return false;
            applyThemeOpacity(decor, customOpacity, state);
            if (state.localRenderNode != null && state.localRenderRoot == keyboardRoot
                    && state.localRadiusPx == radiusPx && shape.sameGeometry(state.localShape)) {
                return state.applied;
            }
            if (state.localBlurView == keyboardRoot && state.localBlurDrawable != null) {
                if (state.localRadiusPx != radiusPx || !shape.sameGeometry(state.localShape)) {
                    configureBlurDrawable(state.localBlurDrawable, radiusPx, shape);
                    ((ThemeBlurBackground) state.localCombinedBackground).updateBounds(
                            shape, keyboardRoot.getWidth(), keyboardRoot.getHeight());
                    state.localRadiusPx = radiusPx;
                    state.localShape = shape;
                    keyboardRoot.invalidate();
                }
                return true;
            }
            Object blurDrawable = null;
            try {
                blurDrawable = createBackgroundBlurDrawable(keyboardRoot, radiusPx, shape);
            } catch (ReflectiveOperationException unavailable) {
            }
            if (blurDrawable != null) {
                if (state.localRenderNode != null || state.windowBackgroundChanged) {
                    clearRenderNode(state);
                    window.setBackgroundBlurRadius(0);
                    state.windowBlurApplied = false;
                    if (state.windowBackgroundChanged) {
                        window.setBackgroundDrawable(state.originalWindowBackground);
                        state.windowBackgroundChanged = false;
                    }
                }
                ThemeBlurBackground combined = new ThemeBlurBackground(original, (Drawable) blurDrawable);
                combined.updateBounds(shape, keyboardRoot.getWidth(), keyboardRoot.getHeight());
                keyboardRoot.setBackground(combined);
                keyboardRoot.invalidate();
                state.localBlurView = keyboardRoot;
                state.localBlurDrawable = blurDrawable;
                state.localOriginalBackground = original;
                state.localCombinedBackground = combined;
                state.localRadiusPx = radiusPx;
                state.localShape = shape;
                state.applied = true;
                Log.i(TAG, "applied local radius=" + radiusPx + " corners="
                        + shape.topLeft + "," + shape.topRight + ","
                        + shape.bottomLeft + "," + shape.bottomRight);
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
            Path blurPath = shape.path(left, top);
            state.localBlurView = rootDecor;
            state.localRenderNode = renderNode;
            boolean modeApplied = Boolean.TRUE.equals(setMode.invoke(renderNode, 1));
            boolean radiusApplied = Boolean.TRUE.equals(setRadius.invoke(renderNode, radiusPx));
            setScale.invoke(renderNode, 0.5f);
            setPath.invoke(renderNode, blurPath);
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
            state.localBlurView = rootDecor;
            state.localRenderNode = renderNode;
            state.applied = modeApplied || radiusApplied;
            if (state.applied) {
                state.localRenderRoot = keyboardRoot;
                state.localRadiusPx = radiusPx;
                state.localShape = shape;
            }
            return state.applied;
        } catch (Throwable throwable) {
            Log.w(TAG, "clipped blur unavailable: " + throwable.getClass().getSimpleName(),
                    throwable);
            return false;
        }
    }

    private static Object createBackgroundBlurDrawable(View target, int radiusPx,
            GboardFrostedGlassShape shape)
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
        configureBlurDrawable(drawable, radiusPx, shape);
        Method setVisible = drawable.getClass().getDeclaredMethod(
                "setVisible", boolean.class, boolean.class);
        setVisible.setAccessible(true);
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
        if (view == null) return;
        Object tag = view.getTag();
        if (tag instanceof String tagString && isThemeSurfaceTag(tagString)) {
            Drawable background = view == state.localBlurView && state.localBlurDrawable != null
                    && view.getBackground() == state.localCombinedBackground
                    ? state.localOriginalBackground : view.getBackground();
            background = opacityTarget(background);
            if (background != null) {
                SurfaceAlpha saved = state.originalSurfaceAlphas.get(background);
                if (saved == null) {
                    saved = new SurfaceAlpha(background.getAlpha());
                    state.originalSurfaceAlphas.put(background, saved);
                }
                int alpha = customOpacity >= 0 ? customOpacity : saved.original;
                int current = background.getAlpha();
                if (saved.requested != alpha || saved.observed != current) {
                    if (current != alpha) setSurfaceAlpha(background, alpha);
                    saved.requested = alpha;
                    saved.observed = background.getAlpha();
                    if (saved.observed != current) view.invalidate();
                }
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
        for (Map.Entry<Drawable, SurfaceAlpha> entry : state.originalSurfaceAlphas.entrySet()) {
            setSurfaceAlpha(entry.getKey(), entry.getValue().original);
        }
        if (state.localBlurView != null && state.localBlurDrawable != null) {
            if (state.localBlurView.getBackground() == state.localCombinedBackground) {
                state.localBlurView.setBackground(state.localOriginalBackground);
            }
            state.localBlurView.invalidate();
        }
        state.localBlurView = null;
        state.localBlurDrawable = null;
        state.localOriginalBackground = null;
        state.localCombinedBackground = null;
        state.localShape = null;
        state.originalSurfaceAlphas.clear();
    }

    private static Drawable transparentBackground(GboardFrostedGlassShape shape) {
        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.TRANSPARENT);
        background.setCornerRadius(shape.topLeft);
        return background;
    }

    private static void disable(Window window) {
        State state;
        synchronized (STATES) {
            state = STATES.remove(window);
        }
        if (state == null) return;
        ++state.layoutGeneration;
        if (state.preDrawTree != null && state.preDrawTree.isAlive()) {
            state.preDrawTree.removeOnPreDrawListener(state.preDrawObserver);
        }
        if (state.observedDecor != null && state.preDrawObserver != null) {
            ViewTreeObserver currentTree = state.observedDecor.getViewTreeObserver();
            if (currentTree.isAlive()) currentTree.removeOnPreDrawListener(state.preDrawObserver);
        }
        if (state.decorLayoutObserverInstalled) {
            View decor = state.observedDecor;
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
            state.localRenderRoot = null;
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

    private static void configureBlurDrawable(Object drawable, int radiusPx,
            GboardFrostedGlassShape shape) throws ReflectiveOperationException {
        Method setRadius = drawable.getClass().getDeclaredMethod("setBlurRadius", int.class);
        setRadius.setAccessible(true);
        setRadius.invoke(drawable, radiusPx);
        try {
            Method setCorners = drawable.getClass().getDeclaredMethod("setCornerRadius",
                    float.class, float.class, float.class, float.class);
            setCorners.setAccessible(true);
            setCorners.invoke(drawable, shape.topLeft, shape.topRight,
                    shape.bottomLeft, shape.bottomRight);
        } catch (NoSuchMethodException unavailable) {
            if (!shape.isUniform()) throw unavailable;
            Method setCorner = drawable.getClass().getDeclaredMethod("setCornerRadius", float.class);
            setCorner.setAccessible(true);
            setCorner.invoke(drawable, shape.topLeft);
        }
    }

    private static View findKeyboardRoot(View decor) {
        View root = findUsableViewWithTag(decor, KEYBOARD_ROOT_TAG);
        return root != null ? root : findUsableViewWithTag(decor, FLOATING_KEYBOARD_ROOT_TAG);
    }

    private static boolean canUseWindowShape(Window window, View root,
            GboardFrostedGlassShape shape) {
        if (root == null || shape == null || !shape.isUniform()) return false;
        View decor = window.getDecorView();
        int[] location = new int[2];
        root.getLocationInWindow(location);
        return location[0] == 0 && location[1] == 0
                && shape.bounds.equals(new Rect(0, 0, decor.getWidth(), decor.getHeight()));
    }

    private static final class ThemeBlurBackground extends LayerDrawable {
        private final Drawable theme;

        ThemeBlurBackground(Drawable theme, Drawable blur) {
            super(theme == null ? new Drawable[]{blur} : new Drawable[]{theme, blur});
            this.theme = theme;
        }

        void updateBounds(GboardFrostedGlassShape shape, int width, int height) {
            setLayerInset(getNumberOfLayers() - 1, shape.bounds.left, shape.bounds.top,
                    width - shape.bounds.right, height - shape.bounds.bottom);
        }

        @Override public void getOutline(Outline outline) {
            if (theme != null) theme.getOutline(outline);
            else outline.setEmpty();
        }
    }

    private static boolean isCurrent(Window window, State state) {
        synchronized (STATES) {
            return STATES.get(window) == state;
        }
    }

    private static void clearRenderNode(State state) throws ReflectiveOperationException {
        if (state.localRenderNode == null) return;
        Class<?> type = state.localRenderNode.getClass();
        Method radius = type.getDeclaredMethod("setBackgroundBlurRadius", int.class);
        Method mode = type.getDeclaredMethod("setBackgroundBlurMode", int.class);
        radius.setAccessible(true);
        mode.setAccessible(true);
        radius.invoke(state.localRenderNode, 0);
        mode.invoke(state.localRenderNode, 0);
        state.localRenderNode = null;
        state.localRenderRoot = null;
        if (state.localBlurView != null) state.localBlurView.invalidate();
    }

    private static void installPreDrawObserver(Window window, Context context,
            View decor, State state) {
        ViewTreeObserver tree = decor.getViewTreeObserver();
        if (state.preDrawTree == tree) return;
        if (state.preDrawTree != null && state.preDrawTree.isAlive()) {
            state.preDrawTree.removeOnPreDrawListener(state.preDrawObserver);
        }
        if (state.preDrawObserver != null) tree.removeOnPreDrawListener(state.preDrawObserver);
        ViewTreeObserver.OnPreDrawListener listener = () -> {
            if (isCurrent(window, state) && isUserUnlocked(context)) {
                verifyAndApply(window, context, state);
            }
            return true;
        };
        tree.addOnPreDrawListener(listener);
        state.preDrawTree = tree;
        state.preDrawObserver = listener;
    }

    private static boolean isSurfaceExcluded(Window window, Context context) {
        synchronized (STATES) {
            return Boolean.TRUE.equals(CONFIGURED_EXCLUSIONS.get(window)) || (context instanceof InputMethodService service && service.isFullscreenMode());
        }
    }

    private static void applyWindowBlur(Window window, View root, GboardFrostedGlassShape shape,
            int radiusPx, int customOpacity, State state) {
        if (!state.windowBackgroundChanged) {
            state.originalWindowBackground = window.getDecorView().getBackground();
        }
        applyThemeOpacity(window.getDecorView(), customOpacity, state);
        if (!state.windowBackgroundChanged || !shape.sameGeometry(state.windowShape)) {
            window.setBackgroundDrawable(transparentBackground(shape));
        }
        if (!state.windowBackgroundChanged || state.windowRadiusPx != radiusPx) {
            window.setBackgroundBlurRadius(radiusPx);
        }
        state.windowBackgroundChanged = true;
        state.windowBlurApplied = true;
        state.windowBlurRoot = root;
        state.windowShape = shape;
        state.windowRadiusPx = radiusPx;
        state.applied = true;
    }

    private static Drawable opacityTarget(Drawable drawable) {
        for (int depth = 0; depth < 16 && drawable instanceof DrawableWrapper wrapper; depth++) {
            drawable = wrapper.getDrawable();
        }
        return drawable;
    }

    private static void setSurfaceAlpha(Drawable drawable, int alpha) {
        if (drawable instanceof ColorDrawable color) {
            color.setColor((color.getColor() & 0x00ffffff) | (alpha << 24));
        } else {
            drawable.setAlpha(alpha);
        }
    }

    private static final class SurfaceAlpha {
        final int original;
        int requested = -1;
        int observed;

        SurfaceAlpha(int original) {
            this.original = original;
            observed = original;
        }
    }

    private static final class State {
        final Drawable originalBackground;
        final int originalWidth;
        final int originalHeight;
        final int originalGravity;
        boolean applied;
        boolean settingsLoaded;
        int radiusPx;
        int customOpacity;
        int localRadiusPx;
        GboardFrostedGlassShape localShape;
        GboardFrostedGlassShape windowShape;
        View windowBlurRoot;
        int windowRadiusPx;
        View localRenderRoot;
        ViewTreeObserver preDrawTree;
        ViewTreeObserver.OnPreDrawListener preDrawObserver;
        int appliedRadius;
        boolean windowBlurApplied;
        boolean windowBackgroundChanged;
        Drawable originalWindowBackground;
        View localBlurView;
        Object localRenderNode;
        Object localBlurDrawable;
        Drawable localOriginalBackground;
        Drawable localCombinedBackground;
        View observedDecor;
        final Map<Drawable, SurfaceAlpha> originalSurfaceAlphas = new IdentityHashMap<>();
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
