/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Iterator;

/**
 * The title, the subtitle (the artist when the header names one) and the cover url of a playlist or album, read
 * from a browse response. Each is empty when the response does not have it. Pure, so the host tests pin the reading.
 */
record SourceHeader(String title, String subtitle, String thumbnailUrl) {
    static final SourceHeader EMPTY = new SourceHeader("", "", "");

    private static final String[] HEADER_KEYS = {"musicDetailHeaderRenderer", "musicResponsiveHeaderRenderer",
            "musicHeaderRenderer", "musicElementHeaderRenderer"};

    boolean hasTitle() {
        return !title.isEmpty();
    }

    static SourceHeader read(Object response) {
        String title = title(response);
        if (title.isEmpty()) return EMPTY;

        JSONObject header = header(response);
        if (header == null) return new SourceHeader(title, "", "");

        String subtitle = text(header.optJSONObject("straplineTextOne"));
        if (subtitle.isEmpty()) subtitle = text(header.optJSONObject("subtitle"));
        return new SourceHeader(title, subtitle, largestThumbnail(header.opt("thumbnail")));
    }

    /** Titles come from playlist metadata or headers, not from a song row or a menu label. */
    static String title(Object node) {
        if (node instanceof JSONObject object) {
            JSONObject metadata = object.optJSONObject("musicPlaylistMetadataRenderer");
            if (metadata != null && !metadata.optString("title").isEmpty()) return metadata.optString("title");
            for (String key : HEADER_KEYS) {
                JSONObject header = object.optJSONObject(key);
                String text = header == null ? "" : text(header.optJSONObject("title"));
                if (!text.isEmpty()) return text;
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                if (isRowKey(key)) continue;
                String title = title(object.opt(key));
                if (!title.isEmpty()) return title;
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) {
                String title = title(array.opt(i));
                if (!title.isEmpty()) return title;
            }
        }
        return "";
    }

    /** The first header renderer that has a title, found the way {@link #title} finds the title. */
    @Nullable
    private static JSONObject header(Object node) {
        if (node instanceof JSONObject object) {
            for (String key : HEADER_KEYS) {
                JSONObject header = object.optJSONObject(key);
                if (header != null && !text(header.optJSONObject("title")).isEmpty()) return header;
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                if (isRowKey(key)) continue;
                JSONObject header = header(object.opt(key));
                if (header != null) return header;
            }
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) {
                JSONObject header = header(array.opt(i));
                if (header != null) return header;
            }
        }
        return null;
    }

    private static boolean isRowKey(String key) {
        return key.endsWith("ItemRenderer") || key.equals("musicPlaylistShelfRenderer");
    }

    private static String text(@Nullable JSONObject text) {
        if (text == null) return "";
        if (text.has("simpleText")) return text.optString("simpleText");

        JSONArray runs = text.optJSONArray("runs");
        if (runs == null) return "";

        StringBuilder value = new StringBuilder();
        for (int i = 0; i < runs.length(); i++) {
            JSONObject run = runs.optJSONObject(i);
            if (run != null) value.append(run.optString("text"));
        }
        return value.toString();
    }

    /** The widest url of the first thumbnail list below {@code node}, or an empty string. */
    private static String largestThumbnail(@Nullable Object node) {
        JSONArray thumbnails = thumbnailList(node);
        String url = "";
        int width = -1;
        for (int i = 0; thumbnails != null && i < thumbnails.length(); i++) {
            JSONObject thumbnail = thumbnails.optJSONObject(i);
            if (thumbnail == null || thumbnail.optString("url").isEmpty()) continue;
            if (thumbnail.optInt("width") > width) {
                width = thumbnail.optInt("width");
                url = thumbnail.optString("url");
            }
        }
        return url;
    }

    @Nullable
    private static JSONArray thumbnailList(@Nullable Object node) {
        if (node instanceof JSONObject object) {
            JSONArray thumbnails = object.optJSONArray("thumbnails");
            if (thumbnails != null) return thumbnails;

            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                JSONArray found = thumbnailList(object.opt(keys.next()));
                if (found != null) return found;
            }
        }
        return null;
    }
}
