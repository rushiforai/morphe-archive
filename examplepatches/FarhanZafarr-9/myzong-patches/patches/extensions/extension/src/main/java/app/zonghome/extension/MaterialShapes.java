package app.zonghome.extension;

import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;

/** Shape hierarchy for the Home and Usage surfaces. */
public final class MaterialShapes {
    private MaterialShapes() {}
    private static final WeakHashMap<Drawable, Float> LEGACY_RADII = new WeakHashMap<>();
    private static final java.util.HashMap<Class<?>, java.lang.reflect.Method[]> CARD_METHODS = new java.util.HashMap<>();
    private static final java.util.HashMap<Class<?>, java.lang.reflect.Method[]> BUTTON_METHODS = new java.util.HashMap<>();
    private static final ColorStateList SECONDARY_FILL = new ColorStateList(
        new int[][]{{-android.R.attr.state_enabled}, {}},
        new int[]{CharcoalTheme.SURFACE, CharcoalTheme.RAISED});
    private static final ColorStateList SECONDARY_TEXT = new ColorStateList(
        new int[][]{{-android.R.attr.state_enabled}, {}},
        new int[]{CharcoalTheme.MUTED, CharcoalTheme.TEXT});
    private static final Set<String> CARDS = new HashSet<>(Arrays.asList(
        "cardInternet", "cardMins", "cardSms", "cardTray", "card_view_myob",
        "card_regional_offers", "cardViewWidget", "cardFamilyBundle", "cardViewStreak", "cardViewStreakDetail"
    ));
    private static final Set<String> BUTTONS = new HashSet<>(Arrays.asList(
        "btnLoan", "btnPayLoan", "btnRecharge", "btnMyPlan", "btnPayBill", "btnGetReward",
        "btnGetDiscount", "btnSubscribe", "btnUnSub"
    ));
    private static final Set<String> PANELS = new HashSet<>(Arrays.asList(
        "llResources", "ll_resources", "rootBundleInfoItem", "btnFavourite"
    ));
    private static final Set<String> CHIPS = new HashSet<>(Arrays.asList("btn_monthly", "btn_weekly", "btn_daily"));

    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }
    private static String name(View view) { return ViewNames.name(view); }
    public static void apply(View root) {
        if (root.getVisibility() != View.VISIBLE) return;
        if (OnboardingStyling.isRoot(root)) return;
        if (BundleVisuals.isOfferList(root)) { BundleVisuals.stabilize(root); return; }
        style(root);
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) apply(group.getChildAt(i));
        }
    }
    private static void style(View view) {
        String id = name(view);
        if (CARDS.contains(id)) {
            cardRadius(view, dp(view, 20));
            radius(view.getBackground(), dp(view, 20));
            if (id.equals("cardTray") || id.equals("card_regional_offers")) {
                int padding = dp(view, 16);
                try {
                    Number current = (Number) view.getClass().getMethod("getContentPaddingLeft").invoke(view);
                    if (current.intValue() != padding)
                        view.getClass().getMethod("setContentPadding", int.class, int.class, int.class, int.class)
                            .invoke(view, padding, padding, padding, padding);
                } catch (ReflectiveOperationException ignored) { }
            }
        }
        if (id.equals("btnFavourite") && view instanceof android.widget.ImageView) {
            styleFavorite((android.widget.ImageView)view);
        } else if (id.equals("llResources")) styleResourceGrid(view);
        else if (id.equals("ll_resources") || id.equals("rootBundleInfoItem")) styleStandaloneCell(view);
        else if (PANELS.contains(id)) radius(view.getBackground(), dp(view, 8));
        // Usage subscription headers and detail rows form one connected card.
        if (id.equals("cardHeader") || id.equals("cardInfo")) roundExistingCorners(view.getBackground(), dp(view, 20));
        if (BUTTONS.contains(id) && view instanceof Button) {
            boolean secondary = id.equals("btnUnSub");
            if (secondary) {
                if (view.getBackgroundTintList() != SECONDARY_FILL) view.setBackgroundTintList(SECONDARY_FILL);
                Button button = (Button) view;
                if (button.getTextColors() != SECONDARY_TEXT) button.setTextColor(SECONDARY_TEXT);
            }
            buttonRadius(view, dp(view, secondary ? 12 : 24));
            int height = Math.round(dp(view, 48) * Math.max(1f, view.getResources().getConfiguration().fontScale));
            ViewGroup.LayoutParams params = view.getLayoutParams();
            if (params != null && params.height >= 0 && params.height < height) {
                params.height = height;
                view.setLayoutParams(params);
            }
            if (view.getMinimumHeight() < height) view.setMinimumHeight(height);
            int padding = dp(view, 16);
            if (view.getPaddingStart() < padding || view.getPaddingEnd() < padding)
                view.setPaddingRelative(Math.max(padding, view.getPaddingStart()), view.getPaddingTop(),
                    Math.max(padding, view.getPaddingEnd()), view.getPaddingBottom());
        }
        if (CHIPS.contains(id) && view instanceof android.widget.TextView) ChipStyling.style((android.widget.TextView)view);
        if (id.equals("ribbonBgImage") && view instanceof android.widget.ImageView) styleRibbon((android.widget.ImageView)view);
    }
    private static final class ResourceCell extends GradientDrawable {
        ResourceCell(View view) {
            setColor(CharcoalTheme.RAISED);
            setStroke(Math.max(1, dp(view, 1)), CharcoalTheme.TRACK);
            setCornerRadius(dp(view, 8));
        }
    }
    private static void styleCell(View cell) {
        if (!(cell.getBackground() instanceof ResourceCell)) cell.setBackground(new ResourceCell(cell));
        if (cell.getBackgroundTintList() != null) cell.setBackgroundTintList(null);
        if (!cell.getClipToOutline()) cell.setClipToOutline(true);
    }
    public static void styleResourceGrid(View grid) {
        if (grid.getBackground() != null) grid.setBackground(null);
        if (grid.getClipToOutline()) grid.setClipToOutline(false);
        boolean previousRow = false;
        for (String name : new String[]{"row1", "row2"}) {
            View row = ViewNames.find(grid, name);
            if (!(row instanceof ViewGroup) || row.getVisibility() != View.VISIBLE) continue;
            ViewGroup group = (ViewGroup)row;
            int visible = 0;
            for (int i = 0; i < group.getChildCount(); i++) {
                View cell = group.getChildAt(i);
                if (cell.getVisibility() != View.VISIBLE || !ViewNames.name(cell).startsWith("info")) continue;
                styleCell(cell);
                if (cell.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams)cell.getLayoutParams();
                    int start = visible == 0 ? 0 : dp(cell, 6);
                    if (margins.getMarginStart() != start || margins.getMarginEnd() != 0) {
                        margins.setMarginStart(start); margins.setMarginEnd(0); cell.setLayoutParams(margins);
                    }
                }
                visible++;
            }
            if (row.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams)row.getLayoutParams();
                int top = previousRow && visible > 0 ? dp(row, 6) : 0;
                if (margins.topMargin != top) { margins.topMargin = top; row.setLayoutParams(margins); }
            }
            previousRow |= visible > 0;
        }
    }
    public static void styleStandaloneCell(View cell) {
        styleCell(cell);
        if (cell.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams)cell.getLayoutParams();
            int gap = dp(cell, 3);
            if (margins.getMarginStart() != gap || margins.getMarginEnd() != gap || margins.topMargin != gap || margins.bottomMargin != gap) {
                margins.setMarginStart(gap); margins.setMarginEnd(gap); margins.topMargin = gap; margins.bottomMargin = gap;
                cell.setLayoutParams(margins);
            }
        }
    }
    private static final class RibbonBadge extends GradientDrawable {
        RibbonBadge(View view) { setColor(CharcoalTheme.RAISED); setCornerRadius(dp(view, 1000)); }
    }
    private static void styleRibbon(android.widget.ImageView image) {
        if (!(image.getParent() instanceof View)) return;
        View parent=(View)image.getParent();
        View labelView=ViewNames.find(parent,"tvFlagName");
        if (!(labelView instanceof android.widget.TextView)) return;
        android.widget.TextView label=(android.widget.TextView)labelView;
        View tail=ViewNames.find(parent,"ivFlag");
        if(tail!=null && tail.getVisibility()!=View.INVISIBLE)tail.setVisibility(View.INVISIBLE);
        if(image.getVisibility()!=View.INVISIBLE)image.setVisibility(View.INVISIBLE);
        if(!(label.getBackground() instanceof RibbonBadge))label.setBackground(new RibbonBadge(label));
        if(label.getBackgroundTintList()!=null)label.setBackgroundTintList(null);
        if(label.getCurrentTextColor()!=CharcoalTheme.TEXT)label.setTextColor(CharcoalTheme.TEXT);
        if(label.getAlpha()!=1f)label.setAlpha(1f);
        if(label.getGravity()!=android.view.Gravity.CENTER)label.setGravity(android.view.Gravity.CENTER);
        int padding=dp(label,8);
        if(label.getPaddingStart()!=padding || label.getPaddingEnd()!=padding)label.setPaddingRelative(padding,0,padding,0);
        int width=Math.max(dp(image,40),Math.round(label.getPaint().measureText(label.getText().toString()))+padding*2);
        int height=Math.round(dp(image,24)*Math.max(1f,image.getResources().getConfiguration().fontScale));
        ViewGroup.LayoutParams params=image.getLayoutParams();
        if(params!=null && (params.width!=width || params.height!=height)){params.width=width;params.height=height;image.setLayoutParams(params);}
        ViewGroup.LayoutParams labelParams=label.getLayoutParams();
        if(labelParams!=null) {
            boolean changed=labelParams.height!=height;
            labelParams.height=height;
            try {
                java.lang.reflect.Field bias=labelParams.getClass().getField("horizontalBias");
                if(bias.getFloat(labelParams)!=0.5f){bias.setFloat(labelParams,0.5f);changed=true;}
            } catch(ReflectiveOperationException ignored) { }
            if(changed)label.setLayoutParams(labelParams);
        }
    }
    public static void styleFavorite(android.widget.ImageView view) {
        if (!(view.getBackground() instanceof FavoriteSurface)) view.setBackground(new FavoriteSurface(view));
        if (view.getBackgroundTintList() != null) view.setBackgroundTintList(null);
        Drawable previous = view.getDrawable();
        Drawable sized = SizedIcon.wrap(previous, dp(view, 16));
        if (sized != previous) view.setImageDrawable(sized);
        if (view.getScaleType() != android.widget.ImageView.ScaleType.CENTER_INSIDE)
            view.setScaleType(android.widget.ImageView.ScaleType.CENTER_INSIDE);
        int horizontal = dp(view, 8), vertical = dp(view, 4);
        if (view.getPaddingTop() != vertical || view.getPaddingBottom() != vertical || view.getPaddingLeft() != horizontal)
            view.setPadding(horizontal, vertical, horizontal, vertical);
    }
    private static final class FavoriteSurface extends GradientDrawable {
        FavoriteSurface(View view) {
            setColor(CharcoalTheme.tabIndicatorColor(view,CharcoalTheme.ACCENT));
            setCornerRadius(dp(view, 8));
        }
    }
    private static void cardRadius(View view, float radius) {
        Class<?> type = view.getClass();
        java.lang.reflect.Method[] methods = CARD_METHODS.get(type);
        if (methods == null) {
            try {
                methods = new java.lang.reflect.Method[]{type.getMethod("getRadius"), type.getMethod("setRadius", float.class),
                    type.getMethod("getCardElevation"), type.getMethod("setCardElevation", float.class)};
            } catch (NoSuchMethodException ignored) { methods = new java.lang.reflect.Method[0]; }
            CARD_METHODS.put(type, methods);
        }
        if (methods.length == 0) return;
        try {
            if (((Number)methods[0].invoke(view)).floatValue() != radius) methods[1].invoke(view, radius);
            if (((Number)methods[2].invoke(view)).floatValue() != 0) methods[3].invoke(view, 0f);
        } catch (ReflectiveOperationException ignored) { }
    }
    static void buttonRadius(View view, int radius) {
        Class<?> type = view.getClass();
        java.lang.reflect.Method[] methods = BUTTON_METHODS.get(type);
        if (methods == null) {
            try { methods = new java.lang.reflect.Method[]{type.getMethod("getCornerRadius"), type.getMethod("setCornerRadius", int.class)}; }
            catch (NoSuchMethodException ignored) { methods = new java.lang.reflect.Method[0]; }
            BUTTON_METHODS.put(type, methods);
        }
        if (methods.length == 0) { radius(view.getBackground(), radius); return; }
        try {
            if (((Number)methods[0].invoke(view)).intValue() != radius) methods[1].invoke(view, radius);
        } catch (ReflectiveOperationException ignored) { }
    }
    private static void roundExistingCorners(Drawable drawable, float radius) {
        if (Build.VERSION.SDK_INT < 24) return;
        if (drawable instanceof GradientDrawable) {
            GradientDrawable shape = (GradientDrawable) drawable.mutate();
            float[] corners = shape.getCornerRadii();
            if (corners != null) {
                boolean changed = false;
                for (int i = 0; i < corners.length; i++) {
                    if (corners[i] > 0 && corners[i] != radius) { corners[i] = radius; changed = true; }
                }
                if (changed) shape.setCornerRadii(corners);
            } else if (shape.getCornerRadius() > 0 && shape.getCornerRadius() != radius) shape.setCornerRadius(radius);
        }
    }
    private static void radius(Drawable drawable, float radius) {
        if (drawable instanceof GradientDrawable) {
            GradientDrawable shape = (GradientDrawable) drawable.mutate();
            if (Build.VERSION.SDK_INT >= 24) {
                if (shape.getCornerRadius() != radius) shape.setCornerRadius(radius);
            } else if (!Float.valueOf(radius).equals(LEGACY_RADII.get(drawable))) {
                shape.setCornerRadius(radius);
                LEGACY_RADII.put(drawable, radius);
            }
        } else if (drawable instanceof StateListDrawable) radius(drawable.getCurrent(), radius);
        else if (drawable instanceof InsetDrawable) radius(((InsetDrawable) drawable).getDrawable(), radius);
        else if (drawable instanceof LayerDrawable) {
            LayerDrawable layers = (LayerDrawable) drawable;
            for (int i = 0; i < layers.getNumberOfLayers(); i++) radius(layers.getDrawable(i), radius);
        }
    }
    public static void dialog(View root) {
        radius(root.getBackground(), dp(root, 28));
        for (String id : new String[]{"design_bottom_sheet", "bottomSheet", "cardContent", "cardLogo"}) {
            int resource = root.getResources().getIdentifier(id, "id", "com.zong.customercare");
            View panel = resource == 0 ? null : root.findViewById(resource);
            if (panel != null) { radius(panel.getBackground(), dp(panel, 28)); cardRadius(panel, dp(panel, 28)); }
        }
    }
}
