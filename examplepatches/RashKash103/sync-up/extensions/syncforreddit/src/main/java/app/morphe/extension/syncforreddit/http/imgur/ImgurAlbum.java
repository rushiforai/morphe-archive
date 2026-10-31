package app.morphe.extension.syncforreddit.http.imgur;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.http.ArchiveRequests;

/**
 * Recovers the contents of an Imgur album from an archived copy of its page.
 *
 * <p>There is no way to derive an album's images from its id, and Sync reached them through a
 * proxy that no longer exists, so the page itself has to be read. An album that is still there
 * says what is in it on its own page, which is both current and the only thing that works for
 * one the archive never captured. An album that has gone is looked for in the archive instead:
 * Imgur used to render the list into the page, and pages captured since then are a script shell
 * with nothing in them, so older snapshots are tried first.
 */
final class ImgurAlbum {
    private static final String ALBUM_URL = "https://imgur.com/a/";

    /**
     * The page Imgur serves for embedding an album elsewhere. The album page itself is now a
     * script shell that names nothing but its cover, while this one still carries the whole
     * list written into it, and it needs no credential to ask for.
     */
    private static final String EMBED_URL_SUFFIX = "/embed?pub=true";

    /**
     * What the embed page calls the list. Anchored on the assignment rather than on the key,
     * because the key itself sits inside the object and scanning on from it finds the first
     * image rather than the list holding it.
     */
    private static final String EMBEDDED_IMAGES = "var images";

    /** How many archived copies to try before giving up on an album. */
    private static final int SNAPSHOTS_TO_TRY = 3;

    private static final int CACHE_SIZE = 32;

    private static final String EMBEDDED_LIST = "\"album_images\"";

    /**
     * What a live album page carries: a run of JavaScript setting a string, and that string is
     * the album written as JSON.
     */
    private static final Pattern EMBEDDED_POST = Pattern.compile(
            "postDataJSON\\s*=\\s*\"((?:[^\"\\\\]|\\\\.)*)\"");

    /** Only used where the embedded list is absent, and carries no dimensions. */
    private static final Pattern LINKED_IMAGE = Pattern.compile(
            "i\\.imgur\\.com/([A-Za-z0-9]{5,10})(\\.(?:jpe?g|png|gifv?|webp|mp4))",
            Pattern.CASE_INSENSITIVE);

    private static final Map<String, List<JSONObject>> cache =
            Collections.synchronizedMap(new LinkedHashMap<String, List<JSONObject>>(
                    CACHE_SIZE + 1, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, List<JSONObject>> eldest) {
                    return size() > CACHE_SIZE;
                }
            });

    private ImgurAlbum() {}

    /**
     * @return Images in album order, shaped as Sync's own parser expects, empty when nothing
     *         could be recovered.
     */
    static List<JSONObject> imagesOf(String albumId) throws IOException, JSONException {
        List<JSONObject> cached = cache.get(albumId);
        if (cached != null) {
            return cached;
        }

        List<JSONObject> images = new ArrayList<>();
        IOException failure = null;

        // What the album says about itself, where it is still there to say it.
        try {
            images = live(albumId);
            if (!images.isEmpty()) {
                Logger.printInfo(() -> "Read album " + albumId + " from Imgur");
                cache.put(albumId, images);
                return images;
            }
            Logger.printInfo(() -> "The page for album " + albumId
                    + " named nothing; asking for the embed of it");
        } catch (IOException ex) {
            // Gone, or unreachable; the embed and the archive may still have it either way.
            failure = ex;
            Logger.printInfo(() -> "Could not read the page for album " + albumId + ": " + ex);
        }

        // The album page is now a script shell for anything recent, so the embed of it is what
        // actually answers. Tried second rather than first because the page, where it still
        // says anything, carries the full-size addresses rather than ids to build them from.
        try {
            // Held apart from the variable above, which is reassigned and so cannot be spoken
            // about from inside a log message.
            List<JSONObject> embedded = embed(albumId);
            if (!embedded.isEmpty()) {
                Logger.printInfo(() -> "Read album " + albumId + " from its embed, "
                        + embedded.size() + " image(s)");
                cache.put(albumId, embedded);
                return embedded;
            }
            Logger.printInfo(() -> "The embed of album " + albumId + " named nothing either");
        } catch (IOException ex) {
            failure = ex;
            Logger.printInfo(() -> "Could not read the embed of album " + albumId + ": " + ex);
        }

        for (String snapshot : WaybackMachine.findSnapshots(ALBUM_URL + albumId, SNAPSHOTS_TO_TRY)) {
            String html;
            try {
                html = ArchiveRequests.get(snapshot, "text/html");
            } catch (IOException ex) {
                // One capture being unreachable says nothing about the next.
                failure = ex;
                continue;
            }

            images = parse(html);
            if (!images.isEmpty()) {
                Logger.printInfo(() -> "Recovered album " + albumId + " from " + snapshot);
                break;
            }
        }

        // Only an answer is worth remembering. Recording a failure as an album with nothing in
        // it would leave it unrecoverable for as long as the app runs.
        if (images.isEmpty() && failure != null) {
            throw failure;
        }

        cache.put(albumId, images);
        return images;
    }

    /**
     * The album as its own page gives it, which is where an album that still exists is read
     * from. Nothing is derived from the id: the page names each image, its kind and its size.
     */
    private static List<JSONObject> live(String albumId) throws IOException, JSONException {
        String html = ArchiveRequests.get(ALBUM_URL + albumId, "text/html");

        Matcher found = EMBEDDED_POST.matcher(html);
        if (!found.find()) {
            return new ArrayList<>();
        }
        // The album is written as JSON inside a JavaScript string, so the string is read first.
        String written = new JSONArray("[\"" + found.group(1) + "\"]").getString(0);

        JSONArray media = new JSONObject(written).optJSONArray("media");
        if (media == null) {
            return new ArrayList<>();
        }

        List<JSONObject> images = new ArrayList<>();
        for (int i = 0; i < media.length(); i++) {
            JSONObject entry = media.optJSONObject(i);
            if (entry == null) {
                continue;
            }
            String link = entry.optString("url", "");
            if (link.isEmpty()) {
                String id = entry.optString("id", "");
                if (id.isEmpty()) {
                    continue;
                }
                link = "https://i.imgur.com/" + id + "." + entry.optString("ext", "jpg");
            }
            images.add(image(link, entry.optInt("width"), entry.optInt("height"),
                    entry.optString("name"), entry.optString("description")));
        }
        return images;
    }

    /**
     * The album as the page for embedding it gives it. That page carries the list Imgur used to
     * render into the album page itself — hash, extension and dimensions for each image — which
     * is the shape {@link #embedded} already reads.
     */
    private static List<JSONObject> embed(String albumId) throws IOException, JSONException {
        String html = ArchiveRequests.get(ALBUM_URL + albumId + EMBED_URL_SUFFIX, "text/html");
        Logger.printDebug(() -> "The embed of album " + albumId + " is " + html.length()
                + " characters, names a list: " + html.contains(EMBEDDED_IMAGES));
        return listIn(html, EMBEDDED_IMAGES);
    }

    private static List<JSONObject> parse(String html) throws JSONException {
        List<JSONObject> images = embedded(html);
        return images.isEmpty() ? linked(html) : images;
    }

    /**
     * The list Imgur rendered into the page, which carries the dimensions Sync insists on.
     */
    private static List<JSONObject> embedded(String html) throws JSONException {
        return listIn(html, EMBEDDED_LIST);
    }

    /**
     * Reads the list of images out of the object written after {@code marker}. Both the album
     * page Imgur used to serve and the embed page it still serves write the same object, under
     * different names.
     */
    private static List<JSONObject> listIn(String html, String marker) throws JSONException {
        List<JSONObject> images = new ArrayList<>();

        int at = html.indexOf(marker);
        if (at < 0) {
            return images;
        }
        int start = html.indexOf('{', at + marker.length());
        if (start < 0) {
            return images;
        }
        String block = objectAt(html, start);
        if (block == null) {
            Logger.printDebug(() -> "The object after " + marker + " does not close");
            return images;
        }

        JSONArray entries = new JSONObject(block).optJSONArray("images");
        if (entries == null) {
            return images;
        }

        for (int i = 0; i < entries.length(); i++) {
            JSONObject entry = entries.optJSONObject(i);
            if (entry == null) continue;

            String hash = entry.optString("hash", "");
            if (hash.isEmpty()) continue;

            String extension = entry.optString("ext", ".jpg");
            images.add(image(
                    "https://i.imgur.com/" + hash + extension,
                    entry.optInt("width"),
                    entry.optInt("height"),
                    entry.optString("title"),
                    entry.optString("description")));
        }
        return images;
    }

    /**
     * A last resort for layouts that only named the images in markup. The dimensions are
     * unknown, and Sync only uses them to size the view before the image arrives.
     */
    private static List<JSONObject> linked(String html) throws JSONException {
        List<JSONObject> images = new ArrayList<>();
        List<String> seen = new ArrayList<>();

        Matcher matcher = LINKED_IMAGE.matcher(html);
        while (matcher.find()) {
            String link = "https://i.imgur.com/" + matcher.group(1) + matcher.group(2);
            if (seen.contains(link)) continue;

            seen.add(link);
            images.add(image(link, 0, 0, "", ""));
        }
        return images;
    }

    private static JSONObject image(String link, int width, int height, String title,
                                    String description) throws JSONException {
        JSONObject image = new JSONObject();
        image.put("link", link);
        // Read with getInt rather than optInt by Sync, so they have to be present.
        image.put("width", width);
        image.put("height", height);
        image.put("title", title);
        image.put("description", description);
        return image;
    }

    /**
     * Reads one JSON object out of a larger document, respecting braces inside strings.
     */
    private static String objectAt(String text, int start) {
        int depth = 0;
        boolean inString = false;
        boolean escaped = false;

        for (int i = start; i < text.length(); i++) {
            char c = text.charAt(i);

            if (escaped) {
                escaped = false;
            } else if (c == '\\') {
                escaped = true;
            } else if (c == '"') {
                inString = !inString;
            } else if (!inString) {
                if (c == '{') {
                    depth++;
                } else if (c == '}') {
                    depth--;
                    if (depth == 0) {
                        return text.substring(start, i + 1);
                    }
                }
            }
        }
        return null;
    }
}
