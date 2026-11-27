// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.shared.redditgallery;

import android.net.Uri;
import app.reseam.runtime.Export;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.SequenceInputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class GalleryRequests {
    private static final int MAX_NORMALIZED_BYTES = 2 * 1024 * 1024;

    private GalleryRequests() {}

    @Export
    public static Uri byIdUri(Uri original) {
        if (original == null) {
            return null;
        }
        String url = original.toString();
        String replacement = byIdUrl(url);
        return replacement.equals(url) ? original : Uri.parse(replacement);
    }

    @Export
    public static String byIdUrl(String original) {
        try {
            URI url = new URI(original);
            String host = url.getHost();
            if (!"https".equals(url.getScheme())
                    || (!"oauth.reddit.com".equals(host) && !"api.reddit.com".equals(host)
                            && !"www.reddit.com".equals(host))
                    || url.getRawUserInfo() != null || url.getPort() != -1
                    || !"/api/info.json".equals(url.getRawPath())) {
                return original;
            }
            String query = url.getRawQuery();
            if (query != null) {
                for (String part : query.split("&")) {
                    if (part.matches("id=t3_[a-z0-9]+")) {
                        return "https://" + host + "/by_id/" + part.substring(3) + ".json?raw_json=1";
                    }
                }
            }
        } catch (URISyntaxException ignored) {
            // Leave unsupported request shapes to the original client.
        }
        return original;
    }

    @Export
    public static InputStream normalizeGalleryResponse(InputStream input) throws IOException {
        ByteArrayOutputStream prefix = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        while (prefix.size() <= MAX_NORMALIZED_BYTES) {
            int count = input.read(buffer);
            if (count == -1) {
                byte[] original = prefix.toByteArray();
                try {
                    JSONObject listing = new JSONObject(new String(original, StandardCharsets.UTF_8));
                    if (normalizeGallery(listing)) {
                        return new ByteArrayInputStream(listing.toString().getBytes(StandardCharsets.UTF_8));
                    }
                } catch (JSONException ignored) {
                    // Let the stock parser handle data that does not match the gallery schema.
                }
                return new ByteArrayInputStream(original);
            }
            prefix.write(buffer, 0, count);
        }
        return new SequenceInputStream(new ByteArrayInputStream(prefix.toByteArray()), input);
    }

    static boolean normalizeGallery(JSONObject listing) throws JSONException {
        JSONArray children = listing.getJSONObject("data").getJSONArray("children");
        JSONObject post = children.getJSONObject(0).getJSONObject("data");
        JSONObject gallery = post.getJSONObject("gallery_data");
        JSONArray items = gallery.getJSONArray("items");
        JSONObject metadata = post.getJSONObject("media_metadata");
        JSONArray retainedItems = new JSONArray();
        JSONObject retainedMetadata = new JSONObject();
        boolean changed = metadata.length() != items.length();

        for (int index = 0; index < items.length(); index++) {
            JSONObject item = items.optJSONObject(index);
            String id = item == null ? "" : item.optString("media_id");
            JSONObject entry = metadata.optJSONObject(id);
            if (entry == null) {
                changed = true;
                continue;
            }
            JSONObject source = entry.optJSONObject("s");
            if (!hasMedia(source)) {
                source = bestPreview(entry.optJSONArray("p"));
                if (source == null) {
                    changed = true;
                    continue;
                }
                entry.put("s", source);
                changed = true;
            }
            retainedItems.put(item);
            retainedMetadata.put(id, entry);
        }
        if (!changed || retainedItems.length() == 0) {
            return false;
        }
        gallery.put("items", retainedItems);
        post.put("media_metadata", retainedMetadata);
        return true;
    }

    private static JSONObject bestPreview(JSONArray previews) {
        if (previews == null) {
            return null;
        }
        JSONObject best = null;
        long bestArea = 0;
        for (int index = 0; index < previews.length(); index++) {
            JSONObject preview = previews.optJSONObject(index);
            if (!hasMedia(preview)) {
                continue;
            }
            long area = Math.max(1, preview.optInt("x")) * (long) Math.max(1, preview.optInt("y"));
            if (area > bestArea) {
                bestArea = area;
                best = preview;
            }
        }
        return best;
    }

    private static boolean hasMedia(JSONObject source) {
        return source != null && (isRedditMedia(source.optString("u"))
                || isRedditMedia(source.optString("gif")) || isRedditMedia(source.optString("mp4")));
    }

    private static boolean isRedditMedia(String value) {
        try {
            URI url = new URI(value);
            String host = url.getHost();
            return "https".equals(url.getScheme()) && url.getPort() == -1 && url.getRawUserInfo() == null
                    && ("i.redd.it".equals(host) || "v.redd.it".equals(host)
                    || "preview.redd.it".equals(host) || "external-preview.redd.it".equals(host));
        } catch (URISyntaxException ignored) {
            return false;
        }
    }
}
