/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * https://github.com/MorpheApp/morphe-patches/pull/5107
 * https://github.com/MorpheApp/morphe-patches/pull/5128
 * https://github.com/MorpheApp/morphe-patches/pull/5130
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.shared.patches.glassmenus;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Looper;
import android.os.PowerManager;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.Consumer;

import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.settings.preference.SeekBarPreference;
import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Logger;

@RequiresApi(Build.VERSION_CODES.S)
final class GlassSurface implements View.OnAttachStateChangeListener, ViewTreeObserver.OnPreDrawListener {
    enum Shape { BOTTOM_SHEET, WINDOW_PANEL, ROUNDED, POPUP, PLAYLIST_LIST, FLAT }

    private record Fill(View host, Drawable drawable, boolean litho) { }

    private static final String[] MENU_ATTRIBUTES = {
            "ytRaisedBackground", "ytBaseBackground", "ytMenuBackground", "ytAdditiveBackground"
    };
    private static final ColorFilter CLEAR = new PorterDuffColorFilter(Color.TRANSPARENT, PorterDuff.Mode.SRC);
    private static final Map<View, WeakReference<GlassSurface>> tracked = new WeakHashMap<>();
    private static volatile int visibleSurfaces;

    private final View view;
    private final View foreground;
    @Nullable private final Window window;
    @Nullable private final Activity owner;
    private final Shape shape;
    private final boolean windowBackground;
    private final int[] menuColors;
    private final int[] viewLocation = new int[2];
    private final int[] hostLocation = new int[2];
    private final boolean translucentWindow;
    private final Rect panel = new Rect();
    private final Rect previousPanel = new Rect();
    private final Rect fillBounds = new Rect();
    private final Outline fillOutline = new Outline();
    private final List<Fill> viewFills = new ArrayList<>();
    private final List<Fill> lithoFills = new ArrayList<>();
    private final Map<Drawable, View> wanted = new IdentityHashMap<>();
    private final Map<Drawable, ColorFilter> hidden = new IdentityHashMap<>();
    private final Consumer<Boolean> blurListener = this::onSystemBlur;
    private final ViewTreeObserver.OnGlobalLayoutListener layoutListener = () -> layoutChanged = true;
    private final BroadcastReceiver powerReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            onPowerChanged();
        }
    };

    @Nullable private WindowManager windowManager;
    @Nullable private PowerManager powerManager;
    @Nullable private ViewTreeObserver observer;
    @Nullable private Drawable stock;
    @Nullable private GlassPanelDrawable tint;
    @Nullable private BlurRegion region;
    private boolean systemBlur;
    private boolean powerSaver;
    private boolean registeredPower;
    private boolean registeredBlur;
    private boolean layoutChanged = true;
    private boolean lithoChanged = true;
    private boolean installed;
    private boolean nativeBlur;
    private boolean regionChecked;
    private boolean failed;
    private boolean dimChanged;
    private float stockDim;
    private float appliedDim;
    private int appliedRadius;
    private int windowBottom;
    private int lithoChanges = -1;
    private int stockColor;
    private float cornerRadius;

    static void apply(View view, View foreground, @Nullable Window window, @Nullable Activity owner, Shape shape) {
        if (!tracked.containsKey(view)) {
            GlassSurface surface = new GlassSurface(view, foreground, window, owner, shape);
            tracked.put(view, new WeakReference<>(surface));
        }
    }

    static boolean hasOpenMenus() {
        return visibleSurfaces != 0;
    }

    /** A bounds/color callback can precede draw without requesting a global View layout. */
    static void onLithoBoundsChanged(View host) {
        if (visibleSurfaces == 0 || Looper.myLooper() != Looper.getMainLooper()) return;

        for (Object current = host; current instanceof View child; current = child.getParent()) {
            WeakReference<GlassSurface> reference = tracked.get(child);
            GlassSurface surface = reference == null ? null : reference.get();
            if (surface != null && !surface.lithoChanged && surface.systemBlur && !surface.powerSaver) {
                surface.lithoChanged = true;
                child.postInvalidateOnAnimation();
            }
        }
    }

    private GlassSurface(View view, View foreground, @Nullable Window window, @Nullable Activity owner, Shape shape) {
        this.view = view;
        this.foreground = foreground;
        this.window = window;
        this.owner = owner;
        this.shape = shape;
        windowBackground = shape == Shape.WINDOW_PANEL;
        TypedValue value = new TypedValue();
        translucentWindow = windowBackground && window != null
                && window.getContext().getTheme().resolveAttribute(android.R.attr.windowIsTranslucent, value, true)
                && value.data != 0;
        menuColors = themeColors(view.getContext());

        view.addOnAttachStateChangeListener(this);
        if (view.isAttachedToWindow()) onViewAttachedToWindow(view);
    }

    @Override
    public void onViewAttachedToWindow(View view) {
        if (!GlassMenusPatch.isEnabled() || !view.isHardwareAccelerated()) return;

        try {
            Context context = view.getContext();
            windowManager = context.getSystemService(WindowManager.class);
            powerManager = context.getSystemService(PowerManager.class);
            if (windowManager == null || powerManager == null) return;

            powerSaver = powerManager.isPowerSaveMode();
            systemBlur = windowManager.isCrossWindowBlurEnabled();
            windowManager.addCrossWindowBlurEnabledListener(context.getMainExecutor(), blurListener);
            registeredBlur = true;

            IntentFilter filter = new IntentFilter(PowerManager.ACTION_POWER_SAVE_MODE_CHANGED);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                context.registerReceiver(powerReceiver, filter, Context.RECEIVER_NOT_EXPORTED);
            } else {
                context.registerReceiver(powerReceiver, filter);
            }
            registeredPower = true;

            observer = view.getViewTreeObserver();
            observer.addOnPreDrawListener(this);
            observer.addOnGlobalLayoutListener(layoutListener);
            visibleSurfaces++;
        } catch (RuntimeException ex) {
            fail(ex);
        }
    }

    @Override
    public void onViewDetachedFromWindow(View view) {
        if (observer != null && observer.isAlive()) {
            observer.removeOnPreDrawListener(this);
            observer.removeOnGlobalLayoutListener(layoutListener);
        }
        if (observer != null) visibleSurfaces--;

        if (registeredBlur && windowManager != null) windowManager.removeCrossWindowBlurEnabledListener(blurListener);
        if (registeredPower) view.getContext().unregisterReceiver(powerReceiver);

        deactivate();
        observer = null;
        windowManager = null;
        powerManager = null;
        registeredBlur = false;
        registeredPower = false;
        failed = false;
        stock = null;
        stockColor = Color.TRANSPARENT;
        tint = null;
        viewFills.clear();
        lithoFills.clear();
    }

    private void onPowerChanged() {
        if (powerManager == null) return;

        powerSaver = powerManager.isPowerSaveMode();
        onCapabilityChanged();
    }

    private void onSystemBlur(boolean enabled) {
        systemBlur = enabled;
        onCapabilityChanged();
    }

    private void onCapabilityChanged() {
        if (!systemBlur || powerSaver) deactivate();
        view.postInvalidateOnAnimation();
    }

    @Override
    public boolean onPreDraw() {
        if (failed) return true;

        try {
            if (systemBlur && !powerSaver && GlassMenusPatch.isEnabled()) {
                update();
            } else if (installed || region != null) {
                deactivate();
            }
        } catch (RuntimeException ex) {
            fail(ex);
        }
        return true;
    }

    private void update() {
        Drawable background = view.getBackground();
        if (background != (installed ? tint : stock)) {
            restore();
            stock = background;
            stockColor = SolidColors.colorOf(stock);
            tint = null;
            layoutChanged = true;
        }

        boolean layout = layoutChanged;
        if (layout) {
            layoutChanged = false;
            if (windowManager != null) windowBottom = windowManager.getCurrentWindowMetrics().getBounds().bottom;
            viewFills.clear();
            collectViewFills(view);
        }
        int version = LithoFills.changes();
        boolean newLitho = layout || lithoChanged || lithoChanges != version;
        if (newLitho) {
            lithoChanged = false;
            // A new mounted fill is reconciled before draw, even if the host did not request layout.
            lithoChanges = version;
            lithoFills.clear();
            LithoFills.visitInside(view, this::collectLithoFill);
        }

        previousPanel.set(panel);
        if (!findPanel()) {
            restore();
            return;
        }

        int opacity = SeekBarPreference.clampToRange(SharedYouTubeSettings.GLASS_MENUS_OPACITY);
        int blurRadius = Dim.dp(SeekBarPreference.clampToRange(SharedYouTubeSettings.GLASS_MENUS_BLUR));
        boolean roundBottom = hasRoundBottom();
        boolean platform = canUseWindowBlur(roundBottom);
        boolean boundsChanged = !previousPanel.equals(panel);
        if (!platform && !prepareRegion(blurRadius, layout || boundsChanged)) {
            restore();
            return;
        }

        if (!installed || nativeBlur != platform) {
            restore();
            install(platform);
            updateHiddenFills();
        } else if (newLitho || boundsChanged) {
            updateHiddenFills();
        }
        if (tint.configure(panel, cornerRadius, roundBottom, opacity, platform ? null : region)) {
            view.invalidateOutline();
        }
        if (platform && window != null && appliedRadius != blurRadius) {
            window.setBackgroundBlurRadius(blurRadius);
            appliedRadius = blurRadius;
        }
    }

    private boolean prepareRegion(int blurRadius, boolean layout) {
        if (!regionChecked) {
            regionChecked = true;
            region = BlurRegion.create(view, foreground, owner, BaseThemeUtils.getAppBackgroundColor());
        }
        return region != null && region.prepare(panel, blurRadius, layout);
    }

    private boolean canUseWindowBlur(boolean roundBottom) {
        // DecorView only enables its public background blur for a translucent window. Its API applies
        // to the whole window and uniform corners, so all other panel geometries use a regional source.
        return translucentWindow && roundBottom && panel.left == 0 && panel.top == 0
                && panel.right == view.getWidth() && panel.bottom == view.getHeight();
    }

    private boolean hasRoundBottom() {
        if (shape == Shape.ROUNDED || shape == Shape.POPUP) return true;
        if (shape == Shape.FLAT || shape == Shape.PLAYLIST_LIST || windowManager == null) return false;

        return viewLocation[1] + panel.bottom < windowBottom - Dim.dp2;
    }

    private boolean findPanel() {
        panel.setEmpty();
        if (view.getWidth() <= 0 || view.getHeight() <= 0) return false;

        view.getLocationOnScreen(viewLocation);
        Drawable basis = null;
        if (shape == Shape.BOTTOM_SHEET) {
            // A modern bottom-sheet host may extend into transparent top and side margins. Use its
            // actual mounted panel, not the full host or a bounding box around disjoint decorations.
            basis = largestFill(viewFills, null);
            basis = largestFill(lithoFills, basis);
            if (basis != null) {
                extendPanel(viewFills);
                extendPanel(lithoFills);
            } else if (isMenuColor(stockColor)) {
                basis = SolidColors.leafOf(stock);
                setStockPanel(basis);
            }
        } else if (shape == Shape.POPUP && view != foreground && !isMenuColor(stockColor)) {
            // A popup wrapper may contain shadow padding around its content. Do not blur that padding.
            foreground.getLocationOnScreen(hostLocation);
            int left = hostLocation[0] - viewLocation[0];
            int top = hostLocation[1] - viewLocation[1];
            panel.set(left, top, left + foreground.getWidth(), top + foreground.getHeight());
            if (!panel.intersect(0, 0, view.getWidth(), view.getHeight())) panel.setEmpty();
        } else {
            basis = SolidColors.leafOf(stock);
            setStockPanel(basis);
        }
        if (panel.isEmpty()) return false;

        fillOutline.setEmpty();
        if (basis != null) basis.getOutline(fillOutline);
        float radius = fillOutline.getRadius();
        cornerRadius = shape == Shape.FLAT ? 0 : radius > 0 ? radius : Dim.dp12;
        cornerRadius = Math.min(cornerRadius, Math.min(panel.width(), panel.height()) / 2f);
        return true;
    }

    private void setStockPanel(@Nullable Drawable basis) {
        panel.set(0, 0, view.getWidth(), view.getHeight());
        if (basis != null && !basis.getBounds().isEmpty() && !panel.intersect(basis.getBounds())) panel.setEmpty();
    }

    @Nullable
    private Drawable largestFill(List<Fill> fills, @Nullable Drawable largest) {
        long area = (long) panel.width() * panel.height();
        for (Fill fill : fills) {
            if (!boundsOf(fill) || fillBounds.height() < Dim.dp8) continue;

            long candidate = (long) fillBounds.width() * fillBounds.height();
            if (candidate > area) {
                area = candidate;
                panel.set(fillBounds);
                largest = fill.drawable;
            }
        }
        return largest;
    }

    private void extendPanel(List<Fill> fills) {
        for (Fill fill : fills) {
            if (boundsOf(fill)) extendJoinedPanel(panel, fillBounds);
        }
    }

    /** Only extend across a complete shared edge; do not paint the gap between separate fills. */
    static void extendJoinedPanel(Rect panel, Rect fill) {
        boolean vertical = panel.left == fill.left && panel.right == fill.right
                && panel.top <= fill.bottom && fill.top <= panel.bottom;
        boolean horizontal = panel.top == fill.top && panel.bottom == fill.bottom
                && panel.left <= fill.right && fill.left <= panel.right;
        if (vertical || horizontal) panel.union(fill);
    }

    private boolean boundsOf(Fill fill) {
        View host = fill.host;
        Drawable drawable = fill.drawable;
        if (!host.isShown() || !LithoFills.isInside(host, view)
                || (fill.litho ? LithoFills.hostOf(drawable) != host
                        : SolidColors.leafOf(host.getBackground()) != drawable)) return false;

        fillBounds.set(drawable.getBounds());
        if (fillBounds.isEmpty() && !fill.litho && host.getBackground() == drawable) {
            fillBounds.set(0, 0, host.getWidth(), host.getHeight());
        }
        if (fillBounds.isEmpty()) return false;

        host.getLocationOnScreen(hostLocation);
        fillBounds.offset(hostLocation[0] - viewLocation[0], hostLocation[1] - viewLocation[1]);
        return fillBounds.intersect(0, 0, view.getWidth(), view.getHeight())
                && fillBounds.width() >= (view.getWidth() + 1) / 2;
    }

    private void collectViewFills(View parent) {
        if (!(parent instanceof ViewGroup group)) return;

        for (int index = 0, count = group.getChildCount(); index < count; index++) {
            View child = group.getChildAt(index);
            if (child.getVisibility() != View.VISIBLE) continue;

            Drawable leaf = SolidColors.leafOf(child.getBackground());
            if (leaf != null && isMenuColor(SolidColors.leafColor(leaf))) {
                viewFills.add(new Fill(child, leaf, false));
            }
            collectViewFills(child);
        }
    }

    private void collectLithoFill(Drawable drawable, int color, View host) {
        if (drawable != stock && !drawable.isStateful() && isMenuColor(color)) {
            lithoFills.add(new Fill(host, drawable, true));
        }
    }

    private void updateHiddenFills() {
        wanted.clear();
        addWanted(viewFills);
        addWanted(lithoFills);

        Iterator<Map.Entry<Drawable, ColorFilter>> iterator = hidden.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<Drawable, ColorFilter> entry = iterator.next();
            if (!wanted.containsKey(entry.getKey())) {
                entry.getKey().setColorFilter(entry.getValue());
                iterator.remove();
            }
        }
        for (Map.Entry<Drawable, View> entry : wanted.entrySet()) {
            Drawable drawable = entry.getKey();
            if (!hidden.containsKey(drawable)) {
                hidden.put(drawable, drawable.getColorFilter());
                drawable.setColorFilter(CLEAR);
                entry.getValue().invalidate();
            }
        }
    }

    private void addWanted(List<Fill> fills) {
        for (Fill fill : fills) {
            if (boundsOf(fill) && panel.contains(fillBounds)) wanted.put(fill.drawable, fill.host);
        }
    }

    private void install(boolean platform) {
        if (tint == null) {
            tint = new GlassPanelDrawable(stock, BaseThemeUtils.getAppBackgroundColor(),
                    BaseThemeUtils.isDarkModeEnabled());
        }
        installed = true;
        nativeBlur = platform;
        setBackground(tint);
        if (stock != null) stock.setCallback(tint);
        if (window != null && (window.getAttributes().flags & WindowManager.LayoutParams.FLAG_DIM_BEHIND) != 0) {
            stockDim = window.getAttributes().dimAmount;
            appliedDim = SeekBarPreference.clampToRange(SharedYouTubeSettings.GLASS_MENUS_DIM) / 100f;
            dimChanged = true;
            window.setDimAmount(appliedDim);
        }
    }

    private void deactivate() {
        restore();
        if (region != null) region.clear();
        region = null;
        tint = null;
        regionChecked = false;
        layoutChanged = true;
    }

    private void restore() {
        if (!installed) return;

        installed = false;
        for (Map.Entry<Drawable, ColorFilter> entry : hidden.entrySet()) {
            entry.getKey().setColorFilter(entry.getValue());
            View host = wanted.get(entry.getKey());
            if (host != null) host.invalidate();
        }
        hidden.clear();
        wanted.clear();

        if (stock != null && stock.getCallback() == tint) stock.setCallback(null);
        if (view.getBackground() == tint) setBackground(stock);
        if (window != null) {
            if (nativeBlur) window.setBackgroundBlurRadius(0);
            if (dimChanged && window.getAttributes().dimAmount == appliedDim) window.setDimAmount(stockDim);
        }
        dimChanged = false;
        nativeBlur = false;
        appliedRadius = 0;
    }

    private void setBackground(@Nullable Drawable drawable) {
        if (windowBackground && window != null) {
            window.setBackgroundDrawable(drawable);
            return;
        }

        // Keep the app's explicit padding; replacing a drawable can otherwise reset it.
        boolean relative = view.isPaddingRelative();
        int start = relative ? view.getPaddingStart() : view.getPaddingLeft();
        int top = view.getPaddingTop();
        int end = relative ? view.getPaddingEnd() : view.getPaddingRight();
        int bottom = view.getPaddingBottom();
        view.setBackground(drawable);
        if (relative) view.setPaddingRelative(start, top, end, bottom);
        else view.setPadding(start, top, end, bottom);
    }

    private void fail(RuntimeException ex) {
        failed = true;
        deactivate();
        Logger.printException(() -> "Could not render glass menu; keeping the stock panel", ex);
    }

    private boolean isMenuColor(int color) {
        return similarOpaque(color, stockColor) || matchesThemeColor(menuColors, color);
    }

    static boolean isThemeMenuColor(Context context, int color) {
        return matchesThemeColor(themeColors(context), color);
    }

    private static boolean matchesThemeColor(int[] candidates, int color) {
        for (int candidate : candidates) {
            if (similarOpaque(color, candidate)) return true;
        }
        return false;
    }

    private static boolean similarOpaque(int color, int other) {
        return Color.alpha(color) >= 0xF0 && Color.alpha(other) >= 0xF0
                && Math.abs(Color.red(color) - Color.red(other)) <= 8
                && Math.abs(Color.green(color) - Color.green(other)) <= 8
                && Math.abs(Color.blue(color) - Color.blue(other)) <= 8;
    }

    private static int[] themeColors(Context context) {
        int[] colors = new int[MENU_ATTRIBUTES.length + 2];
        colors[0] = BaseThemeUtils.getAppBackgroundColor();
        colors[1] = BaseThemeUtils.getDialogBackgroundColor();
        TypedValue value = new TypedValue();
        Resources resources = context.getResources();
        for (int index = 0; index < MENU_ATTRIBUTES.length; index++) {
            int id = resources.getIdentifier(MENU_ATTRIBUTES[index], "attr", context.getPackageName());
            if (id == 0 || !context.getTheme().resolveAttribute(id, value, true)) continue;

            if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                colors[index + 2] = value.data;
            } else if (value.resourceId != 0) {
                try {
                    colors[index + 2] = context.getColor(value.resourceId);
                } catch (Resources.NotFoundException ignored) {
                    // Non-color theme entries cannot describe a solid menu fill.
                }
            }
        }
        return colors;
    }
}
