/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

/**
 * How much room a floating glass pill leaves under itself (#87). {@link #STANDARD}, the default, is the
 * pill as it has always sat. {@link #MORE} and {@link #MOST} make the bar that much taller and lift the
 * pill and its tabs by it, so the pill keeps its size and the room under it shows what's behind. Only a
 * floating pill is lifted ({@link GlassTabBar#liftPx}): over Instagram's own bar the content stops at
 * the bar's top, so the room would only be bar.
 */
public enum GlassLift {
    STANDARD(0),
    MORE(8),
    MOST(16);

    /** How much higher the pill sits, in dp. */
    public final int dp;

    GlassLift(int dp) {
        this.dp = dp;
    }
}
