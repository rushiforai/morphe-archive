package app.liquidmusic.extension;

import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.HapticFeedbackConstants;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.OvershootInterpolator;
import android.widget.FrameLayout;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Pure Android {@link View} overlay that renders a draggable Liquid Glass drop pill over
 * Apple Music's {@code bottom_nav_view}, delegating all navigation to the underlying bar.
 */
@SuppressLint("ViewConstructor")
final class LiquidTabBarOverlay extends View {

    private static final class TabItem {
        final int id;
        final String title;
        final Drawable icon;

        TabItem(int id, String title, Drawable icon) {
            this.id = id;
            this.title = title;
            this.icon = icon != null ? icon.mutate() : null;
        }
    }

    private final View bottomNav;
    private final List<TabItem> tabs = new ArrayList<>();
    private final Paint dropFillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint dropRimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF dropRect = new RectF();
    private final Handler handler = new Handler(Looper.getMainLooper());

    private Method getMenuMethod;
    private Method getSelectedIdMethod;
    private Method setSelectedIdMethod;

    private int activeIndex = 0;
    private float dropPos = 0f;
    private float dragStretch = 0f;
    private ValueAnimator snapAnimator;

    private boolean startTabApplied = false;
    private boolean isDragging = false;
    private boolean longPressTriggered = false;
    private float downX;
    private float downY;
    private final int touchSlop;

    private final Runnable longPressRunnable = () -> {
        longPressTriggered = true;
        isDragging = false;
        performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
        SettingsDialog.show(getContext());
    };

    private LiquidTabBarOverlay(Context context, View bottomNav) {
        super(context);
        this.bottomNav = bottomNav;
        this.touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();

        dropFillPaint.setStyle(Paint.Style.FILL);
        dropRimPaint.setStyle(Paint.Style.STROKE);
        textPaint.setTextAlign(Paint.Align.CENTER);
        textPaint.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));

        resolveNavMethods();
        setClickable(true);
    }

    static void attachIfNeeded(ViewGroup blurView, View bottomNav) {
        if (blurView == null || bottomNav == null) return;

        boolean enabled = LiquidPrefs.isLiquidTabBar(blurView.getContext());
        LiquidTabBarOverlay existing = findOverlay(blurView);

        if (!enabled) {
            bottomNav.setAlpha(1f);
            if (existing != null) {
                existing.setVisibility(GONE);
            }
            return;
        }

        bottomNav.setAlpha(0f);
        if (existing == null) {
            existing = new LiquidTabBarOverlay(blurView.getContext(), bottomNav);
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            );
            blurView.addView(existing, lp);
            LiquidPrefs.trackView(existing);
        } else {
            existing.setVisibility(VISIBLE);
        }
        existing.syncTabs();
        existing.invalidate();
    }

    private static LiquidTabBarOverlay findOverlay(ViewGroup parent) {
        for (int i = 0, n = parent.getChildCount(); i < n; i++) {
            View child = parent.getChildAt(i);
            if (child instanceof LiquidTabBarOverlay) {
                return (LiquidTabBarOverlay) child;
            }
        }
        return null;
    }

    private void resolveNavMethods() {
        Class<?> cls = bottomNav.getClass();
        try {
            getMenuMethod = cls.getMethod("getMenu");
            getSelectedIdMethod = cls.getMethod("getSelectedItemId");
            setSelectedIdMethod = cls.getMethod("setSelectedItemId", int.class);
        } catch (Throwable ignored) {
        }
    }

    private void syncTabs() {
        if (getMenuMethod == null) return;
        try {
            Menu menu = (Menu) getMenuMethod.invoke(bottomNav);
            if (menu == null) return;

            boolean hideNew = LiquidGlassPatch.hideNewTab();
            boolean hideRadio = LiquidGlassPatch.hideRadioTab();

            List<TabItem> fresh = new ArrayList<>();
            for (int i = 0, n = menu.size(); i < n; i++) {
                MenuItem item = menu.getItem(i);
                if (!item.isVisible()) continue;
                String title = item.getTitle() != null ? item.getTitle().toString() : "";
                String lower = title.toLowerCase(Locale.ROOT);
                if (hideNew && (lower.equals("new") || lower.equals("yeni") || lower.contains("browse"))) {
                    continue;
                }
                if (hideRadio && (lower.equals("radio") || lower.equals("radyo"))) {
                    continue;
                }
                fresh.add(new TabItem(item.getItemId(), title, item.getIcon()));
            }

            if (fresh.isEmpty()) return;

            boolean changed = fresh.size() != tabs.size();
            if (!changed) {
                for (int i = 0; i < fresh.size(); i++) {
                    if (fresh.get(i).id != tabs.get(i).id) {
                        changed = true;
                        break;
                    }
                }
            }
            if (changed) {
                tabs.clear();
                tabs.addAll(fresh);
            }

            if (!startTabApplied) {
                startTabApplied = true;
                applyStartTab();
            }

            syncSelectedFromNav();
        } catch (Throwable ignored) {
        }
    }

    private void applyStartTab() {
        String target = LiquidGlassPatch.startTab();
        if (target == null || target.equals("home")) return;
        for (TabItem tab : tabs) {
            if (matchesStartTab(tab.title, target)) {
                selectTabInNav(tab.id);
                break;
            }
        }
    }

    private static boolean matchesStartTab(String title, String target) {
        String lower = title.toLowerCase(Locale.ROOT);
        switch (target) {
            case "new":
                return lower.equals("new") || lower.equals("yeni") || lower.contains("browse");
            case "radio":
                return lower.equals("radio") || lower.equals("radyo");
            case "library":
                return lower.equals("library") || lower.equals("arşiv") || lower.equals("kitaplık");
            case "search":
                return lower.equals("search") || lower.equals("ara");
            default:
                return lower.equals("home") || lower.equals("ana sayfa");
        }
    }

    private void syncSelectedFromNav() {
        if (getSelectedIdMethod == null || tabs.isEmpty()) return;
        try {
            int selectedId = (int) getSelectedIdMethod.invoke(bottomNav);
            for (int i = 0; i < tabs.size(); i++) {
                if (tabs.get(i).id == selectedId) {
                    if (i != activeIndex && !isDragging) {
                        activeIndex = i;
                        animateDropTo(i);
                    }
                    break;
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private void selectTabInNav(int itemId) {
        if (setSelectedIdMethod == null) return;
        try {
            setSelectedIdMethod.invoke(bottomNav, itemId);
        } catch (Throwable ignored) {
        }
    }

    private void animateDropTo(int targetIndex) {
        if (snapAnimator != null) {
            snapAnimator.cancel();
        }
        float start = dropPos;
        float end = targetIndex;
        if (Math.abs(start - end) < 0.001f) {
            dropPos = end;
            dragStretch = 0f;
            invalidate();
            return;
        }
        snapAnimator = ValueAnimator.ofFloat(start, end);
        snapAnimator.setDuration(320);
        snapAnimator.setInterpolator(new OvershootInterpolator(1.1f));
        snapAnimator.addUpdateListener(anim -> {
            dropPos = (float) anim.getAnimatedValue();
            dragStretch = Math.max(0f, dragStretch * 0.88f);
            invalidate();
        });
        snapAnimator.start();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        syncTabs();
        if (tabs.isEmpty()) return;

        int width = getWidth();
        int height = getHeight();
        if (width <= 0 || height <= 0) return;

        Context ctx = getContext();
        float d = ctx.getResources().getDisplayMetrics().density;
        boolean showLabels = LiquidPrefs.isTabLabels(ctx);
        boolean isDark = (ctx.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;

        int count = tabs.size();
        float horizontalPad = 6f * d;
        float usableWidth = Math.max(1f, width - horizontalPad * 2f);
        float tabWidth = usableWidth / count;

        // Draw the liquid glass drop pill behind the active tab
        float clampedPos = Math.max(0f, Math.min(count - 1f, dropPos));
        float dropCenterX = horizontalPad + (clampedPos + 0.5f) * tabWidth;
        float dropHalfW = (tabWidth * 0.44f) + dragStretch * 8f * d;
        float dropVertPad = 4f * d;
        dropRect.set(
                Math.max(horizontalPad, dropCenterX - dropHalfW),
                dropVertPad,
                Math.min(width - horizontalPad, dropCenterX + dropHalfW),
                height - dropVertPad
        );
        float dropRadius = dropRect.height() * 0.5f;

        dropFillPaint.setColor(isDark ? 0x33FFFFFF : 0x55FFFFFF);
        canvas.drawRoundRect(dropRect, dropRadius, dropRadius, dropFillPaint);

        dropRimPaint.setStrokeWidth(Math.max(1f, 1.0f * d));
        dropRimPaint.setShader(new LinearGradient(
                dropRect.left, dropRect.top, dropRect.left, dropRect.bottom,
                isDark ? 0x88FFFFFF : 0xCCFFFFFF,
                isDark ? 0x22FFFFFF : 0x44FFFFFF,
                Shader.TileMode.CLAMP
        ));
        canvas.drawRoundRect(dropRect, dropRadius, dropRadius, dropRimPaint);

        int activeColor = isDark ? 0xFF0A84FF : 0xFF007AFF;
        int inactiveColor = isDark ? 0xCCFFFFFF : 0xBB1C1C1E;

        int iconSize = Math.round((showLabels ? 22f : 25f) * d);
        textPaint.setTextSize(10.5f * d);

        for (int i = 0; i < count; i++) {
            TabItem tab = tabs.get(i);
            float centerX = horizontalPad + (i + 0.5f) * tabWidth;
            float distance = Math.abs(clampedPos - i);
            boolean isNearActive = distance < 0.5f;
            int tint = isNearActive ? activeColor : inactiveColor;

            if (tab.icon != null) {
                int iconTop = showLabels
                        ? Math.round((height - iconSize) * 0.32f)
                        : Math.round((height - iconSize) * 0.5f);
                int iconLeft = Math.round(centerX - iconSize * 0.5f);
                tab.icon.setBounds(iconLeft, iconTop, iconLeft + iconSize, iconTop + iconSize);
                tab.icon.setColorFilter(new PorterDuffColorFilter(tint, PorterDuff.Mode.SRC_IN));
                tab.icon.draw(canvas);
            }

            if (showLabels && !tab.title.isEmpty()) {
                textPaint.setColor(tint);
                float textY = height - 8.5f * d;
                canvas.drawText(tab.title, centerX, textY, textPaint);
            }
        }
    }

    @SuppressLint("ClickableViewAccessibility")
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (tabs.isEmpty()) return super.onTouchEvent(event);

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = event.getX();
                downY = event.getY();
                isDragging = false;
                longPressTriggered = false;
                handler.postDelayed(longPressRunnable, ViewConfiguration.getLongPressTimeout());
                return true;

            case MotionEvent.ACTION_MOVE: {
                float dx = event.getX() - downX;
                float dy = event.getY() - downY;
                if (!isDragging && (Math.abs(dx) > touchSlop || Math.abs(dy) > touchSlop)) {
                    handler.removeCallbacks(longPressRunnable);
                    isDragging = true;
                    if (snapAnimator != null) snapAnimator.cancel();
                }
                if (isDragging) {
                    float pos = xToTabFloat(event.getX());
                    dragStretch = Math.min(1f, Math.abs(pos - dropPos) * 1.4f);
                    dropPos = pos;
                    int nearest = Math.round(pos);
                    if (nearest != activeIndex && nearest >= 0 && nearest < tabs.size()) {
                        activeIndex = nearest;
                        triggerHaptic();
                        selectTabInNav(tabs.get(nearest).id);
                    }
                    invalidate();
                }
                return true;
            }

            case MotionEvent.ACTION_UP:
                handler.removeCallbacks(longPressRunnable);
                if (longPressTriggered) {
                    return true;
                }
                int target = Math.max(0, Math.min(tabs.size() - 1,
                        isDragging ? Math.round(dropPos) : Math.round(xToTabFloat(event.getX()))));
                if (target != activeIndex) {
                    activeIndex = target;
                    triggerHaptic();
                }
                selectTabInNav(tabs.get(target).id);
                isDragging = false;
                animateDropTo(target);
                return true;

            case MotionEvent.ACTION_CANCEL:
                handler.removeCallbacks(longPressRunnable);
                isDragging = false;
                animateDropTo(activeIndex);
                return true;

            default:
                return super.onTouchEvent(event);
        }
    }

    private float xToTabFloat(float x) {
        float d = getContext().getResources().getDisplayMetrics().density;
        float horizontalPad = 6f * d;
        float usableWidth = Math.max(1f, getWidth() - horizontalPad * 2f);
        float tabWidth = usableWidth / tabs.size();
        float raw = (x - horizontalPad) / tabWidth - 0.5f;
        return Math.max(0f, Math.min(tabs.size() - 1f, raw));
    }

    private void triggerHaptic() {
        if (LiquidPrefs.isTabHaptics(getContext())) {
            performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        handler.removeCallbacks(longPressRunnable);
        if (snapAnimator != null) {
            snapAnimator.cancel();
            snapAnimator = null;
        }
        super.onDetachedFromWindow();
    }
}
