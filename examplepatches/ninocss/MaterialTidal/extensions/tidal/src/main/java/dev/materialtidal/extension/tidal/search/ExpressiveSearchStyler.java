package dev.materialtidal.extension.tidal.search;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.OvershootInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ExpressivePalette;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Shared Material 3 Expressive styling helpers for TIDAL's Search Landing Page,
 * Search Bar widget, horizontal filter chips, suggestions, and explore cards.
 */
final class ExpressiveSearchStyler {

    static final class SearchViewIds {
        final int searchSrcText;
        final int searchMagIcon;
        final int searchCloseBtn;
        final int searchEditFrame;
        final int searchPlate;
        final int submitArea;

        SearchViewIds(Context ctx) {
            searchSrcText = resolveId(ctx, "search_src_text", 0);
            searchMagIcon = resolveId(ctx, "search_mag_icon", 0);
            searchCloseBtn = resolveId(ctx, "search_close_btn", 0);
            searchEditFrame = resolveId(ctx, "search_edit_frame", 0);
            searchPlate = resolveId(ctx, "search_plate", 0);
            submitArea = resolveId(ctx, "submit_area", 0);
        }
    }

    static final class SearchPageIds {
        final int idTitle;
        final int idGenreLabel;
        final int idIcon;
        final int idArtwork;
        final int idCover;
        final int idImage;
        final int idOptions;
        final int idArtistName;
        final int idChevron;
        final int idDelete;
        final int idName;
        final int idSearchIcon;
        final int idErrorText;
        final int idNoSearchResultsText;
        final int idEmptySearchResultsQuery;

        SearchPageIds(Context ctx) {
            idTitle = ExpressiveMediaStyleKit.getId(ctx, "title");
            idGenreLabel = ExpressiveMediaStyleKit.getId(ctx, "genreLabel");
            idIcon = ExpressiveMediaStyleKit.getId(ctx, "icon");
            idArtwork = ExpressiveMediaStyleKit.getId(ctx, "artwork");
            idCover = ExpressiveMediaStyleKit.getId(ctx, "cover");
            idImage = ExpressiveMediaStyleKit.getId(ctx, "image");
            idOptions = ExpressiveMediaStyleKit.getId(ctx, "options");
            idArtistName = ExpressiveMediaStyleKit.getId(ctx, "artistName");
            idChevron = ExpressiveMediaStyleKit.getId(ctx, "chevron");
            idDelete = ExpressiveMediaStyleKit.getId(ctx, "delete");
            idName = ExpressiveMediaStyleKit.getId(ctx, "name");
            idSearchIcon = ExpressiveMediaStyleKit.getId(ctx, "searchIcon");
            idErrorText = ExpressiveMediaStyleKit.getId(ctx, "errorText");
            idNoSearchResultsText = ExpressiveMediaStyleKit.getId(ctx, "noSearchResultsText");
            idEmptySearchResultsQuery = ExpressiveMediaStyleKit.getId(ctx, "emptySearchResultsQuery");
        }
    }

    private static final WeakHashMap<View, Boolean> SPRING_ATTACHED = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> CHIP_SELECTED_STATE = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> SEARCH_FOCUS_HOOKED = new WeakHashMap<>();
    private static final WeakHashMap<RecyclerView, Boolean> NESTED_RV_HOOKED = new WeakHashMap<>();

    private static final OvershootInterpolator CHIP_POP_INTERP = new OvershootInterpolator(1.9f);
    private static Method setTextCursorDrawableMethod;
    private static boolean cursorMethodResolved;

    private static Field clpTopToTopField;
    private static Field clpBottomToBottomField;
    private static Field clpTopToBottomField;
    private static Field clpBottomToTopField;
    private static Field clpVerticalBiasField;
    private static boolean clpAlignFieldsResolved;

    private ExpressiveSearchStyler() {
    }

    /**
     * Transforms TIDAL's white rectangular {@code TidalSearchView} into an M3 Expressive
     * Monet stadium pill (or 18dp squircle) with animated focus ring and Monet cursor/icons.
     */
    static void styleTidalSearchView(View searchView, boolean interactiveFocus) {
        if (searchView == null) {
            return;
        }
        Context ctx = searchView.getContext();
        float density = ctx.getResources().getDisplayMetrics().density;
        ExpressivePalette palette = ExpressiveMediaStyleKit.buildMonetPalette();
        SearchViewIds ids = new SearchViewIds(ctx);

        searchView.setForceDarkAllowed(false);

        int padStart = searchView.getPaddingStart();
        int padTop = searchView.getPaddingTop();
        int padEnd = searchView.getPaddingEnd();
        int padBottom = searchView.getPaddingBottom();
        // TIDAL XML sets paddingStart/End=-12dp; normalize negative padding while preserving any top inset padding
        int targetStart = padStart < 0 ? dp(density, 6f) : padStart;
        int targetEnd = padEnd < 0 ? dp(density, 6f) : padEnd;
        if (targetStart != padStart || targetEnd != padEnd) {
            searchView.setPaddingRelative(
                    targetStart,
                    Math.max(0, padTop),
                    targetEnd,
                    Math.max(0, padBottom)
            );
        }

        int targetMinH = dp(density, interactiveFocus ? 48f : 52f);
        if (searchView.getMinimumHeight() < targetMinH) {
            searchView.setMinimumHeight(targetMinH);
        }

        clearLegacyBackground(ExpressiveMediaStyleKit.findView(searchView, ids.searchPlate));
        clearLegacyBackground(ExpressiveMediaStyleKit.findView(searchView, ids.submitArea));

        View editFrame = ExpressiveMediaStyleKit.findView(searchView, ids.searchEditFrame);
        if (editFrame != null) {
            clearLegacyBackground(editFrame);
            if (editFrame.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) editFrame.getLayoutParams();
                int margin = dp(density, 4f);
                if (lp.getMarginStart() != margin || lp.getMarginEnd() != margin) {
                    lp.setMarginStart(margin);
                    lp.setMarginEnd(margin);
                    editFrame.setLayoutParams(lp);
                }
            }
        }

        View srcTextView = ExpressiveMediaStyleKit.findView(searchView, ids.searchSrcText);
        boolean focused = interactiveFocus && srcTextView != null && srcTextView.hasFocus();
        applySearchPillBackground(searchView, palette, density, focused, !interactiveFocus);

        if (srcTextView instanceof TextView) {
            TextView tv = (TextView) srcTextView;
            tv.setTextColor(palette.onSurface);
            tv.setHintTextColor(MaterialYouColorEngine.withAlpha(palette.onSurfaceVariant, 0xCC));
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            tv.setHighlightColor(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x44));
            applyMonetCursorDrawable(tv, palette.primaryAccent, density);

            if (interactiveFocus && !Boolean.TRUE.equals(SEARCH_FOCUS_HOOKED.get(tv))) {
                SEARCH_FOCUS_HOOKED.put(tv, Boolean.TRUE);
                final View.OnFocusChangeListener prev = tv.getOnFocusChangeListener();
                tv.setOnFocusChangeListener((v, hasFocus) -> {
                    if (prev != null) {
                        prev.onFocusChange(v, hasFocus);
                    }
                    ExpressivePalette livePalette = ExpressiveMediaStyleKit.buildMonetPalette();
                    applySearchPillBackground(searchView, livePalette, density, hasFocus, false);
                });
            }
        }

        View magIcon = ExpressiveMediaStyleKit.findView(searchView, ids.searchMagIcon);
        if (magIcon instanceof ImageView) {
            ImageView iv = (ImageView) magIcon;
            iv.setImageTintList(ColorStateList.valueOf(palette.primaryAccent));
            int padH = dp(density, 4f);
            if (iv.getPaddingStart() < padH) {
                iv.setPaddingRelative(padH, iv.getPaddingTop(), iv.getPaddingEnd(), iv.getPaddingBottom());
            }
        }

        View closeBtn = ExpressiveMediaStyleKit.findView(searchView, ids.searchCloseBtn);
        if (closeBtn instanceof ImageView) {
            ImageView iv = (ImageView) closeBtn;
            iv.setImageTintList(ColorStateList.valueOf(palette.onSurface));
            int size = dp(density, 30f);
            int pad = dp(density, 6f);
            iv.setPadding(pad, pad, pad, pad);
            iv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            ViewGroup.LayoutParams clp = iv.getLayoutParams();
            if (clp != null && (clp.width != size || clp.height != size)) {
                clp.width = size;
                clp.height = size;
                if (clp instanceof LinearLayout.LayoutParams) {
                    LinearLayout.LayoutParams llp = (LinearLayout.LayoutParams) clp;
                    llp.gravity = Gravity.CENTER_VERTICAL;
                    llp.setMarginEnd(dp(density, 8f));
                }
                iv.setLayoutParams(clp);
            }
            iv.setBackground(createCircularTonalRipple(
                    MaterialYouColorEngine.getSurfaceContainerHighest(),
                    0,
                    0,
                    MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x33)
            ));
        }

        if (!interactiveFocus) {
            attachSpringPressRecursive(searchView, searchView);
        }
    }

    /**
     * Styles {@code @id/backIcon} in {@code UnifiedSearchView} into a circular 48dp tonal Expressive pill.
     */
    static void styleBackButton(View backIcon) {
        styleBackButton(backIcon, null);
    }

    /**
     * Styles {@code @id/backIcon} in {@code UnifiedSearchView} into a circular 48dp tonal Expressive pill
     * vertically aligned to {@code searchAnchor}.
     */
    static void styleBackButton(View backIcon, View searchAnchor) {
        if (!(backIcon instanceof ImageView)) {
            return;
        }
        ImageView iv = (ImageView) backIcon;
        float density = iv.getContext().getResources().getDisplayMetrics().density;
        ExpressivePalette palette = ExpressiveMediaStyleKit.buildMonetPalette();

        int size = dp(density, 48f);
        int pad = dp(density, 12f);
        iv.setPadding(pad, pad, pad, pad);
        iv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        iv.setImageTintList(ColorStateList.valueOf(palette.onSurface));

        ViewGroup.LayoutParams lp = iv.getLayoutParams();
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
            mlp.width = size;
            mlp.height = size;
            mlp.setMarginStart(dp(density, 12f));
            mlp.setMarginEnd(dp(density, 8f));
            mlp.topMargin = 0;
            mlp.bottomMargin = 0;
            if (!alignConstraintVerticalCenter(mlp, searchAnchor)) {
                mlp.topMargin = dp(density, 8f);
            }
            iv.setLayoutParams(mlp);
        }

        iv.setBackground(createCircularTonalRipple(
                palette.surfaceContainer,
                Math.max(1, dp(density, 1f)),
                MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x70),
                MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x33)
        ));
        attachSpringPressOnce(iv);
    }

    private static boolean alignConstraintVerticalCenter(ViewGroup.LayoutParams lp, View anchor) {
        if (lp == null || anchor == null || anchor.getId() == View.NO_ID) {
            return false;
        }
        Class<?> cls = lp.getClass();
        if (!cls.getName().endsWith("ConstraintLayout$LayoutParams")) {
            return false;
        }
        try {
            if (!clpAlignFieldsResolved) {
                clpAlignFieldsResolved = true;
                clpTopToTopField = cls.getField("topToTop");
                clpBottomToBottomField = cls.getField("bottomToBottom");
                clpTopToBottomField = cls.getField("topToBottom");
                clpBottomToTopField = cls.getField("bottomToTop");
                clpVerticalBiasField = cls.getField("verticalBias");
            }
            if (clpTopToTopField != null && clpBottomToBottomField != null
                    && clpTopToBottomField != null && clpBottomToTopField != null
                    && clpVerticalBiasField != null) {
                int anchorId = anchor.getId();
                clpTopToTopField.setInt(lp, anchorId);
                clpBottomToBottomField.setInt(lp, anchorId);
                clpTopToBottomField.setInt(lp, -1);
                clpBottomToTopField.setInt(lp, -1);
                clpVerticalBiasField.setFloat(lp, 0.5f);
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Styles a {@code unified_search_filter_item} chip into an M3 Expressive stadium pill.
     */
    static void styleFilterChip(View itemView, boolean selected) {
        if (itemView == null) {
            return;
        }
        float density = itemView.getContext().getResources().getDisplayMetrics().density;
        ExpressivePalette palette = ExpressiveMediaStyleKit.buildMonetPalette();

        ViewGroup.LayoutParams lp = itemView.getLayoutParams();
        int targetH = dp(density, 38f);
        if (lp != null && lp.height != targetH) {
            lp.height = targetH;
            itemView.setLayoutParams(lp);
        }
        int padH = dp(density, 16f);
        itemView.setPadding(padH, 0, padH, 0);

        float radius = dpf(density, ExpressiveSearchBridge.getFilterChipCornerRadiusDp());
        GradientDrawable fill = new GradientDrawable();
        fill.setShape(GradientDrawable.RECTANGLE);
        fill.setCornerRadius(radius);
        if (selected) {
            fill.setColor(palette.primaryAccent);
        } else {
            fill.setColor(palette.surfaceContainer);
            fill.setStroke(Math.max(1, dp(density, 1f)),
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x80));
        }

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(radius);
        mask.setColor(0xFFFFFFFF);

        int rippleColor = selected
                ? MaterialYouColorEngine.withAlpha(palette.onPrimary, 0x26)
                : MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2E);
        itemView.setBackground(new RippleDrawable(ColorStateList.valueOf(rippleColor), fill, mask));

        TextView label = findFilterLabel(itemView);
        if (label != null) {
            label.setGravity(Gravity.CENTER);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            label.setTypeface(label.getTypeface(), selected ? Typeface.BOLD : Typeface.NORMAL);
            label.setTextColor(selected ? palette.onPrimary : palette.onSurfaceVariant);
        }

        Boolean prevSelected = CHIP_SELECTED_STATE.put(itemView, selected);
        if (Boolean.FALSE.equals(prevSelected) && selected) {
            itemView.animate().cancel();
            itemView.setScaleX(0.93f);
            itemView.setScaleY(0.93f);
            itemView.animate()
                    .scaleX(1.0f)
                    .scaleY(1.0f)
                    .setDuration(180L)
                    .setInterpolator(CHIP_POP_INTERP)
                    .start();
        }
        attachSpringPressOnce(itemView);
    }

    /**
     * Styles a {@code unified_search_suggestion_list_item} row with a circular tonal
     * icon badge, Monet-highlighted matched query text, and circular delete pill.
     */
    static void styleSuggestionRow(View itemView) {
        if (itemView == null) {
            return;
        }
        Context ctx = itemView.getContext();
        float density = ctx.getResources().getDisplayMetrics().density;
        ExpressivePalette palette = ExpressiveMediaStyleKit.buildMonetPalette();
        SearchPageIds ids = new SearchPageIds(ctx);

        View deleteBtn = ExpressiveMediaStyleKit.findView(itemView, ids.idDelete);
        boolean isHistory = deleteBtn != null && deleteBtn.getVisibility() == View.VISIBLE;

        if (itemView.getBackground() != null) {
            itemView.setBackground(null);
        }
        itemView.setForeground(createInsetRipple(density, 8f, 2f, 16f,
                MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2A)));

        View art = ExpressiveMediaStyleKit.findView(itemView, ids.idArtwork);
        if (art instanceof ImageView) {
            ImageView iv = (ImageView) art;
            int badgeSize = dp(density, 38f);
            ViewGroup.LayoutParams alp = iv.getLayoutParams();
            if (alp != null && (alp.width != badgeSize || alp.height != badgeSize)) {
                alp.width = badgeSize;
                alp.height = badgeSize;
                iv.setLayoutParams(alp);
            }
            int pad = dp(density, 9f);
            iv.setPadding(pad, pad, pad, pad);
            iv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            iv.setImageTintList(ColorStateList.valueOf(
                    isHistory ? palette.primaryAccent : palette.onSurfaceVariant));

            GradientDrawable circle = new GradientDrawable();
            circle.setShape(GradientDrawable.OVAL);
            circle.setColor(palette.surfaceContainerHigh);
            circle.setStroke(Math.max(1, dp(density, 1f)),
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x55));
            iv.setBackground(circle);
        }

        View titleView = ExpressiveMediaStyleKit.findView(itemView, ids.idTitle);
        if (titleView instanceof TextView) {
            TextView tv = (TextView) titleView;
            tv.setTextColor(palette.onSurface);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            CharSequence text = tv.getText();
            if (text instanceof Spanned) {
                Spanned spanned = (Spanned) text;
                ForegroundColorSpan[] oldSpans = spanned.getSpans(0, spanned.length(), ForegroundColorSpan.class);
                if (oldSpans != null && oldSpans.length > 0) {
                    SpannableStringBuilder ssb = new SpannableStringBuilder(spanned);
                    for (ForegroundColorSpan oldSpan : oldSpans) {
                        int start = ssb.getSpanStart(oldSpan);
                        int end = ssb.getSpanEnd(oldSpan);
                        int flags = ssb.getSpanFlags(oldSpan);
                        if (start >= 0 && end > start) {
                            ssb.removeSpan(oldSpan);
                            ssb.setSpan(new ForegroundColorSpan(palette.primaryAccent), start, end, flags);
                            ssb.setSpan(new StyleSpan(Typeface.BOLD), start, end, flags);
                        }
                    }
                    tv.setText(ssb);
                }
            }
        }

        if (deleteBtn instanceof ImageView) {
            ImageView dv = (ImageView) deleteBtn;
            int delSize = dp(density, 34f);
            ViewGroup.LayoutParams dlp = dv.getLayoutParams();
            if (dlp != null && (dlp.width != delSize || dlp.height != delSize)) {
                dlp.width = delSize;
                dlp.height = delSize;
                dv.setLayoutParams(dlp);
            }
            int pad = dp(density, 8f);
            dv.setPadding(pad, pad, pad, pad);
            dv.setImageTintList(ColorStateList.valueOf(palette.onSurfaceVariant));
            dv.setBackground(createCircularTonalRipple(
                    palette.surfaceContainer,
                    0,
                    0,
                    MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x33)
            ));
        }

        attachSpringPressOnce(itemView);
    }

    /**
     * Styles {@code InitialEmptyView} and {@code EmptyResultView} with a 76dp circular
     * tonal icon badge and crisp Monet typography hierarchy.
     */
    static void styleEmptyView(View container, SearchPageIds ids) {
        if (container == null || ids == null) {
            return;
        }
        float density = container.getContext().getResources().getDisplayMetrics().density;
        ExpressivePalette palette = ExpressiveMediaStyleKit.buildMonetPalette();

        View icon = ExpressiveMediaStyleKit.findView(container, ids.idSearchIcon);
        if (icon instanceof ImageView) {
            ImageView iv = (ImageView) icon;
            int size = dp(density, 76f);
            ViewGroup.LayoutParams lp = iv.getLayoutParams();
            if (lp != null && (lp.width != size || lp.height != size)) {
                lp.width = size;
                lp.height = size;
                iv.setLayoutParams(lp);
            }
            int pad = dp(density, 18f);
            iv.setPadding(pad, pad, pad, pad);
            iv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            iv.setImageTintList(ColorStateList.valueOf(palette.primaryAccent));
            GradientDrawable badge = new GradientDrawable();
            badge.setShape(GradientDrawable.OVAL);
            badge.setColor(palette.surfaceContainerHigh);
            badge.setStroke(Math.max(1, dp(density, 1f)),
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x70));
            iv.setBackground(badge);
        }

        View subtitle = ExpressiveMediaStyleKit.findView(container, ids.idErrorText);
        if (subtitle instanceof TextView) {
            TextView tv = (TextView) subtitle;
            tv.setTextColor(palette.onSurfaceVariant);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
        }

        View emptyMsg = ExpressiveMediaStyleKit.findView(container, ids.idNoSearchResultsText);
        if (emptyMsg instanceof TextView) {
            TextView tv = (TextView) emptyMsg;
            tv.setTextColor(palette.onSurfaceVariant);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
        }

        View emptyQuery = ExpressiveMediaStyleKit.findView(container, ids.idEmptySearchResultsQuery);
        if (emptyQuery instanceof TextView) {
            TextView tv = (TextView) emptyQuery;
            tv.setTextColor(palette.onSurface);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19f);
            tv.setTypeface(tv.getTypeface(), Typeface.BOLD);
        }
    }

    /**
     * Styles modules attached inside {@code Lis6;} (Search / Explore Landing Page),
     * including genre cards, mood/cloud pill tags, link rows, section headers, and nested carousels.
     */
    static void styleSearchLandingChild(View child, SearchPageIds ids, boolean insideNestedCarousel) {
        if (child == null || ids == null) {
            return;
        }
        float density = child.getContext().getResources().getDisplayMetrics().density;
        ExpressivePalette palette = ExpressiveMediaStyleKit.buildMonetPalette();
        boolean cardsEnabled = MaterialYouConfig.isExpressiveSearchCardsEnabled();

        // 1. Genre / Explore Card (genre_list_item.xml -> has @id/genreLabel)
        View genreLabel = ExpressiveMediaStyleKit.findView(child, ids.idGenreLabel);
        if (cardsEnabled && genreLabel instanceof TextView) {
            TextView titleTv = findTextView(child, ids.idTitle);
            String labelText = titleTv != null && titleTv.getText() != null
                    ? titleTv.getText().toString()
                    : "";
            int cardAccent = computeMonetHarmonizedAccent(labelText, palette.primaryAccent);
            boolean amoled = MaterialYouColorEngine.isEffectiveAmoledBlack();
            int cardFill = amoled
                    ? palette.surfaceContainer
                    : MaterialYouColorEngine.blendRgb(palette.surfaceContainerHigh, cardAccent, 0.22f);
            int cardHighlight = amoled
                    ? MaterialYouColorEngine.blendRgb(palette.surfaceContainer, cardAccent, 0.14f)
                    : MaterialYouColorEngine.blendRgb(palette.surfaceContainerHigh, cardAccent, 0.34f);

            float radius = dpf(density, 20f);
            GenreCardDrawable cardBg = new GenreCardDrawable(
                    cardFill,
                    cardHighlight,
                    cardAccent,
                    radius,
                    density
            );
            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadius(radius);
            mask.setColor(0xFFFFFFFF);

            child.setBackground(new RippleDrawable(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(cardAccent, 0x38)),
                    cardBg,
                    mask));
            child.setForeground(null);

            if (titleTv != null) {
                titleTv.setTextColor(palette.onSurface);
                titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
                titleTv.setTypeface(titleTv.getTypeface(), Typeface.BOLD);
            }
            TextView gLabel = (TextView) genreLabel;
            gLabel.setTextColor(MaterialYouColorEngine.blendRgb(palette.onSurfaceVariant, cardAccent, 0.28f));
            gLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            gLabel.setTypeface(gLabel.getTypeface(), Typeface.BOLD);
            attachSpringPressOnce(child);
            return;
        }

        // 2. Standalone Cloud Tag Pill (page_link_cloud_tag_item.xml -> root TextView @id/title)
        if (cardsEnabled && child instanceof TextView && child.getId() == ids.idTitle) {
            TextView tag = (TextView) child;
            tag.setTextColor(palette.onSurface);
            tag.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            tag.setTypeface(tag.getTypeface(), Typeface.BOLD);
            tag.setPadding(dp(density, 20f), dp(density, 12f), dp(density, 20f), dp(density, 12f));

            float pillRadius = dpf(density, 1000f);
            GradientDrawable pill = new GradientDrawable();
            pill.setShape(GradientDrawable.RECTANGLE);
            pill.setCornerRadius(pillRadius);
            pill.setColor(palette.surfaceContainerHigh);
            pill.setStroke(Math.max(1, dp(density, 1f)),
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x80));

            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadius(pillRadius);
            mask.setColor(0xFFFFFFFF);

            tag.setBackground(new RippleDrawable(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x30)),
                    pill,
                    mask));
            attachSpringPressOnce(tag);
            return;
        }

        // 3. Page Link Navigation Row (page_link_item.xml -> LinearLayout with @id/icon + @id/title, no artwork)
        View iconView = ExpressiveMediaStyleKit.findView(child, ids.idIcon);
        View artworkView = ExpressiveMediaStyleKit.findView(child, ids.idArtwork);
        TextView rowTitle = findTextView(child, ids.idTitle);
        if (cardsEnabled
                && !insideNestedCarousel
                && child instanceof LinearLayout
                && iconView instanceof ImageView
                && artworkView == null
                && rowTitle != null
                && ((ViewGroup) child).getChildCount() <= 4) {
            float radius = dpf(density, 18f);
            GradientDrawable card = new GradientDrawable();
            card.setShape(GradientDrawable.RECTANGLE);
            card.setCornerRadius(radius);
            card.setColor(palette.surfaceContainer);
            card.setStroke(Math.max(1, dp(density, 1f)),
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x60));

            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadius(radius);
            mask.setColor(0xFFFFFFFF);

            RippleDrawable ripple = new RippleDrawable(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2E)),
                    card,
                    mask);
            int insH = dp(density, 12f);
            int insV = dp(density, 3f);
            child.setBackground(new InsetDrawable(ripple, insH, insV, insH, insV));
            child.setForeground(null);

            int minH = dp(density, 62f);
            ViewGroup.LayoutParams lp = child.getLayoutParams();
            if (lp != null && lp.height > 0 && lp.height < minH) {
                lp.height = minH;
                child.setLayoutParams(lp);
            }
            int padEnd = dp(density, 16f);
            child.setPaddingRelative(dp(density, 12f), dp(density, 4f), padEnd, dp(density, 4f));

            ImageView iv = (ImageView) iconView;
            int badgeSize = dp(density, 36f);
            ViewGroup.LayoutParams ilp = iv.getLayoutParams();
            if (ilp != null) {
                ilp.width = badgeSize;
                ilp.height = badgeSize;
                if (ilp instanceof LinearLayout.LayoutParams) {
                    ((LinearLayout.LayoutParams) ilp).gravity = Gravity.CENTER_VERTICAL;
                }
                iv.setLayoutParams(ilp);
            }
            int ip = dp(density, 7f);
            iv.setPadding(ip, ip, ip, ip);
            iv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            iv.setImageTintList(ColorStateList.valueOf(palette.primaryAccent));
            GradientDrawable badge = new GradientDrawable();
            badge.setShape(GradientDrawable.OVAL);
            badge.setColor(palette.surfaceContainerHigh);
            iv.setBackground(badge);

            rowTitle.setTextColor(palette.onSurface);
            rowTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            rowTitle.setTypeface(rowTitle.getTypeface(), Typeface.BOLD);
            attachSpringPressOnce(child);
            return;
        }

        // 4. HeaderView Section Titles & Action Pills
        if (child.getClass().getName().endsWith(".HeaderView") && child instanceof ViewGroup) {
            styleHeaderView((ViewGroup) child, palette, density, 20f);
            return;
        }

        // 5. Recursively hook nested horizontal RecyclerViews & style cover/cloud children
        hookNestedContainersRecursive(child, ids, palette, density);
    }

    /**
     * Styles result/suggestion/header rows attached inside {@code UnifiedSearchView}'s {@code RecyclerView}
     * without altering adapters or disturbing track swipe gestures.
     */
    static void styleUnifiedSearchResultChild(View child, SearchPageIds ids) {
        if (child == null || ids == null) {
            return;
        }
        float density = child.getContext().getResources().getDisplayMetrics().density;
        ExpressivePalette palette = ExpressiveMediaStyleKit.buildMonetPalette();

        // Suggestion / History rows (backup if bound outside Ld6j path)
        if (ExpressiveMediaStyleKit.findView(child, ids.idDelete) != null) {
            styleSuggestionRow(child);
            return;
        }

        // Recent Searches HeaderView
        if (child.getClass().getName().endsWith(".HeaderView") && child instanceof ViewGroup) {
            styleHeaderView((ViewGroup) child, palette, density, 18f);
            return;
        }

        // "View all ..." item (search_view_all_results_list_item.xml)
        View chevron = ExpressiveMediaStyleKit.findView(child, ids.idChevron);
        TextView titleTv = findTextView(child, ids.idTitle);
        if (chevron != null && titleTv != null) {
            float radius = dpf(density, 18f);
            GradientDrawable pill = new GradientDrawable();
            pill.setShape(GradientDrawable.RECTANGLE);
            pill.setCornerRadius(radius);
            pill.setColor(palette.surfaceContainer);
            pill.setStroke(Math.max(1, dp(density, 1f)),
                    MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x70));

            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadius(radius);
            mask.setColor(0xFFFFFFFF);

            RippleDrawable ripple = new RippleDrawable(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2E)),
                    pill,
                    mask);
            int insH = dp(density, 14f);
            int insV = dp(density, 4f);
            child.setBackground(new InsetDrawable(ripple, insH, insV, insH, insV));
            child.setForeground(null);

            int targetH = dp(density, 52f);
            ViewGroup.LayoutParams lp = child.getLayoutParams();
            if (lp != null && lp.height > 0 && lp.height < targetH) {
                lp.height = targetH;
                child.setLayoutParams(lp);
            }
            child.setPadding(dp(density, 12f), 0, dp(density, 12f), 0);

            titleTv.setTextColor(palette.primaryAccent);
            titleTv.setTypeface(titleTv.getTypeface(), Typeface.BOLD);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            if (chevron instanceof ImageView) {
                ((ImageView) chevron).setImageTintList(ColorStateList.valueOf(palette.primaryAccent));
            }
            attachSpringPressOnce(child);
            return;
        }

        // "Did you mean ..." item (search_did_you_mean_item.xml -> standalone TextView @id/title)
        if (child instanceof TextView && child.getId() == ids.idTitle) {
            TextView dym = (TextView) child;
            float radius = dpf(density, 20f);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.RECTANGLE);
            bg.setCornerRadius(radius);
            bg.setColor(MaterialYouColorEngine.blendRgb(
                    palette.surfaceContainerHigh, palette.primaryAccent, 0.12f));
            bg.setStroke(Math.max(1, dp(density, 1f)),
                    MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x60));
            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadius(radius);
            mask.setColor(0xFFFFFFFF);
            dym.setBackground(new RippleDrawable(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x30)),
                    bg,
                    mask));
            dym.setTextColor(palette.onSurface);
            attachSpringPressOnce(dym);
            return;
        }

        // Track rows (@id/options present): reuse clean M3 track row styling (keeps swipe + active highlight)
        if (ExpressiveMediaStyleKit.findView(child, ids.idOptions) != null
                && MaterialYouConfig.isPlaylistTrackRowPolishEnabled()) {
            ExpressiveMediaStyleKit.styleCleanTrackRow(
                    child, palette, density, ids.idArtwork, ids.idArtistName, ids.idOptions);
            return;
        }

        // Album / Playlist / Video / Artist / Profile rows: round square artwork safely + rounded ripple
        roundAllSquareArtwork(child, ids, dpf(density, 12f), density);
        if (child.isClickable()) {
            child.setForeground(createInsetRipple(density, 8f, 2f, 16f,
                    MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x26)));
        }
    }

    private static void hookNestedContainersRecursive(
            View view,
            SearchPageIds ids,
            ExpressivePalette palette,
            float density
    ) {
        if (view instanceof RecyclerView) {
            final RecyclerView nestedRv = (RecyclerView) view;
            nestedRv.setClipToPadding(false);
            if (!Boolean.TRUE.equals(NESTED_RV_HOOKED.get(nestedRv))) {
                NESTED_RV_HOOKED.put(nestedRv, Boolean.TRUE);
                nestedRv.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
                    @Override
                    public void onChildViewAttachedToWindow(View child) {
                        if (child != null) {
                            styleSearchLandingChild(child, ids, true);
                        }
                    }

                    @Override
                    public void onChildViewDetachedFromWindow(View child) {
                    }
                });
            }
            for (int i = 0; i < nestedRv.getChildCount(); i++) {
                styleSearchLandingChild(nestedRv.getChildAt(i), ids, true);
            }
            return;
        }

        roundAllSquareArtwork(view, ids, dpf(density, 16f), density);

        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                View c = vg.getChildAt(i);
                if (c == null) {
                    continue;
                }
                if (c.getClass().getName().endsWith(".HeaderView") && c instanceof ViewGroup) {
                    styleHeaderView((ViewGroup) c, palette, density, 20f);
                } else {
                    hookNestedContainersRecursive(c, ids, palette, density);
                }
            }
        }
    }

    private static void roundAllSquareArtwork(View root, SearchPageIds ids, float radiusPx, float density) {
        roundIfSquare(ExpressiveMediaStyleKit.findView(root, ids.idArtwork), radiusPx, density);
        roundIfSquare(ExpressiveMediaStyleKit.findView(root, ids.idCover), radiusPx, density);
        roundIfSquare(ExpressiveMediaStyleKit.findView(root, ids.idImage), radiusPx, density);
    }

    private static void roundIfSquare(View art, float radiusPx, float density) {
        if (art != null) {
            ExpressiveMediaStyleKit.setShapeableImageCornerRadiusIfSquare(art, radiusPx, density);
        }
    }

    private static void styleHeaderView(
            ViewGroup header,
            ExpressivePalette palette,
            float density,
            float titleSp
    ) {
        boolean styledTitle = false;
        for (int i = 0; i < header.getChildCount(); i++) {
            View child = header.getChildAt(i);
            if (!(child instanceof TextView)) {
                continue;
            }
            TextView tv = (TextView) child;
            if (tv.isClickable() || styledTitle) {
                if (tv.getVisibility() == View.VISIBLE && tv.getText() != null && tv.getText().length() > 0) {
                    float r = dpf(density, 1000f);
                    GradientDrawable bg = new GradientDrawable();
                    bg.setShape(GradientDrawable.RECTANGLE);
                    bg.setCornerRadius(r);
                    bg.setColor(palette.surfaceContainerHigh);
                    GradientDrawable mask = new GradientDrawable();
                    mask.setShape(GradientDrawable.RECTANGLE);
                    mask.setCornerRadius(r);
                    mask.setColor(0xFFFFFFFF);
                    tv.setBackground(new RippleDrawable(
                            ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2E)),
                            bg,
                            mask));
                    tv.setPadding(dp(density, 14f), dp(density, 6f), dp(density, 14f), dp(density, 6f));
                    tv.setTextColor(palette.primaryAccent);
                    tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
                    tv.setTypeface(tv.getTypeface(), Typeface.BOLD);
                    attachSpringPressOnce(tv);
                }
            } else {
                styledTitle = true;
                tv.setTextColor(palette.onSurface);
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, titleSp);
                tv.setTypeface(tv.getTypeface(), Typeface.BOLD);
            }
        }
    }

    private static void applySearchPillBackground(
            View searchView,
            ExpressivePalette palette,
            float density,
            boolean focused,
            boolean withRipple
    ) {
        float radius = dpf(density, ExpressiveSearchBridge.getSearchBarCornerRadiusDp());
        int fillColor = focused
                ? MaterialYouColorEngine.blendRgb(palette.surfaceContainerHigh, palette.primaryAccent, 0.06f)
                : palette.surfaceContainerHigh;
        int strokeWidth = Math.max(1, dp(density, focused ? 1.5f : 1f));
        int strokeColor = focused
                ? palette.primaryAccent
                : MaterialYouColorEngine.withAlpha(palette.outlineVariant, 0x85);

        GradientDrawable pill = new GradientDrawable();
        pill.setShape(GradientDrawable.RECTANGLE);
        pill.setCornerRadius(radius);
        pill.setColor(fillColor);
        pill.setStroke(strokeWidth, strokeColor);

        if (withRipple) {
            GradientDrawable mask = new GradientDrawable();
            mask.setShape(GradientDrawable.RECTANGLE);
            mask.setCornerRadius(radius);
            mask.setColor(0xFFFFFFFF);
            searchView.setBackground(new RippleDrawable(
                    ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x2A)),
                    pill,
                    mask));
        } else {
            searchView.setBackground(pill);
        }
    }

    private static void applyMonetCursorDrawable(TextView tv, int accent, float density) {
        if (Build.VERSION.SDK_INT < 29 || tv == null) {
            return;
        }
        try {
            if (!cursorMethodResolved) {
                cursorMethodResolved = true;
                setTextCursorDrawableMethod = TextView.class.getMethod("setTextCursorDrawable", Drawable.class);
            }
            if (setTextCursorDrawableMethod != null) {
                GradientDrawable cursor = new GradientDrawable();
                cursor.setShape(GradientDrawable.RECTANGLE);
                cursor.setCornerRadius(dpf(density, 1f));
                cursor.setColor(accent);
                cursor.setSize(Math.max(2, dp(density, 2f)), dp(density, 20f));
                setTextCursorDrawableMethod.invoke(tv, cursor);
            }
        } catch (Throwable ignored) {
        }
    }

    private static Drawable createCircularTonalRipple(
            int fillColor,
            int strokeWidthPx,
            int strokeColor,
            int rippleColor
    ) {
        GradientDrawable fill = new GradientDrawable();
        fill.setShape(GradientDrawable.OVAL);
        fill.setColor(fillColor);
        if (strokeWidthPx > 0) {
            fill.setStroke(strokeWidthPx, strokeColor);
        }
        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.OVAL);
        mask.setColor(0xFFFFFFFF);
        return new RippleDrawable(ColorStateList.valueOf(rippleColor), fill, mask);
    }

    private static Drawable createInsetRipple(
            float density,
            float insetHDp,
            float insetVDp,
            float cornerDp,
            int rippleColor
    ) {
        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(dpf(density, cornerDp));
        mask.setColor(0xFFFFFFFF);
        RippleDrawable ripple = new RippleDrawable(ColorStateList.valueOf(rippleColor), null, mask);
        int ih = dp(density, insetHDp);
        int iv = dp(density, insetVDp);
        return new InsetDrawable(ripple, ih, iv, ih, iv);
    }

    private static void attachSpringPressOnce(View v) {
        if (v == null || Boolean.TRUE.equals(SPRING_ATTACHED.get(v))) {
            return;
        }
        SPRING_ATTACHED.put(v, Boolean.TRUE);
        ExpressiveMediaStyleKit.attachSpringPressEffect(v);
    }

    /**
     * Attaches non-consuming press spring animation targeting {@code animTarget} across all
     * child views of the Search Landing pill so {@code Lis6;.R}'s click listeners fire normally.
     */
    private static void attachSpringPressRecursive(View root, View animTarget) {
        if (root == null) {
            return;
        }
        if (!Boolean.TRUE.equals(SPRING_ATTACHED.get(root))) {
            SPRING_ATTACHED.put(root, Boolean.TRUE);
            root.setOnTouchListener((v, event) -> {
                int action = event.getActionMasked();
                if (action == android.view.MotionEvent.ACTION_DOWN) {
                    animTarget.animate().cancel();
                    animTarget.animate().scaleX(0.97f).scaleY(0.97f).setDuration(85L).start();
                } else if (action == android.view.MotionEvent.ACTION_UP
                        || action == android.view.MotionEvent.ACTION_CANCEL) {
                    animTarget.animate().cancel();
                    animTarget.animate()
                            .scaleX(1.0f)
                            .scaleY(1.0f)
                            .setDuration(200L)
                            .setInterpolator(CHIP_POP_INTERP)
                            .start();
                }
                return false;
            });
        }
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                attachSpringPressRecursive(vg.getChildAt(i), animTarget);
            }
        }
    }

    private static int computeMonetHarmonizedAccent(String key, int baseAccent) {
        float[] hsl = new float[3];
        Color.colorToHSV(baseAccent, hsl);
        int hash = (key != null ? key.hashCode() : 0) & 0x7FFFFFFF;
        // Shift smoothly across subtle Monet-harmonized angles while keeping dark-theme pastel chroma
        float[] offsets = new float[]{0f, 28f, -34f, 64f, 110f, -72f, 148f, -118f};
        hsl[0] = (hsl[0] + offsets[hash % offsets.length] + 360f) % 360f;
        hsl[1] = Math.max(0.28f, Math.min(0.48f, hsl[1]));
        hsl[2] = Math.max(0.76f, Math.min(0.88f, hsl[2]));
        return Color.HSVToColor(0xFF, hsl);
    }

    private static TextView findFilterLabel(View itemView) {
        if (itemView instanceof TextView) {
            return (TextView) itemView;
        }
        int id = ExpressiveMediaStyleKit.getId(itemView.getContext(), "label");
        View v = ExpressiveMediaStyleKit.findView(itemView, id);
        return (v instanceof TextView) ? (TextView) v : null;
    }

    private static TextView findTextView(View root, int id) {
        View v = ExpressiveMediaStyleKit.findView(root, id);
        return (v instanceof TextView) ? (TextView) v : null;
    }

    private static void clearLegacyBackground(View v) {
        if (v != null && v.getBackground() != null) {
            v.setBackground(null);
        }
    }

    private static int resolveId(Context ctx, String name, int fallback) {
        int id = ExpressiveMediaStyleKit.getId(ctx, name);
        return id != 0 ? id : fallback;
    }

    private static int dp(float density, float val) {
        return ExpressiveMediaStyleKit.dp(density, val);
    }

    private static float dpf(float density, float val) {
        return ExpressiveMediaStyleKit.dpf(density, val);
    }

    /** Draws a 20dp tonal genre card with a diagonal accent wash, crisp border, and start accent pill. */
    private static final class GenreCardDrawable extends Drawable {
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint pillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final RectF pillRect = new RectF();
        private final int startColor;
        private final int endColor;
        private final float radiusPx;
        private final float density;
        private int lastW = -1;

        GenreCardDrawable(int fillStart, int fillEnd, int accentColor, float radiusPx, float density) {
            this.startColor = fillStart;
            this.endColor = fillEnd;
            this.radiusPx = radiusPx;
            this.density = density;
            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeWidth(Math.max(1f, 1f * density));
            strokePaint.setColor(MaterialYouColorEngine.withAlpha(accentColor, 0x52));
            pillPaint.setStyle(Paint.Style.FILL);
            pillPaint.setColor(MaterialYouColorEngine.withAlpha(accentColor, 0xD8));
        }

        @Override
        protected void onBoundsChange(Rect bounds) {
            super.onBoundsChange(bounds);
            rect.set(bounds);
            float halfStroke = strokePaint.getStrokeWidth() * 0.5f;
            rect.inset(halfStroke, halfStroke);
            if (bounds.width() > 0 && bounds.width() != lastW) {
                lastW = bounds.width();
                fillPaint.setShader(new LinearGradient(
                        bounds.left, bounds.top, bounds.right, bounds.bottom,
                        startColor, endColor, Shader.TileMode.CLAMP));
            }
        }

        @Override
        public void draw(Canvas canvas) {
            if (rect.width() <= 0f || rect.height() <= 0f) {
                return;
            }
            canvas.drawRoundRect(rect, radiusPx, radiusPx, fillPaint);
            canvas.drawRoundRect(rect, radiusPx, radiusPx, strokePaint);

            float pillW = 3.5f * density;
            float pillLeft = rect.left + 6f * density;
            float pillInsetV = Math.min(rect.height() * 0.24f, 16f * density);
            pillRect.set(pillLeft, rect.top + pillInsetV, pillLeft + pillW, rect.bottom - pillInsetV);
            canvas.drawRoundRect(pillRect, pillW * 0.5f, pillW * 0.5f, pillPaint);
        }

        @Override
        public void setAlpha(int alpha) {
            fillPaint.setAlpha(alpha);
            strokePaint.setAlpha(alpha);
            pillPaint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            fillPaint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
