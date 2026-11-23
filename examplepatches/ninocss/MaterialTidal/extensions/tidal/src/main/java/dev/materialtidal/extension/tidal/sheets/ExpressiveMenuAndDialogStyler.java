package dev.materialtidal.extension.tidal.sheets;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.widget.Adapter;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit;
import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit.MultiTierProgressiveBlurRenderer;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Material 3 Expressive styler for AppCompat overflow/popup menus ({@code ListPopupWindow},
 * {@code MenuAdapter}) and legacy {@code AlertDialog}s ({@code AlertController}).
 */
final class ExpressiveMenuAndDialogStyler {

    private static final WeakHashMap<View, Boolean> STYLED_ALERT_LIST_VIEWS = new WeakHashMap<>();

    // Cached reflection fields for ListPopupWindow (walked up hierarchy cleanly)
    private static volatile Field lpwPopupField;
    private static volatile Field lpwContextField;
    private static volatile Field lpwDropDownListField;
    private static volatile Field lpwAnchorField;
    private static volatile Method lpwGetAnchorMethod;
    private static volatile boolean lpwFieldsResolved;

    // Cached reflection fields for AlertController
    private static volatile Field acWindowField;
    private static volatile Field acContextField;
    private static volatile Field acTitleViewField;
    private static volatile Field acMessageViewField;
    private static volatile Field acPositiveBtnField;
    private static volatile Field acNegativeBtnField;
    private static volatile Field acNeutralBtnField;
    private static volatile Field acListViewField;
    private static volatile boolean acFieldsResolved;

    // Cached resource IDs
    private static String cachedPackage;
    private static int idGroupDivider;
    private static int idParentPanel;
    private static int idTopPanel;
    private static int idContentPanel;
    private static int idButtonPanel;
    private static int idCustomPanel;
    private static int idScrollView;
    private static int idAlertTitle;

    private ExpressiveMenuAndDialogStyler() {
    }

    // ---- Popup & Overflow Menus (ListPopupWindow + MenuAdapter) ----

    /**
     * Frosted glass drawable for AppCompat {@code ListPopupWindow} popups: captures and blurs
     * the underlying activity screen region once behind the popup window bounds, then draws a
     * translucent frosted surface fill and crisp 1dp border clipped to Expressive rounded corners.
     */
    private static final class FrostedPopupBackgroundDrawable extends Drawable {
        private final WeakReference<View> backdropRootRef;
        private final MultiTierProgressiveBlurRenderer renderer =
                new MultiTierProgressiveBlurRenderer("popupBlur");
        private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fallbackPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path clipPath = new Path();
        private final RectF rectF = new RectF();
        private final int[] rootLoc = new int[2];
        private final int[] popupLoc = new int[2];

        private final float density;
        private final float cornerRadiusPx;
        private final int fillColor;
        private final int paddingPx;

        private boolean captured = false;
        private int capW = -1;
        private int capH = -1;
        private int capDx = Integer.MIN_VALUE;
        private int capDy = Integer.MIN_VALUE;

        FrostedPopupBackgroundDrawable(
                View backdropRoot,
                float density,
                float cornerRadiusPx,
                int fillColor,
                int strokeColor,
                int paddingPx) {
            this.backdropRootRef = new WeakReference<>(backdropRoot);
            this.density = density;
            this.cornerRadiusPx = cornerRadiusPx;
            this.fillColor = fillColor;
            this.paddingPx = paddingPx;

            fallbackPaint.setStyle(Paint.Style.FILL);
            fallbackPaint.setColor(fillColor);

            borderPaint.setStyle(Paint.Style.STROKE);
            borderPaint.setStrokeWidth(Math.max(1f, 1f * density));
            borderPaint.setColor(strokeColor);

            renderer.configure(
                    MultiTierProgressiveBlurRenderer.DIR_UNIFORM,
                    0f,
                    new float[]{14f},
                    new float[]{0f},
                    fillColor,
                    0f,
                    0.72f);
        }

        @Override
        public boolean getPadding(Rect padding) {
            padding.set(paddingPx, paddingPx, paddingPx, paddingPx);
            return true;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) {
                return;
            }
            int w = b.width();
            int h = b.height();
            float r = Math.min(cornerRadiusPx, Math.min(w, h) * 0.5f);

            int sc = canvas.save();
            canvas.translate(b.left, b.top);

            rectF.set(0f, 0f, w, h);
            clipPath.reset();
            clipPath.addRoundRect(rectF, r, r, Path.Direction.CW);

            View backdropRoot = backdropRootRef.get();
            View popupBgView = getCallback() instanceof View ? (View) getCallback() : null;
            boolean useBlur = !MaterialYouColorEngine.isEffectiveAmoledBlack()
                    && MaterialYouConfig.isExpressiveBlurEnabled()
                    && renderer.canUseHardwareBlur(canvas)
                    && backdropRoot != null
                    && popupBgView != null
                    && backdropRoot.isAttachedToWindow()
                    && !ExpressiveBlurKit.CAPTURING_BACKDROP;

            if (useBlur) {
                float bleedPx = 12f * density;
                backdropRoot.getLocationOnScreen(rootLoc);
                popupBgView.getLocationOnScreen(popupLoc);
                int dx = popupLoc[0] - rootLoc[0] + b.left;
                int dy = popupLoc[1] - rootLoc[1] + b.top;

                if (!captured || capW != w || capH != h || capDx != dx || capDy != dy) {
                    RecordingCanvas rc = renderer.beginBackdropCapture(
                            w, h, bleedPx, 0.5f, MaterialYouColorEngine.getSurfaceBase());
                    if (rc != null) {
                        int rcSave = rc.save();
                        rc.clipRect(-bleedPx, -bleedPx, w + bleedPx, h + bleedPx);
                        rc.translate(-dx, -dy);
                        ExpressiveBlurKit.CAPTURING_BACKDROP = true;
                        try {
                            backdropRoot.draw(rc);
                        } catch (Throwable ignored) {
                        } finally {
                            ExpressiveBlurKit.CAPTURING_BACKDROP = false;
                            rc.restoreToCount(rcSave);
                            renderer.endBackdropCapture(density);
                        }
                        captured = true;
                        capW = w;
                        capH = h;
                        capDx = dx;
                        capDy = dy;
                    }
                }
                canvas.save();
                canvas.clipPath(clipPath);
                renderer.draw(canvas, w, h, bleedPx);
                canvas.restore();
            } else {
                canvas.drawRoundRect(rectF, r, r, fallbackPaint);
            }

            float strokeHalf = borderPaint.getStrokeWidth() * 0.5f;
            rectF.inset(strokeHalf, strokeHalf);
            float innerR = Math.max(1f, r - strokeHalf);
            canvas.drawRoundRect(rectF, innerR, innerR, borderPaint);

            canvas.restoreToCount(sc);
        }

        @Override
        public void setAlpha(int alpha) {
            fallbackPaint.setAlpha(alpha);
            borderPaint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            fallbackPaint.setColorFilter(colorFilter);
            borderPaint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    static void prepareListPopupWindow(Object listPopupWindow) {
        if (listPopupWindow == null || !MaterialYouConfig.isExpressivePopupMenusEnabled()) {
            return;
        }
        ensureLpwFields(listPopupWindow.getClass());
        PopupWindow popup = getFieldValue(lpwPopupField, listPopupWindow, PopupWindow.class);
        Context ctx = getFieldValue(lpwContextField, listPopupWindow, Context.class);
        if (popup == null || ctx == null) {
            return;
        }

        float density = ctx.getResources().getDisplayMetrics().density;
        float radius = dpf(density, ExpressiveSheetsBridge.getMenuCornerRadiusDp());
        int surfaceHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        boolean lightMode = MaterialYouColorEngine.isLightMode(ctx);
        boolean useFrosted = MaterialYouConfig.isExpressiveBlurEnabled()
                && !MaterialYouColorEngine.isEffectiveAmoledBlack()
                && ExpressiveBlurKit.isHardwareBlurSupported();
        int outline = useFrosted
                ? (lightMode
                        ? MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x88)
                        : MaterialYouColorEngine.withAlpha(
                                MaterialYouColorEngine.blendRgb(
                                        MaterialYouColorEngine.getOutlineVariant(), 0xFFFFFFFF, 0.35f),
                                0x56))
                : MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), lightMode ? 0x80 : 0x55);
        int pad = dp(density, 6f);

        View backdropRoot = null;
        if (useFrosted) {
            View anchor = resolveAnchorView(listPopupWindow);
            if (anchor != null) {
                backdropRoot = anchor.getRootView();
            }
            if (backdropRoot == null) {
                backdropRoot = findActivityDecorView(ctx);
            }
        }

        if (useFrosted && backdropRoot != null) {
            popup.setBackgroundDrawable(new FrostedPopupBackgroundDrawable(
                    backdropRoot, density, radius, surfaceHigh, outline, pad));
        } else {
            GradientDrawable menuBg = new GradientDrawable();
            menuBg.setShape(GradientDrawable.RECTANGLE);
            menuBg.setCornerRadius(radius);
            menuBg.setColor(surfaceHigh);
            menuBg.setStroke(Math.max(1, dp(density, 1f)), outline);
            if (Build.VERSION.SDK_INT >= 29) {
                menuBg.setPadding(pad, pad, pad, pad);
            }
            popup.setBackgroundDrawable(menuBg);
        }
        popup.setElevation(dpf(density, 12f));
    }

    static void styleListPopupDropDown(Object listPopupWindow) {
        if (listPopupWindow == null || !MaterialYouConfig.isExpressivePopupMenusEnabled()) {
            return;
        }
        ensureLpwFields(listPopupWindow.getClass());
        ListView dropDownList = getFieldValue(lpwDropDownListField, listPopupWindow, ListView.class);
        if (dropDownList == null) {
            return;
        }

        float density = dropDownList.getResources().getDisplayMetrics().density;
        float innerRadius = Math.max(dpf(density, 10f),
                dpf(density, ExpressiveSheetsBridge.getMenuCornerRadiusDp()) - dpf(density, 4f));

        dropDownList.setDivider(null);
        dropDownList.setDividerHeight(0);
        dropDownList.setSelector(new ColorDrawable(Color.TRANSPARENT));
        dropDownList.setBackgroundColor(Color.TRANSPARENT);
        dropDownList.setClipToPadding(false);
        dropDownList.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                int w = view.getWidth();
                int h = view.getHeight();
                if (w > 0 && h > 0) {
                    outline.setRoundRect(0, 0, w, h, innerRadius);
                }
            }
        });
        dropDownList.setClipToOutline(true);
    }

    static void stylePopupMenuItem(Object menuAdapter, View itemView, int position) {
        if (itemView == null || !MaterialYouConfig.isExpressivePopupMenusEnabled()) {
            return;
        }
        Context ctx = itemView.getContext();
        ensureIds(ctx);
        float density = ctx.getResources().getDisplayMetrics().density;

        boolean enabled = itemView.isEnabled();
        boolean checked = false;
        if (menuAdapter instanceof Adapter) {
            try {
                Object item = ((Adapter) menuAdapter).getItem(position);
                if (item instanceof MenuItem) {
                    MenuItem mi = (MenuItem) item;
                    enabled = mi.isEnabled();
                    checked = mi.isChecked();
                }
            } catch (Throwable ignored) {
            }
        }

        int surfaceHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        int primary = MaterialYouColorEngine.getPrimaryAccent();
        int onSurface = MaterialYouColorEngine.getOnSurface();
        int onSurfaceVar = MaterialYouColorEngine.getOnSurfaceVariant();
        int outlineVar = MaterialYouColorEngine.getOutlineVariant();

        CompoundButton cb = findCompoundButton(itemView);
        if (!checked && cb != null) {
            checked = cb.isChecked();
        }

        float rowR = dpf(density, 14f);
        GradientDrawable normalBg = new GradientDrawable();
        normalBg.setShape(GradientDrawable.RECTANGLE);
        normalBg.setCornerRadius(rowR);
        normalBg.setColor(checked
                ? MaterialYouColorEngine.blendRgb(surfaceHigh, primary, 0.24f)
                : Color.TRANSPARENT);

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(rowR);
        mask.setColor(0xFFFFFFFF);

        RippleDrawable ripple = new RippleDrawable(
                ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(primary, 0x2C)),
                normalBg,
                mask
        );
        itemView.setBackground(ripple);
        itemView.setMinimumHeight(dp(density, 46f));
        itemView.setPaddingRelative(dp(density, 10f), dp(density, 6f), dp(density, 10f), dp(density, 6f));

        View divider = idGroupDivider != 0 ? itemView.findViewById(idGroupDivider) : null;
        if (divider != null) {
            divider.setBackgroundColor(MaterialYouColorEngine.withAlpha(outlineVar, 0x3A));
            if (divider instanceof ImageView) {
                ((ImageView) divider).setImageDrawable(null);
            }
            ViewGroup.LayoutParams dlp = divider.getLayoutParams();
            if (dlp != null && dlp.height != dp(density, 1f)) {
                dlp.height = dp(density, 1f);
                divider.setLayoutParams(dlp);
            }
        }

        styleMenuItemChildren(itemView, divider, enabled, checked, primary, onSurface, onSurfaceVar);
    }

    private static void styleMenuItemChildren(
            View view,
            View dividerView,
            boolean enabled,
            boolean checked,
            int primary,
            int onSurface,
            int onSurfaceVar
    ) {
        if (view == dividerView) {
            return;
        }
        if (view instanceof CompoundButton) {
            CompoundButton cb = (CompoundButton) view;
            ColorStateList tint = new ColorStateList(
                    new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                    new int[]{primary, onSurfaceVar}
            );
            cb.setButtonTintList(tint);
            return;
        }
        if (view instanceof TextView) {
            TextView tv = (TextView) view;
            int color = !enabled
                    ? MaterialYouColorEngine.withAlpha(onSurfaceVar, 0x66)
                    : (checked ? primary : onSurface);
            tv.setTextColor(color);
            tv.setTypeface(Typeface.create("sans-serif-medium", checked ? Typeface.BOLD : Typeface.NORMAL));
            return;
        }
        if (view instanceof ImageView) {
            int tint = !enabled
                    ? MaterialYouColorEngine.withAlpha(onSurfaceVar, 0x66)
                    : (checked ? primary : onSurfaceVar);
            ((ImageView) view).setImageTintList(ColorStateList.valueOf(tint));
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                styleMenuItemChildren(vg.getChildAt(i), dividerView, enabled, checked, primary, onSurface, onSurfaceVar);
            }
        }
    }

    private static CompoundButton findCompoundButton(View v) {
        if (v instanceof CompoundButton) {
            return (CompoundButton) v;
        }
        if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            for (int i = 0; i < vg.getChildCount(); i++) {
                CompoundButton found = findCompoundButton(vg.getChildAt(i));
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    // ---- AlertDialog (AlertController) ----

    static void styleAlertController(Object alertController) {
        if (alertController == null || !MaterialYouConfig.isExpressiveDialogsEnabled()) {
            return;
        }
        ensureAcFields(alertController.getClass());
        Window window = getFieldValue(acWindowField, alertController, Window.class);
        Context ctx = getFieldValue(acContextField, alertController, Context.class);
        if (window == null || ctx == null) {
            return;
        }

        ensureIds(ctx);
        float density = ctx.getResources().getDisplayMetrics().density;
        float dialogR = dpf(density, ExpressiveSheetsBridge.getDialogCornerRadiusDp());

        int surfaceHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        int outline = MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x48);
        int primary = MaterialYouColorEngine.getPrimaryAccent();
        int onPrimary = MaterialYouColorEngine.getOnPrimary();
        int onSurface = MaterialYouColorEngine.getOnSurface();
        int onSurfaceVar = MaterialYouColorEngine.getOnSurfaceVariant();

        boolean lightMode = MaterialYouColorEngine.isLightMode(ctx);
        boolean hasBlur = ExpressiveBlurKit.isCrossWindowBlurAvailable(ctx);
        int bgColor = hasBlur
                ? MaterialYouColorEngine.withAlpha(surfaceHigh, 0xDC)
                : surfaceHigh;
        int strokeColor = hasBlur
                ? (lightMode
                        ? MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x88)
                        : MaterialYouColorEngine.withAlpha(
                                MaterialYouColorEngine.blendRgb(
                                        MaterialYouColorEngine.getOutlineVariant(), 0xFFFFFFFF, 0.35f),
                                0x56))
                : outline;

        GradientDrawable dialogBg = new GradientDrawable();
        dialogBg.setShape(GradientDrawable.RECTANGLE);
        dialogBg.setCornerRadius(dialogR);
        dialogBg.setColor(bgColor);
        dialogBg.setStroke(Math.max(1, dp(density, 1f)), strokeColor);

        int insetH = dp(density, 16f);
        int insetV = dp(density, 12f);
        window.setBackgroundDrawable(new InsetDrawable(dialogBg, insetH, insetV, insetH, insetV));
        ExpressiveBlurKit.applyWindowBackdropBlur(window, 18, 28, 0.60f, 0.44f, density);
        MaterialYouColorEngine.applySystemBarAppearance(window, lightMode);

        View decor = window.getDecorView();
        if (decor != null && Build.VERSION.SDK_INT >= 29) {
            decor.setForceDarkAllowed(false);
        }

        View parentPanel = idParentPanel != 0 ? window.findViewById(idParentPanel) : null;
        if (parentPanel != null) {
            parentPanel.setBackground(null);
            parentPanel.setOutlineProvider(new ViewOutlineProvider() {
                @Override
                public void getOutline(View view, Outline o) {
                    if (view.getWidth() > 0 && view.getHeight() > 0) {
                        o.setRoundRect(0, 0, view.getWidth(), view.getHeight(), dialogR);
                    }
                }
            });
            parentPanel.setClipToOutline(true);
        }

        clearPanelBackground(window, idTopPanel);
        clearPanelBackground(window, idContentPanel);
        clearPanelBackground(window, idButtonPanel);
        clearPanelBackground(window, idCustomPanel);
        clearPanelBackground(window, idScrollView);

        TextView titleView = getFieldValue(acTitleViewField, alertController, TextView.class);
        if (titleView == null && idAlertTitle != 0) {
            View altTitle = window.findViewById(idAlertTitle);
            if (altTitle instanceof TextView) {
                titleView = (TextView) altTitle;
            }
        }
        if (titleView != null) {
            titleView.setTextColor(onSurface);
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
            titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        }

        TextView messageView = getFieldValue(acMessageViewField, alertController, TextView.class);
        if (messageView == null) {
            View stdMsg = window.findViewById(android.R.id.message);
            if (stdMsg instanceof TextView) {
                messageView = (TextView) stdMsg;
            }
        }
        if (messageView != null) {
            messageView.setTextColor(onSurfaceVar);
            messageView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            messageView.setLineSpacing(0f, 1.22f);
        }

        ListView listView = getFieldValue(acListViewField, alertController, ListView.class);
        if (listView != null) {
            styleAlertListView(listView, density, surfaceHigh, primary, onSurface, onSurfaceVar);
        }

        Button positive = getFieldValue(acPositiveBtnField, alertController, Button.class);
        Button negative = getFieldValue(acNegativeBtnField, alertController, Button.class);
        Button neutral = getFieldValue(acNeutralBtnField, alertController, Button.class);

        stylePillDialogButton(positive, true, false, density, primary, onPrimary);
        stylePillDialogButton(negative, false, true, density, primary, onPrimary);
        stylePillDialogButton(neutral, false, false, density, primary, onPrimary);
    }

    private static void clearPanelBackground(Window window, int id) {
        if (id == 0) {
            return;
        }
        View v = window.findViewById(id);
        if (v != null && v.getBackground() != null) {
            v.setBackground(null);
        }
    }

    private static void styleAlertListView(
            ListView listView,
            float density,
            int surfaceHigh,
            int primary,
            int onSurface,
            int onSurfaceVar
    ) {
        listView.setBackgroundColor(Color.TRANSPARENT);
        listView.setDivider(null);
        listView.setDividerHeight(0);
        listView.setClipToPadding(false);
        listView.setPadding(dp(density, 10f), dp(density, 4f), dp(density, 10f), dp(density, 4f));
        listView.setSelector(new ColorDrawable(Color.TRANSPARENT));

        for (int i = 0; i < listView.getChildCount(); i++) {
            styleDialogListRow(listView.getChildAt(i), density, surfaceHigh, primary, onSurface, onSurfaceVar);
        }
        if (!Boolean.TRUE.equals(STYLED_ALERT_LIST_VIEWS.get(listView))) {
            STYLED_ALERT_LIST_VIEWS.put(listView, Boolean.TRUE);
            listView.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
                @Override
                public void onChildViewAdded(View parent, View child) {
                    styleDialogListRow(child, density, surfaceHigh, primary, onSurface, onSurfaceVar);
                }

                @Override
                public void onChildViewRemoved(View parent, View child) {
                }
            });
        }
    }

    private static void styleDialogListRow(
            View row,
            float density,
            int surfaceHigh,
            int primary,
            int onSurface,
            int onSurfaceVar
    ) {
        if (row == null) {
            return;
        }
        boolean checked = (row instanceof CheckedTextView && ((CheckedTextView) row).isChecked());
        CompoundButton cb = findCompoundButton(row);
        if (!checked && cb != null) {
            checked = cb.isChecked();
        }

        float r = dpf(density, 14f);
        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setCornerRadius(r);
        bg.setColor(checked
                ? MaterialYouColorEngine.blendRgb(surfaceHigh, primary, 0.22f)
                : Color.TRANSPARENT);

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(r);
        mask.setColor(0xFFFFFFFF);

        row.setBackground(new RippleDrawable(
                ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(primary, 0x2C)),
                bg,
                mask
        ));

        if (row instanceof CheckedTextView) {
            CheckedTextView ctv = (CheckedTextView) row;
            ctv.setTextColor(checked ? primary : onSurface);
            ctv.setCheckMarkTintList(ColorStateList.valueOf(primary));
        } else {
            styleMenuItemChildren(row, null, true, checked, primary, onSurface, onSurfaceVar);
        }
    }

    private static void stylePillDialogButton(
            Button btn,
            boolean isPrimary,
            boolean isTonalSecondary,
            float density,
            int primary,
            int onPrimary
    ) {
        if (btn == null || btn.getVisibility() != View.VISIBLE) {
            return;
        }
        int bgColor = isPrimary
                ? primary
                : (isTonalSecondary ? MaterialYouColorEngine.withAlpha(primary, 0x1E) : Color.TRANSPARENT);
        int fgColor = isPrimary ? onPrimary : primary;
        int rippleColor = isPrimary
                ? MaterialYouColorEngine.withAlpha(onPrimary, 0x2A)
                : MaterialYouColorEngine.withAlpha(primary, 0x2C);

        float pillR = dpf(density, 999f);
        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setCornerRadius(pillR);
        shape.setColor(bgColor);

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(pillR);
        mask.setColor(0xFFFFFFFF);

        btn.setBackground(new RippleDrawable(ColorStateList.valueOf(rippleColor), shape, mask));
        btn.setAllCaps(false);
        btn.setTextColor(fgColor);
        btn.setTypeface(Typeface.create("sans-serif-medium", isPrimary ? Typeface.BOLD : Typeface.NORMAL));
        btn.setMinHeight(dp(density, 40f));
        btn.setMinimumHeight(dp(density, 40f));
        int ph = dp(density, isPrimary ? 20f : 16f);
        int pv = dp(density, 8f);
        btn.setPadding(ph, pv, ph, pv);

        if (btn.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) btn.getLayoutParams();
            int gap = dp(density, 4f);
            if (mlp.getMarginStart() != gap || mlp.getMarginEnd() != gap) {
                mlp.setMarginStart(gap);
                mlp.setMarginEnd(gap);
                btn.setLayoutParams(mlp);
            }
        }
    }

    // ---- Reflection & ID Helpers ----

    private static void ensureLpwFields(Class<?> startClass) {
        if (lpwFieldsResolved) {
            return;
        }
        lpwFieldsResolved = true;
        lpwPopupField = findField(startClass, "mPopup");
        lpwContextField = findField(startClass, "mContext");
        lpwDropDownListField = findField(startClass, "mDropDownList");
        lpwAnchorField = findField(startClass, "mDropDownAnchorView");
        lpwGetAnchorMethod = findNoArgMethod(startClass, "getAnchorView");
    }

    private static View resolveAnchorView(Object listPopupWindow) {
        View anchor = getFieldValue(lpwAnchorField, listPopupWindow, View.class);
        if (anchor != null) {
            return anchor;
        }
        if (lpwGetAnchorMethod != null) {
            try {
                Object res = lpwGetAnchorMethod.invoke(listPopupWindow);
                if (res instanceof View) {
                    return (View) res;
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static View findActivityDecorView(Context ctx) {
        Context c = ctx;
        int guard = 0;
        while (c instanceof ContextWrapper && !(c instanceof Activity) && guard++ < 12) {
            c = ((ContextWrapper) c).getBaseContext();
        }
        if (c instanceof Activity) {
            Window w = ((Activity) c).getWindow();
            return w != null ? w.getDecorView() : null;
        }
        return null;
    }

    private static Method findNoArgMethod(Class<?> cls, String name) {
        Class<?> c = cls;
        while (c != null && c != Object.class) {
            try {
                Method m = c.getDeclaredMethod(name);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) {
                c = c.getSuperclass();
            }
        }
        return null;
    }

    private static void ensureAcFields(Class<?> startClass) {
        if (acFieldsResolved) {
            return;
        }
        acFieldsResolved = true;
        acWindowField = findField(startClass, "mWindow");
        acContextField = findField(startClass, "mContext");
        acTitleViewField = findField(startClass, "mTitleView");
        acMessageViewField = findField(startClass, "mMessageView");
        acPositiveBtnField = findField(startClass, "mButtonPositive");
        acNegativeBtnField = findField(startClass, "mButtonNegative");
        acNeutralBtnField = findField(startClass, "mButtonNeutral");
        acListViewField = findField(startClass, "mListView");
    }

    private static Field findField(Class<?> cls, String name) {
        Class<?> c = cls;
        while (c != null && c != Object.class) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) {
                c = c.getSuperclass();
            }
        }
        return null;
    }

    private static <T> T getFieldValue(Field field, Object target, Class<T> type) {
        if (field == null || target == null) {
            return null;
        }
        try {
            Object val = field.get(target);
            return type.isInstance(val) ? type.cast(val) : null;
        } catch (Throwable ignored) {
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
        if (pkg.equals(cachedPackage) && idParentPanel != 0) {
            return;
        }
        cachedPackage = pkg;
        idGroupDivider = res.getIdentifier("group_divider", "id", pkg);
        idParentPanel = res.getIdentifier("parentPanel", "id", pkg);
        idTopPanel = res.getIdentifier("topPanel", "id", pkg);
        idContentPanel = res.getIdentifier("contentPanel", "id", pkg);
        idButtonPanel = res.getIdentifier("buttonPanel", "id", pkg);
        idCustomPanel = res.getIdentifier("customPanel", "id", pkg);
        idScrollView = res.getIdentifier("scrollView", "id", pkg);
        idAlertTitle = res.getIdentifier("alertTitle", "id", pkg);
    }

    private static int dp(float density, float val) {
        return Math.round(val * density);
    }

    private static float dpf(float density, float val) {
        return val * density;
    }
}
