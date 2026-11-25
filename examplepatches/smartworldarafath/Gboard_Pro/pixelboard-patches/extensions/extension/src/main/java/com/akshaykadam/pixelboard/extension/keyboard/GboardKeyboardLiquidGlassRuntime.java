package com.akshaykadam.pixelboard.extension.keyboard;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.PorterDuffXfermode;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;

import com.akshaykadam.pixelboard.extension.settings.GboardM3Helper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

public final class GboardKeyboardLiquidGlassRuntime {

    private static final int ID_SOFT_KEY_HOST = 0x7f0b03be;
    private static final int ID_SOFT_KEY_INNER = 0x7f0b0084;
    private static final int ID_SOFT_KEY_ICON = 0x7f0b03c0;
    private static final int ID_SOFT_KEY_LABEL = 0x7f0b05f3;
    private static final int ID_SOFT_KEY_CHEVRON = 0x7f0b0083;
    private static final int ID_SOFT_KEY_MIC_BG = 0x7f0b065c;
    private static final int ID_SOFT_KEY_POWER_IND = 0x7f0b072e;

    private static final int ID_KEY_HEADER_AP_MENU = 0x7f0b0500;
    private static final int ID_KEY_HEADER_EXTRA_END = 0x7f0b0505;
    private static final int ID_KEY_HEADER_POWER = 0x7f0b0507;
    private static final int ID_KEY_HEADER_EXTRA_START = 0x7f0b050a;
    private static final int ID_KEY_HEADER_VOICE = 0x7f0b050b;

    private static final int ID_ACCESS_POINTS_BAR = 0x7f0b007f;
    private static final int ID_ACCESS_POINTS_PANEL_V2 = 0x7f0b0091;
    private static final int ID_ACCESS_POINTS_EDIT_PAGE = 0x7f0b0085;
    private static final int ID_ACCESS_POINTS_EDIT_CONTAINER = 0x7f0b0086;
    private static final int ID_ACCESS_POINTS_EDIT_BTN = 0x7f0b0088;
    private static final int ID_ACCESS_POINTS_EDIT_HOLDER = 0x7f0b0089;
    private static final int ID_ACCESS_POINTS_PAGER = 0x7f0b008c;

    private static final int ID_EMOJI_HEADER_ICON_CONTAINER = 0x7f0b0272;
    private static final int ID_EMOJI_HEADER_ICON = 0x7f0b0271;
    private static final int ID_EMOJI_HEADER_INDICATOR = 0x7f0b0274;
    private static final int ID_EMOJI_HEADER_LEFT_BTN = 0x7f0b02b2;
    private static final int ID_EMOJI_HEADER_WRAPPER = 0x7f0b03ac;
    private static final int ID_EMOJI_HEADER_START_RV = 0x7f0b05e1;
    private static final int ID_EMOJI_NAV_BAR = 0x7f0b02bd;
    private static final int ID_EMOJI_NAV_BAR_SCROLL = 0x7f0b02c2;
    private static final int ID_EMOJI_NAV_ABC = 0x7f0b02a8;
    private static final int ID_EMOJI_NAV_RECYCLER = 0x7f0b02a9;
    private static final int ID_EMOJI_NAV_ITEM_ROOT = 0x7f0b02aa;
    private static final int ID_EMOJI_NAV_ITEM_ICON = 0x7f0b02ab;
    private static final int ID_EMOJI_NAV_ALT_LEFT = 0x7f0b0683;
    private static final int ID_EMOJI_NAV_DEL = 0x7f0b02bc;
    private static final int ID_EMOJI_NAV_DIVIDER = 0x7f0b02ac;

    private static final Map<View, Boolean> sHookedKeyboards = new WeakHashMap<View, Boolean>();
    private static final Map<View, Boolean> sHookedHeaderOrbs = new WeakHashMap<View, Boolean>();
    private static final Map<View, Boolean> sHookedNavBars = new WeakHashMap<View, Boolean>();
    private static final Map<View, Boolean> sHookedHeaderRoots = new WeakHashMap<View, Boolean>();
    private static final Map<View, Drawable> sSavedOriginalBackgrounds = new WeakHashMap<View, Drawable>();
    private static final Map<View, Boolean> sModifiedInkViews = new WeakHashMap<View, Boolean>();
    private static final Map<View, Integer> sModifiedInkColors = new WeakHashMap<View, Integer>();
    private static final Map<View, Boolean> sEmojiOrbSelectionState = new WeakHashMap<View, Boolean>();
    private static final LruCache<String, Bitmap> sEmoji3DCache = new LruCache<String, Bitmap>(280);

    private GboardKeyboardLiquidGlassRuntime() {
    }

    public static void onUiStyleModeChanged() {
        try {
            sEmoji3DCache.evictAll();
        } catch (Throwable ignored) {
        }
    }

    private static boolean isLiquidGlassEnabled(Context ctx) {
        return ctx != null && GboardM3Helper.isLiquidGlassUiEnabled(ctx);
    }

    private static boolean isLiquidGlassDrawable(Drawable d) {
        return d instanceof LiquidGlassKeycapDrawable
                || d instanceof LiquidGlassOrbRoleDrawable
                || d instanceof LiquidGlassAccessPointPillDrawable
                || d instanceof LiquidGlassCapsuleDrawable
                || d instanceof LiquidGlassRecessedTrayDrawable
                || d instanceof LiquidGlassBarOutlineTrackDrawable
                || d instanceof LiquidGlassCategoryStripDrawable
                || d instanceof LiquidGlassEmojiCategoryOrbDrawable;
    }

    private static void saveOriginalBackgroundOnce(View v) {
        if (v == null || sSavedOriginalBackgrounds.containsKey(v)) return;
        Drawable cur = v.getBackground();
        if (!isLiquidGlassDrawable(cur)) {
            sSavedOriginalBackgrounds.put(v, cur);
        }
    }

    private static void restoreClassicTree(View view) {
        if (view == null) return;
        if (sSavedOriginalBackgrounds.containsKey(view)) {
            Drawable orig = sSavedOriginalBackgrounds.remove(view);
            view.setBackground(orig);
            if (view.getVisibility() == View.GONE && view.getId() != ID_EMOJI_NAV_DIVIDER) {
                view.setVisibility(View.VISIBLE);
            }
        } else if (isLiquidGlassDrawable(view.getBackground())) {
            view.setBackground(null);
        }
        if (Boolean.TRUE.equals(sModifiedInkViews.remove(view)) && view instanceof ImageView iv) {
            iv.setImageTintList(null);
            iv.clearColorFilter();
        }
        sModifiedInkColors.remove(view);
        sEmojiOrbSelectionState.remove(view);
        if (view.getId() == ID_EMOJI_HEADER_INDICATOR && view.getAlpha() == 0f) {
            view.setAlpha(1f);
        }
        if (view.getId() == ID_EMOJI_NAV_DIVIDER && view.getVisibility() == View.GONE) {
            view.setVisibility(View.VISIBLE);
        }
        if (view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                restoreClassicTree(vg.getChildAt(i));
            }
        }
    }

    private static String paletteTag(GboardM3Helper.Palette p) {
        return p.isAmoled + "_" + p.isNight + "_" + p.accent + "_" + p.windowBackground;
    }

    private static float dpF(Context ctx, float dp) {
        return TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, ctx.getResources().getDisplayMetrics());
    }

    private static int dp(Context ctx, int dp) {
        return Math.round(dpF(ctx, dp));
    }

    private static void setBackgroundColorIfChanged(View v, int color) {
        if (v == null) return;
        Drawable bg = v.getBackground();
        if (bg instanceof ColorDrawable cd && cd.getColor() == color) {
            return;
        }
        v.setBackgroundColor(color);
    }

    private static boolean tintImageViewIfChanged(ImageView iv, int color) {
        if (iv == null) return false;
        Integer prev = sModifiedInkColors.get(iv);
        if (prev != null && prev.intValue() == color && iv.getColorFilter() != null) {
            return false;
        }
        sModifiedInkViews.put(iv, Boolean.TRUE);
        sModifiedInkColors.put(iv, color);
        iv.setImageTintList(ColorStateList.valueOf(color));
        iv.setColorFilter(new PorterDuffColorFilter(color, PorterDuff.Mode.SRC_IN));
        return true;
    }

    private static void setTextColorIfChanged(TextView tv, int color) {
        if (tv == null) return;
        if (tv.getCurrentTextColor() != color) {
            tv.setTextColor(color);
        }
    }

    private static void ensureUnclipped(ViewGroup vg) {
        if (vg == null) return;
        if (vg.getClipChildren()) {
            vg.setClipChildren(false);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP && vg.getClipToPadding()) {
            vg.setClipToPadding(false);
        }
    }

    // =========================================================================
    // 1. SoftKeyboardView + Header / Emoji Picker Tree Styling
    // =========================================================================

    public static void styleKeyboardView(final View view) {
        if (view == null) return;
        try {
            Context ctx = view.getContext();
            if (ctx == null) return;
            if (!Boolean.TRUE.equals(sHookedKeyboards.get(view))) {
                sHookedKeyboards.put(view, Boolean.TRUE);
                ViewTreeObserver vto = view.getViewTreeObserver();
                if (vto != null && vto.isAlive()) {
                    vto.addOnPreDrawListener(() -> {
                        try {
                            styleKeyboardNow(view);
                        } catch (Throwable ignored) {
                        }
                        return true;
                    });
                }
            }
            styleKeyboardNow(view);
        } catch (Throwable ignored) {
        }
    }

    private static void styleKeyboardNow(View view) {
        if (view == null || view.getContext() == null) return;
        if (!isLiquidGlassEnabled(view.getContext())) {
            restoreClassicTree(view);
            return;
        }
        GboardM3Helper.Palette palette = GboardM3Helper.Palette.forContext(view.getContext());
        styleKeyboardSurface(view, palette);
        styleKeyboardTree(view, palette);
    }

    private static void styleKeyboardSurface(View kbView, GboardM3Helper.Palette palette) {
        saveOriginalBackgroundOnce(kbView);
        if (kbView instanceof ViewGroup vg) {
            ensureUnclipped(vg);
        }
        int targetColor;
        if (palette.isAmoled) {
            targetColor = 0xFF000000;
        } else if (palette.isNight) {
            targetColor = GboardM3Helper.blendColor(0xFF141722, palette.windowBackground, 0.55f);
        } else {
            // Soft pearlescent lavender-white glass backdrop matching Keyboard.jpg / Emojis.jpg
            targetColor = 0xFFECEAF5;
        }
        setBackgroundColorIfChanged(kbView, targetColor);
    }

    private static void styleKeyboardTree(View view, GboardM3Helper.Palette palette) {
        if (view == null) return;
        int vid = view.getId();
        String cls = view.getClass().getName();

        if (vid == ID_ACCESS_POINTS_BAR || cls.endsWith("AccessPointsBar")) {
            if (view instanceof ViewGroup) {
                styleAccessPointsBar((ViewGroup) view, palette);
            }
            return;
        }

        if (vid == ID_ACCESS_POINTS_PANEL_V2 || cls.contains("AccessPointsPanel")) {
            styleAccessPointsPanel(view);
            return;
        }

        if (vid == ID_EMOJI_HEADER_WRAPPER) {
            saveOriginalBackgroundOnce(view);
            int hdrColor = palette.isAmoled ? 0xFF000000
                    : (palette.isNight ? GboardM3Helper.blendColor(0xFF141722, palette.windowBackground, 0.55f)
                    : 0xFFECEAF5);
            setBackgroundColorIfChanged(view, hdrColor);
        }

        if ((vid == ID_EMOJI_HEADER_LEFT_BTN || vid == ID_EMOJI_NAV_ALT_LEFT) && view.getVisibility() == View.VISIBLE) {
            styleEmojiHeaderOrbWrapper(view, palette);
        }

        if (vid == ID_EMOJI_HEADER_START_RV && view instanceof ViewGroup startRv) {
            ensureUnclipped(startRv);
            for (int i = 0; i < startRv.getChildCount(); i++) {
                View child = startRv.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE) continue;
                if (containsEmojiSearchBar(child)) {
                    if (child instanceof ViewGroup childVg) {
                        styleEmojiSearchBar(childVg, palette);
                    }
                } else {
                    styleEmojiHeaderOrbWrapper(child, palette);
                }
            }
        }

        if (cls.endsWith("EmojiPickerHeaderIconContainer") || vid == ID_EMOJI_HEADER_ICON_CONTAINER) {
            styleEmojiHeaderIconInternal(view, false);
            return;
        }

        if (vid == ID_EMOJI_NAV_DIVIDER) {
            if (view.getVisibility() != View.GONE) {
                view.setVisibility(View.GONE);
            }
            return;
        }

        if (vid == ID_EMOJI_NAV_BAR || vid == ID_EMOJI_NAV_BAR_SCROLL
                || cls.endsWith("ScrollableNavigationView") || cls.endsWith("FixedHeightNavigationRow")) {
            if (view instanceof ViewGroup navVg) {
                hookAndStyleNavBar(navVg, palette);
            }
            return;
        }

        if (view instanceof ViewGroup vg && isEmojiSearchBarContainer(vg)) {
            styleEmojiSearchBar(vg, palette);
        }

        if (view instanceof ImageView && isBackArrowInEmojiHeader((ImageView) view)) {
            styleEmojiHeaderBackOrb((ImageView) view, palette);
        }

        if (isInsideCandidatesStrip(view) && (cls.endsWith("SoftKeyView") || cls.contains("CandidatesHolder"))) {
            return;
        }

        if (cls.endsWith("SoftKeyView") || cls.contains("AccessPointsBarItemSoftKeyView")) {
            styleSoftKeyViewInternal(view, palette);
            return;
        }

        if (view instanceof ViewGroup vg) {
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                styleKeyboardTree(vg.getChildAt(i), palette);
            }
        }
    }

    private static boolean containsEmojiSearchBar(View root) {
        if (root == null) return false;
        if (root.getClass().getName().endsWith("ExpressionSearchBar")
                || (root instanceof ViewGroup vg && isEmojiSearchBarContainer(vg))) {
            return true;
        }
        if (root instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (containsEmojiSearchBar(vg.getChildAt(i))) return true;
            }
        }
        return false;
    }

    private static void styleEmojiHeaderOrbWrapper(View btn, GboardM3Helper.Palette palette) {
        if (btn == null) return;
        Context ctx = btn.getContext();
        if (btn instanceof ImageView iv) {
            styleEmojiHeaderBackOrb(iv, palette);
            return;
        }
        saveOriginalBackgroundOnce(btn);
        if (btn instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                View c = vg.getChildAt(i);
                if (c instanceof ImageView) {
                    saveOriginalBackgroundOnce(c);
                    if (c.getBackgroundTintList() != null) {
                        c.setBackgroundTintList(null);
                    }
                    if (c.getBackground() != null) {
                        c.setBackground(null);
                    }
                }
            }
        }
        String tag = "emoji_hdr_orb_" + paletteTag(palette);
        if (!(btn.getBackground() instanceof LiquidGlassOrbRoleDrawable d) || !tag.equals(d.tag)) {
            if (btn.getBackgroundTintList() != null) {
                btn.setBackgroundTintList(null);
            }
            btn.setBackground(new LiquidGlassOrbRoleDrawable(ctx, palette, OrbRole.PEARL, tag));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && btn.getForeground() != null) {
                btn.setForeground(null);
            }
        }
        tintKeyChildren(btn, palette, false);
    }

    private static boolean isInsideCandidatesStrip(View v) {
        ViewParent p = v != null ? v.getParent() : null;
        int depth = 0;
        while (p instanceof View pv && depth < 6) {
            String cn = pv.getClass().getName();
            if (cn.contains("CandidatesHolder")
                    || cn.contains("ProactiveSuggestions")
                    || cn.contains("SuggestionStrip")) {
                return true;
            }
            p = pv.getParent();
            depth++;
        }
        return false;
    }

    private static boolean isEmojiSearchBarContainer(ViewGroup vg) {
        int c = vg.getChildCount();
        for (int i = 0; i < c; i++) {
            Object t = vg.getChildAt(i).getTag();
            if (t != null) {
                String ts = t.toString();
                if (ts.contains("expression-search-entry-icon")
                        || ts.contains("expression-search-entry-hint")) {
                    return true;
                }
            }
        }
        return false;
    }

    private static void styleEmojiSearchBar(ViewGroup bar, GboardM3Helper.Palette palette) {
        Context ctx = bar.getContext();
        saveOriginalBackgroundOnce(bar);
        String tag = "emoji_search_" + paletteTag(palette);
        if (!(bar.getBackground() instanceof LiquidGlassCapsuleDrawable d) || !tag.equals(d.tag)) {
            bar.setBackground(new LiquidGlassCapsuleDrawable(ctx, palette, false, false, tag));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                bar.setForeground(null);
            }
        }
        int ink = palette.isNight ? 0xFFF2F4FF : 0xFF1E2438;
        int hintInk = palette.isNight ? 0xFFAAB2CC : 0xFF565E78;
        for (int i = 0; i < bar.getChildCount(); i++) {
            View c = bar.getChildAt(i);
            if (c instanceof ImageView iv) {
                tintImageViewIfChanged(iv, ink);
            } else if (c instanceof TextView tv) {
                setTextColorIfChanged(tv, ink);
                if (tv.getHintTextColors() == null || tv.getHintTextColors().getDefaultColor() != hintInk) {
                    tv.setHintTextColor(hintInk);
                }
            }
        }
        ViewParent p = bar.getParent();
        if (p instanceof ViewGroup parentVg) {
            ensureUnclipped(parentVg);
            for (int i = 0; i < parentVg.getChildCount(); i++) {
                View sib = parentVg.getChildAt(i);
                if (sib != bar && sib instanceof ImageView iv && sib.getLeft() < bar.getLeft()) {
                    styleEmojiHeaderBackOrb(iv, palette);
                }
            }
        }
    }

    private static boolean isBackArrowInEmojiHeader(ImageView iv) {
        CharSequence cd = iv.getContentDescription();
        if (cd == null) return false;
        String s = cd.toString().toLowerCase(Locale.US);
        if (!s.contains("back") && !s.contains("close") && !s.contains("navigate up")) {
            return false;
        }
        ViewParent p = iv.getParent();
        while (p instanceof View) {
            if (p.getClass().getName().endsWith("SoftKeyboardView")) {
                return true;
            }
            p = p.getParent();
        }
        return false;
    }

    private static void styleEmojiHeaderBackOrb(ImageView btn, GboardM3Helper.Palette palette) {
        Context ctx = btn.getContext();
        saveOriginalBackgroundOnce(btn);
        String tag = "emoji_back_orb_" + paletteTag(palette);
        if (!(btn.getBackground() instanceof LiquidGlassOrbRoleDrawable d) || !tag.equals(d.tag)) {
            btn.setBackground(new LiquidGlassOrbRoleDrawable(ctx, palette, OrbRole.PEARL, tag));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && btn.getForeground() != null) {
                btn.setForeground(null);
            }
            int size = dp(ctx, 40);
            ViewGroup.LayoutParams lp = btn.getLayoutParams();
            if (lp != null && (lp.width > 0 || lp.height > 0) && (lp.width != size || lp.height != size)) {
                lp.width = size;
                lp.height = size;
                btn.setLayoutParams(lp);
            }
            int pad = dp(ctx, 9);
            if (btn.getPaddingLeft() != pad || btn.getPaddingTop() != pad) {
                btn.setPadding(pad, pad, pad, pad);
            }
            if (btn.getScaleType() != ImageView.ScaleType.FIT_CENTER) {
                btn.setScaleType(ImageView.ScaleType.FIT_CENTER);
            }
        }
        int ink = palette.isNight ? 0xFFF2F4FF : 0xFF1A2036;
        tintImageViewIfChanged(btn, ink);
    }

    // =========================================================================
    // 2. SoftKeyView Keycaps (QWERTY + Spacebar + Functional Keys)
    // =========================================================================

    public static void styleSoftKeyView(View view) {
        if (view == null) return;
        try {
            Context ctx = view.getContext();
            if (ctx == null) return;
            if (!isLiquidGlassEnabled(ctx)) {
                restoreClassicTree(view);
                return;
            }
            GboardM3Helper.Palette palette = GboardM3Helper.Palette.forContext(ctx);
            styleSoftKeyViewInternal(view, palette);
        } catch (Throwable ignored) {
        }
    }

    private static void clearCompetingBackgrounds(View root, View keepStyledView) {
        if (root == null) return;
        if (root != keepStyledView) {
            int id = root.getId();
            if (id != ID_SOFT_KEY_ICON && id != ID_SOFT_KEY_CHEVRON && id != ID_SOFT_KEY_POWER_IND) {
                Object t = root.getTag();
                String ts = t != null ? t.toString() : "";
                boolean isBgTag = ts.contains(".keytop")
                        || ts.contains(".background-icon")
                        || ts.contains(".item-ripple")
                        || ts.contains(".access-point-item-background")
                        || ts.contains(".oval-navigation-highlight");
                if (isBgTag || root instanceof ViewGroup || root.getBackground() != null) {
                    if (root.getBackground() != null) {
                        saveOriginalBackgroundOnce(root);
                        root.setBackground(null);
                    }
                    root.setBackgroundTintList(null);
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && root.getForeground() != null) {
                        root.setForeground(null);
                    }
                }
                if (id == ID_SOFT_KEY_MIC_BG || ts.startsWith(".background-icon")) {
                    if (root.getBackground() != null) {
                        saveOriginalBackgroundOnce(root);
                        root.setBackground(null);
                    }
                    if (!(root instanceof ViewGroup) && root instanceof ImageView iv) {
                        iv.setImageDrawable(null);
                    }
                }
            }
        }
        if (root instanceof ViewGroup vg) {
            ensureUnclipped(vg);
            for (int i = 0; i < vg.getChildCount(); i++) {
                clearCompetingBackgrounds(vg.getChildAt(i), keepStyledView);
            }
        }
    }

    private static void styleSoftKeyViewInternal(View keyView, GboardM3Helper.Palette palette) {
        if (keyView == null || keyView.getVisibility() == View.GONE) return;
        Context ctx = keyView.getContext();

        ViewParent p = keyView.getParent();
        boolean inAccessBar = false;
        boolean inAccessPanel = false;
        boolean inAccessEditTray = false;
        boolean inEmojiNavBar = false;
        boolean isPanelEditButton = keyView.getId() == ID_ACCESS_POINTS_EDIT_BTN;

        int depth = 0;
        while (p instanceof View pv && depth < 10) {
            int pid = pv.getId();
            String pcn = pv.getClass().getName();
            if (pid == ID_ACCESS_POINTS_EDIT_BTN || pid == ID_ACCESS_POINTS_EDIT_HOLDER) {
                isPanelEditButton = true;
            } else if (pid == ID_ACCESS_POINTS_BAR || pcn.endsWith("AccessPointsBar")) {
                inAccessBar = true;
            } else if (pid == ID_ACCESS_POINTS_EDIT_PAGE || pcn.endsWith("AccessPointsPanelEditPage")) {
                inAccessEditTray = true;
                inAccessPanel = true;
            } else if (pid == ID_ACCESS_POINTS_PANEL_V2 || pcn.endsWith("AccessPointsPanelViewPage")
                    || pcn.endsWith("AccessPointsPanel") || pcn.endsWith("AccessPointsPanelV2")) {
                inAccessPanel = true;
            } else if (pid == ID_EMOJI_NAV_BAR || pid == ID_EMOJI_NAV_BAR_SCROLL
                    || pcn.endsWith("ScrollableNavigationView") || pcn.endsWith("FixedHeightNavigationRow")) {
                inEmojiNavBar = true;
            }
            p = pv.getParent();
            depth++;
        }

        if (isPanelEditButton) {
            stylePanelEditPillButton(keyView, palette);
            return;
        }

        if (inAccessPanel) {
            styleAccessPointTilePill(keyView, inAccessEditTray, palette);
            return;
        }

        if (inAccessBar) {
            if (keyView.getParent() instanceof ViewGroup barVg) {
                styleAccessPointsBar(barVg, palette);
            }
            return;
        }

        if (inEmojiNavBar) {
            styleEmojiBottomPillItem(keyView, palette);
            ViewParent np = keyView.getParent();
            int nDepth = 0;
            while (np instanceof View nv && nDepth < 5) {
                int nid = nv.getId();
                String ncn = nv.getClass().getName();
                if (nid == ID_EMOJI_NAV_BAR || nid == ID_EMOJI_NAV_BAR_SCROLL
                        || ncn.endsWith("FixedHeightNavigationRow")
                        || ncn.endsWith("ScrollableNavigationView")) {
                    if (nv instanceof ViewGroup navVg) {
                        hookAndStyleNavBar(navVg, palette);
                    }
                }
                np = nv.getParent();
                nDepth++;
            }
            return;
        }

        if (isInsideCandidatesStrip(keyView)) {
            return;
        }

        int vid = keyView.getId();
        boolean isHeaderLeftSlot = (vid == ID_KEY_HEADER_AP_MENU || vid == ID_KEY_HEADER_POWER
                || keyView.findViewById(ID_SOFT_KEY_POWER_IND) != null);
        boolean isHeaderSlot = isHeaderLeftSlot
                || vid == ID_KEY_HEADER_VOICE || vid == ID_KEY_HEADER_EXTRA_END || vid == ID_KEY_HEADER_EXTRA_START;
        if (isHeaderSlot || isTopHeaderStripKey(keyView)) {
            OrbRole role;
            if (vid == ID_KEY_HEADER_VOICE || isVoiceMicKey(keyView)) {
                role = OrbRole.BLUE_GLOW;
            } else if (isHeaderLeftSlot || isLeftHeaderKey(keyView)) {
                if (isAccessPanelCustomizeMode(keyView)) {
                    role = OrbRole.SMOKED_DARK;
                } else if (isAccessPanelOpenNormalMode(keyView)) {
                    role = OrbRole.PEARL;
                } else {
                    role = OrbRole.SMOKED_LIGHT;
                }
            } else {
                role = OrbRole.PEARL;
            }
            applyOrbKeyStyle(keyView, role, palette);
            return;
        }

        // Standard QWERTY / Number / Functional / Spacebar Keycap
        boolean isFunctional = isFunctionalOrSpaceKey(keyView);
        boolean isSpace = isSpacebarKey(keyView);

        View targetHost = keyView.findViewById(ID_SOFT_KEY_HOST);
        if (targetHost == null) {
            targetHost = keyView;
        }

        String keyTag = "keycap_" + isFunctional + "_" + isSpace + "_" + paletteTag(palette);
        saveOriginalBackgroundOnce(targetHost);
        clearCompetingBackgrounds(keyView, targetHost);
        if (!(targetHost.getBackground() instanceof LiquidGlassKeycapDrawable existing)
                || !keyTag.equals(existing.tag)) {
            Drawable bg = new LiquidGlassKeycapDrawable(ctx, palette, isFunctional, isSpace, keyTag);
            targetHost.setBackground(bg);
            if (targetHost != keyView) {
                targetHost.setDuplicateParentStateEnabled(true);
            }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (targetHost.getForeground() != null) targetHost.setForeground(null);
            if (keyView.getForeground() != null) keyView.setForeground(null);
        }

        tintKeyChildren(keyView, palette, false);
    }

    private static boolean hasMicTagDescendant(View root) {
        if (root == null) return false;
        if (root.getId() == ID_SOFT_KEY_MIC_BG) return true;
        Object t = root.getTag();
        if (t != null && t.toString().contains(".for-mic")) return true;
        if (root instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (hasMicTagDescendant(vg.getChildAt(i))) return true;
            }
        }
        return false;
    }

    private static boolean isTopHeaderStripKey(View keyView) {
        if (keyView.getClass().getName().contains("AccessPointsBarItemSoftKeyView")) {
            return true;
        }
        if (hasMicTagDescendant(keyView)) {
            return true;
        }
        ViewParent p = keyView.getParent();
        if (p instanceof ViewGroup pv) {
            for (int i = 0; i < pv.getChildCount(); i++) {
                View sib = pv.getChildAt(i);
                if (sib.getId() == ID_ACCESS_POINTS_BAR || sib.getClass().getName().endsWith("AccessPointsBar")) {
                    return true;
                }
            }
            ViewParent gp = pv.getParent();
            if (gp instanceof ViewGroup gpv) {
                for (int i = 0; i < gpv.getChildCount(); i++) {
                    View sib = gpv.getChildAt(i);
                    if (sib.getId() == ID_ACCESS_POINTS_BAR || sib.getClass().getName().endsWith("AccessPointsBar")) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    private static boolean isVoiceMicKey(View keyView) {
        if (hasMicTagDescendant(keyView)) {
            return true;
        }
        CharSequence cd = keyView.getContentDescription();
        if (cd != null) {
            String s = cd.toString().toLowerCase(Locale.US);
            if (s.contains("voice") || s.contains("mic") || s.contains("dictat")) {
                return true;
            }
        }
        // Only treat far-right parent header sibling (outside AccessPointsBar) as Voice Mic fallback
        ViewParent p = keyView.getParent();
        if (p instanceof ViewGroup vg && !(vg.getId() == ID_ACCESS_POINTS_BAR)
                && !vg.getClass().getName().endsWith("AccessPointsBar")
                && keyView.getWidth() > 0 && vg.getWidth() > 0) {
            return keyView.getRight() >= vg.getWidth() - dp(keyView.getContext(), 72)
                    && keyView.getHeight() > 0 && keyView.getHeight() <= dp(keyView.getContext(), 72);
        }
        return false;
    }

    private static boolean isLeftHeaderKey(View keyView) {
        if (keyView.findViewById(ID_SOFT_KEY_POWER_IND) != null) {
            return true;
        }
        CharSequence cd = keyView.getContentDescription();
        if (cd != null) {
            String s = cd.toString().toLowerCase(Locale.US);
            if (s.contains("feature") || s.contains("open menu") || s.contains("more")
                    || s.contains("close") || s.contains("done") || s.contains("finish")) {
                return true;
            }
        }
        return keyView.getLeft() <= dp(keyView.getContext(), 64);
    }

    private static boolean isSpacebarKey(View keyView) {
        int w = keyView.getWidth();
        int h = keyView.getHeight();
        if (w > 0 && h > 0 && w >= h * 2.15f) {
            return true;
        }
        CharSequence cd = keyView.getContentDescription();
        if (cd != null) {
            String s = cd.toString().toLowerCase(Locale.US);
            if (s.equals("space") || s.contains("spacebar") || s.contains("english")) {
                return true;
            }
        }
        return false;
    }

    private static boolean isFunctionalOrSpaceKey(View keyView) {
        if (isSpacebarKey(keyView)) return true;
        View icon = keyView.findViewById(ID_SOFT_KEY_ICON);
        if (icon != null && icon.getVisibility() == View.VISIBLE) {
            return true;
        }
        View label = keyView.findViewById(ID_SOFT_KEY_LABEL);
        if (label instanceof TextView tv && tv.getText() != null) {
            String txt = tv.getText().toString().trim();
            if ("?123".equals(txt) || "ABC".equals(txt) || "=\\<".equals(txt)
                    || ",".equals(txt) || ".".equals(txt) || "DONE".equalsIgnoreCase(txt)) {
                return true;
            }
        }
        return false;
    }

    private static void tintKeyChildren(View root, GboardM3Helper.Palette palette, boolean forceWhiteIcon) {
        int ink = forceWhiteIcon ? 0xFFFFFFFF : (palette.isNight ? 0xFFF2F4FF : 0xFF141828);
        int hintInk = palette.isNight ? 0xFFAAB2CE : 0xFF606880;
        tintRecursive(root, ink, hintInk);
    }

    private static void tintRecursive(View v, int primaryInk, int secondaryInk) {
        if (v == null) return;
        int vid = v.getId();
        if (v instanceof ImageView iv && iv.getDrawable() != null) {
            tintImageViewIfChanged(iv, vid == ID_SOFT_KEY_CHEVRON ? secondaryInk : primaryInk);
            return;
        }
        if (v instanceof TextView tv) {
            boolean isHint = vid != ID_SOFT_KEY_LABEL && tv.getTextSize() < dpF(tv.getContext(), 13f);
            setTextColorIfChanged(tv, isHint ? secondaryInk : primaryInk);
            return;
        }
        if (v instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                tintRecursive(vg.getChildAt(i), primaryInk, secondaryInk);
            }
        }
    }

    // =========================================================================
    // 3. AccessPointsBar & AccessPointsPanelV2 (Keyboard.jpg, 1.jpg, 2.jpg)
    // =========================================================================

    private static boolean isAccessPanelCustomizeMode(View anyView) {
        View root = anyView.getRootView();
        if (root == null) return false;
        View editContainer = root.findViewById(ID_ACCESS_POINTS_EDIT_CONTAINER);
        if (editContainer != null && editContainer.getVisibility() == View.VISIBLE) {
            return true;
        }
        View editPage = root.findViewById(ID_ACCESS_POINTS_EDIT_PAGE);
        return editPage != null && editPage.isShown();
    }

    private static boolean isAccessPanelOpenNormalMode(View anyView) {
        View root = anyView.getRootView();
        if (root == null) return false;
        View panel = root.findViewById(ID_ACCESS_POINTS_PANEL_V2);
        if (panel != null && panel.isShown()) {
            return !isAccessPanelCustomizeMode(anyView);
        }
        return false;
    }

    public static void styleAccessPointsBar(ViewGroup bar, GboardM3Helper.Palette palette) {
        if (bar == null) return;
        Context ctx = bar.getContext();
        if (!isLiquidGlassEnabled(ctx)) {
            restoreClassicTree(bar);
            return;
        }
        if (palette == null) {
            palette = GboardM3Helper.Palette.forContext(ctx);
        }
        saveOriginalBackgroundOnce(bar);
        bar.setClipChildren(false);
        bar.setClipToPadding(false);

        boolean customizeMode = isAccessPanelCustomizeMode(bar);
        boolean normalPanelOpen = isAccessPanelOpenNormalMode(bar);

        List<View> orbButtons = new ArrayList<View>();
        for (int i = 0; i < bar.getChildCount(); i++) {
            View c = bar.getChildAt(i);
            if (c.getVisibility() == View.VISIBLE && !(c instanceof android.widget.Space)) {
                orbButtons.add(c);
            }
        }

        View root = bar.getRootView();
        List<View> headerOuterKeys = new ArrayList<View>();
        int[] outerIds = new int[]{
                ID_KEY_HEADER_AP_MENU, ID_KEY_HEADER_POWER,
                ID_KEY_HEADER_VOICE, ID_KEY_HEADER_EXTRA_END, ID_KEY_HEADER_EXTRA_START
        };
        if (root != null) {
            for (int oid : outerIds) {
                View found = root.findViewById(oid);
                if (found != null && found.getVisibility() == View.VISIBLE && !headerOuterKeys.contains(found)) {
                    headerOuterKeys.add(found);
                }
            }
        }
        ViewParent p = bar.getParent();
        if (p instanceof ViewGroup pv) {
            pv.setClipChildren(false);
            pv.setClipToPadding(false);
            for (int i = 0; i < pv.getChildCount(); i++) {
                View sib = pv.getChildAt(i);
                if (sib != bar && sib.getVisibility() == View.VISIBLE
                        && sib.getClass().getName().endsWith("SoftKeyView")
                        && !headerOuterKeys.contains(sib)) {
                    headerOuterKeys.add(sib);
                }
            }
        }

        if (customizeMode) {
            String trackTag = "bar_custom_track_" + paletteTag(palette);
            if (!(bar.getBackground() instanceof LiquidGlassBarOutlineTrackDrawable d) || !trackTag.equals(d.tag)) {
                bar.setBackground(new LiquidGlassBarOutlineTrackDrawable(ctx, palette, trackTag));
            }
        } else {
            if (bar.getBackground() != null) {
                bar.setBackground(null);
            }
        }

        Collections.sort(orbButtons, new Comparator<View>() {
            @Override
            public int compare(View a, View b) {
                return Integer.compare(a.getLeft(), b.getLeft());
            }
        });

        for (int i = 0; i < orbButtons.size(); i++) {
            View item = orbButtons.get(i);
            OrbRole role;
            if (isVoiceMicKey(item)) {
                role = OrbRole.BLUE_GLOW;
            } else if (headerOuterKeys.isEmpty() && i == 0 && !customizeMode) {
                role = normalPanelOpen ? OrbRole.PEARL : OrbRole.SMOKED_DARK;
            } else {
                role = OrbRole.PEARL;
            }
            applyOrbKeyStyle(item, role, palette);
        }

        for (View outer : headerOuterKeys) {
            int oid = outer.getId();
            OrbRole role;
            if (oid == ID_KEY_HEADER_VOICE || isVoiceMicKey(outer)) {
                role = OrbRole.BLUE_GLOW;
            } else if (oid == ID_KEY_HEADER_AP_MENU || oid == ID_KEY_HEADER_POWER || isLeftHeaderKey(outer)) {
                if (customizeMode) {
                    role = OrbRole.SMOKED_DARK;
                } else if (normalPanelOpen) {
                    role = OrbRole.PEARL;
                } else {
                    role = OrbRole.SMOKED_LIGHT;
                }
            } else {
                role = OrbRole.PEARL;
            }
            applyOrbKeyStyle(outer, role, palette);
        }
    }

    private enum OrbRole {
        PEARL,
        SMOKED_LIGHT,
        SMOKED_DARK,
        BLUE_GLOW
    }

    private static void applyOrbKeyStyle(View keyView, OrbRole role, GboardM3Helper.Palette palette) {
        Context ctx = keyView.getContext();
        View host = keyView.findViewById(ID_SOFT_KEY_HOST);
        View target = (host != null && host != keyView && host.getVisibility() == View.VISIBLE && host.getWidth() > 0)
                ? host : keyView;

        View powerInd = keyView.findViewById(ID_SOFT_KEY_POWER_IND);
        if (powerInd != null) {
            saveOriginalBackgroundOnce(powerInd);
            powerInd.setBackground(null);
            powerInd.setBackgroundTintList(null);
        }
        keyView.setBackgroundTintList(null);

        String tag = "orb_role_" + role.name() + "_" + paletteTag(palette);
        saveOriginalBackgroundOnce(target);
        clearCompetingBackgrounds(keyView, target);
        if (!(target.getBackground() instanceof LiquidGlassOrbRoleDrawable existing)
                || !tag.equals(existing.tag)) {
            Drawable orb = new LiquidGlassOrbRoleDrawable(ctx, palette, role, tag);
            target.setBackgroundTintList(null);
            target.setBackground(orb);
            if (target != keyView) {
                target.setDuplicateParentStateEnabled(true);
            }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (target.getForeground() != null) target.setForeground(null);
            if (keyView.getForeground() != null) keyView.setForeground(null);
        }
        boolean whiteIcon = (role == OrbRole.SMOKED_DARK);
        tintKeyChildren(keyView, palette, whiteIcon);
    }

    public static void styleAccessPointsPanel(View panelRoot) {
        if (panelRoot == null) return;
        try {
            Context ctx = panelRoot.getContext();
            if (ctx == null) return;
            if (!isLiquidGlassEnabled(ctx)) {
                restoreClassicTree(panelRoot);
                View root = panelRoot.getRootView();
                if (root != null) {
                    View bar = root.findViewById(ID_ACCESS_POINTS_BAR);
                    if (bar != null) restoreClassicTree(bar);
                }
                return;
            }
            GboardM3Helper.Palette palette = GboardM3Helper.Palette.forContext(ctx);
            styleAccessPointsPanelTree(panelRoot, palette);

            View root = panelRoot.getRootView();
            if (root != null) {
                View bar = root.findViewById(ID_ACCESS_POINTS_BAR);
                if (bar instanceof ViewGroup) {
                    styleAccessPointsBar((ViewGroup) bar, palette);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void styleAccessPointsPanelTree(View view, GboardM3Helper.Palette palette) {
        if (view == null) return;
        Context ctx = view.getContext();
        int vid = view.getId();
        String cn = view.getClass().getName();

        if (vid == ID_ACCESS_POINTS_PANEL_V2 || cn.endsWith("AccessPointsPanelV2")
                || cn.endsWith("AccessPointsPanel")) {
            saveOriginalBackgroundOnce(view);
            int panelColor = palette.isAmoled ? 0xFF000000
                    : (palette.isNight ? GboardM3Helper.blendColor(0xFF141722, palette.windowBackground, 0.55f)
                    : 0xFFECEAF5);
            setBackgroundColorIfChanged(view, panelColor);
            if (view instanceof ViewGroup vg) {
                ensureUnclipped(vg);
            }
        }

        if (vid == ID_ACCESS_POINTS_EDIT_PAGE || cn.endsWith("AccessPointsPanelEditPage")) {
            saveOriginalBackgroundOnce(view);
            String tag = "ap_edit_tray_" + paletteTag(palette);
            if (!(view.getBackground() instanceof LiquidGlassRecessedTrayDrawable d) || !tag.equals(d.tag)) {
                view.setBackground(new LiquidGlassRecessedTrayDrawable(ctx, palette, tag));
                int pad = dp(ctx, 10);
                view.setPadding(pad, pad, pad, pad);
                if (view instanceof ViewGroup vg) {
                    vg.setClipChildren(false);
                    vg.setClipToPadding(false);
                }
            }
        }

        if (cn.endsWith("AccessPointCustomizeHintView") && view instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                View c = vg.getChildAt(i);
                if (c instanceof TextView tv) {
                    tv.setTextColor(palette.isNight ? palette.textSecondary : 0xFF3E445A);
                    tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
                    tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
                }
            }
        }

        if (vid == ID_ACCESS_POINTS_EDIT_BTN) {
            stylePanelEditPillButton(view, palette);
            return;
        }

        if (cn.endsWith("SoftKeyView") && isInsideAccessPointsGrid(view)) {
            styleAccessPointTilePill(view, isInsideEditPage(view), palette);
            return;
        }

        if (view instanceof ViewGroup vg) {
            vg.setClipChildren(false);
            vg.setClipToPadding(false);
            for (int i = 0; i < vg.getChildCount(); i++) {
                styleAccessPointsPanelTree(vg.getChildAt(i), palette);
            }
        }
    }

    private static boolean isInsideAccessPointsGrid(View v) {
        ViewParent p = v.getParent();
        int depth = 0;
        while (p instanceof View pv && depth < 8) {
            int pid = pv.getId();
            String cn = pv.getClass().getName();
            if (pid == ID_ACCESS_POINTS_EDIT_PAGE || pid == ID_ACCESS_POINTS_PAGER
                    || cn.endsWith("AccessPointsPanelViewPage")
                    || cn.endsWith("AccessPointsPanelEditPage")
                    || cn.endsWith("AccessPointsPanel")) {
                return true;
            }
            p = pv.getParent();
            depth++;
        }
        return false;
    }

    private static boolean isInsideEditPage(View v) {
        ViewParent p = v.getParent();
        int depth = 0;
        while (p instanceof View pv && depth < 6) {
            if (pv.getId() == ID_ACCESS_POINTS_EDIT_PAGE
                    || pv.getClass().getName().endsWith("AccessPointsPanelEditPage")) {
                return true;
            }
            p = pv.getParent();
            depth++;
        }
        return false;
    }

    private static void styleAccessPointTilePill(View tile, boolean inEditTray, GboardM3Helper.Palette palette) {
        Context ctx = tile.getContext();
        View host = tile.findViewById(ID_SOFT_KEY_HOST);
        if (host == null) host = tile;

        String tag = "ap_pill_" + inEditTray + "_" + paletteTag(palette);
        saveOriginalBackgroundOnce(host);
        // Strip every inner white/pink background child so only ONE clean 3D Liquid Glass pill renders
        clearCompetingBackgrounds(tile, host);

        if (!(host.getBackground() instanceof LiquidGlassAccessPointPillDrawable existing)
                || !tag.equals(existing.tag)) {
            host.setBackground(new LiquidGlassAccessPointPillDrawable(ctx, palette, tag));
            if (host != tile) {
                host.setDuplicateParentStateEnabled(true);
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (host.getForeground() != null) host.setForeground(null);
                if (tile.getForeground() != null) tile.setForeground(null);
            }

            ViewGroup.LayoutParams tileLp = tile.getLayoutParams();
            int targetH = dp(ctx, inEditTray ? 54 : 58);
            if (tileLp != null) {
                tileLp.height = targetH;
                if (tileLp instanceof ViewGroup.MarginLayoutParams mlp) {
                    int mH = dp(ctx, 3);
                    int mV = dp(ctx, 5);
                    mlp.leftMargin = mH;
                    mlp.rightMargin = mH;
                    mlp.topMargin = mV;
                    mlp.bottomMargin = mV;
                }
                tile.setLayoutParams(tileLp);
            }
            tile.setPadding(0, 0, 0, 0);
            if (host != tile) {
                host.setPadding(dp(ctx, 6), 0, dp(ctx, 6), 0);
            } else {
                tile.setPadding(dp(ctx, 6), 0, dp(ctx, 6), 0);
            }
        }

        View innerConstraint = tile.findViewById(ID_SOFT_KEY_INNER);
        if (innerConstraint != null) {
            innerConstraint.setPadding(dp(ctx, 8), 0, dp(ctx, 8), 0);
        }

        View tileIcon = tile.findViewById(ID_SOFT_KEY_ICON);
        if (tileIcon instanceof ImageView) {
            ViewGroup.LayoutParams ilp = tileIcon.getLayoutParams();
            int sz = dp(ctx, 20);
            if (ilp != null && (ilp.width != sz || ilp.height != sz)) {
                ilp.width = sz;
                ilp.height = sz;
                tileIcon.setLayoutParams(ilp);
            }
        }

        View chevron = tile.findViewById(ID_SOFT_KEY_CHEVRON);
        if (chevron instanceof ImageView) {
            ViewGroup.LayoutParams clp = chevron.getLayoutParams();
            int csz = dp(ctx, 16);
            if (clp != null && (clp.width != csz || clp.height != csz)) {
                clp.width = csz;
                clp.height = csz;
                chevron.setLayoutParams(clp);
            }
        }

        // Prevent marquee scrolling ("ed  One-") and remove excess 12dp marginStart so full names fit cleanly
        TextView labelTv = tile.findViewById(ID_SOFT_KEY_LABEL);
        if (labelTv != null) {
            labelTv.setEllipsize(TextUtils.TruncateAt.END);
            labelTv.setHorizontallyScrolling(false);
            labelTv.setSingleLine(true);
            labelTv.setSelected(false);
            labelTv.setTextSize(TypedValue.COMPLEX_UNIT_DIP, 12.2f);
            labelTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            if (labelTv.getLayoutParams() instanceof ViewGroup.MarginLayoutParams lmlp) {
                int gap = dp(ctx, 6);
                if (lmlp.getMarginStart() != gap) {
                    lmlp.leftMargin = gap;
                    lmlp.setMarginStart(gap);
                    labelTv.setLayoutParams(lmlp);
                }
            }
        }

        tintKeyChildren(tile, palette, false);
    }

    private static void stylePanelEditPillButton(View btn, GboardM3Helper.Palette palette) {
        Context ctx = btn.getContext();
        View host = btn.findViewById(ID_SOFT_KEY_HOST);
        if (host == null) host = btn;
        String tag = "ap_edit_btn_" + paletteTag(palette);
        saveOriginalBackgroundOnce(host);
        clearCompetingBackgrounds(btn, host);
        if (!(host.getBackground() instanceof LiquidGlassCapsuleDrawable d) || !tag.equals(d.tag)) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (btn.getForeground() != null) btn.setForeground(null);
                if (host.getForeground() != null) host.setForeground(null);
            }
            host.setBackground(new LiquidGlassCapsuleDrawable(ctx, palette, false, false, tag));
            if (host != btn) {
                host.setDuplicateParentStateEnabled(true);
            }
            ViewGroup.LayoutParams lp = btn.getLayoutParams();
            if (lp != null) {
                lp.width = dp(ctx, 74);
                lp.height = dp(ctx, 44);
                btn.setLayoutParams(lp);
            }
        }
        tintKeyChildren(btn, palette, false);
    }

    // =========================================================================
    // 4. Emoji Picker Category Strip, Bottom Nav Bar & 3D Glossy Emojis/Flags
    // =========================================================================

    public static void styleEmojiHeaderIcon(final View container) {
        styleEmojiHeaderIconInternal(container, true);
    }

    private static void styleEmojiHeaderIconInternal(final View container, boolean walkUpHeader) {
        if (container == null) return;
        try {
            final Context ctx = container.getContext();
            if (ctx == null) return;
            if (!isLiquidGlassEnabled(ctx)) {
                restoreClassicTree(container);
                if (container.getParent() instanceof View parentTrack) {
                    restoreClassicTree(parentTrack);
                }
                return;
            }
            final GboardM3Helper.Palette palette = GboardM3Helper.Palette.forContext(ctx);

            if (container.getParent() instanceof ViewGroup track) {
                saveOriginalBackgroundOnce(track);
                String trackTag = "emoji_cat_track_" + paletteTag(palette);
                if (!(track.getBackground() instanceof LiquidGlassCategoryStripDrawable d) || !trackTag.equals(d.tag)) {
                    ensureUnclipped(track);
                    track.setBackground(new LiquidGlassCategoryStripDrawable(ctx, palette, trackTag));
                }
            }

            View indicator = container.findViewById(ID_EMOJI_HEADER_INDICATOR);
            if (indicator != null && indicator.getAlpha() != 0f) {
                indicator.setAlpha(0f);
            }

            saveOriginalBackgroundOnce(container);
            String orbTag = "emoji_cat_orb_" + paletteTag(palette);
            if (!(container.getBackground() instanceof LiquidGlassEmojiCategoryOrbDrawable d) || !orbTag.equals(d.tag)) {
                if (container instanceof ViewGroup vg) {
                    ensureUnclipped(vg);
                }
                container.setBackground(new LiquidGlassEmojiCategoryOrbDrawable(ctx, container, palette, orbTag));
                if (!Boolean.TRUE.equals(sHookedHeaderOrbs.get(container))) {
                    sHookedHeaderOrbs.put(container, Boolean.TRUE);
                    container.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> syncEmojiHeaderOrbTint(v));
                }
            }
            syncEmojiHeaderOrbTint(container);

            // Walk up to Emoji header wrapper / SoftKeyboardView and hook once (no direct styleKeyboardTree recursion)
            if (walkUpHeader) {
                ViewParent hp = container.getParent();
                int hDepth = 0;
                while (hp instanceof View hv && hDepth < 8) {
                    int hid = hv.getId();
                    String hcn = hv.getClass().getName();
                    if (hid == ID_EMOJI_HEADER_WRAPPER || hcn.endsWith("ScrollableHeaderViewWrapper")
                            || hcn.endsWith("SoftKeyboardView")) {
                        hookHeaderRootOnce(hv);
                        break;
                    }
                    hp = hv.getParent();
                    hDepth++;
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void hookHeaderRootOnce(final View headerRoot) {
        if (headerRoot == null || Boolean.TRUE.equals(sHookedHeaderRoots.get(headerRoot))) return;
        sHookedHeaderRoots.put(headerRoot, Boolean.TRUE);
        ViewTreeObserver vto = headerRoot.getViewTreeObserver();
        if (vto != null && vto.isAlive()) {
            vto.addOnPreDrawListener(() -> {
                try {
                    Context ctx = headerRoot.getContext();
                    if (ctx != null && isLiquidGlassEnabled(ctx)) {
                        styleKeyboardTree(headerRoot, GboardM3Helper.Palette.forContext(ctx));
                    } else if (ctx != null) {
                        restoreClassicTree(headerRoot);
                    }
                } catch (Throwable ignored) {
                }
                return true;
            });
        }
        try {
            Context ctx = headerRoot.getContext();
            if (ctx != null && isLiquidGlassEnabled(ctx)) {
                styleKeyboardTree(headerRoot, GboardM3Helper.Palette.forContext(ctx));
            }
        } catch (Throwable ignored) {
        }
    }

    private static void hookAndStyleNavBar(final ViewGroup navBar, GboardM3Helper.Palette palette) {
        if (navBar == null) return;
        if (!Boolean.TRUE.equals(sHookedNavBars.get(navBar))) {
            sHookedNavBars.put(navBar, Boolean.TRUE);
            ViewTreeObserver vto = navBar.getViewTreeObserver();
            if (vto != null && vto.isAlive()) {
                vto.addOnPreDrawListener(() -> {
                    try {
                        Context ctx = navBar.getContext();
                        if (ctx != null && isLiquidGlassEnabled(ctx)) {
                            styleEmojiBottomNavBar(navBar, GboardM3Helper.Palette.forContext(ctx));
                        } else if (ctx != null) {
                            restoreClassicTree(navBar);
                        }
                    } catch (Throwable ignored) {
                    }
                    return true;
                });
            }
        }
        styleEmojiBottomNavBar(navBar, palette);
    }

    private static boolean isEmojiCategorySelected(View container) {
        if (container == null) return false;
        if (container.isSelected() || container.isActivated()) return true;
        View ind = container.findViewById(ID_EMOJI_HEADER_INDICATOR);
        return ind != null && ind.getVisibility() == View.VISIBLE;
    }

    private static void syncEmojiHeaderOrbTint(View container) {
        if (container == null || !isLiquidGlassEnabled(container.getContext())) return;
        GboardM3Helper.Palette palette = GboardM3Helper.Palette.forContext(container.getContext());
        boolean selected = isEmojiCategorySelected(container);
        View ind = container.findViewById(ID_EMOJI_HEADER_INDICATOR);
        if (ind != null && ind.getAlpha() != 0f) {
            ind.setAlpha(0f);
        }
        int ink = selected
                ? (palette.isNight ? 0xFFFFFFFF : 0xFF162038)
                : (palette.isNight ? 0xFFDCE2F6 : 0xFF4C5470);
        boolean changed = false;
        View icon = container.findViewById(ID_EMOJI_HEADER_ICON);
        if (icon instanceof ImageView iv) {
            changed = tintImageViewIfChanged(iv, ink);
        }
        Boolean prevSel = sEmojiOrbSelectionState.get(container);
        if (prevSel == null || prevSel.booleanValue() != selected) {
            sEmojiOrbSelectionState.put(container, selected);
            changed = true;
        }
        if (changed) {
            container.invalidate();
        }
    }

    private static void styleEmojiBottomNavBar(ViewGroup bar, GboardM3Helper.Palette palette) {
        saveOriginalBackgroundOnce(bar);
        int navColor = palette.isAmoled ? 0xFF000000
                : (palette.isNight ? GboardM3Helper.blendColor(0xFF141722, palette.windowBackground, 0.55f)
                : 0xFFECEAF5);
        setBackgroundColorIfChanged(bar, navColor);
        ensureUnclipped(bar);
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            int vid = child.getId();
            String ccn = child.getClass().getName();
            if (vid == ID_EMOJI_NAV_DIVIDER) {
                if (child.getVisibility() != View.GONE) {
                    child.setVisibility(View.GONE);
                }
            } else if (vid == ID_EMOJI_NAV_ABC || vid == ID_EMOJI_NAV_DEL) {
                styleEmojiBottomPillItem(child, palette);
            } else if (vid == ID_EMOJI_NAV_RECYCLER && child instanceof ViewGroup rv) {
                ensureUnclipped(rv);
                for (int j = 0; j < rv.getChildCount(); j++) {
                    styleEmojiBottomPillItem(rv.getChildAt(j), palette);
                }
            } else if ((vid == ID_EMOJI_NAV_BAR_SCROLL || ccn.endsWith("ScrollableNavigationView"))
                    && child instanceof ViewGroup innerNav) {
                styleEmojiBottomNavBar(innerNav, palette);
            }
        }
    }

    private static void styleEmojiBottomPillItem(View item, GboardM3Helper.Palette palette) {
        if (item == null || item.getVisibility() == View.GONE) return;
        Context ctx = item.getContext();
        boolean selected = item.isSelected() || item.isActivated();
        if (item instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                View c = vg.getChildAt(i);
                if (c.isSelected() || c.isActivated()) {
                    selected = true;
                }
                if (c instanceof ImageView && c.getId() != ID_EMOJI_NAV_ITEM_ICON && c.getId() != ID_SOFT_KEY_ICON) {
                    saveOriginalBackgroundOnce(c);
                    if (c.getBackground() != null) {
                        c.setBackground(null);
                    }
                    if (c.getBackgroundTintList() != null) {
                        c.setBackgroundTintList(null);
                    }
                    if (c.getVisibility() != View.GONE) {
                        c.setVisibility(View.GONE);
                    }
                }
            }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && item.getForeground() != null) {
            item.setForeground(null);
        }
        View host = item.findViewById(ID_SOFT_KEY_HOST);
        View target = (host != null && host.getVisibility() == View.VISIBLE) ? host : item;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && target.getForeground() != null) {
            target.setForeground(null);
        }

        String tag = "emoji_nav_pill_" + selected + "_" + paletteTag(palette);
        saveOriginalBackgroundOnce(target);
        clearCompetingBackgrounds(item, target);
        if (!(target.getBackground() instanceof LiquidGlassCapsuleDrawable d) || !tag.equals(d.tag)) {
            target.setBackground(new LiquidGlassCapsuleDrawable(ctx, palette, false, selected, tag));
            if (target != item) {
                target.setDuplicateParentStateEnabled(true);
            }
        }
        tintKeyChildren(item, palette, selected && palette.isNight);
    }

    public static Bitmap enhanceEmojiBitmap(View emojiView, Bitmap src) {
        if (src == null || src.isRecycled()) {
            return src;
        }
        if (emojiView == null || !isLiquidGlassEnabled(emojiView.getContext())) {
            return src;
        }
        int w = src.getWidth();
        int h = src.getHeight();
        if (w <= 4 || h <= 4) {
            return src;
        }
        try {
            int genId = Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1
                    ? src.getGenerationId()
                    : System.identityHashCode(src);
            String key = genId + "_" + w + "x" + h;
            Bitmap cached = sEmoji3DCache.get(key);
            if (cached != null && !cached.isRecycled()) {
                return cached;
            }

            Bitmap out = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
            Canvas c = new Canvas(out);

            float insetX = w * 0.045f;
            float insetTop = h * 0.025f;
            float insetBot = h * 0.065f;
            RectF glyphDst = new RectF(insetX, insetTop, w - insetX, h - insetBot);

            Bitmap alphaMask = src.extractAlpha();
            Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
            shadowPaint.setColor(0x46141A30);
            shadowPaint.setMaskFilter(new BlurMaskFilter(Math.max(2f, w * 0.065f), BlurMaskFilter.Blur.NORMAL));
            RectF shadowDst = new RectF(
                    glyphDst.left + w * 0.015f,
                    glyphDst.top + h * 0.045f,
                    glyphDst.right + w * 0.015f,
                    glyphDst.bottom + h * 0.045f);
            c.drawBitmap(alphaMask, null, shadowDst, shadowPaint);
            alphaMask.recycle();

            int layer = c.saveLayer(0, 0, w, h, null);
            Paint bmpPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
            c.drawBitmap(src, null, glyphDst, bmpPaint);

            Paint glossPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            glossPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_ATOP));
            glossPaint.setShader(new RadialGradient(
                    glyphDst.left + glyphDst.width() * 0.30f,
                    glyphDst.top + glyphDst.height() * 0.24f,
                    Math.max(w, h) * 0.56f,
                    new int[]{0x48FFFFFF, 0x16FFFFFF, 0x00FFFFFF, 0x1E10162E},
                    new float[]{0f, 0.38f, 0.72f, 1f},
                    Shader.TileMode.CLAMP));
            c.drawRect(glyphDst, glossPaint);
            c.restoreToCount(layer);

            sEmoji3DCache.put(key, out);
            return out;
        } catch (Throwable ignored) {
            return src;
        }
    }

    // =========================================================================
    // 5. Custom 3D Liquid Glass Keyboard Drawables
    // =========================================================================

    private static final class LiquidGlassKeycapDrawable extends Drawable {
        final String tag;
        private final Context ctx;
        private final GboardM3Helper.Palette palette;
        private final boolean isFunctional;
        private final boolean isSpace;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint innerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final RectF shadowRect = new RectF();
        private final RectF highlightRect = new RectF();
        private boolean pressed;

        LiquidGlassKeycapDrawable(Context ctx, GboardM3Helper.Palette palette,
                                  boolean isFunctional, boolean isSpace, String tag) {
            this.ctx = ctx;
            this.palette = palette;
            this.isFunctional = isFunctional;
            this.isSpace = isSpace;
            this.tag = tag;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override public boolean isStateful() { return true; }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean p = false;
            for (int s : state) {
                if (s == android.R.attr.state_pressed) { p = true; break; }
            }
            if (pressed != p) {
                pressed = p;
                invalidateSelf();
                return true;
            }
            return false;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = ctx.getResources().getDisplayMetrics().density;
            float insetX = 2.0f * d;
            float insetTop = 2.6f * d;
            float insetBot = 3.2f * d;
            rect.set(b.left + insetX, b.top + insetTop, b.right - insetX, b.bottom - insetBot);
            if (rect.width() <= 4f || rect.height() <= 4f) return;

            float radius = (isFunctional || isSpace)
                    ? (Math.min(rect.width(), rect.height()) * 0.50f)
                    : (Math.min(rect.width(), rect.height()) * 0.43f);

            if (!palette.isAmoled) {
                int baseShadow = palette.isNight ? 0x2A000000 : 0x0F1A2040;
                for (int i = 2; i >= 1; i--) {
                    float ex = i * 0.65f * d;
                    shadowPaint.setColor(GboardM3Helper.blendAlpha(baseShadow, i == 2 ? 0.40f : 0.72f));
                    shadowRect.set(rect.left - ex * 0.25f, rect.top + 0.8f * d,
                            rect.right + ex * 0.25f, rect.bottom + (pressed ? 0.4f : 1.1f) * d + ex);
                    canvas.drawRoundRect(shadowRect, radius, radius, shadowPaint);
                }
            }

            int[] bodyColors;
            if (palette.isAmoled) {
                bodyColors = isFunctional
                        ? new int[]{0xFF1A1F30, 0xFF0E121C, 0xFF171C2B}
                        : new int[]{0xFF151926, 0xFF0A0D14, 0xFF121622};
            } else if (palette.isNight) {
                bodyColors = isFunctional
                        ? new int[]{0xFF333952, 0xFF23283C, 0xFF2E344B}
                        : new int[]{0xFF2B3147, 0xFF1D2234, 0xFF272D42};
            } else {
                int top = isFunctional ? 0xFFD2D0E3 : 0xFFE3E2F1;
                int mid = isFunctional ? 0xFFE3E1F1 : 0xFFF1F0FA;
                int bot = isFunctional ? 0xFFF1EFF9 : 0xFFFBFAFE;
                bodyColors = new int[]{top, mid, bot};
            }
            if (pressed) {
                bodyColors = new int[]{
                        GboardM3Helper.blendColor(bodyColors[0], palette.accent, 0.22f),
                        GboardM3Helper.blendColor(bodyColors[1], palette.accent, 0.28f),
                        GboardM3Helper.blendColor(bodyColors[2], palette.accent, 0.18f)
                };
            }
            fillPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.left, rect.bottom,
                    bodyColors, new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(rect, radius, radius, fillPaint);

            float hlH = Math.min(rect.height() * 0.34f, 14f * d);
            highlightRect.set(rect.left + 4f * d, rect.bottom - hlH - 1.5f * d,
                    rect.right - 4f * d, rect.bottom - 1.5f * d);
            int hlColor = palette.isNight ? 0x16FFFFFF : 0x74FFFFFF;
            innerPaint.setShader(new LinearGradient(
                    highlightRect.left, highlightRect.top, highlightRect.left, highlightRect.bottom,
                    0x00FFFFFF, hlColor, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(highlightRect, hlH / 2f, hlH / 2f, innerPaint);

            float strokeW = 1.35f * d;
            rimPaint.setStrokeWidth(strokeW);
            int[] rimColors = palette.isAmoled
                    ? new int[]{0x5AA8C7FA, 0x1CFFFFFF, 0x40A8C7FA}
                    : (palette.isNight
                    ? new int[]{0x55FFFFFF, 0x18FFFFFF, 0x38A8C7FA}
                    : new int[]{0xFCFFFFFF, 0x528893BA, 0xEEFFFFFF});
            rimPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.right, rect.bottom,
                    rimColors, new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
            shadowRect.set(rect.left + strokeW * 0.5f, rect.top + strokeW * 0.5f,
                    rect.right - strokeW * 0.5f, rect.bottom - strokeW * 0.5f);
            canvas.drawRoundRect(shadowRect, radius, radius, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassOrbRoleDrawable extends Drawable {
        final String tag;
        private final Context ctx;
        private final GboardM3Helper.Palette palette;
        private final OrbRole role;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint glossPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path clip = new Path();
        private boolean pressed;

        LiquidGlassOrbRoleDrawable(Context ctx, GboardM3Helper.Palette palette, OrbRole role, String tag) {
            this.ctx = ctx;
            this.palette = palette;
            this.role = role;
            this.tag = tag;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override public boolean isStateful() { return true; }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean p = false;
            for (int s : state) {
                if (s == android.R.attr.state_pressed) { p = true; break; }
            }
            if (pressed != p) {
                pressed = p;
                invalidateSelf();
                return true;
            }
            return false;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = ctx.getResources().getDisplayMetrics().density;
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float radius = (Math.min(b.width(), b.height()) / 2f) - 2.4f * d;
            if (radius <= 2f) return;

            if (role == OrbRole.BLUE_GLOW) {
                shadowPaint.setColor(0x366D80FF);
                canvas.drawCircle(cx, cy + 1.0f * d, radius + 2.2f * d, shadowPaint);
                shadowPaint.setColor(0x1A5B6EF2);
                canvas.drawCircle(cx, cy + 1.2f * d, radius + 3.8f * d, shadowPaint);
            } else if (!palette.isAmoled) {
                int sh = palette.isNight ? 0x2C000000 : 0x0F1A2240;
                for (int i = 2; i >= 1; i--) {
                    shadowPaint.setColor(GboardM3Helper.blendAlpha(sh, i == 2 ? 0.40f : 0.72f));
                    canvas.drawCircle(cx, cy + 1.0f * d * i, radius + 0.6f * d * i, shadowPaint);
                }
            }

            int[] bodyColors;
            if (role == OrbRole.BLUE_GLOW) {
                bodyColors = new int[]{0xFFCBD4FF, 0xFF8899FF, 0xFF6A7EF8};
            } else if (role == OrbRole.SMOKED_DARK) {
                bodyColors = palette.isNight
                        ? new int[]{0xFF565F7A, 0xFF282F44, 0xFF3E4760}
                        : new int[]{0xFF7B8197, 0xFF595E73, 0xFF474C5F};
            } else if (role == OrbRole.SMOKED_LIGHT) {
                bodyColors = palette.isNight
                        ? new int[]{0xFF454E69, 0xFF1F2538, 0xFF333B54}
                        : new int[]{0xFFB5B9CB, 0xFF9EA2B6, 0xFFC8CBE0};
            } else if (palette.isAmoled) {
                bodyColors = new int[]{0xFF273046, 0xFF06080E, 0xFF1B2336};
            } else if (palette.isNight) {
                bodyColors = new int[]{0xFF394466, 0xFF111522, 0xFF2D3754};
            } else {
                bodyColors = new int[]{0xFFDFDDF0, 0xFFEFEFF9, 0xFFFFFFFF};
            }
            if (pressed) {
                bodyColors = new int[]{
                        GboardM3Helper.blendColor(bodyColors[0], palette.accent, 0.25f),
                        GboardM3Helper.blendColor(bodyColors[1], palette.accent, 0.30f),
                        GboardM3Helper.blendColor(bodyColors[2], palette.accent, 0.25f)
                };
            }

            fillPaint.setShader(new LinearGradient(
                    cx - radius * 0.6f, cy - radius * 0.85f,
                    cx + radius * 0.7f, cy + radius * 0.9f,
                    bodyColors, new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawCircle(cx, cy, radius, fillPaint);

            canvas.save();
            clip.reset();
            clip.addCircle(cx, cy, radius, Path.Direction.CW);
            canvas.clipPath(clip);

            if ((palette.isNight || palette.isAmoled) && role != OrbRole.BLUE_GLOW) {
                int domeTop = palette.isAmoled ? 0x6AFFFFFF : 0x7AFFFFFF;
                glossPaint.setShader(new RadialGradient(
                        cx - radius * 0.35f, cy - radius * 0.37f, radius * 0.78f,
                        new int[]{domeTop, 0x26FFFFFF, 0x00FFFFFF},
                        new float[]{0f, 0.48f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawCircle(cx - radius * 0.24f, cy - radius * 0.28f, radius * 0.78f, glossPaint);

                float glintX = cx - radius * 0.34f;
                float glintY = cy - radius * 0.36f;
                canvas.save();
                canvas.rotate(-36f, glintX, glintY);
                glossPaint.setShader(new RadialGradient(
                        glintX, glintY, radius * 0.32f,
                        new int[]{0xB2FFFFFF, 0x3EFFFFFF, 0x00FFFFFF},
                        new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawOval(glintX - radius * 0.28f, glintY - radius * 0.14f,
                        glintX + radius * 0.28f, glintY + radius * 0.14f, glossPaint);
                canvas.restore();

                int caustic = GboardM3Helper.blendAlpha(
                        GboardM3Helper.blendColor(palette.accent, 0xFFFFFFFF, 0.48f),
                        palette.isAmoled ? 0.40f : 0.46f);
                glossPaint.setShader(new RadialGradient(
                        cx + radius * 0.22f, cy + radius * 0.56f, radius * 0.60f,
                        new int[]{caustic, 0x22FFFFFF, 0x00FFFFFF},
                        new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawCircle(cx + radius * 0.18f, cy + radius * 0.54f, radius * 0.60f, glossPaint);
            } else {
                glossPaint.setShader(new RadialGradient(
                        cx - radius * 0.35f, cy - radius * 0.4f, radius * 0.85f,
                        new int[]{(role == OrbRole.SMOKED_DARK || role == OrbRole.SMOKED_LIGHT) ? 0x52FFFFFF : 0xACFFFFFF, 0x00FFFFFF},
                        new float[]{0f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawCircle(cx - radius * 0.22f, cy - radius * 0.3f, radius * 0.8f, glossPaint);

                glossPaint.setShader(new RadialGradient(
                        cx, cy + radius * 0.72f, radius * 0.5f,
                        new int[]{role == OrbRole.BLUE_GLOW ? 0x44C8D4FF : 0x58FFFFFF, 0x00FFFFFF},
                        new float[]{0f, 1f}, Shader.TileMode.CLAMP));
                canvas.drawCircle(cx, cy + radius * 0.68f, radius * 0.5f, glossPaint);
            }
            canvas.restore();

            float strokeW = 1.45f * d;
            rimPaint.setStrokeWidth(strokeW);
            int[] rimColors = (role == OrbRole.SMOKED_DARK || role == OrbRole.SMOKED_LIGHT)
                    ? (palette.isNight
                    ? new int[]{0xD8FFFFFF, 0x28FFFFFF, GboardM3Helper.blendAlpha(GboardM3Helper.blendColor(palette.accent, 0xFFFFFFFF, 0.45f), 0.64f)}
                    : new int[]{0xF0FFFFFF, 0x448088A4, 0xB8FFFFFF})
                    : (role == OrbRole.BLUE_GLOW
                    ? new int[]{0xF8FFFFFF, 0x668494FF, 0xE6C6D0FF}
                    : (palette.isNight || palette.isAmoled
                    ? new int[]{0xCCFFFFFF, 0x24FFFFFF, GboardM3Helper.blendAlpha(GboardM3Helper.blendColor(palette.accent, 0xFFFFFFFF, 0.48f), 0.62f)}
                    : new int[]{0xFCFFFFFF, 0x468894B8, 0xEEFFFFFF}));
            rimPaint.setShader(new LinearGradient(
                    cx - radius, cy - radius, cx + radius, cy + radius,
                    rimColors, new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawCircle(cx, cy, radius - strokeW * 0.5f, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassAccessPointPillDrawable extends Drawable {
        final String tag;
        private final Context ctx;
        private final GboardM3Helper.Palette palette;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint glossPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final RectF inner = new RectF();
        private boolean pressed;

        LiquidGlassAccessPointPillDrawable(Context ctx, GboardM3Helper.Palette palette, String tag) {
            this.ctx = ctx;
            this.palette = palette;
            this.tag = tag;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override public boolean isStateful() { return true; }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean p = false;
            for (int s : state) {
                if (s == android.R.attr.state_pressed) { p = true; break; }
            }
            if (pressed != p) {
                pressed = p;
                invalidateSelf();
                return true;
            }
            return false;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = ctx.getResources().getDisplayMetrics().density;
            float pad = 1.6f * d;
            rect.set(b.left + pad, b.top + pad, b.right - pad, b.bottom - pad);
            if (rect.width() <= 8f || rect.height() <= 8f) return;
            float r = rect.height() / 2f;

            if (!palette.isAmoled) {
                int sh = palette.isNight ? 0x28000000 : 0x0E192242;
                for (int i = 2; i >= 1; i--) {
                    float ex = i * 0.65f * d;
                    shadowPaint.setColor(GboardM3Helper.blendAlpha(sh, i == 2 ? 0.40f : 0.72f));
                    inner.set(rect.left - ex * 0.25f, rect.top + 0.9f * d,
                            rect.right + ex * 0.25f, rect.bottom + 1.1f * d + ex);
                    canvas.drawRoundRect(inner, r, r, shadowPaint);
                }
            }

            int[] body = palette.isAmoled
                    ? new int[]{0xFF151926, 0xFF0A0D15, 0xFF121622}
                    : (palette.isNight
                    ? new int[]{0xFF2A3046, 0xFF1E2335, 0xFF262C40}
                    : new int[]{0xFFDFDDF0, 0xFFF1F0FA, 0xFFFAF9FE});
            if (pressed) {
                body = new int[]{
                        GboardM3Helper.blendColor(body[0], palette.accent, 0.22f),
                        GboardM3Helper.blendColor(body[1], palette.accent, 0.28f),
                        GboardM3Helper.blendColor(body[2], palette.accent, 0.20f)
                };
            }
            fillPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.left, rect.bottom,
                    body, new float[]{0f, 0.52f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(rect, r, r, fillPaint);

            inner.set(rect.left + 8f * d, rect.top + 1.4f * d, rect.right - 8f * d, rect.top + rect.height() * 0.42f);
            glossPaint.setShader(new LinearGradient(
                    inner.left, inner.top, inner.left, inner.bottom,
                    palette.isNight ? 0x22FFFFFF : 0x8CFFFFFF, 0x00FFFFFF, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(inner, inner.height() / 2f, inner.height() / 2f, glossPaint);

            float sw = 1.45f * d;
            rimPaint.setStrokeWidth(sw);
            int[] rim = palette.isAmoled
                    ? new int[]{0x66A8C7FA, 0x20FFFFFF, 0x48A8C7FA}
                    : (palette.isNight
                    ? new int[]{0x55FFFFFF, 0x1AFFFFFF, 0x40A8C7FA}
                    : new int[]{0xFEFFFFFF, 0x488894B8, 0xEEFFFFFF});
            rimPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.right, rect.bottom,
                    rim, new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
            inner.set(rect.left + sw * 0.5f, rect.top + sw * 0.5f, rect.right - sw * 0.5f, rect.bottom - sw * 0.5f);
            canvas.drawRoundRect(inner, r, r, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassCapsuleDrawable extends Drawable {
        final String tag;
        private final Context ctx;
        private final GboardM3Helper.Palette palette;
        private final boolean smoked;
        private final boolean blueSelected;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint glossPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final RectF inner = new RectF();
        private boolean pressed;

        LiquidGlassCapsuleDrawable(Context ctx, GboardM3Helper.Palette palette,
                                   boolean smoked, boolean blueSelected, String tag) {
            this.ctx = ctx;
            this.palette = palette;
            this.smoked = smoked;
            this.blueSelected = blueSelected;
            this.tag = tag;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override public boolean isStateful() { return true; }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean p = false;
            for (int s : state) {
                if (s == android.R.attr.state_pressed) { p = true; break; }
            }
            if (pressed != p) {
                pressed = p;
                invalidateSelf();
                return true;
            }
            return false;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = ctx.getResources().getDisplayMetrics().density;
            float pad = 2.0f * d;
            rect.set(b.left + pad, b.top + pad, b.right - pad, b.bottom - pad);
            if (rect.width() <= 4f || rect.height() <= 4f) return;
            float r = rect.height() / 2f;

            if (blueSelected) {
                shadowPaint.setColor(0x32647AFF);
                inner.set(rect.left - 1.2f * d, rect.top, rect.right + 1.2f * d, rect.bottom + 1.8f * d);
                canvas.drawRoundRect(inner, r, r, shadowPaint);
            } else if (!palette.isAmoled) {
                shadowPaint.setColor(palette.isNight ? 0x26000000 : 0x0E1A2240);
                inner.set(rect.left, rect.top + 0.9f * d, rect.right, rect.bottom + 1.3f * d);
                canvas.drawRoundRect(inner, r, r, shadowPaint);
            }

            int[] body;
            if (blueSelected) {
                body = palette.isNight
                        ? new int[]{0xFF6B8BFF, 0xFF4267EA, 0xFF2F53D4}
                        : new int[]{0xFFE6EAFF, 0xFFB8C4FF, 0xFF97A9FA};
            } else if (smoked) {
                body = new int[]{0xFF72788F, 0xFF51566B, 0xFF43485A};
            } else if (palette.isAmoled) {
                body = new int[]{0xFF161A28, 0xFF0A0D16, 0xFF131724};
            } else if (palette.isNight) {
                body = new int[]{0xFF2B3146, 0xFF1D2234, 0xFF272D41};
            } else {
                body = new int[]{0xFFDFDDF0, 0xFFEEEEF8, 0xFFFBFBFF};
            }
            fillPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.left, rect.bottom,
                    body, new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(rect, r, r, fillPaint);

            inner.set(rect.left + 6f * d, rect.top + 1.5f * d, rect.right - 6f * d, rect.top + rect.height() * 0.45f);
            glossPaint.setShader(new LinearGradient(
                    inner.left, inner.top, inner.left, inner.bottom,
                    palette.isNight && !blueSelected ? 0x24FFFFFF : 0x96FFFFFF,
                    0x00FFFFFF, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(inner, inner.height() / 2f, inner.height() / 2f, glossPaint);

            float sw = 1.45f * d;
            rimPaint.setStrokeWidth(sw);
            int[] rim = blueSelected
                    ? new int[]{0xF6FFFFFF, 0x708FA0FF, 0xE6CBD4FF}
                    : (palette.isNight
                    ? new int[]{0x55FFFFFF, 0x1AFFFFFF, 0x42A8C7FA}
                    : new int[]{0xFCFFFFFF, 0x488894B8, 0xEEFFFFFF});
            rimPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.right, rect.bottom,
                    rim, new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
            inner.set(rect.left + sw * 0.5f, rect.top + sw * 0.5f, rect.right - sw * 0.5f, rect.bottom - sw * 0.5f);
            canvas.drawRoundRect(inner, r, r, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassRecessedTrayDrawable extends Drawable {
        final String tag;
        private final Context ctx;
        private final GboardM3Helper.Palette palette;
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint innerShadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final RectF inner = new RectF();

        LiquidGlassRecessedTrayDrawable(Context ctx, GboardM3Helper.Palette palette, String tag) {
            this.ctx = ctx;
            this.palette = palette;
            this.tag = tag;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = ctx.getResources().getDisplayMetrics().density;
            float pad = 2.0f * d;
            rect.set(b.left + pad, b.top + pad, b.right - pad, b.bottom - pad);
            float r = 28.0f * d;

            int[] trayColors = palette.isAmoled
                    ? new int[]{0xFF0A0C14, 0xFF0E111B}
                    : (palette.isNight
                    ? new int[]{0xFF151928, 0xFF1D2234}
                    : new int[]{0xFFDAD7EB, 0xFFE6E4F3});
            fillPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.left, rect.bottom,
                    trayColors[0], trayColors[1], Shader.TileMode.CLAMP));
            canvas.drawRoundRect(rect, r, r, fillPaint);

            inner.set(rect.left + 2f * d, rect.top + 1.5f * d, rect.right - 2f * d, rect.top + 16f * d);
            innerShadowPaint.setShader(new LinearGradient(
                    inner.left, inner.top, inner.left, inner.bottom,
                    palette.isNight ? 0x55000000 : 0x26656E94, 0x00000000, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(inner, r, r, innerShadowPaint);

            float sw = 1.4f * d;
            rimPaint.setStrokeWidth(sw);
            rimPaint.setColor(palette.isNight ? 0x38A8C7FA : 0xD8FFFFFF);
            inner.set(rect.left + sw * 0.5f, rect.top + sw * 0.5f, rect.right - sw * 0.5f, rect.bottom - sw * 0.5f);
            canvas.drawRoundRect(inner, r, r, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassBarOutlineTrackDrawable extends Drawable {
        final String tag;
        private final Context ctx;
        private final GboardM3Helper.Palette palette;
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        LiquidGlassBarOutlineTrackDrawable(Context ctx, GboardM3Helper.Palette palette, String tag) {
            this.ctx = ctx;
            this.palette = palette;
            this.tag = tag;
            strokePaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = ctx.getResources().getDisplayMetrics().density;
            float sw = 1.75f * d;
            rect.set(b.left + sw, b.top + sw, b.right - sw, b.bottom - sw);
            float r = rect.height() / 2f;

            fillPaint.setColor(palette.isNight ? 0x18FFFFFF : 0x2AFFFFFF);
            canvas.drawRoundRect(rect, r, r, fillPaint);

            strokePaint.setStrokeWidth(sw);
            strokePaint.setColor(palette.isNight ? 0xAA8894B8 : 0xFF565C70);
            canvas.drawRoundRect(rect, r, r, strokePaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassCategoryStripDrawable extends Drawable {
        final String tag;
        private final Context ctx;
        private final GboardM3Helper.Palette palette;
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();

        LiquidGlassCategoryStripDrawable(Context ctx, GboardM3Helper.Palette palette, String tag) {
            this.ctx = ctx;
            this.palette = palette;
            this.tag = tag;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;
            float d = ctx.getResources().getDisplayMetrics().density;
            float pad = 2.0f * d;
            rect.set(b.left + pad, b.top + pad, b.right - pad, b.bottom - pad);
            float r = rect.height() / 2f;

            fillPaint.setShader(new LinearGradient(
                    rect.left, rect.top, rect.left, rect.bottom,
                    palette.isAmoled
                            ? new int[]{0xFF0E111A, 0xFF141824}
                            : (palette.isNight
                            ? new int[]{0xFF1E2232, 0xFF262B3E}
                            : new int[]{0xFFE3E1F2, 0xFFEEEDF8}),
                    null, Shader.TileMode.CLAMP));
            canvas.drawRoundRect(rect, r, r, fillPaint);

            rimPaint.setStrokeWidth(1.2f * d);
            rimPaint.setColor(palette.isNight ? 0x35FFFFFF : 0xDEFFFFFF);
            canvas.drawRoundRect(rect, r, r, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class LiquidGlassEmojiCategoryOrbDrawable extends Drawable {
        final String tag;
        private final Context ctx;
        private final View container;
        private final GboardM3Helper.Palette palette;
        private final Paint shadowPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint glossPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint rimPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path clip = new Path();

        LiquidGlassEmojiCategoryOrbDrawable(Context ctx, View container, GboardM3Helper.Palette palette, String tag) {
            this.ctx = ctx;
            this.container = container;
            this.palette = palette;
            this.tag = tag;
            rimPaint.setStyle(Paint.Style.STROKE);
        }

        @Override public boolean isStateful() { return true; }

        @Override
        protected boolean onStateChange(int[] state) {
            invalidateSelf();
            return true;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;

            float d = ctx.getResources().getDisplayMetrics().density;
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float radius = (Math.min(b.width(), b.height()) / 2f) - 2.6f * d;
            if (radius <= 2f) return;

            boolean selected = isEmojiCategorySelected(container);
            // Match Emojis.jpg & Flagemoji.png: only the selected tab renders the blue glowing water-drop orb;
            // unselected tabs rest directly inside the unified pearlescent glass strip track.
            if (!selected) {
                return;
            }

            shadowPaint.setColor(palette.isNight ? 0x483E7BFF : 0x3658A0FF);
            canvas.drawCircle(cx, cy + 1.0f * d, radius + 2.2f * d, shadowPaint);
            shadowPaint.setColor(palette.isNight ? 0x242D66E6 : 0x1A4890F5);
            canvas.drawCircle(cx, cy + 1.2f * d, radius + 3.6f * d, shadowPaint);

            int[] body = palette.isNight
                    ? new int[]{0xFF72AEFF, 0xFF3E7BF2, 0xFF285EE0}
                    : new int[]{0xFFE6F3FF, 0xFFB8DAFF, 0xFF9AC6FF};

            fillPaint.setShader(new LinearGradient(
                    cx - radius * 0.65f, cy - radius * 0.8f,
                    cx + radius * 0.7f, cy + radius * 0.9f,
                    body, new float[]{0f, 0.55f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawCircle(cx, cy, radius, fillPaint);

            canvas.save();
            clip.reset();
            clip.addCircle(cx, cy, radius, Path.Direction.CW);
            canvas.clipPath(clip);
            glossPaint.setShader(new RadialGradient(
                    cx - radius * 0.35f, cy - radius * 0.4f, radius * 0.82f,
                    new int[]{palette.isNight ? 0x58FFFFFF : 0x92FFFFFF, 0x00FFFFFF},
                    new float[]{0f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawCircle(cx - radius * 0.22f, cy - radius * 0.3f, radius * 0.8f, glossPaint);
            canvas.restore();

            float sw = 1.35f * d;
            rimPaint.setStrokeWidth(sw);
            int[] rim = palette.isNight
                    ? new int[]{0xF4FFFFFF, 0x584488FF, 0xC8B8D6FF}
                    : new int[]{0xFCFFFFFF, 0x626BA8FF, 0xEEFFFFFF};
            rimPaint.setShader(new LinearGradient(
                    cx - radius, cy - radius, cx + radius, cy + radius,
                    rim, new float[]{0f, 0.5f, 1f}, Shader.TileMode.CLAMP));
            canvas.drawCircle(cx, cy, radius - sw * 0.5f, rimPaint);
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter colorFilter) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
