package app.revanced.extension.rif;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.SequenceInputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * "Explain processing videos": a Reddit video that Reddit hasn't finished processing can't be
 * played, and rif says only "Error retrieving reddit video metadata." or "Error determining video
 * format." We show "Video still processing. Try again in a minute." instead.
 * Message only: nothing is retried.
 *
 * Two phases, both after posting a video:
 * <ul>
 * <li>Phase 1 (the first ~8 to 33 s, and for good if the video never processes): the post's JSON
 * has {@code is_video} true and {@code media} null. rif's metadata loader (j2.e / k2.e) NPEs on
 * the null media and its result handler toasts the error. Hook A ({@link #teeMetadata}) keeps the
 * response body per loader; hook B ({@link #metadataToast}) replaces the toast.</li>
 * <li>Phase 2 (a few minutes, seen on 1 of 4 posts): the JSON is complete, but the DASH and HLS
 * playlists answer 403 (only the mp4 fallback is served). rif's player fails on both, then on the
 * fallback, and toasts the format error. Hook C ({@link #playerError}) records 403s of the
 * v.redd.it playlists per player fragment; hook D ({@link #formatToast}) replaces the toast when
 * both were refused and nothing else failed.</li>
 * </ul>
 * Every entry point catches everything and falls back to rif's own toast.
 */
public final class VideoProcessing {

    static final String TAG = "RifVideoProcessing";

    static final String MESSAGE = "Video still processing. Try again in a minute.";

    /**
     * Largest response head kept. A processing post's body is about 5 KB; the 301 to the comments
     * JSON drops the loader's {@code limit}, so a post with many comments is bigger. Beyond this
     * the body isn't judged and rif's toast stays.
     */
    static final int MAX_BODY = 256 * 1024;

    static final int DASH_403 = 1;
    static final int HLS_403 = 2;
    static final int OTHER = 4;

    private static final int KIND_NONE = 0;
    private static final int KIND_DASH = 1;
    private static final int KIND_HLS = 2;

    /** The head of the last metadata response per loader. Written on a worker thread, read on main. */
    private static final Map<Object, Body> BODIES =
            Collections.synchronizedMap(new WeakHashMap<Object, Body>());

    /** The playlist failures seen per player fragment. */
    private static final Map<Object, int[]> FAILURES =
            Collections.synchronizedMap(new WeakHashMap<Object, int[]>());

    private static final class Body {
        final byte[] bytes;
        final boolean truncated;

        Body(byte[] bytes, boolean truncated) {
            this.bytes = bytes;
            this.truncated = truncated;
        }
    }

    private VideoProcessing() {}

    // ---- Hook A: the metadata loader's response ----

    /**
     * Called with the loader and the response body before rif parses it. Returns a stream with the
     * same bytes. Never throws.
     */
    public static InputStream teeMetadata(Object loader, InputStream in) {
        if (in == null) return in;
        ByteArrayOutputStream head = new ByteArrayOutputStream();
        boolean more = false;
        try {
            byte[] buf = new byte[8192];
            int n;
            while (head.size() < MAX_BODY && (n = in.read(buf, 0, Math.min(buf.length, MAX_BODY - head.size()))) > 0) {
                head.write(buf, 0, n);
            }
            if (head.size() >= MAX_BODY) {
                int next = in.read();
                if (next >= 0) {
                    more = true;
                    head.write(next);
                }
            }
        } catch (Throwable t) {
            // Let rif hit the same read problem itself.
            BODIES.remove(loader);
            return new SequenceInputStream(new ByteArrayInputStream(head.toByteArray()), in);
        }
        byte[] bytes = head.toByteArray();
        try {
            BODIES.put(loader, new Body(bytes, more));
        } catch (Throwable t) {
            Log.w(TAG, "tee failed", t);
        }
        if (!more) return new ByteArrayInputStream(bytes);
        return new SequenceInputStream(new ByteArrayInputStream(bytes), in);
    }

    // ---- Hook B: the loader's result handler, null branch ----

    /** Replaces rif's {@code q0.a(context, resId, duration)} toast in the loader's null-result branch. */
    public static void metadataToast(Object loader, Context context, int resId, int duration) {
        boolean processing = false;
        try {
            Body body = loader == null ? null : BODIES.remove(loader);
            if (body != null && !body.truncated) {
                processing = isProcessingPost(new String(body.bytes, StandardCharsets.UTF_8));
            }
        } catch (Throwable t) {
            Log.w(TAG, "metadataToast failed", t);
        }
        toast(context, processing, resId, duration);
    }

    /**
     * True when the response is a post listing whose first post is a video with no media yet:
     * {@code is_video} true and {@code media} null or missing. False for a ready post, any other
     * body (HTML block pages, errors) and anything that doesn't parse. Accepts the comments
     * response (an array of two listings) and a single listing.
     */
    static boolean isProcessingPost(String json) {
        if (json == null) return false;
        try {
            String s = json.trim();
            JSONObject listing;
            if (s.startsWith("[")) {
                JSONArray array = new JSONArray(s);
                if (array.length() == 0) return false;
                listing = array.getJSONObject(0);
            } else {
                listing = new JSONObject(s);
            }
            JSONArray children = listing.getJSONObject("data").getJSONArray("children");
            if (children.length() == 0) return false;
            JSONObject post = children.getJSONObject(0).getJSONObject("data");
            return post.optBoolean("is_video", false) && post.isNull("media");
        } catch (Throwable t) {
            return false;
        }
    }

    // ---- Hook C: the player's error callback ----

    /** Called first in rif's player fragment's onPlayerError. Never throws. */
    public static void playerError(Object fragment, Throwable error) {
        try {
            if (fragment == null) return;
            int kind = playlistKindOf(fragment);
            if (kind == KIND_NONE) return; // not a v.redd.it DASH/HLS playlist (e.g. the mp4 fallback)
            boolean refused = is403(error);
            synchronized (FAILURES) {
                int[] flags = FAILURES.get(fragment);
                if (flags == null) {
                    flags = new int[1];
                    FAILURES.put(fragment, flags);
                }
                flags[0] = addFailure(flags[0], kind == KIND_DASH, refused);
            }
        } catch (Throwable t) {
            Log.w(TAG, "playerError failed", t);
        }
    }

    /** Whether an exception in the chain says the server answered 403 ("Response code: 403"). */
    static boolean is403(Throwable error) {
        Throwable t = error;
        for (int i = 0; i < 6 && t != null; i++) {
            String message = t.getMessage();
            if (message != null && message.startsWith("Response code: 403")) return true;
            Throwable cause = t.getCause();
            if (cause == t) break;
            t = cause;
        }
        return false;
    }

    /** The flags after one DASH or HLS failure: the matching 403 bit, or OTHER for any other failure. */
    static int addFailure(int flags, boolean dash, boolean refused) {
        if (!refused) return flags | OTHER;
        return flags | (dash ? DASH_403 : HLS_403);
    }

    /** DASH_403 and HLS_403 set, nothing else failed. */
    static boolean onlyRefused(int flags) {
        return (flags & DASH_403) != 0 && (flags & HLS_403) != 0 && (flags & OTHER) == 0;
    }

    /**
     * The playlist kind of a v.redd.it play Uri: path exactly {@code /<id>/DASHPlaylist.mpd} or
     * {@code /<id>/HLSPlaylist.m3u8}, else none.
     */
    static int playlistKind(String host, String path) {
        if (host == null || path == null || !host.equalsIgnoreCase("v.redd.it")) return KIND_NONE;
        if (!path.startsWith("/")) return KIND_NONE;
        int slash = path.indexOf('/', 1);
        if (slash < 2) return KIND_NONE;
        String file = path.substring(slash + 1);
        if (file.equals("DASHPlaylist.mpd")) return KIND_DASH;
        if (file.equals("HLSPlaylist.m3u8")) return KIND_HLS;
        return KIND_NONE;
    }

    /**
     * The playlist kind of the fragment's current play Uri. The field is obfuscated (free v1.k.p0,
     * Platinum w1.k.m0), so every Uri field of the fragment and its rif superclasses is checked.
     */
    private static int playlistKindOf(Object fragment) {
        for (Class<?> c = fragment.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            if (c.getName().startsWith("androidx.") || c.getName().startsWith("android.")) break;
            for (Field field : c.getDeclaredFields()) {
                if (field.getType() != Uri.class || Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    Uri uri = (Uri) field.get(fragment);
                    if (uri == null) continue;
                    int kind = playlistKind(uri.getHost(), uri.getPath());
                    if (kind != KIND_NONE) return kind;
                } catch (Throwable t) {
                    // Try the next field.
                }
            }
        }
        return KIND_NONE;
    }

    // ---- Hook D: fetchVideoMetadata's error toast ----

    /** Replaces rif's {@code q0.a(context, resId, duration)} toast at the end of fetchVideoMetadata. */
    public static void formatToast(Object fragment, Context context, int resId, int duration) {
        boolean processing = false;
        try {
            int[] flags = fragment == null ? null : FAILURES.remove(fragment);
            if (flags != null && onlyRefused(flags[0]) && isFormatError(context, resId)) {
                processing = true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "formatToast failed", t);
        }
        toast(context, processing, resId, duration);
    }

    /** The same instruction also shows the gfycat error, so check the string. */
    private static boolean isFormatError(Context context, int resId) {
        if (context == null || resId == 0) return false;
        int format = context.getResources().getIdentifier(
                "error_determining_video_format", "string", context.getPackageName());
        return format != 0 && format == resId;
    }

    // ---- Shared ----

    /** Our message, or rif's own toast (q0.a: nothing for a null Context). */
    private static void toast(Context context, boolean ours, int resId, int duration) {
        try {
            Context ctx = context;
            if (ctx == null && ours) ctx = Settings.context();
            if (ctx == null) return;
            if (ours) {
                Toast.makeText(ctx, MESSAGE, duration).show();
            } else {
                Toast.makeText(ctx, resId, duration).show();
            }
        } catch (Throwable t) {
            Log.w(TAG, "toast failed", t);
        }
    }
}
