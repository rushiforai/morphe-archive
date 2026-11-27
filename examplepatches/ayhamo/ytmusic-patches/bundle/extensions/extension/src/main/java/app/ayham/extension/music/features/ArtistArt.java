package app.ayham.extension.music.features;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.Normalizer;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Artist colours: the Apple Music artist hero art and colour palette, as BitChord does.
 * Property artistArt=1. On each new artist: iTunes search -> the artist's music.apple.com page ->
 * its serialized-server-data JSON -> the header's hero artwork (url template + bgColor + textColor1).
 * The player page gets a backdrop of ours (palette background + the hero image fading out) behind
 * YT's views, and the BitChord panel takes the accent colour.
 */
final class ArtistArt {
    private static final String TAG = "AyhamArtistArt";
    private static final String UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36";
    private static final Handler main = new Handler(Looper.getMainLooper());
    /** Any answer read (the artist page, its hero image): both are a few MB at most. */
    private static final long MAX_ANSWER_BYTES = 16L * 1024 * 1024;
    /**
     * Looked-up artists, the last few only (each hero image is several MB). Filled by one thread
     * per artist change, so it is synchronized.
     */
    private static final Map<String, Art> cache = Collections.synchronizedMap(new LinkedHashMap<String, Art>(8, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Art> eldest) {
            return size() > 6;
        }
    });
    private static String shownFor;
    private static final ThreadLocal<Boolean> failedLookup = ThreadLocal.withInitial(() -> false);
    private static FrameLayout backdrop;
    private static ImageView hero;

    static final class Art {
        String heroUrl;
        int background, accent;
        Bitmap bitmap;
    }

    private ArtistArt() {
    }

    static boolean on() {
        return "1".equals(Features.props().getProperty("artistArt"));
    }

    static void tick(Activity a, View decor, ViewGroup page, boolean expanded) {
        if (!on()) {
            // Switched off in the settings, or by Features after repeated failures: our backdrop goes,
            // or it would stay on the page with its last alpha, also behind the mini player.
            if (backdrop != null) {
                if (backdrop.getParent() instanceof ViewGroup) ((ViewGroup) backdrop.getParent()).removeView(backdrop);
                backdrop = null;
                hero = null;
                shownFor = null;
                PlayerScreen.accent(0, 0);
                Log.i(TAG, "artist art switched off: backdrop removed");
            }
            return;
        }
        if (backdrop != null && backdrop.getParent() != page && (backdrop.getContext() == a || gone(backdrop.getContext()))) {
            // a new player page (or the activity was recreated): built again there; the old one,
            // and a destroyed activity it holds, let go
            if (backdrop.getParent() instanceof ViewGroup) ((ViewGroup) backdrop.getParent()).removeView(backdrop);
            backdrop = null;
            hero = null;
            shownFor = null;
        }
        if (backdrop != null) {
            // Fades with the page like the mesh: gone by the time it reaches the mini player, where
            // the artist photo and its palette colour would sit behind YT's white mini-player text.
            int[] at = new int[2];
            page.getLocationOnScreen(at);
            float shown = Math.max(0f, Math.min(1f, 1f - at[1] / (decor.getHeight() * 0.5f)));
            if (Math.abs(backdrop.getAlpha() - shown) > 0.01f) backdrop.setAlpha(shown);
        }
        View song = decor.findViewById(a.getResources().getIdentifier("current_song_view", "id", a.getPackageName()));
        View artistView = song == null ? null : song.findViewById(a.getResources().getIdentifier("artist", "id", a.getPackageName()));
        if (!(artistView instanceof TextView)) return;
        String text = ((TextView) artistView).getText().toString();
        String artist = clean(text), whole = name(text);
        if (artist.isEmpty() || artist.equals(shownFor)) return;
        shownFor = artist;
        if (backdrop == null) {
            backdrop = new FrameLayout(a);
            hero = new ImageView(a);
            hero.setScaleType(ImageView.ScaleType.CENTER_CROP);
            backdrop.addView(hero, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.round(page.getWidth() / 1.2f)));
            // Fade the hero image into the palette background.
            View fade = new View(a);
            fade.setTag("fade");
            backdrop.addView(fade, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.round(page.getWidth() / 1.2f)));
            page.addView(backdrop, 0, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            Log.i(TAG, "backdrop added at index 0 of " + page.getClass().getSimpleName() + " (children " + page.getChildCount() + ")");
        }
        backdrop.setVisibility(View.INVISIBLE);
        new Thread(() -> {
            long t0 = System.currentTimeMillis();
            boolean known = cache.containsKey(artist);
            failedLookup.set(false);
            // A band name with a comma or "&" ("Earth, Wind & Fire") is tried whole first, by its exact
            // name only; then the first artist of the credit, as before.
            Art found = known ? cache.get(artist) : whole.equals(artist) ? lookup(artist, false) : null;
            if (!known && found == null && !whole.equals(artist)) {
                found = lookup(whole, true);
                if (found == null) found = lookup(artist, false);
            }
            final Art art = found;
            // a lookup that failed (the network) is asked again next time, not saved as "no art"
            if (!known && !failedLookup.get()) cache.put(artist, art);
            long ms = System.currentTimeMillis() - t0;
            main.post(() -> {
                if (!artist.equals(shownFor)) return;
                apply(art);
                Log.i(TAG, "artist '" + artist + "': " + (art == null ? "no Apple art" : String.format(
                        "bg #%06x accent #%06x hero %s", art.background & 0xFFFFFF, art.accent & 0xFFFFFF,
                        art.bitmap == null ? "none" : art.bitmap.getWidth() + "x" + art.bitmap.getHeight())) + " in " + ms + " ms");
            });
        }).start();
    }

    private static boolean gone(android.content.Context c) {
        return c instanceof Activity && (((Activity) c).isDestroyed() || ((Activity) c).isFinishing());
    }

    private static void apply(Art art) {
        if (backdrop == null) return;
        if (art == null) {
            backdrop.setVisibility(View.INVISIBLE);
            PlayerScreen.accent(0, 0);
            return;
        }
        backdrop.setBackgroundColor(art.background);
        hero.setImageBitmap(art.bitmap);
        View fade = backdrop.findViewWithTag("fade");
        fade.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{art.background & 0x40FFFFFF, art.background & 0x00FFFFFF | 0x40000000, art.background}));
        backdrop.setVisibility(View.VISIBLE);
        PlayerScreen.accent(art.background, art.accent);
    }

    /** "Sabrina Carpenter • Short n' Sweet • 2024" -> "Sabrina Carpenter"; also drops " - Topic". */
    static String clean(String s) {
        // Several artists: the first one ("The Weeknd, Lily Rose Depp & Ramsey" -> "The Weeknd").
        return name(s).split("(?i),| & | x | feat\\.? | ft\\.? ")[0].trim();
    }

    /** The whole credit: "Earth, Wind & Fire • Gratitude • 1975" -> "Earth, Wind & Fire"; drops " - Topic". */
    static String name(String s) {
        int dot = s.indexOf(" • ");
        if (dot > 0) s = s.substring(0, dot);
        return s.replaceAll("(?i) - Topic$", "").trim();
    }

    private static String norm(String s) {
        return Normalizer.normalize(s.toLowerCase(), Normalizer.Form.NFD).replaceAll("[^\\p{L}\\p{N}]", "");
    }

    /** [exact]: only an artist with exactly this name (else the first search hit is taken). */
    /** The activity is destroyed: our views of its page go, so they don't keep it alive. */
    static void forget(android.app.Activity a) {
        if (backdrop != null && backdrop.getContext() == a) {
            if (backdrop.getParent() instanceof ViewGroup) ((ViewGroup) backdrop.getParent()).removeView(backdrop);
            backdrop = null;
            hero = null;
        }
    }

    private static Art lookup(String artist, boolean exact) {
        try {
            JSONArray results = new JSONObject(get("https://itunes.apple.com/search?term="
                    + URLEncoder.encode(artist, "UTF-8") + "&entity=musicArtist&limit=5")).getJSONArray("results");
            JSONObject hit = null;
            for (int i = 0; i < results.length(); i++) {
                if (norm(results.getJSONObject(i).optString("artistName")).equals(norm(artist))) {
                    hit = results.getJSONObject(i);
                    break;
                }
            }
            if (hit == null && !exact && results.length() > 0) hit = results.getJSONObject(0);
            if (hit == null || hit.optString("artistLinkUrl").isEmpty()) return null;
            String page = hit.getString("artistLinkUrl").split("\\?")[0];
            // only Apple's own pages, over https (canvas.md §4 rule 6's idea)
            if (!ArtistHeader.trusted(page, null)) return null;
            String html = get(page);
            int marker = html.indexOf("id=\"serialized-server-data\"");
            if (marker < 0) return null;
            int start = html.indexOf('>', marker) + 1;
            int end = html.indexOf("</script>", start);
            Object json = new org.json.JSONTokener(html.substring(start, end)).nextValue();
            JSONObject header = findHeader(json);
            if (header == null) return null;
            JSONObject heroArt = dict(header, "artwork");
            if (heroArt == null) heroArt = dict(header, "colorBackdropArtwork");
            if (heroArt == null) return null;
            Art art = new Art();
            art.background = color(heroArt.optString("bgColor"), 0xFF111111);
            art.accent = color(heroArt.optString("textColor1"), 0xFFFA2D48);
            String template = heroArt.optString("url");
            int w = heroArt.optInt("width"), h = heroArt.optInt("height");
            String heroUrl = template.replace("{w}", "1200").replace("{h}", String.valueOf(w > 0 ? Math.round(1200f * h / w) : 0))
                    .replace("{c}", "bb").replace("{f}", "jpg");
            // an image off Apple's hosts is not fetched: the palette still applies
            if (template.contains("{w}") && w > 0 && h > 0 && ArtistHeader.trusted(heroUrl, null)) {
                art.heroUrl = heroUrl;
                byte[] img = bytes(art.heroUrl);
                art.bitmap = BitmapFactory.decodeByteArray(img, 0, img.length);
            }
            return art;
        } catch (Throwable t) {
            Log.w(TAG, "Apple artist lookup failed for " + artist, t);
            failedLookup.set(true);
            return null;
        }
    }

    private static JSONObject dict(JSONObject header, String key) {
        JSONObject o = header.optJSONObject(key);
        return o == null ? null : o.optJSONObject("dictionary");
    }

    private static int color(String hex, int fallback) {
        return hex.matches("[0-9a-fA-F]{6}") ? Color.parseColor("#" + hex) : fallback;
    }

    private static JSONObject findHeader(Object node) {
        if (node instanceof JSONArray) {
            JSONArray a = (JSONArray) node;
            for (int i = 0; i < a.length(); i++) {
                JSONObject f = findHeader(a.opt(i));
                if (f != null) return f;
            }
        } else if (node instanceof JSONObject) {
            JSONObject o = (JSONObject) node;
            if (o.has("artistLogo") || o.has("colorBackdropArtwork")) return o;
            for (Iterator<String> it = o.keys(); it.hasNext(); ) {
                JSONObject f = findHeader(o.opt(it.next()));
                if (f != null) return f;
            }
        }
        return null;
    }

    private static String get(String url) throws Exception {
        return new String(bytes(url), "UTF-8");
    }

    private static byte[] bytes(String url) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setRequestProperty("User-Agent", UA);
        c.setConnectTimeout(8000);
        c.setReadTimeout(8000);
        try (InputStream in = c.getInputStream()) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            HlsClip.capped(in, out, MAX_ANSWER_BYTES);
            return out.toByteArray();
        } finally {
            c.disconnect();
        }
    }
}
