/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.live;

import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.download.LiveRecorder;

import org.json.JSONObject;

import java.util.Iterator;
import java.util.Map;

/**
 * Finds what to record in a LIVE room the viewer is in: the stream address TikTok already gave
 * the room, FLV first because it is one continuous download, HLS when there is no FLV. Nothing is
 * fetched here and nothing before the viewer taps Record is looked at beyond the room's own fields.
 */
public final class LiveRoomStream {
    private LiveRoomStream() {
    }

    /** What was found: a target to record, or the reason there isn't one. */
    public static final class Pick {
        public final LiveRecorder.Target target;
        public final String problem;

        Pick(LiveRecorder.Target target, String problem) {
            this.target = target;
            this.problem = problem;
        }
    }

    /** Best first. "ao" is audio only and is never chosen. */
    private static final String[] QUALITY_ORDER = {"origin", "uhd", "hd", "sd", "ld", "md"};

    /** A {@code preferred} that asks for the smallest stream the room has rather than one quality. */
    static final String LOWEST = "lowest";

    /** A {@code preferred} for one of the room's own presets: "~hd" takes hd, else the nearest one below, else the nearest above. */
    private static final String NEAREST = "~";

    /** The room's own preset keys a recording can ask for, best first. */
    static final String[] PRESETS = {"origin", "uhd", "hd", "sd", "ld"};

    static boolean isPreset(String choice) {
        for (String preset : PRESETS) {
            if (preset.equals(choice)) return true;
        }
        return false;
    }

    private static int rank(String quality) {
        for (int i = 0; i < QUALITY_ORDER.length; i++) {
            if (QUALITY_ORDER[i].equals(quality)) return i;
        }
        return QUALITY_ORDER.length;
    }

    /**
     * The {@code preferred} a recording passes for the LIVE recording quality choice (#203):
     * "highest" asks for the best there is, "lowest" for the smallest, and anything else for the
     * quality being watched, {@code watching}, which can be null. One of the room's own preset
     * keys (origin, uhd, hd, sd, ld) asks for that stream, or the nearest one when the room lacks it.
     */
    public static String forRecording(String choice, String watching) {
        if ("highest".equals(choice)) return null;
        if (isPreset(choice)) return NEAREST + choice;
        if (LOWEST.equals(choice)) return LOWEST;
        return watching;
    }

    private static boolean https(String url) {
        return url != null && url.regionMatches(true, 0, "https://", 0, 8);
    }

    private static String clean(Object value) {
        if (!(value instanceof String)) return null;
        String text = ((String) value).trim();
        return https(text) ? text : null;
    }

    /**
     * The address and quality to record. {@code preferred} is the quality the viewer is watching
     * when known (TikTok's key such as "hd"); a stream without it falls to the best there is.
     * {@link #LOWEST} takes the smallest one instead. Any argument can be null.
     */
    public static Pick choose(String streamDataJson, Map<String, String> flvMap, Map<String, String> hlsMap,
                              String hlsUrl, String preferred, String creator, String roomId) {
        String[] best = new String[2]; // [quality, url] for flv
        String[] bestHls = new String[2];
        if (streamDataJson != null && !streamDataJson.isEmpty()) {
            try {
                JSONObject root = new JSONObject(streamDataJson);
                JSONObject data = root.optJSONObject("data");
                if (data != null) {
                    Iterator<String> keys = data.keys();
                    while (keys.hasNext()) {
                        String quality = keys.next();
                        JSONObject main = null;
                        JSONObject entry = data.optJSONObject(quality);
                        if (entry != null) main = entry.optJSONObject("main");
                        if (main == null) continue;
                        consider(best, quality, clean(main.optString("flv", null)), preferred);
                        consider(bestHls, quality, clean(main.optString("hls", null)), preferred);
                    }
                }
            } catch (Throwable ignored) {
                // The maps below are the other source.
            }
        }
        if (flvMap != null) {
            for (Map.Entry<String, String> entry : flvMap.entrySet()) {
                consider(best, entry.getKey(), clean(entry.getValue()), preferred);
            }
        }
        if (hlsMap != null) {
            for (Map.Entry<String, String> entry : hlsMap.entrySet()) {
                consider(bestHls, entry.getKey(), clean(entry.getValue()), preferred);
            }
        }
        if (best[1] != null) {
            return new Pick(new LiveRecorder.Target(best[1], LiveRecorder.Transport.FLV, creator, roomId, best[0]), null);
        }
        if (bestHls[1] != null) {
            return new Pick(new LiveRecorder.Target(bestHls[1], LiveRecorder.Transport.HLS, creator, roomId, bestHls[0]), null);
        }
        String single = clean(hlsUrl);
        if (single != null) {
            return new Pick(new LiveRecorder.Target(single, LiveRecorder.Transport.HLS, creator, roomId, null), null);
        }
        return new Pick(null, "No stream address");
    }

    /** Keeps the better of the current {@code best} and this one: the preferred quality wins, then rank. */
    private static void consider(String[] best, String quality, String url, String preferred) {
        if (url == null || quality == null || "ao".equals(quality)) return;
        if (best[1] == null || better(quality, best[0], preferred)) {
            best[0] = quality;
            best[1] = url;
        }
    }

    /** How far a stream is from the asked preset: 0 is it, then the ones below nearest first, then the ones above. */
    private static int distance(String quality, String preset) {
        int asked = rank(preset);
        int rank = rank(quality);
        if (rank == QUALITY_ORDER.length) return 1000;
        return rank >= asked ? rank - asked : 100 + (asked - rank);
    }

    private static boolean better(String candidate, String current, String preferred) {
        if (preferred != null && preferred.startsWith(NEAREST)) {
            String preset = preferred.substring(NEAREST.length());
            return distance(candidate, preset) < distance(current, preset);
        }
        if (LOWEST.equals(preferred)) {
            // A key not in the order counts as the best, so a known small stream wins over it.
            return lowness(candidate) > lowness(current);
        }
        if (preferred != null) {
            boolean candidateIsIt = preferred.equals(candidate);
            boolean currentIsIt = preferred.equals(current);
            if (candidateIsIt != currentIsIt) return candidateIsIt;
        }
        return rank(candidate) < rank(current);
    }

    private static int lowness(String quality) {
        int rank = rank(quality);
        return rank == QUALITY_ORDER.length ? -1 : rank;
    }

    /** What to record when the screen is the source (#37): the room's creator and id, no stream address. */
    public static Pick screenTarget(Object room) {
        if (room == null) return new Pick(null, "No room");
        try {
            Object owner = Reflect.readField(room, "owner");
            String creator = owner == null ? null : Reflect.string(owner, "getUsername", "username");
            Object id = Reflect.readField(room, "idStr");
            return new Pick(new LiveRecorder.Target(null, LiveRecorder.Transport.SCREEN, creator,
                    id instanceof String ? (String) id : null, "screen"), null);
        } catch (Throwable failure) {
            return new Pick(null, "Unreadable room");
        }
    }

    /** Reads the room off TikTok's room object. Never throws. */
    @SuppressWarnings("unchecked")
    public static Pick fromRoom(Object room, String preferred) {
        if (room == null) return new Pick(null, "No room");
        try {
            Object streamUrl = Reflect.readField(room, "streamUrl");
            if (streamUrl == null) return new Pick(null, "No stream");
            String json = null;
            Object core = Reflect.readField(streamUrl, "liveCoreSDKData");
            Object pull = core == null ? null : Reflect.readField(core, "pullData");
            Object streamData = pull == null ? null : Reflect.readField(pull, "streamData");
            if (streamData instanceof String) json = (String) streamData;
            if (json == null) {
                Object fallback = Reflect.readField(room, "pullStreamData");
                if (fallback instanceof String) json = (String) fallback;
            }
            Object flv = Reflect.readField(streamUrl, "flvPullUrl");
            Object hls = Reflect.readField(streamUrl, "hlsPullUrlMap");
            Object hlsOne = Reflect.readField(streamUrl, "hlsPullUrl");
            Object owner = Reflect.readField(room, "owner");
            String creator = owner == null ? null : Reflect.string(owner, "getUsername", "username");
            Object id = Reflect.readField(room, "idStr");
            String roomId = id instanceof String ? (String) id : null;
            return choose(json,
                    flv instanceof Map ? (Map<String, String>) flv : null,
                    hls instanceof Map ? (Map<String, String>) hls : null,
                    hlsOne instanceof String ? (String) hlsOne : null,
                    preferred, creator, roomId);
        } catch (Throwable failure) {
            return new Pick(null, "Unreadable room");
        }
    }
}
