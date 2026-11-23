package dev.materialtidal.extension.tidal.mediapages;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
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
 * Rebuilds TIDAL's Artist Header ViewHolder in Material 3 Expressive style:
 * full-bleed downward-fading portrait hero, portrait-adaptive + Monet tonal palette,
 * M3 contributor-role chip, 52dp pill Play/Radio buttons, connected 62dp action bar
 * (Follow, Mix, Credits, Edit, Share), and parallax scrolling.
 */
final class ExpressiveArtistHeaderController {

    private static final WeakHashMap<View, ExpressiveArtistHeaderController> CONTROLLERS = new WeakHashMap<>();

    private static final class ExpressiveArtistHeaderContainer extends FrameLayout {
        ExpressiveArtistHeaderContainer(Context context) {
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

    private ImageView artwork;
    private ImageView artworkOverlay;
    private View headerOverlay;

    private TextView artistNameView;
    private TextView artistHandleView;
    private TextView contributorRolesView;

    private View firstPlaybackButton;
    private View secondPlaybackButton;
    private View followButton;
    private View mixButton;
    private View creditsButton;
    private View editButton;
    private View shareButton;

    private ExpressivePlaylistFadeOverlay fadeOverlay;
    private LinearLayout foregroundColumn;
    private LinearLayout primaryActionRow;
    private LinearLayout secondaryActionRow;

    private int heroCoverHeightPx;
    private float statusBarInsetPx;
    private boolean headerRebuilt;
    private boolean destroyed;

    private final PaletteTransitionController paletteCtrl = new PaletteTransitionController(this::syncAllColors);
    private final ExpressivePalette activePalette = paletteCtrl.active;
    private int lastScrollY;

    static void onHeaderCreated(View itemView) {
        if (itemView == null || !MaterialYouConfig.isExpressiveArtistsEnabled()) {
            return;
        }
        ExpressiveArtistHeaderController controller = CONTROLLERS.get(itemView);
        if (controller == null || controller.destroyed) {
            controller = new ExpressiveArtistHeaderController(itemView);
            CONTROLLERS.put(itemView, controller);
        }
    }

    static void onHeaderBound(View itemView, ExpressiveDynamicPageController pageController) {
        if (itemView == null || !MaterialYouConfig.isExpressiveArtistsEnabled()) {
            return;
        }
        ExpressiveArtistHeaderController controller = CONTROLLERS.get(itemView);
        if (controller == null || controller.destroyed) {
            controller = new ExpressiveArtistHeaderController(itemView);
            CONTROLLERS.put(itemView, controller);
        }
        controller.onBind();
        if (pageController != null) {
            pageController.attachArtistHeader(controller);
        }
    }

    static ExpressiveArtistHeaderController findForItemView(View child) {
        return child != null ? CONTROLLERS.get(child) : null;
    }

    private ExpressiveArtistHeaderController(View itemView) {
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
        View art = find("artwork");
        if (art instanceof ImageView) {
            artwork = (ImageView) art;
        }
        View artOver = find("artworkOverlay");
        if (artOver instanceof ImageView) {
            artworkOverlay = (ImageView) artOver;
        }
        headerOverlay = find("headerOverlay");

        View name = find("artistName");
        if (name instanceof TextView) {
            artistNameView = (TextView) name;
        }
        View handle = find("artistHandle");
        if (handle instanceof TextView) {
            artistHandleView = (TextView) handle;
        }
        View roles = find("contributorRoles");
        if (roles instanceof TextView) {
            contributorRolesView = (TextView) roles;
        }

        firstPlaybackButton = find("playbackControlButtonFirst");
        secondPlaybackButton = find("playbackControlButtonSecond");
        followButton = find("followButton");
        mixButton = find("mixButton");
        creditsButton = find("creditsButton");
        editButton = find("editButton");
        shareButton = find("shareButton");
    }

    private View find(String name) {
        return ExpressiveMediaStyleKit.findView(itemView, ExpressiveMediaStyleKit.getId(context, name));
    }

    private void registerSecondaryButtons() {
        View[] secs = new View[]{followButton, mixButton, creditsButton, editButton, shareButton};
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
                    ? dp(300f)
                    : Math.round(Math.min(screenW * 1.00f, dp(420f)));
        } else {
            heroCoverHeightPx = Math.round(statusBarInsetPx + dp(68f) + dp(220f) + dp(24f));
        }

        detachFromParent(headerOverlay);
        detachFromParent(artwork);
        detachFromParent(artworkOverlay);
        detachFromParent(artistNameView);
        detachFromParent(artistHandleView);
        detachFromParent(contributorRolesView);
        detachFromParent(firstPlaybackButton);
        detachFromParent(secondPlaybackButton);
        detachFromParent(followButton);
        detachFromParent(mixButton);
        detachFromParent(creditsButton);
        detachFromParent(editButton);
        detachFromParent(shareButton);

        rootGroup.removeAllViews();

        ExpressiveArtistHeaderContainer container = new ExpressiveArtistHeaderContainer(context);
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

        if (headerOverlay != null) {
            headerOverlay.setVisibility(View.GONE);
        }
        if (artworkOverlay != null) {
            artworkOverlay.setVisibility(View.GONE);
            artworkOverlay.setAlpha(0f);
            artworkOverlay.setImageDrawable(null);
        }

        if (artwork != null) {
            prepareArtistImageView(artwork);
            artwork.setVisibility(View.VISIBLE);
            artwork.setAlpha(1f);

            if (heroFade) {
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
                int size = dp(220f);
                FrameLayout.LayoutParams artLp = new FrameLayout.LayoutParams(
                        size, size, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
                artLp.topMargin = Math.round(statusBarInsetPx + dp(66f));
                container.addView(artwork, artLp);
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

        if (artistNameView != null) {
            ExpressiveMediaStyleKit.disableSlidingTextMarquee(artistNameView);
            artistNameView.setGravity(Gravity.START);
            artistNameView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            artistNameView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 30f);
            artistNameView.setTypeface(artistNameView.getTypeface(), Typeface.BOLD);
            artistNameView.setLetterSpacing(-0.025f);
            artistNameView.setLineSpacing(dpf(2f), 1f);
            if (MaterialYouColorEngine.isLightMode(context)) {
                artistNameView.setShadowLayer(0f, 0f, 0f, 0);
            } else {
                artistNameView.setShadowLayer(dpf(5f), 0f, dpf(1.5f), 0x56000000);
            }
            artistNameView.setPadding(0, 0, 0, 0);
            foregroundColumn.addView(artistNameView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }

        if (artistHandleView != null) {
            artistHandleView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            artistHandleView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            artistHandleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            artistHandleView.setPadding(0, 0, 0, 0);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.topMargin = dp(4f);
            foregroundColumn.addView(artistHandleView, lp);
        }

        if (contributorRolesView != null) {
            contributorRolesView.setGravity(Gravity.CENTER_VERTICAL | Gravity.START);
            contributorRolesView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            contributorRolesView.setMaxLines(1);
            contributorRolesView.setEllipsize(TextUtils.TruncateAt.END);
            contributorRolesView.setPadding(dp(12f), dp(6f), dp(12f), dp(6f));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            lp.topMargin = dp(8f);
            foregroundColumn.addView(contributorRolesView, lp);
        }

        // Primary Action Row (Play + Radio/Shuffle pills)
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

        // Connected Secondary Action Row (Follow, Mix, Credits, Edit, Share)
        secondaryActionRow = new LinearLayout(context);
        secondaryActionRow.setOrientation(LinearLayout.HORIZONTAL);
        secondaryActionRow.setGravity(Gravity.CENTER_VERTICAL);
        secondaryActionRow.setClipChildren(false);
        secondaryActionRow.setClipToPadding(false);

        View[] secBtns = new View[]{followButton, mixButton, creditsButton, editButton, shareButton};
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

        if (fadeOverlay != null && artwork != null) {
            fadeOverlay.attachArtworkObserver(artwork, paletteCtrl::extractFromDrawable);
        }
    }

    private static void prepareArtistImageView(ImageView iv) {
        ViewCompat.setOnApplyWindowInsetsListener(iv, null);
        iv.setOnApplyWindowInsetsListener(null);
        iv.setPadding(0, 0, 0, 0);
        iv.setElevation(0f);
        iv.setAdjustViewBounds(false);
        iv.setScaleType(ImageView.ScaleType.CENTER_CROP);
    }

    private void onBind() {
        // Override fixed height set by Lus0;.c so rebuilt header wraps cleanly
        itemView.setMinimumHeight(0);
        ViewGroup.LayoutParams rootLp = itemView.getLayoutParams();
        if (rootLp != null && (rootLp.width != ViewGroup.LayoutParams.MATCH_PARENT
                || rootLp.height != ViewGroup.LayoutParams.WRAP_CONTENT)) {
            rootLp.width = ViewGroup.LayoutParams.MATCH_PARENT;
            rootLp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            itemView.setLayoutParams(rootLp);
        }

        if (artistNameView != null) {
            ExpressiveMediaStyleKit.disableSlidingTextMarquee(artistNameView);
        }
        if (artwork != null) {
            artwork.setVisibility(View.VISIBLE);
            artwork.setAlpha(1f);
        }
        if (artworkOverlay != null) {
            artworkOverlay.setVisibility(View.GONE);
            artworkOverlay.setAlpha(0f);
            artworkOverlay.setImageDrawable(null);
        }
        if (headerOverlay != null) {
            headerOverlay.setVisibility(View.GONE);
        }

        syncAllColors();
        if (fadeOverlay != null) {
            fadeOverlay.checkArtworkDrawableChanged();
            fadeOverlay.invalidate();
        }
    }

    void onScrollUpdated(int totalScrollY) {
        this.lastScrollY = Math.max(0, totalScrollY);
        if (destroyed) {
            return;
        }
        int range = Math.max(1, heroCoverHeightPx - dp(84f));
        float collapse = ExpressiveMediaStyleKit.clamp01(lastScrollY / (float) range);
        if (MaterialYouConfig.isPlaylistHeroCoverFadeEnabled()) {
            float parallax = lastScrollY * 0.35f;
            if (artwork != null) {
                artwork.setTranslationY(parallax);
            }
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
        CONTROLLERS.remove(itemView);
    }

    int getHeroCoverHeightPx() {
        return heroCoverHeightPx;
    }

    private void syncAllColors() {
        itemView.setBackgroundColor(activePalette.surfaceBase);
        if (fadeOverlay != null) {
            fadeOverlay.setColors(activePalette.surfaceBase, activePalette.atmosphericTint);
        }
        if (artistNameView != null) {
            artistNameView.setTextColor(activePalette.onSurface);
        }
        if (artistHandleView != null) {
            artistHandleView.setTextColor(MaterialYouColorEngine.withAlpha(activePalette.onSurfaceVariant, 0xCC));
        }
        styleContributorRolesChip();
        syncPrimaryButtons();
        syncSecondaryButtons();
    }

    private void styleContributorRolesChip() {
        if (contributorRolesView == null || contributorRolesView.getVisibility() != View.VISIBLE) {
            return;
        }
        GradientDrawable chipBg = new GradientDrawable();
        chipBg.setShape(GradientDrawable.RECTANGLE);
        chipBg.setCornerRadius(dpf(16f));
        chipBg.setColor(MaterialYouColorEngine.blendRgb(
                activePalette.surfaceContainerHigh, activePalette.primaryAccent, 0.14f));
        chipBg.setStroke(Math.max(1, dp(1f)), activePalette.secondaryOutline);

        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(dpf(16f));
        mask.setColor(0xFFFFFFFF);

        contributorRolesView.setBackground(new RippleDrawable(
                ColorStateList.valueOf(MaterialYouColorEngine.withAlpha(activePalette.primaryAccent, 0x26)),
                chipBg,
                mask
        ));
        contributorRolesView.setTextColor(activePalette.onSurface);
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
        View[] all = new View[]{followButton, mixButton, creditsButton, editButton, shareButton};
        ExpressiveMediaStyleKit.styleConnectedSecondaryBar(
                secondaryActionRow,
                all,
                null,
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
            if (artwork != null && artwork.getLayoutParams() instanceof FrameLayout.LayoutParams) {
                FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) artwork.getLayoutParams();
                lp.topMargin = Math.round(statusBarInsetPx + dp(66f));
                artwork.setLayoutParams(lp);
            }
            if (artworkOverlay != null && artworkOverlay.getLayoutParams() instanceof FrameLayout.LayoutParams) {
                FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) artworkOverlay.getLayoutParams();
                lp.topMargin = Math.round(statusBarInsetPx + dp(66f));
                artworkOverlay.setLayoutParams(lp);
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
