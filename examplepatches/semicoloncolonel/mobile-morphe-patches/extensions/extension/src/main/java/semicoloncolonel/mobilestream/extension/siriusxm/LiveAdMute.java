package semicoloncolonel.mobilestream.extension.siriusxm;

import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.regex.Pattern;

/**
 * SiriusXM "Mask live ad breaks": mutes the player while SiriusXM labels a
 * live channel's audio as an ad.
 *
 * SiriusXM's live data marks each commercial with isAd, and the app then
 * titles the now-playing item "Ad - Advertiser" in its media session. The
 * patch passes every MediaSession.setMetadata call through
 * {@link #setMetadata}, which watches that title. Media3's
 * ExoPlayerImpl.setVolume passes through {@link #volume}, which answers 0
 * during an ad and the volume the app asked for otherwise, so the app's own
 * fades keep working once the show returns.
 *
 * {@link #filterJson} replaces the advertiser's name in the live data, so
 * the player shows "Ad - (muted speaker) Commercial break".
 *
 * With "Also mute promos and PSAs" on, SiriusXM's own promos and public
 * service announcements are muted too. SiriusXM does not flag them, but a
 * channel's playback timeline lists every short item with its length, and a
 * show never appears there as an item. On a timeline that has flagged ads,
 * an unflagged item of 60 seconds or less is a promo or PSA. Its artist and
 * name are remembered, so it is recognized in the live updates too, which do
 * not give lengths. An item those updates bring before any timeline has
 * listed it is recognized by its name: SiriusXM's promos name the app or a
 * channel ("Ch 87/SiriusXM App"), and its PSAs name the nonprofit's .org
 * address. The player shows "(muted speaker) Announcement".
 */
@SuppressWarnings("unused")
public final class LiveAdMute {
    private static final String TAG = "MSP-SXM";

    private static volatile boolean inAd;
    /** Each player and the volume the app last asked for. */
    private static final Map<Object, Float> requested = Collections.synchronizedMap(new WeakHashMap<>());

    private LiveAdMute() {
    }

    /** Shown in place of the advertiser's name. The app puts "Ad - " in front of it. */
    private static final String AD_NAME = "🔇 Commercial break";
    /** Shown as the artist of a muted promo or PSA, with {@link #PROMO_NAME} after it. */
    private static final String PROMO_ARTIST = "🔇 Announcement";
    private static final String PROMO_NAME = "Muted";
    private static final long PROMO_MAX_MS = 60_000;
    /** The names of SiriusXM's promos and PSAs, for items no timeline has listed. */
    private static final Pattern PROMO_NAME_PATTERN = Pattern.compile(
            "(?i)siriusxm app|^ch \\d+\\b|\\.org\\s*$");
    private static final Pattern IS_AD = Pattern.compile("\"isAd\"\\s*:\\s*true|\"AD\"");

    /** The artist and name of each promo or PSA seen on a timeline. */
    private static final Set<String> promos = Collections.synchronizedSet(new HashSet<>());

    /** Replaced by the patch: true when its Also mute promos and PSAs option is on. */
    private static boolean mutePromos() {
        return false;
    }

    /**
     * Replaces the advertiser's name in the live data, so the player shows
     * "Ad - (muted speaker) Commercial break" instead of the ad's name. Each
     * commercial is a "cut": the live updates mark it with "isAd": true, and
     * the channel's playback timeline with "AD" in its "cutFlags".
     */
    public static String filterJson(String json) {
        if (json == null) return json;
        boolean promosOn = mutePromos();
        boolean candidate = IS_AD.matcher(json).find() || (promosOn && json.contains("\"artistName\""));
        if (!candidate) return json;
        try {
            Object root = new JSONTokener(json).nextValue();
            if (promosOn) learnPromos(root);
            if (!rename(root, promosOn)) return json;
            return root.toString();
        } catch (Throwable t) {
            return json;
        }
    }

    /** Remembers the short unflagged items of every timeline that has flagged ads. */
    private static void learnPromos(Object node) {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) learnPromos(object.opt(keys.next()));
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            boolean timelineWithAds = false;
            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.optJSONObject(i);
                if (item != null && hasAdFlag(item.optJSONArray("cutFlags"))) {
                    timelineWithAds = true;
                    break;
                }
            }
            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.optJSONObject(i);
                if (timelineWithAds && item != null && isPromo(item)) {
                    if (promos.add(key(item))) Log.i(TAG, "Promo or PSA: " + key(item));
                } else {
                    learnPromos(array.opt(i));
                }
            }
        }
    }

    private static boolean isPromo(JSONObject item) {
        JSONArray flags = item.optJSONArray("cutFlags");
        if (flags == null) return false;
        for (int i = 0; i < flags.length(); i++) {
            String flag = flags.optString(i);
            if (!"NAVIGABLE".equals(flag)) return false;
        }
        long duration = item.optLong("duration", 0);
        return duration > 0 && duration <= PROMO_MAX_MS;
    }

    /** A live update item without flags or a length, named like a promo or PSA. */
    private static boolean namedLikePromo(JSONObject item) {
        if (item.has("cutFlags") || item.optBoolean("isAd", false)) return false;
        return PROMO_NAME_PATTERN.matcher(item.optString("name")).find();
    }

    private static String key(JSONObject item) {
        return item.optString("artistName") + " \u2022 " + item.optString("name");
    }

    private static boolean rename(Object node, boolean promosOn) throws Exception {
        boolean changed = false;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            if (object.optBoolean("isAd", false) || hasAdFlag(object.optJSONArray("cutFlags"))) {
                for (String key : new String[]{"name", "artistName"}) {
                    if (object.has(key)) {
                        object.put(key, AD_NAME);
                        changed = true;
                    }
                }
            } else if (promosOn && object.has("artistName") && object.has("name")
                    && (promos.contains(key(object)) || namedLikePromo(object))) {
                object.put("artistName", PROMO_ARTIST);
                object.put("name", PROMO_NAME);
                changed = true;
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) changed |= rename(object.get(keys.next()), promosOn);
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) changed |= rename(array.get(i), promosOn);
        }
        return changed;
    }

    private static boolean hasAdFlag(JSONArray flags) {
        if (flags == null) return false;
        for (int i = 0; i < flags.length(); i++) {
            if ("AD".equals(flags.optString(i))) return true;
        }
        return false;
    }

    public static void setMetadata(MediaSession session, MediaMetadata metadata) {
        session.setMetadata(metadata);
        boolean ad = isAd(metadata);
        if (ad == inAd) return;
        inAd = ad;
        Log.i(TAG, ad ? "Ad break: muted" : "Ad break over: unmuted");
        reapply();
    }

    /** Called with the volume the app sets on a player; returns the volume to use. */
    public static float volume(Object player, float volume) {
        requested.put(player, volume);
        return inAd ? 0f : volume;
    }

    /** Called when a player starts or stops, so a player the app never set a volume on is known. */
    public static void track(Object player) {
        Float volume;
        synchronized (requested) {
            if (!requested.containsKey(player)) requested.put(player, 1f);
            volume = requested.get(player);
        }
        if (inAd) apply(player, volume == null ? 1f : volume);
    }

    static boolean isAd(MediaMetadata metadata) {
        if (metadata == null) return false;
        CharSequence title = metadata.getText(MediaMetadata.METADATA_KEY_DISPLAY_TITLE);
        if (title == null) title = metadata.getText(MediaMetadata.METADATA_KEY_TITLE);
        if (title == null) return false;
        String text = title.toString().trim();
        return text.startsWith("Ad - ") || text.equals("Ad break") || text.endsWith(" - Ad break")
                || text.startsWith(PROMO_ARTIST);
    }

    private static void reapply() {
        List<Map.Entry<Object, Float>> players;
        synchronized (requested) {
            players = new ArrayList<>(requested.entrySet());
        }
        for (Map.Entry<Object, Float> entry : players) {
            apply(entry.getKey(), entry.getValue() == null ? 1f : entry.getValue());
        }
    }

    /**
     * Sets the volume again on the player's own thread. The call goes
     * through {@link #volume}, which mutes it during an ad.
     */
    private static void apply(Object player, float volume) {
        try {
            Method looper = player.getClass().getMethod("getApplicationLooper");
            Method setVolume = player.getClass().getMethod("setVolume", float.class);
            new Handler((Looper) looper.invoke(player)).post(() -> {
                try {
                    setVolume.invoke(player, volume);
                } catch (Throwable ignored) {
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "Could not change the player volume", t);
        }
    }
}
