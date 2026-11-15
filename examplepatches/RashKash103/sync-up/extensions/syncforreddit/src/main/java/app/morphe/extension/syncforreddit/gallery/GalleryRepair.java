/*
 * Ported from revanced-rif-patches (GPLv3):
 * https://github.com/MojiRS/revanced-rif-patches/commit/1215812d127df410af5baca14c75e8c98bda6eaf
 *
 * The finding is theirs: Reddit marks the pictures of some galleries as failed while the files
 * are still served, and they can be found again by asking i.redd.it for them. What is written
 * here differs in where it is called from and in what it has to write, since Sync reads a
 * gallery entry differently from rif.
 */

package app.morphe.extension.syncforreddit.gallery;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;

/**
 * Putting a gallery back together where Reddit says its pictures have failed.
 *
 * <p>Reddit answers some galleries with nothing but <code>{"status":"failed"}</code> for every
 * picture: no size, no preview, no address. The files are still there — every one of the six in
 * the gallery this was written for answers at <code>i.redd.it/&lt;media id&gt;.jpeg</code> — so
 * what is missing is the answer rather than the picture.
 *
 * <p>Sync does not throw on such an entry. It writes an empty address for that picture and goes
 * on, so the gallery opens with nothing in it, which is what a reader sees as a gallery that
 * will not load. This finds each picture by asking i.redd.it for it and writes the entry Reddit
 * should have sent.
 *
 * <p>What is written has to be what <em>Sync</em> reads, which is not what rif reads. Sync takes
 * the address from <code>s.mp4</code> or <code>s.u</code>, and then, for anything that is not an
 * mp4, reads <code>p[0].u</code> for the preview without first asking whether <code>p</code> is
 * there — so an entry carrying only <code>s</code>, which is all rif needs, would take the whole
 * gallery down with <em>Could not load gallery</em>. Both are written here.
 *
 * <p>A gallery with nothing wrong is handed back untouched and asks nothing of the network. So
 * is one this cannot mend: where no picture is found, Sync is left with exactly what it was
 * given, and shows whatever it would have shown.
 *
 * @noinspection unused
 */
public final class GalleryRepair {
    private GalleryRepair() {}

    /** A media id is the only thing that is ever put into an address. */
    private static final Pattern MEDIA_ID = Pattern.compile("[A-Za-z0-9]+");

    /** Tried in this order, after whichever answered last. */
    private static final String[] EXTENSIONS = {"jpeg", "png", "gif", "webp", "jpg"};

    private static final int TIMEOUT_MS = 3000;

    /**
     * How many pictures may be looked for and found missing before the rest are given up on.
     * A gallery whose files are genuinely gone would otherwise cost one request per picture and
     * per extension, on a thread a reader is waiting behind.
     */
    private static final int MAX_MISSED = 2;

    /** The longest the whole repair may take, however many pictures there are. */
    private static final long MAX_LOOKING_MS = 10_000L;

    /** Galleries are uploaded in one format, so the one that answered last is tried first. */
    private static volatile String lastHit;

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /** Whether a picture is really there. Separated so that it can be answered in a test. */
    interface Probe {
        boolean exists(String url);
    }

    /**
     * Called with the gallery response as Sync has just read it, before Sync parses it.
     *
     * @return What Sync should parse: the response it was given, or a mended copy of it.
     */
    public static String repair(String response) {
        if (!isPatchIncluded() || response == null || response.isEmpty()) {
            return response;
        }

        // Nothing is parsed for a response that cannot be holding a failed picture, since this
        // runs on every gallery that is opened.
        if (!response.contains("media_metadata") || !response.contains("failed")) {
            return response;
        }

        try {
            return repairOrThrow(response, GalleryRepair::reallyThere);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "gallery: could not mend the gallery: " + ex);
            return response;
        }
    }

    static String repairOrThrow(String response, Probe probe) throws JSONException {
        // A listing is either the object itself or, for a post fetched on its own, an array of
        // listings whose first one holds the post.
        Object root = new JSONTokener(response).nextValue();
        JSONObject listing;
        if (root instanceof JSONObject) {
            listing = (JSONObject) root;
        } else if (root instanceof JSONArray) {
            listing = ((JSONArray) root).getJSONObject(0);
        } else {
            return response;
        }

        JSONObject post = listing.getJSONObject("data").getJSONArray("children")
                .getJSONObject(0).getJSONObject("data");
        JSONObject meta = post.optJSONObject("media_metadata");
        JSONObject galleryData = post.optJSONObject("gallery_data");
        JSONArray items = galleryData == null ? null : galleryData.optJSONArray("items");
        if (meta == null || items == null) {
            return response;
        }

        if (!anythingBroken(meta)) {
            return response;
        }

        JSONArray kept = new JSONArray();
        int mended = 0;
        int usable = 0;
        int missed = 0;
        long until = System.nanoTime() + MAX_LOOKING_MS * 1_000_000L;

        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.optJSONObject(i);
            String id = item == null ? null : item.optString("media_id", null);
            if (id == null || !meta.has(id)) {
                // Not ours to mend, and Sync reads the item rather than the entry first.
                if (item != null) {
                    kept.put(item);
                }
                continue;
            }

            if (readable(meta.optJSONObject(id))) {
                usable++;
                kept.put(item);
                continue;
            }

            JSONObject found = null;
            if (missed < MAX_MISSED && System.nanoTime() < until) {
                found = lookFor(id, probe);
                if (found == null) {
                    missed++;
                }
            }

            if (found != null) {
                meta.put(id, found);
                mended++;
                usable++;
                kept.put(item);
            } else {
                // Sync asks the metadata for every item it keeps and throws where it is not
                // there, so an item with nothing behind it has to go as well.
                meta.remove(id);
            }
        }

        galleryData.put("items", kept);

        // An entry nothing refers to any more would still be read by anything that walks the
        // metadata rather than the items.
        for (String key : broken(meta)) {
            meta.remove(key);
        }

        if (usable == 0) {
            // Nothing to show. Sync is left with what it was given, so what the reader sees is
            // what they would have seen anyway rather than something of ours.
            return response;
        }

        final int count = mended;
        Logger.printInfo(() -> "gallery: found " + count + " picture(s) Reddit said had failed");
        return root.toString();
    }

    private static boolean anythingBroken(JSONObject meta) {
        return !broken(meta).isEmpty();
    }

    private static List<String> broken(JSONObject meta) {
        List<String> found = new ArrayList<>();
        Iterator<String> keys = meta.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (!readable(meta.optJSONObject(key))) {
                found.add(key);
            }
        }
        return found;
    }

    /**
     * Whether Sync can read the entry without throwing: it takes the address out of {@code s},
     * and the preview out of {@code p} for anything that is not an mp4.
     */
    private static boolean readable(JSONObject entry) {
        if (entry == null) {
            return false;
        }
        JSONObject source = entry.optJSONObject("s");
        if (source == null) {
            return false;
        }
        if (source.has("mp4")) {
            return true;
        }
        JSONArray previews = entry.optJSONArray("p");
        return previews != null && previews.length() > 0;
    }

    /** @return An entry for the picture behind the id, or nothing where it cannot be found. */
    private static JSONObject lookFor(String mediaId, Probe probe) {
        if (!MEDIA_ID.matcher(mediaId).matches()) {
            return null;
        }

        List<String> order = new ArrayList<>();
        String first = lastHit;
        if (first != null) {
            order.add(first);
        }
        for (String extension : EXTENSIONS) {
            if (!extension.equals(first)) {
                order.add(extension);
            }
        }

        for (String extension : order) {
            String url = "https://i.redd.it/" + mediaId + "." + extension;
            boolean there;
            try {
                there = probe.exists(url);
            } catch (Throwable ex) {
                there = false;
            }
            if (!there) {
                continue;
            }
            lastHit = extension;
            try {
                return entryFor(url, extension);
            } catch (JSONException ex) {
                return null;
            }
        }
        return null;
    }

    /**
     * The entry Reddit should have sent, written the way Sync reads one.
     *
     * <p>The sizes are written as zero because the picture has not been fetched and asking for
     * its size would cost another request for something Sync does not read here. The preview is
     * the picture itself, which is what Sync falls back to for an animation anyway.
     */
    static JSONObject entryFor(String url, String extension) throws JSONException {
        boolean animated = extension.equals("gif");

        JSONObject source = new JSONObject();
        source.put("u", url);
        source.put("x", 0);
        source.put("y", 0);

        JSONObject preview = new JSONObject();
        preview.put("u", url);
        preview.put("x", 0);
        preview.put("y", 0);
        JSONArray previews = new JSONArray();
        previews.put(preview);

        JSONObject entry = new JSONObject();
        entry.put("status", "valid");
        entry.put("e", animated ? "AnimatedImage" : "Image");
        entry.put("m", "image/" + (extension.equals("jpg") ? "jpeg" : extension));
        entry.put("s", source);
        entry.put("p", previews);
        return entry;
    }

    /**
     * Asks whether the picture is there without fetching it.
     *
     * <p>Redirects are not followed on purpose: asked for a type it does not hold, i.redd.it
     * answers 307 towards a page rather than saying no, so only a plain 200 counts. This runs on
     * the thread Volley parses a response on, never the drawing thread.
     */
    private static boolean reallyThere(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("HEAD");
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            connection.setRequestProperty("Accept", "image/*");
            return connection.getResponseCode() == 200;
        } catch (Throwable ex) {
            return false;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }
}
