/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Block Instant Games ads patch asks about each message a game sends Facebook.
 *
 * <p>An Instant Game runs in a WebView and talks to Facebook through one JavaScript bridge, whose
 * {@code postMessage(String, String)} gets every call the game's SDK makes as JSON: a {@code type}
 * such as {@code loadadasync}, and a {@code content} holding the {@code promiseID} the game waits on.
 * The patch asks {@link #heldPromise} first thing. For one of the ad messages, with the switch on,
 * the answer is that promise, and the bridge rejects it with Facebook's own reject call and the code
 * from {@link #rejection}, the way the SDK reports an ad it can't serve. Nothing goes on to Facebook's
 * ad service, so no ad is fetched or shown and a rewarded ad grants no reward. The game hears no ad
 * and carries on.
 *
 * <p>With Answer rewarded game ads on too, the patch asks {@link #answer} before rejecting: a
 * request for a rewarded video is resolved with an ad instance of Hushfacebook's own, through
 * Facebook's own resolve call, and loading and showing that instance resolve at once, so the SDK
 * reports a watched ad and the game grants its reward. Interstitials and banners are still
 * rejected. No ad is fetched either way.
 *
 * <p>Every other message, and every message while the switch is off, Hushfacebook is paused or the
 * settings aren't ready, goes on to Facebook as it came. So does anything it can't read.
 */
public final class GameAds {
    /** The diagnostic counter route: each ad message a game sent, and the ones answered with no ad. */
    static final String ROUTE = "Instant Games ads";

    /** The ad messages, by the type the SDK sends, with the code each is rejected with. */
    static final String[][] AD_MESSAGES = {
            // Asking for an ad instance: the SDK's code for a client that has no ads.
            {"getinterstitialadasync", "CLIENT_UNSUPPORTED_OPERATION"},
            {"getrewardedvideoasync", "CLIENT_UNSUPPORTED_OPERATION"},
            // Loading one that exists already, or a banner: nothing to fill it with.
            {"loadadasync", "ADS_NO_FILL"},
            {"loadbanneradasync", "ADS_NO_FILL"},
            // Showing one: it never loaded.
            {"showadasync", "ADS_NOT_LOADED"},
    };

    /** The message a rejected game gets beside the code, for its developer's console. */
    static final String NO_AD = "No ad is available.";

    /** What the id of an ad instance {@link #answer} made starts with, so its load and show resolve too. */
    static final String WATCHED = "hushfacebook-watched-";

    /** The HookStatus count of rewarded ad messages answered as watched. */
    static final String ANSWERED = "rewarded ad messages answered as watched";

    private static final AtomicInteger instances = new AtomicInteger();

    private GameAds() {
    }

    /**
     * Injection point, first thing in the game bridge's {@code postMessage}. Answers the promise to
     * reject when [message] is an ad message and the switch is on, otherwise null to let Facebook
     * handle it. Never throws.
     */
    @Nullable
    public static String heldPromise(@Nullable String message) {
        try {
            HookStatus.invoked(FamilyNames.GAME_ADS);
            String type = type(message);
            if (code(type) == null) return null;
            FeedFilterCounters.sawList(ROUTE, 1);
            FeedFilterCounters.sawKind(ROUTE, type);
            if (!Utils.settingsReady() || !Settings.BLOCK_GAME_ADS.get()) return null;
            JSONObject content = new JSONObject(message).optJSONObject("content");
            String promise = content != null ? content.optString("promiseID", "") : "";
            if (promise.isEmpty()) return null;
            FeedFilterCounters.removed(ROUTE, 1, "no ad");
            Logger.printDebug(() -> "Instant Games ads: answered " + type + " with no ad");
            return promise;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.GAME_ADS, "game message", failure);
            return null;
        }
    }

    /**
     * Injection point, after {@link #heldPromise} answered a promise for [message]. With Answer
     * rewarded game ads on, what to resolve that promise with: a rewarded video request gets an ad
     * instance whose id starts with {@link #WATCHED}, and a load or show of such an instance gets an
     * empty answer, which the SDK takes as loaded or watched. Null rejects the promise as before.
     * Never throws.
     */
    @Nullable
    public static Object answer(@Nullable String message) {
        try {
            String type = type(message);
            if (type == null || !Utils.settingsReady() || !Settings.BLOCK_GAME_ADS.get()
                    || !Settings.ANSWER_REWARDED_GAME_ADS.get()) return null;
            JSONObject content = new JSONObject(message).optJSONObject("content");
            if (content == null) return null;
            JSONObject payload;
            if ("getrewardedvideoasync".equals(type)) {
                payload = new JSONObject()
                        .put("placementID", content.optString("placementID", ""))
                        .put("adInstanceID", WATCHED + instances.incrementAndGet());
            } else if (("loadadasync".equals(type) || "showadasync".equals(type))
                    && content.optString("adInstanceID", "").startsWith(WATCHED)) {
                payload = new JSONObject();
            } else {
                return null;
            }
            HookStatus.counted(FamilyNames.GAME_ADS, ANSWERED);
            Logger.printDebug(() -> "Instant Games ads: answered " + type + " as watched");
            return payload;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.GAME_ADS, "rewarded answer", failure);
            return null;
        }
    }

    /** The code the promise [heldPromise] answered for [message] is rejected with. Never throws. */
    public static String rejection(@Nullable String message) {
        try {
            String code = code(type(message));
            return code != null ? code : "ADS_NO_FILL";
        } catch (Throwable failure) {
            return "ADS_NO_FILL";
        }
    }

    /**
     * The message's type as the SDK sends it, or null when it isn't a JSON object with one. A message
     * that doesn't hold an ad message's type anywhere isn't parsed: games send many.
     */
    @Nullable
    private static String type(@Nullable String message) {
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

    /** The code an ad message of [type] is rejected with, or null when it isn't one. */
    @Nullable
    private static String code(@Nullable String type) {
        if (type == null) return null;
        for (String[] message : AD_MESSAGES) {
            if (message[0].equals(type)) return message[1];
        }
        return null;
    }
}
