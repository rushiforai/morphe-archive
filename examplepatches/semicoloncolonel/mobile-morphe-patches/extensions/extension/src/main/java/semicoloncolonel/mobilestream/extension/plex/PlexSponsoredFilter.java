package semicoloncolonel.mobilestream.extension.plex;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;

/**
 * Removes sponsored placements from Plex's API responses before the app's JavaScript reads them.
 *
 * Plex's screens are server-driven: the response describes each row and tile as a component
 * ("_component"). A sponsored tile is an ordinary component whose content comes from Plex's ad
 * server (SpringServe): its artwork is hosted on springserve.com, and its links carry ad
 * campaign parameters (adTagId, adCampaignId, metrics_ad_server). Those markers do not depend on
 * the app's language, unlike the "Sponsored" label. Older item responses mark a sponsored item
 * with an AdTile list instead (showBadge set).
 *
 * Responses are cleaned from the innermost level outwards, so the sponsored tile is removed and
 * the row that held it stays. Anything that does not parse as JSON is returned unchanged.
 */
@SuppressWarnings("unused")
public final class PlexSponsoredFilter {
    private static final String TAG = "MSP-PLEX";

    private static final String[] AD_MARKERS = {
            "springserve.com", "adCampaignId=", "metrics_ad_server=", "adTagId=",
    };

    private PlexSponsoredFilter() {
    }

    /** Called with each text response body from Nitro Fetch, Plex's JavaScript network client. */
    public static String filterBody(String body) {
        if (body == null || !mayContainAds(body)) {
            return body;
        }
        try {
            String trimmed = body.trim();
            Object root = trimmed.startsWith("[") ? new JSONArray(trimmed) : new JSONObject(trimmed);
            int removed = strip(root);
            if (removed == 0) {
                return body;
            }
            Log.i(TAG, "removed " + removed + " sponsored item(s)");
            return root.toString();
        } catch (Throwable t) {
            return body;
        }
    }

    /**
     * Called with each binary response body (a Nitro ArrayBuffer) from Nitro Fetch. Reached by
     * reflection, since the extension is not compiled against Nitro. Returns the same buffer
     * unless sponsored items were removed.
     */
    public static Object filterBytes(Object arrayBuffer) {
        if (arrayBuffer == null) {
            return null;
        }
        try {
            byte[] bytes = (byte[]) arrayBuffer.getClass().getMethod("toByteArray").invoke(arrayBuffer);
            if (bytes == null || bytes.length == 0) {
                return arrayBuffer;
            }
            String body = new String(bytes, StandardCharsets.UTF_8);
            String filtered = filterBody(body);
            if (filtered == body) {
                return arrayBuffer;
            }
            byte[] out = filtered.getBytes(StandardCharsets.UTF_8);
            ByteBuffer buffer = ByteBuffer.allocateDirect(out.length);
            buffer.put(out);
            buffer.flip();
            return arrayBuffer.getClass().getConstructor(ByteBuffer.class).newInstance(buffer);
        } catch (Throwable t) {
            return arrayBuffer;
        }
    }

    private static boolean mayContainAds(String text) {
        if (text.contains("\"AdTile\"")) {
            return true;
        }
        for (String marker : AD_MARKERS) {
            if (text.contains(marker)) {
                return true;
            }
        }
        return false;
    }

    /** Cleans every list under [node], children first. Returns how many items were removed. */
    private static int strip(Object node) {
        int removed = 0;
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            JSONArray names = object.names();
            if (names != null) {
                for (int i = 0; i < names.length(); i++) {
                    String name = names.optString(i);
                    Object child = object.opt(name);
                    removed += strip(child);
                    if (child instanceof JSONObject && isSponsored((JSONObject) child)) {
                        // A sponsored component held directly in a property (the
                        // Discover screen's "hero").
                        object.remove(name);
                        removed++;
                    } else if (child instanceof JSONArray) {
                        JSONArray kept = withoutAds((JSONArray) child);
                        if (kept != null) {
                            removed += ((JSONArray) child).length() - kept.length();
                            try {
                                object.put(name, kept);
                                if ("Metadata".equals(name) && object.has("size")) {
                                    object.put("size", kept.length());
                                }
                            } catch (Throwable ignored) {
                                // Leave this list as it was.
                            }
                        }
                    }
                }
            }
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = 0; i < array.length(); i++) {
                removed += strip(array.opt(i));
            }
        }
        return removed;
    }

    /** [list] without its sponsored entries, or null when it has none. */
    private static JSONArray withoutAds(JSONArray list) {
        JSONArray kept = null;
        for (int i = 0; i < list.length(); i++) {
            Object item = list.opt(i);
            boolean ad = item instanceof JSONObject && isSponsored((JSONObject) item);
            if (ad && kept == null) {
                kept = new JSONArray();
                for (int j = 0; j < i; j++) kept.put(list.opt(j));
            } else if (!ad && kept != null) {
                kept.put(item);
            }
        }
        return kept;
    }

    private static boolean isSponsored(JSONObject item) {
        JSONArray tiles = item.optJSONArray("AdTile");
        if (tiles != null) {
            for (int i = 0; i < tiles.length(); i++) {
                JSONObject tile = tiles.optJSONObject(i);
                if (tile != null && tile.optBoolean("showBadge", false)) {
                    return true;
                }
            }
        }
        // A server-driven tile or card that still carries ad-server content after its own
        // children were cleaned.
        if (!item.has("_component")) {
            return false;
        }
        String text = item.toString();
        for (String marker : AD_MARKERS) {
            if (text.contains(marker)) {
                return true;
            }
        }
        return false;
    }
}
