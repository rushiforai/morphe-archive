package dev.materialtidal.extension.tidal.mediapages;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ExpressivePalette;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ToolbarScrimDrawable;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Coordinates Monet surfaces, FadingToolbar / standard Toolbar morphing, scroll parallax,
 * and safe square-artwork / clean-track-row polish across TIDAL Dynamic Pages
 * (Album, Artist, Contributor, Mix).
 */
final class ExpressiveDynamicPageController {

    private static final WeakHashMap<Object, ExpressiveDynamicPageController> BY_FRAGMENT = new WeakHashMap<>();
    private static final WeakHashMap<View, ExpressiveDynamicPageController> BY_TOOLBAR = new WeakHashMap<>();
    private static final WeakHashMap<View, ExpressiveDynamicPageController> BY_RV = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> STYLED_CHILD_ROWS = new WeakHashMap<>();

    private final Context context;
    private final float density;
    private final View rootView;
    private final ExpressivePalette palette;

    private final int idArtwork;
    private final int idArtistName;
    private final int idOptions;
    private final int idPlaybackFirst;
    private final int idPlaybackSecond;
    private final int idTitle;
    private final int idSubTitle;
    private final int idSecondaryGuide;
    private final int idFavoriteButton;
    private final int idDownloadButton;
    private final int idShareButton;
    private final int idIcon;
    private final int idText;
    private final int idRadialGradient;
    private final int idDlRadialGradient;
    private final int idDlIconState;
    private final int idDlProgressBar;
    private final int idDlText;

    private RecyclerView recyclerView;
    private ViewGroup toolbar;
    private ProgressBar progressBar;
    private boolean isFadingToolbar;

    private ColorDrawable toolbarBgDrawable;
    private dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit.ExpressiveToolbarBlurView toolbarBlurView;
    private final List<ToolbarScrimDrawable> toolbarScrims = new ArrayList<>();
    private float lastCollapseFraction;
    private boolean destroyed;
    private final WeakHashMap<View, Integer> mixSecondaryStates = new WeakHashMap<>();

    private WeakReference<ExpressiveAlbumHeaderController> albumHeaderRef;
    private WeakReference<ExpressiveArtistHeaderController> artistHeaderRef;

    static void onViewCreated(Object fragment, View rootView) {
        if (fragment == null || rootView == null) {
            return;
        }
        if (!MaterialYouConfig.isExpressiveAlbumsEnabled() && !MaterialYouConfig.isExpressiveArtistsEnabled()) {
            return;
        }
        ExpressiveDynamicPageController prev = BY_FRAGMENT.remove(fragment);
        if (prev != null) {
            prev.onDestroy();
        }
        ExpressiveDynamicPageController controller = new ExpressiveDynamicPageController(rootView);
        BY_FRAGMENT.put(fragment, controller);
    }

    static void onDestroyView(Object fragment) {
        if (fragment == null) {
            return;
        }
        ExpressiveDynamicPageController controller = BY_FRAGMENT.remove(fragment);
        if (controller != null) {
            controller.onDestroy();
        }
    }

    static ExpressiveDynamicPageController findForDescendant(View view) {
        View cur = view;
        while (cur != null) {
            if (cur instanceof RecyclerView) {
                ExpressiveDynamicPageController c = BY_RV.get(cur);
                if (c != null) {
                    return c;
                }
            }
            if (cur.getParent() instanceof View) {
                cur = (View) cur.getParent();
            } else {
                break;
            }
        }
        return null;
    }

    static void onFadingToolbarInit(View fadingToolbar) {
        if (fadingToolbar == null) {
            return;
        }
        ExpressiveDynamicPageController existing = BY_TOOLBAR.get(fadingToolbar);
        if (existing != null && !existing.destroyed) {
            existing.applyToolbarDefaults();
        }
    }

    static void onFadingToolbarAlphaUpdated(View fadingToolbar, float alphaFraction) {
        if (fadingToolbar == null) {
            return;
        }
        ExpressiveDynamicPageController controller = BY_TOOLBAR.get(fadingToolbar);
        if (controller != null && !controller.destroyed) {
            controller.onToolbarCollapseUpdated(ExpressiveMediaStyleKit.clamp01(alphaFraction));
        }
    }

    private ExpressiveDynamicPageController(View rootView) {
        this.rootView = rootView;
        this.context = rootView.getContext();
        this.density = context.getResources().getDisplayMetrics().density;
        this.palette = ExpressiveMediaStyleKit.buildMonetPalette();

        idArtwork = ExpressiveMediaStyleKit.getId(context, "artwork");
        idArtistName = ExpressiveMediaStyleKit.getId(context, "artistName");
        idOptions = ExpressiveMediaStyleKit.getId(context, "options");
        idPlaybackFirst = ExpressiveMediaStyleKit.getId(context, "playbackControlButtonFirst");
        idPlaybackSecond = ExpressiveMediaStyleKit.getId(context, "playbackControlButtonSecond");
        idTitle = ExpressiveMediaStyleKit.getId(context, "title");
        idSubTitle = ExpressiveMediaStyleKit.getId(context, "subTitle");
        idSecondaryGuide = ExpressiveMediaStyleKit.getId(context, "secondaryButtonsGuide");
        idFavoriteButton = ExpressiveMediaStyleKit.getId(context, "favoriteButton");
        idDownloadButton = ExpressiveMediaStyleKit.getId(context, "downloadButton");
        idShareButton = ExpressiveMediaStyleKit.getId(context, "shareButton");
        idIcon = ExpressiveMediaStyleKit.getId(context, "icon");
        idText = ExpressiveMediaStyleKit.getId(context, "text");
        idRadialGradient = ExpressiveMediaStyleKit.getId(context, "radialGradient");
        idDlRadialGradient = ExpressiveMediaStyleKit.getId(context, "downloadSecondaryActionButton_radialGradient");
        idDlIconState = ExpressiveMediaStyleKit.getId(context, "downloadSecondaryActionButton_iconDownloadState");
        idDlProgressBar = ExpressiveMediaStyleKit.getId(context, "downloadSecondaryActionButton_progressBar");
        idDlText = ExpressiveMediaStyleKit.getId(context, "downloadSecondaryActionButton_text");

        bindViews();
        applyExpressivePageStyle();
    }

    private void bindViews() {
        View rv = ExpressiveMediaStyleKit.findView(rootView, ExpressiveMediaStyleKit.getId(context, "recyclerView"));
        if (rv instanceof RecyclerView) {
            recyclerView = (RecyclerView) rv;
            BY_RV.put(recyclerView, this);
        }
        View tb = ExpressiveMediaStyleKit.findView(rootView, ExpressiveMediaStyleKit.getId(context, "toolbar"));
        if (tb instanceof ViewGroup) {
            toolbar = (ViewGroup) tb;
            isFadingToolbar = toolbar.getClass().getName().endsWith(".FadingToolbar");
            BY_TOOLBAR.put(toolbar, this);
        }
        View pb = ExpressiveMediaStyleKit.findView(rootView, ExpressiveMediaStyleKit.getId(context, "progressBar"));
        if (pb instanceof ProgressBar) {
            progressBar = (ProgressBar) pb;
        }
    }

    private void applyExpressivePageStyle() {
        rootView.setBackgroundColor(palette.surfaceBase);
        if (progressBar != null) {
            progressBar.setIndeterminateTintList(ColorStateList.valueOf(palette.primaryAccent));
        }

        if (recyclerView != null) {
            recyclerView.setBackgroundColor(palette.surfaceBase);
            recyclerView.setClipToPadding(false);
            recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
                @Override
                public void onScrolled(RecyclerView rv, int dx, int dy) {
                    if (destroyed) {
                        return;
                    }
                    int scrollY = computeHeaderScrollY(rv);
                    ExpressiveAlbumHeaderController album = albumHeaderRef != null ? albumHeaderRef.get() : null;
                    if (album != null) {
                        album.onScrollUpdated(scrollY);
                    }
                    ExpressiveArtistHeaderController artist = artistHeaderRef != null ? artistHeaderRef.get() : null;
                    if (artist != null) {
                        artist.onScrollUpdated(scrollY);
                    }
                }
            });
            recyclerView.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
                @Override
                public void onChildViewAttachedToWindow(View child) {
                    if (!destroyed && child != null) {
                        styleRecyclerChild(child);
                        MaterialYouColorEngine.adaptSubtreeForLightMode(child);
                    }
                }

                @Override
                public void onChildViewDetachedFromWindow(View child) {
                }
            });
        }

        applyToolbarDefaults();
        if (toolbar != null) {
            if (isFadingToolbar) {
                ExpressiveMediaStyleKit.attachToolbarChromeAutoRefresh(toolbar, () -> {
                    if (!destroyed) {
                        refreshToolbarStyling();
                    }
                });
            }
            toolbar.post(() -> {
                if (!destroyed) {
                    refreshToolbarStyling();
                }
            });
        }
    }

    private void applyToolbarDefaults() {
        if (toolbar == null || destroyed) {
            return;
        }
        toolbar.setElevation(0f);
        if (isFadingToolbar) {
            toolbarBgDrawable = new ColorDrawable(palette.surfaceBase);
            toolbarBgDrawable.setAlpha(0);
            toolbar.setBackground(toolbarBgDrawable);
            attachToolbarBlurView();
        } else {
            toolbar.setBackgroundColor(palette.surfaceBase);
        }
        refreshToolbarStyling();
    }

    private void attachToolbarBlurView() {
        if (toolbar == null || !(toolbar.getParent() instanceof ViewGroup)) {
            return;
        }
        ViewGroup parent = (ViewGroup) toolbar.getParent();
        if (toolbarBlurView == null) {
            toolbarBlurView = new dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit
                    .ExpressiveToolbarBlurView(toolbar.getContext());
            int insertIdx = Math.max(0, parent.indexOfChild(toolbar));
            parent.addView(toolbarBlurView, insertIdx,
                    new ViewGroup.LayoutParams(
                            Math.max(1, toolbar.getWidth()),
                            Math.max(1, toolbar.getHeight())));
        }
        toolbarBlurView.attach(parent, toolbar, recyclerView);
        float bgFrac = ExpressiveMediaStyleKit.smoothstep(0.52f, 0.94f, lastCollapseFraction);
        toolbarBlurView.updateAppearance(bgFrac, palette.surfaceContainer);
    }

    private void refreshToolbarStyling() {
        if (toolbar == null || destroyed) {
            return;
        }
        if (isFadingToolbar) {
            ExpressiveMediaStyleKit.styleToolbarChrome(toolbar, toolbarScrims, lastCollapseFraction, palette, density);
        } else {
            ExpressiveMediaStyleKit.tintToolbarMenuAndNav(toolbar, palette.onSurface);
        }
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof TextView) {
                TextView tv = (TextView) child;
                tv.setTextColor(palette.onSurface);
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, isFadingToolbar ? 18f : 20f);
                tv.setTypeface(tv.getTypeface(), Typeface.BOLD);
            }
        }
    }

    private void onToolbarCollapseUpdated(float collapse) {
        this.lastCollapseFraction = collapse;
        if (toolbar == null) {
            return;
        }
        float bgFrac = ExpressiveMediaStyleKit.smoothstep(0.52f, 0.94f, collapse);
        boolean useToolbarBlur = toolbarBlurView != null
                && dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit.isHardwareBlurSupported()
                && dev.materialtidal.extension.tidal.theme.MaterialYouConfig.isExpressiveBlurEnabled()
                && !dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine.isEffectiveAmoledBlack();
        if (toolbarBlurView != null) {
            toolbarBlurView.updateAppearance(useToolbarBlur ? bgFrac : 0f, palette.surfaceContainer);
        }
        if (toolbarBgDrawable != null) {
            toolbarBgDrawable.setColor(palette.surfaceBase);
            toolbarBgDrawable.setAlpha(useToolbarBlur ? 0 : Math.round(bgFrac * 255f));
            if (toolbar.getBackground() != toolbarBgDrawable) {
                toolbar.setBackground(toolbarBgDrawable);
            }
        }
        ExpressiveMediaStyleKit.updateToolbarScrims(toolbarScrims, collapse);
        if (toolbarScrims.isEmpty()) {
            refreshToolbarStyling();
        }
        for (int i = 0; i < toolbar.getChildCount(); i++) {
            View child = toolbar.getChildAt(i);
            if (child instanceof TextView) {
                TextView tv = (TextView) child;
                tv.setTextColor(palette.onSurface);
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
                tv.setTypeface(tv.getTypeface(), Typeface.BOLD);
                if (collapse <= 0.68f) {
                    tv.setAlpha(0f);
                    tv.setVisibility(View.GONE);
                } else {
                    float titleFrac = ExpressiveMediaStyleKit.smoothstep(0.70f, 1.0f, collapse);
                    tv.setVisibility(View.VISIBLE);
                    tv.setAlpha(titleFrac);
                    tv.setTranslationY((1f - titleFrac) * ExpressiveMediaStyleKit.dpf(density, 6f));
                }
            }
        }
    }

    private int computeHeaderScrollY(RecyclerView rv) {
        if (rv == null || rv.getChildCount() == 0) {
            return 0;
        }
        View first = rv.getChildAt(0);
        int pos = rv.getChildAdapterPosition(first);
        if (pos == 0) {
            return Math.max(0, -first.getTop() + rv.getPaddingTop());
        }
        int offset = rv.computeVerticalScrollOffset();
        return Math.max(1000, offset);
    }

    private void styleRecyclerChild(View child) {
        ExpressiveAlbumHeaderController album = ExpressiveAlbumHeaderController.findForItemView(child);
        if (album != null) {
            attachAlbumHeader(album);
            album.onScrollUpdated(computeHeaderScrollY(recyclerView));
            return;
        }
        ExpressiveArtistHeaderController artist = ExpressiveArtistHeaderController.findForItemView(child);
        if (artist != null) {
            attachArtistHeader(artist);
            artist.onScrollUpdated(computeHeaderScrollY(recyclerView));
            return;
        }

        if (isMixHeaderChild(child)) {
            styleMixHeader(child);
            return;
        }

        View art = ExpressiveMediaStyleKit.findView(child, idArtwork);
        if (art != null) {
            ExpressiveMediaStyleKit.setShapeableImageCornerRadiusIfSquare(
                    art, ExpressiveMediaStyleKit.dpf(density, 12f), density);
        }

        // Apply clean row polish (rounded ripple, subtle metadata tint) only to media track rows;
        // leave title text colors untouched so TIDAL's default active-track highlight remains native.
        View opts = ExpressiveMediaStyleKit.findView(child, idOptions);
        if (opts != null && MaterialYouConfig.isPlaylistTrackRowPolishEnabled()) {
            ExpressiveMediaStyleKit.styleCleanTrackRow(
                    child,
                    palette,
                    density,
                    idArtwork,
                    idArtistName,
                    idOptions
            );
        } else if (!Boolean.TRUE.equals(STYLED_CHILD_ROWS.get(child)) && child.isClickable()) {
            STYLED_CHILD_ROWS.put(child, Boolean.TRUE);
            if (child.getForeground() == null && child.getBackground() == null) {
                GradientDrawable mask = new GradientDrawable();
                mask.setShape(GradientDrawable.RECTANGLE);
                mask.setCornerRadius(ExpressiveMediaStyleKit.dpf(density, 16f));
                mask.setColor(0xFFFFFFFF);
                child.setForeground(new android.graphics.drawable.RippleDrawable(
                        ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(palette.primaryAccent, 0x26)),
                        null,
                        mask
                ));
            }
        }
    }

    void attachAlbumHeader(ExpressiveAlbumHeaderController header) {
        this.albumHeaderRef = new WeakReference<>(header);
    }

    void attachArtistHeader(ExpressiveArtistHeaderController header) {
        this.artistHeaderRef = new WeakReference<>(header);
    }

    private boolean isMixHeaderChild(View child) {
        if (child == null || idPlaybackFirst == 0 || idSubTitle == 0) {
            return false;
        }
        return ExpressiveMediaStyleKit.findView(child, idPlaybackFirst) != null
                && ExpressiveMediaStyleKit.findView(child, idSubTitle) != null
                && (idSecondaryGuide == 0 || ExpressiveMediaStyleKit.findView(child, idSecondaryGuide) != null);
    }

    private void styleMixHeader(View header) {
        header.setBackgroundColor(palette.surfaceBase);

        View art = ExpressiveMediaStyleKit.findView(header, idArtwork);
        if (art instanceof ImageView) {
            boolean light = MaterialYouColorEngine.isLightMode();
            int midTopAlpha = light ? 0x38 : 0x20;
            int midBotAlpha = light ? 0xE2 : 0xD2;
            GradientDrawable overlay = new GradientDrawable(
                    GradientDrawable.Orientation.TOP_BOTTOM,
                    new int[]{
                            0x00000000,
                            MaterialYouColorEngine.withAlpha(palette.surfaceBase, midTopAlpha),
                            MaterialYouColorEngine.withAlpha(palette.surfaceBase, midBotAlpha),
                            palette.surfaceBase
                    });
            art.setForeground(overlay);
            art.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        }

        View title = ExpressiveMediaStyleKit.findView(header, idTitle);
        if (title instanceof TextView) {
            TextView tv = (TextView) title;
            tv.setTextColor(palette.onSurface);
            tv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        }

        View sub = ExpressiveMediaStyleKit.findView(header, idSubTitle);
        if (sub instanceof TextView) {
            TextView tv = (TextView) sub;
            tv.setTextColor(palette.onSurfaceVariant);
            tv.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        }

        View playBtn = ExpressiveMediaStyleKit.findView(header, idPlaybackFirst);
        View shuffleBtn = ExpressiveMediaStyleKit.findView(header, idPlaybackSecond);
        if (playBtn != null) {
            ExpressiveMediaStyleKit.stylePrimaryPillButton(playBtn, true, palette, density, idIcon, idText);
            ExpressiveMediaStyleKit.attachSpringPressEffect(playBtn);
        }
        if (shuffleBtn != null) {
            boolean shufflePrimary = playBtn == null || playBtn.getVisibility() != View.VISIBLE;
            ExpressiveMediaStyleKit.stylePrimaryPillButton(shuffleBtn, shufflePrimary, palette, density, idIcon, idText);
            ExpressiveMediaStyleKit.attachSpringPressEffect(shuffleBtn);
        }

        View dlBtn = ExpressiveMediaStyleKit.findView(header, idDownloadButton);
        View favBtn = ExpressiveMediaStyleKit.findView(header, idFavoriteButton);
        View shareBtn = ExpressiveMediaStyleKit.findView(header, idShareButton);
        styleMixSecondaryView(favBtn, false);
        styleMixSecondaryView(dlBtn, true);
        styleMixSecondaryView(shareBtn, false);
        if (header instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) header;
            for (int i = 0; i < vg.getChildCount(); i++) {
                View c = vg.getChildAt(i);
                if (c != null && c != favBtn && c != dlBtn && c != shareBtn) {
                    String n = c.getClass().getName();
                    if (n.endsWith(".DownloadSecondaryActionButton")) {
                        styleMixSecondaryView(c, true);
                    } else if (n.endsWith(".SecondaryActionButton")) {
                        styleMixSecondaryView(c, false);
                    }
                }
            }
        }
    }

    private void styleMixSecondaryView(final View btn, final boolean isDownload) {
        if (btn == null) {
            return;
        }
        btn.setTag(MaterialYouColorEngine.TAG_EXPRESSIVE_STYLED, Boolean.TRUE);
        boolean alreadyTracked = mixSecondaryStates.containsKey(btn);
        applyMixSecondaryStyleIfChanged(btn, isDownload);
        if (!alreadyTracked) {
            btn.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                if (!destroyed) {
                    applyMixSecondaryStyleIfChanged(btn, isDownload);
                }
            });
        }
    }

    private void applyMixSecondaryStyleIfChanged(View btn, boolean isDownload) {
        Integer pct = isDownload ? ExpressiveMediaStyleKit.getDownloadVisiblePercentage(btn) : null;
        int stateKey = isDownload
                ? ((pct != null ? pct : -1) | (btn.isEnabled() ? 0 : 0x400))
                : ((btn.isSelected() ? 1 : 0) | (btn.isEnabled() ? 0 : 0x400));
        Integer prevKey = mixSecondaryStates.get(btn);
        if (prevKey != null && prevKey == stateKey) {
            return;
        }
        mixSecondaryStates.put(btn, stateKey);
        if (isDownload) {
            ExpressiveMediaStyleKit.styleDownloadActionButton(
                    btn, pct, palette,
                    idDlRadialGradient, idDlIconState, idDlProgressBar, idDlText);
        } else {
            ExpressiveMediaStyleKit.styleStandardSecondaryButton(
                    btn, btn.isSelected(), btn.isEnabled(), palette,
                    idIcon, idText, idRadialGradient);
        }
    }

    private void onDestroy() {
        destroyed = true;
        if (toolbar != null) {
            BY_TOOLBAR.remove(toolbar);
        }
        if (recyclerView != null) {
            BY_RV.remove(recyclerView);
        }
        if (toolbarBlurView != null) {
            toolbarBlurView.release();
            if (toolbarBlurView.getParent() instanceof ViewGroup) {
                ((ViewGroup) toolbarBlurView.getParent()).removeView(toolbarBlurView);
            }
            toolbarBlurView = null;
        }
        toolbarScrims.clear();
        ExpressiveAlbumHeaderController album = albumHeaderRef != null ? albumHeaderRef.get() : null;
        if (album != null) {
            album.onDestroy();
        }
        ExpressiveArtistHeaderController artist = artistHeaderRef != null ? artistHeaderRef.get() : null;
        if (artist != null) {
            artist.onDestroy();
        }
    }
}
