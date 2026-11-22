package app.revanced.extension.rif;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.AssetFileDescriptor;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.OpenableColumns;
import android.util.Log;
import android.widget.Toast;

import androidx.core.util.c;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.WeakHashMap;

/**
 * "Reddit image hosting": the Submit screen's Image ("media") tab uploads to Reddit instead of
 * imgur and submits a native image or video post.
 *
 * rif's flow stays as it is (pick, size dialog, progress bar, URL field, submit as a link post);
 * hooks swap the parts underneath:
 * <ul>
 * <li>{@link #pickerIntent}: the picker offers videos as well as images.</li>
 * <li>{@link #videoPreview}, {@link #isVideo}: the confirm dialog and form thumbnail show a frame
 * of a video (rif's decoder only knows images).</li>
 * <li>{@link #upload}: replaces the body of rif's uploader task. Reddit's media lease
 * (/api/media/asset.json), then a multipart POST to S3. Returns the asset URL, which rif puts in
 * the URL field. A video is streamed as it is (never re-encoded) and gets a JPEG poster
 * uploaded as a second asset.</li>
 * <li>{@link #needsResize}: GIFs and videos are never resized, stills only above 20 MB.</li>
 * <li>{@link #fixParams}: SubmitTask's form parameters; a link post to one of our asset URLs
 * becomes kind=image (kind=video plus video_poster_url for a video); an asset that was already
 * posted is uploaded again first.</li>
 * <li>{@link #wrapResponse}: Reddit answers an image or video post with a websocket URL and no
 * post; the post is looked up on the user's submitted page so rif can open it.</li>
 * </ul>
 */
public final class ImageHosting {

    private static final String TAG = "RifImageHosting";
    private static final String API = "https://oauth.reddit.com";
    private static final String FALLBACK_VERSION = "5.6.22";
    private static final Charset UTF8 = Charset.forName("UTF-8");

    /** Largest still image sent as is (bytes); larger ones are resized to this. */
    static final long MAX_STILL_BYTES = 20L * 1024 * 1024;

    /** Reddit's video upload limit (the lease policy's content-length-range upper bound). */
    static final long MAX_VIDEO_BYTES = 1024L * 1024 * 1024;

    /** Longest side of the poster JPEG sent with a video. */
    private static final int POSTER_MAX_PX = 1280;

    private static final int MAX_ASSETS = 8;
    private static final long POLL_INTERVAL_MS = 1500;
    private static final long POLL_TIMEOUT_MS = 30000;
    /** Videos are processed before the post shows up. */
    private static final long POLL_TIMEOUT_VIDEO_MS = 60000;
    /** Slack (server clock vs this device's) when matching a post by title and creation time. */
    private static final long CLOCK_SLACK_S = 120;

    /**
     * An uploaded asset: where it came from, so a second post can upload it again. Kept in memory
     * and, so that it survives process death and drafts, in SharedPreferences ({@link #persist}).
     */
    static final class Asset {
        final String url;
        final String id;
        /** The picked file's Uri as a string (null when unknown); see {@link #source}. */
        final String sourceString;
        final Context context;
        /** The file's MIME type (video/... for a video); null when unknown. */
        final String mime;
        /** A video's poster image URL; null for images. */
        final String posterUrl;
        /** When the upload finished (epoch ms). */
        final long uploadedAtMs;
        /** Sent in a post (Reddit's refusal of that post clears it again), so a new post needs a new upload. */
        boolean submitted;
        /** The "post as GIF" switch's last state, for a video restored without the switch on screen. */
        boolean gif;
        /** Title and time of the post made with this asset (see {@link #findPost}); not persisted. */
        String title;
        long submittedAtMs;

        Asset(String url, String id, String sourceString, Context context, String mime, String posterUrl,
                long uploadedAtMs) {
            this.url = url;
            this.id = id;
            this.sourceString = sourceString;
            this.context = context;
            this.mime = mime;
            this.posterUrl = posterUrl;
            this.uploadedAtMs = uploadedAtMs;
        }

        boolean isVideo() {
            return isVideoMime(mime);
        }

        Uri source() {
            return sourceString != null && sourceString.length() > 0 ? Uri.parse(sourceString) : null;
        }

        /** Whether the asset may still be posted as it is (Reddit keeps unposted uploads for days). */
        boolean usable(long now) {
            return !submitted && now - uploadedAtMs < (isVideo() ? MAX_VIDEO_AGE_MS : MAX_AGE_MS) && (!isVideo() || posterUrl != null);
        }
    }

    /**
     * How long an unposted upload is trusted; older ones are uploaded again. API test 2026-11-11: an
     * unposted image was still accepted and processed after 45 hours, a video only after 8 minutes
     * (a video asset 2 days old was accepted by /api/submit but its post never got media), so a video
     * gets a short limit.
     */
    static final long MAX_AGE_MS = 24L * 3600 * 1000;
    static final long MAX_VIDEO_AGE_MS = 3L * 3600 * 1000;
    /** Records older than this are forgotten. */
    private static final long KEEP_MS = 7L * 24 * 3600 * 1000;
    private static final int MAX_RECORDS = 20;
    private static final String PREFS = "rif_image_hosting";
    private static final String PREFS_KEY = "assets";

    static final String PICK_AGAIN = "This upload can't be posted. Pick the media again.";

    /** Thrown by {@link #fixParams} to stop a submit that would post one of our upload URLs as a link. */
    static final class SubmitRefused extends RuntimeException {
        SubmitRefused(String message) {
            super(message);
        }
    }

    /** Uris (as strings) to whether they are videos, newest last. */
    private static final Map<String, Boolean> VIDEO_CACHE = new LinkedHashMap<String, Boolean>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > 16;
        }
    };

    /** Asset id to asset, newest last. */
    private static final Map<String, Asset> ASSETS = new LinkedHashMap<String, Asset>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Asset> eldest) {
            return size() > MAX_ASSETS;
        }
    };

    /** The image post just sent (set by {@link #fixParams}, used once by {@link #wrapResponse}). */
    private static Asset pendingPost;

    /** What {@link #fixParams} made of one SubmitTask's form: its parameters and their asset. */
    private static final class Fixed {
        final c<String, String>[] pairs;
        final Asset asset;

        Fixed(c<String, String>[] pairs, Asset asset) {
            this.pairs = pairs;
            this.asset = asset;
        }
    }

    /**
     * Per SubmitTask, as {@link SelfPostMedia}'s BUILT: after a signed-in 401/403 rif refreshes the
     * token and asks d0 again, which must not upload a second time (the asset is marked sent).
     */
    private static final Map<Object, Fixed> FIXED = Collections.synchronizedMap(new WeakHashMap<Object, Fixed>());

    /** The newest finished upload of this process: the one the "post as GIF" switch belongs to. */
    private static Asset lastUploaded;

    /** When the last refusal message was shown: rif asks for the post parameters twice. */
    private static long lastRefusalMs;

    /** Error text of the upload that just failed on this thread; see {@link #takeError}. */
    private static final ThreadLocal<String> ERROR = new ThreadLocal<>();

    /** A failure whose message is shown to the user as is. */
    static class UploadException extends Exception {
        UploadException(String message) {
            super(message);
        }
    }

    /** A failure worth another try (a dropped connection, a 5xx); the message is shown if it was the last try. */
    static final class RetryableException extends UploadException {
        RetryableException(String message) {
            super(message);
        }
    }

    interface Progress {
        void sent(long bytes);

        /** Starts again from 0 (a retry). */
        void reset();
    }

    /** Tries of one S3 upload (lease, open the file, post), and the waits before the 2nd and 3rd. */
    private static final int UPLOAD_TRIES = 3;
    private static final long[] BACKOFF_MS = {2000, 5000};

    private static final String NETWORK_ERROR_FINAL = "Reddit upload failed (network error). Try again.";

    /** Opens the file (or poster bytes) for one try. */
    private interface Source {
        InputStream open() throws UploadException;
    }

    private ImageHosting() {}

    // ---------------------------------------------------------------- hooks

    /**
     * Picker hook (GetContent.createIntent, before its return): an image picker also offers
     * videos. Any other intent is returned as it was.
     */
    public static Intent pickerIntent(Intent intent) {
        try {
            if (intent != null && "image/*".equals(intent.getType())) {
                intent.setType("*/*");
                intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[] {"image/*", "video/*"});
            }
        } catch (Throwable t) {
            Log.w(TAG, "picker intent failed", t);
        }
        return intent;
    }

    /**
     * Preview hook (rif's image decoder, at its entry): for a video, a frame scaled to fit
     * {@code maxW} x {@code maxH}; null for anything else, so rif decodes it as before.
     */
    public static Bitmap videoPreview(Uri uri, int maxW, int maxH) {
        try {
            Context ctx = Settings.context();
            if (ctx == null || uri == null || !isVideo(ctx, uri)) return null;
            return frameAt(ctx, uri, maxW, maxH);
        } catch (Throwable t) {
            Log.w(TAG, "video preview failed", t);
            return null;
        }
    }

    /** Whether the file behind {@code uri} is a video (cached per Uri). Used to skip image rotation. */
    public static boolean isVideo(Uri uri) {
        try {
            Context ctx = Settings.context();
            return ctx != null && uri != null && isVideo(ctx, uri);
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Hook (the Submit screen's confirm-and-upload branch, main thread): a file was chosen. Shows the
     * "post as GIF" switch for a video, hides it for anything else.
     */
    public static void mediaChosen(Uri uri) {
        try {
            PostAsGifView.mediaChosen(isVideo(uri));
        } catch (Throwable t) {
            Log.w(TAG, "media chosen failed", t);
        }
    }

    private static boolean isVideo(Context ctx, Uri uri) {
        String key = uri.toString();
        synchronized (VIDEO_CACHE) {
            Boolean known = VIDEO_CACHE.get(key);
            if (known != null) return known;
        }
        boolean video = false;
        try {
            video = isVideoMime(countAndSniff(ctx, uri, false).mime);
        } catch (Throwable t) {
            Log.w(TAG, "type check failed: " + t);
            return false;
        }
        synchronized (VIDEO_CACHE) {
            VIDEO_CACHE.put(key, video);
        }
        return video;
    }

    /**
     * Hook 1: replaces the body of rif's uploader's doInBackground (runs on a background
     * thread). {@code task} is rif's uploader, a PropertyChangeListener that feeds the
     * progress bar. Returns the asset URL, or null with {@link #takeError} set.
     */
    public static String upload(Object task, Uri uri, Context context) {
        ERROR.remove();
        try {
            Context ctx = context != null ? context : Settings.context();
            if (ctx == null || uri == null) throw new UploadException("Couldn't read the file.");
            final PropertyChangeListener listener =
                    task instanceof PropertyChangeListener ? (PropertyChangeListener) task : null;
            Progress progress = new Progress() {
                private long last = -1;

                @Override
                public void sent(long bytes) {
                    if (listener == null || bytes - last < 32 * 1024) return;
                    notifyProgress(bytes);
                }

                @Override
                public void reset() {
                    if (listener == null || last <= 0) return;
                    notifyProgress(0);
                }

                private void notifyProgress(long bytes) {
                    last = bytes;
                    try {
                        listener.propertyChange(new PropertyChangeEvent(listener, "sent", null, Long.valueOf(bytes)));
                    } catch (Throwable ignored) {
                    }
                }
            };
            Asset asset = uploadAsset(uri, ctx, progress);
            return asset.url;
        } catch (UploadException e) {
            Log.w(TAG, "upload failed: " + e.getMessage());
            ERROR.set(e.getMessage());
        } catch (Throwable t) {
            Log.w(TAG, "upload failed", t);
            ERROR.set("Reddit upload failed.");
        }
        return null;
    }

    /** The error text left by the last {@link #upload} failure on this thread (cleared by reading). */
    public static String takeError() {
        String e = ERROR.get();
        ERROR.remove();
        return e;
    }

    /** The file's size in bytes for rif's progress bar, or -1 (indeterminate). */
    public static long size(Uri uri, Context context) {
        try {
            Context ctx = context != null ? context : Settings.context();
            long n = countAndSniff(ctx, uri, true).length;
            return n > 0 ? n : -1;
        } catch (Throwable t) {
            return -1;
        }
    }

    /**
     * Hook 2: whether rif should resize the picked image before uploading. GIFs never
     * (resizing flattens them to one frame), videos never (rif can't resize them); stills only
     * above 20 MB.
     */
    public static boolean needsResize(Uri uri, long size) {
        if (size <= MAX_STILL_BYTES) return false;
        try {
            Context ctx = Settings.context();
            if (ctx != null && uri != null) {
                String mime = countAndSniff(ctx, uri, false).mime;
                return !"image/gif".equals(mime) && !isVideoMime(mime);
            }
        } catch (Throwable t) {
            Log.w(TAG, "mime sniff failed", t);
        }
        return true;
    }

    /**
     * Hook 3: SubmitTask.d0's form parameters. A link post to one of our asset URLs becomes an
     * image post (a video post, with its poster, for a video; a "videogif" post with the same poster
     * when the "post as GIF" switch is on, see {@link PostAsGifView}). The upload's record comes from
     * memory or, after process death or from a restored draft, from SharedPreferences. A reused asset
     * makes a broken post, so one that was sent before (or is too old) is uploaded again from the
     * picked file; if that is not possible the submit stops with a message ({@link SubmitRefused})
     * and the form is kept. An upload URL is never sent as a link.
     */
    public static c<String, String>[] fixParams(c<String, String>[] pairs, Object task) {
        String id = null;
        try {
            if (pairs == null) return pairs;
            Fixed fixed = task != null ? FIXED.get(task) : null;
            if (fixed != null) {
                // rif's retry of the same task: send what the first attempt sent, and expect its post.
                Log.w(TAG, "submit retried: reusing asset " + fixed.asset.id);
                synchronized (ASSETS) {
                    pendingPost = fixed.asset;
                }
                return fixed.pairs;
            }
            int kindAt = -1;
            int urlAt = -1;
            int titleAt = -1;
            for (int i = 0; i < pairs.length; i++) {
                if (pairs[i] == null) continue;
                if ("kind".equals(pairs[i].a)) kindAt = i;
                else if ("url".equals(pairs[i].a)) urlAt = i;
                else if ("title".equals(pairs[i].a)) titleAt = i;
            }
            if (kindAt < 0 || urlAt < 0 || !"link".equals(pairs[kindAt].b)) return pairs;
            id = assetIdOf(pairs[urlAt].b);
            if (id == null) return pairs;
            return assetParams(pairs, kindAt, urlAt, titleAt, id, task);
        } catch (SubmitGuard.Cancelled e) {
            Log.w(TAG, "send cancelled by rif: the post is not sent");
            throw e;
        } catch (SubmitRefused r) {
            refuse(r);
            throw r;
        } catch (Throwable t) {
            Log.w(TAG, "submit params failed", t);
            if (id == null) return pairs;
            SubmitRefused r = new SubmitRefused(PICK_AGAIN);
            refuse(r);
            throw r;
        }
    }

    private static c<String, String>[] assetParams(c<String, String>[] pairs, int kindAt, int urlAt, int titleAt,
            String id, Object task) {
        Asset asset = lookup(id);
        long now = System.currentTimeMillis();
        if (asset == null || !asset.usable(now)) {
            Log.w(TAG, "asset " + id + (asset == null ? " has no record"
                    : asset.submitted ? " was sent already" : " is too old") + ": uploading again");
            String why = PICK_AGAIN;
            Asset again = null;
            Uri source = asset != null ? asset.source() : null;
            Context ctx = asset != null && asset.context != null ? asset.context : Settings.context();
            if (source != null && ctx != null) {
                try {
                    again = uploadAsset(source, ctx, null);
                } catch (UploadException e) {
                    Log.w(TAG, "re-upload failed: " + e.getMessage());
                    if (!"Couldn't read the file.".equals(e.getMessage())) why = e.getMessage();
                }
            }
            if (again == null) throw new SubmitRefused(why);
            // rif cancelled the send during the upload (Back, a recreated screen): don't post.
            SubmitGuard.throwIfCancelled(task);
            asset = again;
            pairs[urlAt] = c.a("url", again.url);
        }
        asset.submitted = true;
        asset.title = titleAt >= 0 ? pairs[titleAt].b : null;
        asset.submittedAtMs = now;
        if (asset.isVideo()) {
            // The switch decides while its row is on screen; otherwise (a restored draft) the last state.
            boolean gif = PostAsGifView.showingVideo() ? PostAsGifView.asGif : asset.gif;
            asset.gif = gif;
            pairs[kindAt] = c.a("kind", gif ? "videogif" : "video");
            c<String, String>[] withPoster = Arrays.copyOf(pairs, pairs.length + 1);
            withPoster[pairs.length] = c.a("video_poster_url", asset.posterUrl);
            pairs = withPoster;
        } else {
            pairs[kindAt] = c.a("kind", "image");
        }
        persist(asset);
        synchronized (ASSETS) {
            pendingPost = asset;
        }
        if (task != null) FIXED.put(task, new Fixed(pairs, asset));
        return pairs;
    }

    /** Tells the user why the submit stopped (a toast; rif adds its own "Submission failed" one). */
    private static void refuse(SubmitRefused r) {
        try {
            final Context ctx = Settings.context();
            if (ctx == null) return;
            long now = System.currentTimeMillis();
            synchronized (ASSETS) {
                if (now - lastRefusalMs < 4000) return;
                lastRefusalMs = now;
            }
            final String text = r.getMessage();
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    try {
                        Toast.makeText(ctx, text, Toast.LENGTH_LONG).show();
                    } catch (Throwable t) {
                        Log.w(TAG, "refusal toast failed", t);
                    }
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "refusal message failed", t);
        }
    }

    /**
     * The "post as GIF" switch changed: remembered with the newest upload, for a draft restored later
     * without the switch on screen.
     */
    static void gifToggled(boolean on) {
        try {
            Asset a;
            synchronized (ASSETS) {
                a = lastUploaded;
            }
            if (a != null && a.isVideo() && !a.submitted && a.gif != on) {
                a.gif = on;
                persist(a);
            }
        } catch (Throwable t) {
            Log.w(TAG, "gif state not saved", t);
        }
    }

    /**
     * Hook 4: SubmitTask.k0's response stream. Only touched for an image post made through
     * {@link #fixParams}; any other response is returned as it was.
     */
    public static InputStream wrapResponse(InputStream in) {
        Asset asset;
        synchronized (ASSETS) {
            asset = pendingPost;
            pendingPost = null;
        }
        if (asset == null || in == null) return in;
        byte[] raw;
        try {
            raw = readAll(in);
        } catch (IOException e) {
            Log.w(TAG, "response read failed: " + e);
            return new ByteArrayInputStream(new byte[0]);
        }
        try {
            String text = new String(raw, UTF8);
            String userPage = pendingReplyUserPage(text);
            if (userPage == null) {
                if (hasErrors(text) && asset.submitted) {
                    // Reddit refused the post: the upload is unused, so a retry needs no new one.
                    asset.submitted = false;
                    persist(asset);
                }
                return new ByteArrayInputStream(raw);
            }
            String[] post = waitForPost(asset);
            String reply = post != null
                    ? successReply("https://www.reddit.com" + post[0], post[1])
                    : successReply(userPage, "");
            return new ByteArrayInputStream(reply.getBytes(UTF8));
        } catch (Throwable t) {
            Log.w(TAG, "response rewrite failed", t);
            return new ByteArrayInputStream(raw);
        }
    }

    // ------------------------------------------------------- pure helpers

    /** Reddit's asset URL for an uploaded id: what the Submit form's URL field holds. */
    static String assetUrl(String action, String assetId) {
        String base = action.startsWith("//") ? "https:" + action : action;
        while (base.endsWith("/")) base = base.substring(0, base.length() - 1);
        return base + "/" + assetId;
    }

    private static final String IMAGE_BUCKET = "reddit-uploaded-media";
    private static final String VIDEO_BUCKET = "reddit-uploaded-video";

    static boolean isVideoMime(String mime) {
        return mime != null && mime.startsWith("video/");
    }

    /**
     * The asset id in one of Reddit's upload URLs, else null. Both buckets (images, videos), on S3 or
     * S3 accelerate, http or https, with the bucket in the host or (path style) in the path.
     */
    static String assetIdOf(String url) {
        if (url == null) return null;
        String u = url.trim();
        int cut = u.indexOf('?');
        if (cut >= 0) u = u.substring(0, cut);
        cut = u.indexOf('#');
        if (cut >= 0) u = u.substring(0, cut);
        int scheme = u.indexOf("://");
        if (scheme < 0) return null;
        String rest = u.substring(scheme + 3);
        int slash = rest.indexOf('/');
        if (slash < 0) return null;
        String host = rest.substring(0, slash).toLowerCase(java.util.Locale.ROOT);
        String path = rest.substring(slash);
        boolean ours = host.startsWith(IMAGE_BUCKET + ".") || host.startsWith(VIDEO_BUCKET + ".")
                || (host.contains("amazonaws.com") && (path.toLowerCase(java.util.Locale.ROOT).startsWith("/" + IMAGE_BUCKET + "/")
                        || path.toLowerCase(java.util.Locale.ROOT).startsWith("/" + VIDEO_BUCKET + "/")));
        if (!ours) return null;
        while (path.endsWith("/")) path = path.substring(0, path.length() - 1);
        String id = path.substring(path.lastIndexOf('/') + 1);
        return id.length() > 0 && !id.equalsIgnoreCase(IMAGE_BUCKET) && !id.equalsIgnoreCase(VIDEO_BUCKET) ? id : null;
    }

    /** ISO BMFF brands (after "ftyp") of still images, not videos. */
    private static final String[] IMAGE_BRANDS =
            {"heic", "heix", "hevc", "heim", "heis", "mif1", "msf1", "avif", "avis"};

    /**
     * MIME type from a file's first bytes; null if it isn't GIF, PNG, JPEG, WebP, MP4/MOV or WebM
     * (HEIC and AVIF share the MP4 container, and are not sniffed as videos).
     */
    static String sniffMime(byte[] b, int n) {
        if (n >= 12 && b[4] == 'f' && b[5] == 't' && b[6] == 'y' && b[7] == 'p') {
            String brand = new String(b, 8, 4, UTF8);
            for (String image : IMAGE_BRANDS) {
                if (image.equals(brand)) return null;
            }
            return "qt  ".equals(brand) ? "video/quicktime" : "video/mp4";
        }
        if (n >= 4 && (b[0] & 0xff) == 0x1a && (b[1] & 0xff) == 0x45 && (b[2] & 0xff) == 0xdf
                && (b[3] & 0xff) == 0xa3) return "video/webm";
        if (n >= 4 && b[0] == 'G' && b[1] == 'I' && b[2] == 'F' && b[3] == '8') return "image/gif";
        if (n >= 4 && (b[0] & 0xff) == 0x89 && b[1] == 'P' && b[2] == 'N' && b[3] == 'G') return "image/png";
        if (n >= 3 && (b[0] & 0xff) == 0xff && (b[1] & 0xff) == 0xd8 && (b[2] & 0xff) == 0xff) return "image/jpeg";
        if (n >= 12 && b[0] == 'R' && b[1] == 'I' && b[2] == 'F' && b[3] == 'F'
                && b[8] == 'W' && b[9] == 'E' && b[10] == 'B' && b[11] == 'P') return "image/webp";
        return null;
    }

    static String extensionFor(String mime) {
        if ("image/gif".equals(mime)) return "gif";
        if ("image/png".equals(mime)) return "png";
        if ("image/webp".equals(mime)) return "webp";
        if ("video/quicktime".equals(mime)) return "mov";
        if ("video/webm".equals(mime)) return "webm";
        if (isVideoMime(mime)) return "mp4";
        return "jpg";
    }

    /**
     * Size {@code w} x {@code h} scaled down (never up) to fit {@code maxW} x {@code maxH}, keeping
     * the aspect ratio; {0, 0} when the size is unknown. A non-positive max means no limit.
     */
    static int[] fitSize(int w, int h, int maxW, int maxH) {
        if (w <= 0 || h <= 0) return new int[] {0, 0};
        double scale = 1;
        if (maxW > 0) scale = Math.min(scale, (double) maxW / w);
        if (maxH > 0) scale = Math.min(scale, (double) maxH / h);
        return new int[] {Math.max(1, (int) Math.round(w * scale)), Math.max(1, (int) Math.round(h * scale))};
    }

    /** The parts of Reddit's /api/media/asset.json reply the upload needs. */
    static final class Lease {
        String action;
        String id;
        final List<String[]> fields = new ArrayList<>();
    }

    static Lease parseLease(String json) throws JSONException {
        JSONObject o = new JSONObject(json);
        JSONObject args = o.getJSONObject("args");
        Lease lease = new Lease();
        lease.action = args.getString("action");
        lease.id = o.getJSONObject("asset").getString("asset_id");
        JSONArray fields = args.getJSONArray("fields");
        for (int i = 0; i < fields.length(); i++) {
            JSONObject f = fields.getJSONObject(i);
            lease.fields.add(new String[] {f.getString("name"), f.getString("value")});
        }
        return lease;
    }

    /** The multipart body up to the file's bytes: every lease field in order, then the file part's header. */
    static byte[] multipartHead(String boundary, List<String[]> fields, String fileName, String mime) {
        StringBuilder sb = new StringBuilder();
        for (String[] f : fields) {
            sb.append("--").append(boundary).append("\r\n")
                    .append("Content-Disposition: form-data; name=\"").append(f[0]).append("\"\r\n\r\n")
                    .append(f[1]).append("\r\n");
        }
        sb.append("--").append(boundary).append("\r\n")
                .append("Content-Disposition: form-data; name=\"file\"; filename=\"").append(fileName).append("\"\r\n")
                .append("Content-Type: ").append(mime).append("\r\n\r\n");
        return sb.toString().getBytes(UTF8);
    }

    static byte[] multipartTail(String boundary) {
        return ("\r\n--" + boundary + "--\r\n").getBytes(UTF8);
    }

    /**
     * Non-null (the user's submitted page, possibly empty) when the submit reply is the image
     * post's "processing" reply: no errors, a websocket URL and no post url.
     */
    static String pendingReplyUserPage(String body) {
        try {
            JSONObject json = new JSONObject(body).getJSONObject("json");
            JSONArray errors = json.optJSONArray("errors");
            if (errors != null && errors.length() > 0) return null;
            JSONObject data = json.optJSONObject("data");
            if (data == null) return null;
            if (data.optString("url", "").length() > 0) return null;
            if (data.optString("websocket_url", "").length() == 0) return null;
            return data.optString("user_submitted_page", "");
        } catch (JSONException e) {
            return null;
        }
    }

    /** Whether a submit reply says Reddit refused the post (a non-empty json.errors list). */
    static boolean hasErrors(String body) {
        try {
            JSONArray errors = new JSONObject(body).getJSONObject("json").optJSONArray("errors");
            return errors != null && errors.length() > 0;
        } catch (JSONException e) {
            return false;
        }
    }

    /** {permalink, id} of the newest post in a submitted listing that belongs to {@code assetId}, or null. */
    static String[] findPost(String listing, String assetId) {
        return findPost(listing, assetId, null, 0);
    }

    /**
     * {permalink, id} of the newest post in a submitted listing that belongs to {@code assetId}: its
     * url (or a video's media.reddit_video urls) holds i.redd.it/{assetId} or v.redd.it/{assetId}.
     * Failing that, and when {@code title} is given, the newest post with that title created at
     * or after {@code afterEpochSec} (a video's post may not carry the asset id). Null if none.
     */
    static String[] findPost(String listing, String assetId, String title, long afterEpochSec) {
        try {
            JSONArray children = new JSONObject(listing).getJSONObject("data").getJSONArray("children");
            for (int i = 0; i < children.length(); i++) {
                JSONObject d = children.getJSONObject(i).getJSONObject("data");
                if (relatesTo(d, assetId)) {
                    String[] found = postOf(d);
                    if (found != null) return found;
                }
            }
            String wanted = title != null ? title.trim() : "";
            if (wanted.length() > 0) {
                for (int i = 0; i < children.length(); i++) {
                    JSONObject d = children.getJSONObject(i).getJSONObject("data");
                    if (wanted.equals(d.optString("title", "").trim())
                            && d.optDouble("created_utc", 0) >= afterEpochSec) {
                        String[] found = postOf(d);
                        if (found != null) return found;
                    }
                }
            }
        } catch (JSONException ignored) {
        }
        return null;
    }

    private static String[] postOf(JSONObject d) {
        String permalink = d.optString("permalink", "");
        String id = d.optString("id", "");
        return permalink.startsWith("/") && id.length() > 0 ? new String[] {permalink, id} : null;
    }

    /** Whether a submitted post's url, or its media.reddit_video urls, point at the asset. */
    private static boolean relatesTo(JSONObject d, String assetId) {
        String image = "i.redd.it/" + assetId;
        String video = "v.redd.it/" + assetId;
        for (String key : new String[] {"url", "url_overridden_by_dest"}) {
            String url = d.optString(key, "");
            if (url.contains(image) || url.contains(video)) return true;
        }
        for (String key : new String[] {"media", "secure_media"}) {
            JSONObject media = d.optJSONObject(key);
            JSONObject rv = media != null ? media.optJSONObject("reddit_video") : null;
            if (rv == null) continue;
            for (String field : new String[] {"fallback_url", "hls_url", "dash_url", "scrubber_media_url"}) {
                if (rv.optString(field, "").contains(video)) return true;
            }
        }
        return false;
    }

    /** A submit reply in the shape rif's SubmitTask parses; {@code id} may be empty. */
    static String successReply(String url, String id) {
        try {
            JSONObject data = new JSONObject();
            data.put("url", url);
            data.put("id", id);
            data.put("name", id.length() > 0 ? "t3_" + id : "");
            JSONObject json = new JSONObject();
            json.put("errors", new JSONArray());
            json.put("data", data);
            return new JSONObject().put("json", json).toString();
        } catch (JSONException e) {
            throw new IllegalStateException(e);
        }
    }

    // ------------------------------------------------------------ uploading

    /** Uploads {@code uri} to Reddit and remembers it for the submit hooks. */
    private static Asset uploadAsset(Uri uri, Context ctx, Progress progress) throws UploadException {
        Asset asset = uploadOnly(uri, ctx, progress);
        asset.gif = asset.isVideo() && PostAsGifView.asGif;
        rememberAsset(asset);
        synchronized (ASSETS) {
            lastUploaded = asset;
        }
        return asset;
    }

    /** Uploads {@code uri} to Reddit and returns the asset, without recording it (comment media uses this). */
    static Asset uploadOnly(Uri uri, Context ctx, Progress progress) throws UploadException {
        Sniff sniff;
        try {
            sniff = countAndSniff(ctx, uri, true);
        } catch (IOException | RuntimeException e) {
            Log.w(TAG, "read failed: " + e);
            throw new UploadException("Couldn't read the file.");
        }
        if (sniff.length <= 0) throw new UploadException("Couldn't read the file.");
        boolean video = isVideoMime(sniff.mime);
        byte[] poster = null;
        if (video) {
            if (sniff.length > MAX_VIDEO_BYTES) {
                throw new UploadException("The video is over Reddit's 1 GB limit.");
            }
            // Before the (long) video upload, so a file without a usable frame fails at once.
            poster = posterJpeg(ctx, uri);
        }
        String fileName = (video ? "video." : "image.") + extensionFor(sniff.mime);

        final Context fileCtx = ctx;
        final Uri fileUri = uri;
        Lease l = uploadWithRetry(ctx, fileName, sniff.mime, new Source() {
            @Override
            public InputStream open() throws UploadException {
                try {
                    InputStream in = fileCtx.getContentResolver().openInputStream(fileUri);
                    if (in != null) return in;
                } catch (IOException | RuntimeException e) {
                    Log.w(TAG, "open failed: " + e);
                }
                throw new UploadException("Couldn't read the file.");
            }
        }, sniff.length, progress);

        String posterUrl = null;
        if (video) {
            final byte[] posterBytes = poster;
            Lease pl = uploadWithRetry(ctx, "poster.jpg", "image/jpeg", new Source() {
                @Override
                public InputStream open() {
                    return new ByteArrayInputStream(posterBytes);
                }
            }, poster.length, null);
            posterUrl = assetUrl(pl.action, pl.id);
        }

        Context app = ctx.getApplicationContext();
        return new Asset(assetUrl(l.action, l.id), l.id, uri.toString(), app != null ? app : ctx, sniff.mime,
                posterUrl, System.currentTimeMillis());
    }

    /** Keeps the asset in memory and in SharedPreferences (the URL field outlives this process). */
    private static void rememberAsset(Asset asset) {
        synchronized (ASSETS) {
            ASSETS.put(asset.id, asset);
        }
        persist(asset);
    }

    /** The asset for an id: from memory, else from SharedPreferences (after process death, a restored draft). */
    private static Asset lookup(String id) {
        synchronized (ASSETS) {
            Asset a = ASSETS.get(id);
            if (a != null) return a;
        }
        Context ctx = Settings.context();
        if (ctx == null) return null;
        try {
            synchronized (ASSETS) {
                for (Asset a : assetsFromJson(ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                        .getString(PREFS_KEY, "[]"), ctx)) {
                    if (a.id.equals(id)) {
                        ASSETS.put(id, a);
                        return a;
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "asset records not read", t);
        }
        return null;
    }

    /** Writes the asset's record (replacing an older one for the same id) and forgets stale records. */
    private static void persist(Asset asset) {
        Context ctx = asset.context != null ? asset.context : Settings.context();
        if (ctx == null) return;
        try {
            synchronized (ASSETS) {
                SharedPreferences prefs = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
                List<Asset> all = new ArrayList<>(assetsFromJson(prefs.getString(PREFS_KEY, "[]"), ctx));
                for (int i = all.size() - 1; i >= 0; i--) {
                    if (all.get(i).id.equals(asset.id)) all.remove(i);
                }
                all.add(asset);
                prefs.edit().putString(PREFS_KEY, assetsToJson(prune(all, System.currentTimeMillis()))).apply();
            }
        } catch (Throwable t) {
            Log.w(TAG, "asset record not saved", t);
        }
    }

    /** Drops records older than {@link #KEEP_MS} and all but the newest {@link #MAX_RECORDS}; the list is oldest first. */
    static List<Asset> prune(List<Asset> all, long now) {
        List<Asset> kept = new ArrayList<>();
        for (Asset a : all) {
            if (now - a.uploadedAtMs < KEEP_MS) kept.add(a);
        }
        return kept.size() > MAX_RECORDS ? new ArrayList<>(kept.subList(kept.size() - MAX_RECORDS, kept.size())) : kept;
    }

    static String assetsToJson(List<Asset> all) {
        JSONArray out = new JSONArray();
        try {
            for (Asset a : all) {
                JSONObject o = new JSONObject();
                o.put("id", a.id);
                o.put("url", a.url);
                if (a.sourceString != null) o.put("src", a.sourceString);
                if (a.mime != null) o.put("mime", a.mime);
                if (a.posterUrl != null) o.put("poster", a.posterUrl);
                o.put("at", a.uploadedAtMs);
                o.put("sent", a.submitted);
                o.put("gif", a.gif);
                out.put(o);
            }
        } catch (JSONException e) {
            throw new IllegalStateException(e);
        }
        return out.toString();
    }

    /** Parses {@link #assetsToJson}'s output; bad entries are skipped. */
    static List<Asset> assetsFromJson(String json, Context ctx) {
        List<Asset> all = new ArrayList<>();
        try {
            JSONArray in = new JSONArray(json);
            for (int i = 0; i < in.length(); i++) {
                JSONObject o = in.optJSONObject(i);
                if (o == null) continue;
                String id = o.optString("id", "");
                String url = o.optString("url", "");
                if (id.length() == 0 || url.length() == 0) continue;
                Asset a = new Asset(url, id, o.has("src") ? o.optString("src", null) : null, ctx,
                        o.has("mime") ? o.optString("mime", null) : null,
                        o.has("poster") ? o.optString("poster", null) : null, o.optLong("at", 0));
                a.submitted = o.optBoolean("sent", false);
                a.gif = o.optBoolean("gif", false);
                all.add(a);
            }
        } catch (JSONException e) {
            Log.w(TAG, "asset records unreadable: " + e);
        }
        return all;
    }

    /** For tests: registers an uploaded asset (finished just now) without uploading anything. */
    static void rememberAsset(String id, String url, String mime, String posterUrl) {
        rememberAsset(id, url, mime, posterUrl, System.currentTimeMillis());
    }

    /** For tests: the same, uploaded at {@code uploadedAtMs}. */
    static void rememberAsset(String id, String url, String mime, String posterUrl, long uploadedAtMs) {
        Asset a = new Asset(url, id, null, null, mime, posterUrl, uploadedAtMs);
        rememberAsset(a);
        synchronized (ASSETS) {
            lastUploaded = a;
        }
    }

    /** For tests: forgets every uploaded asset. */
    static void forgetAssets() {
        synchronized (ASSETS) {
            ASSETS.clear();
            FIXED.clear();
            pendingPost = null;
            lastUploaded = null;
        }
    }

    /**
     * One upload: up to {@link #UPLOAD_TRIES} times lease, open the file, post to S3, each try with a
     * fresh lease (a dropped connection is not retried by Android's HttpURLConnection) after a pause
     * of 2 s, then 5 s. Retried: dropped connections and timeouts, HTTP 500/503 and S3's 400
     * RequestTimeout. Not retried: other HTTP errors and file read errors. Returns the lease used.
     */
    private static Lease uploadWithRetry(Context ctx, String fileName, String mime, Source source, long length,
            Progress progress) throws UploadException {
        for (int attempt = 1; ; attempt++) {
            try {
                if (attempt > 1 && progress != null) progress.reset();
                Lease l = lease(ctx, fileName, mime);
                InputStream in = source.open();
                postToS3(l, fileName, mime, in, length, progress, attempt);
                return l;
            } catch (RetryableException e) {
                if (attempt >= UPLOAD_TRIES) {
                    throw new UploadException(e.getMessage() + " Try again.");
                }
                try {
                    Thread.sleep(BACKOFF_MS[attempt - 1]);
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    throw new UploadException(e.getMessage() + " Try again.");
                }
            }
        }
    }

    /** Whether an S3 reply is worth another try: HTTP 500/503, or 400 with RequestTimeout in the body. */
    static boolean isRetryableHttp(int code, String body) {
        if (code == 500 || code == 503) return true;
        return code == 400 && body != null && body.contains("RequestTimeout");
    }

    /** Asks Reddit for an upload lease (/api/media/asset.json); once more if the connection fails. */
    private static Lease lease(Context ctx, String fileName, String mime) throws UploadException {
        try {
            return leaseOnce(ctx, fileName, mime);
        } catch (RetryableException e) {
            Log.w(TAG, "asset request failed, once more: " + e.getMessage());
            try {
                Thread.sleep(1000);
            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
                throw e;
            }
            return leaseOnce(ctx, fileName, mime);
        }
    }

    /** One lease request (/api/media/asset.json) for a file called {@code fileName}. */
    private static Lease leaseOnce(Context ctx, String fileName, String mime) throws UploadException {
        String form;
        try {
            form = "filepath=" + URLEncoder.encode(fileName, "UTF-8")
                    + "&mimetype=" + URLEncoder.encode(mime, "UTF-8") + "&raw_json=1";
        } catch (java.io.UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
        Resp lease = authed(ctx, API + "/api/media/asset.json", form.getBytes(UTF8));
        if (lease.code != 200) {
            Log.w(TAG, "asset request " + lease.code + ": " + lease.body);
            throw new UploadException("Reddit upload failed (HTTP " + lease.code + ").");
        }
        try {
            return parseLease(lease.body);
        } catch (JSONException e) {
            Log.w(TAG, "asset reply: " + e);
            throw new UploadException("Reddit upload failed (bad reply).");
        }
    }

    /**
     * Streams {@code length} bytes of {@code in} (closed here) to the lease's S3 bucket as a
     * multipart form. The bucket is the lease's own (videos use another one than images).
     * File read errors end the upload at once; a network failure or a retryable HTTP reply throws
     * {@link RetryableException}.
     */
    private static void postToS3(Lease l, String fileName, String mime, InputStream in, long length,
            Progress progress, int attempt) throws UploadException {
        String boundary = "----rif" + UUID.randomUUID().toString().replace("-", "");
        byte[] head = multipartHead(boundary, l.fields, fileName, mime);
        byte[] tail = multipartTail(boundary);
        String action = l.action.startsWith("//") ? "https:" + l.action : l.action;
        HttpURLConnection conn = null;
        String stage = "connect";
        long sent = 0;
        long t0 = System.currentTimeMillis();
        try {
            conn = (HttpURLConnection) new URL(action).openConnection();
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(120000);
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            conn.setFixedLengthStreamingMode(head.length + length + tail.length);
            OutputStream out = conn.getOutputStream();
            stage = "send";
            out.write(head);
            byte[] buf = new byte[16 * 1024];
            while (true) {
                int n;
                try {
                    n = in.read(buf);
                } catch (IOException e) {
                    Log.w(TAG, "file read failed at " + sent + "/" + length + " B: " + e);
                    throw new UploadException("Couldn't read the file.");
                }
                if (n <= 0) break;
                sent += n;
                if (sent > length) throw new UploadException("Couldn't read the file.");
                out.write(buf, 0, n);
                if (progress != null) progress.sent(sent);
            }
            if (sent != length) throw new UploadException("Couldn't read the file.");
            out.write(tail);
            out.close();
            stage = "response";
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) {
                String body = readText(conn.getErrorStream());
                Log.w(TAG, "S3 try " + attempt + " got HTTP " + code + " after " + (System.currentTimeMillis() - t0)
                        + " ms: " + body);
                if (isRetryableHttp(code, body)) {
                    throw new RetryableException("Reddit upload failed (HTTP " + code + ").");
                }
                throw new UploadException("Reddit upload failed (HTTP " + code + ").");
            }
        } catch (IOException e) {
            Log.w(TAG, "S3 try " + attempt + " failed in " + stage + " at " + sent + "/" + length + " B after "
                    + (System.currentTimeMillis() - t0) + " ms: " + e);
            if ("send".equals(stage) && conn != null) logServerReply(conn);
            throw new RetryableException("Reddit upload failed (network error).");
        } finally {
            closeQuietly(in);
            if (conn != null) conn.disconnect();
        }
    }

    /** Best effort after a failed send: the reply S3 may have given before it cut the connection. */
    private static void logServerReply(HttpURLConnection conn) {
        try {
            int code = conn.getResponseCode();
            Log.w(TAG, "S3 replied HTTP " + code + ": " + readText(conn.getErrorStream()));
        } catch (Throwable t) {
            Log.w(TAG, "S3 gave no reply: " + t);
        }
    }

    // ------------------------------------------------------------- requests

    static final class Resp {
        int code;
        String body;
    }

    /** One request to oauth.reddit.com with the user's token; a 401/403 gets a fresh token and one retry. */
    static Resp authed(Context ctx, String url, byte[] form) throws UploadException {
        String token = token(ctx);
        Resp r = call(ctx, url, form, token);
        if (r.code == 401 || r.code == 403) {
            try {
                AccountManager.get(ctx).invalidateAuthToken("com.reddit", token);
            } catch (Throwable ignored) {
            }
            token = token(ctx);
            r = call(ctx, url, form, token);
        }
        return r;
    }

    private static Resp call(Context ctx, String url, byte[] form, String token) throws UploadException {
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(30000);
            conn.setRequestProperty("User-Agent", userAgent(ctx));
            conn.setRequestProperty("Authorization", "bearer " + token);
            if (form != null) {
                conn.setDoOutput(true);
                conn.setRequestMethod("POST");
                conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                OutputStream out = conn.getOutputStream();
                out.write(form);
                out.close();
            }
            Resp r = new Resp();
            r.code = conn.getResponseCode();
            r.body = readText(r.code >= 400 ? conn.getErrorStream() : conn.getInputStream());
            return r;
        } catch (IOException e) {
            Log.w(TAG, "request failed: " + e);
            throw new RetryableException("Reddit upload failed (network error).");
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static String userName(Context ctx) {
        return ctx.getSharedPreferences("credentials", Context.MODE_PRIVATE).getString("username", null);
    }

    /** rif's own sign-in token for the logged-in account (blocking: background threads only). */
    private static String token(Context ctx) throws UploadException {
        String name = userName(ctx);
        if (name == null || name.length() == 0) throw new UploadException("Log in to upload media.");
        try {
            String t = AccountManager.get(ctx).blockingGetAuthToken(new Account(name, "com.reddit"), "redditisfun_oauth2", false);
            if (t != null && t.length() > 0) return t;
        } catch (Exception e) {
            Log.w(TAG, "token failed: " + e);
        }
        throw new UploadException("Reddit sign-in failed. Open rif and log in again.");
    }

    /** rif's own user agent (what its Reddit requests send, after any Spoof client patch); set by the patch. */
    private static volatile String rifUserAgent;

    /** Called by the patched uploader with the result of rif's user-agent method. */
    public static void setUserAgent(String ua) {
        if (ua != null && ua.length() > 0) rifUserAgent = ua;
    }

    private static String userAgent(Context ctx) {
        String set = rifUserAgent;
        if (set != null) return set;
        String v = FALLBACK_VERSION;
        try {
            String name = ctx.getPackageManager().getPackageInfo(ctx.getPackageName(), 0).versionName;
            if (name != null) v = name;
        } catch (Throwable ignored) {
        }
        return "reddit is fun (Android) " + v;
    }

    // ------------------------------------------------------ response lookup

    /**
     * Polls the user's newest posts until the one for {@code asset} shows up (up to 30 s, a video 60 s
     * as it is processed first); {permalink, id} or null.
     */
    private static String[] waitForPost(Asset asset) {
        long end = System.currentTimeMillis() + (asset.isVideo() ? POLL_TIMEOUT_VIDEO_MS : POLL_TIMEOUT_MS);
        try {
            String name = userName(asset.context);
            if (name == null || name.length() == 0) return null;
            String url = API + "/user/" + URLEncoder.encode(name, "UTF-8") + "/submitted.json?sort=new&limit=5&raw_json=1";
            while (System.currentTimeMillis() < end) {
                Thread.sleep(POLL_INTERVAL_MS);
                Resp r = authed(asset.context, url, null);
                if (r.code == 200) {
                    // The title match is only for videos, whose post may not carry the asset id.
                    String[] post = asset.isVideo()
                            ? findPost(r.body, asset.id, asset.title, asset.submittedAtMs / 1000 - CLOCK_SLACK_S)
                            : findPost(r.body, asset.id);
                    if (post != null) return post;
                } else {
                    Log.w(TAG, "submitted listing " + r.code);
                }
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } catch (Throwable t) {
            Log.w(TAG, "post lookup failed: " + t);
        }
        return null;
    }

    // -------------------------------------------------------------- file io

    private static final class Sniff {
        String mime;
        long length;
    }

    private static Sniff countAndSniff(Context ctx, Uri uri) throws IOException {
        return countAndSniff(ctx, uri, false);
    }

    /** MIME type from the bytes (else the provider's), and the byte count when {@code count} is set. */
    private static Sniff countAndSniff(Context ctx, Uri uri, boolean count) throws IOException {
        Sniff s = new Sniff();
        InputStream in = ctx.getContentResolver().openInputStream(uri);
        if (in == null) throw new IOException("no stream for " + uri);
        try {
            byte[] buf = new byte[16 * 1024];
            int n = in.read(buf);
            if (n <= 0) return s;
            s.length = n;
            s.mime = sniffMime(buf, n);
            if (s.mime == null) {
                String t = ctx.getContentResolver().getType(uri);
                s.mime = t != null && (t.startsWith("image/") || t.startsWith("video/")) ? t : "image/jpeg";
            }
            if (!count) return s;
            if (isVideoMime(s.mime)) {
                // A video can be huge: take its size from the provider instead of reading it all.
                long declared = declaredSize(ctx, uri);
                if (declared > 0) {
                    s.length = declared;
                    return s;
                }
            }
            int m;
            while ((m = in.read(buf)) > 0) s.length += m;
            return s;
        } finally {
            closeQuietly(in);
        }
    }

    /** The file's size as the provider states it (OpenableColumns.SIZE, else the asset's length), or -1. */
    private static long declaredSize(Context ctx, Uri uri) {
        ContentResolver resolver = ctx.getContentResolver();
        Cursor cursor = null;
        try {
            cursor = resolver.query(uri, new String[] {OpenableColumns.SIZE}, null, null, null);
            if (cursor != null && cursor.moveToFirst()) {
                int at = cursor.getColumnIndex(OpenableColumns.SIZE);
                if (at >= 0 && !cursor.isNull(at) && cursor.getLong(at) > 0) return cursor.getLong(at);
            }
        } catch (RuntimeException e) {
            Log.w(TAG, "size query failed: " + e);
        } finally {
            if (cursor != null) cursor.close();
        }
        AssetFileDescriptor fd = null;
        try {
            fd = resolver.openAssetFileDescriptor(uri, "r");
            if (fd != null && fd.getLength() > 0) return fd.getLength();
        } catch (IOException | RuntimeException e) {
            Log.w(TAG, "asset length failed: " + e);
        } finally {
            if (fd != null) {
                try {
                    fd.close();
                } catch (IOException ignored) {
                }
            }
        }
        return -1;
    }

    // --------------------------------------------------------- video frames

    /**
     * A frame of the video (at 0, the closest keyframe) scaled down to fit {@code maxW} x
     * {@code maxH} (non-positive: no limit), or null. MediaMetadataRetriever returns frames already
     * turned upright. API 27+ scales while decoding, older versions scale the full frame.
     */
    private static Bitmap frameAt(Context ctx, Uri uri, int maxW, int maxH) {
        MediaMetadataRetriever r = new MediaMetadataRetriever();
        try {
            r.setDataSource(ctx, uri);
            int w = metadataInt(r, MediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH);
            int h = metadataInt(r, MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT);
            int rotation = metadataInt(r, MediaMetadataRetriever.METADATA_KEY_VIDEO_ROTATION);
            if (rotation == 90 || rotation == 270) {
                int t = w;
                w = h;
                h = t;
            }
            int[] fit = fitSize(w, h, maxW, maxH);
            Bitmap frame = null;
            if (fit[0] > 0 && Build.VERSION.SDK_INT >= 27) {
                frame = scaledFrame(r, fit[0], fit[1]);
                // Trust the scaled frame only if it has the video's shape.
                if (frame != null && Math.abs((double) frame.getWidth() / frame.getHeight() - (double) w / h) > 0.05) {
                    frame.recycle();
                    frame = null;
                }
            }
            if (frame == null) {
                frame = r.getFrameAtTime(0, MediaMetadataRetriever.OPTION_CLOSEST_SYNC);
                if (frame == null) frame = r.getFrameAtTime();
                if (frame != null) {
                    int[] to = fitSize(frame.getWidth(), frame.getHeight(), maxW, maxH);
                    if (to[0] > 0 && (to[0] != frame.getWidth() || to[1] != frame.getHeight())) {
                        Bitmap scaled = Bitmap.createScaledBitmap(frame, to[0], to[1], true);
                        if (scaled != frame) frame.recycle();
                        frame = scaled;
                    }
                }
            }
            return frame;
        } finally {
            try {
                r.release();
            } catch (Throwable ignored) {
            }
        }
    }

    @TargetApi(27)
    private static Bitmap scaledFrame(MediaMetadataRetriever r, int w, int h) {
        return r.getScaledFrameAtTime(0, MediaMetadataRetriever.OPTION_CLOSEST_SYNC, w, h);
    }

    private static int metadataInt(MediaMetadataRetriever r, int key) {
        try {
            String v = r.extractMetadata(key);
            return v != null ? Integer.parseInt(v.trim()) : 0;
        } catch (RuntimeException e) {
            return 0;
        }
    }

    /** The video's poster: its first frame as a JPEG (quality 85, at most 1280 px on a side). */
    private static byte[] posterJpeg(Context ctx, Uri uri) throws UploadException {
        Bitmap frame = null;
        try {
            frame = frameAt(ctx, uri, POSTER_MAX_PX, POSTER_MAX_PX);
            if (frame == null) throw new UploadException("Couldn't read the video.");
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            if (!frame.compress(Bitmap.CompressFormat.JPEG, 85, out)) {
                throw new UploadException("Couldn't read the video.");
            }
            return out.toByteArray();
        } catch (RuntimeException e) {
            Log.w(TAG, "poster failed: " + e);
            throw new UploadException("Couldn't read the video.");
        } finally {
            if (frame != null) frame.recycle();
        }
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[4096];
        int n;
        while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
        return out.toByteArray();
    }

    private static String readText(InputStream in) {
        if (in == null) return "";
        try {
            byte[] b = readAll(in);
            return new String(b, 0, Math.min(b.length, 1 << 20), UTF8);
        } catch (IOException e) {
            return "";
        } finally {
            closeQuietly(in);
        }
    }

    private static void closeQuietly(InputStream in) {
        if (in == null) return;
        try {
            in.close();
        } catch (IOException ignored) {
        }
    }
}
