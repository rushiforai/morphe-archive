package app.southstar21.extension.spotify.liquidglass;

import android.graphics.Color;

/**
 * The bar's look. Spotify has no settings menu yet, so these are the Instagram patch's
 * defaults (measured from iOS), with blur and refraction from the patch options.
 */
final class NavbarStyle {

    /** Where a bar gets its values. */
    interface Source {
        NavbarStyle get();
    }

    final float blurDp;
    /** 0..1 */
    final float refraction = LiquidGlassNavBarPatch.refractionPercent() / 100f;
    /** How much of the glass is material: 55% on the bar (the Instagram patch's Clear preset). */
    final float opacity;
    final float vibrancy = 1.25f;
    final float edgeClarity = 0.55f;
    // No line around the bar.
    final float rim = 0f;
    final float glare = 0.30f;
    final float shadow = 0.50f;
    /** The tint color, or 0 for none. */
    final int tint = 0;
    final int heightDp = 64;
    /** As wide as the mini player, which Spotify keeps 8dp from the screen edges. */
    final int sideMarginDp = 8;
    final int bottomGapDp = 8;
    /** 0..1, 1 = a full pill. */
    final float roundness;
    final int tabInsetDp = 10;
    final float selectionShade = 1f;
    final int selectionWidthDp = 10;
    final int selectionInsetDp = 4;
    final float dropScale = 1.30f;
    final float shrunkScale = 0.83f;
    final boolean southstar21 = LiquidGlassNavBarPatch.southstar21Style();
    final boolean glassyPill = false;
    /** iOS style: the capsule turns into clear glass while pressed (off: stays grey, like iOS). */
    final boolean glassWhileDragging = false;
    /** 0..1 */
    final float edgeColors = 0.5f;
    final boolean haptics = true;
    /** Instagram's iOS bar shrinks while scrolling; Spotify's doesn't. */
    final boolean shrinkOnScroll = false;
    /** Never changes: there are no settings to change it. */
    final int version = 0;

    /** The bar and the mini player share one corner radius. */
    private static final float CORNER_RADIUS_DP = 16f;
    /** The mini player card's height (Spotify's floating_now_playing_bar_height). */
    private static final float MINI_PLAYER_HEIGHT_DP = 56f;

    private static NavbarStyle current;
    private static NavbarStyle miniPlayer;

    private NavbarStyle(float roundness, float opacity) {
        this.blurDp = LiquidGlassNavBarPatch.blurRadiusDp();
        this.roundness = roundness;
        this.opacity = opacity;
    }

    static NavbarStyle get() {
        if (current == null) current = new NavbarStyle(roundnessFor(64f), 0.55f);
        return current;
    }

    /** The mini player's glass: the bar's, on Spotify's card. */
    static NavbarStyle miniPlayer() {
        if (miniPlayer == null) miniPlayer = new NavbarStyle(roundnessFor(MINI_PLAYER_HEIGHT_DP), 0.55f);
        return miniPlayer;
    }

    /** The roundness that gives a {@code heightDp} tall shape the shared corner radius. */
    private static float roundnessFor(float heightDp) {
        return Math.min(1f, CORNER_RADIUS_DP / (heightDp / 2f));
    }

    /**
     * The glass material's color at {@code alpha}: iOS's near black rgb(12, 14, 17) in dark
     * mode or white in light mode, with the tint mixed in.
     */
    int material(boolean dark, int alpha) {
        int r = dark ? 12 : 0xFA, g = dark ? 14 : 0xFA, b = dark ? 17 : 0xFC;
        if (tint != 0) {
            float k = dark ? 0.32f : 0.16f;
            r = Math.round(r + (Color.red(tint) - r) * k);
            g = Math.round(g + (Color.green(tint) - g) * k);
            b = Math.round(b + (Color.blue(tint) - b) * k);
        }
        return Color.argb(alpha, r, g, b);
    }
}
