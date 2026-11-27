package app.ayham.extension.music.features;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * canvas.md §13 rule 8: Apple's artist image and artist video in YT Music's artist page header, as
 * Metrolist's fetchArtistArtwork (and the PC, e77ab64): the iTunes artist id by an exact name match
 * (two or more: none), Apple's artist with its artwork and motion video (wide 16:9, fullscreen 16:9,
 * square) at the quality asked. Hits kept 30 days, misses (and a video asked but none) 7, failures
 * not kept. Keyed by the storefront, the language, the name, both switches and the quality. Off by
 * default; videos follow images until set.
 */
final class ArtistHeader {
    private static final String TAG = "Ayham";
    static final String KEY_IMAGES = "ayham_artist_images", KEY_VIDEOS = "ayham_artist_videos", KEY_QUALITY = "ayham_artist_video_quality";
    static final long HIT_MS = 30 * 86_400_000L, MISS_MS = 7 * 86_400_000L;
    private static final Handler main = new Handler(Looper.getMainLooper());

    private ArtistHeader() {
    }

    // ---- pure parts ----

    private static final Pattern SUBSCRIBE = Pattern.compile("^(?:Subscribe to|Unsubscribe from|Subscribed to) (.+?)\\.(?:\\s+\\d.*)?$");

    /** The artist's name from the header's subscribe button ("Subscribe to Lady Gaga. 30.9 million"), or null. */
    static String nameFrom(CharSequence desc) {
        if (desc == null) return null;
        Matcher m = SUBSCRIBE.matcher(desc.toString().trim());
        return m.find() ? m.group(1).trim() : null;
    }

    /** Metrolist's profile name: trimmed, lower case, curly apostrophes straight, spaces single. */
    static String profileName(String s) {
        return s == null ? "" : s.trim().toLowerCase(Locale.ROOT).replaceAll("[‘’‛′]", "'").replaceAll("\\s+", " ");
    }

    /** The one exact match's id, or -1 (none, or two or more: ambiguous). */
    static long artistId(JSONArray results, String name) {
        String want = profileName(name);
        long id = -1;
        for (int i = 0; results != null && i < results.length(); i++) {
            JSONObject r = results.optJSONObject(i);
            if (r == null || r.optLong("artistId") <= 0 || !profileName(r.optString("artistName")).equals(want)) continue;
            long x = r.optLong("artistId");
            if (id > 0 && id != x) return -1;
            id = x;
        }
        return id;
    }

    /** The motion video's master: wide 16:9, else fullscreen 16:9, else square; null for none. */
    static String motion(JSONObject editorialVideo) {
        if (editorialVideo == null) return null;
        for (String k : new String[]{"motionArtistWide16x9", "motionArtistFullscreen16x9", "motionArtistSquare1x1"}) {
            JSONObject a = editorialVideo.optJSONObject(k);
            String v = a == null ? "" : a.optString("video");
            if (trusted(v, ".m3u8")) return v;
        }
        return null;
    }

    static boolean trusted(String u, String ext) {
        try {
            URL x = new URL(u);
            // https on its own port, no user info, Apple's media hosts only (canvas.md §4 rule 6's idea)
            return "https".equals(x.getProtocol()) && (x.getPort() == -1 || x.getPort() == 443) && x.getUserInfo() == null
                    && x.getHost().toLowerCase(Locale.ROOT).matches("(.*\\.)?(apple\\.com|mzstatic\\.com|aaplimg\\.com|cdn-apple\\.com)")
                    && (ext == null || x.getPath().endsWith(ext));
        } catch (Exception e) {
            return false;
        }
    }

    /** The image at its own size, from Apple's {w}x{h}{c}.{f} template; null when it isn't one. */
    static String image(JSONObject artwork) {
        if (artwork == null) return null;
        String url = artwork.optString("url");
        int w = artwork.optInt("width"), h = artwork.optInt("height");
        if (url.isEmpty() || w <= 0 || h <= 0) return null;
        String u = url.replace("{w}", String.valueOf(w)).replace("{h}", String.valueOf(h)).replace("{c}", "bb").replace("{f}", "jpg");
        return trusted(u, null) ? u : null;
    }

    static String key(String country, String lang, String name, boolean images, boolean videos, String quality) {
        return country + "|" + lang + "|" + profileName(name) + "|" + images + "|" + videos + "|" + (quality == null ? "720" : quality);
    }

    /** Videos follow images until the listener sets them. */
    static boolean videos(boolean images, String videosSetting) {
        return videosSetting == null || "follow".equals(videosSetting) ? images : "on".equals(videosSetting);
    }

    // ---- settings ----

    private static SharedPreferences prefs() {
        return Features.appContext == null ? null : Features.appContext.getSharedPreferences("morphe_prefs", Context.MODE_PRIVATE);
    }

    static boolean imagesOn() {
        SharedPreferences p = prefs();
        return p != null && p.getBoolean(KEY_IMAGES, false);
    }

    static boolean videosOn() {
        SharedPreferences p = prefs();
        return p != null && videos(imagesOn(), p.getString(KEY_VIDEOS, "follow"));
    }

    static String quality() {
        SharedPreferences p = prefs();
        return p == null ? "720" : p.getString(KEY_QUALITY, "720");
    }

    // ---- the lookup, kept ----

    /** {imageUrl or "", video file path or ""}, or null on a failure (not kept). */
    static String[] lookup(String name, boolean images, boolean videos, String quality, File cacheDir) {
        String country = Locale.getDefault().getCountry().length() == 2 ? Locale.getDefault().getCountry().toLowerCase(Locale.ROOT) : "us";
        String lang = Locale.getDefault().getLanguage().toLowerCase(Locale.ROOT);
        String key = key(country, lang, name, images, videos, quality);
        SharedPreferences store = Features.appContext.getSharedPreferences("ayham_artist_header", Context.MODE_PRIVATE);
        String saved = store.getString(key, null);
        if (saved != null) {
            String[] p = saved.split("\t", -1);
            try {
                long at = Long.parseLong(p[0]);
                boolean shortLived = "1".equals(p[1]);
                boolean fileGone = !p[3].isEmpty() && !new File(p[3]).exists();
                if (!fileGone && System.currentTimeMillis() - at <= (shortLived ? MISS_MS : HIT_MS)) {
                    Log.i(TAG, "artist header: '" + name + "' from the cache (" + (p[2].isEmpty() && p[3].isEmpty() ? "none" : "image " + !p[2].isEmpty() + ", video " + !p[3].isEmpty()) + ")");
                    return new String[]{p[2], p[3]};
                }
            } catch (RuntimeException e) {
                // a damaged entry is a miss: looked up again and written over
            }
        }
        String imageUrl = "", video = "";
        try {
            JSONArray results = new JSONObject(get("https://itunes.apple.com/search?term=" + URLEncoder.encode(name, "UTF-8")
                    + "&entity=musicArtist&attribute=artistTerm&limit=200&country=" + country)).optJSONArray("results");
            long id = artistId(results, name);
            if (id > 0) {
                JSONObject root = AppleCanvas.catalog(country + "/artists/" + id + "?art%5Burl%5D=c,f" + (videos ? "&extend=editorialVideo" : "")
                        + "&format%5Bresources%5D=map&platform=web" + (lang.isEmpty() ? "" : "&l=" + lang + "-" + country));
                JSONObject a = null;
                JSONObject res = root.optJSONObject("resources");
                JSONObject arts = res == null ? null : res.optJSONObject("artists");
                if (arts != null && arts.optJSONObject(String.valueOf(id)) != null) a = arts.getJSONObject(String.valueOf(id)).optJSONObject("attributes");
                if (a == null && root.optJSONArray("data") != null && root.getJSONArray("data").length() > 0)
                    a = root.getJSONArray("data").getJSONObject(0).optJSONObject("attributes");
                if (a != null) {
                    if (images) {
                        String u = image(a.optJSONObject("artwork"));
                        if (u != null) imageUrl = u;
                    }
                    if (videos) {
                        String m = motion(a.optJSONObject("editorialVideo"));
                        Integer cap = "orig".equals(quality) ? null : Integer.valueOf(quality);
                        File f = m == null ? null : HlsClip.fetch(m, cacheDir, 1080, cap);
                        if (f != null) video = f.getAbsolutePath();
                    }
                }
            }
            Log.i(TAG, "artist header: '" + name + "' id " + id + ", image " + !imageUrl.isEmpty() + ", video " + !video.isEmpty());
        } catch (Throwable t) {
            Log.w(TAG, "artist header: '" + name + "' failed (not kept): " + t);
            return null;
        }
        boolean shortLived = (imageUrl.isEmpty() && video.isEmpty()) || (videos && video.isEmpty());
        store.edit().putString(key, System.currentTimeMillis() + "\t" + (shortLived ? "1" : "0") + "\t" + imageUrl + "\t" + video).apply();
        return new String[]{imageUrl, video};
    }

    private static String get(String url) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(10_000);
        c.setReadTimeout(15_000);
        try (InputStream in = c.getInputStream()) {
            java.io.ByteArrayOutputStream b = new java.io.ByteArrayOutputStream();
            // the iTunes search answer (200 artists at most): a few hundred KB
            HlsClip.capped(in, b, 8L * 1024 * 1024);
            return b.toString("UTF-8");
        } finally {
            c.disconnect();
        }
    }

    // ---- on the artist page ----

    private static String shownFor, asking;
    private static FrameLayout box;
    private static MediaPlayer player;
    private static Surface surface;
    /** canvas.md §13 rule 4, asked at most every 2 s (this runs on every frame). */
    private static boolean onMobile;
    private static long mobileAskedAt;

    static void tick(Activity a, View decor) {
        // switched off for this run after it kept failing (Features.failed)
        if ("0".equals(Features.props().getProperty("artistHeader"))) {
            if (box != null) clear();
            return;
        }
        boolean images = imagesOn(), videos = videosOn();
        if (videos) {
            long now = android.os.SystemClock.uptimeMillis();
            if (now - mobileAskedAt > 2000) {
                mobileAskedAt = now;
                onMobile = CanvasSettings.blockedByMobile(a, Features.props());
            }
            // "Off on mobile data": no artist video looked up or played (the image stays)
            if (onMobile) videos = false;
        }
        int hid = a.getResources().getIdentifier("music_element_header_container", "id", a.getPackageName());
        View header = hid == 0 ? null : decor.findViewById(hid);
        String name = header instanceof ViewGroup && header.isShown() ? findName((ViewGroup) header) : null;
        if ((!images && !videos) || name == null) {
            if (box != null && (name == null || !box.isAttachedToWindow() || (!images && !videos))) clear();
            return;
        }
        String want = name + "|" + images + "|" + videos + "|" + quality();
        // shown here, or asked already with nothing to show (a miss is not asked again on every tick)
        if (want.equals(shownFor) && (box == null || box.getParent() == header)) return;
        if (want.equals(asking)) return;
        clear();
        asking = want;
        final ViewGroup host = (ViewGroup) header;
        final String q = quality();
        final File dir = a.getCacheDir();
        final boolean vids = videos;
        new Thread(() -> {
            String[] r = lookup(name, images, vids, q, dir);
            Bitmap bmp = null;
            if (r != null && !r[0].isEmpty()) bmp = bitmap(r[0]);
            final Bitmap img = bmp;
            main.post(() -> {
                if (!want.equals(asking)) return;
                asking = null;
                shownFor = want;
                if (r == null || (img == null && r[1].isEmpty()) || !host.isAttachedToWindow()) return;
                show(a, host, img, r[1]);
            });
        }, "ayham-artist-header").start();
    }

    /** The subscribe button's description names the artist (the header is drawn, not views). */
    private static String findName(ViewGroup g) {
        for (int i = 0; i < g.getChildCount(); i++) {
            View c = g.getChildAt(i);
            String n = nameFrom(c.getContentDescription());
            if (n != null) return n;
            if (c instanceof ViewGroup) {
                n = findName((ViewGroup) c);
                if (n != null) return n;
            }
        }
        return null;
    }

    private static View subscribe(ViewGroup g) {
        for (int i = 0; i < g.getChildCount(); i++) {
            View c = g.getChildAt(i);
            if (nameFrom(c.getContentDescription()) != null) return c;
            if (c instanceof ViewGroup) {
                View v = subscribe((ViewGroup) c);
                if (v != null) return v;
            }
        }
        return null;
    }

    private static Bitmap bitmap(String url) {
        try {
            HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
            c.setConnectTimeout(10_000);
            c.setReadTimeout(15_000);
            try (InputStream in = c.getInputStream()) {
                return BitmapFactory.decodeStream(in);
            } finally {
                c.disconnect();
            }
        } catch (Throwable t) {
            Log.w(TAG, "artist header: image not loaded: " + t);
            return null;
        }
    }

    /** Over YT's header image, down to just above the artist's name; its lower edge fades into YT's. */
    private static void show(Activity a, ViewGroup host, Bitmap img, String video) {
        View sub = subscribe(host);
        int[] h = new int[2], s = new int[2];
        host.getLocationOnScreen(h);
        int bottom = host.getHeight();
        if (sub != null) {
            sub.getLocationOnScreen(s);
            // the name sits about 2.2 button heights above the button
            bottom = Math.max(host.getHeight() / 3, s[1] - h[1] - Math.round(sub.getHeight() * 2.2f));
        }
        box = new FrameLayout(a);
        box.setClipChildren(true);
        if (img != null) {
            ImageView iv = new ImageView(a);
            iv.setScaleType(ImageView.ScaleType.CENTER_CROP);
            iv.setImageBitmap(img);
            box.addView(iv, new FrameLayout.LayoutParams(-1, -1));
        }
        if (!video.isEmpty()) {
            TextureView tv = new TextureView(a);
            tv.setAlpha(0f);
            tv.setSurfaceTextureListener(new TextureView.SurfaceTextureListener() {
                @Override
                public void onSurfaceTextureAvailable(SurfaceTexture st, int w, int hh) {
                    release(); // one player at a time
                    try {
                        MediaPlayer mp = new MediaPlayer();
                        player = mp;
                        mp.setDataSource(video);
                        surface = new Surface(st);
                        mp.setSurface(surface);
                        mp.setLooping(true);
                        mp.setVolume(0f, 0f);
                        mp.setOnVideoSizeChangedListener((m, vw, vh) -> crop(tv, vw, vh));
                        mp.setOnPreparedListener(m -> {
                            if (m != player) return; // released meanwhile
                            m.start();
                            tv.animate().alpha(1f).setDuration(400).start();
                        });
                        mp.setOnErrorListener((m, what, extra) -> {
                            Log.w(TAG, "artist header: video error " + what + "/" + extra);
                            if (m == player) release();
                            return true;
                        });
                        mp.prepareAsync();
                    } catch (Throwable t) {
                        Log.w(TAG, "artist header: video not played: " + t);
                        release();
                    }
                }

                @Override
                public void onSurfaceTextureSizeChanged(SurfaceTexture st, int w, int hh) {
                }

                @Override
                public boolean onSurfaceTextureDestroyed(SurfaceTexture st) {
                    release();
                    return true;
                }

                @Override
                public void onSurfaceTextureUpdated(SurfaceTexture st) {
                }
            });
            box.addView(tv, new FrameLayout.LayoutParams(-1, -1));
        }
        // the lower fifth fades out, so YT's own picture and the name's shade carry on below
        View fade = new View(a);
        fade.setBackground(new android.graphics.drawable.GradientDrawable(android.graphics.drawable.GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{0x00000000, 0x00000000, 0xFF000000}));
        box.addView(fade, new FrameLayout.LayoutParams(-1, -1));
        // above YT's drawn header, under the toolbar (its sibling, drawn after)
        host.addView(box, new FrameLayout.LayoutParams(-1, bottom));
        Log.i(TAG, "artist header: shown (" + (img != null ? "image" : "") + (video.isEmpty() ? "" : " video") + "), " + bottom + " px tall");
    }

    private static void crop(TextureView tv, int vw, int vh) {
        int w = tv.getWidth(), h = tv.getHeight();
        if (vw <= 0 || vh <= 0 || w <= 0 || h <= 0) return;
        float s = Math.max(w / (float) vw, h / (float) vh);
        android.graphics.Matrix m = new android.graphics.Matrix();
        m.setScale(vw * s / w, vh * s / h, w / 2f, h / 2f);
        tv.setTransform(m);
    }

    private static void release() {
        if (player != null) {
            try {
                player.release();
            } catch (Throwable ignored) {
            }
            player = null;
        }
        if (surface != null) {
            surface.release();
            surface = null;
        }
    }

    /** The header of a destroyed activity let go: its views would keep the activity alive. */
    static void forget(Activity a) {
        if (box != null && box.getContext() == a) {
            clear();
            asking = null;
        }
    }

    private static void clear() {
        release();
        if (box != null && box.getParent() instanceof ViewGroup) ((ViewGroup) box.getParent()).removeView(box);
        box = null;
        shownFor = null;
    }
}
