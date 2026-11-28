package app.ayham.extension.music.features;

import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/**
 * Canvas from the song's music video (Metrolist's pipeline, Prism's video and part picking): a video
 * search scored by Prism's rules gives the video, its "Most replayed" curve picks the part, and only the DASH
 * fragments of that part are fetched (visionOS player URLs need no signature solving), then remuxed
 * into a small self-contained MP4 that loops muted over the art.
 */
final class VideoCanvas {
    private static final String TAG = "Ayham";
    static final double CLIP_SEC = 8;
    /** Fewer preview frames than this can't tell a still from a moving video (Prism's ClipFinder). */
    private static final int MIN_FRAMES = 8;
    private static final String WEB_NEXT = "https://www.youtube.com/youtubei/v1/next?prettyPrint=false";
    private static final String VISION = "https://www.youtube.com/youtubei/v1/";
    private static final String VISION_VERSION = "1.02";
    private static volatile String visitor;
    /** What is read into memory (a player answer, a storyboard sheet, the stream's index): far over any real one. */
    private static final long READ_CAP = 16L * 1024 * 1024;
    /** One cut's fragments, written to a file: a Full video's whole 1080p stream (a few hundred MB for a long one) fits. */
    private static final long MAX_CUT_BYTES = 512L * 1024 * 1024;

    private VideoCanvas() {
    }

    /**
     * The loop file for the song, or null (none, or not this time). [noVideo] is set when the song has no usable video.
     * [songMs] the song's length (0 unknown: the video's length is then not checked against it).
     */
    static synchronized File clip(String songId, String songTitle, String artist, long songMs, File dir, int artPx, boolean[] noVideo) throws Exception {
        return clip(songId, songTitle, artist, songMs, dir, artPx, noVideo, 0, false);
    }

    /**
     * [height]: the stream's height the listener asked (canvas.md §13 rule 6), 0 for Auto (the art's
     * size). [full]: Full video mode (rule 7), the whole music video, muted, instead of the best part.
     */
    static synchronized File clip(String songId, String songTitle, String artist, long songMs, File dir, int artPx, boolean[] noVideo,
                                  int height, boolean full) throws Exception {
        return clip(songId, songTitle, artist, songMs, dir, artPx, noVideo, height, full, null);
    }

    /** [ch]: the listener's choices for the song (canvas.md §15), or null. */
    static synchronized File clip(String songId, String songTitle, String artist, long songMs, File dir, int artPx, boolean[] noVideo,
                                  int height, boolean full, CanvasChoices.Song ch) throws Exception {
        long t0 = System.currentTimeMillis();
        String[] why = new String[1];
        String[] video = gatedVideo(songId, songTitle, artist, Math.round(songMs / 1000.0), why, ch);
        if (video == null) {
            // a video that can't be played now may be another time; the rest are kept as "none"
            if (!ClipGate.RESTRICTED.equals(why[0])) noVideo[0] = true;
            return null;
        }
        JSONObject player = visionPlayer(video[0]);
        String status = player.optJSONObject("playabilityStatus") == null ? "" : player.getJSONObject("playabilityStatus").optString("status");
        if (!"OK".equals(status)) {
            Log.i(TAG, "canvas video: " + video[0] + " not playable (" + status + ")");
            return null;
        }
        // the square crop shows the video's full height across the art (the screen's width): 360p up to 1080p
        int screen = android.content.res.Resources.getSystem().getDisplayMetrics().widthPixels;
        int want = height > 0 ? height : Math.max(artPx, screen) < 480 ? 360 : Math.max(artPx, screen) < 900 ? 720 : 1080;
        JSONObject f = pickFormat(player.optJSONObject("streamingData"), want);
        if (f == null) {
            noVideo[0] = true;
            Log.i(TAG, "canvas video: " + video[0] + " has no H.264 DASH stream");
            return null;
        }
        double dur = player.optJSONObject("videoDetails") == null ? 0 : player.getJSONObject("videoDetails").optDouble("lengthSeconds", 0);
        File canvas = new File(dir, "canvas");
        if (!canvas.isDirectory() && !canvas.mkdirs()) return null;
        File out = new File(canvas, "mv_" + songId + (height > 0 ? "_q" + height : "") + (full ? "_full" : "")
                + (ch == null ? "" : ch.keySuffix()) + ".mp4");

        // Prism's first look: the storyboard (bars, a still upload, the best window near the peak, the crop)
        long length = Math.round(dur * 1000);
        Board b = null;
        try {
            b = board(player, length);
        } catch (Throwable t) {
            Log.w(TAG, "canvas video: storyboard not read: " + t);
        }
        if (b != null) length = Math.max(length, b.frames.size() * b.interval);
        if (length < ClipJudge.WINDOW_MS) {
            // no length and no frames: nothing to cut a loop from
            noVideo[0] = true;
            Log.i(TAG, "canvas video: " + video[0] + " has no length");
            return null;
        }
        ClipJudge.Loop loop;
        double peak = -1;
        if (b == null || b.frames.size() < MIN_FRAMES) {
            // no preview frames: nothing to judge by, so the middle of the video (the curve is not used)
            long[] mid = ClipJudge.noFrames(length);
            loop = new ClipJudge.Loop();
            loop.startMs = mid[0];
            loop.endMs = mid[1];
            loop.lengthMs = length;
            Log.i(TAG, "canvas video: no storyboard frames: the middle 8 s");
        } else {
            // the still check first: a still upload needs no "most replayed" curve
            if (ClipJudge.still(b.frames, ClipJudge.bars(b.frames))) {
                noVideo[0] = true;
                Log.i(TAG, "canvas video: " + video[0] + " is a still picture (" + b.frames.size() + " preview frames)");
                return null;
            }
            double[] heat = heatmap(video[0]);
            peak = heat == null ? -1 : partStart(heat, length / 1000.0);
            // the chorus from the synced lyrics Morphe already has for the song (canvas.md §6 rule 11)
            Long chorus = null;
            Object[] lyr = LyricTiming.syncedFor(songId);
            if (lyr != null) chorus = BestPart.chorusMs(songMs > 0 ? songMs : length, (long[]) lyr[0], (String[]) lyr[1]);
            if (chorus != null) Log.i(TAG, "canvas video: chorus from the lyrics at " + chorus / 1000.0 + " s");
            loop = ClipJudge.judge(b.frames, b.interval, length, peak < 0 ? null : Math.round(peak * 1000), chorus);
            if (loop == null) {
                noVideo[0] = true;
                Log.i(TAG, "canvas video: " + video[0] + " has no window that moves: a still picture");
                return null;
            }
            Log.i(TAG, String.format(Locale.ROOT, "canvas video: storyboard %d frames every %d ms, bars %.2f/%.2f/%.2f/%.2f, crop %.2f, other parts %s",
                    b.frames.size(), b.interval, loop.bars[0], loop.bars[1], loop.bars[2], loop.bars[3], loop.cropX, loop.others));
        }
        // §15 rule 4: the listener's part, in the same video, never moved by a new lookup
        boolean picked = ch != null && ch.partMs >= 0 && video[0].equals(ch.partVideo);
        long[] po = new long[loop.others.size()];
        for (int i = 0; i < po.length; i++) po[i] = loop.others.get(i);
        long[] parts = picked ? CanvasChoices.pickPart(loop.startMs, po, ch.partMs) : null;
        if (picked) {
            Log.i(TAG, "canvas video: the listener's part at " + ch.partMs / 1000.0 + " s");
            loop.startMs = ch.partMs;
            loop.others = new ArrayList<>();
            for (int i = 1; i < parts.length; i++) loop.others.add(parts[i]);
        }
        float[] bars = loop.bars;
        float crop = loop.cropX;
        double start = Math.max(0, Math.min(loop.startMs / 1000.0, length / 1000.0 - CLIP_SEC));
        Log.i(TAG, "canvas video: " + video[0] + " '" + video[1] + "' " + f.optInt("height") + "p, part at "
                + String.format(Locale.ROOT, "%.1f", start) + " s of " + length / 1000 + " s ("
                + (peak < 0 ? "no most-replayed peak" : String.format(Locale.ROOT, "most replayed at %.1f s", peak)) + "), found in " + (System.currentTimeMillis() - t0) + " ms");

        // Prism's second look, on real frames (a small copy of the same seconds): end on a cut, no flashing;
        // a part that flashes gives way to the next other part once, and if that flashes too, no canvas
        JSONObject low = pickFormat(player.optJSONObject("streamingData"), 240);
        double end = start + CLIP_SEC;
        if (full) {
            // Full video: the whole of it, from its start
            start = 0;
            end = length / 1000.0;
        } else if (low != null) {
            for (int attempt = 0; attempt < 2; attempt++) {
                double e = refine(low, start, canvas);
                if (e > 0) {
                    end = e;
                    break;
                }
                Long next = loop.others.isEmpty() || picked ? null : loop.others.get(0);
                if (picked) break; // the listener's part is cut as it is
                if (e == 0 || attempt == 1 || next == null) {
                    if (e < 0) {
                        noVideo[0] = true;
                        Log.i(TAG, "canvas video: " + video[0] + " flashes: not shown");
                        return null;
                    }
                    break;
                }
                Log.i(TAG, "canvas video: the part flashes, trying another");
                start = next / 1000.0;
                end = start + CLIP_SEC; // the window moved: its end with it
            }
        }
        double from = cut(f, start, end, canvas, out); // the loop starts on the key frame at or before [start]
        try (java.io.FileWriter w = new java.io.FileWriter(new File(canvas, out.getName().substring(0, out.getName().length() - 4) + ".crop"))) {
            w.write(String.format(Locale.ROOT, "%.3f %.3f %.3f %.3f %.3f", crop, bars[0], bars[1], bars[2], bars[3]));
        }
        // §15: what the song menu offers about this loop: its video, its part and the other parts
        try (java.io.FileWriter w = new java.io.FileWriter(infoFile(out))) {
            StringBuilder o = new StringBuilder();
            for (long x : loop.others) if (Math.abs(x - Math.round(start * 1000)) >= 15_000 && o.length() < 200) o.append(o.length() > 0 ? "," : "").append(x);
            w.write(video[0] + "\t" + Math.round(start * 1000) + "\t" + o + "\t" + video[1].replace('\t', ' ').replace('\n', ' '));
        }
        HlsClip.trim(canvas, out);
        Log.i(TAG, String.format(Locale.ROOT, "canvas video: %d KB loop %.1f-%.1f s ready %d ms after the lookup",
                out.length() / 1024, from, end, System.currentTimeMillis() - t0));
        return out;
    }

    private static File infoFile(File clip) {
        String n = clip.getAbsolutePath();
        return new File(n.substring(0, n.length() - 4) + ".info");
    }

    /** A video loop's info (§15): {videoId, startMs, others "a,b", title}, or null. */
    static String[] infoOf(String clipPath) {
        if (clipPath == null || !clipPath.endsWith(".mp4")) return null;
        try {
            String[] p = new String(java.nio.file.Files.readAllBytes(infoFile(new File(clipPath)).toPath()), java.nio.charset.StandardCharsets.UTF_8).split("\t", -1);
            return p.length >= 4 ? p : null;
        } catch (Throwable t) {
            return null;
        }
    }

    /** Songs the gate found are not songs (episodes, uploads, live): the song menu offers nothing for them. */
    static final java.util.Set<String> notSongs = java.util.Collections.synchronizedSet(new java.util.HashSet<>());

    /** The crop saved with a video loop: {cropX, bars left, top, right, bottom}, or null. */
    static float[] cropOf(String clipPath) {
        if (clipPath == null || !clipPath.endsWith(".mp4")) return null;
        File f = new File(clipPath.substring(0, clipPath.length() - 4) + ".crop");
        if (!f.exists()) return null;
        try {
            String[] p = new String(java.nio.file.Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8).trim().split(" ");
            float[] out = new float[5];
            for (int i = 0; i < 5; i++) out[i] = Float.parseFloat(p[i]);
            return out;
        } catch (Throwable t) {
            return null;
        }
    }

    /** The storyboard's preview frames as grids (Prism's Storyboard, largest level, sheets up to 2 MB). */
    static final class Board {
        List<int[]> frames = new ArrayList<>();
        long interval;
    }

    private static Board board(JSONObject player, long lengthMs) throws Exception {
        JSONObject sb = player.optJSONObject("storyboards");
        JSONObject r = sb == null ? null : sb.optJSONObject("playerStoryboardSpecRenderer");
        String spec = r == null ? null : r.optString("spec", null);
        if (spec == null) return null;
        String[] parts = spec.split("\\|");
        if (parts.length < 2) return null;
        String[] f = parts[parts.length - 1].split("#");
        if (f.length < 8) return null;
        int w = Integer.parseInt(f[0]), h = Integer.parseInt(f[1]), count = Integer.parseInt(f[2]), cols = Integer.parseInt(f[3]), rows = Integer.parseInt(f[4]);
        long interval = Long.parseLong(f[5]);
        // a damaged spec (no grid, no frames) is no storyboard, not a division by zero
        if (w <= 0 || h <= 0 || count <= 0 || cols <= 0 || rows <= 0) return null;
        if (interval <= 0) interval = lengthMs > 0 ? lengthMs / count : 0;
        if (interval <= 0) return null;
        int level = parts.length - 2, per = cols * rows, sheets = (count + per - 1) / per;
        Board b = new Board();
        b.interval = interval;
        long bytes = 0;
        for (int n = 0; n < sheets && bytes < 2_000_000; n++) {
            String url = parts[0].replace("$L", String.valueOf(level)).replace("$N", f[6].replace("$M", String.valueOf(n)))
                    + "&sigh=" + f[7].replace("$", "%24");
            HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
            byte[] img;
            try {
                c.setConnectTimeout(10_000);
                c.setReadTimeout(15_000);
                if (c.getResponseCode() >= 400) break;
                img = read(c.getInputStream());
            } finally {
                c.disconnect();
            }
            bytes += img.length;
            android.graphics.Bitmap bmp = android.graphics.BitmapFactory.decodeByteArray(img, 0, img.length);
            if (bmp == null) break;
            try {
                int[] px = new int[bmp.getWidth() * bmp.getHeight()];
                bmp.getPixels(px, 0, bmp.getWidth(), 0, 0, bmp.getWidth(), bmp.getHeight());
                for (int i = 0; i < px.length; i++) px[i] = (((px[i] >> 16) & 255) * 3 + ((px[i] >> 8) & 255) * 6 + (px[i] & 255)) / 10;
                for (int i = 0; i < per && n * per + i < count; i++) {
                    int x0 = (i % cols) * w, y0 = (i / cols) * h;
                    if (x0 + w > bmp.getWidth() || y0 + h > bmp.getHeight()) break;
                    b.frames.add(ClipJudge.grid(px, bmp.getWidth(), x0, y0, w, h));
                }
            } finally {
                bmp.recycle();
            }
        }
        return b.frames.size() < 3 ? null : b;
    }

    /**
     * The loop's end (video seconds; on a cut 5 to 9 s in, else 8 s), from a small copy of the
     * same seconds read frame by frame; -1 when it flashes, 0 when the frames could not be read.
     */
    private static double refine(JSONObject low, double start, File dir) {
        File tmp = new File(dir, "judge.mp4");
        try {
            double key = cut(low, start, start + CLIP_SEC + 2, dir, tmp);
            List<int[]> fr = new ArrayList<>();
            List<Long> tl = new ArrayList<>();
            ClipFrames.read(tmp, fr, tl);
            if (fr.size() < 10) {
                Log.i(TAG, "canvas video: real frames: only " + fr.size() + " read");
                return 0;
            }
            long[] ts = new long[tl.size()];
            for (int i = 0; i < ts.length; i++) ts[i] = tl.get(i);
            long step = (ts[ts.length - 1] - ts[0]) / Math.max(1, ts.length - 1);
            long end = ClipJudge.end(fr, ts, ts[ts.length - 1] + step);
            Log.i(TAG, "canvas video: real frames: " + fr.size() + " read from " + key + " s, cuts at " + ClipJudge.cuts(fr, ts) + " ms, loop " + (end < 0 ? "flashes" : end + " ms"));
            return end < 0 ? -1 : key + end / 1000.0;
        } catch (Throwable t) {
            Log.w(TAG, "canvas video: real frames not read: " + t);
            return 0;
        } finally {
            //noinspection ResultOfMethodCallIgnored
            tmp.delete();
        }
    }

    private static final String MUSIC_SEARCH = "https://music.youtube.com/youtubei/v1/search?prettyPrint=false";
    private static final String VIDEOS = "EgWKAQIQAWoMEA4QChADEAQQCRAF";
    /** Never the song's video, whoever posted it (Prism's MusicVideoMatch). */
    private static final String[] NEVER = {"lyric", "lyrics", "letra", "letras", "paroles", "testo", "traducida", "traducción",
            "sub español", "subtitulad", "перевод", "текст",
            "karaoke", "instrumental", "reaction", "tutorial", "lesson", "guitar", "piano", "drum", "bass", "slowed", "sped up",
            "nightcore", "8d", "fan made", "fanmade", "remix", "highlights", "edit audio", "official audio", "audio oficial",
            "audio only", "rebassed", "bass boosted", "bassboosted", "boosted", "reverb", "daycore", "speed up", "1 hour",
            "10 hours", "loop", "mashup", "parody", "ai cover"};
    /** A frequency in the title ("(25-70Hz)", "432hz") marks a re-tuned or bass-boosted copy. */
    private static final java.util.regex.Pattern HZ = java.util.regex.Pattern.compile("(?<![\\p{L}])\\d+\\s?hz(?![\\p{L}])");
    /** Another take on the song: fine when the song is that take itself. */
    private static final String[] OTHER_TAKE = {"cover", "acoustic", "acústic", "unplugged", "live", "en vivo", "ao vivo", "concert", "session"};
    /** Bracket words that don't name a source. */
    private static final List<String> GENERIC = Arrays.asList("feat", "with", "from", "the", "and", "version", "session", "sessions",
            "live", "remaster", "remastered", "edit", "radio", "mix", "original", "deluxe", "explicit", "clean", "cover", "acoustic",
            "mono", "stereo", "single");
    /** Record labels that post their artists' official videos (normalized channel names). */
    private static final List<String> LABELS = Arrays.asList("fueledbyramen", "atlanticrecords", "warnerrecords", "warnermusic",
            "elektrarecords", "roadrunnerrecords", "interscope", "interscoperecords", "republicrecords", "islandrecords", "defjam",
            "defjamrecordings", "capitolrecords", "columbiarecords", "epicrecords", "rcarecords", "sonymusic", "sonymusicentertainment",
            "universalmusicgroup", "emimusic", "parlophone", "parlophonerecords", "epitaphrecords", "hopelessrecords", "riserecords",
            "sumerianrecords", "nuclearblastrecords", "spinninrecords", "monstercat", "ultramusic", "armadamusic", "xlrecordings",
            "subpop", "dominorecordco", "4ad", "matadorrecords", "bigmachinerecords", "rhinorecords", "motownrecords", "topdawgent",
            "xorecords", "glassnoterecords");
    private static final java.util.regex.Pattern LABEL_WORDS =
            java.util.regex.Pattern.compile("(?<![\\p{L}])(records|recordings|music group|entertainment|label)(?![\\p{L}])");
    /** The artist's upload: the song's length give or take LOOSE_S; someone else's: the very recording, within TIGHT_S. */
    private static final int LOOSE_S = 150, TIGHT_S = 4;

    /**
     * {videoId, title} of the song's music video, or null. Signed out, YouTube no longer pairs songs with their
     * videos in `next`, so it is found as Prism does: a video search, then once more with "official video", and the
     * first result Prism's MusicVideoMatch takes ([pick]). [durationSec] 0: the song's length is unknown.
     */
    /**
     * canvas.md §5 rules 1-12: {videoId, title} of the song's video that passes the gate (ClipGate),
     * or null with why in why[0]. Not a song (a podcast episode, an upload, a live stream) is never
     * looked up.
     */
    static String[] gatedVideo(String songId, String title, String artist, long durationSec, String[] why) throws Exception {
        return gatedVideo(songId, title, artist, durationSec, why, null);
    }

    static String[] gatedVideo(String songId, String title, String artist, long durationSec, String[] why, CanvasChoices.Song ch) throws Exception {
        final java.util.Set<String> rejected = ch == null ? java.util.Collections.emptySet() : ch.rejected;
        String[] artists = artists(artist);
        if (title == null || title.trim().isEmpty() || artists.length == 0) {
            why[0] = ClipGate.NO_VIDEO;
            return null;
        }
        boolean notASong = false;
        try {
            JSONObject d = musicPlayer(songId).optJSONObject("videoDetails");
            String t = d == null ? "" : d.optString("musicVideoType");
            notASong = d != null && ("MUSIC_VIDEO_TYPE_PODCAST_EPISODE".equals(t) || "MUSIC_VIDEO_TYPE_PRIVATELY_OWNED_TRACK".equals(t)
                    || d.optBoolean("isLive"));
        } catch (Throwable t) {
            Log.w(TAG, "canvas video: the song's type not read: " + t);
        }
        if (notASong) notSongs.add(songId);
        final java.util.Map<String, String> titles = new java.util.HashMap<>();
        final List<List<String[]>> searches = new ArrayList<>();
        String[] qs = {title + " " + artists[0], title + " " + artists[0] + " official video"};
        java.util.function.IntFunction<List<String[]>> search = i -> {
            while (searches.size() <= i) {
                List<String[]> found = new ArrayList<>();
                try {
                    JSONObject body = new JSONObject().put("query", qs[searches.size()]).put("params", VIDEOS).put("context", new JSONObject().put("client",
                            new JSONObject().put("clientName", "WEB_REMIX").put("clientVersion", "1.20251101.01.00").put("hl", "en").put("gl", "US")));
                    results(post(MUSIC_SEARCH, body, "Mozilla/5.0", "https://music.youtube.com"), found);
                } catch (Throwable t) {
                    Log.w(TAG, "canvas video: search failed: " + t);
                }
                for (String[] v : found) titles.put(v[0], v[1]);
                // §15 rule 8: the turned-away videos are left out of what the search found
                found.removeIf(v -> rejected.contains(v[0]));
                searches.add(found);
            }
            return searches.get(i);
        };
        boolean own = false;
        String[] first = null;
        // §15 rule 6: the listener's video, asked first and as it is (the song's own), before any search
        final String picked = ch != null && ch.video != null && !rejected.contains(ch.video) ? ch.video : null;
        final java.util.Map<String, ClipGate.Video> seen = new java.util.HashMap<>();
        ClipGate.Look look = new ClipGate.Look() {
            @Override
            public ClipGate.Video video(String id) {
                if (seen.containsKey(id)) return seen.get(id);
                ClipGate.Video v = null;
                try {
                    JSONObject d = musicPlayer(id).optJSONObject("videoDetails");
                    final JSONObject vp = visionPlayer(id);
                    v = new ClipGate.Video();
                    v.type = d == null ? "" : d.optString("musicVideoType");
                    v.title = d != null && !d.optString("title").isEmpty() ? d.optString("title") : titles.get(id);
                    JSONObject ps = vp.optJSONObject("playabilityStatus");
                    v.status = ps == null ? "" : ps.optString("status");
                    v.still = () -> {
                        try {
                            JSONObject vd = vp.optJSONObject("videoDetails");
                            long len = Math.round((vd == null ? 0 : vd.optDouble("lengthSeconds", 0)) * 1000);
                            Board b = board(vp, len);
                            return b != null && b.frames.size() >= MIN_FRAMES && ClipJudge.still(b.frames, ClipJudge.bars(b.frames));
                        } catch (Throwable t) {
                            return false;
                        }
                    };
                } catch (Throwable t) {
                    Log.w(TAG, "canvas video: " + id + " not read: " + t);
                }
                seen.put(id, v);
                return v;
            }

            @Override
            public List<String> others() {
                List<String> out = new ArrayList<>();
                List<String[]> left = new ArrayList<>(search.apply(1));
                for (String[] v; (v = pick(title, artists, durationSec, left, false)) != null; ) {
                    out.add(v[0]);
                    left.remove(v);
                }
                return out;
            }
        };
        if (picked != null && !notASong) {
            ClipGate.Result p = ClipGate.find(title, false, null, look, picked, ch.only, false);
            Log.i(TAG, "canvas video: the listener's video " + picked + ": " + p);
            if (p.videoId != null || ch.only) {
                why[0] = p.why;
                return p.videoId == null ? null : new String[]{p.videoId, ""};
            }
        }
        if (!notASong) {
            // rule 1: the first search, then "official video"
            first = pick(title, artists, durationSec, search.apply(0), false);
            if (first == null) first = pick(title, artists, durationSec, search.apply(1), false);
            // rule 12: nothing passes: the artist's lyric video, as the song's own
            if (first == null) {
                first = pick(title, artists, durationSec, search.apply(0), true);
                if (first == null) first = pick(title, artists, durationSec, search.apply(1), true);
                own = first != null;
                if (own) Log.i(TAG, "canvas video: only a lyric video: '" + first[1] + "', taken as it is");
            }
        }
        ClipGate.Result r = ClipGate.find(title, notASong, first == null ? null : first[0], look, null, false, own);
        Log.i(TAG, "canvas video: the gate: " + r + (first != null ? " (found first: " + first[0] + " '" + first[1] + "')" : ""));
        why[0] = r.why;
        if (r.videoId == null) return null;
        String t = titles.get(r.videoId);
        return new String[]{r.videoId, t == null ? "" : t};
    }

    /** YouTube Music's own player answer (WEB_REMIX): the video's type (musicVideoType) and title. */
    private static JSONObject musicPlayer(String videoId) throws Exception {
        JSONObject body = new JSONObject().put("videoId", videoId).put("context", new JSONObject().put("client",
                new JSONObject().put("clientName", "WEB_REMIX").put("clientVersion", "1.20251101.01.00").put("hl", "en").put("gl", "US")));
        return post(MUSIC_PLAYER, body, "Mozilla/5.0", "https://music.youtube.com");
    }

    private static final String MUSIC_PLAYER = "https://music.youtube.com/youtubei/v1/player?prettyPrint=false";

    /** §15 rule 5: what a video search for `title artist` finds, in its order: {videoId, title, channel, length}. */
    static List<String[]> searchVideos(String title, String artist) throws Exception {
        String[] artists = artists(artist);
        List<String[]> found = new ArrayList<>();
        if (title == null || title.trim().isEmpty()) return found;
        JSONObject body = new JSONObject().put("query", title + (artists.length > 0 ? " " + artists[0] : "")).put("params", VIDEOS).put("context", new JSONObject().put("client",
                new JSONObject().put("clientName", "WEB_REMIX").put("clientVersion", "1.20251101.01.00").put("hl", "en").put("gl", "US")));
        results(post(MUSIC_SEARCH, body, "Mozilla/5.0", "https://music.youtube.com"), found);
        return found;
    }

    static String[] findVideo(String title, String artist, long durationSec) throws Exception {
        String[] artists = artists(artist);
        if (title == null || title.trim().isEmpty() || artists.length == 0) return null;
        for (String q : new String[]{title + " " + artists[0], title + " " + artists[0] + " official video"}) {
            JSONObject body = new JSONObject().put("query", q).put("params", VIDEOS).put("context", new JSONObject().put("client",
                    new JSONObject().put("clientName", "WEB_REMIX").put("clientVersion", "1.20251101.01.00").put("hl", "en").put("gl", "US")));
            List<String[]> found = new ArrayList<>();
            results(post(MUSIC_SEARCH, body, "Mozilla/5.0", "https://music.youtube.com"), found);
            String[] v = pick(title, artists, durationSec, found);
            if (v != null) return new String[]{v[0], v[1]};
            StringBuilder seen = new StringBuilder();
            for (int i = 0; i < Math.min(5, found.size()); i++) seen.append("; '").append(found.get(i)[1]).append("' by ").append(found.get(i)[2]);
            Log.i(TAG, "canvas video: none for '" + q + "' among" + seen);
        }
        return null;
    }

    /** {videoId, title, channel, length s or "0"} of each search result (the length from the fixed column, else the subtitle). */
    private static void results(Object node, List<String[]> out) {
        if (node instanceof JSONObject) {
            JSONObject o = (JSONObject) node;
            JSONObject r = o.optJSONObject("musicResponsiveListItemRenderer");
            if (r != null) {
                JSONObject pid = r.optJSONObject("playlistItemData");
                JSONArray fc = r.optJSONArray("flexColumns");
                String id = pid == null ? "" : pid.optString("videoId");
                if (!id.isEmpty() && fc != null && fc.length() > 1) {
                    String t = runs(column(fc, 0));
                    JSONObject second = column(fc, 1);
                    JSONArray rr = second == null ? null : second.optJSONArray("runs");
                    String ch = rr == null || rr.length() == 0 ? "" : rr.optJSONObject(0).optString("text");
                    JSONArray fixed = r.optJSONArray("fixedColumns");
                    JSONObject fr = fixed == null || fixed.optJSONObject(0) == null ? null
                            : fixed.optJSONObject(0).optJSONObject("musicResponsiveListItemFixedColumnRenderer");
                    long len = lengthOf(fr == null ? null : runs(fr.optJSONObject("text")));
                    for (int i = 1; len == 0 && i < fc.length(); i++) {
                        JSONObject col = column(fc, i);
                        JSONArray cr = col == null ? null : col.optJSONArray("runs");
                        for (int k = 0; cr != null && k < cr.length(); k++) {
                            long l = lengthOf(cr.optJSONObject(k) == null ? null : cr.optJSONObject(k).optString("text"));
                            if (l > 0) len = l;
                        }
                    }
                    out.add(new String[]{id, t, ch, String.valueOf(len)});
                }
                return;
            }
            for (java.util.Iterator<String> it = o.keys(); it.hasNext(); ) results(o.opt(it.next()), out);
        } else if (node instanceof JSONArray) {
            JSONArray a = (JSONArray) node;
            for (int i = 0; i < a.length(); i++) results(a.opt(i), out);
        }
    }

    private static JSONObject column(JSONArray fc, int i) {
        JSONObject c = fc.optJSONObject(i);
        JSONObject r = c == null ? null : c.optJSONObject("musicResponsiveListItemFlexColumnRenderer");
        return r == null ? null : r.optJSONObject("text");
    }

    /** The artists named in YT's artist line ("A & B", "A, B", "A x B", "A feat. B"). */
    static String[] artists(String artist) {
        List<String> out = new ArrayList<>();
        if (artist != null)
            // canvas.md §5 rule 13: never on "and" ("The Head and the Heart" is one artist)
            for (String a : artist.split("(?i)\\s*(,|&|\\s×\\s|\\sx\\s|\\bfeaturing\\b|\\bfeat\\b\\.?|\\bft\\b\\.?|\\bwith\\b)\\s*"))
                if (!norm(a).isEmpty()) out.add(a.trim());
        return out.toArray(new String[0]);
    }

    /** "3:45" or "1:02:03" in seconds; 0 when it is not a length. */
    static long lengthOf(String text) {
        String t = text == null ? "" : text.trim();
        if (!t.matches("\\d{1,2}(:\\d{2}){1,2}")) return 0;
        long s = 0;
        for (String p : t.split(":")) s = s * 60 + Long.parseLong(p);
        return s;
    }

    /**
     * Prism's MusicVideoMatch.pick over search results {id, title, channel, length s} in order: the first
     * one whose title is the song's and is never a lyric video, a lesson, a re-tuned copy and the like
     * (nor from a channel that only posts those, unless it is the artist's), posted by the artist (their
     * channel, its VEVO or "Official" one) or their record label, within LOOSE_S of the song and not
     * another take; else, for a song naming a source in brackets ("SiriusXM Session"), that recording by
     * whoever posted it, within TIGHT_S, naming the artist. A studio song takes nobody else's upload.
     * Lengths of 0 are unknown.
     */
    static String[] pick(String songTitle, String[] artistNames, long durationSec, List<String[]> videos) {
        return pick(songTitle, artistNames, durationSec, videos, false);
    }

    /** [lyricsOk]: lyric videos are allowed (canvas.md §5 rule 12). */
    static String[] pick(String songTitle, String[] artistNames, long durationSec, List<String[]> videos, boolean lyricsOk) {
        List<String> artists = new ArrayList<>();
        for (String a : artistNames) if (!norm(a).isEmpty()) artists.add(norm(a));
        if (norm(songTitle).isEmpty() || artists.isEmpty()) return null;
        String song = songTitle.toLowerCase(Locale.ROOT);
        // the source the song names in its brackets ("SiriusXM Session" -> "siriusxm"), without the generic words
        List<String> source = new ArrayList<>();
        java.util.regex.Matcher br = java.util.regex.Pattern.compile("\\((.*?)\\)|\\[(.*?)]").matcher(song);
        while (br.find())
            for (String w : br.group().split("[^\\p{L}\\p{N}]+"))
                if (w.length() > 2 && !GENERIC.contains(w) && !source.contains(w)) source.add(w);
        List<String[]> candidates = new ArrayList<>();
        for (String[] v : videos) {
            if (sameTitle(songTitle, artistNames, v[1], v[2]) && !never(v[1].toLowerCase(Locale.ROOT), song, lyricsOk)
                    && (ownChannel(v[2], artists) || !never(v[2].toLowerCase(Locale.ROOT), song, lyricsOk))) candidates.add(v);
        }
        // the artist's own upload first: their channel (VEVO and "Official" ones too), or their record label's
        for (String[] v : candidates)
            if ((ownChannel(v[2], artists) || byLabel(v[1], v[2], artists)) && within(durationSec, v, LOOSE_S)
                    && !has(OTHER_TAKE, v[1].toLowerCase(Locale.ROOT), song)) return v;
        if (source.isEmpty()) return null;
        // a song from a named session or show: that very recording, posted by whoever made it
        for (String[] v : candidates) {
            String words = v[1].toLowerCase(Locale.ROOT), where = words + " " + v[2].toLowerCase(Locale.ROOT);
            boolean namesArtist = false, fromSource = false;
            for (String a : artists) namesArtist |= norm(words).contains(a);
            for (String w : source) fromSource |= where.contains(w);
            if (within(durationSec, v, TIGHT_S) && durationSec > 0 && length(v) > 0 && namesArtist && fromSource) return v;
        }
        return null;
    }

    private static long length(String[] v) {
        try {
            return v.length > 3 ? Long.parseLong(v[3]) : 0;
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private static boolean within(long durationSec, String[] v, int s) {
        return durationSec == 0 || length(v) == 0 || Math.abs(length(v) - durationSec) <= s;
    }

    /** The channel is the artist's own: its name, or its VEVO / "Official" form. */
    private static boolean ownChannel(String channel, List<String> artists) {
        String ch = officialChannel(norm(channel));
        return !ch.isEmpty() && artists.contains(ch);
    }

    /** Posted by the artist's record label, naming the artist: a label we know, or a "... Records" channel saying official. */
    private static boolean byLabel(String videoTitle, String channel, List<String> artists) {
        boolean named = false;
        for (String a : artists) named |= norm(videoTitle).contains(a);
        if (!named) return false;
        return LABELS.contains(norm(channel)) || LABEL_WORDS.matcher(channel.toLowerCase(Locale.ROOT)).find()
                && java.util.regex.Pattern.compile("(?<![\\p{L}])official(?![\\p{L}])").matcher(videoTitle.toLowerCase(Locale.ROOT)).find();
    }

    /** A lyric video, a lesson, a re-tuned copy and the like (unless the song's own title says so). */
    private static boolean never(String text, String song) {
        return never(text, song, false);
    }

    private static boolean never(String text, String song, boolean lyricsOk) {
        return has(lyricsOk ? NEVER_BUT_LYRICS : NEVER, text, song) || HZ.matcher(text).find() && !HZ.matcher(song).find();
    }

    /** NEVER without the lyric words (rule 12). */
    private static final String[] NEVER_BUT_LYRICS;

    static {
        List<String> l = new ArrayList<>(Arrays.asList(NEVER));
        l.removeAll(Arrays.asList("lyric", "lyrics", "letra", "letras", "paroles", "testo"));
        NEVER_BUT_LYRICS = l.toArray(new String[0]);
    }

    /** The video's title is the song's: the song's artists' and the channel's names (and their "official" forms) taken out. */
    private static boolean sameTitle(String songTitle, String[] artistNames, String videoTitle, String channel) {
        String want = core(songTitle, new ArrayList<>());
        if (want.isEmpty()) return false;
        List<String> names = new ArrayList<>();
        List<String> all = new ArrayList<>(Arrays.asList(artistNames));
        all.add(channel);
        for (String a : all) {
            String n = norm(a);
            if (n.length() < 2) continue;
            for (String x : new String[]{n, officialChannel(n)}) if (!names.contains(x)) names.add(x);
        }
        names.sort((x, y) -> y.length() - x.length());
        return want.equals(core(videoTitle, names));
    }

    private static boolean has(String[] words, String text, String song) {
        for (String w : words) {
            java.util.regex.Pattern p = java.util.regex.Pattern.compile("(?<![\\p{L}\\p{N}])" + java.util.regex.Pattern.quote(w) + "(?![\\p{L}\\p{N}])");
            if (p.matcher(text).find() && !p.matcher(song).find()) return true;
        }
        return false;
    }

    /** The title without brackets, "| ..." and "// ..." tails, feat. credits, video words and the artists' names. */
    private static String core(String title, List<String> names) {
        String t = title.toLowerCase(Locale.ROOT).replaceAll("\\(.*?\\)|\\[.*?]|\u3010.*?\u3011", " ");
        int bar = t.indexOf(" | ");
        if (bar >= 0) t = t.substring(0, bar);
        int slashes = t.indexOf(" // ");
        if (slashes >= 0) t = t.substring(0, slashes);
        t = t.replaceAll("\\s(ft\\.?|feat\\.?|featuring)\\s.*$", " ")
                .replaceAll("(?<![\\p{L}])(official|music|video|videoclip|clip|hd|4k|hq|remastered|remaster|visualizer|mv|m/v)(?![\\p{L}])", " ");
        t = norm(t);
        for (String n : names) if (!t.equals(n) && !n.isEmpty()) t = t.replace(n, "");
        return t;
    }

    static String norm(String s) {
        return s.toLowerCase(Locale.ROOT).replaceAll("\\(.*?\\)|\\[.*?]", "").replaceAll("[^\\p{L}\\p{N}]", "");
    }

    /** "NirvanaVEVO", "Official Billie Eilish" -> the artist's own name, normalized. */
    static String officialChannel(String n) {
        String name = n;
        for (String s : new String[]{"vevo", "official", "oficial", "officiel", "offiziell", "ufficiale", "music", "tv", "channel"})
            if (n.endsWith(s)) n = n.substring(0, n.length() - s.length());
        if (n.startsWith("official")) n = n.substring(8);
        return n.isEmpty() ? name : n;
    }

    private static String runs(JSONObject text) {
        if (text == null) return "";
        JSONArray r = text.optJSONArray("runs");
        if (r == null) return text.optString("simpleText", "");
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < r.length(); i++) b.append(r.optJSONObject(i).optString("text"));
        return b.toString();
    }

    /** The video-only H.264 DASH stream nearest below [want] px tall, at most 30 fps. */
    static JSONObject pickFormat(JSONObject streaming, int want) {
        JSONArray a = streaming == null ? null : streaming.optJSONArray("adaptiveFormats");
        if (a == null) return null;
        JSONObject best = null;
        for (int i = 0; i < a.length(); i++) {
            JSONObject f = a.optJSONObject(i);
            if (f == null || !f.optString("mimeType").startsWith("video/mp4; codecs=\"avc1") || f.optString("url").isEmpty()
                    || f.optJSONObject("initRange") == null || f.optJSONObject("indexRange") == null || f.optInt("fps", 30) > 30) continue;
            int h = f.optInt("height");
            if (best == null) best = f;
            else {
                int bh = best.optInt("height");
                boolean better = h <= want ? (bh > want || h > bh) : (bh > want && h < bh);
                if (better) best = f;
            }
        }
        return best;
    }

    /** YouTube's "Most replayed" curve (100 points over the video, 0..1), or null when it has none. */
    private static final java.util.Map<String, double[]> heats = java.util.Collections.synchronizedMap(new java.util.LinkedHashMap<String, double[]>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(java.util.Map.Entry<String, double[]> e) {
            return size() > 20;
        }
    });

    static double[] heatmap(String videoId) {
        if (heats.containsKey(videoId)) return heats.get(videoId);
        try {
            double[] h = fetchHeatmap(videoId);
            heats.put(videoId, h); // an answer without a curve is remembered; a failed fetch is not
            return h;
        } catch (Throwable t) {
            Log.w(TAG, "canvas video: no most-replayed curve: " + t);
            return null;
        }
    }

    /** Whether YouTube answered for [videoId] (with or without a curve): a failed fetch is not an answer. */
    static boolean answered(String videoId) {
        return heats.containsKey(videoId);
    }

    private static double[] fetchHeatmap(String videoId) throws Exception {
        JSONObject body = new JSONObject().put("videoId", videoId).put("context", new JSONObject().put("client",
                new JSONObject().put("clientName", "WEB").put("clientVersion", "2.20251101.01.00").put("hl", "en").put("gl", "US")));
        return heatmapOf(post(WEB_NEXT, body, "Mozilla/5.0", "https://www.youtube.com"));
    }

    static double[] heatmapOf(JSONObject next) {
        JSONObject fw = next.optJSONObject("frameworkUpdates");
        JSONObject eb = fw == null ? null : fw.optJSONObject("entityBatchUpdate");
        JSONArray muts = eb == null ? null : eb.optJSONArray("mutations");
        if (muts == null) return null;
        for (int i = 0; i < muts.length(); i++) {
            JSONObject p = muts.optJSONObject(i).optJSONObject("payload");
            JSONObject m = p == null ? null : p.optJSONObject("macroMarkersListEntity");
            JSONObject list = m == null ? null : m.optJSONObject("markersList");
            if (list == null || !"MARKER_TYPE_HEATMAP".equals(list.optString("markerType"))) continue;
            JSONArray mk = list.optJSONArray("markers");
            if (mk == null || mk.length() < 10) continue;
            // {start s, duration s, intensity} per marker, flattened
            double[] out = new double[mk.length() * 3];
            for (int k = 0; k < mk.length(); k++) {
                JSONObject o = mk.optJSONObject(k);
                out[k * 3] = o.optDouble("startMillis", 0) / 1000;
                out[k * 3 + 1] = o.optDouble("durationMillis", 0) / 1000;
                out[k * 3 + 2] = o.optDouble("intensityScoreNormalized", 0);
            }
            return out;
        }
        return null;
    }

    /** Prism's BestPart: no part in the first 5 s (or 2 segments) or the last 30 s, none in a song under 60 s. */
    private static final long PART_HEAD_MS = 5_000, PART_TAIL_MS = 30_000, MIN_SONG_MS = 60_000;
    private static final double MIN_RISE = 0.08, MIN_LIFT = 0.03, TREND_HALF_MS = 45_000, TREND_FLOOR = 0.05;

    /**
     * Where the most replayed stretch begins (s), or -1 when nothing stands out or the song is too short:
     * Prism's BestPart.peakMs on the markers ({start s, length s, intensity} each, flattened), whose
     * segment is the median marker length. [dur] the song's length in s (0: the curve's own).
     */
    static double partStart(double[] heat, double dur) {
        if (heat == null || heat.length / 3 < 10) return -1;
        int n = heat.length / 3;
        Integer[] order = new Integer[n];
        for (int i = 0; i < n; i++) order[i] = i;
        Arrays.sort(order, (x, y) -> Double.compare(heat[x * 3], heat[y * 3]));
        double[] lengths = new double[n], v = new double[n];
        for (int i = 0; i < n; i++) {
            lengths[i] = heat[order[i] * 3 + 1];
            v[i] = Math.max(0, Math.min(1, heat[order[i] * 3 + 2]));
        }
        Arrays.sort(lengths);
        long seg = Math.round(lengths[n / 2] * 1000);
        if (seg <= 0) return -1;
        long at = peakMs(v, seg, Math.round(dur * 1000));
        return at < 0 ? -1 : at / 1000.0;
    }

    /**
     * Prism's BestPart.peakMs: each moment of a ~9 s smoothed curve against the median of the curve about
     * 45 s either side (the opening segment left out); the biggest rise as a share over that trend (at
     * least 0.05) wins, ties to the earlier, between max(5 s, 2 segments) and 30 s before the end. None
     * under a rise of 0.08 or a lift of 0.03. Pulled back over the segments rising at least half as much,
     * then forward to the first raw segment that does. -1 when none.
     */
    static long peakMs(double[] intensity, long seg, long durationMs) {
        int n = intensity.length;
        long duration = durationMs > 0 ? durationMs : seg * n;
        if (duration < MIN_SONG_MS || n < 10 || seg <= 0) return -1;
        int half = Math.max(1, (int) Math.round(4_500.0 / seg));
        double[] smooth = new double[n], trend = new double[n];
        for (int i = 0; i < n; i++) {
            double sum = 0;
            int c = 0;
            for (int j = Math.max(0, i - half); j <= Math.min(n - 1, i + half); j++, c++) sum += intensity[j];
            smooth[i] = sum / c;
        }
        int wide = Math.max(3, (int) Math.round(TREND_HALF_MS / seg));
        for (int i = 0; i < n; i++) {
            double[] w = Arrays.copyOfRange(smooth, Math.max(1, i - wide), Math.min(n - 1, i + wide) + 1);
            Arrays.sort(w);
            trend[i] = w[w.length / 2];
        }
        long head = Math.max(PART_HEAD_MS, 2 * seg);
        int peak = -1;
        for (int i = 0; i < n; i++)
            if (candidate(i, seg, head, duration) && (peak < 0 || rise(smooth[i], trend[i]) > rise(smooth[peak], trend[peak]))) peak = i;
        if (peak < 0) return -1;
        double top = rise(smooth[peak], trend[peak]);
        if (top < MIN_RISE || smooth[peak] - trend[peak] < MIN_LIFT) return -1;
        // back to where the heat starts to rise: half the peak's rise above the trend
        double floor = top * 0.5;
        int start = peak;
        while (candidate(start - 1, seg, head, duration) && rise(smooth[start - 1], trend[start - 1]) >= floor) start--;
        // the rise is gradual in the smoothed curve; the raw segments say where it actually jumps
        int jump = start;
        for (int i = start; i <= peak; i++)
            if (rise(intensity[i], trend[i]) >= floor) {
                jump = i;
                break;
            }
        return jump * seg;
    }

    private static boolean candidate(int i, long seg, long head, long duration) {
        return i >= 0 && i * seg >= head && i * seg <= duration - PART_TAIL_MS;
    }

    private static double rise(double v, double trend) {
        return v / Math.max(trend, TREND_FLOOR) - 1;
    }

    /**
     * Fetches the fragments holding [start, end] (video seconds) and writes them as one MP4 starting
     * at 0; returns the video time (s) of its first frame, the key frame at or before [start].
     */
    private static double cut(JSONObject f, double start, double end, File dir, File out) throws Exception {
        double len = end - start;
        String url = f.getString("url");
        JSONObject ir = f.getJSONObject("initRange"), xr = f.getJSONObject("indexRange");
        long initEnd = Long.parseLong(xr.getString("end"));
        byte[] head = get(url, 0, initEnd);
        long indexStart = Long.parseLong(xr.getString("start"));
        Sidx sidx = Sidx.parse(head, (int) indexStart);
        if (sidx == null) throw new Exception("no sidx");
        long[] range = sidx.range(start, len, initEnd + 1);
        long initLen = Long.parseLong(ir.getString("end")) + 1;
        if (initLen <= 0 || initLen > head.length) throw new Exception("bad initRange");
        if (range[0] < 0 || range[1] < range[0] || range[1] - range[0] + 1 > MAX_CUT_BYTES) throw new Exception("part too big: " + (range[1] - range[0] + 1) + " bytes");
        File raw = new File(dir, out.getName() + ".part");
        try {
            // the fragments go straight to the file (a Full video is the whole stream: never held in memory)
            try (FileOutputStream o = new FileOutputStream(raw)) {
                o.write(head, 0, (int) initLen);
                get(url, range[0], range[1], o, MAX_CUT_BYTES);
            }
        } catch (Exception e) {
            //noinspection ResultOfMethodCallIgnored
            raw.delete();
            throw e;
        }
        try {
            double base = range[2] / 1e6;
            return base + remux(raw, out, start - base, end - base) / 1e6;
        } catch (Exception e) {
            // a half-written loop is no loop
            //noinspection ResultOfMethodCallIgnored
            out.delete();
            throw e;
        } finally {
            //noinspection ResultOfMethodCallIgnored
            raw.delete();
        }
    }

    /** One segment index box: where each fragment's bytes and time are. */
    static final class Sidx {
        long timescale, earliest;
        long[] sizes, durations;

        static Sidx parse(byte[] b, int at) {
            ByteBuffer bb = ByteBuffer.wrap(b);
            if (at < 0 || at + 12 > b.length || bb.getInt(at + 4) != 0x73696478) return null; // 'sidx'
            int p = at + 8;
            int version = b[p] & 0xFF;
            // a truncated box is no index: the header, then every entry, must fit
            if (p + 8 + 4 + (version == 0 ? 8 : 16) + 4 > b.length) return null;
            p += 4 + 4; // version/flags, reference id
            Sidx s = new Sidx();
            s.timescale = bb.getInt(p) & 0xFFFFFFFFL;
            if (s.timescale == 0) return null;
            p += 4;
            long firstOffset;
            if (version == 0) {
                s.earliest = bb.getInt(p) & 0xFFFFFFFFL;
                firstOffset = bb.getInt(p + 4) & 0xFFFFFFFFL;
                p += 8;
            } else {
                s.earliest = bb.getLong(p);
                firstOffset = bb.getLong(p + 8);
                p += 16;
            }
            if (firstOffset != 0) return null;
            p += 2;
            int count = bb.getShort(p) & 0xFFFF;
            p += 2;
            if (count == 0 || p + (long) count * 12 > b.length) return null;
            s.sizes = new long[count];
            s.durations = new long[count];
            for (int i = 0; i < count; i++) {
                s.sizes[i] = bb.getInt(p) & 0x7FFFFFFFL;
                s.durations[i] = bb.getInt(p + 4) & 0xFFFFFFFFL;
                p += 12;
            }
            return s;
        }

        /**
         * Byte range {from, to} (inclusive) of the fragments covering [start, start + len], fragments
         * from [base], and the first one's video time in microseconds.
         */
        long[] range(double start, double len, long base) {
            long off = base, t = earliest;
            long from = -1, to = -1, fromTime = earliest;
            for (int i = 0; i < sizes.length; i++) {
                double a = t / (double) timescale, z = (t + durations[i]) / (double) timescale;
                if (z > start && a < start + len) {
                    if (from < 0) {
                        from = off;
                        fromTime = t;
                    }
                    to = off + sizes[i] - 1;
                }
                off += sizes[i];
                t += durations[i];
            }
            if (from < 0) {
                from = base;
                to = base + sizes[0] - 1;
            }
            return new long[]{from, to, Math.round(fromTime * 1e6 / timescale)};
        }
    }

    /**
     * A plain MP4 of the video track from the key frame at or before [start] to [end] (seconds in
     * [in]), times from 0; returns the first frame's time in [in] (microseconds).
     */
    private static long remux(File in, File out, double start, double end) throws Exception {
        MediaExtractor ex = new MediaExtractor();
        MediaMuxer mux = null;
        try {
            ex.setDataSource(in.getAbsolutePath());
            int track = -1;
            for (int i = 0; i < ex.getTrackCount(); i++) {
                if (ex.getTrackFormat(i).getString(MediaFormat.KEY_MIME).startsWith("video/")) {
                    track = i;
                    break;
                }
            }
            if (track < 0) throw new Exception("no video track");
            ex.selectTrack(track);
            MediaFormat fmt = ex.getTrackFormat(track);
            mux = new MediaMuxer(out.getAbsolutePath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            int t = mux.addTrack(fmt);
            mux.start();
            ByteBuffer buf = ByteBuffer.allocate(fmt.containsKey(MediaFormat.KEY_MAX_INPUT_SIZE) ? Math.max(1 << 20, fmt.getInteger(MediaFormat.KEY_MAX_INPUT_SIZE)) : 4 << 20);
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            // start at the last key frame at or before the part (the fragments begin on one)
            long first = -1;
            ex.seekTo((long) (start * 1e6), MediaExtractor.SEEK_TO_PREVIOUS_SYNC);
            int written = 0;
            while (true) {
                int size = ex.readSampleData(buf, 0);
                if (size < 0) break;
                long ts = ex.getSampleTime();
                boolean key = (ex.getSampleFlags() & MediaExtractor.SAMPLE_FLAG_SYNC) != 0;
                if (first < 0) {
                    if (!key) {
                        ex.advance();
                        continue;
                    }
                    first = ts;
                }
                if (ts >= end * 1e6) break;
                info.set(0, size, ts - first, key ? MediaCodec.BUFFER_FLAG_KEY_FRAME : 0);
                mux.writeSampleData(t, buf, info);
                written++;
                ex.advance();
            }
            if (written == 0) throw new Exception("no frames in the part");
            return first;
        } finally {
            ex.release();
            if (mux != null) {
                try {
                    mux.stop();
                } catch (Exception ignored) {
                }
                mux.release();
            }
        }
    }

    private static byte[] get(String url, long from, long to) throws Exception {
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        get(url, from, to, buf, READ_CAP);
        return buf.toByteArray();
    }

    /** Bytes [from, to] of the stream into [o], at most [max] of them. */
    private static void get(String url, long from, long to, OutputStream o, long max) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url + "&range=" + from + "-" + to).openConnection();
        try {
            c.setConnectTimeout(10_000);
            c.setReadTimeout(20_000);
            c.setRequestProperty("User-Agent", userAgent());
            int code = c.getResponseCode();
            if (code >= 400) throw new Exception("HTTP " + code + " for bytes " + from + "-" + to);
            try (InputStream in = c.getInputStream()) {
                HlsClip.capped(in, o, max);
            }
        } finally {
            c.disconnect();
        }
    }

    private static String userAgent() {
        return "com.google.visionos.youtube/" + VISION_VERSION + "(RealityDevice14,1; U; CPU visionOS 25_6_0 like Mac OS X; US)";
    }

    /** The video's player answer as YouTube's visionOS app (stream URLs need no signature solving), as Prism asks it. */
    private static JSONObject visionPlayer(String videoId) throws Exception {
        JSONObject body = new JSONObject().put("videoId", videoId).put("contentCheckOk", true).put("racyCheckOk", true);
        JSONObject r = visionPost("player", body, visitor());
        JSONObject ps = r.optJSONObject("playabilityStatus");
        if (ps != null && "LOGIN_REQUIRED".equals(ps.optString("status")) && ps.optString("reason").toLowerCase(Locale.ROOT).contains("bot")) {
            visitor = null;
            r = visionPost("player", body, visitor());
        }
        return r;
    }

    private static String visitor() throws Exception {
        if (visitor == null) {
            JSONObject r = visionPost("visitor_id", new JSONObject(), null);
            JSONObject rc = r.optJSONObject("responseContext");
            visitor = rc == null ? null : rc.optString("visitorData", null);
            if (visitor == null) throw new Exception("no visitor id");
        }
        return visitor;
    }

    private static JSONObject visionPost(String endpoint, JSONObject body, String visitor) throws Exception {
        JSONObject client = new JSONObject().put("clientName", "VISIONOS").put("clientVersion", VISION_VERSION)
                .put("clientScreen", "WATCH").put("platform", "MOBILE").put("deviceMake", "Apple").put("deviceModel", "RealityDevice14,1")
                .put("osName", "visionOS").put("osVersion", "25.6.0.23O471").put("hl", "en").put("gl", "US").put("utcOffsetMinutes", 0);
        if (visitor != null) client.put("visitorData", visitor);
        body.put("context", new JSONObject().put("client", client));
        HttpURLConnection c = open(VISION + endpoint + "?prettyPrint=false", userAgent());
        c.setRequestProperty("X-Goog-Api-Format-Version", "2");
        c.setRequestProperty("X-YouTube-Client-Name", "101");
        c.setRequestProperty("X-YouTube-Client-Version", VISION_VERSION);
        if (visitor != null) c.setRequestProperty("X-Goog-Visitor-Id", visitor);
        return send(c, body);
    }

    private static JSONObject post(String url, JSONObject body, String ua, String origin) throws Exception {
        HttpURLConnection c = open(url, ua);
        c.setRequestProperty("Origin", origin);
        return send(c, body);
    }

    private static HttpURLConnection open(String url, String ua) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(10_000);
        c.setReadTimeout(15_000);
        c.setRequestMethod("POST");
        c.setDoOutput(true);
        c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
        c.setRequestProperty("User-Agent", ua);
        return c;
    }

    private static JSONObject send(HttpURLConnection c, JSONObject body) throws Exception {
        try {
            try (OutputStream out = c.getOutputStream()) {
                out.write(body.toString().getBytes(StandardCharsets.UTF_8));
            }
            int code = c.getResponseCode();
            // the error body is not read (it may be null): the code is the answer
            if (code >= 400) throw new Exception("HTTP " + code);
            byte[] b = read(c.getInputStream());
            return new JSONObject(new String(b, StandardCharsets.UTF_8));
        } finally {
            c.disconnect();
        }
    }

    /** All of [in] (a player answer, an index, a storyboard sheet), at most READ_CAP bytes. */
    private static byte[] read(InputStream in) throws Exception {
        try (InputStream i = in) {
            ByteArrayOutputStream buf = new ByteArrayOutputStream();
            HlsClip.capped(i, buf, READ_CAP);
            return buf.toByteArray();
        }
    }
}
