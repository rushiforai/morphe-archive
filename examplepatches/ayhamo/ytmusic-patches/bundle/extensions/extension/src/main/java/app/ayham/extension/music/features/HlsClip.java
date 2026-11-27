package app.ayham.extension.music.features;

import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Turns an fMP4 HLS clip (what Apple's motion artwork is) into one local
 * fragmented .mp4 that Android's MediaPlayer can loop. MediaPlayer's own HLS client rejects
 * fMP4 (error -1007), and this avoids bundling ExoPlayer. Picks an H.264 variant around 1080p
 * or below, downloads init + segments (up to {@link #MAX_SECONDS}), and caches by URL.
 */
final class HlsClip {
    private static final String TAG = "Ayham";
    private static final double MAX_SECONDS = 40;
    private static final int MAX_HEIGHT = 1080;
    private static final long CACHE_BYTES = 80L * 1024 * 1024;
    /** A master or media playlist is a few KB; past this it is not one. */
    static final long MAX_PLAYLIST_BYTES = 2L * 1024 * 1024;
    /** One clip's download (init and segments): 40 s even at 4K is well under this; it stops an endless stream. */
    static final long MAX_CLIP_BYTES = 256L * 1024 * 1024;
    /** Segments in one clip: Apple's are seconds long, so 40 s is a few dozen. */
    static final int MAX_SEGMENTS = 500;

    private HlsClip() {
    }

    /** Off the main thread. @return the cached file, or null. */
    static File fetch(String masterUrl, File cacheDir, int artPx) throws Exception {
        return fetch(masterUrl, cacheDir, artPx, true);
    }

    /** @param trim false for the downloaded songs' clips (kept in the app's files, no size cap). */
    static File fetch(String masterUrl, File cacheDir, int artPx, boolean trim) throws Exception {
        return fetch(masterUrl, cacheDir, artPx, trim, null, false);
    }

    /** Apple's animated cover at the listener's quality (canvas.md §13 rule 5): cap null is Original. */
    static File fetch(String masterUrl, File cacheDir, int artPx, Integer cap) throws Exception {
        return fetch(masterUrl, cacheDir, artPx, true, cap, true);
    }

    /** As above; trim false for the downloaded songs' clips (kept in the app's files, no size cap). */
    static File fetch(String masterUrl, File cacheDir, int artPx, boolean trim, Integer cap) throws Exception {
        return fetch(masterUrl, cacheDir, artPx, trim, cap, true);
    }

    private static File fetch(String masterUrl, File cacheDir, int artPx, boolean trim, Integer cap, boolean byCap) throws Exception {
        File dir = new File(cacheDir, "canvas");
        if (!dir.isDirectory() && !dir.mkdirs()) return null;
        // the art's size picks the variant: the smallest that still covers it, 360p to 1080p; or the
        // listener's quality
        int want = artPx < 480 ? 360 : artPx < 900 ? 720 : MAX_HEIGHT;
        String tag = byCap ? "q" + (cap == null ? "orig" : cap) : String.valueOf(want);
        File out = new File(dir, Integer.toHexString(masterUrl.hashCode()) + "-" + tag + ".mp4");
        if (out.length() > 0) {
            out.setLastModified(System.currentTimeMillis());
            Log.i(TAG, "canvas: clip from cache " + out.length() / 1024 + " KB");
            return out;
        }
        long start = System.currentTimeMillis();
        String master = text(masterUrl);
        String media = !master.contains("#EXT-X-STREAM-INF") ? masterUrl : byCap ? pickByCap(masterUrl, master, cap) : pickVariant(masterUrl, master, want);
        if (media == null) return null;
        String playlist = media.equals(masterUrl) ? master : text(media);

        // one temp file per download: two threads fetching the same clip (quick skips back and
        // forth) would otherwise write into the same file
        File tmp = new File(dir, out.getName() + "." + Thread.currentThread().getId() + ".part");
        long bytes = 0;
        double seconds = 0;
        int segments = 0;
        boolean whole = false;
        try (OutputStream o = new FileOutputStream(tmp)) {
            Matcher map = Pattern.compile("#EXT-X-MAP:URI=\"([^\"]+)\"(?:,BYTERANGE=\"(\\d+)@(\\d+)\")?").matcher(playlist);
            if (map.find()) bytes += copy(resolve(media, map.group(1)), map.group(2), map.group(3), o, MAX_CLIP_BYTES);
            String range = null;
            double duration = 0;
            long nextOffset = 0;
            for (String line : playlist.split("\n")) {
                line = line.trim();
                if (line.startsWith("#EXTINF:")) {
                    duration = Double.parseDouble(line.substring(8).split(",")[0]);
                    // a duration that never adds up would never reach MAX_SECONDS
                    if (!(duration > 0) || Double.isInfinite(duration)) throw new IOException("bad segment duration");
                } else if (line.startsWith("#EXT-X-BYTERANGE:")) {
                    range = line.substring(17);
                } else if (!line.isEmpty() && !line.startsWith("#")) {
                    String len = null, off = null;
                    if (range != null) {
                        String[] r = range.split("@");
                        len = r[0];
                        off = r.length > 1 ? r[1] : String.valueOf(nextOffset);
                        nextOffset = Long.parseLong(off) + Long.parseLong(len);
                    }
                    if (segments >= MAX_SEGMENTS) throw new IOException("over " + MAX_SEGMENTS + " segments");
                    bytes += copy(resolve(media, line), len, off, o, MAX_CLIP_BYTES - bytes);
                    range = null;
                    segments++;
                    seconds += duration;
                    if (seconds >= MAX_SECONDS) break;
                }
            }
            whole = true;
        } finally {
            // a download that broke off leaves no part file behind (the offline folder is never trimmed)
            if (!whole) //noinspection ResultOfMethodCallIgnored
                tmp.delete();
        }
        if (!tmp.renameTo(out)) {
            //noinspection ResultOfMethodCallIgnored
            tmp.delete();
            return null;
        }
        if (trim) trim(dir, out);
        Log.i(TAG, "canvas: clip " + segments + " segments, " + Math.round(seconds) + " s, " + bytes / 1024
                + " KB in " + (System.currentTimeMillis() - start) + " ms");
        return out;
    }

    /**
     * Keep the cache under CACHE_BYTES: the least recently shown clips go first. Only the clips
     * count: a .part is a download still being written (by another thread), and a clip's .crop and
     * .info go with it, not on their own date (a clip shown again is touched, they are not).
     */
    static synchronized void trim(File dir, File keep) {
        // a .part an hour old is a download the app was closed in the middle of
        File[] parts = dir.listFiles((d, n) -> n.endsWith(".part"));
        if (parts != null) for (File p : parts)
            if (System.currentTimeMillis() - p.lastModified() > 3_600_000L) //noinspection ResultOfMethodCallIgnored
                p.delete();
        File[] files = dir.listFiles((d, n) -> n.endsWith(".mp4"));
        if (files == null) return;
        java.util.Arrays.sort(files, (x, y) -> Long.compare(y.lastModified(), x.lastModified()));
        long total = 0;
        int removed = 0;
        for (File f : files) {
            total += f.length();
            if (total > CACHE_BYTES && !f.equals(keep) && f.delete()) {
                removed++;
                String base = f.getPath().substring(0, f.getPath().length() - 4);
                //noinspection ResultOfMethodCallIgnored
                new File(base + ".crop").delete();
                //noinspection ResultOfMethodCallIgnored
                new File(base + ".info").delete();
            }
        }
        if (removed > 0) Log.i(TAG, "canvas: cache over " + CACHE_BYTES / 1048576 + " MB, removed " + removed + " old clips");
    }

    /** The H.264 variant with the fewest pixels at or above `want` lines (else the largest under it); any variant if none says avc1. */
    static String pickVariant(String base, String master, int want) {
        String[] lines = master.split("\n");
        String best = null, fallback = null;
        long bestPixels = -1, fallbackBw = Long.MAX_VALUE;
        boolean bestCovers = false;
        for (int i = 0; i < lines.length - 1; i++) {
            if (!lines[i].startsWith("#EXT-X-STREAM-INF:")) continue;
            String attrs = lines[i];
            String uri = lines[i + 1].trim();
            // a variant off Apple's media hosts (or not https) is never fetched
            if (!ArtistHeader.trusted(resolve(base, uri), null)) continue;
            long bw = longAttr(attrs, "BANDWIDTH");
            Matcher res = Pattern.compile("RESOLUTION=(\\d+)x(\\d+)").matcher(attrs);
            long w = 0, h = 0;
            if (res.find()) {
                w = Long.parseLong(res.group(1));
                h = Long.parseLong(res.group(2));
            }
            boolean avc = attrs.toLowerCase(Locale.ROOT).contains("avc1");
            if (avc && h <= MAX_HEIGHT) {
                boolean covers = Math.min(w, h) >= want;
                // prefer a variant that covers the art; among those the smallest, else the biggest
                boolean better = best == null
                        || (covers && (!bestCovers || w * h < bestPixels))
                        || (!covers && !bestCovers && w * h > bestPixels);
                if (better) {
                    bestPixels = w * h;
                    best = uri;
                    bestCovers = covers;
                }
            }
            if (bw < fallbackBw) {
                fallbackBw = bw;
                fallback = uri;
            }
        }
        String pick = best != null ? best : fallback;
        Log.i(TAG, "canvas: variant " + pick + (best == null ? " (no avc1, lowest bandwidth)" : ""));
        return pick == null ? null : resolve(base, pick);
    }

    /**
     * canvas.md §13 rule 5: the H.264 variant with the most pixels whose shorter side is at most the
     * cap (ties: the higher bandwidth), else the fewest pixels; only .m3u8 variants count.
     */
    static String pickByCap(String base, String master, Integer cap) {
        String[] lines = master.split("\n");
        java.util.List<long[]> vs = new java.util.ArrayList<>();
        java.util.List<String> uris = new java.util.ArrayList<>();
        for (int i = 0; i < lines.length - 1; i++) {
            if (!lines[i].startsWith("#EXT-X-STREAM-INF:")) continue;
            String attrs = lines[i], uri = lines[i + 1].trim();
            if (!attrs.toLowerCase(Locale.ROOT).contains("avc1") || !ArtistHeader.trusted(resolve(base, uri), ".m3u8")) continue;
            Matcher res = Pattern.compile("RESOLUTION=(\\d+)x(\\d+)").matcher(attrs);
            if (!res.find()) continue;
            vs.add(new long[]{Long.parseLong(res.group(1)), Long.parseLong(res.group(2)), longAttr(attrs, "BANDWIDTH")});
            uris.add(uri);
        }
        int i = app.ayham.extension.music.features.CanvasSettings.pickVariant(vs.toArray(new long[0][]), cap);
        if (i < 0) return pickVariant(base, master, MAX_HEIGHT);
        Log.i(TAG, "canvas: variant " + vs.get(i)[0] + "x" + vs.get(i)[1] + " for the quality " + (cap == null ? "Original" : cap + "p"));
        return resolve(base, uris.get(i));
    }

    private static long longAttr(String attrs, String name) {
        Matcher m = Pattern.compile(name + "=(\\d+)").matcher(attrs);
        return m.find() ? Long.parseLong(m.group(1)) : 0;
    }

    private static String resolve(String base, String ref) {
        try {
            return new URL(new URL(base), ref).toString();
        } catch (Exception e) {
            return ref;
        }
    }

    private static HttpURLConnection open(String url, String len, String off) throws Exception {
        // master, variant, init and segments alike: https on 443, Apple's media hosts only
        if (!ArtistHeader.trusted(url, null)) throw new IOException("untrusted clip link");
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(10_000);
        c.setReadTimeout(15_000);
        if (len != null) {
            long from = Long.parseLong(off);
            c.setRequestProperty("Range", "bytes=" + from + "-" + (from + Long.parseLong(len) - 1));
        }
        int code = c.getResponseCode();
        if (code >= 400) {
            c.disconnect();
            throw new IllegalStateException("http " + code);
        }
        return c;
    }

    private static long copy(String url, String len, String off, OutputStream o, long max) throws Exception {
        HttpURLConnection c = open(url, len, off);
        try (InputStream in = c.getInputStream()) {
            return capped(in, o, max);
        } finally {
            c.disconnect();
        }
    }

    /** Copies [in] to [o]; more than [max] bytes is an error (an answer that size is not the one asked for). */
    static long capped(InputStream in, OutputStream o, long max) throws IOException {
        long n = 0;
        byte[] b = new byte[32768];
        int r;
        while ((r = in.read(b)) > 0) {
            n += r;
            if (n > max) throw new IOException("answer over " + max + " bytes");
            o.write(b, 0, r);
        }
        return n;
    }

    private static String text(String url) throws Exception {
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        copy(url, null, null, buf, MAX_PLAYLIST_BYTES);
        return buf.toString("UTF-8");
    }
}
