/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.androidauto;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/** Song identities stay independent of connectivity and of the shorter ready-copy queue. */
final class AndroidAutoPlaylistChildren {
    static final String LIST_PREFIX = "morphe-aa-playlist://list/";
    static final String TRACK_PREFIX = "morphe-aa-playlist://track/";
    private static final Pattern ID = Pattern.compile("[A-Za-z0-9_-]{1,128}");
    private static final Pattern VIDEO = Pattern.compile("[A-Za-z0-9_-]{1,20}");
    private static final Pattern INDEX = Pattern.compile("[0-9]{1,6}");

    private static final byte[] NO_COMMAND = new byte[0];

    record Track(String videoId, String title, String artist, String artwork, byte[] command) {
        Track(String videoId, String title, String artist, String artwork) {
            this(videoId, title, artist, artwork, NO_COMMAND);
        }
    }
    record Page(String playlistId, List<Track> tracks, String continuation) {}
    record Selection(String sourceId, String videoId, int index) {}
    record Row(Track track, int index, boolean playAll, boolean unavailable) {}
    enum Route { ONLINE_PLAYLIST, ONLINE_TRACK, LOCAL_QUEUE, UNAVAILABLE }

    private AndroidAutoPlaylistChildren() {}

    static String listId(String account, String sourceId) {
        return LIST_PREFIX + account + "/" + requireId(sourceId);
    }

    static String parseList(String mediaId, String account) {
        String prefix = LIST_PREFIX + account + "/";
        if (!mediaId.startsWith(prefix)) return null;
        String id = mediaId.substring(prefix.length());
        return ID.matcher(id).matches() ? id : null;
    }

    static String trackId(String account, String sourceId, String videoId, int index) {
        if (index < 0 || index > 999_999 || (!videoId.isEmpty() && !VIDEO.matcher(videoId).matches())) {
            throw new IllegalArgumentException("Invalid AA track identity");
        }
        return TRACK_PREFIX + account + "/" + requireId(sourceId) + "/"
                + (videoId.isEmpty() ? "-" : videoId) + "/" + index;
    }

    static Selection parseTrack(String mediaId, String account) {
        String prefix = TRACK_PREFIX + account + "/";
        if (!mediaId.startsWith(prefix)) return null;
        String[] parts = mediaId.substring(prefix.length()).split("/", -1);
        if (parts.length != 3 || !ID.matcher(parts[0]).matches() || !VIDEO.matcher(parts[1]).matches()
                || !INDEX.matcher(parts[2]).matches()) return null;
        return new Selection(parts[0], parts[1].equals("-") ? "" : parts[1], Integer.parseInt(parts[2]));
    }

    /** A failed/partial online load never substitutes its truncated prefix for the local fallback. */
    static Page choose(Page fetched, boolean complete, Page local) {
        return complete ? fetched : local;
    }

    static List<Row> rows(Page page, boolean online, Set<String> ready, Map<String, String> aliases) {
        List<Row> rows = new ArrayList<>();
        if (online || !page.tracks().isEmpty()) rows.add(new Row(null, 0, true, !online && ready.isEmpty()));
        for (int index = 0; index < page.tracks().size(); index++) {
            Track track = page.tracks().get(index);
            String song = aliases.getOrDefault(track.videoId(), track.videoId());
            boolean unavailable = track.videoId().isEmpty() || (!online && !ready.contains(song));
            rows.add(new Row(track, index, false, unavailable));
        }
        if (page.tracks().isEmpty()) rows.add(new Row(null, 0, false, true));
        return rows;
    }

    static Route route(boolean online, boolean playAll, String videoId, int readyIndex) {
        if (!playAll && videoId.isEmpty()) return Route.UNAVAILABLE;
        if (online) return playAll ? Route.ONLINE_PLAYLIST : Route.ONLINE_TRACK;
        return readyIndex >= 0 ? Route.LOCAL_QUEUE : Route.UNAVAILABLE;
    }

    /** Resolve the same song after a connectivity change, not the old numeric ready-queue index. */
    static int readyIndex(List<String> full, List<String> ready, String videoId, int sourceIndex) {
        int occurrence = 0;
        if (sourceIndex >= 0 && sourceIndex < full.size() && full.get(sourceIndex).equals(videoId)) {
            for (int index = 0; index < sourceIndex; index++) if (full.get(index).equals(videoId)) occurrence++;
        }
        for (int index = 0; index < ready.size(); index++) {
            if (ready.get(index).equals(videoId) && occurrence-- == 0) return index;
        }
        return -1;
    }

    static Track selectedTrack(List<Track> tracks, String videoId, int sourceIndex) {
        if (sourceIndex >= 0 && sourceIndex < tracks.size()
                && videoId.equals(tracks.get(sourceIndex).videoId())) return tracks.get(sourceIndex);
        for (Track track : tracks) if (videoId.equals(track.videoId())) return track;
        return null;
    }

    private static String requireId(String id) {
        if (!ID.matcher(id).matches()) throw new IllegalArgumentException("Invalid AA playlist identity");
        return id;
    }
}
