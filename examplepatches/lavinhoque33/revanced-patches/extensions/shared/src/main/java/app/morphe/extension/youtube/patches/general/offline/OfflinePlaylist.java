/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-23.
 */

package app.morphe.extension.youtube.patches.general.offline;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.innertube.utils.AuthUtils;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.youtube.patches.utils.requests.ChannelSearchRoutes;

/**
 * Lists the videos of a playlist for the built-in downloader. The playlist is browsed as the mobile
 * web client, which lists a public playlist without an account. A private playlist is retried with
 * the account of the app.
 */
final class OfflinePlaylist {
    record Entry(String videoId, String title) {
    }

    record Result(String title, List<Entry> entries) {
    }

    private static final Pattern PLAYLIST_ID = Pattern.compile("[A-Za-z0-9_-]{2,64}");
    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{11}");
    private static final String TITLE_SUFFIX = " - YouTube";
    /** 100 videos a page, so this is far above any real playlist and only stops a server loop. */
    private static final int MAX_PAGES = 100;

    private OfflinePlaylist() {
    }

    static boolean isValidId(@Nullable String playlistId) {
        return playlistId != null && PLAYLIST_ID.matcher(playlistId).matches();
    }

    private static final Pattern LIST_PARAMETER = Pattern.compile("[?&]list=([A-Za-z0-9_-]{2,64})");
    /** A playlist id typed on its own: user playlists, uploads, albums, favorites, liked videos, watch later. */
    private static final Pattern BARE_PLAYLIST_ID = Pattern.compile("(PL|UU|OLAK|FL|LL|WL)[A-Za-z0-9_-]*");

    /**
     * @param input A youtube.com link with a {@code list} parameter, or a playlist id.
     * @return The playlist id, or null if the text is neither.
     */
    @Nullable
    static String parseId(@Nullable String input) {
        if (input == null) return null;
        String text = input.trim();
        Matcher link = LIST_PARAMETER.matcher(text);
        if (link.find()) return link.group(1);
        return isValidId(text) && BARE_PLAYLIST_ID.matcher(text).matches() ? text : null;
    }

    /**
     * Blocks on the network. A playlist that cannot be read completely is a failure, since the
     * user would believe all of it was queued.
     *
     * @return The playlist, or null if it is empty, unavailable, or could not be loaded.
     */
    @Nullable
    static Result fetch(String playlistId) {
        Result result = fetch(playlistId, false);
        if (result == null && !AuthUtils.isNotLoggedIn()) {
            Logger.printInfo(() -> "Playlist " + playlistId + " is not public, retrying with the account");
            result = fetch(playlistId, true);
        }
        return result;
    }

    @Nullable
    private static Result fetch(String playlistId, boolean authenticated) {
        try {
            final Locale locale = new Locale(Locale.getDefault().getLanguage());
            // Keyed by id: a playlist may contain a video more than once.
            Map<String, Entry> entries = new LinkedHashMap<>();
            Set<String> seenTokens = new HashSet<>();
            String title = "";
            byte[] body = ChannelSearchRoutes.createChannelBody("VL" + playlistId, locale);

            for (int page = 0; page < MAX_PAGES; page++) {
                JSONObject json = post(body, authenticated);
                if (json == null) return null;
                if (page == 0) title = parseTitle(json);

                List<Entry> found = new ArrayList<>();
                List<String> tokens = new ArrayList<>();
                collect(json, found, tokens);
                for (Entry entry : found) entries.putIfAbsent(entry.videoId(), entry);

                // The last token of a page continues the list; earlier ones belong to sort menus.
                String token = tokens.isEmpty() ? null : tokens.get(tokens.size() - 1);
                if (token == null || !seenTokens.add(token)) break;
                body = ChannelSearchRoutes.createContinuationBody(token, locale);
            }

            if (entries.isEmpty()) return null;
            final int count = entries.size();
            Logger.printInfo(() -> "Playlist " + playlistId + ": " + count + " videos");
            return new Result(title, new ArrayList<>(entries.values()));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not load playlist " + playlistId, ex);
            return null;
        }
    }

    @Nullable
    private static JSONObject post(byte[] body, boolean authenticated) throws Exception {
        HttpURLConnection connection = ChannelSearchRoutes.getConnection(ChannelSearchRoutes.CHANNEL_SEARCH);
        if (authenticated) {
            for (Map.Entry<String, String> header : AuthUtils.getRequestHeader().entrySet()) {
                if (!header.getValue().isEmpty()) connection.setRequestProperty(header.getKey(), header.getValue());
            }
        }
        connection.setFixedLengthStreamingMode(body.length);
        try (OutputStream output = connection.getOutputStream()) {
            output.write(body);
        }
        final int code = connection.getResponseCode();
        if (code != Requester.HTTP_STATUS_CODE_SUCCESS) {
            Logger.printInfo(() -> "Playlist request failed with code " + code);
            connection.disconnect();
            return null;
        }
        return Requester.parseJSONObjectAndDisconnect(connection);
    }

    private static String parseTitle(JSONObject json) {
        JSONObject header = json.optJSONObject("header");
        JSONObject renderer = header == null ? null : header.optJSONObject("pageHeaderRenderer");
        String title = renderer == null ? "" : renderer.optString("pageTitle");
        if (title.isEmpty()) {
            JSONObject microformat = json.optJSONObject("microformat");
            JSONObject data = microformat == null ? null : microformat.optJSONObject("microformatDataRenderer");
            title = data == null ? "" : data.optString("title");
            if (title.endsWith(TITLE_SUFFIX)) title = title.substring(0, title.length() - TITLE_SUFFIX.length());
        }
        return title.trim();
    }

    /**
     * The mobile web client lists a video as a {@code lockupViewModel}; older responses use a
     * {@code playlistVideoRenderer}. The continuation command sits at a varying depth.
     */
    private static void collect(Object node, List<Entry> entries, List<String> tokens) {
        if (node instanceof JSONArray array) {
            for (int i = 0, length = array.length(); i < length; i++) collect(array.opt(i), entries, tokens);
            return;
        }
        if (!(node instanceof JSONObject object)) return;

        JSONObject lockup = object.optJSONObject("lockupViewModel");
        if (lockup != null) {
            if ("LOCKUP_CONTENT_TYPE_VIDEO".equals(lockup.optString("contentType"))) {
                JSONObject metadata = lockup.optJSONObject("metadata");
                JSONObject lockupMetadata = metadata == null ? null : metadata.optJSONObject("lockupMetadataViewModel");
                JSONObject title = lockupMetadata == null ? null : lockupMetadata.optJSONObject("title");
                add(entries, lockup.optString("contentId"), title == null ? "" : title.optString("content"));
            }
            return;
        }
        JSONObject legacy = object.optJSONObject("playlistVideoRenderer");
        if (legacy != null) {
            JSONObject title = legacy.optJSONObject("title");
            JSONArray runs = title == null ? null : title.optJSONArray("runs");
            JSONObject run = runs == null ? null : runs.optJSONObject(0);
            add(entries, legacy.optString("videoId"), run == null ? "" : run.optString("text"));
            return;
        }

        JSONObject command = object.optJSONObject("continuationCommand");
        if (command != null) {
            String token = command.optString("token");
            if (!token.isEmpty()) tokens.add(token);
        }
        for (java.util.Iterator<String> keys = object.keys(); keys.hasNext(); ) {
            String key = keys.next();
            if (key.equals("header") || key.equals("topbar") || key.equals("microformat")
                    || key.equals("responseContext")) {
                continue;
            }
            collect(object.opt(key), entries, tokens);
        }
    }

    private static void add(List<Entry> entries, String videoId, String title) {
        if (VIDEO_ID.matcher(videoId).matches()) entries.add(new Entry(videoId, title.isEmpty() ? videoId : title));
    }
}
