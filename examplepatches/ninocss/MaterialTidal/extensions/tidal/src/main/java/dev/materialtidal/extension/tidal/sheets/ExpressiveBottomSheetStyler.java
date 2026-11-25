package dev.materialtidal.extension.tidal.sheets;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.animation.DecelerateInterpolator;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit;
import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Material 3 Expressive styler for all Material {@code BottomSheetDialog} instances
 * (including TIDAL Context Menus, Broadcast/Connect sheets, Audio Settings, and Fragment sheets).
 */
final class ExpressiveBottomSheetStyler {

    private static final int ROLE_SINGLE = 0;
    private static final int ROLE_FIRST = 1;
    private static final int ROLE_MIDDLE = 2;
    private static final int ROLE_LAST = 3;

    private static final WeakHashMap<View, Integer> ROW_STYLE_CACHE = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> FLOATING_MENU_RECYCLERS = new WeakHashMap<>();
    private static final WeakHashMap<Object, Boolean> FLOATING_MENU_ADAPTERS = new WeakHashMap<>();
    private static final WeakHashMap<Dialog, Boolean> FLOATING_MENU_DIALOGS = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> POPPED_FLOATING_MENUS = new WeakHashMap<>();
    private static final WeakHashMap<Dialog, Boolean> DISMISSING_MENUS = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> TOUCH_EFFECT_ROWS = new WeakHashMap<>();
    private static final SparseArray<String> DRAWABLE_NAME_CACHE = new SparseArray<>();

    // Cached view/adapter IDs
    private static String cachedPackageName;
    private static int idDesignBottomSheet;
    private static int idTouchOutside;
    private static int idShadowView;
    private static int idHeaderContainer;
    private static int idRecyclerView;
    private static int idFooter;
    private static int idVolumeSlider;
    private static int idVolumeLow;
    private static int idVolumeHigh;
    private static int idIcon;
    private static int idTitle;
    private static int idExtraIcon;
    private static int idCheckIcon;

    // Cached reflection handles for ViewHolder / Adapter / Lgs3 / BottomSheetBehavior without importing androidx/material
    private static volatile Field vhItemViewField;
    private static volatile boolean vhFieldLookupAttempted;
    private static volatile Class<?> cachedAdapterClass;
    private static volatile Method cachedGetItemCountMethod;
    private static volatile Method cachedGetCurrentListMethod;
    private static volatile Method cachedGetItemMethod;
    private static volatile Field cachedItemIconField;
    private static volatile boolean itemIconLookupAttempted;
    private static volatile Class<?> cachedRvClass;
    private static volatile Method cachedRvGetAdapterMethod;
    private static volatile Class<?> cachedAdapterOwnerClass;
    private static volatile Field cachedAdapterDialogField;
    private static volatile Class<?> cachedBehaviorClass;
    private static volatile Method behaviorSetSkipCollapsed;
    private static volatile Method behaviorSetDraggable;
    private static volatile Method behaviorSetHideable;
    private static volatile Method behaviorSetPeekHeight;
    private static volatile Method behaviorSetMaxWidth;
    private static volatile Method behaviorSetMaxHeight;
    private static volatile Method behaviorSetState;

    private ExpressiveBottomSheetStyler() {
    }

    /** Crisp top-rounded sheet shell with an optional 1dp top-shoulder highlight border. */
    private static final class ExpressiveSheetSurfaceDrawable extends Drawable {
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path fillPath = new Path();
        private final Path strokePath = new Path();
        private final RectF arcRect = new RectF();
        private final float radiusPx;
        private final float strokeWidthPx;

        ExpressiveSheetSurfaceDrawable(int fillColor, int strokeColor, float radiusPx, float strokeWidthPx) {
            this.radiusPx = radiusPx;
            this.strokeWidthPx = strokeWidthPx;
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(fillColor);
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setColor(strokeColor);
            strokePaint.setStrokeWidth(strokeWidthPx);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float w = b.width();
            float h = b.height();
            float r = Math.min(radiusPx, Math.min(w * 0.5f, h));

            fillPath.reset();
            arcRect.set(b.left, b.top, b.right, b.bottom);
            float[] radii = new float[]{r, r, r, r, 0f, 0f, 0f, 0f};
            fillPath.addRoundRect(arcRect, radii, Path.Direction.CW);
            canvas.drawPath(fillPath, fillPaint);

            if (Color.alpha(strokePaint.getColor()) > 0 && strokeWidthPx > 0f && r > 1f) {
                float half = strokeWidthPx * 0.5f;
                float cornerEndY = Math.min(b.bottom, b.top + half + r + r * 0.15f);
                strokePath.reset();
                strokePath.moveTo(b.left + half, cornerEndY);
                arcRect.set(b.left + half, b.top + half, b.left + half + 2f * r, b.top + half + 2f * r);
                strokePath.arcTo(arcRect, 180f, 90f, false);
                strokePath.lineTo(b.right - half - r, b.top + half);
                arcRect.set(b.right - half - 2f * r, b.top + half, b.right - half, b.top + half + 2f * r);
                strokePath.arcTo(arcRect, 270f, 90f, false);
                strokePath.lineTo(b.right - half, cornerEndY);
                canvas.drawPath(strokePath, strokePaint);
            }
        }

        @Override
        public void setAlpha(int alpha) {
            fillPaint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            fillPaint.setColorFilter(colorFilter);
            strokePaint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Centered pill drag handle drawable. */
    private static final class DragHandlePillDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF pillRect = new RectF();
        private final float pillWidthPx;
        private final float pillHeightPx;

        DragHandlePillDrawable(float pillWidthPx, float pillHeightPx, int color) {
            this.pillWidthPx = pillWidthPx;
            this.pillHeightPx = pillHeightPx;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(color);
        }

        @Override
        public int getIntrinsicWidth() {
            return Math.round(pillWidthPx);
        }

        @Override
        public int getIntrinsicHeight() {
            return Math.round(pillHeightPx);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float w = Math.min(pillWidthPx, Math.max(0f, b.width() * 0.8f));
            float h = Math.min(pillHeightPx, Math.max(2f, b.height()));
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            pillRect.set(cx - w * 0.5f, cy - h * 0.5f, cx + w * 0.5f, cy + h * 0.5f);
            float r = h * 0.5f;
            canvas.drawRoundRect(pillRect, r, r, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Crisp all-4-corners rounded M3 Expressive floating menu card with full-perimeter border. */
    private static final class ExpressiveFloatingMenuSurfaceDrawable extends Drawable {
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final float radiusPx;
        private final float strokeWidthPx;

        ExpressiveFloatingMenuSurfaceDrawable(int fillColor, int strokeColor, float radiusPx, float strokeWidthPx) {
            this.radiusPx = radiusPx;
            this.strokeWidthPx = strokeWidthPx;
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(fillColor);
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setColor(strokeColor);
            strokePaint.setStrokeWidth(strokeWidthPx);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            float r = Math.min(radiusPx, Math.min(b.width(), b.height()) * 0.5f);
            rect.set(b.left, b.top, b.right, b.bottom);
            canvas.drawRoundRect(rect, r, r, fillPaint);
            if (Color.alpha(strokePaint.getColor()) > 0 && strokeWidthPx > 0f && r > 1f) {
                float half = strokeWidthPx * 0.5f;
                rect.set(b.left + half, b.top + half, b.right - half, b.bottom - half);
                float sr = Math.max(0f, r - half);
                canvas.drawRoundRect(rect, sr, sr, strokePaint);
            }
        }

        @Override
        public void setAlpha(int alpha) {
            fillPaint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            fillPaint.setColorFilter(colorFilter);
            strokePaint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private static boolean isTrackOrPlaylistHeader(View v) {
        if (v == null) {
            return false;
        }
        String name = v.getClass().getName();
        return name.endsWith(".BottomSheetTrackHeader") || name.endsWith(".BottomSheetPlaylistHeader");
    }

    private static boolean hasTrackOrPlaylistHeader(ViewGroup headerContainer) {
        if (headerContainer == null) {
            return false;
        }
        for (int i = 0; i < headerContainer.getChildCount(); i++) {
            if (isTrackOrPlaylistHeader(headerContainer.getChildAt(i))) {
                return true;
            }
        }
        return false;
    }

    static void styleBottomSheetDialog(Dialog dialog) {
        if (dialog == null || !MaterialYouConfig.isExpressiveSheetsEnabled()) {
            return;
        }
        String clsName = dialog.getClass().getName().toLowerCase();
        if (clsName.contains("onetrust")) {
            return;
        }

        Context ctx = dialog.getContext();
        ensureIds(ctx);
        if (idDesignBottomSheet == 0) {
            return;
        }

        final View bottomSheet = dialog.findViewById(idDesignBottomSheet);
        if (bottomSheet == null) {
            return;
        }
        if (containsWebView(bottomSheet, 0)) {
            return;
        }

        float density = ctx.getResources().getDisplayMetrics().density;
        View headerView = idHeaderContainer != 0 ? bottomSheet.findViewById(idHeaderContainer) : null;
        View recyclerView = idRecyclerView != 0 ? bottomSheet.findViewById(idRecyclerView) : null;
        View shadowView = idShadowView != 0 ? bottomSheet.findViewById(idShadowView) : null;
        View footerView = idFooter != 0 ? bottomSheet.findViewById(idFooter) : null;

        if (headerView instanceof ViewGroup && recyclerView instanceof ViewGroup
                && footerView == null && hasTrackOrPlaylistHeader((ViewGroup) headerView)) {
            styleAsFloatingExpressiveMenu(
                    dialog,
                    bottomSheet,
                    (ViewGroup) headerView,
                    (ViewGroup) recyclerView,
                    shadowView,
                    ctx,
                    density
            );
            return;
        }

        float topR = dpf(density, ExpressiveSheetsBridge.getSheetCornerRadiusDp());

        Window window = dialog.getWindow();
        if (window != null) {
            window.setNavigationBarColor(Color.TRANSPARENT);
            ExpressiveBlurKit.applyWindowBackdropBlur(window, 22, 0, 0.56f, 0.42f, density);
            MaterialYouColorEngine.applySystemBarAppearance(window, MaterialYouColorEngine.isLightMode(ctx));
            View decor = window.getDecorView();
            if (decor != null && Build.VERSION.SDK_INT >= 29) {
                decor.setForceDarkAllowed(false);
            }
        }

        int surfaceContainer = MaterialYouColorEngine.getSurfaceContainer();
        int outlineBorder = MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x48);
        int handleColor = MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOnSurfaceVariant(), 0x7A);

        bottomSheet.setBackground(new ExpressiveSheetSurfaceDrawable(
                surfaceContainer,
                outlineBorder,
                topR,
                dpf(density, 1f)
        ));
        bottomSheet.setElevation(dpf(density, 12f));
        bottomSheet.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                int w = view.getWidth();
                int h = view.getHeight();
                if (w > 0 && h > 0) {
                    outline.setRoundRect(0, 0, w, h + Math.round(topR) + 4, topR);
                }
            }
        });
        bottomSheet.setClipToOutline(true);

        if (headerView instanceof ViewGroup && recyclerView instanceof ViewGroup) {
            styleContextOrBroadcastSheet(
                    dialog,
                    bottomSheet,
                    (ViewGroup) headerView,
                    (ViewGroup) recyclerView,
                    shadowView,
                    footerView,
                    density,
                    handleColor
            );
        } else {
            styleGenericBottomSheet(bottomSheet, ctx, density, handleColor);
        }
    }

    private static void styleAsFloatingExpressiveMenu(
            Dialog dialog,
            View bottomSheet,
            ViewGroup headerContainer,
            ViewGroup recyclerView,
            View shadowView,
            Context ctx,
            float density
    ) {
        if (!(bottomSheet instanceof ViewGroup) || ((ViewGroup) bottomSheet).getChildCount() == 0) {
            return;
        }
        final View contentRoot = ((ViewGroup) bottomSheet).getChildAt(0);
        if (contentRoot == null) {
            return;
        }

        // Pre-register floating menu ownership BEFORE adapter items bind asynchronously,
        // and pre-hide contentRoot BEFORE Frame 0 renders to eliminate opening flicker.
        FLOATING_MENU_DIALOGS.put(dialog, Boolean.TRUE);
        FLOATING_MENU_RECYCLERS.put(recyclerView, Boolean.TRUE);
        Object rvAdapter = extractRecyclerAdapter(recyclerView);
        if (rvAdapter != null) {
            FLOATING_MENU_ADAPTERS.put(rvAdapter, Boolean.TRUE);
        }
        DISMISSING_MENUS.remove(dialog);
        POPPED_FLOATING_MENUS.remove(contentRoot);
        contentRoot.animate().cancel();
        contentRoot.setAlpha(0f);
        contentRoot.setScaleX(0.92f);
        contentRoot.setScaleY(0.92f);

        // Guarantee Back button, gesture back, and outside tap ALWAYS dismiss immediately.
        dialog.setCancelable(true);
        dialog.setCanceledOnTouchOutside(true);
        try {
            Method setDismissAnim = findMethodSafe(dialog.getClass(), "setDismissWithAnimation", boolean.class);
            if (setDismissAnim != null) {
                setDismissAnim.invoke(dialog, false);
            }
        } catch (Throwable ignored) {
        }

        Window window = dialog.getWindow();
        if (window != null) {
            window.setWindowAnimations(0);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
            window.clearFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
            WindowManager.LayoutParams wlp = window.getAttributes();
            if (wlp != null) {
                wlp.dimAmount = 0.14f;
                if (Build.VERSION.SDK_INT >= 31) {
                    wlp.setBlurBehindRadius(0);
                }
                window.setAttributes(wlp);
                window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            }
            MaterialYouColorEngine.applySystemBarAppearance(window, MaterialYouColorEngine.isLightMode(ctx));
            View decor = window.getDecorView();
            if (decor != null && Build.VERSION.SDK_INT >= 29) {
                decor.setForceDarkAllowed(false);
            }
        }

        final View touchOutside = idTouchOutside != 0 ? dialog.findViewById(idTouchOutside) : null;
        if (touchOutside != null) {
            touchOutside.setOnClickListener(v -> dismissAnchoredMenu(dialog, contentRoot));
        }

        final int screenW = ctx.getResources().getDisplayMetrics().widthPixels;
        final int screenH = ctx.getResources().getDisplayMetrics().heightPixels;

        // Keep BottomSheetBehavior attached (Lsr3/rr3 OnGlobalLayout accesses it) with hideable=true.
        ViewGroup.LayoutParams bsLp = bottomSheet.getLayoutParams();
        if (bsLp != null) {
            bsLp.width = ViewGroup.LayoutParams.MATCH_PARENT;
            bsLp.height = ViewGroup.LayoutParams.MATCH_PARENT;
            bottomSheet.setLayoutParams(bsLp);
        }
        configureFloatingMenuBehavior(bottomSheet, screenH);
        bottomSheet.post(() -> configureFloatingMenuBehavior(bottomSheet, screenH));

        bottomSheet.setBackground(null);
        bottomSheet.setElevation(0f);
        bottomSheet.setClipToOutline(false);
        bottomSheet.setOutlineProvider(null);
        bottomSheet.setPadding(0, 0, 0, 0);
        bottomSheet.setClickable(false);
        bottomSheet.setFocusable(false);
        bottomSheet.setOnClickListener(null);
        // Replace BottomSheetDialog$4 touch-swallowing listener so outside taps ALWAYS dismiss the menu.
        bottomSheet.setOnTouchListener((v, event) -> {
            if (event == null) {
                return false;
            }
            if (Boolean.TRUE.equals(DISMISSING_MENUS.get(dialog))) {
                return true;
            }
            if (contentRoot.getWidth() > 0 && contentRoot.getHeight() > 0) {
                float ex = event.getX();
                float ey = event.getY();
                boolean outside = ex < contentRoot.getLeft() || ex > contentRoot.getRight()
                        || ey < contentRoot.getTop() || ey > contentRoot.getBottom();
                if (outside) {
                    if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                        dismissAnchoredMenu(dialog, contentRoot);
                    }
                    return true;
                }
            }
            return false;
        });

        // Turn contentRoot into a true sleek Material 3 Expressive anchored menu.
        clearOpaqueDarkBackground(contentRoot);
        final int edgePad = dp(density, 12f);
        final int menuWidth = Math.min(dp(density, 328f), Math.max(dp(density, 260f), screenW - dp(density, 24f)));
        final int[] safeInsets = new int[]{dp(density, 32f), dp(density, 32f)};
        WindowInsets rootInsets = bottomSheet.getRootWindowInsets();
        if (rootInsets == null && window != null && window.getDecorView() != null) {
            rootInsets = window.getDecorView().getRootWindowInsets();
        }
        if (rootInsets != null) {
            int topBar = rootInsets.getInsets(WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout()).top;
            int navBar = rootInsets.getInsets(WindowInsets.Type.navigationBars()).bottom;
            safeInsets[0] = topBar + dp(density, 10f);
            safeInsets[1] = navBar + dp(density, 10f);
        }

        float[] tapPt = new float[2];
        boolean hasTap = MaterialYouColorEngine.getLastTouchScreenPoint(tapPt, 1200L);
        final float anchorX = hasTap ? tapPt[0] : (screenW - dp(density, 20f));
        final float anchorY = hasTap ? tapPt[1] : (safeInsets[0] + dp(density, 44f));
        final boolean openFromRight = anchorX >= screenW * 0.45f;
        final int rawLeft = openFromRight
                ? Math.round(anchorX - menuWidth + dp(density, 12f))
                : Math.round(anchorX - dp(density, 12f));
        final int leftMargin = Math.max(edgePad, Math.min(screenW - menuWidth - edgePad, rawLeft));
        final float pivotX = Math.max(dpf(density, 16f), Math.min(menuWidth - dpf(density, 16f), anchorX - leftMargin));

        FrameLayout.LayoutParams initialLp = new FrameLayout.LayoutParams(
                menuWidth,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.LEFT
        );
        initialLp.leftMargin = leftMargin;
        initialLp.topMargin = Math.max(safeInsets[0], Math.min(screenH - safeInsets[1] - dp(density, 80f), Math.round(anchorY + dp(density, 4f))));
        initialLp.bottomMargin = safeInsets[1];
        contentRoot.setLayoutParams(initialLp);

        contentRoot.setClickable(true);
        contentRoot.setFocusable(false);
        contentRoot.setPadding(0, 0, 0, 0);

        final float menuR = dpf(density, ExpressiveSheetsBridge.getMenuCornerRadiusDp());
        int surfaceHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        boolean lightMode = MaterialYouColorEngine.isLightMode(ctx);
        int outlineBorder = MaterialYouColorEngine.withAlpha(
                MaterialYouColorEngine.getOutlineVariant(),
                lightMode ? 0x52 : 0x46
        );
        contentRoot.setBackground(new ExpressiveFloatingMenuSurfaceDrawable(
                surfaceHigh,
                outlineBorder,
                menuR,
                dpf(density, 1f)
        ));
        contentRoot.setElevation(dpf(density, 14f));
        contentRoot.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                int w = view.getWidth();
                int h = view.getHeight();
                if (w > 0 && h > 0) {
                    outline.setRoundRect(0, 0, w, h, menuR);
                }
            }
        });
        contentRoot.setClipToOutline(true);

        if (shadowView != null) {
            shadowView.setVisibility(View.GONE);
        }

        headerContainer.setBackgroundColor(Color.TRANSPARENT);
        for (int i = 0; i < headerContainer.getChildCount(); i++) {
            styleContextMenuHeader(headerContainer, headerContainer.getChildAt(i), density, true);
        }
        headerContainer.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
            @Override
            public void onChildViewAdded(View parent, View child) {
                styleContextMenuHeader(headerContainer, child, density, true);
            }

            @Override
            public void onChildViewRemoved(View parent, View child) {
            }
        });

        FLOATING_MENU_RECYCLERS.put(recyclerView, Boolean.TRUE);
        recyclerView.setBackgroundColor(Color.TRANSPARENT);
        recyclerView.setOnApplyWindowInsetsListener(null);
        recyclerView.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
        try {
            Method setClip = recyclerView.getClass().getMethod("setClipToPadding", boolean.class);
            setClip.invoke(recyclerView, false);
        } catch (Throwable ignored) {
        }
        recyclerView.setPadding(dp(density, 8f), dp(density, 6f), dp(density, 8f), dp(density, 10f));
        for (int i = 0; i < recyclerView.getChildCount(); i++) {
            ROW_STYLE_CACHE.remove(recyclerView.getChildAt(i));
        }

        final boolean[] forceReveal = new boolean[]{false};
        final Runnable repositionMenu = () -> {
            if (Boolean.TRUE.equals(DISMISSING_MENUS.get(dialog))) {
                return;
            }
            if (bottomSheet.getPaddingLeft() != 0 || bottomSheet.getPaddingTop() != 0
                    || bottomSheet.getPaddingRight() != 0 || bottomSheet.getPaddingBottom() != 0) {
                bottomSheet.setPadding(0, 0, 0, 0);
            }
            if (bottomSheet.getTop() > 0) {
                configureFloatingMenuBehavior(bottomSheet, screenH);
            }
            boolean alreadyRevealed = Boolean.TRUE.equals(POPPED_FLOATING_MENUS.get(contentRoot));
            if (!alreadyRevealed) {
                boolean ready = (recyclerView.getChildCount() > 0 && bottomSheet.getHeight() > 0) || forceReveal[0];
                if (!ready) {
                    contentRoot.setAlpha(0f);
                    return;
                }
            }

            int availScreenH = bottomSheet.getHeight() > dp(density, 200f) ? bottomSheet.getHeight() : screenH;
            int minTop = safeInsets[0];
            int maxBottom = Math.max(minTop + dp(density, 120f), availScreenH - safeInsets[1]);
            int maxMenuH = Math.min(maxBottom - minTop, Math.round(availScreenH * 0.76f));

            int wSpec = View.MeasureSpec.makeMeasureSpec(menuWidth, View.MeasureSpec.EXACTLY);
            int hSpec = View.MeasureSpec.makeMeasureSpec(maxMenuH, View.MeasureSpec.AT_MOST);
            contentRoot.measure(wSpec, hSpec);
            int measuredH = contentRoot.getMeasuredHeight();
            int desiredH = Math.max(dp(density, 56f), Math.min(maxMenuH, measuredH));

            int availBelow = maxBottom - Math.round(anchorY + dp(density, 4f));
            int availAbove = Math.round(anchorY - dp(density, 4f)) - minTop;
            boolean openDown = availBelow >= desiredH || availBelow >= availAbove;

            int desiredTop;
            float pivotY;
            if (openDown) {
                desiredTop = Math.max(minTop, Math.min(maxBottom - desiredH, Math.round(anchorY + dp(density, 4f))));
                pivotY = Math.max(0f, Math.min(desiredH, anchorY - desiredTop));
            } else {
                desiredTop = Math.max(minTop, Math.round(anchorY - dp(density, 4f)) - desiredH);
                pivotY = desiredH;
            }

            int desiredLpH = (measuredH >= maxMenuH) ? maxMenuH : ViewGroup.LayoutParams.WRAP_CONTENT;
            if (contentRoot.getLayoutParams() instanceof FrameLayout.LayoutParams) {
                FrameLayout.LayoutParams clp = (FrameLayout.LayoutParams) contentRoot.getLayoutParams();
                if (clp.width != menuWidth || clp.height != desiredLpH
                        || clp.leftMargin != leftMargin || clp.topMargin != desiredTop
                        || clp.bottomMargin != safeInsets[1]) {
                    clp.gravity = Gravity.TOP | Gravity.LEFT;
                    clp.width = menuWidth;
                    clp.height = desiredLpH;
                    clp.leftMargin = leftMargin;
                    clp.topMargin = desiredTop;
                    clp.bottomMargin = safeInsets[1];
                    contentRoot.setLayoutParams(clp);
                }
            }

            contentRoot.setPivotX(pivotX);
            contentRoot.setPivotY(pivotY);
            if (!alreadyRevealed) {
                POPPED_FLOATING_MENUS.put(contentRoot, Boolean.TRUE);
                contentRoot.animate().cancel();
                contentRoot.setAlpha(0f);
                contentRoot.setScaleX(0.92f);
                contentRoot.setScaleY(0.92f);
                contentRoot.animate()
                        .alpha(1f)
                        .scaleX(1f)
                        .scaleY(1f)
                        .setDuration(145L)
                        .setInterpolator(new DecelerateInterpolator(2.2f))
                        .start();
            }
        };

        bottomSheet.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            if (Boolean.TRUE.equals(DISMISSING_MENUS.get(dialog))) {
                return;
            }
            if (v.getPaddingLeft() != 0 || v.getPaddingTop() != 0
                    || v.getPaddingRight() != 0 || v.getPaddingBottom() != 0) {
                v.setPadding(0, 0, 0, 0);
            }
            if (t > 0) {
                configureFloatingMenuBehavior(bottomSheet, screenH);
            }
            if ((b - t) != (ob - ot)) {
                contentRoot.post(repositionMenu);
            }
        });

        contentRoot.setOnApplyWindowInsetsListener((v, insets) -> {
            if (insets != null) {
                int topBar = insets.getInsets(WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout()).top;
                int navBar = insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
                safeInsets[0] = topBar + dp(density, 10f);
                safeInsets[1] = navBar + dp(density, 10f);
                contentRoot.post(repositionMenu);
            }
            return insets;
        });
        contentRoot.requestApplyInsets();

        recyclerView.addOnLayoutChangeListener((rv, l, t, r, b, ol, ot, or, ob) -> {
            if ((b - t) != (ob - ot) || (!Boolean.TRUE.equals(POPPED_FLOATING_MENUS.get(contentRoot)) && recyclerView.getChildCount() > 0)) {
                contentRoot.post(repositionMenu);
            }
        });
        contentRoot.postDelayed(() -> {
            if (!Boolean.TRUE.equals(POPPED_FLOATING_MENUS.get(contentRoot))
                    && !Boolean.TRUE.equals(DISMISSING_MENUS.get(dialog))) {
                forceReveal[0] = true;
                repositionMenu.run();
            }
        }, 90L);
        contentRoot.post(repositionMenu);
    }

    private static void configureFloatingMenuBehavior(View bottomSheet, int screenH) {
        if (bottomSheet == null) {
            return;
        }
        try {
            ViewGroup.LayoutParams lp = bottomSheet.getLayoutParams();
            if (lp == null) {
                return;
            }
            Method getBehavior = lp.getClass().getMethod("getBehavior");
            Object behavior = getBehavior.invoke(lp);
            if (behavior == null) {
                return;
            }
            Class<?> cls = behavior.getClass();
            if (cachedBehaviorClass != cls) {
                cachedBehaviorClass = cls;
                behaviorSetSkipCollapsed = findMethodSafe(cls, "setSkipCollapsed", boolean.class);
                behaviorSetDraggable = findMethodSafe(cls, "setDraggable", boolean.class);
                behaviorSetHideable = findMethodSafe(cls, "setHideable", boolean.class);
                behaviorSetPeekHeight = findMethodSafe(cls, "setPeekHeight", int.class);
                behaviorSetMaxWidth = findMethodSafe(cls, "setMaxWidth", int.class);
                behaviorSetMaxHeight = findMethodSafe(cls, "setMaxHeight", int.class);
                behaviorSetState = findMethodSafe(cls, "setState", int.class);
            }
            if (behaviorSetSkipCollapsed != null) behaviorSetSkipCollapsed.invoke(behavior, true);
            if (behaviorSetDraggable != null) behaviorSetDraggable.invoke(behavior, false);
            if (behaviorSetHideable != null) behaviorSetHideable.invoke(behavior, true);
            if (behaviorSetMaxWidth != null) behaviorSetMaxWidth.invoke(behavior, -1);
            if (behaviorSetMaxHeight != null) behaviorSetMaxHeight.invoke(behavior, -1);
            if (behaviorSetPeekHeight != null) behaviorSetPeekHeight.invoke(behavior, screenH);
            if (behaviorSetState != null) behaviorSetState.invoke(behavior, 3);
        } catch (Throwable ignored) {
        }
    }

    private static Method findMethodSafe(Class<?> cls, String name, Class<?>... params) {
        try {
            Method m = cls.getMethod(name, params);
            m.setAccessible(true);
            return m;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void dismissAnchoredMenu(Dialog dialog, View contentRoot) {
        if (dialog == null || Boolean.TRUE.equals(DISMISSING_MENUS.get(dialog))) {
            return;
        }
        DISMISSING_MENUS.put(dialog, Boolean.TRUE);
        if (contentRoot == null) {
            safeDismissDialog(dialog);
            return;
        }
        contentRoot.animate().cancel();
        contentRoot.animate()
                .alpha(0f)
                .scaleX(0.90f)
                .scaleY(0.90f)
                .setDuration(110L)
                .setInterpolator(new DecelerateInterpolator(2f))
                .withEndAction(() -> safeDismissDialog(dialog))
                .start();
        contentRoot.postDelayed(() -> safeDismissDialog(dialog), 140L);
    }

    private static void safeDismissDialog(Dialog dialog) {
        try {
            if (dialog.isShowing()) {
                dialog.dismiss();
            }
        } catch (Throwable ignored) {
        }
    }

    private static void styleContextOrBroadcastSheet(
            Dialog dialog,
            View bottomSheet,
            ViewGroup headerContainer,
            ViewGroup recyclerView,
            View shadowView,
            View footerView,
            float density,
            int handleColor
    ) {
        if (bottomSheet instanceof ViewGroup && ((ViewGroup) bottomSheet).getChildCount() > 0) {
            View contentRoot = ((ViewGroup) bottomSheet).getChildAt(0);
            if (contentRoot != null) {
                clearOpaqueDarkBackground(contentRoot);
            }
        }

        if (shadowView != null) {
            ViewGroup.LayoutParams lp = shadowView.getLayoutParams();
            int targetH = dp(density, 24f);
            if (lp != null && lp.height != targetH) {
                lp.height = targetH;
                shadowView.setLayoutParams(lp);
            }
            shadowView.setVisibility(View.VISIBLE);
            shadowView.setBackground(new DragHandlePillDrawable(
                    dpf(density, ExpressiveSheetsBridge.getDragHandleWidthDp()),
                    dpf(density, ExpressiveSheetsBridge.getDragHandleHeightDp()),
                    handleColor
            ));
        }

        headerContainer.setBackgroundColor(Color.TRANSPARENT);
        for (int i = 0; i < headerContainer.getChildCount(); i++) {
            styleContextMenuHeader(headerContainer, headerContainer.getChildAt(i), density, false);
        }
        headerContainer.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
            @Override
            public void onChildViewAdded(View parent, View child) {
                if (footerView == null && isTrackOrPlaylistHeader(child)) {
                    styleAsFloatingExpressiveMenu(
                            dialog,
                            bottomSheet,
                            headerContainer,
                            recyclerView,
                            shadowView,
                            parent.getContext(),
                            density
                    );
                    return;
                }
                styleContextMenuHeader(headerContainer, child, density, false);
            }

            @Override
            public void onChildViewRemoved(View parent, View child) {
            }
        });

        recyclerView.setBackgroundColor(Color.TRANSPARENT);
        if (recyclerView instanceof android.view.ViewGroup) {
            try {
                Method setClip = recyclerView.getClass().getMethod("setClipToPadding", boolean.class);
                setClip.invoke(recyclerView, false);
            } catch (Throwable ignored) {
            }
        }

        final int padH = dp(density, 12f);
        final int padTop = dp(density, 4f);
        final int baseBottom = dp(density, footerView != null ? 12f : 20f);
        recyclerView.setPadding(padH, padTop, padH, baseBottom);

        if (footerView == null) {
            recyclerView.setOnApplyWindowInsetsListener((v, insets) -> {
                int navBottom = 0;
                if (insets != null) {
                    navBottom = insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
                }
                if (bottomSheet.getPaddingBottom() >= navBottom && navBottom > 0) {
                    navBottom = 0;
                }
                v.setPadding(padH, padTop, padH, baseBottom + navBottom);
                return insets;
            });
            recyclerView.requestApplyInsets();
        } else {
            styleBroadcastFooterAndItems(bottomSheet, recyclerView, footerView, density);
        }
    }

    private static void styleBroadcastFooterAndItems(
            View bottomSheet,
            ViewGroup recyclerView,
            View footerView,
            float density
    ) {
        int surfaceHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        int outline = MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x45);
        int primary = MaterialYouColorEngine.getPrimaryAccent();
        int onSurface = MaterialYouColorEngine.getOnSurface();
        int onSurfaceVar = MaterialYouColorEngine.getOnSurfaceVariant();

        GradientDrawable footerBg = new GradientDrawable();
        footerBg.setShape(GradientDrawable.RECTANGLE);
        footerBg.setCornerRadius(dpf(density, 20f));
        footerBg.setColor(surfaceHigh);
        footerBg.setStroke(Math.max(1, dp(density, 1f)), outline);
        footerView.setBackground(footerBg);

        if (footerView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) footerView.getLayoutParams();
            int mh = dp(density, 12f);
            mlp.setMargins(mh, dp(density, 8f), mh, dp(density, 14f));
            footerView.setLayoutParams(mlp);
        }

        if (footerView instanceof ViewGroup) {
            ViewGroup fg = (ViewGroup) footerView;
            for (int i = 0; i < fg.getChildCount(); i++) {
                View c = fg.getChildAt(i);
                if (c.getClass() == View.class && c.getLayoutParams() != null
                        && c.getLayoutParams().height > 0 && c.getLayoutParams().height <= dp(density, 2f)) {
                    c.setVisibility(View.GONE);
                }
            }
        }

        View low = idVolumeLow != 0 ? bottomSheet.findViewById(idVolumeLow) : null;
        if (low instanceof ImageView) {
            ((ImageView) low).setImageTintList(ColorStateList.valueOf(onSurfaceVar));
        }
        View high = idVolumeHigh != 0 ? bottomSheet.findViewById(idVolumeHigh) : null;
        if (high instanceof ImageView) {
            ((ImageView) high).setImageTintList(ColorStateList.valueOf(onSurfaceVar));
        }
        View slider = idVolumeSlider != 0 ? bottomSheet.findViewById(idVolumeSlider) : null;
        if (slider instanceof SeekBar) {
            SeekBar sb = (SeekBar) slider;
            sb.setProgressTintList(ColorStateList.valueOf(primary));
            sb.setThumbTintList(ColorStateList.valueOf(primary));
            sb.setProgressBackgroundTintList(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x55))
            );
        }

        for (int i = 0; i < recyclerView.getChildCount(); i++) {
            styleBroadcastRow(recyclerView.getChildAt(i), density, surfaceHigh, outline, primary, onSurface, onSurfaceVar);
        }
        recyclerView.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
            @Override
            public void onChildViewAdded(View parent, View child) {
                styleBroadcastRow(child, density, surfaceHigh, outline, primary, onSurface, onSurfaceVar);
            }

            @Override
            public void onChildViewRemoved(View parent, View child) {
            }
        });
    }

    private static void styleBroadcastRow(
            View row,
            float density,
            int surfaceHigh,
            int outline,
            int primary,
            int onSurface,
            int onSurfaceVar
    ) {
        if (row == null) {
            return;
        }
        GradientDrawable card = new GradientDrawable();
        card.setShape(GradientDrawable.RECTANGLE);
        card.setCornerRadius(dpf(density, 18f));
        card.setColor(surfaceHigh);
        card.setStroke(Math.max(1, dp(density, 1f)), outline);
        row.setBackground(card);
        if (row.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) row.getLayoutParams();
            mlp.bottomMargin = dp(density, 6f);
            row.setLayoutParams(mlp);
        }
        if (row instanceof ViewGroup) {
            List<TextView> tvs = new ArrayList<>();
            collectViews((ViewGroup) row, tvs, null);
            int idx = 0;
            for (TextView tv : tvs) {
                if (tv instanceof Button) {
                    tv.setTextColor(primary);
                } else {
                    tv.setTextColor(idx == 0 ? onSurface : onSurfaceVar);
                    idx++;
                }
            }
        }
    }

    private static void styleGenericBottomSheet(View bottomSheet, Context ctx, float density, int handleColor) {
        if (!(bottomSheet instanceof ViewGroup)) {
            return;
        }
        upgradeDragHandlesAndClearOpaque((ViewGroup) bottomSheet, ctx, density, handleColor, 0);
    }

    private static void upgradeDragHandlesAndClearOpaque(
            ViewGroup group,
            Context ctx,
            float density,
            int handleColor,
            int depth
    ) {
        if (depth > 3 || group.getClass().getName().contains("AndroidComposeView")) {
            return;
        }
        clearOpaqueDarkBackground(group);
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof ImageView) {
                ImageView iv = (ImageView) child;
                if (isDragHandleImageView(iv, ctx, density)) {
                    ViewGroup.LayoutParams lp = iv.getLayoutParams();
                    int w = dp(density, ExpressiveSheetsBridge.getDragHandleWidthDp());
                    int h = dp(density, ExpressiveSheetsBridge.getDragHandleHeightDp());
                    if (lp != null && (lp.width != w || lp.height != h)) {
                        lp.width = w;
                        lp.height = h;
                        iv.setLayoutParams(lp);
                    }
                    iv.setImageTintList(null);
                    iv.setImageDrawable(new DragHandlePillDrawable(w, h, handleColor));
                }
            } else if (child instanceof ViewGroup) {
                upgradeDragHandlesAndClearOpaque((ViewGroup) child, ctx, density, handleColor, depth + 1);
            }
        }
    }

    private static boolean isDragHandleImageView(ImageView iv, Context ctx, float density) {
        int id = iv.getId();
        if (id != View.NO_ID && id != 0) {
            try {
                String entry = ctx.getResources().getResourceEntryName(id).toLowerCase();
                if (entry.contains("handl") || entry.contains("drag")) {
                    return true;
                }
            } catch (Throwable ignored) {
            }
        }
        Drawable d = iv.getDrawable();
        if (d != null) {
            int iw = d.getIntrinsicWidth();
            int ih = d.getIntrinsicHeight();
            if (iw >= dp(density, 20f) && iw <= dp(density, 64f)
                    && ih > 0 && ih <= dp(density, 10f)) {
                return true;
            }
        }
        return false;
    }

    private static void styleContextMenuHeader(
            ViewGroup headerContainer,
            View headerChild,
            float density,
            boolean inFloatingMenu
    ) {
        if (headerChild == null) {
            return;
        }
        clearOpaqueDarkBackground(headerChild);

        int surfaceHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        int outline = MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), inFloatingMenu ? 0x38 : 0x45);
        int onSurface = MaterialYouColorEngine.getOnSurface();
        int onSurfaceVar = MaterialYouColorEngine.getOnSurfaceVariant();

        List<TextView> textViews = new ArrayList<>();
        List<ImageView> imageViews = new ArrayList<>();
        View cardView = null;
        if (headerChild instanceof ViewGroup) {
            ViewGroup hg = (ViewGroup) headerChild;
            for (int i = 0; i < hg.getChildCount(); i++) {
                View child = hg.getChildAt(i);
                if (child.getClass() == View.class && child.getLayoutParams() != null
                        && child.getLayoutParams().height > 0 && child.getLayoutParams().height <= dp(density, 2f)) {
                    if (inFloatingMenu) {
                        child.setVisibility(View.VISIBLE);
                        child.setBackgroundColor(outline);
                    } else {
                        child.setVisibility(View.GONE);
                    }
                }
                if (child.getClass().getName().contains("CardView")) {
                    cardView = child;
                }
            }
            collectViews(hg, textViews, imageViews);
        }

        boolean hasArtwork = false;
        float artCorner = dpf(density, inFloatingMenu ? 12f : 14f);
        for (ImageView iv : imageViews) {
            ExpressiveMediaStyleKit.setShapeableImageCornerRadiusIfSquare(iv, artCorner, density);
            ViewGroup.LayoutParams lp = iv.getLayoutParams();
            int w = lp != null ? lp.width : iv.getWidth();
            if (w >= dp(density, 32f) || w == ViewGroup.LayoutParams.WRAP_CONTENT) {
                hasArtwork = true;
                if (inFloatingMenu && lp != null) {
                    int compactArt = dp(density, 48f);
                    if (lp.width != compactArt || lp.height != compactArt) {
                        lp.width = compactArt;
                        lp.height = compactArt;
                        if (lp instanceof ViewGroup.MarginLayoutParams) {
                            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
                            mlp.setMarginStart(dp(density, 14f));
                            mlp.leftMargin = dp(density, 14f);
                        }
                        iv.setLayoutParams(lp);
                    }
                }
            }
        }

        if (inFloatingMenu) {
            headerContainer.setPadding(0, dp(density, 4f), 0, 0);
            headerChild.setBackgroundColor(Color.TRANSPARENT);
            headerChild.setClipToOutline(false);
            headerChild.setPadding(0, 0, dp(density, 14f), 0);
            ViewGroup.LayoutParams hlp = headerChild.getLayoutParams();
            if (hlp != null) {
                int compactH = dp(density, 72f);
                if (hlp.height != compactH) {
                    hlp.height = compactH;
                    headerChild.setLayoutParams(hlp);
                }
            }
        } else {
            if (cardView != null) {
                hasArtwork = true;
                ExpressiveMediaStyleKit.setCardViewRadius(cardView, dpf(density, 20f));
                GradientDrawable cardBgDrawable = new GradientDrawable();
                cardBgDrawable.setShape(GradientDrawable.RECTANGLE);
                cardBgDrawable.setCornerRadius(dpf(density, 20f));
                cardBgDrawable.setColor(surfaceHigh);
                cardBgDrawable.setStroke(Math.max(1, dp(density, 1f)), outline);
                cardView.setBackground(cardBgDrawable);
            }

            if (hasArtwork) {
                headerContainer.setPadding(dp(density, 12f), dp(density, 2f), dp(density, 12f), dp(density, 10f));
                if (cardView == null) {
                    float cardCorner = dpf(density, 20f);
                    GradientDrawable headerCard = new GradientDrawable();
                    headerCard.setShape(GradientDrawable.RECTANGLE);
                    headerCard.setCornerRadius(cardCorner);
                    headerCard.setColor(surfaceHigh);
                    headerCard.setStroke(Math.max(1, dp(density, 1f)), outline);
                    headerChild.setBackground(headerCard);
                    headerChild.setClipToOutline(true);
                    headerChild.setPadding(
                            headerChild.getPaddingLeft(),
                            Math.max(headerChild.getPaddingTop(), dp(density, 8f)),
                            Math.max(headerChild.getPaddingRight(), dp(density, 12f)),
                            Math.max(headerChild.getPaddingBottom(), dp(density, 8f))
                    );
                }
            } else {
                headerContainer.setPadding(dp(density, 16f), dp(density, 4f), dp(density, 16f), dp(density, 8f));
                headerChild.setBackgroundColor(Color.TRANSPARENT);
            }
        }

        for (int i = 0; i < textViews.size(); i++) {
            TextView tv = textViews.get(i);
            if (inFloatingMenu) {
                tv.setIncludeFontPadding(false);
            }
            if (i == 0) {
                tv.setTextColor(onSurface);
                if (!hasArtwork) {
                    tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
                } else if (inFloatingMenu) {
                    tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16.5f);
                }
                tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            } else {
                tv.setTextColor(onSurfaceVar);
                if (inFloatingMenu) {
                    tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
                }
            }
        }
    }

    static void styleContextMenuRow(Object adapter, Object viewHolder, int position) {
        if (!MaterialYouConfig.isExpressiveSheetsEnabled() || adapter == null || viewHolder == null) {
            return;
        }
        View itemView = extractItemView(viewHolder);
        if (itemView == null) {
            return;
        }
        int itemCount = getAdapterItemCount(adapter);
        Context ctx = itemView.getContext();
        ensureIds(ctx);
        float density = ctx.getResources().getDisplayMetrics().density;

        boolean inFloatingMenu = Boolean.TRUE.equals(FLOATING_MENU_ADAPTERS.get(adapter))
                || (itemView.getParent() instanceof View
                    && Boolean.TRUE.equals(FLOATING_MENU_RECYCLERS.get((View) itemView.getParent())))
                || isAdapterOwnedByFloatingDialog(adapter);

        ImageView iconIv = idIcon != 0 ? itemView.findViewById(idIcon) : null;
        TextView titleTv = idTitle != 0 ? itemView.findViewById(idTitle) : null;
        ImageView extraIv = idExtraIcon != 0 ? itemView.findViewById(idExtraIcon) : null;
        ImageView checkIv = idCheckIcon != 0 ? itemView.findViewById(idCheckIcon) : null;

        Object boundItem = extractAdapterItem(adapter, position);
        boolean isCrossfadeItem = boundItem != null
                && boundItem.getClass().getName().endsWith("CrossfadeContextMenuItemAdapter");
        int iconResId = extractItemIconResId(boundItem);
        String drawableName = resolveResourceEntryName(ctx, iconResId);
        String titleText = titleTv != null && titleTv.getText() != null ? titleTv.getText().toString() : null;

        boolean grouped = !inFloatingMenu && MaterialYouConfig.isGroupedContextMenuCardsEnabled();
        boolean selected = itemView.isSelected();
        boolean accentActive = selected || ExpressiveContextMenuIcons.isAccentFilledDrawableName(drawableName);
        boolean destructive = ExpressiveContextMenuIcons.isDestructiveDrawableName(drawableName)
                || isDestructiveTextOrIcon(titleTv, iconIv);
        boolean disabled = !destructive && isDisabledMutedText(titleTv);
        boolean iconVisible = iconIv != null && iconIv.getVisibility() == View.VISIBLE;

        if (inFloatingMenu) {
            if (Boolean.TRUE.equals(TOUCH_EFFECT_ROWS.get(itemView))) {
                TOUCH_EFFECT_ROWS.remove(itemView);
                itemView.setOnTouchListener(null);
            }
        } else if (!Boolean.TRUE.equals(TOUCH_EFFECT_ROWS.get(itemView))) {
            TOUCH_EFFECT_ROWS.put(itemView, Boolean.TRUE);
            ExpressiveMediaStyleKit.attachSpringPressEffect(itemView);
        }

        int role;
        if (!grouped || itemCount <= 1) {
            role = ROLE_SINGLE;
        } else if (position <= 0) {
            role = ROLE_FIRST;
        } else if (position >= itemCount - 1) {
            role = ROLE_LAST;
        } else {
            role = ROLE_MIDDLE;
        }

        int surfaceHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        int surfaceHighest = MaterialYouColorEngine.getSurfaceContainerHighest();
        int primary = MaterialYouColorEngine.getPrimaryAccent();
        int primaryCtr = MaterialYouColorEngine.getPrimaryContainer();
        int onPrimaryCtr = MaterialYouColorEngine.getOnPrimaryContainer();
        int onSurface = MaterialYouColorEngine.getOnSurface();
        int onSurfaceVar = MaterialYouColorEngine.getOnSurfaceVariant();
        int outlineVar = MaterialYouColorEngine.getOutlineVariant();
        boolean lightMode = MaterialYouColorEngine.isLightMode(ctx);
        int destructiveFg = lightMode ? 0xFFB3261E : 0xFFE8A29E;

        int styleKey = (role & 0x3)
                | (grouped ? 0x4 : 0)
                | (selected ? 0x8 : 0)
                | (destructive ? 0x10 : 0)
                | (disabled ? 0x20 : 0)
                | (lightMode ? 0x40 : 0)
                | (inFloatingMenu ? 0x80 : 0)
                | (accentActive ? 0x100 : 0)
                | ((primary & 0x3FFFFF) << 9);

        float outerR = dpf(density, inFloatingMenu ? 14f : (grouped ? 20f : 16f));
        float innerR = dpf(density, grouped ? 6f : (inFloatingMenu ? 14f : 16f));
        float topR = (role == ROLE_SINGLE || role == ROLE_FIRST) ? outerR : innerR;
        float botR = (role == ROLE_SINGLE || role == ROLE_LAST) ? outerR : innerR;
        float[] radii = new float[]{topR, topR, topR, topR, botR, botR, botR, botR};

        int targetHeight = dp(density, inFloatingMenu ? 52f : (grouped ? 58f : 56f));
        int targetBottomMargin = inFloatingMenu
                ? dp(density, 2f)
                : ((!grouped)
                ? dp(density, 2f)
                : ((role == ROLE_LAST || role == ROLE_SINGLE) ? 0 : dp(density, 3f)));

        ViewGroup.LayoutParams rawLp = itemView.getLayoutParams();
        if (rawLp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) rawLp;
            if (mlp.height != targetHeight || mlp.bottomMargin != targetBottomMargin) {
                mlp.height = targetHeight;
                mlp.bottomMargin = targetBottomMargin;
                itemView.setLayoutParams(mlp);
            }
        } else if (rawLp != null && rawLp.height != targetHeight) {
            rawLp.height = targetHeight;
            itemView.setLayoutParams(rawLp);
        }

        Integer prevKey = ROW_STYLE_CACHE.get(itemView);
        if (prevKey == null || prevKey != styleKey) {
            ROW_STYLE_CACHE.put(itemView, styleKey);

            int fillColor;
            int strokeColor;
            if (grouped) {
                if (selected) {
                    fillColor = MaterialYouColorEngine.blendRgb(surfaceHigh, primary, 0.22f);
                    strokeColor = MaterialYouColorEngine.withAlpha(primary, 0x66);
                } else {
                    fillColor = surfaceHigh;
                    strokeColor = MaterialYouColorEngine.withAlpha(outlineVar, 0x26);
                }
            } else {
                fillColor = selected
                        ? MaterialYouColorEngine.blendRgb(surfaceHigh, primary, 0.22f)
                        : Color.TRANSPARENT;
                strokeColor = (selected && !inFloatingMenu)
                        ? MaterialYouColorEngine.withAlpha(primary, 0x45)
                        : Color.TRANSPARENT;
            }

            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.RECTANGLE);
            bg.setCornerRadii(radii);
            bg.setColor(fillColor);
            if (Color.alpha(strokeColor) > 0) {
                bg.setStroke(Math.max(1, dp(density, 1f)), strokeColor);
            }
            itemView.setBackground(bg);

            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadii(radii);
            mask.setColor(0xFFFFFFFF);
            int rippleTint = destructive
                    ? MaterialYouColorEngine.withAlpha(destructiveFg, inFloatingMenu ? 0x20 : (lightMode ? 0x22 : 0x28))
                    : MaterialYouColorEngine.withAlpha(primary, inFloatingMenu ? 0x26 : 0x2C);
            itemView.setForeground(new RippleDrawable(ColorStateList.valueOf(rippleTint), null, mask));
        }
        itemView.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);

        if (iconIv != null) {
            if (iconVisible) {
                Drawable expressiveIcon = ExpressiveContextMenuIcons.createIcon(
                        density, drawableName, titleText, isCrossfadeItem);
                if (expressiveIcon != null) {
                    iconIv.setImageDrawable(expressiveIcon);
                    iconIv.setScaleType(ImageView.ScaleType.FIT_CENTER);
                } else {
                    iconIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                }

                if (inFloatingMenu) {
                    int iconSize = dp(density, 23f);
                    int iconMarginStart = dp(density, 14f);
                    if (iconIv.getPaddingLeft() != 0 || iconIv.getPaddingTop() != 0) {
                        iconIv.setPadding(0, 0, 0, 0);
                    }
                    ViewGroup.LayoutParams ilp = iconIv.getLayoutParams();
                    if (ilp instanceof ViewGroup.MarginLayoutParams) {
                        ViewGroup.MarginLayoutParams imlp = (ViewGroup.MarginLayoutParams) ilp;
                        if (imlp.width != iconSize || imlp.height != iconSize
                                || imlp.getMarginStart() != iconMarginStart) {
                            imlp.width = iconSize;
                            imlp.height = iconSize;
                            imlp.setMarginStart(iconMarginStart);
                            iconIv.setLayoutParams(imlp);
                        }
                    }
                    iconIv.setBackground(null);

                    int iconTint;
                    if (disabled) {
                        iconTint = MaterialYouColorEngine.withAlpha(onSurfaceVar, 0x66);
                    } else if (destructive) {
                        iconTint = destructiveFg;
                    } else if (accentActive) {
                        iconTint = primary;
                    } else {
                        iconTint = onSurface;
                    }
                    iconIv.clearColorFilter();
                    iconIv.setImageTintList(ColorStateList.valueOf(iconTint));
                } else {
                    int badgeSize = dp(density, 38f);
                    int iconMarginStart = dp(density, 12f);
                    int pad = dp(density, 7.5f);
                    if (iconIv.getPaddingLeft() != pad || iconIv.getPaddingTop() != pad) {
                        iconIv.setPadding(pad, pad, pad, pad);
                    }
                    ViewGroup.LayoutParams ilp = iconIv.getLayoutParams();
                    if (ilp instanceof ViewGroup.MarginLayoutParams) {
                        ViewGroup.MarginLayoutParams imlp = (ViewGroup.MarginLayoutParams) ilp;
                        if (imlp.width != badgeSize || imlp.height != badgeSize
                                || imlp.getMarginStart() != iconMarginStart) {
                            imlp.width = badgeSize;
                            imlp.height = badgeSize;
                            imlp.setMarginStart(iconMarginStart);
                            iconIv.setLayoutParams(imlp);
                        }
                    }
                    GradientDrawable badge = new GradientDrawable();
                    badge.setShape(GradientDrawable.RECTANGLE);
                    badge.setCornerRadius(dpf(density, 13f));
                    if (accentActive) {
                        badge.setColor(primaryCtr);
                    } else if (destructive) {
                        badge.setColor(lightMode ? 0x16B3261E : 0x22E8A29E);
                    } else {
                        badge.setColor(MaterialYouColorEngine.blendRgb(
                                surfaceHighest,
                                primary,
                                lightMode ? 0.08f : 0.12f
                        ));
                        badge.setStroke(Math.max(1, dp(density, 1f)),
                                MaterialYouColorEngine.withAlpha(outlineVar, 0x32));
                    }
                    iconIv.setBackground(badge);

                    int iconTint;
                    if (disabled) {
                        iconTint = MaterialYouColorEngine.withAlpha(onSurfaceVar, 0x66);
                    } else if (destructive) {
                        iconTint = destructiveFg;
                    } else if (accentActive) {
                        iconTint = onPrimaryCtr;
                    } else {
                        iconTint = onSurface;
                    }
                    iconIv.clearColorFilter();
                    iconIv.setImageTintList(ColorStateList.valueOf(iconTint));
                }
                iconIv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
            } else {
                iconIv.setBackground(null);
            }
        }

        if (titleTv != null) {
            int titleColor;
            if (disabled) {
                titleColor = MaterialYouColorEngine.withAlpha(onSurfaceVar, 0x66);
            } else if (destructive) {
                titleColor = destructiveFg;
            } else if (selected) {
                titleColor = primary;
            } else {
                titleColor = onSurface;
            }
            titleTv.setTextColor(titleColor);
            titleTv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
            titleTv.setTypeface(Typeface.create("sans-serif-medium", selected ? Typeface.BOLD : Typeface.NORMAL));

            int desiredMarginStart = dp(density, inFloatingMenu ? (iconVisible ? 50f : 16f) : (iconVisible ? 62f : 16f));
            ViewGroup.LayoutParams tlp = titleTv.getLayoutParams();
            if (tlp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams tmlp = (ViewGroup.MarginLayoutParams) tlp;
                if (tmlp.getMarginStart() != desiredMarginStart) {
                    tmlp.setMarginStart(desiredMarginStart);
                    titleTv.setLayoutParams(tmlp);
                }
            }
        }

        if (checkIv != null) {
            checkIv.setImageTintList(ColorStateList.valueOf(primary));
            ViewGroup.LayoutParams clp = checkIv.getLayoutParams();
            int endMargin = dp(density, 16f);
            if (clp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams cmlp = (ViewGroup.MarginLayoutParams) clp;
                if (cmlp.getMarginEnd() != endMargin) {
                    cmlp.setMarginEnd(endMargin);
                    checkIv.setLayoutParams(cmlp);
                }
            }
        }

        if (extraIv != null && extraIv.getVisibility() == View.VISIBLE) {
            int extraTint = disabled
                    ? MaterialYouColorEngine.withAlpha(onSurfaceVar, 0x55)
                    : MaterialYouColorEngine.withAlpha(onSurfaceVar, 0xCC);
            extraIv.setImageTintList(ColorStateList.valueOf(extraTint));
        }
    }

    private static boolean isDestructiveTextOrIcon(TextView tv, ImageView iv) {
        if (tv != null && isRedColor(tv.getCurrentTextColor())) {
            return true;
        }
        return iv != null && iv.getImageTintList() != null
                && isRedColor(iv.getImageTintList().getDefaultColor());
    }

    private static boolean isRedColor(int argb) {
        int a = Color.alpha(argb);
        if (a < 100) {
            return false;
        }
        int r = Color.red(argb);
        int g = Color.green(argb);
        int b = Color.blue(argb);
        return r >= 180 && (r - g) >= 55 && (r - b) >= 55;
    }

    private static boolean isDisabledMutedText(TextView tv) {
        if (tv == null) {
            return false;
        }
        if (!tv.isEnabled()) {
            return true;
        }
        int c = tv.getCurrentTextColor();
        int a = Color.alpha(c);
        if (a > 0 && a < 170) {
            return true;
        }
        // Fallback if textColor came from a dark muted resource (e.g. glass_darken_20 ~ #4d... or ~0x80...)
        int luma = (Color.red(c) * 30 + Color.green(c) * 59 + Color.blue(c) * 11) / 100;
        return luma < 145 && Color.alpha(c) == 255;
    }

    private static void clearOpaqueDarkBackground(View v) {
        if (v == null) {
            return;
        }
        Drawable bg = v.getBackground();
        if (bg instanceof ColorDrawable) {
            int c = ((ColorDrawable) bg).getColor();
            if ((c >>> 24) > 0 && isDarkNeutral(c)) {
                v.setBackgroundColor(Color.TRANSPARENT);
            }
        }
    }

    private static boolean isDarkNeutral(int argb) {
        int r = Color.red(argb);
        int g = Color.green(argb);
        int b = Color.blue(argb);
        return r <= 48 && g <= 48 && b <= 54 && Math.abs(r - b) <= 12;
    }

    private static boolean containsWebView(View v, int depth) {
        if (v instanceof WebView) {
            return true;
        }
        if (depth >= 4 || !(v instanceof ViewGroup)) {
            return false;
        }
        ViewGroup vg = (ViewGroup) v;
        for (int i = 0; i < vg.getChildCount(); i++) {
            if (containsWebView(vg.getChildAt(i), depth + 1)) {
                return true;
            }
        }
        return false;
    }

    private static void collectViews(ViewGroup root, List<TextView> textOut, List<ImageView> imageOut) {
        for (int i = 0; i < root.getChildCount(); i++) {
            View child = root.getChildAt(i);
            if (textOut != null && child instanceof TextView) {
                textOut.add((TextView) child);
            } else if (imageOut != null && child instanceof ImageView) {
                imageOut.add((ImageView) child);
            } else if (child instanceof ViewGroup) {
                collectViews((ViewGroup) child, textOut, imageOut);
            }
        }
    }

    private static Object extractRecyclerAdapter(View recyclerView) {
        if (recyclerView == null) {
            return null;
        }
        try {
            Class<?> cls = recyclerView.getClass();
            if (cachedRvClass != cls) {
                cachedRvGetAdapterMethod = findMethodSafe(cls, "getAdapter");
                cachedRvClass = cls;
            }
            if (cachedRvGetAdapterMethod != null) {
                return cachedRvGetAdapterMethod.invoke(recyclerView);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean isAdapterOwnedByFloatingDialog(Object adapter) {
        if (adapter == null) {
            return false;
        }
        try {
            Class<?> cls = adapter.getClass();
            if (cachedAdapterOwnerClass != cls) {
                Field found = null;
                Class<?> cur = cls;
                while (cur != null && cur != Object.class && found == null) {
                    for (Field f : cur.getDeclaredFields()) {
                        if (Dialog.class.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            found = f;
                            break;
                        }
                    }
                    cur = cur.getSuperclass();
                }
                cachedAdapterDialogField = found;
                cachedAdapterOwnerClass = cls;
            }
            Field f = cachedAdapterDialogField;
            if (f != null && f.getDeclaringClass().isAssignableFrom(cls)) {
                Object owner = f.get(adapter);
                return owner instanceof Dialog && Boolean.TRUE.equals(FLOATING_MENU_DIALOGS.get((Dialog) owner));
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static View extractItemView(Object viewHolder) {
        try {
            if (!vhFieldLookupAttempted) {
                vhFieldLookupAttempted = true;
                Class<?> c = viewHolder.getClass();
                while (c != null && c != Object.class) {
                    try {
                        Field f = c.getDeclaredField("itemView");
                        f.setAccessible(true);
                        vhItemViewField = f;
                        break;
                    } catch (NoSuchFieldException ignored) {
                        c = c.getSuperclass();
                    }
                }
            }
            if (vhItemViewField != null) {
                Object val = vhItemViewField.get(viewHolder);
                if (val instanceof View) {
                    return (View) val;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static int getAdapterItemCount(Object adapter) {
        try {
            Class<?> cls = adapter.getClass();
            ensureAdapterReflection(cls);
            if (cachedGetItemCountMethod != null) {
                Object res = cachedGetItemCountMethod.invoke(adapter);
                if (res instanceof Integer) {
                    return (Integer) res;
                }
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private static void ensureAdapterReflection(Class<?> cls) {
        if (cachedAdapterClass == cls) {
            return;
        }
        try {
            Method countM = findMethodSafe(cls, "getItemCount");
            Method listM = findMethodSafe(cls, "getCurrentList");
            Method getItemM = null;
            Class<?> cur = cls;
            while (cur != null && cur != Object.class && getItemM == null) {
                try {
                    getItemM = cur.getDeclaredMethod("getItem", int.class);
                    getItemM.setAccessible(true);
                } catch (NoSuchMethodException ignored) {
                    cur = cur.getSuperclass();
                }
            }
            cachedGetItemCountMethod = countM;
            cachedGetCurrentListMethod = listM;
            cachedGetItemMethod = getItemM;
            cachedAdapterClass = cls;
        } catch (Throwable ignored) {
        }
    }

    private static Object extractAdapterItem(Object adapter, int position) {
        if (adapter == null || position < 0) {
            return null;
        }
        try {
            ensureAdapterReflection(adapter.getClass());
            if (cachedGetCurrentListMethod != null) {
                Object listObj = cachedGetCurrentListMethod.invoke(adapter);
                if (listObj instanceof List<?>) {
                    List<?> list = (List<?>) listObj;
                    if (position < list.size()) {
                        return list.get(position);
                    }
                }
            }
            if (cachedGetItemMethod != null) {
                return cachedGetItemMethod.invoke(adapter, position);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static int extractItemIconResId(Object item) {
        if (item == null) {
            return 0;
        }
        try {
            Class<?> cls = item.getClass();
            if (!itemIconLookupAttempted || (cachedItemIconField != null && !cachedItemIconField.getDeclaringClass().isAssignableFrom(cls))) {
                itemIconLookupAttempted = true;
                Field found = null;
                Class<?> cur = cls;
                while (cur != null && cur != Object.class) {
                    try {
                        Field f = cur.getDeclaredField("b");
                        if (f.getType() == int.class) {
                            f.setAccessible(true);
                            found = f;
                            break;
                        }
                    } catch (NoSuchFieldException ignored) {
                    }
                    cur = cur.getSuperclass();
                }
                cachedItemIconField = found;
            }
            if (cachedItemIconField != null && cachedItemIconField.getDeclaringClass().isAssignableFrom(cls)) {
                return cachedItemIconField.getInt(item);
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private static String resolveResourceEntryName(Context ctx, int resId) {
        if (ctx == null || resId == 0) {
            return null;
        }
        String cached = DRAWABLE_NAME_CACHE.get(resId);
        if (cached != null) {
            return cached.isEmpty() ? null : cached;
        }
        try {
            String name = ctx.getResources().getResourceEntryName(resId);
            DRAWABLE_NAME_CACHE.put(resId, name != null ? name : "");
            return name;
        } catch (Throwable ignored) {
            DRAWABLE_NAME_CACHE.put(resId, "");
            return null;
        }
    }

    private static void ensureIds(Context ctx) {
        if (ctx == null) {
            return;
        }
        String pkg = ctx.getPackageName();
        Resources res = ctx.getResources();
        if (res == null || pkg == null) {
            return;
        }
        if (pkg.equals(cachedPackageName) && idDesignBottomSheet != 0) {
            return;
        }
        cachedPackageName = pkg;
        idDesignBottomSheet = res.getIdentifier("design_bottom_sheet", "id", pkg);
        idTouchOutside = res.getIdentifier("touch_outside", "id", pkg);
        idShadowView = res.getIdentifier("shadowView", "id", pkg);
        idHeaderContainer = res.getIdentifier("headerContainer", "id", pkg);
        idRecyclerView = res.getIdentifier("recyclerView", "id", pkg);
        idFooter = res.getIdentifier("footer", "id", pkg);
        idVolumeSlider = res.getIdentifier("volumeSlider", "id", pkg);
        idVolumeLow = res.getIdentifier("volumeLow", "id", pkg);
        idVolumeHigh = res.getIdentifier("volumeHigh", "id", pkg);
        idIcon = res.getIdentifier("icon", "id", pkg);
        idTitle = res.getIdentifier("title", "id", pkg);
        idExtraIcon = res.getIdentifier("extraIcon", "id", pkg);
        idCheckIcon = res.getIdentifier("checkIcon", "id", pkg);
    }

    private static int dp(float density, float val) {
        return Math.round(val * density);
    }

    private static float dpf(float density, float val) {
        return val * density;
    }
}
