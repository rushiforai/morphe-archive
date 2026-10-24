/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

/**
 * How strongly the glass tab bar blurs what's behind it (#289). {@link #STANDARD}, the default, is the blur
 * the bar has always had ({@link GlassTabBar#BLUR_DP}), so nobody who leaves the choice alone sees a change.
 * {@link #LIGHT} is half of it and {@link #STRONG} two thirds more, the 12 : 24 : 40 steps the request asked for.
 */
public enum GlassBlur {
    LIGHT(GlassTabBar.BLUR_DP / 2f),
    STANDARD(GlassTabBar.BLUR_DP),
    STRONG(GlassTabBar.BLUR_DP * 5f / 3f);

    /** The blur radius in dp, before the glass works it out at a smaller size. */
    public final float dp;

    GlassBlur(float dp) {
        this.dp = dp;
    }

    /**
     * The blur radius in screen pixels at [density], whole pixels as the bar's other sizes are. The backdrop
     * also reaches this far past the pill, so the blur has something to blur at the edge.
     */
    public static int radiusPx(GlassBlur strength, float density) {
        GlassBlur pick = strength == null ? STANDARD : strength;
        return Math.round(pick.dp * density);
    }

    /** The radius the blur effect gets, with the backdrop worked out at [scale] of its size. At least 1. */
    public static float effectRadius(GlassBlur strength, float density, float scale) {
        return Math.max(1f, radiusPx(strength, density) * scale);
    }
}
