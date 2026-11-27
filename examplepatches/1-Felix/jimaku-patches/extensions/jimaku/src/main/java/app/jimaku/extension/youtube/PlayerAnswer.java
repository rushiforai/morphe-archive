package app.jimaku.extension.youtube;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import app.jimaku.extension.Languages;

/**
 * Reads YouTube's player answer for a video as the extension's {@code page-world.ts} and
 * {@code page-captions.ts} read the page's: the caption tracks, Standard's source by the same rule,
 * the length and the live state.
 */
final class PlayerAnswer {
    private PlayerAnswer() {
    }

    /**
     * What the answer says about {@code video}, or null where it says nothing to go by: another
     * video, or one YouTube won't play without an account, as age-restricted, members-only and
     * private videos are. A stream that isn't playable yet is still live.
     */
    static TrackInfo read(String video, JSONObject answer) {
        JSONObject details = answer.optJSONObject("videoDetails");
        if (details == null || !video.equals(details.opt("videoId"))) return null;
        boolean live = false;
        for (String key : new String[]{"isLive", "isUpcoming", "isPostLiveDvr"}) live |= Boolean.TRUE.equals(details.opt(key));
        JSONObject playability = answer.optJSONObject("playabilityStatus");
        boolean playable = playability != null && "OK".equals(playability.opt("status"));
        if (!playable && !live) return null;

        Object title = details.opt("title");
        double length = number(details.opt("lengthSeconds"));
        JSONObject captions = answer.optJSONObject("captions");
        JSONObject list = captions != null ? captions.optJSONObject("playerCaptionsTracklistRenderer") : null;
        JSONArray listed = list != null ? list.optJSONArray("captionTracks") : null;

        List<CaptionTrack> tracks = new ArrayList<>();
        for (int i = 0; listed != null && i < listed.length(); i++) {
            JSONObject track = listed.optJSONObject(i);
            Object code = track != null ? track.opt("languageCode") : null;
            Object address = track != null ? track.opt("baseUrl") : null;
            if (code instanceof String && address instanceof String) {
                tracks.add(new CaptionTrack((String) code, (String) address, "asr".equals(track.opt("kind"))));
            }
        }
        CaptionTrack automatic = null;
        for (CaptionTrack track : tracks) {
            if (track.automatic) {
                automatic = track;
                break;
            }
        }
        List<CaptionTrack> uploaded = new ArrayList<>();
        for (CaptionTrack track : tracks) {
            if (!track.automatic && find(uploaded, track.code) == null) uploaded.add(track);
        }

        CaptionTrack source;
        if (automatic != null) {
            source = automatic;
            for (CaptionTrack track : uploaded) {
                if (primary(track.code).equals(primary(automatic.code))) {
                    source = track;
                    break;
                }
            }
        } else {
            CaptionTrack opening = opening(list, listed, uploaded);
            source = opening != null ? opening : uploaded.size() == 1 ? uploaded.get(0) : null;
        }

        List<TrackInfo.Uploaded> languages = new ArrayList<>();
        for (CaptionTrack track : uploaded) {
            String lang = Languages.spokenLanguage(track.code);
            boolean known = false;
            for (TrackInfo.Uploaded each : languages) known |= each.lang.equals(lang);
            if (lang != null && !known) languages.add(new TrackInfo.Uploaded(lang, track));
        }
        return new TrackInfo(video, title instanceof String ? (String) title : "", Double.isFinite(length) && length > 0 ? length : null, live,
                source, automatic, source != null ? Languages.spokenLanguage(source.code) : null, Collections.unmodifiableList(languages));
    }

    /** The uploaded track the player starts with, by its place in the list for the audio track it plays. */
    private static CaptionTrack opening(JSONObject list, JSONArray listed, List<CaptionTrack> uploaded) {
        if (list == null || listed == null) return null;
        Object index = list.opt("defaultAudioTrackIndex");
        boolean whole = index instanceof Number && ((Number) index).doubleValue() == Math.rint(((Number) index).doubleValue());
        int audio = whole ? ((Number) index).intValue() : 0;
        JSONArray audioTracks = list.optJSONArray("audioTracks");
        JSONObject playing = audioTracks != null ? audioTracks.optJSONObject(audio) : null;
        Object start = playing != null ? playing.opt("defaultCaptionTrackIndex") : null;
        if (!(start instanceof Number)) return null;
        JSONObject first = listed.optJSONObject(((Number) start).intValue());
        if (first == null || "asr".equals(first.opt("kind"))) return null;
        Object code = first.opt("languageCode");
        return code instanceof String ? find(uploaded, (String) code) : null;
    }

    private static CaptionTrack find(List<CaptionTrack> tracks, String code) {
        for (CaptionTrack track : tracks) if (track.code.equals(code)) return track;
        return null;
    }

    /** A language code's first part, so an uploaded en-GB goes with an automatic en. */
    private static String primary(String code) {
        return code.split("[-_]")[0].toLowerCase(Locale.ROOT);
    }

    /** As JavaScript's Number(): lengthSeconds comes as a string. */
    private static double number(Object value) {
        if (value instanceof Number) return ((Number) value).doubleValue();
        if (value instanceof String) {
            try {
                return Double.parseDouble(((String) value).trim());
            } catch (NumberFormatException e) {
                return Double.NaN;
            }
        }
        return Double.NaN;
    }
}
