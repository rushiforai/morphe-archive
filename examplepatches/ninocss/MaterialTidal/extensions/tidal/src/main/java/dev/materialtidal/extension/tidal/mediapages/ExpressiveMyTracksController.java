package dev.materialtidal.extension.tidal.mediapages;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.util.WeakHashMap;

import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit;
import dev.materialtidal.extension.tidal.playlist.ExpressiveMediaStyleKit.ExpressivePalette;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Coordinates the Material 3 Expressive redesign of TIDAL's My Collection screens:
 * {@code FavoriteTracksFragment} (My Tracks), {@code MyAlbumsView}, and {@code MyArtistsView}.
 */
final class ExpressiveMyTracksController {

    private static final WeakHashMap<Object, ExpressiveMyTracksController> CONTROLLERS = new WeakHashMap<>();

    /**
     * Custom {@code dev.materialtidal.*} container so
     * {@link MaterialYouColorEngine}'s legacy XML background pass skips its subtree.
     */
    private static final class ExpressiveMyTracksHeaderContainer extends LinearLayout {
        ExpressiveMyTracksHeaderContainer(Context context) {
            super(context);
            setOrientation(VERTICAL);
        }
    }

    private final Context context;
    private final float density;
    private final View rootView;
    private final ExpressivePalette palette;

    private final int idIcon;
    private final int idText;
    private final int idArtwork;
    private final int idArtistName;
    private final int idOptions;

    private ViewGroup headerLayout;
    private View playButton;
    private View shuffleButton;
    private TextView downloadText;
    private View offlineSwitch;
    private View divider;
    private ViewGroup toolbarLayout;
    private RecyclerView recyclerView;
    private ProgressBar progressBar;

    private View appBarView;
    private View collapsingView;
    private LinearLayout offlineCard;
    private boolean headerRebuilt;
    private boolean destroyed;

    static void onMyTracksViewCreated(Object fragment, View rootView) {
        if (fragment == null || rootView == null || !MaterialYouConfig.isExpressiveMyTracksEnabled()) {
            return;
        }
        ExpressiveMyTracksController prev = CONTROLLERS.remove(fragment);
        if (prev != null) {
            prev.onDestroy();
        }
        CONTROLLERS.put(fragment, new ExpressiveMyTracksController(rootView));
    }

    static void onMyTracksDestroyView(Object fragment) {
        if (fragment == null) {
            return;
        }
        ExpressiveMyTracksController prev = CONTROLLERS.remove(fragment);
        if (prev != null) {
            prev.onDestroy();
        }
    }

    static void onMyTracksStateUpdated(Object fragment) {
        ExpressiveMyTracksController c = fragment != null ? CONTROLLERS.get(fragment) : null;
        if (c != null && !c.destroyed) {
            c.syncControls();
        }
    }

    static void onMyTracksMenuUpdated(Object fragment) {
        ExpressiveMyTracksController c = fragment != null ? CONTROLLERS.get(fragment) : null;
        if (c != null && !c.destroyed) {
            c.styleToolbar();
        }
    }

    static void styleMyAlbums(View rootView) {
        if (rootView == null || !MaterialYouConfig.isExpressiveAlbumsEnabled()) {
            return;
        }
        styleCollectionView(rootView);
    }

    static void styleMyArtists(View rootView) {
        if (rootView == null || !MaterialYouConfig.isExpressiveArtistsEnabled()) {
            return;
        }
        styleCollectionView(rootView);
    }

    private static void styleCollectionView(View rootView) {
        Context ctx = rootView.getContext();
        View tb = ExpressiveMediaStyleKit.findView(rootView, ExpressiveMediaStyleKit.getId(ctx, "toolbar"));
        View rv = ExpressiveMediaStyleKit.findView(rootView, ExpressiveMediaStyleKit.getId(ctx, "recyclerView"));
        View hpb = ExpressiveMediaStyleKit.findView(rootView, ExpressiveMediaStyleKit.getId(ctx, "horizontalProgressBar"));
        View cpb = ExpressiveMediaStyleKit.findView(rootView, ExpressiveMediaStyleKit.getId(ctx, "contentLoadingProgressBar"));
        ExpressiveMediaStyleKit.styleCollectionListPage(
                rootView,
                tb instanceof ViewGroup ? (ViewGroup) tb : null,
                rv,
                hpb instanceof ProgressBar ? (ProgressBar) hpb : null,
                cpb instanceof ProgressBar ? (ProgressBar) cpb : null
        );
    }

    private ExpressiveMyTracksController(View rootView) {
        this.rootView = rootView;
        this.context = rootView.getContext();
        this.density = context.getResources().getDisplayMetrics().density;
        this.palette = ExpressiveMediaStyleKit.buildMonetPalette();

        idIcon = ExpressiveMediaStyleKit.getId(context, "icon");
        idText = ExpressiveMediaStyleKit.getId(context, "text");
        idArtwork = ExpressiveMediaStyleKit.getId(context, "artwork");
        idArtistName = ExpressiveMediaStyleKit.getId(context, "artistName");
        idOptions = ExpressiveMediaStyleKit.getId(context, "options");

        bindViews();
        applyExpressiveStyle();
    }

    private void bindViews() {
        View h = find("header");
        if (h instanceof ViewGroup) {
            headerLayout = (ViewGroup) h;
        }
        playButton = find("playButton");
        shuffleButton = find("shufflePlayButton");
        View dl = find("downloadText");
        if (dl instanceof TextView) {
            downloadText = (TextView) dl;
        }
        offlineSwitch = find("offlineSwitch");
        divider = find("divider");

        View tb = find("toolbarLayout");
        if (tb instanceof ViewGroup) {
            toolbarLayout = (ViewGroup) tb;
            if (tb.getParent() instanceof View) {
                collapsingView = (View) tb.getParent();
                if (collapsingView.getParent() instanceof View) {
                    appBarView = (View) collapsingView.getParent();
                }
            }
        }

        View rv = find("recyclerView");
        if (rv instanceof RecyclerView) {
            recyclerView = (RecyclerView) rv;
        }
        View pb = find("progressBar");
        if (pb instanceof ProgressBar) {
            progressBar = (ProgressBar) pb;
        }
    }

    private View find(String name) {
        return ExpressiveMediaStyleKit.findView(rootView, ExpressiveMediaStyleKit.getId(context, name));
    }

    private void applyExpressiveStyle() {
        rootView.setBackgroundColor(palette.surfaceBase);
        if (collapsingView != null) {
            collapsingView.setBackgroundColor(palette.surfaceBase);
        }
        if (appBarView != null) {
            appBarView.setBackgroundColor(palette.surfaceBase);
            appBarView.setElevation(0f);
        }
        if (progressBar != null) {
            progressBar.setIndeterminateTintList(ColorStateList.valueOf(palette.primaryAccent));
        }

        if (recyclerView != null) {
            recyclerView.setBackgroundColor(palette.surfaceBase);
            recyclerView.setClipToPadding(false);
            recyclerView.addOnChildAttachStateChangeListener(new RecyclerView.OnChildAttachStateChangeListener() {
                @Override
                public void onChildViewAttachedToWindow(View child) {
                    if (destroyed || child == null) {
                        return;
                    }
                    if (MaterialYouConfig.isPlaylistTrackRowPolishEnabled()
                            && ExpressiveMediaStyleKit.findView(child, idOptions) != null) {
                        ExpressiveMediaStyleKit.styleCleanTrackRow(
                                child,
                                palette,
                                density,
                                idArtwork,
                                idArtistName,
                                idOptions
                        );
                    }
                }

                @Override
                public void onChildViewDetachedFromWindow(View child) {
                }
            });
        }

        rebuildHeader();
        styleToolbar();
        syncControls();
        if (toolbarLayout != null) {
            toolbarLayout.post(() -> {
                if (!destroyed) {
                    styleToolbar();
                }
            });
        }
    }

    private void rebuildHeader() {
        if (headerRebuilt || headerLayout == null) {
            return;
        }
        headerRebuilt = true;

        headerLayout.setBackgroundColor(palette.surfaceBase);
        ViewGroup.LayoutParams hLp = headerLayout.getLayoutParams();
        if (hLp != null) {
            hLp.width = ViewGroup.LayoutParams.MATCH_PARENT;
            hLp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            headerLayout.setLayoutParams(hLp);
        }

        detachFromParent(playButton);
        detachFromParent(shuffleButton);
        detachFromParent(downloadText);
        detachFromParent(offlineSwitch);
        detachFromParent(divider);
        headerLayout.removeAllViews();

        if (divider != null) {
            divider.setVisibility(View.GONE);
        }

        ExpressiveMyTracksHeaderContainer column = new ExpressiveMyTracksHeaderContainer(context);
        column.setPaddingRelative(dp(16f), dp(10f), dp(16f), dp(12f));
        column.setClipChildren(false);
        column.setClipToPadding(false);

        // Primary 52dp Play + Shuffle pills
        LinearLayout primaryRow = new LinearLayout(context);
        primaryRow.setOrientation(LinearLayout.HORIZONTAL);
        primaryRow.setGravity(Gravity.CENTER_VERTICAL);
        primaryRow.setClipChildren(false);
        primaryRow.setClipToPadding(false);

        if (playButton != null) {
            ExpressiveMediaStyleKit.attachSpringPressEffect(playButton);
            primaryRow.addView(playButton, new LinearLayout.LayoutParams(0, dp(52f), 1f));
        }
        if (shuffleButton != null) {
            ExpressiveMediaStyleKit.attachSpringPressEffect(shuffleButton);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(52f), 1f);
            lp.setMarginStart(dp(10f));
            primaryRow.addView(shuffleButton, lp);
        }
        column.addView(primaryRow, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        // 20dp rounded tonal Offline Download card
        if (downloadText != null || offlineSwitch != null) {
            offlineCard = new LinearLayout(context);
            offlineCard.setOrientation(LinearLayout.HORIZONTAL);
            offlineCard.setGravity(Gravity.CENTER_VERTICAL);
            offlineCard.setPaddingRelative(dp(18f), dp(12f), dp(16f), dp(12f));

            GradientDrawable cardBg = new GradientDrawable();
            cardBg.setShape(GradientDrawable.RECTANGLE);
            cardBg.setCornerRadius(ExpressiveMediaStyleKit.dpf(density, 20f));
            cardBg.setColor(palette.surfaceContainer);
            cardBg.setStroke(Math.max(1, dp(1f)), palette.outlineVariant);
            offlineCard.setBackground(cardBg);

            if (downloadText != null) {
                downloadText.setTextColor(palette.onSurface);
                downloadText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
                downloadText.setTypeface(downloadText.getTypeface(), Typeface.BOLD);
                offlineCard.addView(downloadText, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            }
            if (offlineSwitch != null) {
                offlineCard.addView(offlineSwitch, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
            }

            LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            cardLp.topMargin = dp(12f);
            column.addView(offlineCard, cardLp);
        }

        headerLayout.addView(column, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));
    }

    private void syncControls() {
        ExpressiveMediaStyleKit.stylePrimaryPillButton(
                playButton, true, palette, density, idIcon, idText);
        ExpressiveMediaStyleKit.stylePrimaryPillButton(
                shuffleButton, false, palette, density, idIcon, idText);

        if (downloadText != null) {
            downloadText.setTextColor(palette.onSurface);
        }
        if (offlineSwitch != null) {
            ExpressiveMediaStyleKit.tintSwitchCompat(
                    offlineSwitch,
                    palette.primaryAccent,
                    palette.onPrimary,
                    palette.surfaceContainerHigh,
                    palette.onSurfaceVariant
            );
        }
        if (offlineCard != null && (downloadText != null || offlineSwitch != null)) {
            boolean showCard = (downloadText == null || downloadText.getVisibility() == View.VISIBLE)
                    || (offlineSwitch != null && offlineSwitch.getVisibility() == View.VISIBLE);
            offlineCard.setVisibility(showCard ? View.VISIBLE : View.GONE);
        }
    }

    private void styleToolbar() {
        if (toolbarLayout == null || destroyed) {
            return;
        }
        toolbarLayout.setBackgroundColor(palette.surfaceBase);
        toolbarLayout.setElevation(0f);
        ExpressiveMediaStyleKit.tintToolbarMenuAndNav(toolbarLayout, palette.onSurface);
        for (int i = 0; i < toolbarLayout.getChildCount(); i++) {
            View child = toolbarLayout.getChildAt(i);
            if (child instanceof TextView) {
                TextView tv = (TextView) child;
                tv.setTextColor(palette.onSurface);
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f);
                tv.setTypeface(tv.getTypeface(), Typeface.BOLD);
            }
        }
    }

    private void onDestroy() {
        destroyed = true;
    }

    private static void detachFromParent(View v) {
        if (v != null && v.getParent() instanceof ViewGroup) {
            ((ViewGroup) v.getParent()).removeView(v);
        }
    }

    private int dp(float val) {
        return ExpressiveMediaStyleKit.dp(density, val);
    }
}
