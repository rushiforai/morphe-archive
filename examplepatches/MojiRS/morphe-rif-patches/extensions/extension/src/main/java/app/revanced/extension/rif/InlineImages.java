package app.revanced.extension.rif;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ImageDecoder;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Editable;
import android.text.Layout;
import android.text.Selection;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.TextWatcher;
import android.text.style.ClickableSpan;
import android.text.style.ImageSpan;
import android.text.style.URLSpan;
import android.util.Log;
import android.util.LruCache;
import android.util.Size;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Inline comment images (static + animated GIFs).
 *
 * Two injection points:
 *  - {@link #embed(SpannableStringBuilder)} is called from rif's
 *    CommentThing.e(...) on a background thread, before the comment body is
 *    cached/shown. It overlays an ImageSpan on each image link, scaled to fit.
 *    Images not in the memory or disk cache (InlineCache) are loaded by InlineLoader
 *    and filled in later, a placeholder box standing in meanwhile. Animated GIFs
 *    (API 28+) decode to an AnimatedImageDrawable but are not started yet (no host
 *    view exists here).
 *  - {@link #attach(TextView)} is called from rif's comment ViewHolder bind
 *    (n2.o.h, right after setText) on the main thread. It wires each animated
 *    drawable's callback to the TextView and starts it, so frames invalidate
 *    only that TextView. Recycling to a different comment stops the drawables
 *    that left; an in-place rebind (e.g. a vote) leaves running GIFs alone.
 *
 * Multi-image imgur albums get an {@link AlbumImageSpan}: a fixed-size box showing one
 * image, with ◀ ▶ buttons and an "n/x" badge. Taps reach it through rif's own link
 * movement method (which dispatches any ClickableSpan); the tap position comes from a
 * touch listener installed by attach().
 *
 * Images are decoded for the full comment width, but replies are indented (narrower), so
 * attach() also shrinks each image to its TextView's actual text width once laid out.
 */
public final class InlineImages {

    private InlineImages() {}

    // Downloaded bytes cache (~24 MB), keyed by URL.
    private static final LruCache<String, byte[]> BYTES = new LruCache<String, byte[]>(24 * 1024 * 1024) {
        @Override
        protected int sizeOf(String key, byte[] value) {
            return value.length;
        }
    };

    // Per-TextView animation state: the animatables shown there, and the Drawable.Callback
    // wired to them. Drawable.setCallback() only keeps a WeakReference, so this map is
    // what keeps the callback alive. The callback holds the TextView weakly, so values
    // never pin their (weak) keys.
    private static final WeakHashMap<TextView, Bound> RUNNING = new WeakHashMap<>();

    private static final class Bound {
        final Drawable.Callback callback;
        List<Animatable> anims = Collections.emptyList();

        Bound(TextView tv) {
            callback = new ViewCallback(tv);
        }
    }

    // Resolved page-link -> image URL (or "" = the host says there's no image), to avoid
    // re-scraping.
    private static final LruCache<String, String> RESOLVED = new LruCache<>(256);
    // Lookup key ("og:" or "album:" + link) -> when it last failed (uptime ms). A failed
    // request is retried after RETRY_FAILED_MS rather than remembered for the session, so a
    // link comes back once the network does.
    private static final LruCache<String, Long> FAILED = new LruCache<>(256);
    private static final long RETRY_FAILED_MS = 2 * 60 * 1000;

    private static final String TAG = "RifInlineImages";
    // Browser-like UA; some CDNs reject unusual agents. Used for images and pages.
    static final String USER_AGENT =
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 rif-inline-images";
    private static final int MAX_DOWNLOAD_BYTES = 32 * 1024 * 1024;
    private static final int MAX_HTML_BYTES = 256 * 1024;
    private static final int MAX_JSON_BYTES = 2 * 1024 * 1024;

    // rif's own imgur API client ID (already shipped in the app and sent by its other imgur
    // requests). Used to list an album's images.
    private static final String IMGUR_AUTH = "Client-ID 4d7e2f74f1a519c";
    // imgur.com/a/<id> or imgur.com/gallery/<id> (plain ids only).
    private static final Pattern IMGUR_ALBUM = Pattern.compile(
            "^https?://(?:www\\.|m\\.)?imgur\\.com/(a|gallery)/([A-Za-z0-9]+)/?(?:[?#].*)?$",
            Pattern.CASE_INSENSITIVE);
    // Album link -> its items (Album.NONE = not listable; fall back to og:image).
    private static final LruCache<String, Album> ALBUMS = new LruCache<>(128);

    // Last touch position per TextView (recorded by TOUCH_LISTENER), so an album span's
    // onClick knows which part of the image was tapped. Values never reference keys.
    private static final WeakHashMap<View, float[]> LAST_TOUCH = new WeakHashMap<>();
    // A long press on an inline image selects the comment (the click a tap on its text
    // performs: rif's onListItemClick). It's timed by our own timer (ImageLongPress), so its
    // delay is configurable, rather than by the TextView's long click. Per TextView: the
    // pending timer; whether it fired during the current touch; and whether the TextView's
    // own long click fired (when our delay is the longer one).
    private static final WeakHashMap<View, Runnable> PENDING_LONG_PRESS = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> LONG_PRESSED = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> VIEW_LONG_PRESSED = new WeakHashMap<>();
    // Records the touch position and runs the long-press timer. Never consumes events, so
    // rif's own touch handling (its link movement method) runs as before. One exception: the
    // lift that ends a timed long press is turned into a cancel, since rif's movement method
    // would otherwise treat it as a tap and open the image.
    private static final View.OnTouchListener TOUCH_LISTENER = (v, event) -> {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                LONG_PRESSED.remove(v);
                VIEW_LONG_PRESSED.remove(v);
                LAST_TOUCH.put(v, new float[]{event.getX(), event.getY()});
                cancelImageLongPress(v);
                if (v instanceof TextView) ImageLongPress.start((TextView) v);
                break;
            case MotionEvent.ACTION_MOVE:
                float[] down = LAST_TOUCH.get(v);
                int slop = ViewConfiguration.get(v.getContext()).getScaledTouchSlop();
                if (down == null || Math.abs(event.getX() - down[0]) > slop
                        || Math.abs(event.getY() - down[1]) > slop) {
                    cancelImageLongPress(v);
                }
                break;
            case MotionEvent.ACTION_UP:
                cancelImageLongPress(v);
                LAST_TOUCH.put(v, new float[]{event.getX(), event.getY()});
                if (LONG_PRESSED.remove(v) != null) event.setAction(MotionEvent.ACTION_CANCEL);
                break;
            case MotionEvent.ACTION_CANCEL:
            case MotionEvent.ACTION_POINTER_DOWN:
                cancelImageLongPress(v);
                break;
        }
        return false;
    };

    /**
     * TOUCH_LISTENER's work, for when another bundle's inline media owns the TextView's touch
     * listener (tables-only mode, {@link Settings#inlineTablesOnly}): View.onTouchEvent hands every
     * touch that listener didn't consume to the touch delegate first, before the TextView's own
     * click and link handling. Never consumes. Touches that listener consumes are on its media,
     * not on a table, so missing them is fine.
     */
    private static final class TouchRecorder extends TouchDelegate {
        private final View owner;

        TouchRecorder(View owner) {
            super(new Rect(), owner);
            this.owner = owner;
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            try {
                TOUCH_LISTENER.onTouch(owner, event);
            } catch (Throwable t) {
                Log.w(TAG, "table touch failed", t);
            }
            return false;
        }
    }

    // The TextView's own long click, on an image: consumed, so it doesn't start text
    // selection (the comment is selected by our timer instead). TextView then discards the
    // touch's lift itself. Elsewhere in the text, the long press behaves as usual.
    private static final View.OnLongClickListener LONG_CLICK = v -> {
        try {
            if (!Settings.longPressImageSelectsComment() || !(v instanceof TextView)) return false;
            TextView tv = (TextView) v;
            if (!tv.isClickable() || !onImage(tv)) return false;
            VIEW_LONG_PRESSED.put(tv, Boolean.TRUE);
            // If our timer already fired, leave the lift to TextView (which now discards it):
            // cancelling it too would leave TextView waiting to discard the next tap's lift.
            LONG_PRESSED.remove(tv);
            clearSelection(tv);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "image long press failed", t);
            return false;
        }
    };
    // Re-fits images after each layout of the TextView, as the space it gets can change
    // (e.g. a recycled row bound to a reply at a different depth). fitImages() is a no-op
    // when nothing changed. Posted: the re-layout it may cause can't run mid-layout.
    private static final View.OnLayoutChangeListener FITTER =
            (v, l, t, r, b, oldL, oldT, oldR, oldB) -> {
                if (v instanceof TextView) v.post(() -> fitImages((TextView) v));
            };

    static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final int CONNECT_TIMEOUT_MS = 10_000;
    private static final int READ_TIMEOUT_MS = 30_000;

    // <meta property="og:image[:url|:secure_url]" content="..."> in either attr order.
    private static final Pattern OG_PROP_FIRST = Pattern.compile(
            "<meta[^>]+property=[\"']og:image(?::url|:secure_url)?[\"'][^>]+content=[\"']([^\"']+)[\"']",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern OG_CONTENT_FIRST = Pattern.compile(
            "<meta[^>]+content=[\"']([^\"']+)[\"'][^>]+property=[\"']og:image(?::url|:secure_url)?[\"']",
            Pattern.CASE_INSENSITIVE);

    // ---- background: embed images into the comment spannable -------------------

    // How long embed() may wait for a body's uncached media (all of it together) before
    // showing placeholders, and only if all of it is loading already (nothing queued).
    // Short: rif renders the bodies one after another, and a cold fetch takes 80-900 ms,
    // so the wait seldom pays off but delays every later comment.
    private static final long WAIT_BUDGET_MS = 50;

    /**
     * Embeds the media of [body]'s links. Called by rif's body render, which renders a
     * list's bodies one after another on one thread, so this must not wait on the network:
     * what's cached (memory or disk) is embedded now; the rest is loaded by InlineLoader
     * and filled in later on the main thread (see {@link #fill}). Meanwhile a placeholder
     * box stands where the media will be: in place of a bare link's text, or on the line
     * below a [text](url) link or a video. Nothing touches [body] off the main thread after
     * this returns.
     */
    public static void embed(SpannableStringBuilder body) {
        try {
            if (body == null) return;
            if (!Settings.inlineImages()) return; // feature disabled in settings
            if (Looper.myLooper() == Looper.getMainLooper()) return; // never block UI
            long batch = InlineLoader.batch(); // for every body, so batches follow rif's renders

            URLSpan[] links = body.getSpans(0, body.length(), URLSpan.class);
            if (links == null || links.length == 0) return;

            // Process in descending start order so inserting an image line for one
            // link doesn't shift the positions of links we haven't handled yet.
            List<URLSpan> ordered = new ArrayList<>(Arrays.asList(links));
            Collections.sort(ordered,
                    (a, b) -> Integer.compare(body.getSpanStart(b), body.getSpanStart(a)));

            // What each link shows, from the caches alone (no network).
            List<Plan> plans = new ArrayList<>();
            for (URLSpan link : ordered) {
                try {
                    Media media = load(link.getURL(), false);
                    if (media != null) plans.add(new Plan(link, media));
                } catch (Throwable ignored) {
                    // leave this link as a plain link
                }
            }
            if (plans.isEmpty()) return;

            // Load the rest in the background. If all of it starts loading at once (no
            // waiting for a thread or a host's slot), give it a moment: what arrives in time
            // is embedded now, with no placeholder.
            List<InlineLoader.Task> tasks = new ArrayList<>();
            for (Plan p : plans) {
                if (!p.media.missing) continue;
                final String url = p.link.getURL();
                p.task = InlineLoader.submit(url, url, batch, () -> loadDecoded(url));
                tasks.add(p.task);
            }
            if (!tasks.isEmpty() && InlineLoader.allStarting(tasks)) {
                InlineLoader.await(tasks, SystemClock.uptimeMillis() + WAIT_BUDGET_MS);
            }

            for (Plan p : plans) {
                try {
                    Media media = p.media;
                    if (p.task != null && p.task.isDone()) {
                        Object result = p.task.result();
                        media = result instanceof Media ? (Media) result : null;
                        p.task = null;
                    }
                    if (media == null) continue;
                    int start = body.getSpanStart(p.link);
                    int end = body.getSpanEnd(p.link);
                    if (start < 0 || end < 0 || start >= end) {
                        p.task = null;
                        continue;
                    }
                    String linkText = body.subSequence(start, end).toString();
                    boolean bare = isBareLinkText(linkText, p.link.getURL()) || isHideableLinkText(linkText);
                    if (!media.missing) {
                        Built built = build(media, p.link, bare);
                        if (built == null) continue;
                        if (built.below) {
                            body.insert(end, "\n\uFFFC");
                            setSpans(body, built, end + 1, end + 2);
                        } else {
                            setSpans(body, built, start, end);
                        }
                    } else if (bare && !media.isVideo) {
                        // Bare URL (or "[gif]"): the placeholder replaces the link text
                        // already, as the image will (a visible link would look like it
                        // needs tapping). The link span under it still opens the link.
                        PlaceholderSpan box = new PlaceholderSpan(media.hintW, media.hintH);
                        body.setSpan(box, start, end, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
                        p.bare = true;
                        p.marker = box;
                    } else {
                        // [text](url) link or a video (also an imgur album already known to
                        // hold one): the line below gets a placeholder box.
                        PlaceholderSpan box = new PlaceholderSpan(media.hintW, media.hintH);
                        body.insert(end, "\n\uFFFC");
                        body.setSpan(box, end + 1, end + 2, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
                        box.click = setImageClickSpan(body, box, p.link, end + 1, end + 2);
                        p.marker = box;
                    }
                } catch (Throwable ignored) {
                    // leave this link as a plain link
                }
            }

            // Only now (every change to the text made) hand the rest to the loader's
            // completions, in reading order.
            for (int i = plans.size() - 1; i >= 0; i--) {
                final Plan p = plans.get(i);
                if (p.marker == null || p.task == null) continue;
                p.task.whenDone(result -> deliver(body, p, result));
            }
        } catch (Throwable ignored) {
        }
    }

    /** One media link of a body being embedded. */
    private static final class Plan {
        final URLSpan link;
        final Media media;
        // Set while it loads in the background:
        InlineLoader.Task task;
        // Its PlaceholderSpan in the text: over the link text (bare) or on the line below.
        PlaceholderSpan marker;
        boolean bare;

        Plan(URLSpan link, Media media) {
            this.link = link;
            this.media = media;
        }
    }

    /** The spans that show a link's media. */
    private static final class Built {
        final ImageSpan image;
        final ImageClickSpan click; // or null: a bare link's single image sits on the link
        final boolean below; // on its own line below the link text

        Built(ImageSpan image, ImageClickSpan click, boolean below) {
            this.image = image;
            this.click = click;
            this.below = below;
        }
    }

    /**
     * The spans for [media] at [link]. Decodes images (unless the loader already did), so
     * not on the main thread.
     */
    private static Built build(Media media, URLSpan link, boolean bare) {
        if (media.video != null) {
            ImageSpan span = InlineVideos.newSpan(media, link);
            return new Built(span, new ImageClickSpan(span, link), true);
        }
        Drawable drawable = media.takeDecoded();
        if (drawable == null) drawable = toDrawable(media.data);
        if (drawable == null) {
            Log.w(TAG, "image decode failed: " + link.getURL());
            return null;
        }
        boolean multiImage = media.album != null && media.album.urls.size() > 1;
        // A bare URL or a Reddit-app media marker like "[gif]": the image replaces the link
        // text. A [text](url) link keeps its text and gets the image on its own line below.
        ImageSpan image = multiImage
                ? new AlbumImageSpan(drawable, media.album.urls, link) : new FitImageSpan(drawable);
        // Off the link span (or an album, for its arrows) the image needs its own tap handler.
        ImageClickSpan click = multiImage || !bare ? new ImageClickSpan(image, link) : null;
        return new Built(image, click, !bare);
    }

    private static void setSpans(Spannable text, Built built, int start, int end) {
        text.setSpan(built.image, start, end, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
        // Top priority so rif's movement method (which takes the first ClickableSpan under
        // the tap) picks this over a link span covering the same text.
        if (built.click != null) {
            text.setSpan(built.click, start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE | Spanned.SPAN_PRIORITY);
        }
    }

    /**
     * A background load for [p] finished (on a loader thread): build its spans here, then
     * fill them in on the main thread.
     */
    private static void deliver(SpannableStringBuilder body, Plan p, Object result) {
        Built built = null;
        try {
            if (result instanceof Media) built = build((Media) result, p.link, p.bare);
        } catch (Throwable t) {
            Log.w(TAG, "inline media build failed: " + p.link.getURL(), t);
        }
        final Built b = built;
        MAIN.post(() -> fill(body, p, b));
    }

    /**
     * Main thread: swaps [p]'s marker for its media ([built]; null = it failed) in the
     * rendered body and in every TextView showing it. TextView.setText() copies the text
     * but shares the span objects, so a TextView shows this body exactly when its text
     * holds the marker. Rows recycled to other comments, or bodies already filled, don't.
     */
    private static void fill(SpannableStringBuilder body, Plan p, Built built) {
        try {
            if (body.getSpanStart(p.marker) < 0) return;
            List<TextView> showing = new ArrayList<>();
            for (TextView tv : new ArrayList<>(WATCHED.keySet())) {
                CharSequence text = tv == null ? null : tv.getText();
                if (text instanceof Spannable && ((Spanned) text).getSpanStart(p.marker) >= 0) showing.add(tv);
            }
            swap(body, p, built);
            for (TextView tv : showing) {
                CharSequence text = tv.getText();
                if (text != body && text instanceof Spannable && !swap((Spannable) text, p, built)) {
                    // Its copy of the text can't take the change (a line to insert or
                    // delete, and the copy isn't Editable): show the changed body instead,
                    // as rif's next bind would. Same span objects, so GIFs and videos
                    // carry on (only a text selection is lost).
                    tv.setText(body);
                } else if (isHeightLimited(tv)) {
                    // A feed preview (maxLines): the span change re-flows the text, but the
                    // TextView's per-block display lists keep text below the cut-off where
                    // it was, drawn over the filled image. Setting the text again rebuilds
                    // the layout and every block (the same span objects, so GIFs and videos
                    // carry on; previews aren't selectable).
                    tv.setText(tv.getText());
                } else {
                    tv.requestLayout();
                    // Selectable text (the comments-page post body) draws from per-block
                    // display lists, and a block is only moved when it is re-recorded: after
                    // an image taller than its placeholder fills in, later blocks kept their
                    // old place and were drawn over it (text over the image, blank space
                    // below). Re-setting the shadow to its own values re-records every block
                    // (Editor.invalidateTextDisplayList) without losing a selection.
                    tv.setShadowLayer(tv.getShadowRadius(), tv.getShadowDx(), tv.getShadowDy(),
                            tv.getShadowColor());
                    tv.invalidate();
                }
                // Span changes don't fire TextWatchers: re-attach here (fits the image,
                // starts a GIF, adds a video's overlay).
                attach(tv);
            }
        } catch (Throwable t) {
            Log.w(TAG, "inline media fill failed", t);
        }
    }

    /** True if [tv] shows at most so many lines or pixels (or ellipsizes). */
    private static boolean isHeightLimited(TextView tv) {
        int lines = tv.getMaxLines(), height = tv.getMaxHeight();
        return (lines >= 0 && lines != Integer.MAX_VALUE) || (height >= 0 && height != Integer.MAX_VALUE)
                || tv.getEllipsize() != null;
    }

    /**
     * Swaps [p]'s placeholder in [text] for [built], or removes it ([built] null). False
     * (and [text] left as it was) if that needs inserting or deleting text and [text] isn't
     * Editable.
     */
    private static boolean swap(Spannable text, Plan p, Built built) {
        PlaceholderSpan box = p.marker;
        int start = text.getSpanStart(box);
        int end = text.getSpanEnd(box);
        if (start < 0 || end < start) return true;
        boolean editable = text instanceof Editable;
        // Failed: a bare link's text shows again; a placeholder's own line goes again.
        boolean deleteLine = built == null && !p.bare;
        // A bare link that turned out to be a video (an imgur album holding one): it goes
        // on a line below the link.
        boolean insertLine = built != null && p.bare && built.below;
        if ((deleteLine || insertLine) && !editable) return false;

        text.removeSpan(box);
        if (box.click != null) text.removeSpan(box.click);
        if (deleteLine) {
            if (start >= 1 && end == start + 1
                    && text.charAt(start - 1) == '\n' && text.charAt(start) == '\uFFFC') {
                ((Editable) text).delete(start - 1, end);
            } else { // not the line we inserted (shouldn't happen): take no space
                box.collapsed = true;
                text.setSpan(box, start, end, Spanned.SPAN_INCLUSIVE_EXCLUSIVE);
            }
            return true;
        }
        if (built == null) return true;
        if (insertLine) {
            ((Editable) text).insert(end, "\n\uFFFC");
            start = end + 1;
            end = end + 2;
        }
        setSpans(text, built, start, end);
        return true;
    }

    /**
     * Stands in for media still loading: a faint box, the size of the media if known
     * (else a couple of lines high). Taps open the link (via the link span under a bare
     * link's box, else via its own click span).
     */
    static final class PlaceholderSpan extends FitImageSpan {
        ImageClickSpan click; // null over a bare link
        // Its media failed and the box couldn't be removed from the text: takes no space.
        boolean collapsed;

        PlaceholderSpan(int w, int h) {
            super(box(w, h));
        }

        private static Drawable box(int w, int h) {
            if (w <= 0 || h <= 0) {
                w = targetWidth();
                h = dp(Resources.getSystem(), 40);
            }
            Drawable d = new ColorDrawable(0);
            d.setBounds(0, 0, w, h);
            return d;
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            if (!collapsed) return super.getSize(paint, text, start, end, fm);
            if (fm != null) {
                fm.ascent = fm.top = fm.descent = fm.bottom = 0;
            }
            return 0;
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x,
                         int top, int y, int bottom, Paint paint) {
            if (collapsed) return;
            // Where DynamicDrawableSpan (ALIGN_BASELINE) would put it. The text color at low
            // alpha suits rif's light and dark themes alike.
            int transY = bottom - height() - paint.getFontMetricsInt().descent;
            PLACEHOLDER.setColor((paint.getColor() & 0x00FFFFFF) | 0x1A000000);
            float r = 4 * Resources.getSystem().getDisplayMetrics().density;
            canvas.drawRoundRect(new RectF(x, transY, x + width(), transY + height()), r, r, PLACEHOLDER);
        }
    }

    // ---- loading: caches first, then the network ----------------------------------------

    /** An imgur album: its items' URLs, and the first item's size (0 = unknown). */
    static final class Album {
        static final Album NONE = new Album(Collections.<String>emptyList(), 0, 0);
        static final Album MISSING = new Album(Collections.<String>emptyList(), 0, 0);

        final List<String> urls;
        final int width;
        final int height;

        Album(List<String> urls, int width, int height) {
            this.urls = urls;
            this.width = width;
            this.height = height;
        }

        /** Disk form: the first item's size, then one URL per line. */
        String serialize() {
            StringBuilder sb = new StringBuilder().append(width).append(' ').append(height);
            for (String url : urls) sb.append('\n').append(url);
            return sb.toString();
        }

        static Album parse(String s) {
            if (s == null) return null;
            try {
                String[] lines = s.split("\n");
                String[] size = lines[0].split(" ");
                List<String> urls = new ArrayList<>(Arrays.asList(lines).subList(1, lines.length));
                if (urls.isEmpty()) return null;
                return new Album(Collections.unmodifiableList(urls),
                        Integer.parseInt(size[0]), Integer.parseInt(size[1]));
            } catch (Throwable t) {
                return null;
            }
        }
    }

    /**
     * What a media link shows: an image's bytes (plus its album, if it's one), or a video
     * and its still frame. {@code missing} = not cached; then hintW/hintH are its display
     * size if already known (0 = unknown).
     */
    static final class Media {
        final byte[] data;
        final String imageUrl; // where data came from
        final Album album;
        final InlineVideos.Video video;
        final InlineVideos.Poster poster;
        final boolean missing;
        // A video (also one still missing): it goes on its own line below the link.
        final boolean isVideo;
        final int hintW;
        final int hintH;
        // The image, decoded by the loader for the first span built from this.
        private Drawable decoded;

        private Media(byte[] data, String imageUrl, Album album, InlineVideos.Video video,
                      InlineVideos.Poster poster, boolean missing, boolean isVideo, int hintW, int hintH) {
            this.data = data;
            this.imageUrl = imageUrl;
            this.album = album;
            this.video = video;
            this.poster = poster;
            this.missing = missing;
            this.isVideo = isVideo;
            this.hintW = hintW;
            this.hintH = hintH;
        }

        static Media missing(int hintW, int hintH) {
            return new Media(null, null, null, null, null, true, false, hintW, hintH);
        }

        static Media missingVideo(int hintW, int hintH) {
            return new Media(null, null, null, null, null, true, true, hintW, hintH);
        }

        static Media image(byte[] data, String imageUrl, Album album) {
            return new Media(data, imageUrl, album, null, null, false, false, 0, 0);
        }

        static Media video(InlineVideos.Video video, InlineVideos.Poster poster) {
            return new Media(null, null, null, video, poster, false, true, 0, 0);
        }

        synchronized Drawable takeDecoded() {
            Drawable d = decoded;
            decoded = null;
            return d;
        }
    }

    // resolveImageUrl's answer when the page needs fetching and the network isn't allowed.
    private static final String MISSING_URL = new String("missing");

    /**
     * What [url] shows, or null if it's not a media link (or it failed). Without
     * [network], only caches are used, and a link that would need the network gives
     * {@link Media#missing}.
     */
    static Media load(String url, boolean network) {
        if (url == null) return null;
        // A reddit.com/media?url=... wrapper shows what it wraps.
        String wrapped = ShareLinks.mediaTarget(url);
        if (wrapped != null) url = wrapped;
        // Video links (comment videos, v.redd.it, imgur gifv/mp4) are InlineVideos'.
        if (InlineVideos.isVideoLink(url)) return InlineVideos.load(url, network);
        // imgur albums are listed via the API (so multi-image albums can be cycled inline).
        // Direct image links are used as-is; other known media hosts (imgur pages, redgifs,
        // reddit galleries, ...) are resolved to their image via the page's og:image tag.
        // Anything else stays a link.
        Album album = imgurAlbum(url, network);
        if (album == Album.MISSING) return Media.missing(0, 0);
        String imageUrl = album != null ? album.urls.get(0) : resolveImageUrl(url, network);
        if (imageUrl == MISSING_URL) return Media.missing(0, 0);
        if (imageUrl == null) return null;
        // A one-item album holding a video is listed as its mp4: play it like a plain
        // i.imgur.com/{id}.mp4 link.
        if (album != null && album.urls.size() == 1 && InlineVideos.isVideoLink(imageUrl)) {
            Media video = InlineVideos.load(imageUrl, network);
            if (video != null && video.missing && video.hintW <= 0 && album.width > 0 && album.height > 0) {
                int[] size = InlineVideos.displaySize(album.width, album.height); // from the listing
                return Media.missingVideo(size[0], size[1]);
            }
            return video;
        }
        byte[] data = network ? fetch(imageUrl) : cached(imageUrl);
        if (data != null) return Media.image(data, imageUrl, album);
        if (!network && album != null && album.width > 0 && album.height > 0) {
            int[] size = outSize(album.width, album.height);
            return Media.missing(size[0], size[1]);
        }
        return network ? null : Media.missing(0, 0);
    }

    /**
     * load() with the network, on a loader thread; also decodes the image, and keeps its
     * bytes on disk once they decode (a cut-off download doesn't).
     */
    private static Media loadDecoded(String url) {
        Media media = load(url, true);
        if (media == null || media.data == null) return media;
        try {
            InlineLoader.DECODES.acquire();
            try {
                media.decoded = toDrawable(media.data);
            } finally {
                InlineLoader.DECODES.release();
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        if (media.decoded != null) {
            persist(media.imageUrl, media.data);
        } else {
            BYTES.remove(media.imageUrl);
            Log.w(TAG, "image decode failed: " + media.imageUrl);
            return null;
        }
        return media;
    }

    // ---- main thread: start/stop GIF animation for a bound TextView ------------

    // TextViews with a RETEXT watcher (keys weak).
    private static final WeakHashMap<TextView, Boolean> WATCHED = new WeakHashMap<>();

    /**
     * Re-runs attach() when rif sets a watched TextView's text outside the bind we hook
     * (e.g. it re-sets a text post's body once its rendering, with our images, completes).
     */
    private static final class Retext implements TextWatcher {
        private final WeakReference<TextView> view;

        Retext(TextView tv) {
            view = new WeakReference<>(tv);
        }

        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override
        public void afterTextChanged(Editable s) {
            TextView tv = view.get();
            if (tv != null) tv.post(() -> attach(tv));
        }
    }

    public static void attach(TextView tv) {
        try {
            if (tv == null) return;
            if (WATCHED.put(tv, Boolean.TRUE) == null) tv.addTextChangedListener(new Retext(tv));

            Bound bound = RUNNING.get(tv);
            if (bound == null) bound = new Bound(tv);
            List<Animatable> prev = bound.anims;

            // Animatables shown in this TextView's current text. Each one is (re)pointed
            // at this view's callback, which makes this view its owner. Ones that are
            // already animating are NOT restarted, so an in-place rebind of the same
            // comment (e.g. a vote, which re-binds the row to update the score) or a
            // rebind into a different holder (change animations) keeps the GIF playing.
            CharSequence cs = tv.getText();
            List<Animatable> current = new ArrayList<>();
            if (cs instanceof Spanned) {
                Spanned sp = (Spanned) cs;
                if (sp.getSpans(0, sp.length(), FitImageSpan.class).length > 0 || InlineTables.has(sp)) {
                    // Image (and table) taps and long presses need the touch position (rif's
                    // body TextViews have no touch or long-click listeners of their own).
                    if (Settings.inlineTablesOnly()) {
                        // Another bundle's inline media may own the touch listener (Patcheddit's
                        // sets one on bodies with media): record through a touch delegate instead.
                        if (!(tv.getTouchDelegate() instanceof TouchRecorder)) {
                            tv.setTouchDelegate(new TouchRecorder(tv));
                        }
                    } else {
                        tv.setOnTouchListener(TOUCH_LISTENER);
                    }
                    tv.setOnLongClickListener(LONG_CLICK);
                    // Fit to the current width now (usually right, as rows are recycled
                    // between comments), and again whenever the width changes.
                    tv.removeOnLayoutChangeListener(FITTER);
                    tv.addOnLayoutChangeListener(FITTER);
                    fitImages(tv);
                }
                for (ImageSpan span : sp.getSpans(0, sp.length(), ImageSpan.class)) {
                    Drawable d = span.getDrawable();
                    if (!(d instanceof Animatable)) continue;
                    Animatable anim = (Animatable) d;
                    current.add(anim);
                    if (d.getCallback() != bound.callback) d.setCallback(bound.callback);
                    if (!anim.isRunning()) anim.start();
                }
            }

            // Stop animatables from the previous bind that left this view (a recycle to a
            // different comment) — but only ones this view still owns. If another view
            // has since claimed one (same comment bound elsewhere), leave it running.
            for (Animatable a : prev) {
                if (current.contains(a)) continue;
                try {
                    Drawable d = (Drawable) a;
                    if (d.getCallback() != bound.callback) continue;
                    a.stop();
                    d.setCallback(null);
                } catch (Throwable ignored) {
                }
            }

            if (current.isEmpty()) {
                RUNNING.remove(tv);
            } else {
                bound.anims = current;
                RUNNING.put(tv, bound);
            }
        } catch (Throwable ignored) {
        }
        // Video overlays: added for this text's videos, removed for ones that left.
        InlineVideos.attach(tv);
    }

    /** Drawable.Callback that invalidates a TextView it holds only weakly. */
    private static final class ViewCallback implements Drawable.Callback {
        private final WeakReference<TextView> view;

        ViewCallback(TextView tv) {
            view = new WeakReference<>(tv);
        }

        @Override
        public void invalidateDrawable(Drawable who) {
            TextView tv = view.get();
            if (tv != null) tv.invalidate();
        }

        @Override
        public void scheduleDrawable(Drawable who, Runnable what, long when) {
            TextView tv = view.get();
            if (tv != null) tv.postDelayed(what, Math.max(0, when - SystemClock.uptimeMillis()));
        }

        @Override
        public void unscheduleDrawable(Drawable who, Runnable what) {
            TextView tv = view.get();
            if (tv != null) tv.removeCallbacks(what);
        }
    }

    // ---- imgur albums -----------------------------------------------------------

    /**
     * An imgur album/gallery link's items, via the imgur API (rif's client ID), or null if
     * the link isn't one or the album can't be listed (callers then fall back to the
     * og:image cover). Without [network], {@link Album#MISSING} if not cached.
     */
    private static Album imgurAlbum(String url, boolean network) {
        Matcher m = IMGUR_ALBUM.matcher(url);
        if (!m.matches()) return null;
        Album cached = ALBUMS.get(url);
        if (cached != null) return cached == Album.NONE ? null : cached;
        if (recentlyFailed("album:" + url)) return null; // og:image cover meanwhile
        String text = InlineCache.getText("album:" + url);
        if (text != null && text.isEmpty()) { // known not listable
            ALBUMS.put(url, Album.NONE);
            return null;
        }
        Album stored = Album.parse(text);
        if (stored != null) {
            ALBUMS.put(url, stored);
            return stored;
        }
        if (!network) return Album.MISSING;

        String id = m.group(2);
        Album album = listImgurAlbum("https://api.imgur.com/3/album/" + id);
        if ((album == null || album == Album.NONE) && "gallery".equalsIgnoreCase(m.group(1))) {
            Album gallery = listImgurAlbum("https://api.imgur.com/3/gallery/album/" + id);
            if (gallery != null && gallery != Album.NONE) album = gallery;
            else if (gallery == null) album = null; // a failed request: "none" isn't certain
            // else: NONE only if both answered none (album stays null if it failed)
        }
        if (album == null) {
            // A failed request: fall back to the cover for now, try the album again later.
            FAILED.put("album:" + url, SystemClock.uptimeMillis());
            return null;
        }
        ALBUMS.put(url, album);
        if (album == Album.NONE) {
            // imgur answered that it can't be listed: keep that too, for a day, so the link
            // doesn't get a placeholder on every visit. (A failed request isn't kept.)
            InlineCache.putText("album:" + url, "");
        } else {
            InlineCache.putText("album:" + url, album.serialize());
        }
        return album == Album.NONE ? null : album;
    }

    /**
     * Lists an album via the API: its items, Album.NONE if imgur answered that there are
     * none (or no such album), or null if the request failed.
     */
    private static Album listImgurAlbum(String apiUrl) {
        try {
            TextResult result = fetchTextResult(apiUrl, IMGUR_AUTH, "application/json", MAX_JSON_BYTES);
            if (result.body == null) return result.isGone() ? Album.NONE : null;
            JSONArray items = new JSONObject(result.body).getJSONObject("data").optJSONArray("images");
            if (items == null || items.length() == 0) return Album.NONE;
            List<String> urls = new ArrayList<>(items.length());
            int firstW = 0, firstH = 0;
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                String id = item.optString("id", "");
                String link = item.optString("link", "");
                int w = item.optInt("width", 0), h = item.optInt("height", 0);
                boolean thumbnail = false;
                if (item.optString("type", "").startsWith("video/") && !id.isEmpty()) {
                    // A video can't be drawn in a span. Alone in its album it is returned as
                    // its mp4 (embed() plays it inline); among other items it gets imgur's
                    // still frame (the .gif of an mp4 upload is just a still too, so this is
                    // lighter).
                    thumbnail = items.length() > 1;
                    link = "https://i.imgur.com/" + id + (thumbnail ? "h.jpg" : ".mp4");
                } else if (!item.optBoolean("animated", false) && w >= h && w > 1024 && !id.isEmpty()) {
                    // A big still in landscape: imgur's 1024 px "huge thumbnail" is plenty
                    // for a phone-wide image and a fraction of the download. (Portrait ones
                    // would come out narrower than the screen.)
                    thumbnail = true;
                    link = "https://i.imgur.com/" + id + "h.jpg";
                }
                if (link.isEmpty()) continue;
                if (urls.isEmpty() && w > 0 && h > 0) {
                    // The thumbnail fits in 1024 x 1024.
                    float scale = thumbnail ? Math.min(1f, 1024f / Math.max(w, h)) : 1f;
                    firstW = Math.max(1, Math.round(w * scale));
                    firstH = Math.max(1, Math.round(h * scale));
                }
                urls.add(link);
            }
            return urls.isEmpty() ? Album.NONE : new Album(Collections.unmodifiableList(urls), firstW, firstH);
        } catch (Throwable t) {
            Log.w(TAG, "imgur album listing failed: " + apiUrl + " (" + t + ")");
            return null;
        }
    }

    /** Sets a tap handler for the inline [image] (which opens [link]) over [start, end). */
    static ImageClickSpan setImageClickSpan(SpannableStringBuilder body, ImageSpan image, URLSpan link,
                                            int start, int end) {
        // Top priority so rif's movement method (which takes the first ClickableSpan under
        // the tap) picks this over a link span covering the same text.
        ImageClickSpan click = new ImageClickSpan(image, link);
        body.setSpan(click, start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE | Spanned.SPAN_PRIORITY);
        return click;
    }

    /**
     * Where the last tap on [tv] fell across the image drawn by [span] (0 = left edge,
     * 1 = right edge; [width] = its drawn width), or NaN if it wasn't on the image. rif's
     * movement method maps a tap to the nearest character offset and fires any span touching
     * it, so taps on text next to an image (e.g. the start of the following line) also land
     * on its click span; those must be ignored.
     */
    private static float tapPosition(TextView tv, Object span, int width) {
        float[] touch = LAST_TOUCH.get(tv);
        Layout layout = tv.getLayout();
        CharSequence text = tv.getText();
        if (touch == null || layout == null || width <= 0 || !(text instanceof Spanned)) return Float.NaN;
        int start = ((Spanned) text).getSpanStart(span);
        if (start < 0) return Float.NaN;
        int line = layout.getLineForOffset(start);
        float y = touch[1] - tv.getTotalPaddingTop() + tv.getScrollY();
        if (y < layout.getLineTop(line) || y > layout.getLineBottom(line)) return Float.NaN;
        float left = layout.getPrimaryHorizontal(start) + tv.getTotalPaddingLeft() - tv.getScrollX();
        float x = (touch[0] - left) / width;
        return (x < 0f || x > 1f) ? Float.NaN : x;
    }

    private static void cancelImageLongPress(View v) {
        Runnable pending = PENDING_LONG_PRESS.remove(v);
        if (pending != null) v.removeCallbacks(pending);
    }

    /** rif's movement method highlights a link/image's text range on touch-down. */
    private static void clearSelection(TextView tv) {
        CharSequence text = tv.getText();
        if (text instanceof Spannable) Selection.removeSelection((Spannable) text);
    }

    /** Timer for a long press on an inline image; holds its TextView weakly. */
    private static final class ImageLongPress implements Runnable {
        private final WeakReference<TextView> view;

        private ImageLongPress(TextView tv) {
            view = new WeakReference<>(tv);
        }

        /** Starts the timer if the touch that just went down on [tv] is on an image. */
        static void start(TextView tv) {
            try {
                if (!Settings.longPressImageSelectsComment() || !tv.isClickable() || !onImage(tv)) return;
                ImageLongPress timer = new ImageLongPress(tv);
                PENDING_LONG_PRESS.put(tv, timer);
                tv.postDelayed(timer, Settings.longPressImageDelayMs());
            } catch (Throwable t) {
                Log.w(TAG, "image long press failed", t);
            }
        }

        @Override
        public void run() {
            try {
                TextView tv = view.get();
                if (tv == null || PENDING_LONG_PRESS.get(tv) != this) return;
                PENDING_LONG_PRESS.remove(tv);
                // Stop the TextView's own (pending) long click; if it already fired, the
                // TextView discards the lift itself, so don't also cancel it.
                tv.cancelLongPress();
                if (VIEW_LONG_PRESSED.get(tv) == null) LONG_PRESSED.put(tv, Boolean.TRUE);
                clearSelection(tv);
                tv.performClick();
            } catch (Throwable t) {
                Log.w(TAG, "image long press failed", t);
            }
        }
    }

    /** The last touch on [v] (x, y in the view), recorded by TOUCH_LISTENER; null if none. */
    static float[] lastTouch(View v) {
        return LAST_TOUCH.get(v);
    }

    /** True if the last touch on [tv] landed on one of its inline images (or tables). */
    private static boolean onImage(TextView tv) {
        CharSequence text = tv.getText();
        if (!(text instanceof Spanned)) return false;
        if (InlineTables.onTable(tv)) return true;
        for (FitImageSpan span : ((Spanned) text).getSpans(0, text.length(), FitImageSpan.class)) {
            if (!Float.isNaN(tapPosition(tv, span, span.width()))) return true;
        }
        return false;
    }

    /**
     * Shrinks [tv]'s inline images to fit its text width (or grows them back toward their
     * decoded size, if it got wider), re-laying out the text if any changed.
     */
    private static void fitImages(TextView tv) {
        try {
            int avail = availableTextWidth(tv);
            CharSequence text = tv.getText();
            if (avail <= 0 || !(text instanceof Spannable)) return;
            Spannable sp = (Spannable) text;
            boolean changed = false;
            for (FitImageSpan span : sp.getSpans(0, sp.length(), FitImageSpan.class)) {
                if (!span.fitWidth(avail)) continue;
                changed = true;
                // A span change makes the TextView re-flow (and re-draw) that range.
                sp.setSpan(span, sp.getSpanStart(span), sp.getSpanEnd(span), sp.getSpanFlags(span));
            }
            // Inline tables take the same width.
            if (InlineTables.fit(sp, avail)) changed = true;
            if (changed) {
                tv.requestLayout();
                tv.invalidate();
            }
        } catch (Throwable t) {
            Log.w(TAG, "image fit failed", t);
        }
    }

    /**
     * The widest [tv]'s text can be laid out. rif's comment body is wrap_content (inside a
     * wrap_content frame), so its own width just follows its content; the limit comes from
     * the nearest ancestor with a fixed or match_parent width, minus the paddings and
     * margins in between. 0 if not laid out yet.
     */
    private static int availableTextWidth(TextView tv) {
        int insets = tv.getTotalPaddingLeft() + tv.getTotalPaddingRight();
        View v = tv;
        while (v.getLayoutParams() != null
                && v.getLayoutParams().width == ViewGroup.LayoutParams.WRAP_CONTENT
                && v.getParent() instanceof ViewGroup) {
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
                insets += mlp.leftMargin + mlp.rightMargin;
            }
            ViewGroup parent = (ViewGroup) v.getParent();
            insets += parent.getPaddingLeft() + parent.getPaddingRight();
            v = parent;
        }
        return v.getWidth() <= 0 ? 0 : v.getWidth() - insets;
    }

    /**
     * Inline image that can shrink to fit its comment's width: images are decoded for a
     * top-level comment, but replies are indented. Starts at its drawable's decoded size.
     *
     * Reserves ~1/3 of a text line of space above the image (via the line ascent), so it
     * never clips the line above. A plain ALIGN_BASELINE ImageSpan alone on a line is drawn
     * shifted up by the font descent, over the bottom of the previous line. That happens
     * whenever the image ends up starting a line, which can't be told from the text: an
     * image link after text on the same line ("... wrong. https://imgur.com/x") wraps to
     * its own line when it's too wide to fit. So every image gets the gap.
     */
    static class FitImageSpan extends ImageSpan {
        final int natW;
        final int natH;

        FitImageSpan(Drawable d) {
            super(d, ImageSpan.ALIGN_BASELINE);
            Rect b = d.getBounds();
            natW = Math.max(1, b.width());
            natH = Math.max(1, b.height());
        }

        /** Drawn width. */
        int width() {
            return getDrawable().getBounds().right;
        }

        /** Drawn height. */
        int height() {
            return getDrawable().getBounds().bottom;
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end,
                           Paint.FontMetricsInt fm) {
            if (fm != null) {
                Paint.FontMetricsInt pfm = paint.getFontMetricsInt();
                int pad = Math.round((pfm.descent - pfm.ascent) / 3f);
                fm.ascent = -height() - pad;
                fm.top = fm.ascent;
                fm.descent = 0;
                fm.bottom = 0;
            }
            return width();
        }

        /** Size for at most [maxW] wide, keeping the aspect ratio. */
        final int[] fittedSize(int maxW) {
            int w = Math.min(natW, maxW);
            int h = w == natW ? natH : Math.max(1, Math.round(natH * (float) w / natW));
            return new int[]{w, h};
        }

        /** Fits the image within [maxW]; true if its size changed. */
        boolean fitWidth(int maxW) {
            int[] size = fittedSize(maxW);
            Drawable d = getDrawable();
            Rect b = d.getBounds();
            if (b.width() == size[0] && b.height() == size[1]) return false;
            d.setBounds(0, 0, size[0], size[1]);
            return true;
        }
    }

    /**
     * Inline image for a multi-image album: a fixed-size box (sized from the first image,
     * so cycling never re-flows the comment) showing the current image fitted inside,
     * with ◀ ▶ buttons and an "n/x" badge. Extends ImageSpan so attach() animates GIFs.
     * index/current/loading are touched on the main thread only.
     */
    private static final class AlbumImageSpan extends FitImageSpan {
        final List<String> urls;
        final URLSpan link;
        // The box: natW x natH (the first image's decoded size), shrunk by fitWidth().
        int boxW;
        int boxH;
        Drawable current;
        // current's decoded (unfitted) size.
        int currentW;
        int currentH;
        int index;
        boolean loading;

        AlbumImageSpan(Drawable first, List<String> urls, URLSpan link) {
            super(first);
            this.boxW = natW;
            this.boxH = natH;
            this.currentW = natW;
            this.currentH = natH;
            this.urls = urls;
            this.link = link;
            this.current = first;
        }

        @Override
        int width() {
            return boxW;
        }

        @Override
        int height() {
            return boxH;
        }

        @Override
        boolean fitWidth(int maxW) {
            int[] size = fittedSize(maxW);
            if (boxW == size[0] && boxH == size[1]) return false;
            boxW = size[0];
            boxH = size[1];
            fitIntoBox(current, currentW, currentH);
            return true;
        }

        @Override
        public Drawable getDrawable() {
            return current;
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x,
                         int top, int y, int bottom, Paint paint) {
            // Placement identical to DynamicDrawableSpan (ALIGN_BASELINE) for a box this size.
            // Not using its cached drawable, since ours changes.
            int transY = bottom - boxH - paint.getFontMetricsInt().descent;
            canvas.save();
            canvas.translate(x, transY);
            current.draw(canvas);
            drawControls(canvas);
            canvas.restore();
        }

        private void drawControls(Canvas canvas) {
            Resources res = Resources.getSystem();
            float density = res.getDisplayMetrics().density;
            float margin = 6 * density;

            // "n/x" badge, top-right.
            String label = (index + 1) + "/" + urls.size();
            BADGE_TEXT.setTextSize(12 * density);
            float textW = BADGE_TEXT.measureText(label);
            float padX = 6 * density;
            float badgeH = 20 * density;
            RectF badge = new RectF(boxW - margin - textW - 2 * padX, margin, boxW - margin, margin + badgeH);
            canvas.drawRoundRect(badge, badgeH / 2, badgeH / 2, SCRIM);
            Paint.FontMetrics tfm = BADGE_TEXT.getFontMetrics();
            canvas.drawText(label, badge.left + padX,
                    badge.centerY() - (tfm.ascent + tfm.descent) / 2, BADGE_TEXT);

            // ◀ ▶ buttons, vertically centered on the left/right edges (skipped if tiny, or
            // if inline album navigation is turned off — the badge stays either way).
            if (!Settings.inlineAlbumNavigation()) return;
            float r = 16 * density;
            if (boxW < 6 * r || boxH < 3 * r) return;
            float cy = boxH / 2f;
            drawArrow(canvas, margin + r, cy, r, -1);
            drawArrow(canvas, boxW - margin - r, cy, r, +1);
        }

        private static void drawArrow(Canvas canvas, float cx, float cy, float r, int dir) {
            canvas.drawCircle(cx, cy, r, SCRIM);
            float s = r * 0.4f;
            Path chevron = new Path();
            chevron.moveTo(cx - dir * s * 0.5f, cy - s);
            chevron.lineTo(cx + dir * s * 0.5f, cy);
            chevron.lineTo(cx - dir * s * 0.5f, cy + s);
            ARROW.setStrokeWidth(r * 0.18f);
            canvas.drawPath(chevron, ARROW);
        }

        /** Shows the next (+1) / previous (-1) image, wrapping; loads it in the background. */
        void step(TextView tv, int direction) {
            if (loading) return;
            int count = urls.size();
            final int target = ((index + direction) % count + count) % count;
            final String url = urls.get(target);
            final WeakReference<TextView> view = new WeakReference<>(tv);
            loading = true;
            final String prefetchUrl = urls.get(((target + direction) % count + count) % count);
            new Thread(() -> {
                Drawable loaded = null;
                try {
                    byte[] data = fetch(url);
                    if (data != null) loaded = toDrawable(data);
                    if (loaded != null) persist(url, data);
                    else if (data != null) BYTES.remove(url);
                } catch (Throwable ignored) {
                }
                final Drawable result = loaded;
                MAIN.post(() -> {
                    loading = false;
                    if (result == null) {
                        Log.w(TAG, "album image failed to load: " + url);
                        return;
                    }
                    Rect natural = result.getBounds();
                    currentW = Math.max(1, natural.width());
                    currentH = Math.max(1, natural.height());
                    fitIntoBox(result, currentW, currentH);
                    current = result;
                    index = target;
                    TextView tvNow = view.get();
                    CharSequence text = tvNow == null ? null : tvNow.getText();
                    // Only touch the view if it still shows this span (rows get recycled);
                    // otherwise the next bind picks the new image up via getDrawable().
                    if (text instanceof Spannable && ((Spannable) text).getSpanStart(this) >= 0) {
                        // rif's body text is selectable, so TextView draws it through cached
                        // per-block display lists that a plain invalidate() reuses; our draw()
                        // wouldn't run again. Re-setting the span is a span change, which makes
                        // the TextView re-record that range with the new image.
                        Spannable sp = (Spannable) text;
                        sp.setSpan(this, sp.getSpanStart(this), sp.getSpanEnd(this), sp.getSpanFlags(this));
                        attach(tvNow); // stops the old image's animation, starts a GIF's
                        tvNow.invalidate();
                    }
                });
                // After showing it: warm the byte cache for the next image in the same
                // direction, so the following tap is near-instant.
                try {
                    fetch(prefetchUrl);
                } catch (Throwable ignored) {
                }
            }, "RifAlbumImage").start();
        }

        /** Centers [d] (decoded size w x h) in the box, scaled to fit. */
        private void fitIntoBox(Drawable d, int w, int h) {
            float scale = Math.min((float) boxW / w, (float) boxH / h);
            int fw = Math.max(1, Math.round(w * scale)), fh = Math.max(1, Math.round(h * scale));
            int left = (boxW - fw) / 2, top = (boxH - fh) / 2;
            d.setBounds(left, top, left + fw, top + fh);
        }
    }

    /**
     * Tap handler over an inline image. A plain image opens its link (rif's usual popup /
     * viewer) wherever it's tapped. An album image: left third = previous image, right
     * third = next, middle = open the album via its link.
     */
    static final class ImageClickSpan extends ClickableSpan {
        private final ImageSpan image;
        private final URLSpan link;

        ImageClickSpan(ImageSpan image, URLSpan link) {
            this.image = image;
            this.link = link;
        }

        @Override
        public void updateDrawState(TextPaint ds) {
            // No link styling: the image itself is drawn by its ImageSpan.
        }

        private int width() {
            if (image instanceof FitImageSpan) return ((FitImageSpan) image).width();
            Drawable d = image.getDrawable();
            return d == null ? 0 : d.getBounds().right;
        }

        @Override
        public void onClick(View widget) {
            try {
                if (!(widget instanceof TextView)) return;
                TextView tv = (TextView) widget;
                // rif's body text is selectable, so its movement method highlighted this span's
                // range on touch-down. rif's own links open a dialog that clears it; we don't,
                // and a lingering selection makes the next tap only clear it. Clear it here.
                CharSequence text = tv.getText();
                if (text instanceof Spannable) Selection.removeSelection((Spannable) text);

                float x = tapPosition(tv, image, width());
                // Not on the image (a tap on nearby text that resolved to this span): do
                // nothing, so the tap behaves like any other text tap (rif selects the comment).
                if (Float.isNaN(x)) return;

                // The body TextView is itself clickable (onClick="onListItemClick", which
                // selects/highlights the comment and re-binds rows). That click was already
                // queued for this tap; drop it so a tap on the image only does the image action.
                tv.cancelPendingInputEvents();

                // Album tap zones only with inline album navigation on; otherwise an album
                // behaves like any other inline image.
                // A video that isn't autoplaying starts playing inline on its first tap.
                if (image instanceof InlineVideos.VideoSpan
                        && InlineVideos.onTap(tv, (InlineVideos.VideoSpan) image)) {
                    return;
                }

                boolean navigate = image instanceof AlbumImageSpan && Settings.inlineAlbumNavigation();
                if (navigate && x < 0.33f) {
                    ((AlbumImageSpan) image).step(tv, -1);
                } else if (navigate && x > 0.67f) {
                    ((AlbumImageSpan) image).step(tv, +1);
                } else {
                    link.onClick(tv); // open the image/album the usual way
                }
            } catch (Throwable t) {
                Log.w(TAG, "image tap failed", t);
            }
        }
    }

    private static final Paint SCRIM = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static final Paint ARROW = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static final Paint BADGE_TEXT = new Paint(Paint.ANTI_ALIAS_FLAG);
    private static final Paint PLACEHOLDER = new Paint(Paint.ANTI_ALIAS_FLAG); // main thread

    static {
        SCRIM.setColor(0x99000000);
        ARROW.setColor(0xFFFFFFFF);
        ARROW.setStyle(Paint.Style.STROKE);
        ARROW.setStrokeCap(Paint.Cap.ROUND);
        ARROW.setStrokeJoin(Paint.Join.ROUND);
        BADGE_TEXT.setColor(0xFFFFFFFF);
    }

    // ---- decoding --------------------------------------------------------------

    private static Drawable toDrawable(byte[] data) {
        // GIF and WebP go through ImageDecoder (API 28+), which yields an
        // AnimatedImageDrawable for animated content and a static drawable otherwise.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && (isGif(data) || isWebp(data))) {
            Drawable animated = decodeAnimated(data);
            if (animated != null) return animated;
        }
        Bitmap bmp = decodeScaled(data);
        if (bmp == null) return null;
        BitmapDrawable bd = new BitmapDrawable(Resources.getSystem(), bmp);
        bd.setBounds(0, 0, bmp.getWidth(), bmp.getHeight());
        return bd;
    }

    @android.annotation.TargetApi(28) // only called under an SDK_INT >= P check
    private static Drawable decodeAnimated(byte[] data) {
        try {
            // A direct buffer, not ByteBuffer.wrap(data): Android 10 reads a heap
            // buffer through JNI when libhwui decodes later frames on its
            // AnimatedImageTh thread, which isn't attached to the VM, and aborts
            // (SIGABRT in ByteArrayStream::read). A direct buffer is read from its
            // native address. Glide does the same.
            ByteBuffer buf = ByteBuffer.allocateDirect(data.length);
            buf.put(data);
            buf.flip();
            ImageDecoder.Source src = ImageDecoder.createSource(buf);
            Drawable d = ImageDecoder.decodeDrawable(src, new ImageDecoder.OnHeaderDecodedListener() {
                @Override
                public void onHeaderDecoded(ImageDecoder decoder, ImageDecoder.ImageInfo info,
                                            ImageDecoder.Source source) {
                    Size size = info.getSize();
                    int[] out = outSize(size.getWidth(), size.getHeight());
                    decoder.setTargetSize(out[0], out[1]);
                }
            });
            d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
            return d;
        } catch (Throwable t) {
            return null;
        }
    }

    private static Bitmap decodeScaled(byte[] data) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(data, 0, data.length, bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;

        int[] out = outSize(bounds.outWidth, bounds.outHeight);
        int outW = out[0], outH = out[1];

        BitmapFactory.Options opts = new BitmapFactory.Options();
        opts.inSampleSize = sampleSize(bounds.outWidth, outW);
        Bitmap decoded = BitmapFactory.decodeByteArray(data, 0, data.length, opts);
        if (decoded == null) return null;
        if (decoded.getWidth() == outW && decoded.getHeight() == outH) return decoded;

        Bitmap scaled = Bitmap.createScaledBitmap(decoded, outW, outH, true);
        if (scaled != decoded) decoded.recycle();
        return scaled;
    }

    /**
     * Target on-screen size for an image of native size w x h. With "scale to fit"
     * on, fill the comment width (up- or down-scaling). With it off, keep native
     * size, only downscaling images wider than the comment. Height is always capped.
     * The optional width and height limits (settings) shrink both caps; with both on,
     * whichever is tighter for this image's shape wins, aspect ratio kept.
     */
    static int[] outSize(int w, int h) {
        if (w <= 0 || h <= 0) return new int[]{Math.max(1, w), Math.max(1, h)};
        return fitSize(w, h, targetWidth(), maxHeight(),
                Resources.getSystem().getDisplayMetrics().heightPixels,
                Settings.inlineMaxWidthPercent(), Settings.inlineMaxHeightPercent(),
                Settings.scaleInlineImages());
    }

    /**
     * {@link #outSize} without Android: [targetW] is the full comment width, [maxH] the
     * fixed height cap, [screenH] the screen height; a percent of 0 means that limit is off.
     */
    static int[] fitSize(int w, int h, int targetW, int maxH, int screenH,
                         int widthPct, int heightPct, boolean scale) {
        if (w <= 0 || h <= 0) return new int[]{Math.max(1, w), Math.max(1, h)};
        if (widthPct > 0) targetW = Math.max(1, Math.round(targetW * widthPct / 100f));
        if (heightPct > 0) maxH = Math.min(maxH, Math.max(1, Math.round(screenH * heightPct / 100f)));
        int outW, outH;
        if (scale || w > targetW) {
            outW = targetW;
            outH = Math.round(h * ((float) targetW / (float) w));
        } else {
            outW = w;
            outH = h;
        }
        if (outH > maxH) {
            outH = maxH;
            outW = Math.round(w * ((float) maxH / (float) h));
        }
        return new int[]{Math.max(1, outW), Math.max(1, outH)};
    }

    // ---- helpers ---------------------------------------------------------------

    static int targetWidth() {
        Resources res = Resources.getSystem();
        return Math.max(1, res.getDisplayMetrics().widthPixels - dp(res, 24));
    }

    private static int maxHeight() {
        return Resources.getSystem().getDisplayMetrics().widthPixels * 2;
    }

    private static boolean isGif(byte[] data) {
        // "GIF8" magic.
        return data != null && data.length >= 4
                && data[0] == 'G' && data[1] == 'I' && data[2] == 'F' && data[3] == '8';
    }

    private static boolean isWebp(byte[] data) {
        // RIFF....WEBP. ImageDecoder animates it if it's an animated WebP.
        return data != null && data.length >= 12
                && data[0] == 'R' && data[1] == 'I' && data[2] == 'F' && data[3] == 'F'
                && data[8] == 'W' && data[9] == 'E' && data[10] == 'B' && data[11] == 'P';
    }

    static boolean isDirectImage(String url) {
        if (url == null) return false;
        String u = url.toLowerCase(Locale.US);
        int cut = u.indexOf('?');
        if (cut >= 0) u = u.substring(0, cut);
        cut = u.indexOf('#');
        if (cut >= 0) u = u.substring(0, cut);

        if (u.endsWith(".jpg") || u.endsWith(".jpeg") || u.endsWith(".png")
                || u.endsWith(".webp") || u.endsWith(".gif") || u.endsWith(".bmp")) {
            return true;
        }
        return u.startsWith("https://i.redd.it/") || u.startsWith("https://preview.redd.it/");
    }

    /**
     * Maps a comment link to an image URL to embed, or null to leave it as a link.
     * Direct image links pass through; known media-host page links are resolved to
     * their image via the page's og:image meta tag, and Matrix media links via their
     * redirect (cached in memory and on disk).
     * Without [network], {@link #MISSING_URL} if that would need fetching the page.
     */
    private static String resolveImageUrl(String url, boolean network) {
        if (url == null) return null;
        // Giphy has a clean id -> animated-WebP URL mapping; prefer it over scraping (and
        // over a direct giphy.gif link: the WebP is a fraction of the size).
        String giphy = giphyImageUrl(url);
        if (giphy != null) return giphy;

        if (isDirectImage(url)) return url;

        if (!isResolvableHost(url)) return null;

        String cached = RESOLVED.get(url);
        if (cached != null) return cached.isEmpty() ? null : cached;
        if (recentlyFailed("og:" + url)) return null;
        String stored = InlineCache.getText("og:" + url);
        if (stored != null) { // "" = the page has no image
            RESOLVED.put(url, stored);
            return stored.isEmpty() ? null : stored;
        }
        if (!network) return MISSING_URL;

        // "" = the page has no image (kept on disk for a day); null = the request failed
        // (retried after RETRY_FAILED_MS).
        String image = ShareLinks.isMatrixMedia(url) ? ShareLinks.resolveMatrixMedia(url) : fetchOgImage(url);
        if (image == null) {
            FAILED.put("og:" + url, SystemClock.uptimeMillis());
            return null;
        }
        RESOLVED.put(url, image);
        InlineCache.putText("og:" + url, image);
        return image.isEmpty() ? null : image;
    }

    /** True if [key]'s lookup failed less than RETRY_FAILED_MS ago (then it isn't retried yet). */
    private static boolean recentlyFailed(String key) {
        Long failedAt = FAILED.get(key);
        if (failedAt == null) return false;
        if (SystemClock.uptimeMillis() - failedAt < RETRY_FAILED_MS) return true;
        FAILED.remove(key);
        return false;
    }

    /**
     * Maps a Giphy link to its animated-WebP media URL, or null if not Giphy. The id
     * is the last '-' segment of a /gifs/ slug, or the segment before /giphy.* on a
     * media host.
     */
    static String giphyImageUrl(String url) {
        try {
            String u = url.toLowerCase(Locale.US);
            String id = null;
            int gifs = u.indexOf("giphy.com/gifs/");
            if (gifs >= 0) {
                String path = url.substring(gifs + "giphy.com/gifs/".length());
                int cut = indexOfAny(path, "/?#");
                if (cut >= 0) path = path.substring(0, cut);
                int dash = path.lastIndexOf('-');
                id = dash >= 0 ? path.substring(dash + 1) : path;
            } else if (u.contains(".giphy.com/media/")) {
                int g = url.indexOf("/giphy.");
                if (g >= 0) {
                    String before = url.substring(0, g);
                    int s = before.lastIndexOf('/');
                    if (s >= 0) id = before.substring(s + 1);
                }
            }
            if (id == null || id.isEmpty() || !id.matches("[A-Za-z0-9]+")) return null;
            return "https://media.giphy.com/media/" + id + "/giphy.webp";
        } catch (Throwable t) {
            return null;
        }
    }

    private static int indexOfAny(String s, String chars) {
        int best = -1;
        for (int i = 0; i < chars.length(); i++) {
            int idx = s.indexOf(chars.charAt(i));
            if (idx >= 0 && (best < 0 || idx < best)) best = idx;
        }
        return best;
    }

    static boolean isResolvableHost(String url) {
        String u = url.toLowerCase(Locale.US);
        return u.startsWith("https://imgur.com/")
                || u.startsWith("https://www.imgur.com/")
                || u.startsWith("https://m.imgur.com/")
                || u.startsWith("https://redgifs.com/")
                || u.startsWith("https://www.redgifs.com/")
                || u.startsWith("https://gfycat.com/")
                || u.startsWith("https://www.gfycat.com/")
                || u.startsWith("https://imgflip.com/i/")
                || u.startsWith("https://www.imgflip.com/i/")
                || u.startsWith("https://imgflip.com/gif/")
                || u.startsWith("https://www.imgflip.com/gif/")
                || u.contains("giphy.com/")
                || u.contains("tenor.com/view/")
                || u.contains("reddit.com/gallery/")
                || ShareLinks.isMatrixMedia(url);
    }

    /** The page's og:image; "" if it has none (or is gone); null if the request failed. */
    private static String fetchOgImage(String pageUrl) {
        try {
            // og tags live in <head>, so a truncated page is fine.
            TextResult result = fetchTextResult(pageUrl, null, "text/html,application/xhtml+xml", MAX_HTML_BYTES);
            if (result.body == null) return result.isGone() ? "" : null;
            String html = result.body;
            Matcher m = OG_PROP_FIRST.matcher(html);
            if (!m.find()) {
                m = OG_CONTENT_FIRST.matcher(html);
                if (!m.find()) return "";
            }
            String image = decodeHtmlEntities(m.group(1));
            if (image == null || image.isEmpty()) return "";
            if (image.startsWith("//")) image = "https:" + image;
            return image;
        } catch (Throwable t) {
            return null;
        }
    }

    /** A text GET's outcome: the body (HTTP 200), or null and the HTTP status (-1: none). */
    private static final class TextResult {
        final String body;
        final int code;

        TextResult(String body, int code) {
            this.body = body;
            this.code = code;
        }

        /** The server answered that it isn't there (as opposed to an error worth retrying). */
        boolean isGone() {
            return code == HttpURLConnection.HTTP_NOT_FOUND || code == HttpURLConnection.HTTP_GONE;
        }
    }

    /**
     * GETs a text resource (truncated at maxBytes); null on any non-200 or error. A
     * connection error is retried once.
     */
    static String fetchText(String url, String authorization, String accept, int maxBytes) {
        return fetchTextResult(url, authorization, accept, maxBytes).body;
    }

    private static TextResult fetchTextResult(String url, String authorization, String accept, int maxBytes) {
        for (String attempt : attempts(url)) {
            try {
                return fetchTextOnce(attempt, authorization, accept, maxBytes);
            } catch (IOException e) {
                // next attempt
            } catch (Throwable t) {
                break;
            }
        }
        return new TextResult(null, -1);
    }

    /**
     * The URLs to try for [url], in order. http:// is tried as https:// first:
     * HttpURLConnection doesn't follow a redirect from http to https, which is what image
     * hosts answer plain http with (imgur: 301). If that fails to connect (e.g. a host
     * without https), the original http URL is tried; otherwise the same URL once more.
     */
    static String[] attempts(String url) {
        if (url.regionMatches(true, 0, "http://", 0, 7)) return new String[]{"https://" + url.substring(7), url};
        return new String[]{url, url};
    }

    private static TextResult fetchTextOnce(String url, String authorization, String accept, int maxBytes)
            throws IOException {
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
            conn.setReadTimeout(READ_TIMEOUT_MS);
            conn.setInstanceFollowRedirects(true);
            conn.setRequestProperty("User-Agent", USER_AGENT);
            conn.setRequestProperty("Accept", accept);
            if (authorization != null) conn.setRequestProperty("Authorization", authorization);
            int code = conn.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                if (authorization != null) Log.w(TAG, "api HTTP " + code + ": " + url);
                return new TextResult(null, code);
            }

            InputStream in = conn.getInputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream(32 * 1024);
            byte[] buf = new byte[16 * 1024];
            int n;
            int total = 0;
            while ((n = in.read(buf)) != -1) {
                out.write(buf, 0, n);
                total += n;
                if (total > maxBytes) break;
            }
            in.close();
            return new TextResult(new String(out.toByteArray(), "UTF-8"), code);
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    static String decodeHtmlEntities(String s) {
        if (s == null) return null;
        return s.replace("&amp;", "&")
                .replace("&#38;", "&")
                .replace("&#x26;", "&")
                .replace("&#x2F;", "/")
                .replace("&#47;", "/");
    }

    /** An image's bytes from the memory or disk cache, or null. */
    private static byte[] cached(String url) {
        byte[] data = BYTES.get(url);
        if (data != null) return data;
        data = InlineCache.get("img:" + url);
        if (data != null) remember(url, data);
        return data;
    }

    /**
     * An image's bytes: cached, or downloaded (kept in memory; on disk only once they
     * decode, see persist()). Background thread only.
     */
    private static byte[] fetch(String url) {
        byte[] cached = cached(url);
        if (cached != null) return cached;
        byte[] data = download(url);
        if (data != null) remember(url, data);
        return data;
    }

    /** Keeps image bytes that decoded on disk, unless they're there already. */
    private static void persist(String url, byte[] data) {
        if (url == null || data == null) return;
        String key = "img:" + url;
        if (!InlineCache.has(key)) InlineCache.put(key, data);
    }

    private static void remember(String url, byte[] data) {
        // Downloads may exceed the cache size (up to MAX_DOWNLOAD_BYTES); putting such an
        // entry would evict everything else and then itself, so big ones stay on disk only.
        if (data.length <= BYTES.maxSize() / 4) BYTES.put(url, data);
    }

    /**
     * Downloads an image; null on any non-200 or error. A connection error is retried once
     * (see attempts()).
     */
    private static byte[] download(String url) {
        String[] attempts = attempts(url);
        for (int i = 0; i < attempts.length; i++) {
            try {
                return downloadOnce(attempts[i]);
            } catch (Throwable t) {
                if (i == attempts.length - 1 || !(t instanceof IOException)) {
                    Log.w(TAG, "image fetch error: " + attempts[i] + " (" + t + ")");
                    return null;
                }
            }
        }
        return null;
    }

    private static byte[] downloadOnce(String url) throws IOException {
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
            conn.setReadTimeout(READ_TIMEOUT_MS);
            conn.setInstanceFollowRedirects(true);
            conn.setRequestProperty("User-Agent", USER_AGENT);
            conn.setRequestProperty("Accept", "image/*");
            int code = conn.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                Log.w(TAG, "image fetch HTTP " + code + ": " + url);
                return null;
            }

            InputStream in = conn.getInputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream(32 * 1024);
            byte[] buf = new byte[16 * 1024];
            int n;
            int total = 0;
            while ((n = in.read(buf)) != -1) {
                total += n;
                if (total > MAX_DOWNLOAD_BYTES) {
                    Log.w(TAG, "image exceeds " + MAX_DOWNLOAD_BYTES + " bytes: " + url);
                    return null;
                }
                out.write(buf, 0, n);
            }
            in.close();
            return out.toByteArray();
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static int sampleSize(int srcW, int targetW) {
        int sample = 1;
        int w = srcW;
        while (w / 2 >= targetW) {
            w /= 2;
            sample *= 2;
        }
        return sample;
    }

    private static int dp(Resources res, int value) {
        return Math.round(value * res.getDisplayMetrics().density);
    }

    /**
     * Link display text that is just a media marker (e.g. the Reddit app renders a
     * gif upload as a "[gif]" link). For these we hide the text and show the image
     * inline rather than keeping the marker visible.
     */
    /**
     * Whether a link's text is its URL. rif's linkifier lowercases the scheme in the URL
     * (text "Https://i.redd.it/x.png", typed so by a phone keyboard, has URL "https://..."),
     * so scheme and host compare in any case; the rest (path, query) exactly.
     */
    static boolean isBareLinkText(String text, String url) {
        if (text == null || url == null) return false;
        if (text.equals(url)) return true;
        int a = text.indexOf("://");
        if (a < 0 || a != url.indexOf("://")) return false;
        int ea = text.indexOf('/', a + 3);
        int eb = url.indexOf('/', a + 3);
        if (ea < 0) ea = text.length();
        if (eb < 0) eb = url.length();
        return ea == eb && text.regionMatches(true, 0, url, 0, ea)
                && text.regionMatches(ea, url, eb, text.length() - ea)
                && text.length() == url.length();
    }

    static boolean isHideableLinkText(String text) {
        if (text == null) return false;
        return text.trim().equalsIgnoreCase("[gif]");
    }

}
