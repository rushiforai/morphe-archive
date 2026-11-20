package app.southstar21.extension.spotify.liquidglass;

import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

/**
 * Turns Spotify's mini player (the now playing card above the tab bar) into the same glass.
 * <p>
 * The glass is the background of the card's container, {@code now_playing_view_container},
 * which sits straight in the main layout, so the glass can record the content behind it like
 * the bar's does. Each frame it's fitted to the card ({@code now_playing_bar_layout}, nested a
 * few levels down), whose own background (a rounded rectangle Spotify colors from the album
 * art) is made invisible. The card clips to the glass's rounder corners instead of its own.
 */
final class MiniPlayerGlass implements ViewTreeObserver.OnPreDrawListener {
    private final ViewGroup container;
    private final LiquidGlassDrawable glass;
    private final int cardId;
    private View card;
    /** The card background we last made invisible; Spotify may swap in a new one. */
    private Drawable hiddenBackground;
    /** When the glass was last redrawn for what's behind it (uptime ms). */
    private long lastRefresh;
    private boolean layoutChanged = true;
    private final ViewTreeObserver.OnGlobalLayoutListener layoutListener = () -> layoutChanged = true;
    /** The card whose outline follows the glass. */
    private View outlined;
    private final android.view.ViewOutlineProvider outline = new android.view.ViewOutlineProvider() {
        @Override
        public void getOutline(View view, android.graphics.Outline out) {
            out.setRoundRect(0, 0, view.getWidth(), view.getHeight(), glass.cornerRadius());
        }
    };

    MiniPlayerGlass(ViewGroup container, int cardId) {
        this.container = container;
        this.cardId = cardId;
        float density = container.getResources().getDisplayMetrics().density;
        this.glass = new LiquidGlassDrawable(container, density, NavbarStyle::miniPlayer);
    }

    void install() {
        glass.setDark(true);
        glass.setSouthstar21(NavbarStyle.miniPlayer().southstar21);
        container.setBackground(glass);
        container.getViewTreeObserver().addOnPreDrawListener(this);
        container.getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
        container.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                v.getViewTreeObserver().addOnPreDrawListener(MiniPlayerGlass.this);
                v.getViewTreeObserver().addOnGlobalLayoutListener(layoutListener);
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                v.getViewTreeObserver().removeOnPreDrawListener(MiniPlayerGlass.this);
            }
        });
    }

    /** The glass won't show {@code view}, though it stays on screen. */
    void exclude(View view) {
        glass.exclude(view);
    }

    @Override
    public boolean onPreDraw() {
        try {
            if (container.getBackground() != glass) container.setBackground(glass);
            if (card == null || !isInside(card)) card = container.findViewById(cardId);
            if (card == null || card.getVisibility() != View.VISIBLE || card.getWidth() == 0) {
                glass.setPillInsets(0, 0, container.getWidth(), container.getHeight());
                return true;
            }
            hideCardBackground();
            if (outlined != card) {
                outlined = card;
                card.setOutlineProvider(outline);
                card.setClipToOutline(true);
            }
            // The card's bounds in the container's coordinates.
            float left = 0, top = 0;
            View v = card;
            while (v != container) {
                left += v.getLeft() + v.getTranslationX();
                top += v.getTop() + v.getTranslationY();
                ViewParent p = v.getParent();
                if (!(p instanceof View)) return true;
                v = (View) p;
            }
            int l = Math.round(left), t = Math.round(top);
            glass.setPillInsets(l, t, container.getWidth() - (l + card.getWidth()),
                    container.getHeight() - (t + card.getHeight()));
            // What's behind can only have moved during or just after a touch, or with a layout
            // pass; otherwise once a second. (Every frame kept the app drawing nonstop.)
            long now = android.os.SystemClock.uptimeMillis();
            if (layoutChanged || Interaction.recent(now) || now - lastRefresh > 1000) {
                layoutChanged = false;
                lastRefresh = now;
                glass.invalidateSelf();
            }
        } catch (Throwable t) {
            container.getViewTreeObserver().removeOnPreDrawListener(this);
            Log.e(LiquidGlassNavBarPatch.TAG, "Disabling mini player glass", t);
        }
        return true;
    }

    private boolean isInside(View view) {
        for (ViewParent p = view.getParent(); p != null; p = p.getParent()) {
            if (p == container) return true;
        }
        return false;
    }

    private void hideCardBackground() {
        Drawable bg = card.getBackground();
        if (bg == null || bg == hiddenBackground && bg.getAlpha() == 0) return;
        // Spotify recolors this drawable per song; alpha 0 survives that.
        bg.mutate().setAlpha(0);
        hiddenBackground = bg;
    }
}
