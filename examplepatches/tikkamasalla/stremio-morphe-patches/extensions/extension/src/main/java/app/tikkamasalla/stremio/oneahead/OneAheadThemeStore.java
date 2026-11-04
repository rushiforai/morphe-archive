package app.tikkamasalla.stremio.oneahead;

import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;

import app.tikkamasalla.stremio.oneahead.demux.AudioDecoder;
import app.tikkamasalla.stremio.oneahead.demux.ByteBudget;
import app.tikkamasalla.stremio.oneahead.demux.DemuxException;
import app.tikkamasalla.stremio.oneahead.demux.MonoDownsampler;
import app.tikkamasalla.stremio.oneahead.demux.PcmSink;
import app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard;
import app.tikkamasalla.stremio.oneahead.demux.RangeSource;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/**
 * Device cache and polite fetcher for official opening/ending songs. One show is
 * ever fetched per job; files already cached are never refetched. Old entries fall
 * out first when the cache passes its cap. Every network call keeps a 1.2 s gap
 * to the previous one (at most 50 requests a minute, well under the 90 limit),
 * and song bytes travel over the job's paced, budgeted reader like episode bytes.
 *
 * Show lookup is by exact id only, never a fuzzy title: the app's Kitsu id maps
 * to MAL through Kitsu's own mappings, MAL to AniList through an exact
 * Media(idMal) query, and AniList to the AnimeThemes slug through
 * findAnimeByExternalSite. An uncertain mapping resolves to nothing and the
 * caller does nothing. A wrong song must never be matched.
 */
public final class OneAheadThemeStore {
    static final String GRAPHQL_ANIME_THEMES = "https://graphql.animethemes.moe/";
    static final String GRAPHQL_ANILIST = "https://graphql.anilist.co";
    static final String KITSU_MAPPINGS = "https://kitsu.app/api/edge/anime/";
    static final String UA = "Stremio-OneAhead-ThemeMatch/1.0 (anime intro/credits backup; one show per run; polite)";
    /** Between two API requests, so the job stays far under 90 requests a minute. */
    static final long API_DELAY_MS = 1200;
    /** One show's songs are a few MB each; ten cached shows stay under this. */
    public static final long CACHE_CAP = 200_000_000L;
    /** One song over this is not a theme song; skipped, never buffered whole. */
    static final long SONG_CAP = 25_000_000L;
    static final double SILENCE_DB = -50.0;

    private static long lastCallMs;
    private final File dir;

    public OneAheadThemeStore(File dir) {
        this.dir = dir;
        dir.mkdirs();
    }

    // ---- cached models ------------------------------------------------------

    /** One song entry of a cached show manifest. Mirrors the Python manifest. */
    public static final class Entry {
        public final String type, slug, episodes, audio;
        /** Null when the feed lists none; ranks last like the Python stage. */
        public final Integer sequence;
        public Entry(String type, Integer sequence, String slug, String episodes, String audio) {
            this.type = type; this.sequence = sequence; this.slug = slug;
            this.episodes = episodes; this.audio = audio;
        }
        OneAheadThemeMatcher.Theme theme() {
            return new OneAheadThemeMatcher.Theme(type, sequence, slug, episodes);
        }
    }

    public static final class Show {
        public final String slug, name;
        public final List<Entry> themes;
        Show(String slug, String name, List<Entry> themes) {
            this.slug = slug; this.name = name; this.themes = themes;
        }
    }

    /** Decoded theme core at 8 kHz with the silence-trimmed edge counts. */
    public static final class Core {
        public final float[] pcm;
        public final int lead, trail;
        Core(float[] pcm, int lead, int trail) { this.pcm = pcm; this.lead = lead; this.trail = trail; }
    }

    private File manifestFile(String slug) { return new File(dir, slug + ".manifest.json"); }
    private File idsFile() { return new File(dir, "ids.json"); }

    private static String safe(String s) { return s == null ? "" : s; }

    // ---- exact show resolution -----------------------------------------------

    /**
     * The Kitsu id aside, every hop is an exact id lookup; a miss or a failure is "".
     * The caller's guard stops the chain when the job is no longer wanted.
     */
    public String resolveShow(String kitsuId, PlaybackGuard guard, ByteBudget budget) {
        try {
            if (kitsuId == null || kitsuId.isEmpty() || guard.isCancelled()) return "";
            JSONObject ids = readJson(idsFile());
            JSONObject hit = ids.optJSONObject("kitsu:" + kitsuId);
            if (hit != null && hit.optString("slug", "").length() > 0) return hit.optString("slug", "");
            if (guard.isCancelled()) return "";
            int mal = kitsuMal(kitsuId, guard, budget);
            if (mal <= 0 || guard.isCancelled()) return "";
            int anilist = anilistIdForMal(mal, guard, budget);
            if (anilist <= 0 || guard.isCancelled()) return "";
            List<String> slugs = animeThemesSlugs(anilist, guard, budget);
            if (slugs.isEmpty()) return "";
            String slug = slugs.get(0);
            JSONObject n = new JSONObject();
            n.put("mal", mal); n.put("anilist", anilist); n.put("slug", slug);
            ids.put("kitsu:" + kitsuId, n);
            writeJson(idsFile(), ids);
            return slug;
        } catch (Exception bad) {
            return "";
        }
    }

    /** MAL id of a Kitsu anime entry from Kitsu's own mappings. 0 when none. */
    int kitsuMal(String kitsuId, PlaybackGuard guard, ByteBudget budget) throws Exception {
        String url = KITSU_MAPPINGS + kitsuId
                + "/mappings?filter%5BexternalSite%5D=myanimelist%2Fanime&page%5Blimit%5D=5";
        JSONObject got = new JSONObject(httpGet(url, budget));
        JSONArray data = got.optJSONArray("data");
        for (int i = 0; data != null && i < data.length(); i++) {
            JSONObject attributes = data.optJSONObject(i) == null
                    ? null : data.optJSONObject(i).optJSONObject("attributes");
            if (attributes == null || !"myanimelist/anime".equals(attributes.optString("externalSite"))) continue;
            try {
                int mal = Integer.parseInt(attributes.optString("externalId", ""));
                if (mal > 0) return mal;
            } catch (NumberFormatException bad) { /* next mapping */ }
        }
        return 0;
    }

    /** AniList id for a MAL id: one exact Media(idMal) query. 0 when none. */
    int anilistIdForMal(int mal, PlaybackGuard guard, ByteBudget budget) throws Exception {
        if (guard.isCancelled()) return 0;
        JSONObject body = new JSONObject()
                .put("query", "query ($id: Int) { Media(idMal: $id, type: ANIME) { id } }")
                .put("variables", new JSONObject().put("id", mal));
        JSONObject data = new JSONObject(httpPost(GRAPHQL_ANILIST, body.toString(), budget)).optJSONObject("data");
        JSONObject media = data == null ? null : data.optJSONObject("Media");
        return media == null ? 0 : media.optInt("id", 0);
    }

    /** AnimeThemes slugs for an AniList id, in answer order. Empty when none. */
    List<String> animeThemesSlugs(int anilistId, PlaybackGuard guard, ByteBudget budget) throws Exception {
        if (guard.isCancelled()) return new ArrayList<String>();
        JSONObject body = new JSONObject()
                .put("query", "query($id: [Int!]) { findAnimeByExternalSite(site: ANILIST, id: $id) { slug } }")
                .put("variables", new JSONObject().put("id", new JSONArray().put(anilistId)));
        List<String> out = new ArrayList<>();
        JSONObject data = new JSONObject(httpPost(GRAPHQL_ANIME_THEMES, body.toString(), budget)).optJSONObject("data");
        JSONArray found = data == null ? null : data.optJSONArray("findAnimeByExternalSite");
        for (int i = 0; found != null && i < found.length(); i++) {
            String slug = found.optJSONObject(i) == null ? "" : safe(found.optJSONObject(i).optString("slug", ""));
            if (!slug.isEmpty()) out.add(slug);
        }
        return out;
    }

    /** One show's manifest, loaded from the cache or fetched once and kept. */
    public Show show(String slug, PlaybackGuard guard, ByteBudget budget) throws Exception {
        File f = manifestFile(slug);
        if (f.isFile()) {
            try {
                return readShow(new String(readAll(f), "UTF-8"));
            } catch (Exception bad) {
                f.delete();
            }
        }
        if (guard.isCancelled()) throw new DemuxException(DemuxException.Kind.CANCELLED, "cancelled");
        JSONObject body = new JSONObject().put("query",
                "query($slug: String!) { anime(slug: $slug) { slug title { romaji } "
                + "animethemes { type sequence slug "
                + "animethemeentries { episodes videos { nodes { audio { link size } } } } } } }")
                .put("variables", new JSONObject().put("slug", slug));
        JSONObject data = new JSONObject(httpPost(GRAPHQL_ANIME_THEMES, body.toString(), budget)).optJSONObject("data");
        JSONObject anime = data == null ? null : data.optJSONObject("anime");
        if (anime == null) throw new java.io.IOException("no anime for slug");
        Show show = readShowAnime(slug, anime);
        writeAll(f, showJson(show).getBytes("UTF-8"));
        return show;
    }

    private static Show readShowAnime(String slug, JSONObject anime) {
        JSONObject title = anime.optJSONObject("title");
        String name = title == null ? "" : safe(title.optString("romaji", ""));
        List<Entry> themes = new ArrayList<>();
        JSONArray animethemes = anime.optJSONArray("animethemes");
        for (int i = 0; animethemes != null && i < animethemes.length(); i++) {
            JSONObject t = animethemes.optJSONObject(i);
            if (t == null) continue;
            JSONArray entries = t.optJSONArray("animethemeentries");
            // Entries of one theme share the theme slug (Conan OP57 1078-1092 and
            // OP57 1093-1101 carry different audio), so a multi-entry theme gets
            // suffixed entry slugs; a single-entry theme keeps the bare slug.
            String baseSlug = safe(t.optString("slug", ""));
            for (int j = 0; entries != null && j < entries.length(); j++) {
                JSONObject e = entries.optJSONObject(j);
                JSONObject videos = e == null ? null : e.optJSONObject("videos");
                JSONArray nodes = videos == null ? null : videos.optJSONArray("nodes");
                if (nodes == null || nodes.length() == 0) continue;
                JSONObject audio = nodes.optJSONObject(0) == null
                        ? null : nodes.optJSONObject(0).optJSONObject("audio");
                if (audio == null || safe(audio.optString("link", "")).isEmpty()) continue;
                String entrySlug = entries.length() > 1 ? baseSlug + "-e" + (j + 1) : baseSlug;
                themes.add(new Entry(safe(t.optString("type", "")),
                        t.isNull("sequence") ? null : t.optInt("sequence", 0),
                        entrySlug, e.isNull("episodes") ? null : e.optString("episodes", null),
                        safe(audio.optString("link", ""))));
            }
        }
        return new Show(slug, name, themes);
    }

    /** The ranked theme's own entry (entry slugs are unique per show). */
    static Entry entryFor(OneAheadThemeMatcher.Theme t, List<Entry> entries) {
        if (t == null || entries == null) return null;
        for (Entry e : entries) if (e != null && t.slug.equals(e.slug)) return e;
        return null;
    }

    private static Show readShow(String json) throws Exception {
        JSONObject o = new JSONObject(json);
        List<Entry> themes = new ArrayList<>();
        JSONArray ts = o.optJSONArray("themes");
        for (int i = 0; ts != null && i < ts.length(); i++) {
            JSONObject t = ts.optJSONObject(i);
            if (t == null) continue;
            themes.add(new Entry(safe(t.optString("type", "")),
                    t.isNull("sequence") ? null : t.optInt("sequence", 0),
                    safe(t.optString("slug", "")), t.isNull("episodes") ? null : t.optString("episodes", null),
                    safe(t.optString("audio", ""))));
        }
        return new Show(safe(o.optString("slug", "")), safe(o.optString("name", "")), themes);
    }

    private static String showJson(Show show) throws Exception {
        JSONObject o = new JSONObject();
        o.put("slug", show.slug); o.put("name", show.name);
        JSONArray ts = new JSONArray();
        for (Entry t : show.themes) {
            JSONObject e = new JSONObject();
            e.put("type", t.type);
            if (t.sequence == null) e.put("sequence", JSONObject.NULL); else e.put("sequence", t.sequence);
            e.put("slug", t.slug);
            if (t.episodes == null) e.put("episodes", JSONObject.NULL); else e.put("episodes", t.episodes);
            e.put("audio", t.audio);
            ts.put(e);
        }
        o.put("themes", ts);
        return o.toString(1);
    }

    // ---- theme audio ----------------------------------------------------------

    private File f32File(String slug, Entry t) { return new File(dir, slug + "-" + t.slug + ".f32"); }
    private File metaFile(String slug, Entry t) { return new File(dir, slug + "-" + t.slug + ".json"); }

    /**
     * The decoded 8 kHz core of one song, downloading and decoding once. Songs cost
     * no second fetch: the ogg streams to a temp file, decodes to f32, is trimmed
     * and kept, and the ogg is removed. The guard stops the work when the job is
     * no longer wanted; the heap gate refuses the download while memory is short.
     */
    public Core core(String slug, Entry t, RangeSource ogg, ByteBudget budget, PlaybackGuard guard)
            throws DemuxException, java.io.IOException {
        File f32 = f32File(slug, t), meta = metaFile(slug, t);
        if (f32.isFile() && meta.isFile()) {
            Core c = readCore(f32, meta);
            if (c != null) { touch(f32); touch(meta); return c; }
            f32.delete(); meta.delete();
        }
        if (guard.isCancelled()) throw new DemuxException(DemuxException.Kind.CANCELLED, "cancelled");
        if (!app.tikkamasalla.stremio.oneahead.HeapGate.fits(
                app.tikkamasalla.stremio.oneahead.HeapGate.FETCH_BYTES))
            throw new DemuxException(DemuxException.Kind.CANCELLED, "low heap");
        File tmp = new File(dir, slug + "-" + t.slug + ".ogg.tmp");
        try {
            download(ogg, tmp, budget);
            float[] pcm = decodeOgg8k(tmp, guard);
            int[] trim = trimSilence(pcm);
            float[] core = Arrays.copyOfRange(pcm, trim[0], trim[1]);
            writeF32(f32, core);
            JSONObject m = new JSONObject();
            m.put("sr", OneAheadThemeMatcher.SR);
            m.put("total", pcm.length);
            m.put("lead", trim[0]);
            m.put("trail", pcm.length - trim[1]);
            m.put("core", core.length);
            writeJson(meta, m);
            evict();
            return new Core(core, trim[0], pcm.length - trim[1]);
        } catch (DemuxException bad) {
            throw bad;
        } catch (Exception bad) {
            throw new DemuxException(DemuxException.Kind.DECODER_FAILED, bad.getClass().getSimpleName());
        } finally {
            tmp.delete();
        }
    }

    /**
     * Song bytes streamed to disk over the job's paced, budgeted reader, capped at
     * SONG_CAP (songs are a few MB). The link itself is never logged.
     */
    static void download(RangeSource ogg, File dst, ByteBudget budget)
            throws DemuxException, java.io.IOException {
        if (ogg.length() > SONG_CAP) throw new DemuxException(DemuxException.Kind.MALFORMED, "song too large");
        OutputStream out = new FileOutputStream(dst);
        try {
            byte[] buf = new byte[64 * 1024];
            long pos = 0;
            while (true) {
                int n = ogg.read(pos, buf, 0, buf.length);
                if (n <= 0) break;
                // The source paces, budgets and guards every read; the cap counts song bytes only.
                if (pos + n > SONG_CAP) throw new DemuxException(DemuxException.Kind.MALFORMED, "song too large");
                out.write(buf, 0, n);
                pos += n;
            }
        } finally {
            out.close();
        }
    }

    /**
     * Ogg/vorbis to 8 kHz mono float through a software decoder and the job's
     * resampler. A software decoder is picked by name so the player's hardware
     * decoders are never contended; the guard stops the loop when the player
     * needs the machine or the job is cancelled, and no progress for 30 s ends
     * the decode instead of hanging the worker thread.
     */
    static float[] decodeOgg8k(File ogg, PlaybackGuard guard) throws Exception {
        final List<float[]> chunks = new ArrayList<>();
        final int[] total = {0};
        PcmSink sink = new PcmSink() {
            @Override
            public void onPcm(short[] mono, int count, int sampleRate, long ptsUs) {
                float[] f = new float[count];
                for (int i = 0; i < count; i++) f[i] = mono[i] / 32768f;
                chunks.add(f);
                total[0] += count;
            }
        };
        MonoDownsampler down = new MonoDownsampler(OneAheadThemeMatcher.SR, sink, null);
        MediaExtractor ex = new MediaExtractor();
        try {
            ex.setDataSource(ogg.getAbsolutePath());
            int track = -1;
            String mime = null;
            for (int i = 0; i < ex.getTrackCount(); i++) {
                String m = ex.getTrackFormat(i).getString(MediaFormat.KEY_MIME);
                if (m != null && m.startsWith("audio/")) { track = i; mime = m; break; }
            }
            if (track < 0) throw new DemuxException(DemuxException.Kind.NO_TRACK, "no audio track");
            ex.selectTrack(track);
            MediaFormat fmt = ex.getTrackFormat(track);
            MediaCodec codec = MediaCodec.createByCodecName(softwareCodec(mime));
            try {
                codec.configure(fmt, null, null, 0);
                codec.start();
                MediaFormat outFmt = fmt;
                MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
                boolean inEos = false, outEos = false;
                long lastProgress = System.currentTimeMillis();
                while (!outEos) {
                    if (guard.isCancelled()) throw new DemuxException(DemuxException.Kind.CANCELLED, "cancelled");
                    while (guard.shouldPause() && !guard.isCancelled()) {
                        lastProgress = System.currentTimeMillis();
                        try { Thread.sleep(250); } catch (InterruptedException e) {
                            Thread.currentThread().interrupt();
                            throw new DemuxException(DemuxException.Kind.CANCELLED, "interrupted");
                        }
                    }
                    boolean progressed = false;
                    if (!inEos) {
                        int in = codec.dequeueInputBuffer(2000);
                        if (in >= 0) {
                            progressed = true;
                            ByteBuffer buf = codec.getInputBuffer(in);
                            int n = ex.readSampleData(buf, 0);
                            if (n < 0) {
                                codec.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                                inEos = true;
                            } else {
                                codec.queueInputBuffer(in, 0, n, ex.getSampleTime(), 0);
                                ex.advance();
                            }
                        }
                    }
                    int o = codec.dequeueOutputBuffer(info, 2000);
                    if (o == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                        progressed = true;
                        outFmt = codec.getOutputFormat();
                    } else if (o >= 0) {
                        progressed = true;
                        ByteBuffer buf = codec.getOutputBuffer(o);
                        if (buf != null && info.size > 0) {
                            buf.position(info.offset);
                            buf.limit(info.offset + info.size);
                            int enc = outFmt.containsKey(MediaFormat.KEY_PCM_ENCODING)
                                    ? outFmt.getInteger(MediaFormat.KEY_PCM_ENCODING)
                                    : android.media.AudioFormat.ENCODING_PCM_16BIT;
                            if (enc != android.media.AudioFormat.ENCODING_PCM_16BIT
                                    && enc != android.media.AudioFormat.ENCODING_PCM_FLOAT)
                                throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "encoding " + enc);
                            int ch = outFmt.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                            int rate = outFmt.getInteger(MediaFormat.KEY_SAMPLE_RATE);
                            down.onDecoded(buf, enc == android.media.AudioFormat.ENCODING_PCM_FLOAT
                                    ? AudioDecoder.PCM_FLOAT : AudioDecoder.PCM_16BIT, ch, rate, info.presentationTimeUs);
                        }
                        codec.releaseOutputBuffer(o, false);
                        if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) outEos = true;
                    }
                    long now = System.currentTimeMillis();
                    if (progressed) lastProgress = now;
                    else if (now - lastProgress > 30000)
                        throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "decoder timeout");
                }
                down.flushBlock();
            } finally {
                try { codec.stop(); } catch (RuntimeException ignored) { /* ending anyway */ }
                codec.release();
            }
        } finally {
            ex.release();
        }
        float[] out = new float[total[0]];
        int at = 0;
        for (float[] c : chunks) { System.arraycopy(c, 0, out, at, c.length); at += c.length; }
        if (at == 0) throw new DemuxException(DemuxException.Kind.DECODER_FAILED, "no samples");
        return out;
    }

    /** A software decoder for the mime, never a hardware one the player may use. */
    private static String softwareCodec(String mime) throws DemuxException {
        try {
            android.media.MediaCodecList list =
                    new android.media.MediaCodecList(android.media.MediaCodecList.REGULAR_CODECS);
            for (android.media.MediaCodecInfo info : list.getCodecInfos()) {
                if (info.isEncoder()) continue;
                boolean hardware = false;
                try { hardware = info.isHardwareAccelerated(); } catch (Throwable old) { /* API < 29 */ }
                if (hardware) continue;
                for (String type : info.getSupportedTypes()) {
                    if (type.equalsIgnoreCase(mime)) return info.getName();
                }
            }
        } catch (Throwable bad) {
            throw new DemuxException(DemuxException.Kind.DECODER_MISSING, bad.getClass().getSimpleName());
        }
        throw new DemuxException(DemuxException.Kind.DECODER_MISSING, "no software decoder");
    }

    /** Leading/trailing silence cut, the same -50 dB rule as the Python cache. */
    static int[] trimSilence(float[] x) {
        double thr = Math.pow(10.0, SILENCE_DB / 20.0);
        int a = 0, b = x.length;
        while (a < b && Math.abs(x[a]) <= thr) a++;
        while (b > a && Math.abs(x[b - 1]) <= thr) b--;
        if (a >= b) { a = 0; b = x.length; }
        return new int[]{a, b};
    }

    private Core readCore(File f32, File meta) {
        try {
            JSONObject m = new JSONObject(new String(readAll(meta), "UTF-8"));
            int coreLen = m.optInt("core", -1), lead = m.optInt("lead", -1), trail = m.optInt("trail", -1);
            byte[] raw = readAll(f32);
            if (coreLen <= 0 || lead < 0 || trail < 0 || raw.length != coreLen * 4) return null;
            float[] pcm = new float[coreLen];
            ByteBuffer.wrap(raw).order(ByteOrder.LITTLE_ENDIAN).asFloatBuffer().get(pcm);
            return new Core(pcm, lead, trail);
        } catch (Exception bad) {
            return null;
        }
    }

    private static void writeF32(File f, float[] pcm) throws java.io.IOException {
        ByteBuffer b = ByteBuffer.allocate(pcm.length * 4).order(ByteOrder.LITTLE_ENDIAN);
        b.asFloatBuffer().put(pcm);
        writeAll(f, b.array());
    }

    /** Oldest song files fall out first when the cache passes its cap. */
    synchronized void evict() {
        File[] fs = dir.listFiles((d, n) -> n.endsWith(".f32"));
        if (fs == null) return;
        long total = 0;
        for (File f : fs) total += f.length();
        Arrays.sort(fs, Comparator.comparingLong(File::lastModified));
        for (File f : fs) {
            if (total <= CACHE_CAP) break;
            String base = f.getName().substring(0, f.getName().length() - 4);
            long len = f.length();
            File meta = new File(dir, base + ".json");
            if (f.delete()) total -= len;
            meta.delete();
        }
    }

    private static void touch(File f) { f.setLastModified(System.currentTimeMillis()); }

    // ---- small HTTP ------------------------------------------------------------

    private static synchronized void pace() throws java.io.IOException {
        long now = System.currentTimeMillis();
        long wait = lastCallMs + API_DELAY_MS - now;
        if (wait > 0) {
            try { Thread.sleep(wait); }
            catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new java.io.IOException("interrupted");
            }
        }
        lastCallMs = System.currentTimeMillis();
    }

    private static String httpGet(String url, ByteBudget budget) throws java.io.IOException {
        pace();
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(8000); c.setReadTimeout(15000);
        c.setRequestProperty("User-Agent", UA);
        c.setRequestProperty("Accept", "application/json");
        String body = readResponse(c);
        if (budget != null) budget.add(body.getBytes("UTF-8").length);
        return body;
    }

    private static String httpPost(String url, String body, ByteBudget budget) throws java.io.IOException {
        pace();
        byte[] raw = body.getBytes("UTF-8");
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(8000); c.setReadTimeout(15000);
        c.setDoOutput(true);
        c.setRequestProperty("Content-Type", "application/json");
        c.setRequestProperty("User-Agent", UA);
        OutputStream o = c.getOutputStream();
        try { o.write(raw); } finally { o.close(); }
        String back = readResponse(c);
        if (budget != null) budget.add(back.getBytes("UTF-8").length);
        return back;
    }

    private static String readResponse(HttpURLConnection c) throws java.io.IOException {
        int code = c.getResponseCode();
        InputStream in = code >= 200 && code < 300 ? c.getInputStream() : c.getErrorStream();
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while (in != null && (n = in.read(buf)) > 0) {
                out.write(buf, 0, n);
                if (out.size() > 2 * 1024 * 1024) throw new java.io.IOException("response too large");
            }
            if (code < 200 || code >= 300) throw new java.io.IOException("http " + code);
            return out.toString("UTF-8");
        } finally {
            if (in != null) try { in.close(); } catch (java.io.IOException ignored) { /* ending anyway */ }
        }
    }

    // ---- small files -------------------------------------------------------------

    private JSONObject readJson(File f) {
        try {
            if (f.isFile()) return new JSONObject(new String(readAll(f), "UTF-8"));
        } catch (Exception ignored) { /* a bad cache file is a miss */ }
        return new JSONObject();
    }

    private static void writeJson(File f, JSONObject o) {
        try {
            f.getParentFile().mkdirs();
            writeAll(f, o.toString(1).getBytes("UTF-8"));
        } catch (Exception ignored) { /* the cache is optional */ }
    }

    private static byte[] readAll(File f) throws java.io.IOException {
        InputStream in = new FileInputStream(f);
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            return out.toByteArray();
        } finally { in.close(); }
    }

    private static void writeAll(File f, byte[] raw) throws java.io.IOException {
        f.getParentFile().mkdirs();
        File tmp = new File(f.getParentFile(), f.getName() + ".tmp");
        OutputStream o = new FileOutputStream(tmp);
        try { o.write(raw); } finally { o.close(); }
        if (!tmp.renameTo(f)) {
            FileInputStream in = new FileInputStream(tmp);
            try {
                OutputStream dst = new FileOutputStream(f);
                try {
                    byte[] buf = new byte[8192];
                    int n;
                    while ((n = in.read(buf)) > 0) dst.write(buf, 0, n);
                } finally { dst.close(); }
            } finally { in.close(); tmp.delete(); }
        }
    }
}
