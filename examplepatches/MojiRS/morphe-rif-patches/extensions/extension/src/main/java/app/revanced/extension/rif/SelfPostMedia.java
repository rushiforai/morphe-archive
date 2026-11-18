package app.revanced.extension.rif;

import android.content.Context;
import android.os.SystemClock;
import android.util.Log;

import androidx.core.util.c;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Images and GIFs in the body of a new or edited post of any kind (part of the "Reddit image hosting"
 * patch). The button, the picker and the markers are {@link CommentMedia}'s: this class is the send
 * side.
 *
 * <p>Reddit processes media that a post attaches with {@code richtext_json} only when it comes
 * through its own web client, and ignores {@code richtext_json} on a link post; from rif the images
 * stay on "Processing" for good (API tests 2026-11-12 and 2026-11-15). Markdown {@code text} with
 * {@code ![img|gif](<asset id>)} paragraphs does attach the assets, on every kind of post, with no
 * converter call. So every post goes out the same way ("attach, then flatten"):
 * <ol>
 * <li>{@link #submitParams} (SubmitTask.d0, background thread): every marker's file is uploaded and
 * the markers become {@code ![img|gif](<asset id>)} paragraphs in the {@code text} parameter. All
 * other parameters stay. This attaches the assets to the post, which is what makes {@code i.redd.it}
 * serve them.</li>
 * <li>{@link #wrapSubmitResponse} (SubmitTask.k0): the new post is edited at once
 * ({@code /api/editusertext}) with the original markdown, each marker replaced by its bare
 * {@code https://i.redd.it/<id>.<ext>} link on a line of its own. Rif shows such a link inline (with
 * "Inline comment images"); other clients see a link. A few retries with backoff cover Reddit's rate
 * limit; if the edit still fails the post stays as it is and the user is told.</li>
 * </ol>
 * A post without a marker is not touched, and no request is made for it.
 */
public final class SelfPostMedia {

    private static final String TAG = "RifSelfPostMedia";
    private static final Charset UTF8 = Charset.forName("UTF-8");
    private static final String API = "https://oauth.reddit.com";

    static final String SEND_REFUSED = "Images can't go in this kind of post. Delete the image markers.";
    static final String POST_UP_NOTICE =
            "Post is up, but its images may show as \"Processing\" until you edit it.";

    /**
     * The extension of a JPEG's i.redd.it link in the flattened body. Reddit may keep the file as
     * {@code .jpeg} or {@code .jpg}; one place to change it. A WebP is transcoded to JPEG, so it
     * takes this too.
     */
    static final String JPEG_EXT = "jpeg";

    /** Waits before each retry of the flatten edit (6 tries in all); Reddit's rate-limit window is about 5 s. */
    static final long[] FLATTEN_BACKOFF_MS = {3000, 4000, 6000, 8000, 10000};

    /**
     * How long after Reddit's reply to a submit or edit with images rif may be given the reply. The
     * files are served 3-4 s after it, and a fetch of an i.redd.it link before then is answered with
     * a 404 that stays cached for 20+ minutes (API test 2026-11-15).
     */
    static final long SETTLE_MS = 8000;

    static final String CHECK_POST_FAILED = "Couldn't check the post's images. Try again.";

    /** Reddit's error for a media id that isn't the post author's (a foreign i.redd.it link in the body). */
    static final String INVALID_MEDIA = "INVALID_MEDIA_ASSETS";

    private static final String LOG_PREFS = "rif_self_post_media";
    private static final String LOG_KEY = "uploaded";
    /** Asset ids kept in the record of what we uploaded. */
    static final int MAX_LOGGED = 500;

    private SelfPostMedia() {}

    // ------------------------------------------------------- pure helpers

    /** The extension of the uploaded file's link on i.redd.it (png and gif as they are, everything else JPEG). */
    static String flattenExtension(String mime) {
        if ("image/gif".equals(mime)) return "gif";
        if ("image/png".equals(mime)) return "png";
        return JPEG_EXT;
    }

    /** The bare link a flattened body holds for an uploaded image. */
    static String imageUrl(String assetId, String mime) {
        return "https://i.redd.it/" + assetId + "." + flattenExtension(mime);
    }

    /**
     * {@code text} with every marker replaced by the matching entry of {@code replacements}, each on a
     * paragraph of its own ({@link CommentMedia#isolate}). The markers are in text order, as
     * {@link CommentMedia#knownMarkers} gives them; they are replaced from the last to the first so
     * that the earlier positions stay valid. The result has no leading or trailing blank space (rif
     * strips the text before it sends it).
     */
    static String swapMarkers(String text, List<CommentMedia.Marker> markers, List<String> replacements) {
        if (markers.size() != replacements.size()) throw new IllegalArgumentException("markers and replacements differ");
        String out = text;
        for (int i = markers.size() - 1; i >= 0; i--) {
            CommentMedia.Marker m = markers.get(i);
            out = CommentMedia.isolate(out, m.start, m.end, replacements.get(i));
        }
        return out.trim();
    }

    /** The post kinds whose body takes images: text, link, image and video (videogif as video; Reddit attaches them alike). */
    static boolean takesImages(String kind) {
        return "self".equals(kind) || "link".equals(kind) || "image".equals(kind)
                || "video".equals(kind) || "videogif".equals(kind);
    }

    /** Why a post with picked images can't go out as it is, or null. */
    static String refusal(String kind, boolean hasMarkers) {
        return hasMarkers && !takesImages(kind) ? SEND_REFUSED : null;
    }

    /**
     * The {@code text} parameter's value for a post or edit that attaches images: every marker as
     * the media token of its upload, each on a paragraph of its own. {@code ids}/{@code gifs} are in
     * marker order.
     */
    static String attachBody(String text, List<CommentMedia.Marker> markers, List<String> ids, List<Boolean> gifs) {
        List<String> tokens = new ArrayList<>();
        for (int i = 0; i < ids.size(); i++) tokens.add(CommentMedia.token(ids.get(i), gifs.get(i)));
        return swapMarkers(text, markers, tokens);
    }

    /** The parameters with {@code text} replaced in place; other pairs stay (the same array when there is no text). */
    static c<String, String>[] withText(c<String, String>[] pairs, String text) {
        c<String, String>[] out = pairs.clone();
        for (int i = 0; i < out.length; i++) {
            if (out[i] != null && "text".equals(out[i].a)) {
                out[i] = c.a("text", text);
                return out;
            }
        }
        return pairs;
    }

    /** The form of the flatten edit. */
    static String flattenForm(String postName, String text) {
        try {
            return "api_type=json&thing_id=" + URLEncoder.encode(postName, "UTF-8") + "&text=" + URLEncoder.encode(text, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    /**
     * The new post's name (t3_...) from a submit reply ({@code json.data.name}, else {@code
     * json.data.id}); null when Reddit refused the post (errors) or the reply has no post in it.
     */
    static String postName(String reply) {
        try {
            JSONObject json = new JSONObject(reply).optJSONObject("json");
            if (json == null) return null;
            JSONArray errors = json.optJSONArray("errors");
            if (errors != null && errors.length() > 0) return null;
            JSONObject data = json.optJSONObject("data");
            if (data == null) return null;
            String name = data.optString("name", "");
            if (name.matches("t3_[a-z0-9]{1,20}")) return name;
            String id = data.optString("id", "");
            return id.matches("[a-z0-9]{1,20}") ? "t3_" + id : null;
        } catch (JSONException e) {
            return null;
        }
    }

    /** Whether a submit reply carries Reddit's errors (the user gets them from rif itself). */
    static boolean hasErrors(String reply) {
        return CommentMedia.firstError(reply) != null;
    }

    /** What an edit's reply says: null for success, else a reason for the log. */
    static String editResult(int code, String body) {
        if (code != 200) return "HTTP " + code;
        String error = CommentMedia.firstError(body);
        return error;
    }

    /** How much longer to wait, given when the reply came in and now (both SystemClock.elapsedRealtime values). */
    static long settleWait(long replyAt, long now) {
        return Math.max(0, SETTLE_MS - (now - replyAt));
    }

    // ----------------------------------------------- post edits (pure)

    /**
     * An image a post has: its id and, when known, whether it is a GIF (null: unknown). {@code
     * listed} is true when Reddit lists it for the post (rtjson block or media_metadata key), false
     * when only a link in the body names it (it may be somebody else's image). {@code ext} is the
     * extension of its i.redd.it link when Reddit's metadata says (else null).
     */
    static final class OwnImg {
        final String id;
        final Boolean gif;
        final boolean listed;
        final String ext;

        OwnImg(String id, Boolean gif, boolean listed) {
            this(id, gif, listed, null);
        }

        OwnImg(String id, Boolean gif, boolean listed, String ext) {
            this.id = id;
            this.gif = gif;
            this.listed = listed;
            this.ext = ext;
        }
    }

    /** The extension of the i.redd.it link for a {@code media_metadata} entry ({@code m} mime, else {@code e}), or null when it says neither. */
    static String mediaExtension(JSONObject entry) {
        if (entry == null) return null;
        String mime = entry.optString("m", "");
        if (mime.length() > 0) return flattenExtension(mime);
        return "AnimatedImage".equals(entry.optString("e", "")) ? "gif" : null;
    }

    /** Whether {@code url} is served (HEAD answers 200). */
    interface Prober {
        boolean served(String url);
    }

    /** How old a post's newest edit must be before its images are probed: a fetch of a file Reddit hasn't processed caches a 404. */
    static final long PROBE_MIN_AGE_S = 10;

    /** Whether the post's images are old enough to probe: its creation and last edit are {@link #PROBE_MIN_AGE_S} or more behind {@code nowS} (unix seconds). */
    static boolean assetsSettled(JSONObject post, long nowS) {
        if (post == null) return false;
        double newest = post.optDouble("created_utc", Double.NaN);
        Object edited = post.opt("edited");
        if (edited instanceof Number) newest = Math.max(Double.isNaN(newest) ? 0 : newest, ((Number) edited).doubleValue());
        return !Double.isNaN(newest) && nowS - newest >= PROBE_MIN_AGE_S;
    }

    /**
     * {@code refs} with the link extension found for each placeholder whose image's type Reddit's
     * metadata doesn't give: a stuck post's metadata is only {@code {"status":"failed"}}, and the
     * file is served under its real extension only (a wrong one is a 404). A photo is tried as
     * {@code png}, then {@link #JPEG_EXT}, a GIF as {@code gif}. Nothing served (or {@code settled}
     * false: the files may be too new to ask for) leaves it null, and the placeholder stays text.
     */
    static List<Ref> withProbedExtensions(String text, List<Ref> refs, Prober prober, boolean settled) {
        List<Ref> out = new ArrayList<>();
        for (Ref r : refs) {
            String ext = r.ext;
            if (ext == null && settled && isPlaceholder(text, r.start, r.end)) {
                for (String e : r.gif ? new String[] {"gif"} : new String[] {"png", JPEG_EXT}) {
                    if (prober.served("https://i.redd.it/" + r.id + "." + e)) {
                        ext = e;
                        break;
                    }
                }
            }
            out.add(ext == r.ext ? r : new Ref(r.start, r.end, r.id, r.gif, r.sure, ext));
        }
        return out;
    }

    private static final java.util.regex.Pattern PLACEHOLDER_ID =
            java.util.regex.Pattern.compile("\\*Processing (img|gif) ([A-Za-z0-9]+)\\.\\.\\.\\*");

    /**
     * {@code own} plus the ids of the text's {@code *Processing img <id>...*} placeholders that we
     * uploaded ({@code uploaded}) and Reddit doesn't list (not listed: the placeholder of an id that is
     * neither stays plain text). A post whose flatten failed holds these.
     */
    static List<OwnImg> withPlaceholders(List<OwnImg> own, String text, java.util.Set<String> uploaded) {
        List<OwnImg> out = new ArrayList<>(own);
        if (text == null) return out;
        java.util.Set<String> seen = new java.util.HashSet<>();
        for (OwnImg o : own) seen.add(o.id);
        java.util.regex.Matcher m = PLACEHOLDER_ID.matcher(text);
        while (m.find()) {
            String id = m.group(2);
            if (!uploaded.contains(id) || !seen.add(id)) continue;
            out.add(new OwnImg(id, "gif".equals(m.group(1)), false));
        }
        return out;
    }

    /** Scheme and host in any case (a phone keyboard writes "Https://" at a line start); the id as it is. */
    private static final java.util.regex.Pattern IREDDIT_LINK =
            java.util.regex.Pattern.compile("(?i:https?://i\\.redd\\.it/)([A-Za-z0-9]{1,40})\\.([A-Za-z0-9]+)");
    /**
     * The images the body's {@code i.redd.it/<id>.<ext>} links name that {@code listed} doesn't
     * have, each once, in text order. A flattened body holds the post's images only as these links
     * (a post whose first image came by an edit has no media_metadata either), and a media edit
     * deletes every earlier image it doesn't send again, so they all have to go out. A link may be
     * somebody else's image: such an id is {@code listed == false}.
     */
    static List<OwnImg> withBodyLinks(List<OwnImg> listed, String text) {
        List<OwnImg> out = new ArrayList<>(listed);
        java.util.Set<String> seen = new java.util.HashSet<>();
        for (OwnImg o : listed) seen.add(o.id);
        if (text == null) return out;
        java.util.regex.Matcher m = IREDDIT_LINK.matcher(text);
        while (m.find()) {
            if (!seen.add(m.group(1))) continue;
            out.add(new OwnImg(m.group(1), "gif".equalsIgnoreCase(m.group(2)), false));
        }
        return out;
    }

    /**
     * The images a post has, from a listing fetched with {@code rtj=yes}: every img/gif block of its
     * {@code rtjson} and every entry of its {@code media_metadata} (a flattened post keeps these,
     * as "failed" entries with no type, once its rich text is gone). Only these ids are ever sent:
     * another post's id in an edit breaks the post.
     */
    static List<OwnImg> ownImages(JSONObject post) {
        Map<String, Boolean> ids = new LinkedHashMap<>();
        if (post == null) return new ArrayList<>();
        Object rt = post.opt("rtjson");
        if (rt instanceof String) {
            try {
                rt = new JSONObject((String) rt);
            } catch (JSONException e) {
                rt = null;
            }
        }
        if (rt instanceof JSONObject) collectBlocks(((JSONObject) rt).opt("document"), ids);
        Map<String, String> exts = new java.util.HashMap<>();
        JSONObject meta = post.optJSONObject("media_metadata");
        if (meta != null) {
            java.util.Iterator<String> keys = meta.keys();
            while (keys.hasNext()) {
                String id = keys.next();
                JSONObject m = meta.optJSONObject(id);
                String e = m != null ? m.optString("e", "") : "";
                Boolean gif = "AnimatedImage".equals(e) ? Boolean.TRUE : "Image".equals(e) ? Boolean.FALSE : null;
                if (!ids.containsKey(id) || ids.get(id) == null) ids.put(id, gif);
                exts.put(id, mediaExtension(m));
            }
        }
        List<OwnImg> out = new ArrayList<>();
        for (Map.Entry<String, Boolean> e : ids.entrySet()) {
            if (e.getKey().matches("[A-Za-z0-9]{1,40}")) out.add(new OwnImg(e.getKey(), e.getValue(), true, exts.get(e.getKey())));
        }
        return out;
    }

    private static void collectBlocks(Object node, Map<String, Boolean> ids) {
        if (node instanceof JSONArray) {
            JSONArray a = (JSONArray) node;
            for (int i = 0; i < a.length(); i++) collectBlocks(a.opt(i), ids);
        } else if (node instanceof JSONObject) {
            JSONObject o = (JSONObject) node;
            String e = o.optString("e", "");
            String id = o.optString("id", "");
            if (("img".equals(e) || "gif".equals(e)) && id.length() > 0) ids.put(id, "gif".equals(e));
            collectBlocks(o.opt("c"), ids);
        }
    }

    /** The post {@code id} (id36) from a post-permalink listing ({@code [post listing, comments]}), or null. */
    static JSONObject postFromListing(String json, String id) {
        try {
            JSONObject posts = new JSONArray(json).optJSONObject(0);
            JSONObject data = posts != null ? posts.optJSONObject("data") : null;
            JSONArray children = data != null ? data.optJSONArray("children") : null;
            if (children == null) return null;
            for (int i = 0; i < children.length(); i++) {
                JSONObject child = children.optJSONObject(i);
                JSONObject d = child != null ? child.optJSONObject("data") : null;
                if (d != null && id.equals(d.optString("id", ""))) return d;
            }
            return null;
        } catch (JSONException e) {
            return null;
        }
    }

    /** A reference to one of the post's own images in its text. */
    static final class Ref {
        final int start;
        final int end;
        final String id;
        final boolean gif;
        /** Whether the id is surely the post author's (listed by Reddit or uploaded by us): it stays in a retry. */
        final boolean sure;
        /** The extension of its link when Reddit's metadata says, else null. */
        final String ext;

        Ref(int start, int end, String id, boolean gif, boolean sure) {
            this(start, end, id, gif, sure, null);
        }

        Ref(int start, int end, String id, boolean gif, boolean sure, String ext) {
            this.start = start;
            this.end = end;
            this.id = id;
            this.gif = gif;
            this.sure = sure;
            this.ext = ext;
        }
    }

    private static final java.util.regex.Pattern GIF_REF =
            java.util.regex.Pattern.compile("redd\\.it/[A-Za-z0-9]+\\.gif|!\\[gif\\]|Processing gif",
                    java.util.regex.Pattern.CASE_INSENSITIVE);

    /** Whether a reference to an image (its link, token or placeholder) is to a GIF. */
    static boolean refIsGif(String ref) {
        return GIF_REF.matcher(ref).find();
    }

    /**
     * The first reference to each of the post's own images in {@code text} (its link as rif shows it,
     * in the forms {@link CommentMedia#findOwnRef} knows), by position. An image whose type is
     * unknown takes it from the link's extension. Ids that merely look like an image in the text
     * but aren't in {@code own} are not found: they stay plain text. {@code uploaded} is the record
     * of the asset ids we uploaded: those are as sure as the ones Reddit lists.
     */
    static List<Ref> ownRefs(String text, List<OwnImg> own, java.util.Set<String> uploaded) {
        List<Ref> refs = new ArrayList<>();
        for (OwnImg o : own) {
            int[] span = CommentMedia.findOwnRef(text, o.id);
            if (span == null) continue;
            boolean gif = o.gif != null ? o.gif : refIsGif(text.substring(span[0], span[1]));
            refs.add(new Ref(span[0], span[1], o.id, gif, o.listed || uploaded.contains(o.id), o.ext));
        }
        java.util.Collections.sort(refs, new java.util.Comparator<Ref>() {
            @Override
            public int compare(Ref a, Ref b) {
                return a.start < b.start ? -1 : a.start > b.start ? 1 : 0;
            }
        });
        return refs;
    }

    /**
     * A post edit's media in text order: the post's own images (kept) and the newly picked ones.
     * {@code fresh} is null for an own image and the marker's index otherwise. {@code sure}: the
     * image is surely the author's (always true for a new upload).
     */
    static final class Item {
        final CommentMedia.Marker span;
        final String id;
        final Integer fresh;
        final boolean gif;
        final boolean sure;
        /** Of an own image: the extension of its link when Reddit's metadata says, else null. */
        final String ext;

        Item(CommentMedia.Marker span, String id, Integer fresh, boolean gif, boolean sure) {
            this(span, id, fresh, gif, sure, null);
        }

        Item(CommentMedia.Marker span, String id, Integer fresh, boolean gif, boolean sure, String ext) {
            this.span = span;
            this.id = id;
            this.fresh = fresh;
            this.gif = gif;
            this.sure = sure;
            this.ext = ext;
        }
    }

    /**
     * Merges the own references and the new markers by position. The ids and types of the new markers
     * come from {@code freshIds} and {@code freshGifs} (their uploads, in marker order).
     */
    static List<Item> mergeItems(List<Ref> own, List<CommentMedia.Marker> markers, List<String> freshIds,
            List<Boolean> freshGifs) {
        List<Item> items = new ArrayList<>();
        for (Ref r : own) items.add(new Item(new CommentMedia.Marker(r.start, r.end, "", r.gif), r.id, null, r.gif, r.sure, r.ext));
        for (int i = 0; i < markers.size(); i++) {
            items.add(new Item(markers.get(i), freshIds.get(i), i, freshGifs.get(i), true));
        }
        java.util.Collections.sort(items, new java.util.Comparator<Item>() {
            @Override
            public int compare(Item a, Item b) {
                return a.span.start < b.span.start ? -1 : a.span.start > b.span.start ? 1 : 0;
            }
        });
        return items;
    }

    /**
     * The body of an attaching edit: every item (own image or new marker) as its media token on a
     * paragraph of its own. With {@code retry}, own images that aren't {@code sure} stay as the links
     * they are in {@code text}: the second try after Reddit refused the first for a foreign id.
     */
    static String attachEditBody(String text, List<Item> items, boolean retry) {
        List<CommentMedia.Marker> spans = new ArrayList<>();
        List<String> tokens = new ArrayList<>();
        for (Item it : items) {
            if (retry && !it.sure) continue;
            spans.add(it.span);
            tokens.add(CommentMedia.token(it.id, it.gif));
        }
        return swapMarkers(text, spans, tokens);
    }

    /** Whether an own image's reference in {@code text} is Reddit's "Processing" placeholder. */
    static boolean isPlaceholder(String text, int start, int end) {
        return PLACEHOLDER_ID.matcher(text.substring(start, end)).matches();
    }

    /** Whether some own image is a placeholder in {@code text} whose link is known ({@code ext}): a post whose flatten failed. */
    static boolean hasRepairable(String text, List<Ref> refs) {
        for (Ref r : refs) {
            if (r.ext != null && isPlaceholder(text, r.start, r.end)) return true;
        }
        return false;
    }

    /**
     * The text of the edit that follows an attaching one: each new marker as its link
     * ({@code freshUrls}, in marker order) and each own placeholder as the link of its image (when
     * its extension is known; otherwise it stays text). The post's other links stay as they are.
     */
    static String flattenEditText(String text, List<Item> items, List<String> freshUrls) {
        List<CommentMedia.Marker> spans = new ArrayList<>();
        List<String> links = new ArrayList<>();
        for (Item it : items) {
            if (it.fresh != null) {
                spans.add(it.span);
                links.add(freshUrls.get(it.fresh));
            } else if (it.ext != null && isPlaceholder(text, it.span.start, it.span.end)) {
                spans.add(it.span);
                links.add("https://i.redd.it/" + it.id + "." + it.ext);
            }
        }
        return swapMarkers(text, spans, links);
    }

    /** Whether a second try without the unsure ids differs from the first (some own image isn't sure). */
    static boolean hasUnsure(List<Item> items) {
        for (Item it : items) {
            if (!it.sure) return true;
        }
        return false;
    }

    /** Whether an edit's reply says a media id isn't the post author's ({@link #INVALID_MEDIA}). */
    static boolean isInvalidMedia(String reply) {
        String error = CommentMedia.firstError(reply);
        return error != null && error.startsWith(INVALID_MEDIA);
    }

    // ------------------------------------------ record of our own uploads

    /** The asset ids as JSON (oldest first). */
    static String logToJson(List<String> ids) {
        return new JSONArray(ids).toString();
    }

    static List<String> logFromJson(String json) {
        List<String> out = new ArrayList<>();
        try {
            JSONArray in = new JSONArray(json);
            for (int i = 0; i < in.length(); i++) {
                String id = in.optString(i, "");
                if (id.matches("[A-Za-z0-9]{1,40}")) out.add(id);
            }
        } catch (JSONException e) {
            Log.w(TAG, "upload record unreadable: " + e);
        }
        return out;
    }

    /** {@code log} with {@code id} as the newest entry (once), at most {@link #MAX_LOGGED} entries. */
    static List<String> logAdd(List<String> log, String id) {
        List<String> out = new ArrayList<>(log);
        out.remove(id);
        out.add(id);
        return out.size() > MAX_LOGGED ? new ArrayList<>(out.subList(out.size() - MAX_LOGGED, out.size())) : out;
    }

    private static final Object LOG_LOCK = new Object();

    /** Remembers that we uploaded {@code id} (an i.redd.it link to it in a post body is the user's own). */
    private static void recordUpload(Context ctx, String id) {
        try {
            synchronized (LOG_LOCK) {
                android.content.SharedPreferences prefs = ctx.getSharedPreferences(LOG_PREFS, Context.MODE_PRIVATE);
                List<String> log = logAdd(logFromJson(prefs.getString(LOG_KEY, "[]")), id);
                prefs.edit().putString(LOG_KEY, logToJson(log)).apply();
            }
        } catch (Throwable t) {
            Log.w(TAG, "upload not recorded", t);
        }
    }

    private static java.util.Set<String> uploadedIds(Context ctx) {
        try {
            synchronized (LOG_LOCK) {
                return new java.util.HashSet<>(logFromJson(
                        ctx.getSharedPreferences(LOG_PREFS, Context.MODE_PRIVATE).getString(LOG_KEY, "[]")));
            }
        } catch (Throwable t) {
            Log.w(TAG, "upload record not read", t);
            return new java.util.HashSet<>();
        }
    }

    /** One try of the flatten edit: null on success, else why it failed. */
    interface Attempt {
        String run();
    }

    interface Sleeper {
        void sleep(long ms) throws InterruptedException;
    }

    /** Runs {@code attempt} up to {@code 1 + backoffMs.length} times, waiting {@code backoffMs[i]} after the i-th failure. */
    static boolean retry(Attempt attempt, long[] backoffMs, Sleeper sleeper) {
        for (int i = 0; ; i++) {
            String failure = attempt.run();
            if (failure == null) return true;
            Log.w(TAG, "flatten try " + (i + 1) + " failed: " + failure);
            if (i >= backoffMs.length) return false;
            try {
                sleeper.sleep(backoffMs[i]);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return false;
            }
        }
    }

    // ----------------------------------------------------------------- send

    /** What the flatten edit needs from the send: the original text with each marker as its link. */
    private static final class Flatten {
        final String text;

        Flatten(String text) {
            this.text = text;
        }
    }

    /** Per SubmitTask: the parameters built for it (the task asks twice after a token refresh), and its pending flatten. */
    private static final Map<Object, c<String, String>[]> BUILT =
            Collections.synchronizedMap(new WeakHashMap<Object, c<String, String>[]>());
    private static final Map<Object, Flatten> FLATTEN = Collections.synchronizedMap(new WeakHashMap<Object, Flatten>());

    /**
     * Hook (SubmitTask.d0, before it returns, after the image-post fix; background thread): a post of
     * any kind with picked images is uploaded and sent with the markers as media tokens in its
     * {@code text}; any other post's parameters are returned as they are. A failure shows a toast and
     * throws, so rif keeps the form and its text.
     */
    public static c<String, String>[] submitParams(c<String, String>[] pairs, Object task) {
        boolean working = false;
        try {
            if (pairs == null) return pairs;
            c<String, String>[] built = BUILT.get(task);
            if (built != null) return built;
            String kind = null;
            String text = null;
            for (c<String, String> p : pairs) {
                if (p == null) continue;
                if ("kind".equals(p.a)) kind = p.b;
                else if ("text".equals(p.a)) text = p.b;
            }
            if (text == null || text.indexOf("![") < 0) return pairs;
            Context ctx = Settings.context();
            if (ctx == null) return pairs;
            List<CommentMedia.Marker> markers = CommentMedia.knownMarkers(text, CommentMedia.knownMarkerSet(ctx));
            if (markers.isEmpty()) return pairs;
            String refused = refusal(kind, true);
            if (refused != null) throw CommentMedia.fail(refused);
            working = true;
            built = send(ctx, pairs, text, markers, task);
            BUILT.put(task, built);
            return built;
        } catch (CommentMedia.SendFailed | SubmitGuard.Cancelled e) {
            if (e instanceof SubmitGuard.Cancelled) {
                Log.w(TAG, "send cancelled by rif: the post is not sent");
                FLATTEN.remove(task);
            }
            throw e;
        } catch (Throwable t) {
            Log.w(TAG, "post params failed", t);
            throw CommentMedia.fail("Couldn't send the images. Try again.");
        } finally {
            if (working) CommentMedia.hideProgress();
        }
    }

    /** Uploads every marker's file (background thread); progress shows as "Uploading i/n N%". */
    private static List<CommentMedia.Uploaded> uploadAll(Context ctx, List<CommentMedia.Marker> markers) {
        int n = markers.size();
        List<CommentMedia.Uploaded> uploads = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            String label = n == 1 ? "Uploading" : "Uploading " + (i + 1) + "/" + n;
            CommentMedia.Uploaded up = CommentMedia.uploadMarker(ctx, markers.get(i), label);
            recordUpload(ctx, up.id);
            uploads.add(up);
        }
        return uploads;
    }

    private static List<String> idsOf(List<CommentMedia.Uploaded> uploads) {
        List<String> out = new ArrayList<>();
        for (CommentMedia.Uploaded up : uploads) out.add(up.id);
        return out;
    }

    private static List<Boolean> gifsOf(List<CommentMedia.Uploaded> uploads) {
        List<Boolean> out = new ArrayList<>();
        for (CommentMedia.Uploaded up : uploads) out.add(up.gif);
        return out;
    }

    private static List<String> urlsOf(List<CommentMedia.Uploaded> uploads) {
        List<String> out = new ArrayList<>();
        for (CommentMedia.Uploaded up : uploads) out.add(imageUrl(up.id, up.mime));
        return out;
    }

    private static c<String, String>[] send(Context ctx, c<String, String>[] pairs, String text,
            List<CommentMedia.Marker> markers, Object task) {
        List<CommentMedia.Uploaded> uploads = uploadAll(ctx, markers);
        // rif cancelled the send while the images went up (Back, a recreated screen): don't post.
        SubmitGuard.throwIfCancelled(task);
        CommentMedia.showProgress("Sending");
        String body = attachBody(text, markers, idsOf(uploads), gifsOf(uploads));
        FLATTEN.put(task, new Flatten(swapMarkers(text, markers, urlsOf(uploads))));
        return withText(pairs, body);
    }

    // ------------------------------------------------------------ post edits

    /**
     * What the rest of a post edit needs: the post, its text with each new marker as its link (the
     * flatten), and the attaching text of a second try without the unsure ids (null when the first
     * try already had none).
     */
    private static final class PostEdit {
        final String post;
        final String text;
        final String retryBody;

        PostEdit(String post, String text, String retryBody) {
            this.post = post;
            this.text = text;
            this.retryBody = retryBody;
        }
    }

    private static final Map<Object, PostEdit> POST_EDITS = Collections.synchronizedMap(new WeakHashMap<Object, PostEdit>());

    /**
     * Hook (EditTask.d0 through {@link CommentMedia#editParams}, for a post, {@code t3_}; background
     * thread). A text with no new marker and no placeholder of the post's own images goes out as rif
     * sends it (the post's images stay as the links in the text, which keeps them served). A
     * {@code *Processing img <id>...*} placeholder is what a post is left with when its flatten
     * failed: if the id is the post's own (listed by Reddit or uploaded by us) it takes the same path
     * as a new marker and the text edit makes it the image's link; any other stays plain text.
     * With markers or such placeholders: the post's own images are looked up, the
     * new files are uploaded, and the edit goes out as markdown with each new marker, each own image
     * (listed by Reddit) and each {@code i.redd.it} link of the body as its token: an edit that
     * attaches media deletes every earlier image it doesn't send again. The text edit that follows
     * ({@link #wrapEditResponse}) puts the links back; a link that isn't the author's makes Reddit
     * refuse the edit, and it is sent again there without those. Failures show a toast and throw, so
     * rif keeps the dialog and the text.
     */
    static c<String, String>[] postEditParams(c<String, String>[] pairs, Object task) {
        boolean working = false;
        try {
            c<String, String>[] built = BUILT.get(task);
            if (built != null) return built;
            String thing = null;
            String text = null;
            for (c<String, String> p : pairs) {
                if (p == null) continue;
                if ("thing_id".equals(p.a)) thing = p.b;
                else if ("text".equals(p.a)) text = p.b;
            }
            if (thing == null || text == null) return pairs;
            boolean placeholders = CommentMedia.hasPlaceholder(text);
            if (text.indexOf("![") < 0 && !placeholders) return pairs;
            Context ctx = Settings.context();
            if (ctx == null) return pairs;
            List<CommentMedia.Marker> markers = CommentMedia.knownMarkers(text, CommentMedia.knownMarkerSet(ctx));
            if (markers.isEmpty() && !placeholders) return pairs;
            working = true;
            CommentMedia.showProgress("Checking post");
            List<OwnImg> own;
            boolean settled;
            try {
                JSONObject post = lookupPost(ctx, thing);
                own = ownImages(post);
                settled = assetsSettled(post, System.currentTimeMillis() / 1000);
            } catch (IOException e) {
                Log.w(TAG, "post " + thing + " not read: " + e.getMessage());
                throw CommentMedia.fail(CHECK_POST_FAILED);
            }
            // Every image the post has goes out again: the edit deletes the ones it doesn't send.
            java.util.Set<String> uploaded = uploadedIds(ctx);
            List<Ref> refs = ownRefs(text, withBodyLinks(withPlaceholders(own, text, uploaded), text), uploaded);
            // The probe asks only for the files of the post's own placeholders, never for an upload of this edit.
            refs = withProbedExtensions(text, refs, new Prober() {
                @Override
                public boolean served(String url) {
                    return GalleryRepair.headOk(url);
                }
            }, settled);
            // No new image and no placeholder to repair: the edit goes out as rif has it.
            if (markers.isEmpty() && !hasRepairable(text, refs)) return pairs;
            List<CommentMedia.Uploaded> uploads = uploadAll(ctx, markers);
            CommentMedia.showProgress("Sending");
            List<Item> items = mergeItems(refs, markers, idsOf(uploads), gifsOf(uploads));
            String body = attachEditBody(text, items, false);
            String retryBody = hasUnsure(items) ? attachEditBody(text, items, true) : null;
            POST_EDITS.put(task, new PostEdit(thing, flattenEditText(text, items, urlsOf(uploads)), retryBody));
            built = withText(pairs, body);
            BUILT.put(task, built);
            return built;
        } catch (CommentMedia.SendFailed e) {
            throw e;
        } catch (Throwable t) {
            Log.w(TAG, "post edit params failed", t);
            throw CommentMedia.fail("Couldn't save the edit. Try again.");
        } finally {
            if (working) CommentMedia.hideProgress();
        }
    }

    /** The post {@code name} (t3_) as Reddit has it, with its rich text; background thread. */
    private static JSONObject lookupPost(Context ctx, String name) throws IOException {
        String id = name.substring(3);
        if (!id.matches("[a-z0-9]{1,20}")) throw new IOException("odd post name " + name);
        ImageHosting.Resp r;
        try {
            r = ImageHosting.authed(ctx, API + "/comments/" + id + ".json?raw_json=1&rtj=yes&limit=1", null);
        } catch (ImageHosting.UploadException e) {
            throw new IOException(e.getMessage());
        }
        if (r.code != 200) throw new IOException("HTTP " + r.code);
        JSONObject post = postFromListing(r.body, id);
        if (post == null) throw new IOException("post not in the listing");
        return post;
    }

    /** Whether {@code reply} is a JSON object (an HTML error page or an empty body is not). */
    static boolean isJson(String reply) {
        try {
            new JSONObject(reply);
            return true;
        } catch (JSONException e) {
            return false;
        }
    }

    /**
     * Hook (EditTask.m0 through {@link CommentMedia#wrapCommentResponse}): the reply to a post edit
     * that attached images. If Reddit refused it for a media id that isn't the author's, the edit is
     * sent once more without the ids that were only guessed from links in the body; a second refusal
     * goes to rif as it is, so the user sees Reddit's error and keeps the dialog. After a good edit
     * the post is edited again with the text (images as plain links), and rif is given that edit's
     * reply, which has the wrapper it expects. If every try of that fails the attaching edit's reply
     * goes back as it is with {@link #POST_UP_NOTICE}. Returns null when the task didn't send a post
     * with new images: the caller handles the reply.
     */
    static InputStream wrapEditResponse(Object task, InputStream in) {
        PostEdit edit = POST_EDITS.remove(task);
        if (edit == null || in == null) return null;
        long replyAt = SystemClock.elapsedRealtime();
        byte[] raw;
        try {
            raw = readAll(in);
        } catch (IOException e) {
            Log.w(TAG, "edit response read failed: " + e);
            return new ByteArrayInputStream(new byte[0]);
        }
        boolean shown = false;
        try {
            String reply = new String(raw, UTF8);
            Context ctx = Settings.context();
            if (ctx != null && edit.retryBody != null && isInvalidMedia(reply)) {
                Log.w(TAG, "Reddit refused the edit (" + CommentMedia.firstError(reply) + "): trying without the linked ids");
                CommentMedia.showProgress("Saving");
                shown = true;
                String again = editReply(ctx, edit.post, edit.retryBody);
                if (again == null) return new ByteArrayInputStream(raw);
                reply = again;
                raw = again.getBytes(UTF8);
                replyAt = SystemClock.elapsedRealtime();
            }
            if (hasErrors(reply) || !isJson(reply)) {
                Log.w(TAG, "Reddit refused the edit: " + (isJson(reply) ? CommentMedia.firstError(reply) : "reply is not JSON"));
                return new ByteArrayInputStream(raw);
            }
            if (ctx == null) {
                CommentMedia.toast(POST_UP_NOTICE);
                return new ByteArrayInputStream(raw);
            }
            CommentMedia.showProgress("Finishing post");
            shown = true;
            String flat = flattenReply(ctx, edit.post, edit.text);
            if (flat == null) {
                CommentMedia.toast(POST_UP_NOTICE);
                return new ByteArrayInputStream(raw);
            }
            settle(replyAt);
            return new ByteArrayInputStream(flat.getBytes(UTF8));
        } catch (Throwable t) {
            Log.w(TAG, "post edit flatten failed", t);
            CommentMedia.toast(POST_UP_NOTICE);
            return new ByteArrayInputStream(raw);
        } finally {
            if (shown) CommentMedia.hideProgress();
        }
    }

    /** One edit of post {@code name} to {@code text}: Reddit's reply (errors included), or null when the request failed. */
    private static String editReply(Context ctx, String name, String text) {
        try {
            ImageHosting.Resp r = ImageHosting.authed(ctx, API + "/api/editusertext", flattenForm(name, text).getBytes(UTF8));
            return r.body;
        } catch (Throwable t) {
            Log.w(TAG, "second try failed: " + t);
            return null;
        }
    }

    /**
     * Hook (SubmitTask.k0 at entry, after {@link ImageHosting#wrapResponse} has looked up an image
     * post; background thread, the thread of d0): the reply to a post sent with images. The new
     * post is edited into its flat form; the reply goes back to rif as it was.
     * The post exists already, so nothing here may fail the submit: a failed edit only shows
     * {@link #POST_UP_NOTICE}. Posts without images, and replies with Reddit's errors, are not touched.
     */
    public static InputStream wrapSubmitResponse(Object task, InputStream in) {
        Flatten flatten = FLATTEN.remove(task);
        if (flatten == null || in == null) return in;
        long replyAt = SystemClock.elapsedRealtime();
        byte[] raw;
        try {
            raw = readAll(in);
        } catch (IOException e) {
            Log.w(TAG, "response read failed: " + e);
            return new ByteArrayInputStream(new byte[0]);
        }
        boolean shown = false;
        try {
            String reply = new String(raw, UTF8);
            String name = postName(reply);
            if (name == null) {
                if (hasErrors(reply)) {
                    Log.w(TAG, "Reddit refused the post: " + CommentMedia.firstError(reply));
                } else {
                    Log.w(TAG, "no post in the reply: " + reply);
                    CommentMedia.toast(POST_UP_NOTICE);
                }
                return new ByteArrayInputStream(raw);
            }
            Context ctx = Settings.context();
            if (ctx == null) {
                CommentMedia.toast(POST_UP_NOTICE);
                return new ByteArrayInputStream(raw);
            }
            CommentMedia.showProgress("Finishing post");
            shown = true;
            if (flattenReply(ctx, name, flatten.text) == null) CommentMedia.toast(POST_UP_NOTICE);
            else settle(replyAt);
        } catch (Throwable t) {
            Log.w(TAG, "flatten failed", t);
            CommentMedia.toast(POST_UP_NOTICE);
        } finally {
            if (shown) CommentMedia.hideProgress();
        }
        return new ByteArrayInputStream(raw);
    }

    /**
     * Edits post {@code name} to {@code text} (markdown), retrying as {@link #FLATTEN_BACKOFF_MS} says.
     * Returns Reddit's reply to the edit that worked, or null when every try failed.
     */
    private static String flattenReply(final Context ctx, String name, String text) {
        final byte[] form = flattenForm(name, text).getBytes(UTF8);
        final String[] reply = new String[1];
        boolean done = retry(new Attempt() {
            @Override
            public String run() {
                try {
                    ImageHosting.Resp r = ImageHosting.authed(ctx, API + "/api/editusertext", form);
                    String failure = editResult(r.code, r.body);
                    if (failure == null) reply[0] = r.body != null ? r.body : "";
                    return failure;
                } catch (ImageHosting.UploadException e) {
                    return e.getMessage();
                } catch (Throwable t) {
                    return String.valueOf(t);
                }
            }
        }, FLATTEN_BACKOFF_MS, new Sleeper() {
            @Override
            public void sleep(long ms) throws InterruptedException {
                Thread.sleep(ms);
            }
        });
        return done ? reply[0] : null;
    }

    /**
     * Waits until {@link #SETTLE_MS} have passed since {@code replyAt} (a SystemClock.elapsedRealtime
     * value taken when Reddit's reply came in). Background thread. Reddit has the images ready 3-4 s
     * after a submit or edit; a fetch of an {@code i.redd.it} link before that makes it cache a 404
     * for 20+ minutes, and rif opens the post and loads its images right after the reply is handled.
     */
    private static void settle(long replyAt) {
        long wait = settleWait(replyAt, SystemClock.elapsedRealtime());
        if (wait <= 0) return;
        try {
            Thread.sleep(wait);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[4096];
        int n;
        while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
        return out.toByteArray();
    }
}
