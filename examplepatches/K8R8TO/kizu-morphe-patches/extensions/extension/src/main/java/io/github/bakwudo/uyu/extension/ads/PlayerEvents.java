package io.github.bakwudo.uyu.extension.ads;

import android.net.Uri;

/**
 * Reads Twitch's player events and calls the player. The classes are obfuscated, so the Block
 * ads patch replaces the bodies of these methods.
 */
@SuppressWarnings({"unused", "SameReturnValue"})
public final class PlayerEvents {
    /** Any other event. */
    static final int OTHER = 0;
    /** An ad stitched into the stream starts ("twitch-stitched-ad"). */
    static final int STITCHED_AD_STARTED = 1;
    /** A quarter of a stitched ad has played. */
    static final int STITCHED_AD_QUARTILE = 2;
    /** The stream says it plays the live broadcast again (stream source "live"). */
    static final int LIVE_CONTENT = 3;
    /** The stream asks the app to request and play an ad itself ("twitch-maf-ad"). */
    static final int CLIENT_AD_REQUESTED = 4;
    /** The stream prepares a picture by picture ad ("pbyp-preflight"). */
    static final int PICTURE_BY_PICTURE_AD = 5;

    private PlayerEvents() {
    }

    /**
     * @param event A player event.
     * @return One of the constants above.
     */
    static int type(Object event) {
        return OTHER;
    }

    /**
     * @param event A {@link #STITCHED_AD_STARTED} event.
     * @return Length of this ad in seconds.
     */
    static float adDuration(Object event) {
        return 0;
    }

    /**
     * @param event A {@link #STITCHED_AD_STARTED} event.
     * @return Length of the whole ad break in seconds.
     */
    static float adBreakDuration(Object event) {
        return 0;
    }

    /**
     * Mutes or unmutes a player, the way Twitch's own mute does.
     *
     * @param player The player (Amazon IVS or ExoPlayer based) that sent an event.
     */
    static void setMuted(Object player, boolean muted) {
    }

    /**
     * Calls Amazon IVS's {@code MediaPlayer.preload(Uri, Source.Listener)}.
     */
    static void preload(Object mediaPlayer, Uri uri, Object listener) {
    }
}
