/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * extensions/facebook/.../ads/GameAds.java. Modified for facebook-morphe-patches, 2026: always on,
 * no settings, rewarded ads are rejected rather than answered as watched.
 */
package app.fbpatches.extension.facebook.ads;

import android.util.Log;

import org.json.JSONObject;

/**
 * What Block Instant Games ads asks about each message a game sends Facebook. An ad message's
 * promise is rejected with the SDK's own "no ad" code, so nothing reaches Facebook's ad service.
 */
@SuppressWarnings("unused")
public final class GameAds {
    private static final String TAG = "FbPatches";

    /** The ad messages, by the type the SDK sends, with the code each is rejected with. */
    static final String[][] AD_MESSAGES = {
            {"getinterstitialadasync", "CLIENT_UNSUPPORTED_OPERATION"},
            {"getrewardedvideoasync", "CLIENT_UNSUPPORTED_OPERATION"},
            {"loadadasync", "ADS_NO_FILL"},
            {"loadbanneradasync", "ADS_NO_FILL"},
            {"showadasync", "ADS_NOT_LOADED"},
    };

    static final String NO_AD = "No ad is available.";

    /** Set while {@link GameBridge} passes a message on, so a hooked bridge behind it doesn't ask again. */
    private static final ThreadLocal<Boolean> forwarded = new ThreadLocal<>();

    private GameAds() {
    }

    static void forwarding(boolean on) {
        if (on) forwarded.set(Boolean.TRUE);
        else forwarded.remove();
    }

    /**
     * Injection point, first thing in the game bridge's postMessage. The promise to reject when
     * [message] is an ad message, otherwise null to let Facebook handle it. Never throws.
     */
    public static String heldPromise(String message) {
        try {
            if (forwarded.get() != null) return null;
            String type = type(message);
            if (code(type) == null) return null;
            JSONObject content = new JSONObject(message).optJSONObject("content");
            String promise = content != null ? content.optString("promiseID", "") : "";
            return promise.isEmpty() ? null : promise;
        } catch (Throwable failure) {
            Log.w(TAG, "GameAds.heldPromise failed", failure);
            return null;
        }
    }

    /** Injection point: what to resolve a held promise with. Always null, so it is rejected. */
    public static Object answer(String message) {
        return null;
    }

    /** The code the held promise for [message] is rejected with. Never throws. */
    public static String rejection(String message) {
        try {
            String code = code(type(message));
            return code != null ? code : "ADS_NO_FILL";
        } catch (Throwable failure) {
            return "ADS_NO_FILL";
        }
    }

    private static String type(String message) {
        if (message == null || !mentionsAnAd(message)) return null;
        try {
            return new JSONObject(message).optString("type", null);
        } catch (Exception notJson) {
            return null;
        }
    }

    private static boolean mentionsAnAd(String message) {
        for (String[] ad : AD_MESSAGES) {
            if (message.contains(ad[0])) return true;
        }
        return false;
    }

    private static String code(String type) {
        if (type == null) return null;
        for (String[] message : AD_MESSAGES) {
            if (message[0].equals(type)) return message[1];
        }
        return null;
    }
}
