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
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowInsets;
import android.webkit.WebView;
import android.widget.Button;
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

    // Cached view/adapter IDs
    private static String cachedPackageName;
    private static int idDesignBottomSheet;
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

    // Cached reflection handles for ViewHolder / Adapter without importing androidx.*
    private static volatile Field vhItemViewField;
    private static volatile boolean vhFieldLookupAttempted;
    private static volatile Class<?> cachedAdapterClass;
    private static volatile Method cachedGetItemCountMethod;

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

        View headerView = idHeaderContainer != 0 ? bottomSheet.findViewById(idHeaderContainer) : null;
        View recyclerView = idRecyclerView != 0 ? bottomSheet.findViewById(idRecyclerView) : null;
        View shadowView = idShadowView != 0 ? bottomSheet.findViewById(idShadowView) : null;
        View footerView = idFooter != 0 ? bottomSheet.findViewById(idFooter) : null;

        if (headerView instanceof ViewGroup && recyclerView instanceof ViewGroup) {
            styleContextOrBroadcastSheet(
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

    private static void styleContextOrBroadcastSheet(
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
            styleContextMenuHeader(headerContainer, headerContainer.getChildAt(i), density);
        }
        headerContainer.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
            @Override
            public void onChildViewAdded(View parent, View child) {
                styleContextMenuHeader(headerContainer, child, density);
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

    private static void styleContextMenuHeader(ViewGroup headerContainer, View headerChild, float density) {
        if (headerChild == null) {
            return;
        }
        clearOpaqueDarkBackground(headerChild);

        int surfaceHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        int outline = MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x45);
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
                    child.setVisibility(View.GONE);
                }
                if (child.getClass().getName().contains("CardView")) {
                    cardView = child;
                }
            }
            collectViews(hg, textViews, imageViews);
        }

        boolean hasArtwork = false;
        for (ImageView iv : imageViews) {
            ExpressiveMediaStyleKit.setShapeableImageCornerRadiusIfSquare(iv, dpf(density, 14f), density);
            ViewGroup.LayoutParams lp = iv.getLayoutParams();
            int w = lp != null ? lp.width : iv.getWidth();
            if (w >= dp(density, 32f) || w == ViewGroup.LayoutParams.WRAP_CONTENT) {
                hasArtwork = true;
            }
        }

        if (cardView != null) {
            hasArtwork = true;
            ExpressiveMediaStyleKit.setCardViewRadius(cardView, dpf(density, 20f));
            GradientDrawable cardBg = new GradientDrawable();
            cardBg.setShape(GradientDrawable.RECTANGLE);
            cardBg.setCornerRadius(dpf(density, 20f));
            cardBg.setColor(surfaceHigh);
            cardBg.setStroke(Math.max(1, dp(density, 1f)), outline);
            cardView.setBackground(cardBg);
        }

        if (hasArtwork) {
            headerContainer.setPadding(dp(density, 12f), dp(density, 2f), dp(density, 12f), dp(density, 10f));
            if (cardView == null) {
                float cardR = dpf(density, 20f);
                GradientDrawable headerCard = new GradientDrawable();
                headerCard.setShape(GradientDrawable.RECTANGLE);
                headerCard.setCornerRadius(cardR);
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
            // Clean open header for title-only sheets (e.g. Sleep Timer)
            headerContainer.setPadding(dp(density, 16f), dp(density, 4f), dp(density, 16f), dp(density, 8f));
            headerChild.setBackgroundColor(Color.TRANSPARENT);
        }

        for (int i = 0; i < textViews.size(); i++) {
            TextView tv = textViews.get(i);
            if (i == 0) {
                tv.setTextColor(onSurface);
                if (!hasArtwork) {
                    tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
                }
                tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            } else {
                tv.setTextColor(onSurfaceVar);
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

        ImageView iconIv = idIcon != 0 ? itemView.findViewById(idIcon) : null;
        TextView titleTv = idTitle != 0 ? itemView.findViewById(idTitle) : null;
        ImageView extraIv = idExtraIcon != 0 ? itemView.findViewById(idExtraIcon) : null;
        ImageView checkIv = idCheckIcon != 0 ? itemView.findViewById(idCheckIcon) : null;

        boolean grouped = MaterialYouConfig.isGroupedContextMenuCardsEnabled();
        boolean selected = itemView.isSelected();
        boolean destructive = isDestructiveTextOrIcon(titleTv, iconIv);
        boolean disabled = !destructive && isDisabledMutedText(titleTv);
        boolean iconVisible = iconIv != null && iconIv.getVisibility() == View.VISIBLE;

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
        int destructiveFg = lightMode ? 0xFFBA1A1A : 0xFFFFB4AB;

        int styleKey = (role & 0x3)
                | (grouped ? 0x4 : 0)
                | (selected ? 0x8 : 0)
                | (destructive ? 0x10 : 0)
                | (disabled ? 0x20 : 0)
                | (lightMode ? 0x40 : 0)
                | ((primary & 0xFFFFFF) << 7);

        float outerR = dpf(density, grouped ? 20f : 16f);
        float innerR = dpf(density, grouped ? 6f : 16f);
        float topR = (role == ROLE_SINGLE || role == ROLE_FIRST) ? outerR : innerR;
        float botR = (role == ROLE_SINGLE || role == ROLE_LAST) ? outerR : innerR;
        float[] radii = new float[]{topR, topR, topR, topR, botR, botR, botR, botR};

        int targetHeight = dp(density, grouped ? 58f : 56f);
        int targetBottomMargin = (!grouped)
                ? dp(density, 2f)
                : ((role == ROLE_LAST || role == ROLE_SINGLE) ? 0 : dp(density, 3f));

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
                } else if (destructive) {
                    fillColor = lightMode
                            ? MaterialYouColorEngine.blendRgb(surfaceHigh, 0xFFFFDAD6, 0.55f)
                            : MaterialYouColorEngine.blendRgb(surfaceHigh, 0xFF4A1818, 0.35f);
                    strokeColor = MaterialYouColorEngine.withAlpha(destructiveFg, lightMode ? 0x38 : 0x42);
                } else {
                    fillColor = surfaceHigh;
                    strokeColor = MaterialYouColorEngine.withAlpha(outlineVar, 0x26);
                }
            } else {
                fillColor = selected
                        ? MaterialYouColorEngine.blendRgb(surfaceHigh, primary, 0.18f)
                        : Color.TRANSPARENT;
                strokeColor = selected
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
                    ? MaterialYouColorEngine.withAlpha(destructiveFg, lightMode ? 0x28 : 0x33)
                    : MaterialYouColorEngine.withAlpha(primary, 0x2C);
            itemView.setForeground(new RippleDrawable(ColorStateList.valueOf(rippleTint), null, mask));
        }
        itemView.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);

        if (iconIv != null) {
            if (iconVisible) {
                int badgeSize = dp(density, 36f);
                int iconMarginStart = dp(density, 14f);
                int pad = dp(density, 7f);
                if (iconIv.getPaddingLeft() != pad) {
                    iconIv.setPadding(pad, pad, pad, pad);
                }
                iconIv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
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
                badge.setShape(GradientDrawable.OVAL);
                badge.setColor(selected ? primaryCtr : (destructive ? (lightMode ? 0x26BA1A1A : 0x38FF5252) : surfaceHighest));
                iconIv.setBackground(badge);

                int iconTint;
                if (disabled) {
                    iconTint = MaterialYouColorEngine.withAlpha(onSurfaceVar, 0x66);
                } else if (destructive) {
                    iconTint = destructiveFg;
                } else if (selected) {
                    iconTint = onPrimaryCtr;
                } else {
                    iconTint = MaterialYouColorEngine.blendRgb(onSurface, primary, 0.28f);
                }
                iconIv.setImageTintList(ColorStateList.valueOf(iconTint));
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
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            titleTv.setTypeface(Typeface.create("sans-serif-medium", selected ? Typeface.BOLD : Typeface.NORMAL));

            int desiredMarginStart = dp(density, iconVisible ? 62f : 18f);
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
            Method m = cachedGetItemCountMethod;
            if (m == null || cachedAdapterClass != cls) {
                m = cls.getMethod("getItemCount");
                m.setAccessible(true);
                cachedAdapterClass = cls;
                cachedGetItemCountMethod = m;
            }
            Object res = m.invoke(adapter);
            if (res instanceof Integer) {
                return (Integer) res;
            }
        } catch (Throwable ignored) {
        }
        return 0;
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
