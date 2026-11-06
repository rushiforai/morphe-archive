package app.orangetree.ytmaitag.extension;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ReplacementSpan;
import android.util.Log;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Pattern;

/**
 * Appends an AI-use tag to text that names an artist on the community AI-artist list.
 * Called from every Litho text component and every YouTubeTextView.setText().
 */
@SuppressWarnings("unused")
public final class AiTagPatch {
    private static final String TAG = "YTMAiTag";

    private static final String LIST_URL =
            "https://raw.githubusercontent.com/CennoxX/spotify-ai-blocker/main/SpotifyAiArtists.csv";
    private static final long LIST_MAX_AGE_MS = 24L * 60 * 60 * 1000;
    private static final String CACHE_FILE = "ytm_ai_tag_artists.csv";

    static final String COMMUNITY_TAG = "AI";
    static final int COMMUNITY_COLOR = 0xFF1565C0; // blue

    /** Normalized artist name -> original name. Replaced as a whole, never mutated. */
    private static volatile Map<String, String> artists = Collections.emptyMap();
    private static volatile boolean loadStarted;

    private static final Pattern SEGMENT_SPLIT = Pattern.compile("\\s+[•·]\\s+");
    private static final Pattern NAME_SPLIT = Pattern.compile(
            "\\s*(?:,|&|\\bx\\b|\\bfeat\\.?|\\bft\\.?|\\band\\b)\\s*", Pattern.CASE_INSENSITIVE);
    private static final Pattern WHITESPACE = Pattern.compile("\\s+");

    /** Small cache of text -> matched artist ("" for no match). */
    private static final Map<String, String> matchCache = new LinkedHashMap<String, String>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > 1000;
        }
    };

    // Diagnostics, shown as toasts while the patch is being tested.
    private static final boolean DIAGNOSTICS = false;
    private static final AtomicInteger lithoCalls = new AtomicInteger();
    private static final AtomicInteger viewCalls = new AtomicInteger();
    private static final AtomicInteger tagged = new AtomicInteger();
    private static volatile String listStatus = "loading";

    private AiTagPatch() {
    }

    // ---------------------------------------------------------------- hooks

    /** Litho text components. */
    public static CharSequence onLithoText(CharSequence text) {
        lithoCalls.incrementAndGet();
        return onText(text);
    }

    /** YouTubeTextView.setText(). */
    public static CharSequence onViewText(CharSequence text) {
        viewCalls.incrementAndGet();
        return onText(text);
    }

    public static CharSequence onText(CharSequence text) {
        try {
            if (text == null) return null;
            final int len = text.length();
            if (len < 2 || len > 400) return text;

            if (!loadStarted) startLoad();
            if (artists.isEmpty()) return text;

            if (text instanceof Spanned
                    && ((Spanned) text).getSpans(0, len, TagSpan.class).length > 0) {
                return text; // Already tagged.
            }

            final String s = text.toString();
            if (s.startsWith(COMMUNITY_TAG + "  ")) return text; // Already tagged.

            if (match(s) == null) return text;

            // Tag goes first so it is never cut off by "…" on narrow rows and cards.
            SpannableStringBuilder out = new SpannableStringBuilder(text);
            out.insert(0, COMMUNITY_TAG + "  ");
            out.setSpan(new TagSpan(COMMUNITY_COLOR), 0, COMMUNITY_TAG.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            tagged.incrementAndGet();
            return out;
        } catch (Throwable t) {
            Log.e(TAG, "onText failure", t);
            return text;
        }
    }

    // ------------------------------------------------------------ matching

    static String normalize(String s) {
        String n = Normalizer.normalize(s, Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);
        if (n.endsWith(" - topic")) n = n.substring(0, n.length() - 8);
        return WHITESPACE.matcher(n).replaceAll(" ").trim();
    }

    /** @return the matched artist's name, or null. */
    private static String match(String s) {
        synchronized (matchCache) {
            String cached = matchCache.get(s);
            if (cached != null) return cached.isEmpty() ? null : cached;
        }

        Map<String, String> list = artists;
        String hit = null;
        outer:
        for (String segment : SEGMENT_SPLIT.split(s)) {
            String whole = list.get(normalize(segment));
            if (whole != null) {
                hit = whole;
                break;
            }
            for (String name : NAME_SPLIT.split(segment)) {
                if (name.length() < 2) continue;
                String h = list.get(normalize(name));
                if (h != null) {
                    hit = h;
                    break outer;
                }
            }
        }

        synchronized (matchCache) {
            matchCache.put(s, hit == null ? "" : hit);
        }
        return hit;
    }

    // ---------------------------------------------------------- list loading

    private static synchronized void startLoad() {
        if (loadStarted) return;
        loadStarted = true;
        Thread t = new Thread(AiTagPatch::loadList, "YTMAiTag-list");
        t.setDaemon(true);
        t.start();
        if (DIAGNOSTICS) {
            Handler main = new Handler(Looper.getMainLooper());
            main.postDelayed(AiTagPatch::showStatus, 8000);
            main.postDelayed(AiTagPatch::showStatus, 30000);
        }
    }

    private static void showStatus() {
        try {
            Context context = getContext();
            if (context == null) return;
            String msg = "AI Tagger: list " + listStatus
                    + "\ntexts checked: " + lithoCalls.get() + " litho, " + viewCalls.get() + " views"
                    + "\ntags added: " + tagged.get();
            Toast.makeText(context, msg, Toast.LENGTH_LONG).show();
        } catch (Throwable t) {
            Log.e(TAG, "showStatus failure", t);
        }
    }

    private static void loadList() {
        try {
            Context context = getContext();
            if (context == null) listStatus = "error: no app context";
            File cache = context == null ? null : new File(context.getFilesDir(), CACHE_FILE);

            if (cache != null && cache.exists()) {
                setList(parseCsv(readAll(new FileInputStream(cache))));
                Log.i(TAG, "Artist list from cache: " + artists.size());
                listStatus = artists.size() + " artists (cached)";
                if (System.currentTimeMillis() - cache.lastModified() < LIST_MAX_AGE_MS) return;
            }

            HttpURLConnection conn = (HttpURLConnection) new URL(LIST_URL).openConnection();
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(30000);
            try {
                if (conn.getResponseCode() != 200) {
                    Log.w(TAG, "List download failed: " + conn.getResponseCode());
                    if (artists.isEmpty()) listStatus = "download failed: HTTP " + conn.getResponseCode();
                    return;
                }
                String csv = readAll(conn.getInputStream());
                if (!csv.startsWith("artist")) {
                    Log.w(TAG, "List download returned unexpected content");
                    if (artists.isEmpty()) listStatus = "download failed: unexpected content";
                    return;
                }
                setList(parseCsv(csv));
                Log.i(TAG, "Artist list downloaded: " + artists.size());
                listStatus = artists.size() + " artists (downloaded)";
                if (cache != null) {
                    try (FileOutputStream fos = new FileOutputStream(cache)) {
                        fos.write(csv.getBytes(StandardCharsets.UTF_8));
                    }
                }
            } finally {
                conn.disconnect();
            }
        } catch (Throwable t) {
            Log.e(TAG, "loadList failure", t);
            if (artists.isEmpty()) listStatus = "error: " + t;
        }
    }

    private static void setList(Map<String, String> list) {
        artists = list;
        synchronized (matchCache) {
            matchCache.clear();
        }
    }

    static Map<String, String> parseCsv(String text) {
        Map<String, String> map = new HashMap<>();
        String[] lines = text.split("\r?\n");
        for (int i = 1; i < lines.length; i++) {
            String line = lines[i];
            if (line.isEmpty()) continue;
            String name;
            if (line.startsWith("\"")) {
                int end = line.indexOf("\",", 1);
                name = (end == -1 ? line.substring(1) : line.substring(1, end)).replace("\"\"", "\"");
            } else {
                int comma = line.lastIndexOf(',');
                name = comma == -1 ? line : line.substring(0, comma);
            }
            String n = normalize(name);
            if (n.length() > 1) map.put(n, name);
        }
        return Collections.unmodifiableMap(map);
    }

    private static String readAll(InputStream in) throws java.io.IOException {
        try (InputStream is = in) {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[16384];
            int r;
            while ((r = is.read(buf)) != -1) bos.write(buf, 0, r);
            return bos.toString("UTF-8");
        }
    }

    @SuppressLint("PrivateApi")
    private static Context getContext() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            return (Application) at.getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            Log.e(TAG, "getContext failure", t);
            return null;
        }
    }

    // ------------------------------------------------------------- drawing

    /** Draws the spanned text as a small rounded, colored pill with white bold text. */
    static final class TagSpan extends ReplacementSpan {
        private static final float TEXT_SCALE = 0.72f;
        private final int color;

        TagSpan(int color) {
            this.color = color;
        }

        private Paint tagPaint(Paint base) {
            Paint p = new Paint(base);
            p.setTextSize(base.getTextSize() * TEXT_SCALE);
            p.setTypeface(Typeface.create(base.getTypeface(), Typeface.BOLD));
            p.setLetterSpacing(0.04f);
            p.setUnderlineText(false);
            return p;
        }

        private static float padding(Paint base) {
            return base.getTextSize() * 0.35f;
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            if (fm != null) paint.getFontMetricsInt(fm);
            Paint p = tagPaint(paint);
            return Math.round(p.measureText(text, start, end) + 2 * padding(paint));
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end,
                         float x, int top, int y, int bottom, Paint paint) {
            Paint p = tagPaint(paint);
            float pad = padding(paint);
            float width = p.measureText(text, start, end) + 2 * pad;

            Paint.FontMetrics base = paint.getFontMetrics();
            float centerY = y + (base.ascent + base.descent) / 2f;
            Paint.FontMetrics fm = p.getFontMetrics();
            float textHeight = fm.descent - fm.ascent;
            float boxHeight = textHeight + pad * 0.5f;

            RectF rect = new RectF(x, centerY - boxHeight / 2f, x + width, centerY + boxHeight / 2f);
            Paint bg = new Paint(Paint.ANTI_ALIAS_FLAG);
            bg.setColor(color);
            canvas.drawRoundRect(rect, pad * 0.6f, pad * 0.6f, bg);

            p.setColor(0xFFFFFFFF);
            float baseline = centerY - (fm.ascent + fm.descent) / 2f;
            canvas.drawText(text, start, end, x + pad, baseline, p);
        }
    }
}
