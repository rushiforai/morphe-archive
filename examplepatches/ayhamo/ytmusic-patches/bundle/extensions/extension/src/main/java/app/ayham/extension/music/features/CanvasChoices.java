package app.ayham.extension.music.features;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * canvas.md §15: what the listener says about one song's canvas from the player's song menu, kept per
 * song (rule 9). A song nobody chose anything for keeps nothing.
 */
final class CanvasChoices {
    private CanvasChoices() {
    }

    /** One song's choices. */
    static final class Song {
        /** Sources switched off for the song (rules 1-2): CanvasSettings.VIDEO, SPOTIFY, APPLE. */
        final Set<String> off = new LinkedHashSet<>();
        /** The listener's video (rule 6), or null. */
        String video;
        /** The listener's part (rule 4), in ms of [partVideo], or -1. */
        long partMs = -1;
        String partVideo;
        /** Turned-away videos (rule 8), for good. */
        final Set<String> rejected = new LinkedHashSet<>();
        /** Use (rule 7): the source the song shows, or null for the settings' order. */
        String use;
        /** A pick being tried (not kept): only that video, no search after it. */
        transient boolean only;

        boolean empty() {
            return off.isEmpty() && video == null && partMs < 0 && rejected.isEmpty() && use == null;
        }

        /**
         * Rule 9: the loop made for a choice is its own cache entry, so going back to an earlier
         * choice finds that loop again. "" for no choice.
         */
        String keySuffix() {
            StringBuilder b = new StringBuilder();
            if (video != null) b.append("_v").append(video);
            if (partMs >= 0) b.append("_p").append(partVideo).append('@').append(partMs);
            if (!rejected.isEmpty()) b.append("_r").append(Integer.toHexString(new ArrayList<>(rejected).toString().hashCode()));
            return b.toString();
        }

        JSONObject json() throws Exception {
            JSONObject o = new JSONObject();
            if (!off.isEmpty()) o.put("off", new JSONArray(off));
            if (video != null) o.put("video", video);
            if (partMs >= 0) o.put("partMs", partMs).put("partVideo", partVideo);
            if (!rejected.isEmpty()) o.put("rejected", new JSONArray(rejected));
            if (use != null) o.put("use", use);
            return o;
        }

        static Song of(JSONObject o) {
            Song s = new Song();
            if (o == null) return s;
            JSONArray a = o.optJSONArray("off");
            for (int i = 0; a != null && i < a.length(); i++) s.off.add(a.optString(i));
            s.video = o.has("video") ? o.optString("video") : null;
            s.partMs = o.optLong("partMs", -1);
            s.partVideo = o.has("partVideo") ? o.optString("partVideo") : null;
            a = o.optJSONArray("rejected");
            for (int i = 0; a != null && i < a.length(); i++) s.rejected.add(a.optString(i));
            s.use = o.has("use") ? o.optString("use") : null;
            return s;
        }
    }

    // ---- the rules as pure functions (canvas-cases.json: songMenu, pickPart, videoChoices) ----

    /** Rule 10: Reset this song's canvas shows while the song has any choice. */
    static boolean hasChoice(Song s) {
        return s != null && !s.empty();
    }

    /** The song menu's rows: {canvasSwitch, pickVideo, pickPart, notThisVideo} (rules 1, 3, 5, 8). */
    static boolean[] rows(boolean canvasOn, boolean useVideos, boolean isSong, boolean hasLoop, boolean loopOff, boolean loopShows) {
        boolean base = canvasOn && useVideos && isSong;
        return new boolean[]{base && (hasLoop || loopOff), base && !loopOff, base && loopShows, base && loopShows};
    }

    /**
     * Rule 4: a part picked. The part it was takes the picked one's place among the others (first when
     * the picked one wasn't among them); the part playing picked moves nothing. {start, others...}.
     */
    static long[] pickPart(long startMs, long[] others, long pickMs) {
        List<Long> o = new ArrayList<>();
        for (long x : others) o.add(x);
        if (pickMs != startMs) {
            int i = o.indexOf(pickMs);
            if (i >= 0) o.set(i, startMs);
            else o.add(0, startMs);
        }
        long[] r = new long[o.size() + 1];
        r[0] = pickMs;
        for (int i = 0; i < o.size(); i++) r[i + 1] = o.get(i);
        return r;
    }

    /**
     * Rule 5: the videos offered: YouTube's pairing first when the search found it too, then the
     * search's order, each once; at most 10, then the turned-away ones left out.
     */
    static List<String> videoChoices(String pairing, List<String> found, Set<String> rejected) {
        List<String> l = new ArrayList<>(new LinkedHashSet<>(found));
        if (pairing != null && l.remove(pairing)) l.add(0, pairing);
        if (l.size() > 10) l = new ArrayList<>(l.subList(0, 10));
        l.removeAll(rejected);
        return l;
    }

    // ---- kept per song ----

    private static SharedPreferences store() {
        Context c = Features.appContext;
        return c == null ? null : c.getSharedPreferences("ayham_canvas_choices", Context.MODE_PRIVATE);
    }

    static synchronized Song get(String songId) {
        SharedPreferences s = store();
        if (s == null || songId == null) return new Song();
        try {
            String v = s.getString(songId, null);
            return Song.of(v == null ? null : new JSONObject(v));
        } catch (Throwable t) {
            return new Song();
        }
    }

    static synchronized void put(String songId, Song song) {
        SharedPreferences s = store();
        if (s == null || songId == null) return;
        try {
            if (song.empty()) s.edit().remove(songId).apply();
            else s.edit().putString(songId, song.json().toString()).apply();
        } catch (Throwable ignored) {
        }
    }
}
