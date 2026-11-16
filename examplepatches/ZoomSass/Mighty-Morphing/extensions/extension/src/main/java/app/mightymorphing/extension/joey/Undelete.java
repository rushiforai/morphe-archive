package app.mightymorphing.extension.joey;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Layout;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ReplacementSpan;
import android.text.style.URLSpan;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Pattern;

/**
 * Restore via Arctic Shift. A removed or deleted comment, or the removed post at the top of the
 * comments screen, gets a Restore button. Nothing is fetched until it is tapped.
 * Works with or without Modern UI: it only touches Joey's own comment and post text.
 */
public final class Undelete {
    private static final String SCHEME = "morphe-undelete:";
    private static final String API = "https://arctic-shift.photon-reddit.com/api/";
    private static final String HTML_DISPLAY = "o.o.joey.CustomViews.HtmlDispaly";
    /** A bad ID fails the whole request, so only plain Reddit IDs are ever sent. */
    private static final Pattern ID = Pattern.compile("[a-z0-9]{1,16}");
    private static final long STILL_TRYING_MS = 6000;

    private static final int IDLE = 0;
    private static final int LOADING = 1;
    private static final int FOUND = 2;
    private static final int MISSING = 3;
    private static final int FAILED = 4;
    private static final int SLOW = 5;
    private static final int BUSY = 6;

    private static final Map<String, Entry> ENTRIES = new HashMap<>();
    /** Every tap runs at once; one slow answer never holds up another. */
    private static final ExecutorService NET = Executors.newCachedThreadPool();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** Text views showing a restore button, so a result can find the item wherever it is now. */
    private static final Map<TextView, Boolean> SHOWN = new WeakHashMap<>();
    private static Boolean enabled;
    private static boolean ticking;

    private Undelete() {
    }

    private static final class Entry {
        final boolean post;
        final String id;
        final String word;
        int state = IDLE;
        long started;
        String html;
        String author;
        WeakReference<View> display;

        Entry(boolean post, String id, String word) {
            this.post = post;
            this.id = id;
            this.word = word;
        }

        String key() {
            return (post ? "t3_" : "t1_") + id;
        }
    }

    private static final class BusyException extends Exception {
    }

    // ---- Settings ----

    static void setEnabled(boolean on) {
        enabled = on;
    }

    private static boolean enabled() {
        if (enabled == null) {
            Context context = appContext();
            enabled = context != null && MorpheSettings.undelete(context);
        }
        return enabled;
    }

    private static Context appContext() {
        try {
            return (Context) Class.forName("o.o.joey.MyApplication").getMethod("p").invoke(null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    // ---- Joey hooks ----

    /**
     * n9.k.D: the comment's HTML, either from W() or Joey's own "[deleted]" label (used when the
     * author and the text are both [deleted], which is how a comment its author deleted arrives).
     */
    public static String comment(Object comment, String html) {
        try {
            if (comment == null || !enabled()) return html;
            Object node = json(comment);
            String word = word(text(node, "body"));
            if (word == null) return html;
            String id = text(node, "id");
            if (id == null || !ID.matcher(id).matches()) return html;
            return render(entry(false, id, word));
        } catch (Throwable ignored) {
            return html;
        }
    }

    /**
     * jc.d.D, the post text, only on the comments screen. Returns true when the removed post's
     * text was shown here, so Joey skips its own.
     */
    public static boolean post(Object submission, View display) {
        try {
            if (submission == null || display == null || !enabled()) return false;
            Object node = json(submission);
            String word = word(text(node, "selftext"));
            if (word == null) {
                String category = text(node, "removed_by_category");
                if (category == null || category.isEmpty()) return false;
                word = "deleted".equals(category) ? "deleted" : "removed";
            }
            String id = text(node, "id");
            if (id == null || !ID.matcher(id).matches()) return false;
            Entry entry = entry(true, id, word);
            entry.display = new WeakReference<>(display);
            display.setVisibility(View.VISIBLE);
            return show(display, render(entry));
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** HtmlDispaly.s: the restore link never gets a link preview card. */
    public static String previewHref(String href) {
        return href != null && href.startsWith(SCHEME) ? "" : href;
    }

    /** HTMLTextView.setSpannable: the restore link becomes a small button in the theme's link colour. */
    public static void chips(TextView view, SpannableStringBuilder text) {
        try {
            if (view == null || text == null || text.length() == 0) return;
            boolean any = false;
            for (URLSpan span : text.getSpans(0, text.length(), URLSpan.class)) {
                String url = span.getURL();
                if (url == null || !url.startsWith(SCHEME)) continue;
                int start = text.getSpanStart(span);
                int end = text.getSpanEnd(span);
                if (start < 0 || end <= start) continue;
                for (ChipSpan old : text.getSpans(start, end, ChipSpan.class)) text.removeSpan(old);
                text.setSpan(new ChipSpan(url.substring(SCHEME.length()), view), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                any = true;
            }
            if (any) {
                SHOWN.put(view, Boolean.TRUE);
                tick();
            }
        } catch (Throwable ignored) {
        }
    }

    /** xa.n.onTouchEvent, Joey's link touch handler. Takes taps on the restore button only. */
    public static boolean touch(TextView view, Spannable text, MotionEvent event) {
        try {
            int action = event.getActionMasked();
            if (action != MotionEvent.ACTION_DOWN && action != MotionEvent.ACTION_UP) return false;
            URLSpan span = spanAt(view, text, event);
            if (span == null || span.getURL() == null || !span.getURL().startsWith(SCHEME)) return false;
            // Joey passes a tap on comment text to the whole comment, which collapses it. Android
            // queues that click before this runs, so it is cancelled here: the tap is the button's.
            view.cancelLongPress();
            view.cancelPendingInputEvents();
            view.setPressed(false);
            if (action == MotionEvent.ACTION_UP) tapped(view, span.getURL().substring(SCHEME.length()));
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    // ---- Tap and fetch ----

    private static void tapped(TextView view, String key) {
        Entry entry = ENTRIES.get(key);
        if (entry == null || entry.state == LOADING || entry.state == FOUND || entry.state == MISSING) return;
        View display = displayOf(view);
        if (display != null && entry.post) entry.display = new WeakReference<>(display);
        entry.state = LOADING;
        entry.started = SystemClock.uptimeMillis();
        refresh(entry);
        tick();
        NET.execute(() -> {
            int state;
            String html = null;
            String author = null;
            try {
                JSONObject item = fetch(entry);
                if (item == null) {
                    state = MISSING;
                } else {
                    author = item.optString("author", null);
                    html = archivedHtml(entry, item);
                    state = html == null ? MISSING : FOUND;
                }
            } catch (SocketTimeoutException slow) {
                state = SLOW;
            } catch (BusyException busy) {
                state = BUSY;
            } catch (Throwable error) {
                state = FAILED;
            }
            int done = state;
            String doneHtml = html;
            String doneAuthor = author;
            MAIN.post(() -> {
                entry.state = done;
                entry.html = doneHtml;
                entry.author = doneAuthor;
                refresh(entry);
            });
        });
    }

    private static JSONObject fetch(Entry entry) throws Exception {
        URL url = new URL(API + (entry.post ? "posts" : "comments") + "/ids?ids=" + entry.id + "&md2html=true");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        try {
            // About 15 seconds at most, then the button says the archive is slow.
            connection.setConnectTimeout(7000);
            connection.setReadTimeout(8000);
            connection.setRequestProperty("User-Agent", "MightyMorphing-Joey");
            connection.setRequestProperty("Accept", "application/json");
            int code = connection.getResponseCode();
            if (code == 429 || code >= 500) throw new BusyException();
            if (code != 200) throw new IllegalStateException("HTTP " + code);
            JSONArray data = new JSONObject(read(connection.getInputStream())).optJSONArray("data");
            return data == null || data.length() == 0 ? null : data.optJSONObject(0);
        } finally {
            connection.disconnect();
        }
    }

    private static String read(InputStream in) throws Exception {
        try (InputStream stream = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int n;
            while ((n = stream.read(buffer)) > 0) out.write(buffer, 0, n);
            return out.toString("UTF-8");
        }
    }

    /** What the archive saved. A copy taken after the removal is no help, so it counts as missing. */
    private static String archivedHtml(Entry entry, JSONObject item) {
        String text = item.optString(entry.post ? "selftext" : "body", "");
        if (word(text) != null) return null;
        String html = item.optString(entry.post ? "selftext_html" : "body_html", "");
        if (html.isEmpty() || "null".equals(html)) html = null;
        if (html == null && !text.trim().isEmpty()) html = "<p>" + escape(text).replace("\n", "<br>") + "</p>";
        if (entry.post) {
            String media = mediaNote(item);
            if (media != null) html = html == null ? media : media + html;
        }
        return html;
    }

    /**
     * Arctic Shift keeps text, not files. Reddit's own images and videos usually go when the post
     * is deleted, so they get a plain note. A link to another site is kept: it often still works.
     */
    private static String mediaNote(JSONObject item) {
        String link = item.optString("url", "");
        if (item.optBoolean("is_self", false) || !link.startsWith("http")) return null;
        JSONObject gallery = item.optJSONObject("gallery_data");
        JSONArray items = gallery == null ? null : gallery.optJSONArray("items");
        if (item.optBoolean("is_gallery", false) || link.contains("reddit.com/gallery/")) {
            int count = items == null ? 0 : items.length();
            return count > 0 ? "<p>Gallery of " + count + (count == 1 ? " image" : " images") + ". The images aren't archived.</p>"
                    : "<p>Gallery. The images aren't archived.</p>";
        }
        if (link.contains("v.redd.it")) return "<p>Video not archived.</p>";
        if (link.contains("i.redd.it") || link.contains("preview.redd.it")) return "<p>Image not archived.</p>";
        return "<p><a href=\"" + escape(link) + "\">" + escape(link) + "</a></p>";
    }

    // ---- Rendering ----

    private static Entry entry(boolean post, String id, String word) {
        String key = (post ? "t3_" : "t1_") + id;
        Entry entry = ENTRIES.get(key);
        if (entry == null) {
            entry = new Entry(post, id, word);
            ENTRIES.put(key, entry);
        }
        return entry;
    }

    private static String render(Entry entry) {
        String what = (entry.post ? "Post " : "Comment ") + entry.word;
        switch (entry.state) {
            case FOUND:
                String by = entry.author == null || entry.author.isEmpty() || entry.author.startsWith("[")
                        ? "" : " · u/" + escape(entry.author);
                return "<p><em>Restored via Arctic Shift" + by + "</em></p><blockquote>" + entry.html + "</blockquote>";
            case MISSING:
                return "<p><em>" + what + ". Not archived. It may have been removed before Arctic Shift saved it.</em></p>";
            default:
                // The button draws its own label from the state (ChipSpan); this text is its fallback.
                return "<p><em>" + what + "</em> <a href=\"" + SCHEME + entry.key() + "\">" + label(entry) + "</a></p>";
        }
    }

    /** Words on the button. While loading, the dots are drawn after them and animate. */
    private static String label(Entry entry) {
        switch (entry.state) {
            case LOADING:
                return SystemClock.uptimeMillis() - entry.started > STILL_TRYING_MS ? "Still trying" : "Restoring";
            case SLOW:
                return "Arctic Shift is slow · Try again";
            case BUSY:
                return "Arctic Shift is busy · Try again";
            case FAILED:
                return "Couldn't reach Arctic Shift · Try again";
            default:
                return "Restore";
        }
    }

    /** Redraws the item wherever it is on screen now. Off screen, its next bind shows the result. */
    private static void refresh(Entry entry) {
        String url = SCHEME + entry.key();
        String html = render(entry);
        List<View> displays = new ArrayList<>();
        for (TextView view : new ArrayList<>(SHOWN.keySet())) {
            if (view == null || !view.isAttachedToWindow() || !holds(view, url)) continue;
            View display = displayOf(view);
            if (display != null && !displays.contains(display)) displays.add(display);
        }
        View kept = entry.display == null ? null : entry.display.get();
        if (entry.post && kept != null && kept.isAttachedToWindow() && !displays.contains(kept)) displays.add(kept);
        for (View display : displays) show(display, html);
    }

    private static boolean show(View display, String html) {
        try {
            ClassLoader loader = display.getContext().getClassLoader();
            Class<?> type = Class.forName(HTML_DISPLAY, true, loader);
            Class<?> mode = Class.forName(HTML_DISPLAY + "$g", true, loader);
            Object normal = mode.getField("b").get(null);
            Method set = type.getMethod("setTextHtml", String.class, mode);
            set.invoke(display, html, normal);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Animates the dots while anything is restoring; the label turns to "Still trying" in time. */
    private static void tick() {
        if (ticking) return;
        boolean loading = false;
        for (Entry entry : ENTRIES.values()) {
            if (entry.state == LOADING) {
                loading = true;
                break;
            }
        }
        if (!loading) return;
        ticking = true;
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                boolean still = false;
                for (Entry entry : ENTRIES.values()) {
                    if (entry.state == LOADING) {
                        still = true;
                        break;
                    }
                }
                for (TextView view : new ArrayList<>(SHOWN.keySet())) {
                    if (view != null && view.isAttachedToWindow()) view.invalidate();
                }
                if (still) {
                    MAIN.postDelayed(this, 350);
                } else {
                    ticking = false;
                }
            }
        }, 350);
    }

    /** The restore button: a rounded outline in the link colour, a small restore mark, the label. */
    private static final class ChipSpan extends ReplacementSpan {
        private final String key;
        private final int color;
        private final float density;

        ChipSpan(String key, TextView view) {
            this.key = key;
            this.color = view.getLinkTextColors().getDefaultColor();
            this.density = view.getResources().getDisplayMetrics().density;
        }

        private Entry entry() {
            return ENTRIES.get(key);
        }

        private String text() {
            Entry entry = entry();
            return entry == null ? "Restore" : label(entry);
        }

        private float labelSize(Paint paint) {
            return paint.getTextSize() * 0.9f;
        }

        /** The button itself: padding, mark, gap, label. While loading, room for "Still trying" and the dots. */
        private float chipWidth(Paint paint) {
            Paint measure = new Paint(paint);
            measure.setTextSize(labelSize(paint));
            Entry entry = entry();
            boolean loading = entry != null && entry.state == LOADING;
            float width = measure.measureText(loading ? "Still trying" : text());
            if (loading) width += 20 * density;
            return 11 * density + 10 * density + 7 * density + width + 13 * density;
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            if (fm != null) {
                // A little taller than the text, so the button has room above and below.
                Paint.FontMetricsInt real = paint.getFontMetricsInt();
                // Only a little: the outline uses the line's own spacing, so the row stays near its usual height.
                // Exactly the outline's reach past the text (rise in draw), so nothing is clipped.
                int extra = Math.round(3 * density);
                fm.ascent = real.ascent - extra;
                fm.descent = real.descent + extra;
                fm.top = real.top - extra;
                fm.bottom = real.bottom + extra;
            }
            return Math.round(8 * density + chipWidth(paint) + 4 * density);
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
            Paint.Style style = paint.getStyle();
            int oldColor = paint.getColor();
            float oldSize = paint.getTextSize();
            float oldStroke = paint.getStrokeWidth();
            boolean oldUnderline = paint.isUnderlineText();
            Paint.FontMetrics metrics = paint.getFontMetrics();
            float left = x + 8 * density;
            float rise = 3 * density;
            RectF box = new RectF(left, y + metrics.ascent - rise, left + chipWidth(paint), y + metrics.descent + rise);
            float radius = box.height() / 2f;

            paint.setUnderlineText(false);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(Math.max(1f, density));
            paint.setColor(color);
            canvas.drawRoundRect(box, radius, radius, paint);

            // A small circular arrow.
            float r = 5f * density;
            float cx = box.left + 11 * density + r;
            float cy = box.centerY();
            canvas.drawArc(new RectF(cx - r, cy - r, cx + r, cy + r), -60, 290, false, paint);
            paint.setStyle(Paint.Style.FILL);
            float ax = cx + r * (float) Math.cos(Math.toRadians(-60));
            float ay = cy + r * (float) Math.sin(Math.toRadians(-60));
            Path head = new Path();
            head.moveTo(ax + 2.5f * density, ay - 1.5f * density);
            head.lineTo(ax - 1.5f * density, ay - 2.5f * density);
            head.lineTo(ax - 0.5f * density, ay + 2f * density);
            head.close();
            canvas.drawPath(head, paint);

            paint.setTextSize(labelSize(paint));
            String label = text();
            float textX = cx + r + 7 * density;
            Paint.FontMetrics small = paint.getFontMetrics();
            float baseline = cy - (small.ascent + small.descent) / 2f;
            canvas.drawText(label, textX, baseline, paint);

            Entry entry = entry();
            if (entry != null && entry.state == LOADING) {
                float dotsX = textX + paint.measureText(label) + 6 * density;
                int phase = (int) ((SystemClock.uptimeMillis() / 350) % 3);
                for (int i = 0; i < 3; i++) {
                    paint.setAlpha(i == phase ? 255 : 90);
                    canvas.drawCircle(dotsX + i * 5 * density, cy, 1.6f * density, paint);
                }
                paint.setAlpha(255);
            }

            paint.setStyle(style);
            paint.setColor(oldColor);
            paint.setTextSize(oldSize);
            paint.setStrokeWidth(oldStroke);
            paint.setUnderlineText(oldUnderline);
        }
    }

    // ---- Helpers ----

    /** "removed" or "deleted" when Reddit replaced the text, otherwise null. */
    private static String word(String text) {
        if (text == null) return null;
        String trimmed = text.trim();
        if ("[removed]".equals(trimmed)) return "removed";
        if ("[deleted]".equals(trimmed)) return "deleted";
        return null;
    }

    private static Object json(Object model) throws Exception {
        return model.getClass().getMethod("n").invoke(model);
    }

    private static String text(Object node, String field) {
        try {
            if (node == null) return null;
            Object value = node.getClass().getMethod("get", String.class).invoke(node, field);
            if (value == null) return null;
            Object isNull = value.getClass().getMethod("isNull").invoke(value);
            if (Boolean.TRUE.equals(isNull)) return null;
            return (String) value.getClass().getMethod("asText").invoke(value);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String escape(String text) {
        return text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }

    private static View displayOf(View view) {
        View cursor = view;
        while (cursor != null) {
            if (cursor.getClass().getName().equals(HTML_DISPLAY)) return cursor;
            cursor = cursor.getParent() instanceof View ? (View) cursor.getParent() : null;
        }
        return null;
    }

    /** True when a text inside this view still carries the given restore link. */
    private static boolean holds(View view, String url) {
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            if (text instanceof Spanned) {
                for (URLSpan span : ((Spanned) text).getSpans(0, text.length(), URLSpan.class)) {
                    if (url.equals(span.getURL())) return true;
                }
            }
            return false;
        }
        if (!(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (holds(group.getChildAt(i), url)) return true;
        }
        return false;
    }

    private static URLSpan spanAt(TextView view, Spannable text, MotionEvent event) {
        Layout layout = view.getLayout();
        if (layout == null) return null;
        int x = (int) event.getX() - view.getTotalPaddingLeft() + view.getScrollX();
        int y = (int) event.getY() - view.getTotalPaddingTop() + view.getScrollY();
        int line = layout.getLineForVertical(y);
        if (x < layout.getLineLeft(line) || x > layout.getLineRight(line)) return null;
        int offset = layout.getOffsetForHorizontal(line, x);
        URLSpan[] spans = text.getSpans(offset, offset, URLSpan.class);
        return spans.length == 0 ? null : spans[0];
    }
}
