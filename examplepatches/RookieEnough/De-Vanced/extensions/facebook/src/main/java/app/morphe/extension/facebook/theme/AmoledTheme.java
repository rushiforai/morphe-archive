/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.theme;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.DeVancedSettings;

public final class AmoledTheme {
    private static final String TAG = "DeVancedAmoled";
    private static final int FACEBOOK_DARK_BACKGROUND = 0xff242526;
    private static final int FACEBOOK_DARK_SURFACE = 0xff252728;
    private static final int FACEBOOK_DARK_CONTROL = 0xff3a3b3c;
    private static final int AMOLED_BLACK = Color.BLACK;
    private static final int AMOLED_RAISED_SURFACE = 0xff121212;
    private static final int MAX_BACKGROUND_CHANNEL = 0x2a;
    private static final int MAX_BACKGROUND_SPREAD = 8;
    private static final Set<String> RESOLVER_BACKGROUND_TOKENS =
            Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
                    "WASH",
                    "SURFACE",
                    "CARD",
                    "ELEVATION",
                    "BANNER",
                    "PRIMARY_UI",
                    "WEB_WASH",
                    "FBLITE_WASH",
                    "SURFACE_BACKGROUND",
                    "BACKGROUND_SURFACE",
                    "DEVICE_BACKGROUND",
                    "BACKGROUND_DEEMPHASIZED",
                    "CARD_BACKGROUND",
                    "CARD_BACKGROUND_FLAT",
                    "CARD_BACKGROUND_LEGACY_WEB",
                    "BACKGROUND_CARD",
                    "BACKGROUND_ELEVATION",
                    "LIST_CELL_BACKGROUND",
                    "ATTACHMENT_FOOTER_BACKGROUND",
                    "ENTITY_HEADER_BACKGROUND",
                    "COMMENT_BACKGROUND",
                    "COMMENT_BACKGROUND_DEEMPHASIZED",
                    "BOTTOM_SHEET_BACKGROUND_DEEMPHASIZED",
                    "BOTTOM_SHEET_INSET_BACKGROUND",
                    "POPOVER_BACKGROUND",
                    "FADED_POPOVER_BACKGROUND",
                    "NAV_BAR_BACKGROUND",
                    "TAB_BAR_BACKGROUND",
                    "BACKGROUND_BANNER",
                    "BACKGROUND_PRIMARY_UI")));
    private static final AtomicInteger LOG_BUDGET = new AtomicInteger(40);
    private static final AtomicInteger VIEW_REPAIR_LOG_BUDGET =
            new AtomicInteger(20);
    private static final AtomicInteger ASSIGNMENT_LOG_BUDGET =
            new AtomicInteger(120);
    private static final Map<Drawable, Integer> ORIGINAL_DRAWABLE_COLORS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Drawable, int[]> ORIGINAL_GRADIENT_COLORS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<TextView, TextColorState> ORIGINAL_TEXT_COLORS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<ImageView, ColorStateList> ORIGINAL_IMAGE_TINTS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<View, ViewTreeObserver.OnGlobalLayoutListener>
            SURFACE_OBSERVERS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<View, Integer> SURFACE_SIGNATURES =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<View, Runnable> PENDING_UPDATES =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static volatile boolean callbacksRegistered;
    private static volatile Boolean observedFacebookDarkMode;

    private static final class TextColorState {
        final ColorStateList text;
        final ColorStateList hint;

        TextColorState(ColorStateList text, ColorStateList hint) {
            this.text = text;
            this.hint = hint;
        }
    }

    private AmoledTheme() {
    }

    public static void initialize(Application application) {
        if (application == null || callbacksRegistered) return;
        synchronized (AmoledTheme.class) {
            if (callbacksRegistered) return;
            observedFacebookDarkMode = isFacebookDarkMode(application);
            application.registerActivityLifecycleCallbacks(
                    new Application.ActivityLifecycleCallbacks() {
                        @Override
                        public void onActivityCreated(
                                Activity activity,
                                android.os.Bundle state
                        ) {
                            scheduleViewRepair(activity);
                        }

                        @Override
                        public void onActivityStarted(Activity activity) {
                        }

                        @Override
                        public void onActivityResumed(Activity activity) {
                            scheduleViewRepair(activity);
                        }

                        @Override
                        public void onActivityPaused(Activity activity) {
                        }

                        @Override
                        public void onActivityStopped(Activity activity) {
                        }

                        @Override
                        public void onActivitySaveInstanceState(
                                Activity activity,
                                android.os.Bundle state
                        ) {
                        }

                        @Override
                        public void onActivityDestroyed(Activity activity) {
                            View decor = peekDecorView(activity);
                            if (decor != null) {
                                detachSurfaceObserver(decor);
                            }
                        }
                    }
            );
            callbacksRegistered = true;
        }
    }

    public static void requestViewRepair(Context context) {
        if (!(context instanceof Activity)) return;
        scheduleViewRepair((Activity) context);
    }

    /** Route one for Mig and the FDS view resolver. */
    public static int apply(int color, Object token) {
        int result = color;
        if (DeVancedSettings.isAmoledThemeEnabled() &&
                isDarkNeutral(color) &&
                token instanceof Enum &&
                RESOLVER_BACKGROUND_TOKENS.contains(
                        ((Enum<?>) token).name()
                )) {
            result = AMOLED_BLACK;
        }
        return MaterialYouTheme.mig(result, token);
    }

    /** Route four: preserve parsing errors, but blacken server-provided dark surfaces. */
    public static int parseColor(String text) {
        int result = Color.parseColor(text);
        if (DeVancedSettings.isAmoledThemeEnabled() &&
                isDarkNeutral(result)) {
            result = AMOLED_BLACK;
        }
        return MaterialYouTheme.afterServer(result);
    }

    /** Android background calls bypass the resolver and tree-repair pass on some native rows. */
    public static void setBackgroundColor(View view, int original) {
        if (view == null) return;
        int replacement = shouldRepairAtAssignment(view)
                ? repairSurfaceColor(view, original)
                : original;
        if (ASSIGNMENT_LOG_BUDGET.getAndDecrement() > 0 &&
                (view instanceof android.widget.Button ||
                        view.getClass().getSimpleName().contains("Component"))) {
            Log.i(TAG, "bgColorAssignment class=" +
                    view.getClass().getName() +
                    " original=#" + Integer.toHexString(original) +
                    " replacement=#" + Integer.toHexString(replacement));
        }
        view.setBackgroundColor(replacement);
    }

    public static void setBackground(View view, Drawable original) {
        if (view == null) return;
        if (ASSIGNMENT_LOG_BUDGET.getAndDecrement() > 0 &&
                (view instanceof android.widget.Button ||
                        view.getClass().getSimpleName().contains("Component"))) {
            Log.i(TAG, "bgAssignment class=" +
                    view.getClass().getName() +
                    " drawable=" + describeDrawable(original));
        }
        if (shouldRepairAtAssignment(view)) {
            repairDrawable(view, original);
        }
        view.setBackground(original);
    }

    public static void setBackgroundResource(View view, int resourceId) {
        if (view == null) return;
        if (shouldRepairAtAssignment(view) && resourceId != 0) {
            try {
                android.content.res.Resources resources = view.getResources();
                if (resources != null &&
                        "color".equals(
                                resources.getResourceTypeName(resourceId)
                        )) {
                    int original = resources.getColor(resourceId);
                    int replacement = repairSurfaceColor(view, original);
                    if (ASSIGNMENT_LOG_BUDGET.getAndDecrement() > 0 &&
                            original == 0xff252728) {
                        Log.i(TAG, "bgResourceAssignment class=" +
                                view.getClass().getName() +
                                " original=#252728 replacement=#" +
                                Integer.toHexString(replacement));
                    }
                    view.setBackgroundColor(replacement);
                    return;
                }
            } catch (Throwable ignored) {
            }
        }
        view.setBackgroundResource(resourceId);
    }

    public static void setForeground(View view, Drawable original) {
        if (view == null) return;
        if (ASSIGNMENT_LOG_BUDGET.getAndDecrement() > 0 &&
                view instanceof android.widget.Button) {
            Log.i(TAG, "fgAssignment class=" +
                    view.getClass().getName() +
                    " drawable=" + describeDrawable(original));
        }
        if (shouldRepairAtAssignment(view)) {
            repairDrawable(view, original);
        }
        view.setForeground(original);
    }

    public static void setBackgroundTintList(
            View view,
            ColorStateList original
    ) {
        if (view == null) return;
        ColorStateList replacement = original;
        if (shouldRepairAtAssignment(view) &&
                original != null) {
            int color = original.getDefaultColor();
            int repaired = repairSurfaceColor(view, color);
            if (repaired != color) {
                replacement = ColorStateList.valueOf(repaired);
            }
        }
        if (ASSIGNMENT_LOG_BUDGET.getAndDecrement() > 0 &&
                original != null &&
                original.getDefaultColor() == 0xff252728) {
            Log.i(TAG, "bgTintAssignment class=" +
                    view.getClass().getName() +
                    " original=#252728 replacement=#" +
                    Integer.toHexString(
                            replacement == null
                                    ? 0
                                    : replacement.getDefaultColor()
                    ));
        }
        view.setBackgroundTintList(replacement);
    }

    public static void setDrawableTint(Drawable drawable, int original) {
        if (drawable == null) return;
        int replacement = isAmoledActive()
                ? repairSurfaceColor(original)
                : original;
        if (ASSIGNMENT_LOG_BUDGET.getAndDecrement() > 0 &&
                original == 0xff252728) {
            Log.i(TAG, "drawableTintAssignment drawable=" +
                    drawable.getClass().getName() +
                    " original=#252728 replacement=#" +
                    Integer.toHexString(replacement));
        }
        drawable.setTint(replacement);
    }

    public static void setDrawableTintList(
            Drawable drawable,
            ColorStateList original
    ) {
        if (drawable == null) return;
        ColorStateList replacement = original;
        if (isAmoledActive() && original != null) {
            int color = original.getDefaultColor();
            int repaired = repairSurfaceColor(color);
            if (repaired != color) {
                replacement = ColorStateList.valueOf(repaired);
            }
        }
        if (ASSIGNMENT_LOG_BUDGET.getAndDecrement() > 0 &&
                original != null &&
                original.getDefaultColor() == 0xff252728) {
            Log.i(TAG, "drawableTintListAssignment drawable=" +
                    drawable.getClass().getName() +
                    " original=#252728 replacement=#" +
                    Integer.toHexString(
                            replacement == null
                                    ? 0
                                    : replacement.getDefaultColor()
                    ));
        }
        drawable.setTintList(replacement);
    }

    public static void setGradientColor(Drawable drawable, int original) {
        if (drawable == null) return;
        int replacement = isAmoledActive()
                ? repairSurfaceColor(original)
                : original;
        if (ASSIGNMENT_LOG_BUDGET.getAndDecrement() > 0 &&
                original == 0xff252728) {
            Log.i(TAG, "gradientColorAssignment drawable=" +
                    drawable.getClass().getName() +
                    " original=#252728 replacement=#" +
                    Integer.toHexString(replacement));
        }
        if (drawable instanceof GradientDrawable) {
            setGradientColorDirect((GradientDrawable) drawable, replacement);
        } else {
            drawable.setTint(replacement);
        }
    }

    public static void setGradientColorStateList(
            Drawable drawable,
            ColorStateList original
    ) {
        if (drawable == null) return;
        ColorStateList replacement = original;
        if (isAmoledActive() && original != null) {
            int color = original.getDefaultColor();
            int repaired = repairSurfaceColor(color);
            if (repaired != color) {
                replacement = ColorStateList.valueOf(repaired);
            }
        }
        if (drawable instanceof GradientDrawable) {
            setGradientColorStateDirect(
                    (GradientDrawable) drawable,
                    replacement
            );
        } else {
            drawable.setTintList(replacement);
        }
    }

    public static void setGradientColors(Drawable drawable, int[] original) {
        if (drawable == null) return;
        int[] replacement = original;
        if (isAmoledActive() && original != null) {
            replacement = original.clone();
            for (int index = 0; index < replacement.length; index++) {
                replacement[index] = repairSurfaceColor(replacement[index]);
            }
        }
        if (ASSIGNMENT_LOG_BUDGET.getAndDecrement() > 0 &&
                contains(original, 0xff252728)) {
            Log.i(TAG, "gradientColorsAssignment drawable=" +
                    drawable.getClass().getName() +
                    " original=#252728 replacement=#" +
                    Integer.toHexString(
                            replacement == null ? 0 : replacement[0]
                    ));
        }
        if (drawable instanceof GradientDrawable) {
            setGradientColorsDirect((GradientDrawable) drawable, replacement);
        }
    }

    public static int[] repairGradientColors(int[] original) {
        if (!isAmoledActive() || original == null) {
            return original;
        }
        int[] replacement = original.clone();
        for (int index = 0; index < replacement.length; index++) {
            replacement[index] = repairSurfaceColor(replacement[index]);
        }
        return replacement;
    }

    public static int getColor(
            android.content.res.Resources resources,
            int original
    ) {
        if (resources == null) return original;
        int color = resources.getColor(original);
        return isAmoledActive() ? repairSurfaceColor(color) : color;
    }

    public static int getColor(
            android.content.res.Resources resources,
            int original,
            android.content.res.Resources.Theme theme
    ) {
        if (resources == null) return original;
        int color = resources.getColor(original, theme);
        return isAmoledActive() ? repairSurfaceColor(color) : color;
    }

    public static int getContextColor(Context context, int original) {
        if (context == null) return original;
        int color = context.getColor(original);
        if (DeVancedSettings.isAmoledThemeEnabled() &&
                isFacebookDarkMode(context)) {
            color = repairSurfaceColor(color);
        }
        return color;
    }

    public static int getTypedArrayColor(
            android.content.res.TypedArray typedArray,
            int index,
            int original
    ) {
        if (typedArray == null) return original;
        int color = typedArray.getColor(index, original);
        return isAmoledActive() ? repairSurfaceColor(color) : color;
    }

    private static void setGradientColorDirect(
            GradientDrawable drawable,
            int color
    ) {
        try {
            java.lang.reflect.Method method =
                    GradientDrawable.class.getDeclaredMethod(
                            "setColor",
                            int.class
                    );
            method.setAccessible(true);
            method.invoke(drawable, color);
        } catch (Throwable ignored) {
        }
    }

    private static void setGradientColorStateDirect(
            GradientDrawable drawable,
            ColorStateList colors
    ) {
        try {
            java.lang.reflect.Method method =
                    GradientDrawable.class.getDeclaredMethod(
                            "setColor",
                            ColorStateList.class
                    );
            method.setAccessible(true);
            method.invoke(drawable, colors);
        } catch (Throwable ignored) {
        }
    }

    private static void setGradientColorsDirect(
            GradientDrawable drawable,
            int[] colors
    ) {
        try {
            java.lang.reflect.Method method =
                    GradientDrawable.class.getDeclaredMethod(
                            "setColors",
                            int[].class
                    );
            method.setAccessible(true);
            method.invoke(drawable, (Object) colors);
        } catch (Throwable ignored) {
        }
    }

    private static boolean contains(int[] values, int wanted) {
        if (values == null) return false;
        for (int value : values) {
            if (value == wanted) return true;
        }
        return false;
    }

    private static int repairSurfaceColor(int color) {
        int replacement = color;
        if (isDarkNeutral(color)) {
            replacement = AMOLED_BLACK;
        } else if (color == FACEBOOK_DARK_CONTROL ||
                color == 0xff3a3b3c ||
                color == 0xff4e4f50) {
            replacement = AMOLED_RAISED_SURFACE;
        }
        return MaterialYouTheme.recolorSurface(replacement);
    }

    private static String describeDrawable(Drawable drawable) {
        if (drawable == null) return "null";
        if (drawable instanceof ColorDrawable) {
            return drawable.getClass().getName() + "#" +
                    Integer.toHexString(((ColorDrawable) drawable).getColor());
        }
        if (drawable instanceof GradientDrawable) {
            ColorStateList colors = ((GradientDrawable) drawable).getColor();
            if (colors != null) {
                return drawable.getClass().getName() + "#" +
                        Integer.toHexString(colors.getDefaultColor());
            }
            int[] values = ((GradientDrawable) drawable).getColors();
            if (values != null && values.length > 0) {
                return drawable.getClass().getName() + "#" +
                        Integer.toHexString(values[0]);
            }
        }
        return drawable.getClass().getName();
    }

    private static boolean shouldRepairAtAssignment(View view) {
        return DeVancedSettings.isAmoledThemeEnabled() &&
                isFacebookDarkMode(view.getContext());
    }

    private static boolean isAmoledActive() {
        return DeVancedSettings.isAmoledThemeEnabled() &&
                Boolean.TRUE.equals(observedFacebookDarkMode);
    }

    private static boolean isDarkNeutral(int color) {
        if ((color >>> 24) != 0xff) return false;
        int red = (color >> 16) & 0xff;
        int green = (color >> 8) & 0xff;
        int blue = color & 0xff;
        int high = Math.max(red, Math.max(green, blue));
        int low = Math.min(red, Math.min(green, blue));
        return high <= MAX_BACKGROUND_CHANNEL &&
                high - low <= MAX_BACKGROUND_SPREAD;
    }

    public static int overrideFdsColor(
            Context context,
            Object token,
            int original
    ) {
        String name = token instanceof Enum<?>
                ? ((Enum<?>) token).name()
                : "";
        observeFacebookTheme(name, original);
        if (!DeVancedSettings.isAmoledThemeEnabled() ||
                !isFacebookDarkMode(context)) {
            return MaterialYouTheme.afterFds(original, token, original);
        }
        if (isStructuralToken(name)) {
            return MaterialYouTheme.afterFds(original, token, original);
        }

        int replacement = original;
        if (isRaisedSurface(name) ||
                original == FACEBOOK_DARK_CONTROL ||
                original == 0xff3a3b3c) {
            replacement = AMOLED_RAISED_SURFACE;
        } else if (isPrimarySurface(name) ||
                original == FACEBOOK_DARK_BACKGROUND ||
                original == FACEBOOK_DARK_SURFACE) {
            replacement = AMOLED_BLACK;
        } else if (isForegroundToken(name) && isDarkForeground(original)) {
            replacement = isSecondaryForeground(name)
                    ? 0xffb0b3b8
                    : 0xffe4e6eb;
        }

        if (replacement != original && LOG_BUDGET.getAndDecrement() > 0) {
            Log.i(
                    TAG,
                    "token=" + name +
                            " original=#" + Integer.toHexString(original) +
                            " replacement=#" +
                            Integer.toHexString(replacement)
            );
        }
        return MaterialYouTheme.afterFds(original, token, replacement);
    }

    private static View peekDecorView(Activity activity) {
        if (activity == null || activity.getWindow() == null) return null;
        View decor = activity.getWindow().peekDecorView();
        if (decor != null) return decor;
        try {
            return activity.getWindow().getDecorView();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static List<View> getAllActiveDecorViews(Activity activity) {
        List<View> views = new ArrayList<>();
        if (activity != null && activity.getWindow() != null) {
            View decor = activity.getWindow().peekDecorView();
            if (decor == null) {
                try {
                    decor = activity.getWindow().getDecorView();
                } catch (Throwable ignored) {
                }
            }
            if (decor != null) {
                views.add(decor);
            }
        }
        try {
            Class<?> wmgClass = Class.forName("android.view.WindowManagerGlobal");
            Method getInstance = wmgClass.getMethod("getInstance");
            Object wmg = getInstance.invoke(null);
            Field mViewsField = wmgClass.getDeclaredField("mViews");
            mViewsField.setAccessible(true);
            Object mViewsObj = mViewsField.get(wmg);
            if (mViewsObj instanceof List<?>) {
                List<?> list = (List<?>) mViewsObj;
                Object[] array = list.toArray();
                for (Object item : array) {
                    if (item instanceof View) {
                        View v = (View) item;
                        if (!views.contains(v)) {
                            views.add(v);
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return views;
    }

    private static void scheduleViewRepair(Activity activity) {
        if (activity == null ||
                activity.isFinishing() ||
                activity.isDestroyed()) {
            return;
        }
        View root = peekDecorView(activity);
        if (root == null) return;

        boolean apply = DeVancedSettings.isAmoledThemeEnabled() &&
                isFacebookDarkMode(activity);
        if (apply) {
            attachSurfaceObserver(activity, root);
        } else {
            detachSurfaceObserver(root);
        }
        if (!apply && !hasModifiedState()) {
            updateDecorViews(activity);
            return;
        }

        final View hostDecor = root;
        long[] delays = apply
                ? new long[]{80L, 400L, 1000L, 1800L}
                : new long[]{0L, 120L};
        for (long delay : delays) {
            hostDecor.postDelayed(() -> {
                if (activity.isFinishing() || activity.isDestroyed()) return;
                updateDecorViews(activity);
            }, delay);
        }
    }

    private static void updateDecorViews(Activity activity) {
        boolean apply = DeVancedSettings.isAmoledThemeEnabled() &&
                isFacebookDarkMode(activity);
        List<View> decorViews = getAllActiveDecorViews(activity);
        for (View decor : decorViews) {
            if (apply) {
                attachSurfaceObserver(activity, decor);
                repairViewTree(decor);
            } else {
                detachSurfaceObserver(decor);
                restoreViewTree(decor);
                restoreBlackSurfaceColors(decor);
            }
        }
    }

    private static void attachSurfaceObserver(
            Activity activity,
            View decor
    ) {
        if (activity == null || decor == null) return;
        synchronized (SURFACE_OBSERVERS) {
            if (SURFACE_OBSERVERS.containsKey(decor)) return;
            SURFACE_SIGNATURES.put(decor, surfaceSignature(decor, 0));
            ViewTreeObserver.OnGlobalLayoutListener listener = () -> {
                if (!DeVancedSettings.isAmoledThemeEnabled() ||
                        !isFacebookDarkMode(activity)) {
                    return;
                }
                int signature = surfaceSignature(decor, 0);
                Integer previous = SURFACE_SIGNATURES.get(decor);
                if (previous != null && previous == signature) return;
                SURFACE_SIGNATURES.put(decor, signature);
                scheduleDecorUpdate(activity, decor);
            };
            ViewTreeObserver observer = decor.getViewTreeObserver();
            if (observer == null || !observer.isAlive()) return;
            observer.addOnGlobalLayoutListener(listener);
            SURFACE_OBSERVERS.put(decor, listener);
        }
    }

    private static void detachSurfaceObserver(View decor) {
        if (decor == null) return;
        ViewTreeObserver.OnGlobalLayoutListener listener;
        synchronized (SURFACE_OBSERVERS) {
            listener = SURFACE_OBSERVERS.remove(decor);
        }
        if (listener != null) {
            try {
                ViewTreeObserver observer = decor.getViewTreeObserver();
                if (observer != null && observer.isAlive()) {
                    observer.removeOnGlobalLayoutListener(listener);
                }
            } catch (Throwable ignored) {
            }
        }
        SURFACE_SIGNATURES.remove(decor);
        Runnable pending = PENDING_UPDATES.remove(decor);
        if (pending != null) {
            decor.removeCallbacks(pending);
        }
    }

    private static void scheduleDecorUpdate(
            Activity activity,
            View decor
    ) {
        Runnable update = () -> {
            PENDING_UPDATES.remove(decor);
            if (activity.isFinishing() || activity.isDestroyed()) return;
            if (DeVancedSettings.isAmoledThemeEnabled() &&
                    isFacebookDarkMode(activity)) {
                repairViewTree(decor);
            } else {
                restoreViewTree(decor);
            }
        };
        Runnable previous = PENDING_UPDATES.put(decor, update);
        if (previous != null) {
            decor.removeCallbacks(previous);
        }
        decor.postDelayed(update, 140L);
    }

    private static int surfaceSignature(View view, int depth) {
        if (view == null) return 0;
        int result = System.identityHashCode(view);
        result = 31 * result + view.getVisibility();
        if (!(view instanceof ViewGroup) || depth >= 5) return result;

        String className = view.getClass().getName();
        if (className.contains("RecyclerView")) {
            return result;
        }

        ViewGroup group = (ViewGroup) view;
        int count = group.getChildCount();
        result = 31 * result + count;
        int limit = Math.min(count, 10);
        for (int index = 0; index < limit; index++) {
            View child = group.getChildAt(index);
            result = 31 * result + surfaceSignature(child, depth + 1);
        }
        return result;
    }

    private static boolean hasModifiedState() {
        return !ORIGINAL_DRAWABLE_COLORS.isEmpty() ||
                !ORIGINAL_TEXT_COLORS.isEmpty() ||
                !ORIGINAL_IMAGE_TINTS.isEmpty();
    }

    private static void repairViewTree(View view) {
        if (view == null ||
                !DeVancedSettings.isAmoledThemeEnabled() ||
                !isFacebookDarkMode(view.getContext())) {
            return;
        }

        repairBackground(view);
        if (view instanceof TextView) {
            repairText((TextView) view);
        }
        if (view instanceof ImageView) {
            repairImageTint((ImageView) view);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                repairViewTree(group.getChildAt(index));
            }
        }
    }

    private static void restoreViewTree(View view) {
        if (view == null) return;
        restoreDrawable(view.getBackground());
        restoreDrawable(view.getForeground());
        if (view instanceof TextView) {
            restoreText((TextView) view);
        }
        if (view instanceof ImageView) {
            restoreImageTint((ImageView) view);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                restoreViewTree(group.getChildAt(index));
            }
        }
    }

    private static void restoreBlackSurfaceColors(View view) {
        if (view == null) return;
        if (isSurfaceContainer(view)) {
            restoreStockSurfaceDrawable(view.getBackground());
            restoreStockSurfaceDrawable(view.getForeground());
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                restoreBlackSurfaceColors(group.getChildAt(index));
            }
        }
    }

    private static void restoreStockSurfaceDrawable(Drawable drawable) {
        if (drawable == null) return;
        if (drawable instanceof ColorDrawable) {
            ColorDrawable colorDrawable = (ColorDrawable) drawable;
            int restored = restoreStockSurfaceColor(colorDrawable.getColor());
            if (restored != colorDrawable.getColor()) {
                colorDrawable.mutate();
                colorDrawable.setColor(restored);
            }
        } else if (drawable instanceof GradientDrawable) {
            GradientDrawable gradient = (GradientDrawable) drawable;
            ColorStateList colors = gradient.getColor();
            if (colors != null) {
                int original = colors.getDefaultColor();
                int restored = restoreStockSurfaceColor(original);
                if (restored != original) {
                    gradient.mutate();
                    setGradientColorDirect(gradient, restored);
                }
            } else {
                int[] originalColors = gradient.getColors();
                if (originalColors != null) {
                    int[] restoredColors = originalColors.clone();
                    boolean changed = false;
                    for (int index = 0; index < restoredColors.length; index++) {
                        int restored = restoreStockSurfaceColor(
                                restoredColors[index]
                        );
                        if (restored != restoredColors[index]) {
                            restoredColors[index] = restored;
                            changed = true;
                        }
                    }
                    if (changed) {
                        gradient.mutate();
                        setGradientColorsDirect(gradient, restoredColors);
                    }
                }
            }
        } else if (drawable instanceof InsetDrawable) {
            restoreStockSurfaceDrawable(
                    ((InsetDrawable) drawable).getDrawable()
            );
        } else if (drawable instanceof LayerDrawable) {
            LayerDrawable layer = (LayerDrawable) drawable;
            for (int index = 0;
                 index < layer.getNumberOfLayers();
                 index++) {
                restoreStockSurfaceDrawable(layer.getDrawable(index));
            }
        } else if (drawable instanceof RippleDrawable) {
            RippleDrawable ripple = (RippleDrawable) drawable;
            for (int index = 0;
                 index < ripple.getNumberOfLayers();
                 index++) {
                restoreStockSurfaceDrawable(ripple.getDrawable(index));
            }
        } else if (drawable instanceof StateListDrawable) {
            StateListDrawable states = (StateListDrawable) drawable;
            for (int index = 0; index < states.getStateCount(); index++) {
                restoreStockSurfaceDrawable(states.getStateDrawable(index));
            }
        }
    }

    private static int restoreStockSurfaceColor(int color) {
        if (color == AMOLED_BLACK) return FACEBOOK_DARK_BACKGROUND;
        if (color == AMOLED_RAISED_SURFACE) return FACEBOOK_DARK_CONTROL;
        return color;
    }

    private static void repairBackground(View view) {
        repairDrawable(view, view.getBackground());
        repairDrawable(view, view.getForeground());
    }

    private static void repairDrawable(View view, Drawable drawable) {
        if (drawable == null) return;
        if (drawable instanceof ColorDrawable) {
            ColorDrawable colorDrawable = (ColorDrawable) drawable;
            int original = colorDrawable.getColor();
            int replacement = repairSurfaceColor(view, original);
            if (replacement != original) {
                rememberDrawableColor(drawable, original);
                colorDrawable.setColor(replacement);
                logViewRepair("ColorDrawable",
                        original,
                        replacement,
                        view.getClass().getSimpleName());
            }
        } else if (drawable instanceof GradientDrawable) {
            GradientDrawable gradient = (GradientDrawable) drawable;
            ColorStateList colors = gradient.getColor();
            if (colors != null) {
                int original = colors.getDefaultColor();
                int replacement = repairSurfaceColor(view, original);
                if (replacement != original) {
                    rememberDrawableColor(drawable, original);
                    setGradientColorDirect(gradient, replacement);
                    logViewRepair("GradientDrawable",
                            original,
                            replacement,
                            view.getClass().getSimpleName());
                }
            } else {
                int[] originalColors = gradient.getColors();
                if (originalColors != null) {
                    int[] replacementColors = originalColors.clone();
                    boolean changed = false;
                    for (int index = 0;
                         index < replacementColors.length;
                         index++) {
                        int originalColor = replacementColors[index];
                        int replacementColor =
                                repairSurfaceColor(view, originalColor);
                        if (replacementColor != originalColor) {
                            replacementColors[index] = replacementColor;
                            changed = true;
                        }
                    }
                    if (changed) {
                        rememberGradientColors(
                                drawable,
                                originalColors
                        );
                        setGradientColorsDirect(
                                gradient,
                                replacementColors
                        );
                    }
                }
            }
        } else if (drawable instanceof InsetDrawable) {
            InsetDrawable inset = (InsetDrawable) drawable;
            repairDrawable(view, inset.getDrawable());
        } else if (drawable instanceof LayerDrawable) {
            LayerDrawable layer = (LayerDrawable) drawable;
            for (int index = 0;
                 index < layer.getNumberOfLayers();
                 index++) {
                repairDrawable(view, layer.getDrawable(index));
            }
        } else if (drawable instanceof RippleDrawable) {
            RippleDrawable ripple = (RippleDrawable) drawable;
            for (int index = 0; index < ripple.getNumberOfLayers(); index++) {
                repairDrawable(view, ripple.getDrawable(index));
            }
        } else if (drawable instanceof StateListDrawable) {
            StateListDrawable states = (StateListDrawable) drawable;
            int count = states.getStateCount();
            for (int index = 0; index < count; index++) {
                Drawable state = states.getStateDrawable(index);
                if (state != null) {
                    state.mutate();
                    repairDrawable(view, state);
                }
            }
        }
    }

    private static void rememberDrawableColor(
            Drawable drawable,
            int original
    ) {
        synchronized (ORIGINAL_DRAWABLE_COLORS) {
            if (!ORIGINAL_DRAWABLE_COLORS.containsKey(drawable)) {
                ORIGINAL_DRAWABLE_COLORS.put(drawable, original);
            }
        }
    }

    private static void rememberGradientColors(
            Drawable drawable,
            int[] original
    ) {
        synchronized (ORIGINAL_GRADIENT_COLORS) {
            if (!ORIGINAL_GRADIENT_COLORS.containsKey(drawable)) {
                ORIGINAL_GRADIENT_COLORS.put(drawable, original.clone());
            }
        }
    }

    private static void restoreDrawable(Drawable drawable) {
        if (drawable == null) return;
        Integer original = ORIGINAL_DRAWABLE_COLORS.remove(drawable);
        int[] originalColors = ORIGINAL_GRADIENT_COLORS.remove(drawable);
        if (original != null) {
            try {
                if (drawable instanceof ColorDrawable) {
                    ((ColorDrawable) drawable).setColor(original);
                } else if (drawable instanceof GradientDrawable) {
                    setGradientColorDirect(
                            (GradientDrawable) drawable,
                            original
                    );
                }
            } catch (Throwable ignored) {
            }
        } else if (originalColors != null &&
                drawable instanceof GradientDrawable) {
            try {
                setGradientColorsDirect(
                        (GradientDrawable) drawable,
                        originalColors
                );
            } catch (Throwable ignored) {
            }
        }
        if (drawable instanceof LayerDrawable) {
            LayerDrawable layer = (LayerDrawable) drawable;
            for (int index = 0;
                 index < layer.getNumberOfLayers();
                 index++) {
                restoreDrawable(layer.getDrawable(index));
            }
        } else if (drawable instanceof InsetDrawable) {
            restoreDrawable(((InsetDrawable) drawable).getDrawable());
        } else if (drawable instanceof RippleDrawable) {
            RippleDrawable ripple = (RippleDrawable) drawable;
            try {
                for (int index = 0; index < ripple.getNumberOfLayers(); index++) {
                    restoreDrawable(ripple.getDrawable(index));
                }
            } catch (Exception ignored) {
            }
        } else if (drawable instanceof StateListDrawable) {
            StateListDrawable states = (StateListDrawable) drawable;
            int count = states.getStateCount();
            for (int index = 0; index < count; index++) {
                restoreDrawable(states.getStateDrawable(index));
            }
        }
    }

    private static int repairSurfaceColor(View view, int color) {
        if (Color.alpha(color) < 200 ||
                isLikelyDivider(view) ||
                !isSurfaceContainer(view)) {
            return color;
        }
        int replacement = color;
        if (isDarkNeutral(color)) {
            replacement = AMOLED_BLACK;
        }
        if (color == FACEBOOK_DARK_BACKGROUND ||
                color == FACEBOOK_DARK_SURFACE ||
                color == 0xff333334 ||
                color == 0xff1c1c1d ||
                color == 0xff18191a ||
                color == 0xff202122 ||
                color == 0xff262829 ||
                color == 0xff2d2e30 ||
                color == 0xff2e2f30 ||
                color == 0xff303031) {
            replacement = AMOLED_BLACK;
        }
        if (color == FACEBOOK_DARK_CONTROL ||
                color == 0xff3a3b3c ||
                color == 0xff4e4f50) {
            replacement = AMOLED_RAISED_SURFACE;
        }
        return MaterialYouTheme.recolorSurface(replacement);
    }

    private static boolean isSurfaceContainer(View view) {
        return view instanceof ViewGroup ||
                view instanceof WebView ||
                view instanceof android.widget.Button ||
                isSurfaceHost(view);
    }

    private static boolean isSurfaceHost(View view) {
        if (view == null) return false;
        String name = view.getClass().getSimpleName();
        return "ComponentHost".equals(name) ||
                "1k0".equals(name);
    }

    private static boolean isLikelyDivider(View view) {
        if (view == null) return false;
        String name = view.getClass().getSimpleName().toLowerCase();
        if (name.contains("divider") ||
                name.contains("separator") ||
                name.contains("hairline") ||
                name.contains("border")) {
            return true;
        }
        int width = view.getWidth();
        int height = view.getHeight();
        if (width <= 0 || height <= 0) return false;
        float density = view.getResources()
                .getDisplayMetrics()
                .density;
        int thin = Math.max(2, Math.round(2f * density));
        return width <= thin || height <= thin;
    }

    private static void repairText(TextView textView) {
        int original = textView.getCurrentTextColor();
        int replacement = repairTextColor(original);
        ColorStateList hints = textView.getHintTextColors();
        int hint = hints == null
                ? 0
                : hints.getDefaultColor();
        int repairedHint = hints == null
                ? hint
                : repairTextColor(hint);
        if (replacement != original || repairedHint != hint) {
            synchronized (ORIGINAL_TEXT_COLORS) {
                if (!ORIGINAL_TEXT_COLORS.containsKey(textView)) {
                    ORIGINAL_TEXT_COLORS.put(
                            textView,
                            new TextColorState(
                                    textView.getTextColors(),
                                    hints
                            )
                    );
                }
            }
        }
        if (replacement != original) {
            textView.setTextColor(replacement);
        }
        if (hints != null && repairedHint != hint) {
            textView.setHintTextColor(repairedHint);
        }
    }

    private static void restoreText(TextView textView) {
        TextColorState state = ORIGINAL_TEXT_COLORS.remove(textView);
        if (state == null) return;
        try {
            if (state.text != null) {
                textView.setTextColor(state.text);
            }
            if (state.hint != null) {
                textView.setHintTextColor(state.hint);
            }
        } catch (Throwable ignored) {
        }
    }

    private static int repairTextColor(int color) {
        if (Color.alpha(color) < 140) return color;
        int red = Color.red(color);
        int green = Color.green(color);
        int blue = Color.blue(color);
        int spread = Math.max(red, Math.max(green, blue)) -
                Math.min(red, Math.min(green, blue));
        if (spread < 24 && red < 90 && green < 90 && blue < 90) {
            return Color.WHITE;
        }
        if (spread < 24 && red < 150 && green < 150 && blue < 150) {
            color = 0xffb0b3b8;
        }
        return MaterialYouTheme.recolorSurface(color);
    }

    private static void repairImageTint(ImageView imageView) {
        ColorStateList tint = imageView.getImageTintList();
        if (tint == null) return;
        int original = tint.getDefaultColor();
        int replacement = repairTextColor(original);
        if (replacement != original) {
            synchronized (ORIGINAL_IMAGE_TINTS) {
                if (!ORIGINAL_IMAGE_TINTS.containsKey(imageView)) {
                    ORIGINAL_IMAGE_TINTS.put(imageView, tint);
                }
            }
            imageView.setImageTintList(ColorStateList.valueOf(replacement));
        }
    }

    private static void restoreImageTint(ImageView imageView) {
        ColorStateList tint = ORIGINAL_IMAGE_TINTS.remove(imageView);
        if (tint == null) return;
        try {
            imageView.setImageTintList(tint);
        } catch (Throwable ignored) {
        }
    }

    private static void logViewRepair(
            String kind,
            int original,
            int replacement,
            String viewClass
    ) {
        if (VIEW_REPAIR_LOG_BUDGET.getAndDecrement() <= 0) return;
        Log.i(
                TAG,
                "viewRepair=" + kind +
                        " class=" + viewClass +
                        " original=#" + Integer.toHexString(original) +
                        " replacement=#" + Integer.toHexString(replacement)
        );
    }

    public static boolean isFacebookDarkMode(Context context) {
        Boolean observed = observedFacebookDarkMode;
        if (observed != null) return observed;
        if (context == null) return false;
        try {
            int mode = context.getResources()
                    .getConfiguration()
                    .uiMode & Configuration.UI_MODE_NIGHT_MASK;
            return mode == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void observeFacebookTheme(
            String tokenName,
            int color
    ) {
        if (!isThemeObservationToken(tokenName) ||
                Color.alpha(color) < 240) {
            return;
        }
        if (isKnownDarkSurface(color)) {
            observedFacebookDarkMode = true;
        } else if (isKnownLightSurface(color)) {
            observedFacebookDarkMode = false;
        }
    }

    private static boolean isKnownDarkSurface(int color) {
        if (color == FACEBOOK_DARK_BACKGROUND ||
                color == FACEBOOK_DARK_SURFACE ||
                color == FACEBOOK_DARK_CONTROL ||
                color == 0xff333334 ||
                color == 0xff1c1c1d) {
            return true;
        }
        return perceivedBrightness(color) < 90;
    }

    private static boolean isKnownLightSurface(int color) {
        return color == Color.WHITE ||
                color == 0xfff0f2f5 ||
                color == 0xfff7f8fa ||
                color == 0xfffafafa ||
                perceivedBrightness(color) > 210;
    }

    private static int perceivedBrightness(int color) {
        return (Color.red(color) * 299 +
                Color.green(color) * 587 +
                Color.blue(color) * 114) / 1000;
    }

    private static boolean isThemeObservationToken(String name) {
        switch (name) {
            case "CARD_BACKGROUND":
            case "CARD_BACKGROUND_FLAT":
            case "ENTITY_HEADER_BACKGROUND":
            case "LIST_CELL_BACKGROUND":
            case "NAV_BAR_BACKGROUND":
            case "POPOVER_BACKGROUND":
            case "SURFACE_BACKGROUND":
            case "TAB_BAR_BACKGROUND":
                return true;
            default:
                return false;
        }
    }

    private static boolean isPrimarySurface(String name) {
        switch (name) {
            case "BOTTOM_SHEET_INSET_BACKGROUND":
            case "CARD_BACKGROUND":
            case "CARD_BACKGROUND_DARK":
            case "CARD_BACKGROUND_DEFAULT":
            case "CARD_BACKGROUND_FLAT":
            case "ENTITY_HEADER_BACKGROUND":
            case "LIST_CELL_BACKGROUND":
            case "NAV_BAR_BACKGROUND":
            case "POPOVER_BACKGROUND":
            case "SURFACE_BACKGROUND":
            case "TAB_BAR_BACKGROUND":
            case "WASH":
            case "SEARCH_BAR_BACKGROUND":
            case "INPUT_BACKGROUND":
            case "HOVER_OVERLAY":
            case "SCRIM":
            case "DIALOG_BACKGROUND":
            case "SHEET_BACKGROUND":
            case "BASE_BACKGROUND":
            case "WEB_VIEW_BACKGROUND":
                return true;
            default:
                return !isStructuralToken(name) &&
                        !name.contains("BUTTON") &&
                        !name.contains("COMMENT") &&
                        !name.contains("CONTROL") &&
                        (name.contains("BACKGROUND") ||
                                name.contains("SURFACE"));
        }
    }

    private static boolean isRaisedSurface(String name) {
        switch (name) {
            case "ATTACHMENT_FOOTER_BACKGROUND":
            case "BACKGROUND_DEEMPHASIZED":
            case "BOTTOM_SHEET_BACKGROUND_DEEMPHASIZED":
            case "COMMENT_BACKGROUND":
            case "DISABLED_BUTTON_BACKGROUND":
            case "SECONDARY_BUTTON_BACKGROUND":
            case "SECONDARY_BUTTON_BACKGROUND_OPAQUE":
            case "TERTIARY_BUTTON_BACKGROUND":
                return true;
            default:
                return false;
        }
    }

    private static boolean isStructuralToken(String name) {
        return name != null &&
                (name.contains("DIVIDER") ||
                        name.contains("BORDER") ||
                        name.contains("OUTLINE") ||
                        name.contains("SEPARATOR") ||
                        name.contains("STROKE") ||
                        name.contains("HAIRLINE"));
    }

    private static boolean isForegroundToken(String name) {
        return name.contains("TEXT") ||
                name.contains("ICON") ||
                name.contains("FOREGROUND") ||
                name.contains("CONTENT") ||
                name.contains("LABEL");
    }

    private static boolean isSecondaryForeground(String name) {
        return name.contains("SECONDARY") ||
                name.contains("TERTIARY") ||
                name.contains("DISABLED") ||
                name.contains("SUBTLE");
    }

    private static boolean isDarkForeground(int color) {
        if (Color.alpha(color) < 200) return false;
        return Color.red(color) < 128 &&
                Color.green(color) < 128 &&
                Color.blue(color) < 128;
    }
}
