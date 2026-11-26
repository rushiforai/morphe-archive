package app.bin0culars.extension.reddit;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

public final class GlassSearch {

    static final float BUTTON_GAP_DP = 10f;
    static final float CIRCLE_EXTRA_DP = 8f;
    private static final String BOTTOM_NAV_SCREEN = "com.reddit.launch.bottomnav.BottomNavScreen";
    private static final String BUTTON_TAG = "bin0culars_glass_search_button";
    private static final String FADE_TAG = "bin0culars_glass_status_fade";

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final Set<Object> OVERLAY_SCREENS =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    private static final Function0<Object> NO_OP_CLICK =
            new Function0<Object>() {
                @Override
                public Object invoke() {
                    return null;
                }
            };

    private static final Function1<Object, Object> CIRCLE_DRAW =
            new Function1<Object, Object>() {
                @Override
                public Object invoke(Object scope) {
                    try {
                        if (isSettingEnabled()) {
                            drawCircle(scope);
                        }
                    } catch (Throwable ignored) {
                    } finally {
                        try {
                            GlassNavPatch.drawContent(scope);
                        } catch (Throwable ignored) {
                        }
                    }
                    return null;
                }
            };

    private static final AtomicBoolean UPDATE_PENDING = new AtomicBoolean(false);
    private static final Runnable UPDATE_RUNNABLE = () -> {
        UPDATE_PENDING.set(false);
        updateButtonState();
    };

    private static volatile Function0<?> searchAction;
    private static volatile WeakReference<Activity> activityRef;
    private static volatile WeakReference<GlassSearchButton> buttonRef;
    private static volatile WeakReference<GlassStatusFade> fadeRef;
    private static volatile WeakReference<View> bottomNavViewRef;
    private static volatile boolean hooksApplied;
    private static volatile boolean bottomNavAttached;
    private static volatile boolean showBottomNav = true;
    private static volatile float lastSlideDownPx;
    private static volatile boolean barAutoHidden;
    private static volatile float lastCircleDiameterPx;

    private GlassSearch() {}

    static boolean isSettingEnabled() {
        try {
            return BinocularsMods.isEnabled("glass_navigation")
                    && BinocularsMods.isEnabled("glass_navigation_search");
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean isTablet(Context context) {
        try {
            if (GlassNavPatch.railInUse) {
                return true;
            }
            Context ctx = context != null ? context : GlassNavPatch.getApplicationContext();
            Resources res = ctx != null ? ctx.getResources() : Resources.getSystem();
            return res.getConfiguration().screenWidthDp >= 600;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Function0<?> getSearchAction() {
        return searchAction;
    }

    static Activity getActivity() {
        WeakReference<Activity> ref = activityRef;
        return ref != null ? ref.get() : null;
    }

    static float getCircleDiameterPx() {
        return lastCircleDiameterPx;
    }

    static boolean isSearchButtonActive() {
        return isSettingEnabled() && hooksApplied && !isTablet(getActivity());
    }

    public static void setTabsHooksApplied() {
        try {
            GlassTopTabs.setHooksApplied();
        } catch (Throwable ignored) {
        }
    }

    public static Function2<?, ?, ?> wrapBelow(Function2<?, ?, ?> original) {
        try {
            return GlassTopTabs.wrapBelow(original);
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static void inlineTabs(Object composer) {
        try {
            GlassTopTabs.inlineTabs(composer);
        } catch (Throwable ignored) {
        }
    }

    public static Object tabsModifier(Object modifier) {
        try {
            return GlassTopTabs.tabsModifier(modifier);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    public static float headerTabsHeight(float original) {
        try {
            return GlassTopTabs.headerTabsHeight(original);
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static void setHomePager(Object pager) {
        try {
            GlassTopTabs.setHomePager(pager);
        } catch (Throwable ignored) {
        }
    }

    public static Object tabIndicatorModifier(Object modifier) {
        try {
            return GlassTopTabs.tabIndicatorModifier(modifier);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    public static boolean tabsEvenly(boolean original) {
        try {
            return GlassTopTabs.tabsEvenly(original);
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static float tabsRowPadding(float original) {
        try {
            return GlassTopTabs.isTabsActive() ? 2f : original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static long tabLabelFontSize() {
        try {
            return GlassTabLabel.tabLabelFontSize();
        } catch (Throwable ignored) {
            return 0L;
        }
    }

    public static long tabLabelLineHeight() {
        try {
            return GlassTabLabel.tabLabelLineHeight();
        } catch (Throwable ignored) {
            return 0L;
        }
    }

    public static int tabLabelMask(int original) {
        try {
            return GlassTabLabel.tabLabelMask(original);
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static Object tabItemModifier(Object modifier) {
        try {
            return GlassTabLabel.tabItemModifier(modifier);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    public static float tabItemTopPadding(float original) {
        try {
            return GlassTabLabel.tabItemTopPadding(original);
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static void setHooksApplied() {
        try {
            if (hooksApplied) {
                return;
            }
            hooksApplied = true;
            if (buttonRef == null || buttonRef.get() == null) {
                MAIN_HANDLER.post(() -> {
                    Activity activity = activityRef != null ? activityRef.get() : null;
                    if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
                        onActivityResumed(activity);
                    }
                });
            }
        } catch (Throwable ignored) {
        }
    }

    static float buttonDiameterDp() {
        float density = GlassNavPatch.getDensity();
        return density > 0f ? GlassNavPatch.capsuleHeightPx() / density : 60f;
    }

    public static void setSearchAction(Function0<?> action) {
        try {
            searchAction = action;
            postUpdateButtonState();
        } catch (Throwable ignored) {
        }
    }

    public static Object searchFieldModifier(Object modifier) {
        try {
            if (!isSettingEnabled()) {
                return modifier;
            }
            return graphicsLayer(modifier, 0f, 0f, 0f, 0f, 0f, null, false, 2, 0x6fffb);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    public static Function0<?> searchFieldClick(Function0<?> original) {
        try {
            if (!isSettingEnabled()) {
                return original;
            }
            return NO_OP_CLICK;
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static Object circleModifier(Object modifier) {
        try {
            if (!isSettingEnabled()) {
                return modifier;
            }
            GlassSearchButton button = buttonRef != null ? buttonRef.get() : null;
            if (button != null && Looper.myLooper() == Looper.getMainLooper()) {
                button.invalidate();
            }
            return GlassBlur.drawWithContent(modifier, CIRCLE_DRAW);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    public static void onFeedAtTop(boolean atTop) {
        try {
            GlassTopBarState.onFeedAtTop(atTop);
        } catch (Throwable ignored) {
        }
    }

    public static void registerFeed(Object listState, Object feedState) {
        try {
            GlassTopBarState.registerFeed(listState, feedState);
        } catch (Throwable ignored) {
        }
    }

    public static void registerFeedSwapped(Object feedState, Object listState) {
        try {
            GlassTopBarState.registerFeed(listState, feedState);
        } catch (Throwable ignored) {
        }
    }

    public static long topBarColor(long original) {
        try {
            if (!isSettingEnabled()) {
                return original;
            }
            long pageColor = GlassNavPatch.lastPageColor;
            if (pageColor == 0L) {
                return original;
            }
            return GlassTopBarState.isFeedAtTop()
                    ? (pageColor | 0xFF00000000000000L)
                    : (pageColor & 0x00FFFFFFFFFFFFFFL);
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static void onShowBottomNav(boolean show) {
        try {
            if (showBottomNav != show) {
                showBottomNav = show;
                updateButtonState();
            }
        } catch (Throwable ignored) {
        }
    }

    public static void onScreenAttached(Object screen, View view) {
        try {
            if (screen == null) {
                return;
            }
            if (BOTTOM_NAV_SCREEN.equals(screen.getClass().getName())) {
                bottomNavAttached = true;
                bottomNavViewRef = new WeakReference<>(view);
                OVERLAY_SCREENS.clear();
            } else if (view != null) {
                View bottomView = bottomNavViewRef != null ? bottomNavViewRef.get() : null;
                if (bottomView != null
                        && bottomView != view
                        && bottomView.getParent() != null
                        && view.getParent() == bottomView.getParent()) {
                    OVERLAY_SCREENS.add(screen);
                }
            }
            updateButtonState();
        } catch (Throwable ignored) {
        }
    }

    public static void onScreenDetached(Object screen, View view) {
        try {
            if (screen == null) {
                return;
            }
            if (BOTTOM_NAV_SCREEN.equals(screen.getClass().getName())) {
                bottomNavAttached = false;
            } else {
                OVERLAY_SCREENS.remove(screen);
            }
            updateButtonState();
        } catch (Throwable ignored) {
        }
    }

    static void onBarSlide(float slideDownPx, boolean hidden) {
        try {
            lastSlideDownPx = slideDownPx;
            barAutoHidden = hidden;
            updateButtonState();
        } catch (Throwable ignored) {
        }
    }

    static void onActivityResumed(Activity activity) {
        try {
            if (activity == null) {
                return;
            }
            activityRef = new WeakReference<>(activity);
            View contentView = activity.findViewById(android.R.id.content);
            if (!(contentView instanceof FrameLayout)) {
                return;
            }
            FrameLayout content = (FrameLayout) contentView;
            View existing = content.findViewWithTag(BUTTON_TAG);
            GlassSearchButton button = existing instanceof GlassSearchButton ? (GlassSearchButton) existing : null;
            View existingFade = content.findViewWithTag(FADE_TAG);
            GlassStatusFade fade = existingFade instanceof GlassStatusFade ? (GlassStatusFade) existingFade : null;

            if (!isSearchButtonActive()) {
                if (button != null) {
                    button.setVisibility(View.GONE);
                }
                if (fade != null) {
                    fade.setVisibility(View.GONE);
                }
                return;
            }

            if (fade == null) {
                fade = new GlassStatusFade(activity);
                fade.setTag(FADE_TAG);
                fade.setVisibility(View.GONE);
                FrameLayout.LayoutParams fadeLp = new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.MATCH_PARENT, 0, Gravity.TOP);
                content.addView(fade, fadeLp);
            }

            if (button == null) {
                button = new GlassSearchButton(activity);
                button.setTag(BUTTON_TAG);
                button.setVisibility(View.GONE);
                int diameter = Math.round(GlassNavPatch.capsuleHeightPx());
                FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                        diameter, diameter, Gravity.BOTTOM | Gravity.END);
                content.addView(button, lp);
                final GlassSearchButton added = button;
                final GlassStatusFade addedFade = fade;
                content.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                    if (r - l != or - ol || b - t != ob - ot) {
                        added.updateLayoutParams();
                        addedFade.updateLayoutParams();
                        updateButtonState();
                    }
                });
            }

            fadeRef = new WeakReference<>(fade);
            fade.updateLayoutParams();
            buttonRef = new WeakReference<>(button);
            button.updateLayoutParams();
            updateButtonState();
        } catch (Throwable ignored) {
        }
    }

    static void onConfigurationChanged() {
        try {
            GlassSearchButton button = buttonRef != null ? buttonRef.get() : null;
            if (button != null) {
                button.updateLayoutParams();
            }
            GlassStatusFade fade = fadeRef != null ? fadeRef.get() : null;
            if (fade != null) {
                fade.updateLayoutParams();
            }
            updateButtonState();
        } catch (Throwable ignored) {
        }
    }

    static void invokeSearchAction() {
        try {
            Function0<?> action = getSearchAction();
            if (action != null) {
                action.invoke();
            }
        } catch (Throwable ignored) {
        }
    }

    private static void postUpdateButtonState() {
        if (UPDATE_PENDING.compareAndSet(false, true)) {
            MAIN_HANDLER.post(UPDATE_RUNNABLE);
        }
    }

    private static void updateButtonState() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            postUpdateButtonState();
            return;
        }
        try {
            GlassSearchButton button = buttonRef != null ? buttonRef.get() : null;
            GlassStatusFade fade = fadeRef != null ? fadeRef.get() : null;
            if (button == null && fade == null) {
                return;
            }
            Context context = button != null ? button.getContext() : fade.getContext();
            boolean shouldShow = isSearchButtonActive()
                    && !isTablet(context)
                    && getSearchAction() != null
                    && bottomNavAttached
                    && showBottomNav
                    && OVERLAY_SCREENS.isEmpty();
            if (!shouldShow) {
                if (button != null && button.getVisibility() != View.GONE) {
                    button.setVisibility(View.GONE);
                }
                if (fade != null && fade.getVisibility() != View.GONE) {
                    fade.setVisibility(View.GONE);
                }
                return;
            }
            if (fade != null) {
                if (fade.getVisibility() != View.VISIBLE) {
                    fade.setVisibility(View.VISIBLE);
                }
                fade.updateLayoutParams();
                fade.invalidate();
            }
            if (button != null) {
                button.setTranslationY(lastSlideDownPx);
                if (barAutoHidden) {
                    if (button.getVisibility() != View.INVISIBLE) {
                        button.setVisibility(View.INVISIBLE);
                    }
                } else {
                    if (button.getVisibility() != View.VISIBLE) {
                        button.setVisibility(View.VISIBLE);
                    }
                    button.updateLayoutParams();
                    button.invalidate();
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void drawCircle(Object scope) {
        long size = GlassNavPatch.drawScopeSize(scope);
        float width = Float.intBitsToFloat((int) (size >>> 32));
        float height = Float.intBitsToFloat((int) size);
        if (width <= 0f || height <= 0f) {
            return;
        }
        float density = GlassNavPatch.getDensity();
        float extra = CIRCLE_EXTRA_DP * density;
        float rectWidth;
        float rectHeight;
        if (width > height) {
            rectWidth = width + extra;
            rectHeight = height + extra;
        } else {
            float diameter = Math.max(width, height) + extra;
            rectWidth = diameter;
            rectHeight = diameter;
        }
        if (Math.abs(width - height) <= 2f) {
            lastCircleDiameterPx = rectHeight;
        }
        float left = (width - rectWidth) / 2f;
        float top = (height - rectHeight) / 2f;
        float radius = rectHeight / 2f;
        drawGlassCapsule(scope, left, top, rectWidth, rectHeight, radius);
    }

    static void drawGlassCapsule(Object scope, float left, float top, float width, float height, float radius) {
        long topLeft = packFloats(left, top);
        long rectSize = packFloats(width, height);
        long cornerRadius = packFloats(radius, radius);
        long color = GlassNavPatch.getCapsuleColor();
        GlassStyle.drawShadow(scope, left, top, width, height, radius);
        GlassHeaderBlur.drawShapeBlur(scope, left, top, width, height, radius);
        GlassNavPatch.drawRoundRect(scope, color, topLeft, rectSize, cornerRadius, null, 1.0f, 0xF0);
        if (GlassStyle.isClear()) {
            GlassBlur.drawEdge(scope, left, top, width, height, radius);
        } else {
            GlassStyle.drawOutline(scope, left, top, width, height, radius);
        }
    }

    private static long packFloats(float x, float y) {
        return ((long) Float.floatToRawIntBits(x) << 32) | (Float.floatToRawIntBits(y) & 0xFFFFFFFFL);
    }

    static Object graphicsLayer(
            Object modifier,
            float scaleX,
            float scaleY,
            float alpha,
            float shadowElevation,
            float cameraDistance,
            Object shape,
            boolean clip,
            int compositingStrategy,
            int mask) {
        return modifier;
    }
}
