package dev.materialtidal.extension.tidal.playlist;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.core.view.ViewCompat;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ExpressivePalette;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.PaletteTransitionController;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ToolbarScrimDrawable;
import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Orchestrates the Material 3 Expressive redesign of TIDAL's Playlist screen:
 * full-bleed downward-fading hero cover, adaptive/Monet tonal palette, tactile pill
 * Play/Shuffle buttons, connected M3 Expressive secondary action group, scroll-morphing
 * toolbar with circular scrims, and rounded clean track rows preserving default active highlight.
 */
final class ExpressivePlaylistController implements ExpressivePlaylistBridge.AccentProvider {

    private static final WeakHashMap<View, Boolean> ROUNDED_ROW_ARTWORK = new WeakHashMap<>();

    // Cached resource IDs per package
    private static volatile String cachedPkg;
    private static int idHeader;
    private static int idPlaylistHeaderLayout;
    private static int idEmptyMessage;
    private static int idRecyclerView;
    private static int idGradientToolbar;
    private static int idProgressBar;

    private static int idArtwork;
    private static int idArtworkBackground;
    private static int idTitle;
    private static int idCreatorsInfo;
    private static int idDescription;
    private static int idPlaylistInfo;
    private static int idPlaylistFans;

    private static int idPlayButton;
    private static int idShufflePlayButton;
    private static int idFavoriteButton;
    private static int idEditButton;
    private static int idDownloadButton;
    private static int idPrivacyButton;
    private static int idShareButton;

    private static int idIcon;
    private static int idText;
    private static int idRadialGradient;
    private static int idDlRadialGradient;
    private static int idDlIconState;
    private static int idDlProgressBar;
    private static int idDlText;

    private static int idArtistName;
    private static int idOptions;

    /**
     * Custom {@code dev.materialtidal.*} container so
     * {@link MaterialYouColorEngine}'s legacy XML background pass skips its subtree.
     */
    private static final class ExpressivePlaylistHeaderContainer extends FrameLayout {
        ExpressivePlaylistHeaderContainer(Context context) {
            super(context);
        }
    }

    private final Context context;
    private final float density;
    private final View rootView;

    private View headerAppBar;
    private ViewGroup playlistHeaderLayout;
    private TextView emptyMessage;
    private RecyclerView recyclerView;
    private ViewGroup toolbar;
    private ProgressBar loadingSpinner;

    private ImageView artwork;
    private View artworkBackground;
    private TextView titleView;
    private TextView creatorsView;
    private TextView descriptionView;
    private TextView playlistInfoView;
    private TextView playlistFansView;

    private View playButton;
    private View shuffleButton;
    private View favoriteButton;
    private View editButton;
    private View downloadButton;
    private View privacyButton;
    private View shareButton;

    private ExpressivePlaylistFadeOverlay fadeOverlay;
    private LinearLayout foregroundColumn;
    private LinearLayout metadataRow;
    private LinearLayout primaryActionRow;
    private LinearLayout secondaryActionRow;

    private ColorDrawable toolbarBgDrawable;
    private ExpressiveBlurKit.ExpressiveToolbarBlurView toolbarBlurView;
    private final List<ToolbarScrimDrawable> toolbarScrims = new ArrayList<>();

    private int heroCoverHeightPx;
    private float statusBarInsetPx;
    private float lastCollapseFraction;
    private boolean headerRebuilt;
    private boolean destroyed;

    private final PaletteTransitionController paletteCtrl = new PaletteTransitionController(this::syncAllColors);
    private final ExpressivePalette activePalette = paletteCtrl.active;

    ExpressivePlaylistController(View rootView) {
        this.rootView = rootView;
        this.context = rootView.getContext();
        this.density = context.getResources().getDisplayMetrics().density;
        ensureIds(context);

        bindViews();
        statusBarInsetPx = ExpressiveMediaStyleKit.resolveStatusBarInsetPx(rootView, density);
        applyExpressiveLayout();
    }

    private static void ensureIds(Context ctx) {
        String pkg = ctx.getPackageName();
        if (pkg != null && pkg.equals(cachedPkg)) {
            return;
        }
        Resources res = ctx.getResources();
        idHeader = res.getIdentifier("header", "id", pkg);
        idPlaylistHeaderLayout = res.getIdentifier("playlistHeaderLayout", "id", pkg);
        idEmptyMessage = res.getIdentifier("emptyMessage", "id", pkg);
        idRecyclerView = res.getIdentifier("recyclerView", "id", pkg);
        idGradientToolbar = res.getIdentifier("gradientToolbar", "id", pkg);
        idProgressBar = res.getIdentifier("progressBar", "id", pkg);

        idArtwork = res.getIdentifier("artwork", "id", pkg);
        idArtworkBackground = res.getIdentifier("artworkBackground", "id", pkg);
        idTitle = res.getIdentifier("title", "id", pkg);
        idCreatorsInfo = res.getIdentifier("creatorsInfo", "id", pkg);
        idDescription = res.getIdentifier("description", "id", pkg);
        idPlaylistInfo = res.getIdentifier("playlistInfo", "id", pkg);
        idPlaylistFans = res.getIdentifier("playlistFans", "id", pkg);

        idPlayButton = res.getIdentifier("playButton", "id", pkg);
        idShufflePlayButton = res.getIdentifier("shufflePlayButton", "id", pkg);
        idFavoriteButton = res.getIdentifier("favoriteButton", "id", pkg);
        idEditButton = res.getIdentifier("editButton", "id", pkg);
        idDownloadButton = res.getIdentifier("downloadButton", "id", pkg);
        idPrivacyButton = res.getIdentifier("privacyButton", "id", pkg);
        idShareButton = res.getIdentifier("shareButton", "id", pkg);

        idIcon = res.getIdentifier("icon", "id", pkg);
        idText = res.getIdentifier("text", "id", pkg);
        idRadialGradient = res.getIdentifier("radialGradient", "id", pkg);
        idDlRadialGradient = res.getIdentifier("downloadSecondaryActionButton_radialGradient", "id", pkg);
        idDlIconState = res.getIdentifier("downloadSecondaryActionButton_iconDownloadState", "id", pkg);
        idDlProgressBar = res.getIdentifier("downloadSecondaryActionButton_progressBar", "id", pkg);
        idDlText = res.getIdentifier("downloadSecondaryActionButton_text", "id", pkg);

        idArtistName = res.getIdentifier("artistName", "id", pkg);
        idOptions = res.getIdentifier("options", "id", pkg);
        cachedPkg = pkg;
    }

    private void bindViews() {
        headerAppBar = findView(rootView, idHeader);
        View headerLayout = findView(rootView, idPlaylistHeaderLayout);
        if (headerLayout instanceof ViewGroup) {
            playlistHeaderLayout = (ViewGroup) headerLayout;
        }
        View empty = findView(rootView, idEmptyMessage);
        if (empty instanceof TextView) {
            emptyMessage = (TextView) empty;
        }
        View rv = findView(rootView, idRecyclerView);
        if (rv instanceof RecyclerView) {
            recyclerView = (RecyclerView) rv;
        }
        View tb = findView(rootView, idGradientToolbar);
        if (tb instanceof ViewGroup) {
            toolbar = (ViewGroup) tb;
        }
        View pb = findView(rootView, idProgressBar);
        if (pb instanceof ProgressBar) {
            loadingSpinner = (ProgressBar) pb;
        }

        View art = findView(rootView, idArtwork);
        if (art instanceof ImageView) {
            artwork = (ImageView) art;
        }
        artworkBackground = findView(rootView, idArtworkBackground);
        View t = findView(rootView, idTitle);
        if (t instanceof TextView) {
            titleView = (TextView) t;
        }
        View c = findView(rootView, idCreatorsInfo);
        if (c instanceof TextView) {
            creatorsView = (TextView) c;
        }
        View d = findView(rootView, idDescription);
        if (d instanceof TextView) {
            descriptionView = (TextView) d;
        }
        View info = findView(rootView, idPlaylistInfo);
        if (info instanceof TextView) {
            playlistInfoView = (TextView) info;
        }
        View fans = findView(rootView, idPlaylistFans);
        if (fans instanceof TextView) {
            playlistFansView = (TextView) fans;
        }

        playButton = findView(rootView, idPlayButton);
        shuffleButton = findView(rootView, idShufflePlayButton);
        favoriteButton = findView(rootView, idFavoriteButton);
        editButton = findView(rootView, idEditButton);
        downloadButton = findView(rootView, idDownloadButton);
        privacyButton = findView(rootView, idPrivacyButton);
        shareButton = findView(rootView, idShareButton);
    }

    private static View findView(View root, int id) {
        return (root != null && id != 0) ? root.findViewById(id) : null;
    }

    private int dp(float val) {
        return Math.round(val * density);
    }

    private float dpf(float val) {
        return val * density;
    }

    private void applyExpressiveLayout() {
        if (!MaterialYouConfig.isExpressivePlaylistEnabled() || playlistHeaderLayout == null) {
            return;
        }

        int surfaceBase = activePalette.surfaceBase;
        rootView.setBackgroundColor(surfaceBase);
        if (headerAppBar != null) {
            headerAppBar.setBackgroundColor(surfaceBase);
        }
        playlistHeaderLayout.setBackgroundColor(surfaceBase);
        if (recyclerView != null) {
            recyclerView.setBackgroundColor(surfaceBase);
            recyclerView.setClipToPadding(false);
            recyclerView.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
                @Override
                public void onChildViewAttachedToWindow(View child) {
                    try {
                        if (destroyed || child == null) {
                            return;
                        }
                        if (MaterialYouConfig.isPlaylistTrackRowPolishEnabled()
                                && !Boolean.TRUE.equals(ROUNDED_ROW_ARTWORK.get(child))) {
                            View rowArt = findView(child, idArtwork);
                            if (rowArt != null) {
                                ExpressiveMediaStyleKit.setShapeableImageCornerRadiusIfSquare(rowArt, dpf(12f), density);
                                ROUNDED_ROW_ARTWORK.put(child, Boolean.TRUE);
                            }
                        }
                        MaterialYouColorEngine.adaptSubtreeForLightMode(child);
                    } catch (Throwable ignored) {
                    }
                }

                @Override
                public void onChildViewDetachedFromWindow(View child) {
                }
            });
        }
        if (loadingSpinner != null) {
            loadingSpinner.setIndeterminateTintList(ColorStateList.valueOf(activePalette.primaryAccent));
        }

        // Tighten AppBar's inner FrameLayout bottom margin
        ViewParent headerParent = playlistHeaderLayout.getParent();
        if (headerParent instanceof ViewGroup) {
            ViewGroup frameParent = (ViewGroup) headerParent;
            ViewGroup.LayoutParams fLp = frameParent.getLayoutParams();
            if (fLp instanceof ViewGroup.MarginLayoutParams) {
                ((ViewGroup.MarginLayoutParams) fLp).bottomMargin = dp(4f);
                frameParent.setLayoutParams(fLp);
            }
        }

        // Allow header height to wrap cleanly around our rebuilt Expressive layout
        ViewGroup.LayoutParams headerLp = playlistHeaderLayout.getLayoutParams();
        if (headerLp != null) {
            headerLp.width = ViewGroup.LayoutParams.MATCH_PARENT;
            headerLp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            playlistHeaderLayout.setLayoutParams(headerLp);
        }

        Configuration cfg = context.getResources().getConfiguration();
        int screenW = context.getResources().getDisplayMetrics().widthPixels;
        int screenH = context.getResources().getDisplayMetrics().heightPixels;
        boolean isWide = cfg.smallestScreenWidthDp >= 600 || screenW > screenH;
        boolean heroFade = MaterialYouConfig.isPlaylistHeroCoverFadeEnabled();

        if (heroFade) {
            heroCoverHeightPx = isWide
                    ? dp(290f)
                    : Math.round(Math.min(screenW * 0.94f, dp(400f)));
        } else {
            heroCoverHeightPx = Math.round(statusBarInsetPx + dp(68f) + dp(220f) + dp(24f));
        }

        rebuildHeaderHierarchy(heroFade, isWide);
        setupToolbarDefaults();
        styleEmptyMessage();
        styleToolbarIcons();
        syncAllColors();
        syncPrimaryButtons();
        syncSecondaryButtons();

        if (fadeOverlay != null && artwork != null) {
            fadeOverlay.attachArtworkObserver(artwork, paletteCtrl::extractFromDrawable);
        }
    }

    private void rebuildHeaderHierarchy(boolean heroFade, boolean isWide) {
        if (headerRebuilt) {
            return;
        }
        headerRebuilt = true;

        // Detach live views while keeping all TIDAL references + click listeners intact
        detachFromParent(artwork);
        detachFromParent(artworkBackground);
        detachFromParent(titleView);
        detachFromParent(creatorsView);
        detachFromParent(descriptionView);
        detachFromParent(playlistInfoView);
        detachFromParent(playlistFansView);
        detachFromParent(playButton);
        detachFromParent(shuffleButton);
        detachFromParent(favoriteButton);
        detachFromParent(editButton);
        detachFromParent(downloadButton);
        detachFromParent(privacyButton);
        detachFromParent(shareButton);

        playlistHeaderLayout.removeAllViews();

        ExpressivePlaylistHeaderContainer container = new ExpressivePlaylistHeaderContainer(context);
        container.setClipChildren(false);
        container.setClipToPadding(false);

        // Read live status bar inset on our own custom view without interfering with Toolbar insets
        container.setOnApplyWindowInsetsListener((v, insets) -> {
            if (destroyed || insets == null) {
                return insets;
            }
            try {
                int top = insets.getInsets(WindowInsets.Type.statusBars()).top;
                if (top > 0 && Math.abs(top - statusBarInsetPx) > 1f) {
                    statusBarInsetPx = top;
                    updateTopSpacingForInsets();
                }
            } catch (Throwable ignored) {
            }
            return insets;
        });

        // 1. Cover artwork + downward fade scrim
        fadeOverlay = new ExpressivePlaylistFadeOverlay(context);
        fadeOverlay.setHeroFadeEnabled(heroFade);
        fadeOverlay.setHeroCoverHeightPx(heroCoverHeightPx);
        fadeOverlay.setStatusBarInsetPx(statusBarInsetPx);
        fadeOverlay.setColors(activePalette.surfaceBase, activePalette.atmosphericTint);

        if (artworkBackground != null) {
            artworkBackground.setVisibility(View.GONE);
        }

        if (artwork != null) {
            // Neutralize TIDAL's Lgtj;.b status-bar padding listener so full-bleed reaches y=0
            ViewCompat.setOnApplyWindowInsetsListener(artwork, null);
            artwork.setOnApplyWindowInsetsListener(null);
            artwork.setPadding(0, 0, 0, 0);
            artwork.setForeground(null);
            artwork.setElevation(0f);
            artwork.setAdjustViewBounds(false);
            artwork.setScaleType(ImageView.ScaleType.CENTER_CROP);

            if (heroFade) {
                setShapeableImageCornerRadius(artwork, 0f);
                FrameLayout.LayoutParams artLp = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        heroCoverHeightPx,
                        Gravity.TOP
                );
                container.addView(artwork, artLp);
                container.addView(fadeOverlay, new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT
                ));
            } else {
                container.addView(fadeOverlay, new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT
                ));
                setShapeableImageCornerRadius(artwork, dpf(24f));
                artwork.setElevation(dpf(10f));
                int size = dp(220f);
                FrameLayout.LayoutParams artLp = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
                artLp.topMargin = Math.round(statusBarInsetPx + dp(66f));
                container.addView(artwork, artLp);
            }
        } else {
            container.addView(fadeOverlay, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            ));
        }

        // 2. Editorial foreground column
        foregroundColumn = new LinearLayout(context);
        foregroundColumn.setOrientation(LinearLayout.VERTICAL);
        foregroundColumn.setClipChildren(false);
        foregroundColumn.setClipToPadding(false);
        updateForegroundColumnPadding(heroFade);

        // Title
        if (titleView != null) {
            disableSlidingTextMarquee(titleView);
            titleView.setGravity(Gravity.START);
            titleView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 28f);
            titleView.setTypeface(titleView.getTypeface(), android.graphics.Typeface.BOLD);
            titleView.setLetterSpacing(-0.02f);
            titleView.setLineSpacing(dpf(2f), 1f);
            if (MaterialYouColorEngine.isLightMode(context)) {
                titleView.setShadowLayer(0f, 0f, 0f, 0);
            } else {
                titleView.setShadowLayer(dpf(4f), 0f, dpf(1f), 0x48000000);
            }
            titleView.setPadding(0, 0, 0, 0);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            foregroundColumn.addView(titleView, lp);
        }

        // Creators
        if (creatorsView != null) {
            disableSlidingTextMarquee(creatorsView);
            creatorsView.setMaxLines(1);
            creatorsView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            creatorsView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            creatorsView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            creatorsView.setCompoundDrawablePadding(dp(4f));
            creatorsView.setPadding(0, 0, 0, 0);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.topMargin = dp(6f);
            foregroundColumn.addView(creatorsView, lp);
        }

        // Description
        if (descriptionView != null) {
            descriptionView.setGravity(Gravity.START);
            descriptionView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            descriptionView.setMaxLines(2);
            descriptionView.setEllipsize(TextUtils.TruncateAt.END);
            descriptionView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            descriptionView.setLineSpacing(dpf(2f), 1f);
            descriptionView.setPadding(0, 0, 0, 0);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.topMargin = dp(6f);
            foregroundColumn.addView(descriptionView, lp);
        }

        // Metadata Row (duration/tracks + fans)
        metadataRow = new LinearLayout(context);
        metadataRow.setOrientation(LinearLayout.HORIZONTAL);
        metadataRow.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
        if (playlistInfoView != null) {
            playlistInfoView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            playlistInfoView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            playlistInfoView.setLetterSpacing(0.05f);
            playlistInfoView.setPadding(0, 0, 0, 0);
            metadataRow.addView(playlistInfoView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }
        if (playlistFansView != null) {
            playlistFansView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            playlistFansView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            playlistFansView.setLetterSpacing(0.05f);
            playlistFansView.setPadding(0, 0, 0, 0);
            playlistFansView.setCompoundDrawablePadding(dp(4f));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.setMarginStart(dp(10f));
            metadataRow.addView(playlistFansView, lp);
        }
        LinearLayout.LayoutParams metaLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        metaLp.topMargin = dp(10f);
        foregroundColumn.addView(metadataRow, metaLp);

        // Primary Action Row (Play + Shuffle)
        primaryActionRow = new LinearLayout(context);
        primaryActionRow.setOrientation(LinearLayout.HORIZONTAL);
        primaryActionRow.setGravity(Gravity.CENTER_VERTICAL);
        primaryActionRow.setClipChildren(false);
        primaryActionRow.setClipToPadding(false);

        if (playButton != null) {
            attachSpringPressEffect(playButton);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(52f), 1f);
            primaryActionRow.addView(playButton, lp);
        }
        if (shuffleButton != null) {
            attachSpringPressEffect(shuffleButton);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(52f), 1f);
            lp.setMarginStart(dp(10f));
            primaryActionRow.addView(shuffleButton, lp);
        }

        LinearLayout.LayoutParams primaryLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        primaryLp.topMargin = dp(18f);
        foregroundColumn.addView(primaryActionRow, primaryLp);

        // Secondary Connected Action Row (Favorite, Edit, Download, Privacy, Share)
        secondaryActionRow = new LinearLayout(context);
        secondaryActionRow.setOrientation(LinearLayout.HORIZONTAL);
        secondaryActionRow.setGravity(Gravity.CENTER_VERTICAL);
        secondaryActionRow.setClipChildren(false);
        secondaryActionRow.setClipToPadding(false);

        View[] secBtns = new View[]{favoriteButton, editButton, downloadButton, privacyButton, shareButton};
        for (View btn : secBtns) {
            if (btn == null) {
                continue;
            }
            btn.setMinimumWidth(0);
            btn.setPadding(dp(4f), dp(9f), dp(4f), dp(8f));
            ExpressiveMediaStyleKit.attachConnectedExpressivePressEffect(secondaryActionRow, btn);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(56f), 1f);
            secondaryActionRow.addView(btn, lp);
        }

        LinearLayout.LayoutParams secLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        secLp.topMargin = dp(10f);
        foregroundColumn.addView(secondaryActionRow, secLp);
        if (MaterialYouConfig.isHidePlaylistActionButtonsEnabled()) {
            secondaryActionRow.setVisibility(View.GONE);
        }

        container.addView(foregroundColumn, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        playlistHeaderLayout.addView(container, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));
    }

    private void updateForegroundColumnPadding(boolean heroFade) {
        if (foregroundColumn == null) {
            return;
        }
        int hPad = dp(20f);
        int topPad;
        if (heroFade) {
            topPad = Math.max(Math.round(statusBarInsetPx + dp(112f)), heroCoverHeightPx - dp(96f));
        } else {
            topPad = Math.round(statusBarInsetPx + dp(66f) + dp(220f) + dp(20f));
        }
        foregroundColumn.setPaddingRelative(hPad, topPad, hPad, dp(10f));
    }

    private void updateTopSpacingForInsets() {
        boolean heroFade = MaterialYouConfig.isPlaylistHeroCoverFadeEnabled();
        if (!heroFade) {
            heroCoverHeightPx = Math.round(statusBarInsetPx + dp(68f) + dp(220f) + dp(24f));
            if (artwork != null && artwork.getLayoutParams() instanceof FrameLayout.LayoutParams) {
                FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) artwork.getLayoutParams();
                lp.topMargin = Math.round(statusBarInsetPx + dp(66f));
                artwork.setLayoutParams(lp);
            }
        }
        if (fadeOverlay != null) {
            fadeOverlay.setHeroCoverHeightPx(heroCoverHeightPx);
            fadeOverlay.setStatusBarInsetPx(statusBarInsetPx);
        }
        updateForegroundColumnPadding(heroFade);
    }

    private static void detachFromParent(View v) {
        if (v != null && v.getParent() instanceof ViewGroup) {
            ((ViewGroup) v.getParent()).removeView(v);
        }
    }

    private void setupToolbarDefaults() {
        if (toolbar == null) {
            return;
        }
        toolbarBgDrawable = new ColorDrawable(activePalette.surfaceBase);
        toolbarBgDrawable.setAlpha(0);
        toolbar.setBackground(toolbarBgDrawable);
        toolbar.setElevation(0f);

        if (toolbar.getParent() instanceof ViewGroup) {
            ViewGroup parent = (ViewGroup) toolbar.getParent();
            if (toolbarBlurView == null) {
                toolbarBlurView = new ExpressiveBlurKit.ExpressiveToolbarBlurView(context);
                int insertIdx = Math.max(0, parent.indexOfChild(toolbar));
                parent.addView(toolbarBlurView, insertIdx,
                        new ViewGroup.LayoutParams(
                                Math.max(1, toolbar.getWidth()),
                                Math.max(1, toolbar.getHeight())));
            }
            toolbarBlurView.attach(parent, toolbar, recyclerView != null ? recyclerView : headerAppBar);
            float bgFrac = smoothstep(0.52f, 0.94f, lastCollapseFraction);
            boolean useBlur = isToolbarBlurActive();
            toolbarBlurView.updateAppearance(useBlur ? bgFrac : 0f, activePalette.surfaceBase);
        }
        ExpressiveMediaStyleKit.attachToolbarChromeAutoRefresh(toolbar, this::styleToolbarIcons);
    }

    private boolean isToolbarBlurActive() {
        return ExpressiveBlurKit.isHardwareBlurSupported()
                && MaterialYouConfig.isExpressiveBlurEnabled()
                && !MaterialYouColorEngine.isEffectiveAmoledBlack();
    }

    // ---- Lifecycle & Hook Callbacks ----

    void onButtonsUpdated() {
        if (destroyed || !MaterialYouConfig.isExpressivePlaylistEnabled()) {
            return;
        }
        syncPrimaryButtons();
        syncSecondaryButtons();
        if (toolbar != null) {
            toolbar.post(this::styleToolbarIcons);
        }
    }

    void onHeaderDataUpdated() {
        if (destroyed || !MaterialYouConfig.isExpressivePlaylistEnabled()) {
            return;
        }
        if (titleView != null) {
            disableSlidingTextMarquee(titleView);
        }
        if (creatorsView != null) {
            disableSlidingTextMarquee(creatorsView);
        }
        if (metadataRow != null) {
            boolean hasInfo = playlistInfoView != null && playlistInfoView.getVisibility() == View.VISIBLE
                    && !TextUtils.isEmpty(playlistInfoView.getText());
            boolean hasFans = playlistFansView != null && playlistFansView.getVisibility() == View.VISIBLE
                    && !TextUtils.isEmpty(playlistFansView.getText());
            metadataRow.setVisibility((hasInfo || hasFans) ? View.VISIBLE : View.GONE);
            if (playlistFansView != null && playlistFansView.getLayoutParams() instanceof LinearLayout.LayoutParams) {
                LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) playlistFansView.getLayoutParams();
                lp.setMarginStart(hasInfo ? dp(10f) : 0);
                playlistFansView.setLayoutParams(lp);
            }
        }
        syncTypographyColors();
        styleEmptyMessage();
        syncPrimaryButtons();
        syncSecondaryButtons();
        if (fadeOverlay != null) {
            fadeOverlay.checkArtworkDrawableChanged();
        }
    }

    void onMenuCreated() {
        if (destroyed || !MaterialYouConfig.isExpressivePlaylistEnabled()) {
            return;
        }
        styleToolbarIcons();
        if (toolbar != null) {
            toolbar.post(this::styleToolbarIcons);
        }
    }

    boolean onArtworkLoading() {
        if (destroyed || !MaterialYouConfig.isExpressivePlaylistEnabled()) {
            return false;
        }
        if (artworkBackground != null) {
            artworkBackground.setVisibility(View.GONE);
        }
        return MaterialYouConfig.isPlaylistHeroCoverFadeEnabled();
    }

    boolean onOffsetChanged(View toolbarTitleView, View appBar, int verticalOffset) {
        if (destroyed || !MaterialYouConfig.isExpressivePlaylistEnabled()) {
            return false;
        }
        int toolbarH = toolbar != null && toolbar.getHeight() > 0 ? toolbar.getHeight() : dp(84f);
        int range = Math.max(1, heroCoverHeightPx - toolbarH);
        float collapse = clamp01(-verticalOffset / (float) range);
        lastCollapseFraction = collapse;

        if (artwork != null && MaterialYouConfig.isPlaylistHeroCoverFadeEnabled()) {
            artwork.setTranslationY(-verticalOffset * 0.35f);
        }
        if (fadeOverlay != null) {
            fadeOverlay.setCollapseFraction(collapse);
        }

        // Smoothly solidify toolbar background (or frosted glass blur) across 0.52 -> 0.94
        float bgFrac = smoothstep(0.52f, 0.94f, collapse);
        boolean useToolbarBlur = toolbarBlurView != null && isToolbarBlurActive();
        if (toolbarBlurView != null) {
            toolbarBlurView.updateAppearance(useToolbarBlur ? bgFrac : 0f, activePalette.surfaceBase);
        }
        if (toolbarBgDrawable != null) {
            toolbarBgDrawable.setColor(activePalette.surfaceBase);
            toolbarBgDrawable.setAlpha(useToolbarBlur ? 0 : Math.round(bgFrac * 255f));
        }

        // Crossfade circular scrim pills out as toolbar solidifies
        ExpressiveMediaStyleKit.updateToolbarScrims(toolbarScrims, collapse);

        // Reveal toolbar title smoothly across 0.70 -> 1.00
        if (toolbarTitleView != null) {
            if (toolbarTitleView instanceof TextView) {
                TextView tv = (TextView) toolbarTitleView;
                tv.setTextColor(activePalette.onSurface);
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
                tv.setTypeface(tv.getTypeface(), android.graphics.Typeface.BOLD);
            }
            if (collapse <= 0.68f) {
                toolbarTitleView.setAlpha(0f);
                toolbarTitleView.setVisibility(View.GONE);
            } else {
                float titleFrac = smoothstep(0.70f, 1.0f, collapse);
                toolbarTitleView.setVisibility(View.VISIBLE);
                toolbarTitleView.setAlpha(titleFrac);
                toolbarTitleView.setTranslationY((1f - titleFrac) * dpf(6f));
            }
        }
        return true;
    }

    void onSecondaryButtonStateUpdated() {
        if (!destroyed && MaterialYouConfig.isExpressivePlaylistEnabled()) {
            syncSecondaryButtons();
        }
    }

    void onDownloadButtonStateUpdated() {
        if (!destroyed && MaterialYouConfig.isExpressivePlaylistEnabled()) {
            syncSecondaryButtons();
        }
    }

    void tintDownloadCirclePaint(Paint paint) {
        if (paint != null && !destroyed && MaterialYouConfig.isExpressivePlaylistEnabled()) {
            paint.setColor(activePalette.primaryAccent);
        }
    }

    void styleTrackRow(View itemView, boolean isActive) {
        if (itemView == null || destroyed || !MaterialYouConfig.isPlaylistTrackRowPolishEnabled()) {
            return;
        }
        ExpressiveMediaStyleKit.styleCleanTrackRow(
                itemView,
                activePalette,
                density,
                idArtwork,
                idArtistName,
                idOptions
        );
    }

    void onDestroy() {
        destroyed = true;
        paletteCtrl.destroy();
        if (toolbarBlurView != null) {
            toolbarBlurView.release();
            detachFromParent(toolbarBlurView);
            toolbarBlurView = null;
        }
        if (fadeOverlay != null) {
            fadeOverlay.attachArtworkObserver(null, null);
        }
        toolbarScrims.clear();
    }

    // ---- Styling & Sync Helpers ----

    private void syncAllColors() {
        if (destroyed) {
            return;
        }
        rootView.setBackgroundColor(activePalette.surfaceBase);
        if (headerAppBar != null) {
            headerAppBar.setBackgroundColor(activePalette.surfaceBase);
        }
        if (playlistHeaderLayout != null) {
            playlistHeaderLayout.setBackgroundColor(activePalette.surfaceBase);
        }
        if (recyclerView != null) {
            recyclerView.setBackgroundColor(activePalette.surfaceBase);
        }
        if (loadingSpinner != null) {
            loadingSpinner.setIndeterminateTintList(ColorStateList.valueOf(activePalette.primaryAccent));
        }
        if (fadeOverlay != null) {
            fadeOverlay.setColors(activePalette.surfaceBase, activePalette.atmosphericTint);
        }
        float bgFrac = smoothstep(0.52f, 0.94f, lastCollapseFraction);
        boolean useToolbarBlur = toolbarBlurView != null && isToolbarBlurActive();
        if (toolbarBlurView != null) {
            toolbarBlurView.updateAppearance(useToolbarBlur ? bgFrac : 0f, activePalette.surfaceBase);
        }
        if (toolbarBgDrawable != null) {
            toolbarBgDrawable.setColor(activePalette.surfaceBase);
            toolbarBgDrawable.setAlpha(useToolbarBlur ? 0 : Math.round(bgFrac * 255f));
        }
        syncTypographyColors();
        styleEmptyMessage();
        syncPrimaryButtons();
        syncSecondaryButtons();
        updateVisibleTrackRows();
    }

    private void syncTypographyColors() {
        if (titleView != null) {
            titleView.setTextColor(activePalette.onSurface);
        }
        if (creatorsView != null) {
            int creatorColor = MaterialYouColorEngine.blendRgb(activePalette.onSurface, activePalette.onSurfaceVariant, 0.35f);
            creatorsView.setTextColor(creatorColor);
            creatorsView.setCompoundDrawableTintList(ColorStateList.valueOf(creatorColor));
        }
        if (descriptionView != null) {
            descriptionView.setTextColor(MaterialYouColorEngine.withAlpha(activePalette.onSurfaceVariant, 0xD4));
        }
        int metaColor = MaterialYouColorEngine.withAlpha(activePalette.onSurfaceVariant, 0xC4);
        if (playlistInfoView != null) {
            playlistInfoView.setTextColor(metaColor);
        }
        if (playlistFansView != null) {
            playlistFansView.setTextColor(metaColor);
            playlistFansView.setCompoundDrawableTintList(ColorStateList.valueOf(metaColor));
        }
    }

    private void syncPrimaryButtons() {
        if (primaryActionRow == null) {
            return;
        }
        boolean playVisible = playButton != null && playButton.getVisibility() == View.VISIBLE;
        boolean shuffleVisible = shuffleButton != null && shuffleButton.getVisibility() == View.VISIBLE;
        primaryActionRow.setVisibility((playVisible || shuffleVisible) ? View.VISIBLE : View.GONE);

        if (shuffleButton != null && shuffleButton.getLayoutParams() instanceof LinearLayout.LayoutParams) {
            LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) shuffleButton.getLayoutParams();
            int targetMargin = playVisible ? dp(10f) : 0;
            if (lp.getMarginStart() != targetMargin) {
                lp.setMarginStart(targetMargin);
                shuffleButton.setLayoutParams(lp);
            }
        }

        ExpressiveMediaStyleKit.stylePrimaryPillButton(playButton, true, activePalette, density, idIcon, idText);
        ExpressiveMediaStyleKit.stylePrimaryPillButton(shuffleButton, !playVisible, activePalette, density, idIcon, idText);
    }

    private void syncSecondaryButtons() {
        if (secondaryActionRow == null) {
            return;
        }
        if (MaterialYouConfig.isHidePlaylistActionButtonsEnabled()) {
            secondaryActionRow.setVisibility(View.GONE);
            return;
        }
        View[] all = new View[]{favoriteButton, editButton, downloadButton, privacyButton, shareButton};
        ExpressiveMediaStyleKit.styleConnectedSecondaryBar(
                secondaryActionRow,
                all,
                downloadButton,
                activePalette,
                density,
                idIcon,
                idText,
                idRadialGradient,
                idDlRadialGradient,
                idDlIconState,
                idDlProgressBar,
                idDlText
        );
    }

    private void styleEmptyMessage() {
        if (emptyMessage == null) {
            return;
        }
        GradientDrawable card = new GradientDrawable();
        card.setShape(GradientDrawable.RECTANGLE);
        card.setCornerRadius(dpf(24f));
        card.setColor(activePalette.surfaceContainer);
        card.setStroke(Math.max(1, dp(1f)), activePalette.outlineVariant);
        emptyMessage.setBackground(card);
        emptyMessage.setTextColor(activePalette.onSurfaceVariant);
    }

    private void styleToolbarIcons() {
        if (destroyed || toolbar == null) {
            return;
        }
        try {
            ExpressiveMediaStyleKit.styleToolbarChrome(toolbar, toolbarScrims, lastCollapseFraction, activePalette, density);
        } catch (Throwable ignored) {
        }
    }

    private void updateVisibleTrackRows() {
        if (recyclerView == null || !MaterialYouConfig.isPlaylistTrackRowPolishEnabled()) {
            return;
        }
        for (int i = 0; i < recyclerView.getChildCount(); i++) {
            View child = recyclerView.getChildAt(i);
            styleTrackRow(child, false);
        }
    }

    // ---- Delegation Wrappers & Package Accessors ----

    private static void attachSpringPressEffect(View view) {
        ExpressiveMediaStyleKit.attachSpringPressEffect(view);
    }

    private static void disableSlidingTextMarquee(TextView tv) {
        ExpressiveMediaStyleKit.disableSlidingTextMarquee(tv);
    }

    private static void setShapeableImageCornerRadius(View imageView, float radiusPx) {
        ExpressiveMediaStyleKit.setShapeableImageCornerRadius(imageView, radiusPx);
    }

    private static float clamp01(float v) {
        return ExpressiveMediaStyleKit.clamp01(v);
    }

    private static float smoothstep(float edge0, float edge1, float x) {
        return ExpressiveMediaStyleKit.smoothstep(edge0, edge1, x);
    }

    // Package-private & AccentProvider accessors for button & accent tracking
    @Override
    public int getPrimaryAccent() { return activePalette.primaryAccent; }
    View getFavoriteButton() { return favoriteButton; }
    View getEditButton() { return editButton; }
    View getDownloadButton() { return downloadButton; }
    View getPrivacyButton() { return privacyButton; }
    View getShareButton() { return shareButton; }
}
