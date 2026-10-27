package app.immersivekeyboard.extension;

import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.view.RoundedCorner;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Makes the strip Gboard paints behind the system navigation bar look like the rest of the
 * keyboard, so a translucent keyboard is not left with a solid or mismatched bottom bar.
 */
@SuppressWarnings("unused")
public final class BottomBarOpacity {
    private static final String BASE_AREA_TAG = ".keyboard-base-area";
    private static final String BODY_AREA_TAG = ".keyboard-body-area";
    static final String HEADER_AREA_TAG = ".keyboard-header-area";
    private static final int NO_TOP = Integer.MAX_VALUE;
    private static final int OPAQUE = 255;
    private static final String TAG = "ImmersiveKB";
    private static final String DUMP_TAG = "ImmersiveKBDump";
    private static final long REFRESH_INTERVAL_MS = 150;
    private static final long RECHECK_DELAY_MS = 220;
    /** A keyboard panel shorter than this is a collapsed one, not a keyboard. */
    private static final float MIN_KEYBOARD_HEIGHT_DP = 24;

    // Settings written by the Frosted Glass patch from jasonwu1994/Gboard-patches.
    private static final String FROSTED_GLASS_PREFERENCES = "gboard_patches_settings";
    private static final String FROSTED_GLASS_ENABLED = "pref_frosted_glass_enabled";
    private static final String FROSTED_GLASS_TRANSPARENCY_MODE =
            "pref_frosted_glass_transparency_mode";
    private static final String FROSTED_GLASS_CUSTOM_OPACITY = "pref_frosted_glass_custom_opacity";
    private static final String FROSTED_GLASS_BLUR_STRENGTH = "pref_frosted_glass_blur_radius_px";
    private static final int FROSTED_GLASS_DEFAULT_OPACITY = 20;
    private static final int FROSTED_GLASS_DEFAULT_BLUR_STRENGTH = 20;
    private static final float FROSTED_GLASS_CORNER_RADIUS_DP = 32.0f;
    /** Top corner radius of the glass sheet, close to the keyboard panel in iOS. */
    private static final float GLASS_TOP_RADIUS_DP = 28.0f;
    private static final String ROUNDED_PANEL_ENABLED = "pref_rounded_keyboard_panel_enabled";
    private static final String ROUNDED_PANEL_MODE = "pref_rounded_keyboard_panel_mode";
    private static final String ROUNDED_PANEL_BOTTOM_RADIUS =
            "pref_rounded_keyboard_panel_bottom_radius_dp";

    private static final Map<View, State> STATES = new WeakHashMap<>();

    private BottomBarOpacity() {
    }

    /**
     * Injection point. Called from InputView.onDraw with the color of the bottom strip, just
     * before the strip is painted.
     */
    public static int stripColor(View inputView, Canvas canvas, int color) {
        try {
            State state = stateFor(inputView);
            state.watch(inputView);
            int keyboardColor = state.keyboardColor(inputView, color);
            state.drawnColor = keyboardColor;
            state.drawnKeyboardTop = state.keyboardTop;
            state.drawnBlurSquared = state.blurSquared;
            state.drawnSystemGlass = state.systemGlass;
            state.drawnGlassTopCorner = state.glassTopCorner;
            state.drawnKeyboardHidden = state.keyboardHidden;
            if (state.keyboardHidden) {
                // A hardware keyboard is in use and Gboard shows no keyboard: leave the strip
                // empty instead of painting a lone bar of glass at the bottom of the screen.
                return Color.TRANSPARENT;
            }
            if (Color.alpha(keyboardColor) >= OPAQUE) {
                return color;
            }
            state.drawBlur(inputView, canvas);
            state.drawGlassBehind(inputView, canvas);
            if (state.drawPanelsIntoStrip(inputView, canvas)) {
                // The strip now shows the keyboard's own backgrounds; Gboard's plain fill
                // would only cover them.
                return Color.TRANSPARENT;
            }
            return keyboardColor;
        } catch (Throwable ignored) {
            return color;
        }
    }

    /**
     * Injection point. Called from InputView.dispatchDraw once the keyboard itself has been
     * drawn, so anything painted here lands on top of it.
     */
    public static void afterKeyboardDrawn(View inputView, Canvas canvas) {
        try {
            State state = STATES.get(inputView);
            if (state != null && !state.keyboardHidden) {
                state.repaintBottomCorners(inputView, canvas);
                state.repaintTopCorners(inputView, canvas);
                state.drawGlassOnTop(inputView, canvas);
                state.roundGlassTop(inputView, canvas);
            }
            OverlayPanels.watch(inputView);
        } catch (Throwable ignored) {
            // Never block drawing.
        }
    }

    /**
     * Injection point. Called before Gboard sets the window's navigation bar color, which is
     * what colors the bottom strip on Android versions where Gboard does not paint it itself.
     */
    public static int navigationBarColor(Window window, int color) {
        try {
            FrostedGlass settings = FrostedGlass.read(window.getContext());
            if (settings.customAlpha < 0 || settings.customAlpha >= OPAQUE
                    || Color.alpha(color) != OPAQUE) {
                return color;
            }
            return withAlpha(color, settings.customAlpha);
        } catch (Throwable ignored) {
            return color;
        }
    }

    /**
     * The outline of the keyboard's glass sheet, from the top of the keyboard to the bottom of
     * the screen with its rounded corners, in InputView coordinates. False while it is not
     * known yet.
     */
    static boolean glassSheet(View inputView, Path out) {
        State state = STATES.get(inputView);
        if (state == null || state.keyboardTop == NO_TOP) {
            return false;
        }
        if (state.keyboardHidden) {
            out.rewind();
            return true;
        }
        float top = state.topInInputView(inputView);
        float topRadius = state.systemGlass && state.glassTopCorner > 0 ? state.glassTopCorner : 0;
        float bottomRadius = state.systemGlass && state.glassCorner > 0 ? state.glassCorner : 0;
        out.rewind();
        out.addRoundRect(0, top, inputView.getWidth(), inputView.getHeight(),
                new float[]{topRadius, topRadius, topRadius, topRadius,
                        bottomRadius, bottomRadius, bottomRadius, bottomRadius},
                Path.Direction.CW);
        return true;
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }

    private static State stateFor(View inputView) {
        State state = STATES.get(inputView);
        if (state == null) {
            state = new State();
            STATES.put(inputView, state);
        }
        return state;
    }

    /** The Frosted Glass settings that matter for the strip. */
    private static final class FrostedGlass {
        static final FrostedGlass OFF =
                new FrostedGlass(false, -1, 0, FROSTED_GLASS_CORNER_RADIUS_DP);

        final boolean enabled;
        /** Alpha Frosted Glass applies to keyboard surfaces in custom mode, otherwise -1. */
        final int customAlpha;
        final int blurRadiusPx;
        /** Radius of the rounded bottom corners of the keyboard's see-through area. */
        final float cornerRadiusDp;

        private FrostedGlass(boolean enabled, int customAlpha, int blurRadiusPx,
                float cornerRadiusDp) {
            this.cornerRadiusDp = cornerRadiusDp;
            this.enabled = enabled;
            this.customAlpha = customAlpha;
            this.blurRadiusPx = blurRadiusPx;
        }

        static FrostedGlass read(Context context) {
            try {
                Context application = context.getApplicationContext();
                SharedPreferences preferences = (application == null ? context : application)
                        .getSharedPreferences(FROSTED_GLASS_PREFERENCES, Context.MODE_PRIVATE);
                Map<String, ?> values = preferences.getAll();
                if (!"true".equalsIgnoreCase(String.valueOf(values.get(FROSTED_GLASS_ENABLED)))) {
                    return OFF;
                }
                int customAlpha = -1;
                if ("custom".equals(values.get(FROSTED_GLASS_TRANSPARENCY_MODE))) {
                    int transparency = clamp(number(values.get(FROSTED_GLASS_CUSTOM_OPACITY),
                            FROSTED_GLASS_DEFAULT_OPACITY), 0, 100);
                    customAlpha = Math.round((100 - transparency) * 255f / 100f);
                }
                // Same strength-to-radius mapping Frosted Glass uses: 1..100 -> 1..160 px.
                int strength = clamp(number(values.get(FROSTED_GLASS_BLUR_STRENGTH),
                        FROSTED_GLASS_DEFAULT_BLUR_STRENGTH), 1, 100);
                int radius = Math.round(1 + (strength - 1) * (159f / 99f));
                // Rounded Keyboard Panel can round the same corners by more than Frosted Glass.
                float corner = FROSTED_GLASS_CORNER_RADIUS_DP;
                if ("true".equalsIgnoreCase(String.valueOf(values.get(ROUNDED_PANEL_ENABLED)))
                        && !"top".equals(values.get(ROUNDED_PANEL_MODE))) {
                    corner = Math.max(corner, clamp(number(
                            values.get(ROUNDED_PANEL_BOTTOM_RADIUS), 32), 0, 64));
                }
                return new FrostedGlass(true, customAlpha, radius, corner);
            } catch (Throwable ignored) {
                return OFF;
            }
        }

        private static int number(Object raw, int fallback) {
            try {
                return raw instanceof Number
                        ? ((Number) raw).intValue() : Integer.parseInt(String.valueOf(raw));
            } catch (Throwable ignored) {
                return fallback;
            }
        }

        private static int clamp(int value, int min, int max) {
            return Math.max(min, Math.min(max, value));
        }
    }

    private static final class State implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener {
        int drawnColor;
        private WeakReference<View> inputView = new WeakReference<>(null);
        private WeakReference<View> surface = new WeakReference<>(null);
        private final Bitmap pixel = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        private final Canvas pixelCanvas = new Canvas(pixel);
        private final int[] location = new int[2];
        private FrostedGlass settings = FrostedGlass.OFF;
        private long lastRefresh = -REFRESH_INTERVAL_MS;
        private int cachedColor;
        private int cachedFallback;
        private boolean watching;
        private boolean attachListenerAdded;
        private Drawable blur;
        private Drawable topBlur;
        private int topColor;
        private int keyboardTop = NO_TOP;
        private final int[] origin = new int[2];
        private final Path cornerPath = new Path();
        private final Path circlePath = new Path();
        private final Paint cornerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint erasePaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        State() {
            erasePaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        }
        private WeakReference<Drawable> squaredBlur = new WeakReference<>(null);
        /** Whether the keyboard's own blur currently has square corners. */
        private boolean blurSquared;
        private int drawnKeyboardTop = NO_TOP;
        private boolean drawnBlurSquared;
        private String lastLoggedState = "";
        private boolean dumpRequested;
        private String lastTuningKey = "";
        /** Whether the keyboard's blur is running the system's own glass material. */
        private boolean systemGlass;
        private boolean drawnSystemGlass;
        private WeakReference<Drawable> glassBlur = new WeakReference<>(null);
        private boolean glassDark;
        private int glassBottom = Integer.MIN_VALUE;
        private int glassNaturalBottom;
        private int glassCorner = -1;
        /** Whether the last sample found any panel background at all. */
        private boolean panelFound;
        /** The layered background that holds the keyboard's blur, when it is layered. */
        private LayerDrawable blurOwner;
        private int blurOwnerIndex;
        private boolean recheckPosted;
        private int glassTopCorner = -1;
        private int drawnGlassTopCorner = -1;
        private boolean blurUnavailable;
        /**
         * Whether Gboard is showing no keyboard, as when a hardware keyboard is connected
         * and only an empty or collapsed panel is left at the bottom.
         */
        boolean keyboardHidden;
        private boolean drawnKeyboardHidden;

        /**
         * Color and opacity of the keyboard as it appears on screen, or the given color
         * unchanged when the keyboard is opaque or cannot be inspected.
         */
        int keyboardColor(View inputView, int fallback) {
            long now = SystemClock.uptimeMillis();
            if (now - lastRefresh < REFRESH_INTERVAL_MS && fallback == cachedFallback) {
                return cachedColor;
            }
            lastRefresh = now;
            cachedFallback = fallback;
            settings = FrostedGlass.read(inputView.getContext());
            squareKeyboardBlur(inputView);
            keyboardTop = findKeyboardTop(inputView);
            keyboardHidden = isKeyboardHidden(inputView);
            if (keyboardHidden) {
                clearWindowBlur(inputView);
            }
            topColor = keyboardTop == NO_TOP ? 0 : sampleTop(inputView);
            int sampled = sampleKeyboard(inputView);
            boolean transparentTheme = panelFound && Color.alpha(sampled) == 0;
            boolean frostedCustom = settings.customAlpha >= 0 && settings.customAlpha < OPAQUE;
            if (transparentTheme) {
                // The theme paints nothing behind the keys, so the strip should not either.
                cachedColor = Color.TRANSPARENT;
            } else if (Color.alpha(sampled) >= OPAQUE && frostedCustom) {
                // Frosted Glass is set to be see-through but the keyboard was read as solid:
                // trust the setting for opacity and keep the keyboard's color.
                cachedColor = withAlpha(sampled, settings.customAlpha);
            } else if (Color.alpha(sampled) > 0) {
                cachedColor = sampled;
            } else if (settings.customAlpha >= 0 && Color.alpha(fallback) == OPAQUE) {
                cachedColor = withAlpha(fallback, settings.customAlpha);
            } else {
                cachedColor = fallback;
            }
            applySystemGlass(inputView);
            report(inputView, sampled);
            applyLiveTuning(inputView);
            return cachedColor;
        }

        /**
         * With the Glass Panel patch on a system that has a real glass material, switches
         * that material on for the keyboard's blur and stretches the blur down over the
         * bottom strip, so keyboard and strip are one sheet of glass with one rim.
         */
        private void applySystemGlass(View inputView) {
            try {
                Drawable keyboardBlur = settings.enabled && GlassPanel.isEnabled()
                        ? findBlur(inputView.getRootView()) : null;
                View keyboard = surface.get();
                boolean docked = keyboard != null
                        && keyboard.getWidth() >= inputView.getWidth() * 0.95f;
                if (keyboardBlur == null || !docked) {
                    systemGlass = false;
                    return;
                }
                // Follow the system's light or dark mode. Measuring the keyboard's color does
                // not work for fully transparent themes, which have no color to measure.
                boolean dark = (inputView.getResources().getConfiguration().uiMode
                        & android.content.res.Configuration.UI_MODE_NIGHT_MASK)
                        == android.content.res.Configuration.UI_MODE_NIGHT_YES;
                if (keyboardBlur != glassBlur.get() || dark != glassDark) {
                    systemGlass = GlassPanel.applySystemGlass(keyboardBlur, dark);
                    glassBlur = new WeakReference<>(keyboardBlur);
                    glassDark = dark;
                    glassBottom = Integer.MIN_VALUE;
                    glassCorner = -1;
                    glassTopCorner = -1;
                    if (systemGlass) {
                        refresh(keyboardBlur);
                        Log.i(TAG, "system glass on, dark=" + dark);
                    }
                }
                if (!systemGlass) {
                    return;
                }
                // With no keyboard showing, the glass must not reach down over the strip either.
                int padding = keyboardHidden ? 0 : inputView.getPaddingBottom();
                if (blurOwner != null && blurOwnerIndex < blurOwner.getNumberOfLayers()
                        && blurOwner.getDrawable(blurOwnerIndex) == keyboardBlur) {
                    // The panel's background re-sizes its layers every time it is laid out.
                    // A negative bottom inset makes it keep the blur stretched over the strip
                    // by itself, with no window in which the stretch is missing.
                    if (blurOwner.getLayerInsetBottom(blurOwnerIndex) != -padding) {
                        blurOwner.setLayerInsetBottom(blurOwnerIndex, -padding);
                    }
                    android.graphics.Rect owner = blurOwner.getBounds();
                    android.graphics.Rect bounds = keyboardBlur.getBounds();
                    if (!owner.isEmpty() && bounds.bottom != owner.bottom + padding) {
                        keyboardBlur.setBounds(owner.left, owner.top, owner.right,
                                owner.bottom + padding);
                        refresh(keyboardBlur);
                    }
                } else {
                    android.graphics.Rect bounds = keyboardBlur.getBounds();
                    if (bounds.bottom != glassBottom) {
                        glassNaturalBottom = bounds.bottom;
                    }
                    int wanted = glassNaturalBottom + padding;
                    if (bounds.bottom != wanted) {
                        keyboardBlur.setBounds(bounds.left, bounds.top, bounds.right, wanted);
                        refresh(keyboardBlur);
                    }
                    glassBottom = wanted;
                }

                // The sheet ends at the bottom of the screen, whose corners are rounded. Round
                // the glass to match, so its rim follows the screen's curve instead of running
                // off behind it.
                int corner = screenCornerRadius(inputView);
                int topCorner = Math.round(glassTopRadiusDp()
                        * inputView.getResources().getDisplayMetrics().density);
                if (corner != glassCorner || topCorner != glassTopCorner) {
                    Method setCorners = keyboardBlur.getClass().getDeclaredMethod(
                            "setCornerRadius", float.class, float.class, float.class, float.class);
                    setCorners.setAccessible(true);
                    setCorners.invoke(keyboardBlur, (float) topCorner, (float) topCorner,
                            (float) corner, (float) corner);
                    refresh(keyboardBlur);
                    glassCorner = corner;
                    glassTopCorner = topCorner;
                    Log.i(TAG, "glass corner radius top=" + topCorner + " bottom=" + corner);
                }
            } catch (Throwable failure) {
                systemGlass = false;
                Log.w(TAG, "system glass failed", failure);
            }
        }

        /**
         * Radius, in dp, of the glass sheet's top corners. Can be overridden for tuning with
         * {@code adb shell setprop debug.ikb.topradius 24}.
         */
        private static float glassTopRadiusDp() {
            try {
                String override = LiveTuning.property("debug.ikb.topradius");
                if (!override.isEmpty()) {
                    return Math.max(0f, Math.min(64f, Float.parseFloat(override)));
                }
            } catch (Throwable ignored) {
                // Fall through to the default.
            }
            return GLASS_TOP_RADIUS_DP;
        }

        /**
         * Gives the glass sheet rounded top corners. The blur is already rounded there, but
         * the keyboard still paints its square base color and tint outside that curve, so
         * erase those two wedges and let whatever is behind the keyboard show through.
         */
        void roundGlassTop(View inputView, Canvas canvas) {
            if (!systemGlass || glassTopCorner <= 0 || keyboardTop == NO_TOP) {
                return;
            }
            float radius = glassTopCorner;
            float width = inputView.getWidth();
            float top = topInInputView(inputView);
            float bottom = top + radius;
            cornerPath.rewind();
            cornerPath.addRect(0, top, radius, bottom, Path.Direction.CW);
            cornerPath.addRect(width - radius, top, width, bottom, Path.Direction.CW);
            circlePath.rewind();
            circlePath.addCircle(radius, bottom, radius, Path.Direction.CW);
            circlePath.addCircle(width - radius, bottom, radius, Path.Direction.CW);
            cornerPath.op(circlePath, Path.Op.DIFFERENCE);
            canvas.drawPath(cornerPath, erasePaint);
        }

        /** Radius of the display's rounded bottom corners, or 0 when it has none. */
        private static int screenCornerRadius(View view) {
            if (Build.VERSION.SDK_INT < 31) {
                return 0;
            }
            WindowInsets insets = view.getRootWindowInsets();
            if (insets == null) {
                return 0;
            }
            RoundedCorner left = insets.getRoundedCorner(RoundedCorner.POSITION_BOTTOM_LEFT);
            RoundedCorner right = insets.getRoundedCorner(RoundedCorner.POSITION_BOTTOM_RIGHT);
            int radius = Math.max(left == null ? 0 : left.getRadius(),
                    right == null ? 0 : right.getRadius());
            return Math.max(0, radius);
        }

        private static float luminance(int color) {
            return (0.299f * Color.red(color) + 0.587f * Color.green(color)
                    + 0.114f * Color.blue(color)) / 255f;
        }

        /**
         * Development aid: re-applies the calls set in debug.ikb.* system properties to the
         * keyboard's blur, the strip's blur and the keyboard panel view whenever the calls
         * or those objects change.
         */
        private void applyLiveTuning(View inputView) {
            try {
                List<String> drawableSpecs = LiveTuning.specs("d");
                List<String> viewSpecs = LiveTuning.specs("v");
                Drawable keyboardBlur = findBlur(inputView.getRootView());
                View panel = surface.get();
                String key = drawableSpecs + "|" + viewSpecs + "|"
                        + System.identityHashCode(keyboardBlur) + "|"
                        + System.identityHashCode(blur) + "|" + System.identityHashCode(panel);
                if (key.equals(lastTuningKey)) {
                    return;
                }
                lastTuningKey = key;
                if (drawableSpecs.isEmpty() && viewSpecs.isEmpty()) {
                    return;
                }
                String target = LiveTuning.property("debug.ikb.target");
                if (!"s".equals(target)) {
                    LiveTuning.apply(keyboardBlur, drawableSpecs);
                    refresh(keyboardBlur);
                }
                if (!"k".equals(target)) {
                    LiveTuning.apply(blur, drawableSpecs);
                    refresh(blur);
                }
                LiveTuning.apply(panel, viewSpecs);
                inputView.invalidate();
            } catch (Throwable failure) {
                Log.w(TAG, "live tuning failed", failure);
            }
        }

        /** Makes a blur drawable push its current settings to the compositor. */
        private static void refresh(Drawable blurDrawable) {
            if (blurDrawable == null) {
                return;
            }
            try {
                java.lang.reflect.Field field =
                        blurDrawable.getClass().getDeclaredField("mAggregator");
                field.setAccessible(true);
                Object aggregator = field.get(blurDrawable);
                Method updated = aggregator.getClass().getDeclaredMethod(
                        "onBlurDrawableUpdated", blurDrawable.getClass());
                updated.setAccessible(true);
                updated.invoke(aggregator, blurDrawable);
                blurDrawable.invalidateSelf();
            } catch (Throwable failure) {
                Log.w(TAG, "blur refresh failed: " + failure);
            }
        }

        /** Logs what was found whenever it changes, and a full layer dump on request. */
        private void report(View inputView, int sampled) {
            try {
                String stateLine = "enabled=" + settings.enabled
                        + " customAlpha=" + settings.customAlpha
                        + " blurRadius=" + settings.blurRadiusPx
                        + " squared=" + blurSquared
                        + " top=" + (keyboardTop == NO_TOP ? "none" : String.valueOf(keyboardTop))
                        + " sampled=#" + Integer.toHexString(sampled)
                        + " strip=#" + Integer.toHexString(cachedColor)
                        + " topColor=#" + Integer.toHexString(topColor)
                        + " padding=" + inputView.getPaddingBottom()
                        + " size=" + inputView.getWidth() + "x" + inputView.getHeight()
                        + " stripBlur=" + (blur != null) + " glass=" + GlassPanel.isEnabled()
                        + " systemGlass=" + systemGlass;
                if (!stateLine.equals(lastLoggedState)) {
                    lastLoggedState = stateLine;
                    Log.i(TAG, stateLine);
                }
                // adb shell setprop log.tag.ImmersiveKBDump DEBUG
                boolean wanted = Log.isLoggable(DUMP_TAG, Log.DEBUG);
                if (wanted && !dumpRequested) {
                    Log.i(TAG, "---- layer dump ----");
                    dump(inputView.getRootView(), 0);
                    Log.i(TAG, "---- end of dump ----");
                }
                dumpRequested = wanted;
            } catch (Throwable ignored) {
                // Diagnostics must never affect drawing.
            }
        }

        private void dump(View view, int depth) {
            if (view.getWidth() < 200 && depth > 3) {
                return;
            }
            view.getLocationInWindow(location);
            StringBuilder line = new StringBuilder();
            for (int index = 0; index < depth; index++) {
                line.append(' ');
            }
            line.append(view.getClass().getName())
                    .append(" [").append(location[0]).append(',').append(location[1]).append(' ')
                    .append(view.getWidth()).append('x').append(view.getHeight()).append(']')
                    .append(" vis=").append(view.getVisibility())
                    .append(" alpha=").append(view.getAlpha())
                    .append(" elev=").append(view.getElevation())
                    .append(" clip=").append(view.getClipToOutline())
                    .append(" pad=").append(view.getPaddingLeft()).append(',')
                    .append(view.getPaddingTop()).append(',').append(view.getPaddingRight())
                    .append(',').append(view.getPaddingBottom())
                    .append(" tag=").append(view.getTag())
                    .append(" bg=").append(describe(view.getBackground(), 0));
            Log.i(TAG, line.toString());
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int index = 0; index < group.getChildCount(); index++) {
                    dump(group.getChildAt(index), depth + 1);
                }
            }
        }

        private static String describe(Drawable drawable, int depth) {
            if (drawable == null) {
                return "null";
            }
            StringBuilder text = new StringBuilder(drawable.getClass().getName())
                    .append("(alpha=").append(drawable.getAlpha())
                    .append(" bounds=").append(drawable.getBounds().toShortString());
            if (drawable instanceof LayerDrawable && depth < 3) {
                LayerDrawable layers = (LayerDrawable) drawable;
                for (int index = 0; index < layers.getNumberOfLayers(); index++) {
                    text.append(" L").append(index).append('=')
                            .append(describe(layers.getDrawable(index), depth + 1));
                }
            }
            return text.append(')').toString();
        }

        /**
         * Color and opacity of the keyboard in the row of pixels directly above the strip,
         * which is what the strip has to match for the join to be invisible.
         */
        private int sampleKeyboard(View inputView) {
            try {
                View target = surface.get();
                if (target == null || !target.isAttachedToWindow() || !target.isShown()) {
                    View root = inputView.getRootView();
                    target = find(root, BODY_AREA_TAG);
                    if (target == null) {
                        target = find(root, BASE_AREA_TAG);
                    }
                    surface = new WeakReference<>(target);
                }
                if (target == null || target.getWidth() <= 0 || target.getHeight() <= 0) {
                    return 0;
                }
                inputView.getLocationInWindow(origin);
                float density = inputView.getResources().getDisplayMetrics().density;
                float sampleX = origin[0] + inputView.getWidth() / 2f;
                float sampleY = inputView.getPaddingBottom() > 0
                        ? origin[1] + inputView.getHeight() - inputView.getPaddingBottom()
                                - 2f * density
                        : origin[1] + inputView.getHeight() - 2f * density;
                return sampleAt(inputView, sampleX, sampleY);
            } catch (Throwable ignored) {
                return 0;
            }
        }

        /**
         * Continues the keyboard down over the strip by drawing the keyboard's own panel
         * backgrounds there: the same drawables, alpha and order, aligned so their bottom rows
         * fill the strip. Keyboard and strip then always share one shade, with nothing measured.
         * Returns false when there is nothing to draw.
         */
        boolean drawPanelsIntoStrip(View inputView, Canvas canvas) {
            int padding = inputView.getPaddingBottom();
            if (padding <= 0) {
                return false;
            }
            inputView.getLocationInWindow(origin);
            int originX = origin[0];
            int originY = origin[1];
            float density = inputView.getResources().getDisplayMetrics().density;
            float stripTop = inputView.getHeight() - padding;
            List<View> panels = new ArrayList<>();
            collectPanels(inputView, originX + inputView.getWidth() / 2f,
                    originY + stripTop - 2f * density, inputView.getWidth() * 0.8f, panels);
            if (panels.isEmpty()) {
                return false;
            }
            int save = canvas.save();
            canvas.clipRect(0, stripTop, inputView.getWidth(), inputView.getHeight());
            for (View panel : panels) {
                panel.getLocationInWindow(location);
                float left = location[0] - originX;
                // Line the panel's bottom edge up with the bottom of the strip.
                float top = inputView.getHeight() - panel.getHeight();
                float alpha = effectiveAlpha(panel, inputView);
                int layer = alpha < 1f
                        ? canvas.saveLayerAlpha(0, stripTop, inputView.getWidth(),
                                inputView.getHeight(), Math.round(alpha * OPAQUE))
                        : canvas.save();
                canvas.translate(left, top);
                drawWithoutBlur(panel.getBackground(), canvas);
                canvas.restoreToCount(layer);
            }
            canvas.restoreToCount(save);
            return true;
        }

        /** Panels with a background that cover the point, outermost first. */
        private void collectPanels(View view, float windowX, float windowY, float minWidth,
                List<View> out) {
            if (view.getVisibility() != View.VISIBLE || view.getWidth() < minWidth
                    || view.getAlpha() <= 0f) {
                return;
            }
            view.getLocationInWindow(location);
            if (windowX < location[0] || windowX >= location[0] + view.getWidth()
                    || windowY < location[1] || windowY >= location[1] + view.getHeight()) {
                return;
            }
            if (view.getBackground() != null) {
                out.add(view);
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int index = 0; index < group.getChildCount(); index++) {
                    collectPanels(group.getChildAt(index), windowX, windowY, minWidth, out);
                }
            }
        }

        /** Alpha of a view as drawn, including that of its parents up to InputView. */
        private static float effectiveAlpha(View view, View inputView) {
            float alpha = 1f;
            for (View current = view; current != null && current != inputView; ) {
                alpha *= current.getAlpha();
                ViewParent parent = current.getParent();
                current = parent instanceof View ? (View) parent : null;
            }
            return alpha;
        }

        /**
         * Paints, into a single pixel, every panel background that covers the given window
         * point, in the order the keyboard draws them. Whatever the theme and Frosted Glass
         * did to those backgrounds (color, alpha, layering) is reflected in the result.
         */
        private int sampleAt(View inputView, float windowX, float windowY) {
            pixel.eraseColor(Color.TRANSPARENT);
            panelFound = false;
            paintPanels(inputView, windowX, windowY, inputView.getWidth() * 0.8f);
            return pixel.getPixel(0, 0);
        }

        /**
         * Walks the keyboard in drawing order. Only views spanning most of its width count as
         * panels, which leaves out individual keys and anything inside them.
         */
        private void paintPanels(View view, float windowX, float windowY, float minWidth) {
            if (view.getVisibility() != View.VISIBLE || view.getWidth() < minWidth
                    || view.getAlpha() <= 0f) {
                return;
            }
            view.getLocationInWindow(location);
            int left = location[0];
            int top = location[1];
            if (windowX < left || windowX >= left + view.getWidth()
                    || windowY < top || windowY >= top + view.getHeight()) {
                return;
            }
            int save = pixelCanvas.saveLayerAlpha(0, 0, 1, 1,
                    Math.round(view.getAlpha() * OPAQUE));
            Drawable background = view.getBackground();
            if (background != null) {
                panelFound = true;
                int inner = pixelCanvas.save();
                pixelCanvas.translate(left - windowX, top - windowY);
                drawWithoutBlur(background, pixelCanvas);
                pixelCanvas.restoreToCount(inner);
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int index = 0; index < group.getChildCount(); index++) {
                    paintPanels(group.getChildAt(index), windowX, windowY, minWidth);
                }
            }
            pixelCanvas.restoreToCount(save);
        }

        /**
         * Draws a background the way it ends up on screen. A background blur layer clears
         * everything painted beneath it in the same view (Frosted Glass stacks one on top of
         * the keyboard's original base background), so only the layers above it count. The
         * blur layer itself needs a hardware canvas and adds no color of its own.
         */
        private static void drawWithoutBlur(Drawable drawable, Canvas canvas) {
            if (isBlur(drawable)) {
                return;
            }
            if (drawable instanceof LayerDrawable) {
                LayerDrawable layers = (LayerDrawable) drawable;
                int first = 0;
                for (int index = 0; index < layers.getNumberOfLayers(); index++) {
                    Drawable layer = layers.getDrawable(index);
                    if (layer != null && isBlur(layer)) {
                        first = index + 1;
                    }
                }
                for (int index = first; index < layers.getNumberOfLayers(); index++) {
                    Drawable layer = layers.getDrawable(index);
                    if (layer != null) {
                        layer.draw(canvas);
                    }
                }
                return;
            }
            drawable.draw(canvas);
        }

        private static boolean isBlur(Drawable drawable) {
            return drawable.getClass().getName().contains("Blur");
        }

        /**
         * Frosted Glass rounds all four corners of the blur it puts on the keyboard panel.
         * That blur also clears the panel's solid base background, so outside the rounded
         * corners the base color is left showing as a solid wedge in each corner. Giving the
         * blur square corners makes it clear the whole panel.
         */
        private void squareKeyboardBlur(View inputView) {
            if (!settings.enabled) {
                blurSquared = false;
                return;
            }
            try {
                Drawable keyboardBlur = findBlur(inputView.getRootView());
                if (keyboardBlur == null) {
                    blurSquared = false;
                    return;
                }
                if (keyboardBlur == squaredBlur.get()) {
                    return;
                }
                Method setCorners = keyboardBlur.getClass().getDeclaredMethod("setCornerRadius",
                        float.class, float.class, float.class, float.class);
                setCorners.setAccessible(true);
                setCorners.invoke(keyboardBlur, 0f, 0f, 0f, 0f);
                squaredBlur = new WeakReference<>(keyboardBlur);
                blurSquared = true;
                Log.i(TAG, "squared keyboard blur " + keyboardBlur.getClass().getName());
            } catch (Throwable failure) {
                blurSquared = false;
                Log.w(TAG, "could not square keyboard blur", failure);
            }
        }

        /** The blur layer Frosted Glass added to a view's background, if any. */
        private Drawable findBlur(View view) {
            if (view == null || view.getVisibility() != View.VISIBLE) {
                return null;
            }
            Drawable background = view.getBackground();
            if (background instanceof LayerDrawable) {
                LayerDrawable layers = (LayerDrawable) background;
                for (int index = 0; index < layers.getNumberOfLayers(); index++) {
                    Drawable layer = layers.getDrawable(index);
                    if (layer != null && layer != blur && isBlur(layer)) {
                        blurOwner = layers;
                        blurOwnerIndex = index;
                        return layer;
                    }
                }
            } else if (background != null && background != blur && isBlur(background)) {
                blurOwner = null;
                return background;
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int index = 0; index < group.getChildCount(); index++) {
                    Drawable match = findBlur(group.getChildAt(index));
                    if (match != null) {
                        return match;
                    }
                }
            }
            return null;
        }

        /**
         * The translucent, blurred part of the keyboard is a rectangle with all four corners
         * rounded, so its two bottom corners leave small wedges of something else where the
         * keyboard meets the strip. Erase those wedges from the finished keyboard and repaint
         * them like the strip (blurred backdrop plus keyboard color), which makes the bottom
         * edge of the keyboard run straight into it.
         */
        void repaintBottomCorners(View inputView, Canvas canvas) {
            int padding = inputView.getPaddingBottom();
            View keyboard = surface.get();
            if (blurSquared || !settings.enabled || padding <= 0
                    || Color.alpha(drawnColor) >= OPAQUE
                    || blur == null || keyboard == null
                    // Floating and one-handed keyboards do not sit on the strip's corners.
                    || keyboard.getWidth() < inputView.getWidth() * 0.95f) {
                return;
            }
            float radius = settings.cornerRadiusDp
                    * inputView.getResources().getDisplayMetrics().density;
            float width = inputView.getWidth();
            float stripTop = inputView.getHeight() - padding;
            float top = stripTop - radius;

            // Each wedge is a corner square minus the quarter circle the keyboard fills.
            cornerPath.rewind();
            cornerPath.addRect(0, top, radius, stripTop, Path.Direction.CW);
            cornerPath.addRect(width - radius, top, width, stripTop, Path.Direction.CW);
            circlePath.rewind();
            circlePath.addCircle(radius, top, radius, Path.Direction.CW);
            circlePath.addCircle(width - radius, top, radius, Path.Direction.CW);
            cornerPath.op(circlePath, Path.Op.DIFFERENCE);

            canvas.drawPath(cornerPath, erasePaint);
            cornerPaint.setColor(drawnColor);
            canvas.drawPath(cornerPath, cornerPaint);
        }

        /**
         * Same treatment for the keyboard's two top corners: erase the wedges outside the
         * rounded see-through area and repaint them blurred and tinted like the top of the
         * keyboard, giving it a straight top edge.
         */
        void repaintTopCorners(View inputView, Canvas canvas) {
            View keyboard = surface.get();
            if (blurSquared || !settings.enabled || topBlur == null || keyboard == null
                    || Color.alpha(drawnColor) >= OPAQUE
                    || keyboard.getWidth() < inputView.getWidth() * 0.95f) {
                return;
            }
            float radius = settings.cornerRadiusDp
                    * inputView.getResources().getDisplayMetrics().density;
            float width = inputView.getWidth();
            if (keyboardTop == NO_TOP) {
                return;
            }
            float top = topInInputView(inputView);
            float bottom = top + radius;

            cornerPath.rewind();
            cornerPath.addRect(0, top, radius, bottom, Path.Direction.CW);
            cornerPath.addRect(width - radius, top, width, bottom, Path.Direction.CW);
            circlePath.rewind();
            circlePath.addCircle(radius, bottom, radius, Path.Direction.CW);
            circlePath.addCircle(width - radius, bottom, radius, Path.Direction.CW);
            cornerPath.op(circlePath, Path.Op.DIFFERENCE);

            canvas.drawPath(cornerPath, erasePaint);
            cornerPaint.setColor(Color.alpha(topColor) > 0 && Color.alpha(topColor) < OPAQUE
                    ? topColor : drawnColor);
            canvas.drawPath(cornerPath, cornerPaint);
        }

        /** Top edge of the visible keyboard, in InputView coordinates. */
        private float topInInputView(View inputView) {
            inputView.getLocationInWindow(origin);
            return keyboardTop - origin[1];
        }

        /**
         * Window Y of the top edge of the visible keyboard: the highest of its themed panels.
         * The keyboard window itself can be as tall as the screen, so its own top edge says
         * nothing about where the keyboard starts.
         */
        /**
         * With no keyboard showing, the keyboard window shrinks to the strip at the bottom of
         * the screen, and Frosted Glass then blurs everything behind the whole window. That
         * leaves a blurred bar over the bottom of the app, so switch the window blur off.
         */
        private static void clearWindowBlur(View inputView) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
                return;
            }
            Context context = inputView.getContext();
            while (context instanceof ContextWrapper && !(context instanceof InputMethodService)) {
                context = ((ContextWrapper) context).getBaseContext();
            }
            if (context instanceof InputMethodService) {
                Dialog dialog = ((InputMethodService) context).getWindow();
                Window window = dialog == null ? null : dialog.getWindow();
                if (window != null) {
                    window.setBackgroundBlurRadius(0);
                }
            }
        }

        private boolean isKeyboardHidden(View inputView) {
            View base = find(inputView, BASE_AREA_TAG);
            float minimum = MIN_KEYBOARD_HEIGHT_DP
                    * inputView.getResources().getDisplayMetrics().density;
            return base == null || !base.isShown() || base.getHeight() < minimum;
        }

        private int findKeyboardTop(View inputView) {
            int[] top = {NO_TOP};
            // A panel that fills most of the window is a container, not the keyboard.
            float maxHeight = inputView.getRootView().getHeight() * 0.8f;
            collectKeyboardTop(inputView, inputView.getWidth() * 0.8f, maxHeight, top);
            return top[0];
        }

        private void collectKeyboardTop(View view, float minWidth, float maxHeight, int[] top) {
            if (view.getVisibility() != View.VISIBLE) {
                return;
            }
            Object tag = view.getTag();
            // The toolbar row does not always carry a background of its own, and is not always
            // tagged by the time the keyboard first draws, so the panel that contains it
            // counts as well. Taking only the key area here puts the top edge one row too low.
            if (tag instanceof String && view.getWidth() >= minWidth && view.getHeight() > 0
                    && view.getHeight() <= maxHeight
                    && (((String) tag).contains(HEADER_AREA_TAG)
                    || ((String) tag).contains(BODY_AREA_TAG)
                    || ((String) tag).contains(BASE_AREA_TAG))) {
                view.getLocationInWindow(location);
                top[0] = Math.min(top[0], location[1]);
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int index = 0; index < group.getChildCount(); index++) {
                    collectKeyboardTop(group.getChildAt(index), minWidth, maxHeight, top);
                }
            }
        }

        /** Color of the keyboard just inside its top edge, where the top corners are. */
        private int sampleTop(View inputView) {
            try {
                float radius = settings.cornerRadiusDp
                        * inputView.getResources().getDisplayMetrics().density;
                inputView.getLocationInWindow(origin);
                return sampleAt(inputView, origin[0] + inputView.getWidth() / 2f,
                        keyboardTop + radius / 2f);
            } catch (Throwable ignored) {
                return 0;
            }
        }

        /** Glass Panel effect under the keyboard, when that patch is applied. */
        void drawGlassBehind(View inputView, Canvas canvas) {
            if (systemGlass || !GlassPanel.isEnabled() || !settings.enabled
                    || keyboardTop == NO_TOP) {
                return;
            }
            GlassPanel.drawBehind(canvas, 0, topInInputView(inputView), inputView.getWidth(),
                    inputView.getHeight(), inputView.getResources().getDisplayMetrics().density);
        }

        /** Glass Panel rim over the finished keyboard, when that patch is applied. */
        void drawGlassOnTop(View inputView, Canvas canvas) {
            if (systemGlass || !GlassPanel.isEnabled() || !settings.enabled
                    || keyboardTop == NO_TOP || Color.alpha(drawnColor) >= OPAQUE) {
                return;
            }
            GlassPanel.drawOnTop(canvas, 0, topInInputView(inputView), inputView.getWidth(),
                    inputView.getResources().getDisplayMetrics().density);
        }

        /**
         * Blurs what is behind the strip, the way Frosted Glass blurs what is behind the keys.
         * Relies on the hidden API access Frosted Glass already enables for its own blur.
         */
        void drawBlur(View inputView, Canvas canvas) {
            if (!settings.enabled || blurUnavailable || Build.VERSION.SDK_INT < 31
                    || !canvas.isHardwareAccelerated()) {
                return;
            }
            if (systemGlass) {
                // The keyboard's own blur covers the strip; a second region would show a seam.
                return;
            }
            try {
                if (blur == null) {
                    Method getViewRoot = View.class.getDeclaredMethod("getViewRootImpl");
                    getViewRoot.setAccessible(true);
                    Object viewRoot = getViewRoot.invoke(inputView);
                    if (viewRoot == null) {
                        return;
                    }
                    Method create = viewRoot.getClass()
                            .getDeclaredMethod("createBackgroundBlurDrawable");
                    create.setAccessible(true);
                    blur = (Drawable) create.invoke(viewRoot);
                    blur.setVisible(true, false);
                }
                Method setRadius = blur.getClass().getDeclaredMethod("setBlurRadius", int.class);
                setRadius.setAccessible(true);
                setRadius.invoke(blur, settings.blurRadiusPx);
                int width = inputView.getWidth();
                int height = inputView.getHeight();
                // Frosted Glass rounds all four corners of its blur, which leaves the two
                // bottom corners of the keyboard unblurred where they meet the strip. Reach up
                // behind the keyboard by that corner radius to fill them in.
                int overlap = blurSquared ? 0 : Math.round(settings.cornerRadiusDp
                        * inputView.getResources().getDisplayMetrics().density);
                int top = Math.max(0, height - inputView.getPaddingBottom() - overlap);
                blur.setBounds(0, top, width, height);
                blur.draw(canvas);

                // A second blur region behind the keyboard's top corners.
                if (keyboardTop != NO_TOP && !blurSquared) {
                    if (topBlur == null) {
                        Method getRoot = View.class.getDeclaredMethod("getViewRootImpl");
                        getRoot.setAccessible(true);
                        Object root = getRoot.invoke(inputView);
                        Method createBlur = root.getClass()
                                .getDeclaredMethod("createBackgroundBlurDrawable");
                        createBlur.setAccessible(true);
                        topBlur = (Drawable) createBlur.invoke(root);
                        topBlur.setVisible(true, false);
                    }
                    setRadius.invoke(topBlur, settings.blurRadiusPx);
                    int keyboardTopY = Math.round(topInInputView(inputView));
                    topBlur.setBounds(0, keyboardTopY, width, keyboardTopY + overlap);
                    topBlur.draw(canvas);
                }
            } catch (Throwable ignored) {
                blur = null;
                topBlur = null;
                blurUnavailable = true;
            }
        }

        void watch(View view) {
            inputView = new WeakReference<>(view);
            if (!attachListenerAdded) {
                view.addOnAttachStateChangeListener(this);
                attachListenerAdded = true;
            }
            if (!watching && view.isAttachedToWindow()) {
                view.getViewTreeObserver().addOnPreDrawListener(this);
                watching = true;
            }
        }

        @Override
        public boolean onPreDraw() {
            try {
                View view = inputView.get();
                // Child views are restyled without redrawing InputView, so redraw the strip
                // whenever the keyboard no longer matches what was painted.
                // The same goes for the keyboard's top edge and blur, which are often only
                // known a moment after the keyboard first appears.
                if (view != null && (keyboardColor(view, cachedFallback) != drawnColor
                        || keyboardTop != drawnKeyboardTop || blurSquared != drawnBlurSquared
                        || systemGlass != drawnSystemGlass
                        || glassTopCorner != drawnGlassTopCorner
                        || keyboardHidden != drawnKeyboardHidden)) {
                    view.invalidate();
                }
                if (view != null) {
                    scheduleRecheck(view);
                }
            } catch (Throwable ignored) {
                // Never block drawing.
            }
            return true;
        }

        /**
         * Looks at the keyboard once more shortly after the last frame. Frosted Glass rebuilds
         * its blur a moment after the keyboard appears, often with no frame following, and
         * without this the rebuilt blur would keep its default shape until something else
         * happened to redraw the keyboard.
         */
        private void scheduleRecheck(View view) {
            if (recheckPosted) {
                return;
            }
            recheckPosted = true;
            view.postDelayed(() -> {
                recheckPosted = false;
                try {
                    lastRefresh = -REFRESH_INTERVAL_MS;
                    Drawable before = glassBlur.get();
                    int color = keyboardColor(view, cachedFallback);
                    if (color != drawnColor || keyboardTop != drawnKeyboardTop
                            || blurSquared != drawnBlurSquared || systemGlass != drawnSystemGlass
                            || glassTopCorner != drawnGlassTopCorner
                        || keyboardHidden != drawnKeyboardHidden
                            || glassBlur.get() != before) {
                        view.invalidate();
                    }
                } catch (Throwable ignored) {
                    // Never disturb the keyboard.
                }
            }, RECHECK_DELAY_MS);
        }

        @Override
        public void onViewAttachedToWindow(View view) {
            watch(view);
        }

        @Override
        public void onViewDetachedFromWindow(View view) {
            if (watching) {
                view.getViewTreeObserver().removeOnPreDrawListener(this);
                watching = false;
            }
            // A blur drawable belongs to the window it was created for.
            blur = null;
            topBlur = null;
            blurUnavailable = false;
        }

        private static View find(View view, String tag) {
            if (view == null || view.getVisibility() != View.VISIBLE) {
                return null;
            }
            Object viewTag = view.getTag();
            if (viewTag instanceof String && ((String) viewTag).contains(tag)
                    && view.getBackground() != null && view.getWidth() > 0) {
                return view;
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int index = 0; index < group.getChildCount(); index++) {
                    View match = find(group.getChildAt(index), tag);
                    if (match != null) {
                        return match;
                    }
                }
            }
            return null;
        }
    }
}
