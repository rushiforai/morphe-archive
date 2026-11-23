package dev.materialtidal.extension.tidal.mediapages;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.core.view.ViewCompat;

import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ExpressivePalette;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.PaletteTransitionController;
import dev.materialtidal.extension.tidal.playlist.ExpressivePlaylistBridge;
import dev.materialtidal.extension.tidal.playlist.ExpressivePlaylistFadeOverlay;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Rebuilds TIDAL's Album Header ViewHolder in Material 3 Expressive style:
 * full-bleed downward-fading cover, cover-adaptive + Monet tonal palette, 52dp pill
 * Play/Shuffle buttons, connected 62dp secondary action tiles, and parallax scrolling.
 */
final class ExpressiveAlbumHeaderController implements ExpressivePlaylistBridge.AccentProvider {

    private static final WeakHashMap<View, ExpressiveAlbumHeaderController> CONTROLLERS = new WeakHashMap<>();

    /**
     * Custom {@code dev.materialtidal.*} container so
     * {@link MaterialYouColorEngine}'s legacy XML background pass skips its subtree.
     */
    private static final class ExpressiveAlbumHeaderContainer extends FrameLayout {
        ExpressiveAlbumHeaderContainer(Context context) {
            super(context);
        }
    }

    private final View itemView;
    private final Context context;
    private final float density;

    private final int idIcon;
    private final int idText;
    private final int idRadialGradient;
    private final int idDlRadialGradient;
    private final int idDlIconState;
    private final int idDlProgressBar;
    private final int idDlText;

    private View artworkBackground;
    private View animatedAlbumCover;
    private View albumArtworkCard;
    private ImageView coverImageView;

    private TextView titleView;
    private TextView artistNamesView;
    private TextView releaseYearView;
    private ViewGroup extraIconContainer;
    private View sendContributionsButton;

    private View firstPlaybackButton;
    private View secondPlaybackButton;
    private View favoriteButton;
    private View infoButton;
    private View downloadButton;
    private View shareButton;

    private ExpressivePlaylistFadeOverlay fadeOverlay;
    private LinearLayout foregroundColumn;
    private LinearLayout metadataRow;
    private LinearLayout primaryActionRow;
    private LinearLayout secondaryActionRow;

    private int heroCoverHeightPx;
    private float statusBarInsetPx;
    private boolean headerRebuilt;
    private boolean destroyed;

    private final PaletteTransitionController paletteCtrl = new PaletteTransitionController(this::syncAllColors);
    private final ExpressivePalette activePalette = paletteCtrl.active;
    private int lastScrollY;

    static void onHeaderBound(View itemView, ExpressiveDynamicPageController pageController) {
        if (itemView == null || !MaterialYouConfig.isExpressiveAlbumsEnabled()) {
            return;
        }
        ExpressiveAlbumHeaderController controller = CONTROLLERS.get(itemView);
        if (controller == null || controller.destroyed) {
            controller = new ExpressiveAlbumHeaderController(itemView);
            CONTROLLERS.put(itemView, controller);
        }
        controller.onBind();
        if (pageController != null) {
            pageController.attachAlbumHeader(controller);
        }
        ExpressivePlaylistBridge.setActiveAccentProvider(controller);
    }

    static ExpressiveAlbumHeaderController findForItemView(View child) {
        return child != null ? CONTROLLERS.get(child) : null;
    }

    private ExpressiveAlbumHeaderController(View itemView) {
        this.itemView = itemView;
        this.context = itemView.getContext();
        this.density = context.getResources().getDisplayMetrics().density;

        idIcon = ExpressiveMediaStyleKit.getId(context, "icon");
        idText = ExpressiveMediaStyleKit.getId(context, "text");
        idRadialGradient = ExpressiveMediaStyleKit.getId(context, "radialGradient");
        idDlRadialGradient = ExpressiveMediaStyleKit.getId(context, "downloadSecondaryActionButton_radialGradient");
        idDlIconState = ExpressiveMediaStyleKit.getId(context, "downloadSecondaryActionButton_iconDownloadState");
        idDlProgressBar = ExpressiveMediaStyleKit.getId(context, "downloadSecondaryActionButton_progressBar");
        idDlText = ExpressiveMediaStyleKit.getId(context, "downloadSecondaryActionButton_text");

        bindViews();
        statusBarInsetPx = ExpressiveMediaStyleKit.resolveStatusBarInsetPx(itemView, density);
        buildExpressiveHierarchy();
        registerSecondaryButtons();
    }

    private void bindViews() {
        artworkBackground = find("artworkBackground");
        animatedAlbumCover = find("animatedAlbumCover");
        if (animatedAlbumCover != null) {
            albumArtworkCard = ExpressiveMediaStyleKit.findView(
                    animatedAlbumCover, ExpressiveMediaStyleKit.getId(context, "albumArtworkCard"));
            View img = ExpressiveMediaStyleKit.findView(
                    animatedAlbumCover, ExpressiveMediaStyleKit.getId(context, "image"));
            if (img instanceof ImageView) {
                coverImageView = (ImageView) img;
            }
        }
        View t = find("title");
        if (t instanceof TextView) {
            titleView = (TextView) t;
        }
        View a = find("artistNames");
        if (a instanceof TextView) {
            artistNamesView = (TextView) a;
        }
        View y = find("releaseYear");
        if (y instanceof TextView) {
            releaseYearView = (TextView) y;
        }
        View extra = find("extraIcon");
        if (extra instanceof ViewGroup) {
            extraIconContainer = (ViewGroup) extra;
        }
        sendContributionsButton = find("sendContributionsButton");

        firstPlaybackButton = find("playbackControlButtonFirst");
        secondPlaybackButton = find("playbackControlButtonSecond");
        favoriteButton = find("favoriteButton");
        infoButton = find("infoButton");
        downloadButton = find("downloadButton");
        shareButton = find("shareButton");
    }

    private View find(String name) {
        return ExpressiveMediaStyleKit.findView(itemView, ExpressiveMediaStyleKit.getId(context, name));
    }

    private void registerSecondaryButtons() {
        View[] secs = new View[]{favoriteButton, downloadButton, infoButton, shareButton};
        for (View btn : secs) {
            if (btn != null) {
                ExpressivePlaylistBridge.registerExternalButton(btn, this::syncSecondaryButtons);
            }
        }
    }

    private void buildExpressiveHierarchy() {
        if (headerRebuilt || !(itemView instanceof ViewGroup)) {
            return;
        }
        headerRebuilt = true;

        ViewGroup rootGroup = (ViewGroup) itemView;
        rootGroup.setBackgroundColor(activePalette.surfaceBase);
        rootGroup.setClipChildren(false);
        rootGroup.setClipToPadding(false);

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

        detachFromParent(artworkBackground);
        detachFromParent(animatedAlbumCover);
        detachFromParent(titleView);
        detachFromParent(artistNamesView);
        detachFromParent(releaseYearView);
        detachFromParent(extraIconContainer);
        detachFromParent(sendContributionsButton);
        detachFromParent(firstPlaybackButton);
        detachFromParent(secondPlaybackButton);
        detachFromParent(favoriteButton);
        detachFromParent(infoButton);
        detachFromParent(downloadButton);
        detachFromParent(shareButton);

        rootGroup.removeAllViews();

        ExpressiveAlbumHeaderContainer container = new ExpressiveAlbumHeaderContainer(context);
        container.setClipChildren(false);
        container.setClipToPadding(false);
        container.setOnApplyWindowInsetsListener((v, insets) -> {
            int top = insets.getInsets(WindowInsets.Type.statusBars()).top;
            if (top > 0 && Math.abs(top - statusBarInsetPx) > 1f) {
                statusBarInsetPx = top;
                updateTopSpacingForInsets();
            }
            return insets;
        });

        fadeOverlay = new ExpressivePlaylistFadeOverlay(context);
        fadeOverlay.setHeroFadeEnabled(heroFade);
        fadeOverlay.setHeroCoverHeightPx(heroCoverHeightPx);
        fadeOverlay.setStatusBarInsetPx(statusBarInsetPx);
        fadeOverlay.setColors(activePalette.surfaceBase, activePalette.atmosphericTint);

        if (artworkBackground != null) {
            artworkBackground.setVisibility(View.GONE);
        }

        if (animatedAlbumCover != null) {
            // Neutralize TIDAL's Lgtj;.b status-bar padding listener so full-bleed reaches y=0
            ViewCompat.setOnApplyWindowInsetsListener(animatedAlbumCover, null);
            animatedAlbumCover.setOnApplyWindowInsetsListener(null);
            animatedAlbumCover.setPadding(0, 0, 0, 0);
            animatedAlbumCover.setElevation(0f);

            // Prevent AnimatedAlbumCoverView from forcing square height when stretched full-bleed
            try {
                java.lang.reflect.Field f = animatedAlbumCover.getClass().getDeclaredField("a");
                if (f.getType() == int.class) {
                    f.setAccessible(true);
                    f.setInt(animatedAlbumCover, -1);
                }
            } catch (Throwable ignored) {
            }

            if (coverImageView != null) {
                coverImageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
                coverImageView.setAdjustViewBounds(false);
            }

            if (heroFade) {
                if (albumArtworkCard != null) {
                    ExpressiveMediaStyleKit.setCardViewRadius(albumArtworkCard, 0f);
                    albumArtworkCard.setElevation(0f);
                }
                FrameLayout.LayoutParams coverLp = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        heroCoverHeightPx,
                        Gravity.TOP
                );
                container.addView(animatedAlbumCover, coverLp);
                container.addView(fadeOverlay, new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT
                ));
            } else {
                container.addView(fadeOverlay, new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.MATCH_PARENT
                ));
                if (albumArtworkCard != null) {
                    ExpressiveMediaStyleKit.setCardViewRadius(albumArtworkCard, dpf(24f));
                    albumArtworkCard.setElevation(dpf(10f));
                }
                int size = dp(220f);
                FrameLayout.LayoutParams coverLp = new FrameLayout.LayoutParams(
                        size, size, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
                coverLp.topMargin = Math.round(statusBarInsetPx + dp(66f));
                container.addView(animatedAlbumCover, coverLp);
            }
        } else {
            container.addView(fadeOverlay, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            ));
        }

        // Foreground editorial column
        foregroundColumn = new LinearLayout(context);
        foregroundColumn.setOrientation(LinearLayout.VERTICAL);
        foregroundColumn.setClipChildren(false);
        foregroundColumn.setClipToPadding(false);
        updateForegroundColumnPadding(heroFade);

        if (titleView != null) {
            ExpressiveMediaStyleKit.disableSlidingTextMarquee(titleView);
            titleView.setGravity(Gravity.START);
            titleView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 28f);
            titleView.setTypeface(titleView.getTypeface(), Typeface.BOLD);
            titleView.setLetterSpacing(-0.02f);
            titleView.setLineSpacing(dpf(2f), 1f);
            if (MaterialYouColorEngine.isLightMode(context)) {
                titleView.setShadowLayer(0f, 0f, 0f, 0);
            } else {
                titleView.setShadowLayer(dpf(4f), 0f, dpf(1f), 0x48000000);
            }
            titleView.setPadding(0, 0, 0, 0);
            foregroundColumn.addView(titleView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }

        if (artistNamesView != null) {
            ExpressiveMediaStyleKit.disableSlidingTextMarquee(artistNamesView);
            artistNamesView.setMaxLines(1);
            artistNamesView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            artistNamesView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            artistNamesView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            artistNamesView.setTypeface(artistNamesView.getTypeface(), Typeface.BOLD);
            artistNamesView.setCompoundDrawablePadding(dp(4f));
            artistNamesView.setPadding(0, 0, 0, 0);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.topMargin = dp(6f);
            foregroundColumn.addView(artistNamesView, lp);
        }

        // Metadata row: extraIcon (HiRes/Dolby badge) + releaseYear + sendContributions
        metadataRow = new LinearLayout(context);
        metadataRow.setOrientation(LinearLayout.HORIZONTAL);
        metadataRow.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
        if (extraIconContainer != null) {
            extraIconContainer.setPadding(0, 0, 0, 0);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.setMarginEnd(dp(8f));
            metadataRow.addView(extraIconContainer, lp);
        }
        if (releaseYearView != null) {
            releaseYearView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            releaseYearView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            releaseYearView.setLetterSpacing(0.04f);
            releaseYearView.setPadding(0, 0, 0, 0);
            metadataRow.addView(releaseYearView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }
        if (sendContributionsButton != null) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.setMarginStart(dp(12f));
            metadataRow.addView(sendContributionsButton, lp);
        }
        LinearLayout.LayoutParams metaLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        metaLp.topMargin = dp(8f);
        foregroundColumn.addView(metadataRow, metaLp);

        // Primary Action Row (Play + Shuffle pills)
        primaryActionRow = new LinearLayout(context);
        primaryActionRow.setOrientation(LinearLayout.HORIZONTAL);
        primaryActionRow.setGravity(Gravity.CENTER_VERTICAL);
        primaryActionRow.setClipChildren(false);
        primaryActionRow.setClipToPadding(false);

        if (firstPlaybackButton != null) {
            ExpressiveMediaStyleKit.attachSpringPressEffect(firstPlaybackButton);
            primaryActionRow.addView(firstPlaybackButton, new LinearLayout.LayoutParams(0, dp(52f), 1f));
        }
        if (secondPlaybackButton != null) {
            ExpressiveMediaStyleKit.attachSpringPressEffect(secondPlaybackButton);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(52f), 1f);
            lp.setMarginStart(dp(10f));
            primaryActionRow.addView(secondPlaybackButton, lp);
        }

        LinearLayout.LayoutParams primaryLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        primaryLp.topMargin = dp(18f);
        foregroundColumn.addView(primaryActionRow, primaryLp);

        // Connected Secondary Action Row (Favorite, Download, Info, Share)
        secondaryActionRow = new LinearLayout(context);
        secondaryActionRow.setOrientation(LinearLayout.HORIZONTAL);
        secondaryActionRow.setGravity(Gravity.CENTER_VERTICAL);
        secondaryActionRow.setClipChildren(false);
        secondaryActionRow.setClipToPadding(false);

        View[] secBtns = new View[]{favoriteButton, downloadButton, infoButton, shareButton};
        for (View btn : secBtns) {
            if (btn == null) {
                continue;
            }
            btn.setMinimumWidth(0);
            btn.setPadding(dp(4f), dp(4f), dp(4f), dp(4f));
            ExpressiveMediaStyleKit.attachSpringPressEffect(btn);
            secondaryActionRow.addView(btn, new LinearLayout.LayoutParams(0, dp(62f), 1f));
        }

        LinearLayout.LayoutParams secLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        secLp.topMargin = dp(12f);
        foregroundColumn.addView(secondaryActionRow, secLp);

        container.addView(foregroundColumn, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        rootGroup.addView(container, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        if (fadeOverlay != null && coverImageView != null) {
            fadeOverlay.attachArtworkObserver(coverImageView, paletteCtrl::extractFromDrawable);
        }
    }

    private void onBind() {
        // Override fixed height set by Ltq;.c so rebuilt header wraps cleanly
        itemView.setMinimumHeight(0);
        ViewGroup.LayoutParams rootLp = itemView.getLayoutParams();
        if (rootLp != null && (rootLp.width != ViewGroup.LayoutParams.MATCH_PARENT
                || rootLp.height != ViewGroup.LayoutParams.WRAP_CONTENT)) {
            rootLp.width = ViewGroup.LayoutParams.MATCH_PARENT;
            rootLp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            itemView.setLayoutParams(rootLp);
        }

        if (titleView != null) {
            ExpressiveMediaStyleKit.disableSlidingTextMarquee(titleView);
        }
        if (artistNamesView != null) {
            ExpressiveMediaStyleKit.disableSlidingTextMarquee(artistNamesView);
        }
        if (artworkBackground != null) {
            artworkBackground.setVisibility(View.GONE);
        }

        if (metadataRow != null) {
            boolean hasYear = releaseYearView != null && releaseYearView.getVisibility() == View.VISIBLE
                    && !TextUtils.isEmpty(releaseYearView.getText());
            boolean hasExtra = extraIconContainer != null && extraIconContainer.getVisibility() == View.VISIBLE
                    && extraIconContainer.getChildCount() > 0;
            boolean hasContrib = sendContributionsButton != null && sendContributionsButton.getVisibility() == View.VISIBLE;
            metadataRow.setVisibility((hasYear || hasExtra || hasContrib) ? View.VISIBLE : View.GONE);
        }

        syncAllColors();
        if (fadeOverlay != null) {
            fadeOverlay.checkArtworkDrawableChanged();
        }
    }

    void onScrollUpdated(int totalScrollY) {
        this.lastScrollY = Math.max(0, totalScrollY);
        if (destroyed) {
            return;
        }
        int range = Math.max(1, heroCoverHeightPx - dp(84f));
        float collapse = ExpressiveMediaStyleKit.clamp01(lastScrollY / (float) range);
        if (animatedAlbumCover != null && MaterialYouConfig.isPlaylistHeroCoverFadeEnabled()) {
            animatedAlbumCover.setTranslationY(lastScrollY * 0.35f);
        }
        if (fadeOverlay != null) {
            fadeOverlay.setCollapseFraction(collapse);
        }
    }

    void onDestroy() {
        destroyed = true;
        paletteCtrl.destroy();
        if (fadeOverlay != null) {
            fadeOverlay.attachArtworkObserver(null, null);
        }
        ExpressivePlaylistBridge.clearActiveAccentProvider(this);
        CONTROLLERS.remove(itemView);
    }

    int getHeroCoverHeightPx() {
        return heroCoverHeightPx;
    }

    @Override
    public int getPrimaryAccent() {
        return activePalette.primaryAccent;
    }

    private void syncAllColors() {
        itemView.setBackgroundColor(activePalette.surfaceBase);
        if (fadeOverlay != null) {
            fadeOverlay.setColors(activePalette.surfaceBase, activePalette.atmosphericTint);
        }
        if (titleView != null) {
            titleView.setTextColor(activePalette.onSurface);
        }
        if (artistNamesView != null) {
            int artistColor = MaterialYouColorEngine.blendRgb(
                    activePalette.onSurface, activePalette.onSurfaceVariant, 0.25f);
            artistNamesView.setTextColor(artistColor);
        }
        if (releaseYearView != null) {
            releaseYearView.setTextColor(MaterialYouColorEngine.withAlpha(activePalette.onSurfaceVariant, 0xCC));
        }
        syncPrimaryButtons();
        syncSecondaryButtons();
    }

    private void syncPrimaryButtons() {
        if (primaryActionRow == null) {
            return;
        }
        boolean firstVisible = firstPlaybackButton != null && firstPlaybackButton.getVisibility() == View.VISIBLE;
        boolean secondVisible = secondPlaybackButton != null && secondPlaybackButton.getVisibility() == View.VISIBLE;
        primaryActionRow.setVisibility((firstVisible || secondVisible) ? View.VISIBLE : View.GONE);

        if (secondPlaybackButton != null && secondPlaybackButton.getLayoutParams() instanceof LinearLayout.LayoutParams) {
            LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) secondPlaybackButton.getLayoutParams();
            int targetMargin = firstVisible ? dp(10f) : 0;
            if (lp.getMarginStart() != targetMargin) {
                lp.setMarginStart(targetMargin);
                secondPlaybackButton.setLayoutParams(lp);
            }
        }

        ExpressiveMediaStyleKit.stylePrimaryPillButton(
                firstPlaybackButton, true, activePalette, density, idIcon, idText);
        ExpressiveMediaStyleKit.stylePrimaryPillButton(
                secondPlaybackButton, !firstVisible, activePalette, density, idIcon, idText);
    }

    private void syncSecondaryButtons() {
        if (destroyed) {
            return;
        }
        View[] all = new View[]{favoriteButton, downloadButton, infoButton, shareButton};
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

    private void updateForegroundColumnPadding(boolean heroFade) {
        if (foregroundColumn == null) {
            return;
        }
        int hPad = dp(20f);
        int topPad = heroFade
                ? Math.max(Math.round(statusBarInsetPx + dp(112f)), heroCoverHeightPx - dp(96f))
                : Math.round(statusBarInsetPx + dp(66f) + dp(220f) + dp(20f));
        foregroundColumn.setPaddingRelative(hPad, topPad, hPad, dp(10f));
    }

    private void updateTopSpacingForInsets() {
        boolean heroFade = MaterialYouConfig.isPlaylistHeroCoverFadeEnabled();
        if (!heroFade) {
            heroCoverHeightPx = Math.round(statusBarInsetPx + dp(68f) + dp(220f) + dp(24f));
            if (animatedAlbumCover != null && animatedAlbumCover.getLayoutParams() instanceof FrameLayout.LayoutParams) {
                FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) animatedAlbumCover.getLayoutParams();
                lp.topMargin = Math.round(statusBarInsetPx + dp(66f));
                animatedAlbumCover.setLayoutParams(lp);
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

    private int dp(float val) {
        return ExpressiveMediaStyleKit.dp(density, val);
    }

    private float dpf(float val) {
        return ExpressiveMediaStyleKit.dpf(density, val);
    }
}
