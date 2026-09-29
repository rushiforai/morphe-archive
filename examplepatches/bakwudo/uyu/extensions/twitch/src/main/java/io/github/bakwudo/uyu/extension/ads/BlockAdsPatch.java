package io.github.bakwudo.uyu.extension.ads;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.View;

import io.github.bakwudo.uyu.extension.Utils;
import io.github.bakwudo.uyu.extension.settings.Settings;

/**
 * Blocks ads on the device (docs/design.md chapter 6):
 * <ul>
 *     <li>Streams are requested as Twitch's embedded web player, which gets fewer ads.</li>
 *     <li>Ads the app would request and play itself are never requested.</li>
 *     <li>Ads that are part of the stream are covered with a black screen and muted.</li>
 *     <li>Display ads are not shown.</li>
 * </ul>
 * Optionally, live streams are loaded through a proxy ({@link StreamProxy}).
 */
@SuppressWarnings("unused")
public final class BlockAdsPatch {
    private static final String EMBED_PLAYER_TYPE = "embed";
    private static final String AD_SERVER_HOST = "edge.ads.twitch.tv";
    /** Nothing listens on port 1, so the connection is refused at once. */
    private static final String BLOCKED_URL = "https://127.0.0.1:1/";

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    private BlockAdsPatch() {
    }

    private static boolean isEnabled() {
        return Settings.BLOCK_ADS.get();
    }

    /**
     * Injection point: start of methods that return early (no ad, feature off) when ads are
     * blocked: the display ad parser, the picture by picture ad check, and the player of video
     * ads in the home feed.
     */
    public static boolean shouldBlockAds() {
        try {
            return isEnabled();
        } catch (Exception ex) {
            Utils.logError("Block ads: failed to read the setting", ex);
            return false;
        }
    }

    /**
     * Injection point: constructor of PlaybackAccessTokenParams, the parameters of the access
     * token request for live streams and VODs.
     *
     * @param playerType The player type Twitch sends ("mobile_player", "android_pip", ...).
     * @return The player type to send.
     */
    public static String overridePlayerType(String playerType) {
        try {
            if (!isEnabled()) return playerType;
            Utils.logInfo("Requesting the stream as the " + EMBED_PLAYER_TYPE + " player instead of " + playerType);
            return EMBED_PLAYER_TYPE;
        } catch (Exception ex) {
            Utils.logError("Block ads: failed to change the player type", ex);
            return playerType;
        }
    }

    /**
     * Injection point: start of the event dispatch of both players (Amazon IVS and ExoPlayer).
     *
     * @param player     The player sending the event.
     * @param renderView The view the player draws the video into, or null.
     * @param event      The player event.
     * @return true to drop the event.
     */
    public static boolean onPlayerEvent(Object player, View renderView, Object event) {
        try {
            int type = PlayerEvents.type(event);
            if (type == PlayerEvents.OTHER) return false;

            if (type == PlayerEvents.LIVE_CONTENT) {
                // Also when blocking was switched off during an ad.
                mainHandler.post(() -> AdBlockOverlay.end(player));
                return false;
            }
            if (!isEnabled()) return false;

            switch (type) {
                case PlayerEvents.STITCHED_AD_STARTED:
                    float adSeconds = PlayerEvents.adDuration(event);
                    float adBreakSeconds = PlayerEvents.adBreakDuration(event);
                    mainHandler.post(() -> AdBlockOverlay.show(renderView, player, adSeconds, adBreakSeconds));
                    return true;
                case PlayerEvents.CLIENT_AD_REQUESTED:
                    Utils.logInfo("Blocked an ad requested by the stream");
                    return true;
                case PlayerEvents.PICTURE_BY_PICTURE_AD:
                    Utils.logInfo("Blocked a picture by picture ad");
                    return true;
                default:
                    // Quartiles of a stitched ad, which Twitch reports for the ad it no longer
                    // knows about.
                    return true;
            }
        } catch (Exception ex) {
            Utils.logError("Block ads: failed to handle a player event", ex);
            return false;
        }
    }

    /**
     * Injection point: constructor of the presenter that requests the ads the app plays itself
     * (prerolls, midrolls, VOD midrolls).
     *
     * @param showAds false where Twitch never shows ads (clips, dashboard VODs).
     * @return false to make the presenter drop every ad request.
     */
    public static boolean overrideShowAds(boolean showAds) {
        if (!showAds || !shouldBlockAds()) return showAds;
        Utils.logInfo("Video ads the app plays itself are off for this player");
        return false;
    }

    /**
     * Injection point: start of the method that receives the result of the ad eligibility check
     * and requests the ad if it is true.
     *
     * @param shouldRequestAd A Boolean.
     * @return Boolean.FALSE to request no ad.
     */
    public static Object overrideShouldRequestAd(Object shouldRequestAd) {
        if (!Boolean.TRUE.equals(shouldRequestAd) || !shouldBlockAds()) return shouldRequestAd;
        Utils.logInfo("Blocked a video ad request");
        return Boolean.FALSE;
    }

    /**
     * Injection point: constructor of the state of the display ad at the top of browse pages.
     *
     * @param isTurbo true if the user has Turbo, which hides the ad.
     */
    public static boolean overrideIsTurbo(boolean isTurbo) {
        return isTurbo || shouldBlockAds();
    }

    /**
     * Injection point: start of React Native's network requests. The home feed's JavaScript
     * requests its ads (in the feed, at the top) from Twitch's ad server itself.
     *
     * @return The URL to request. Ad requests go to an address that refuses the connection, so
     * the feed gets an error and shows no ad.
     */
    public static String overrideReactNativeUrl(String url) {
        try {
            if (url == null || !url.contains(AD_SERVER_HOST) || !isEnabled()) return url;
            if (!AD_SERVER_HOST.equalsIgnoreCase(Uri.parse(url).getHost())) return url;
            Utils.logInfo("Blocked an ad request of the home feed");
            return BLOCKED_URL;
        } catch (Exception ex) {
            Utils.logError("Block ads: failed to check a request", ex);
            return url;
        }
    }

    /**
     * Injection point: return value of the method that builds the URL of a live stream's
     * playlist (usher.ttvnw.net/api/channel/hls/[channel].m3u8).
     *
     * @return The URL to load.
     */
    public static Uri overrideStreamUri(Uri uri) {
        try {
            return uri != null && isEnabled() ? StreamProxy.override(uri) : uri;
        } catch (Exception ex) {
            Utils.logError("Block ads: failed to use the proxy", ex);
            return uri;
        }
    }

    /**
     * Injection point: replaces the call of Amazon IVS's MediaPlayer.preload(Uri, Source.Listener)
     * that loads a live stream's playlist.
     */
    public static void preload(Object mediaPlayer, Uri uri, Object listener) {
        StreamProxy.preload(mediaPlayer, uri, listener);
    }
}
