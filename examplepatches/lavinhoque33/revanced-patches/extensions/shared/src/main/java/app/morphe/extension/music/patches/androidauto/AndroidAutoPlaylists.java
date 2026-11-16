/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.androidauto;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Android-free decisions shared by the live loader and tap dispatcher. Device files never enter this merge. */
final class AndroidAutoPlaylists {
    static final String SONGS = "songs";
    static final String PREFIX = "morphe-aa-playlist://play/";

    enum Availability { ONLINE, READY, PARTIAL, UNAVAILABLE }

    record Source(String id, String canonicalId, String title, int total, int ready, boolean album,
                  String coverVideoId) {}
    record Row(AndroidAutoPlaylistCatalog.Entry entry, Source source, Availability availability) {}
    record Labels(String album, String unavailable, String partial, String ready) {}

    private AndroidAutoPlaylists() {}

    static String canonical(String id) {
        return id.startsWith("VL") ? id.substring(2) : id;
    }

    static List<Row> merge(List<AndroidAutoPlaylistCatalog.Entry> catalog, List<Source> sources, boolean online) {
        Map<String, Source> byId = new LinkedHashMap<>();
        Source songs = null;
        for (Source source : sources) {
            if (source.ready() <= 0) continue;
            if (SONGS.equals(source.id())) {
                songs = source;
                continue;
            }
            String key = canonical(source.canonicalId());
            Source previous = byId.get(key);
            if (previous == null || source.ready() > previous.ready()) byId.put(key, source);
        }

        Map<String, Row> rows = new LinkedHashMap<>();
        for (AndroidAutoPlaylistCatalog.Entry entry : catalog) {
            String key = canonical(entry.id());
            Source source = byId.remove(key);
            rows.putIfAbsent(key, row(new AndroidAutoPlaylistCatalog.Entry(key, entry.title(), entry.subtitle(),
                    entry.artwork()), source, online));
        }
        for (Map.Entry<String, Source> entry : byId.entrySet()) {
            Source source = entry.getValue();
            rows.putIfAbsent(entry.getKey(), row(new AndroidAutoPlaylistCatalog.Entry(entry.getKey(),
                    source.title(), "", ""), source, online));
        }
        List<Row> result = new ArrayList<>(rows.values());
        if (songs != null) {
            result.add(row(new AndroidAutoPlaylistCatalog.Entry(SONGS, "", "", ""), songs, online));
        }
        return result;
    }

    private static Row row(AndroidAutoPlaylistCatalog.Entry entry, Source source, boolean online) {
        Availability availability = source != null && source.ready() < source.total() ? Availability.PARTIAL
                : source != null ? Availability.READY : online ? Availability.ONLINE : Availability.UNAVAILABLE;
        return new Row(entry, source, availability);
    }

    static String subtitle(Row row, Labels labels) {
        String subtitle = row.entry().subtitle();
        if (row.source() != null && row.source().album()) subtitle = append(subtitle, labels.album());
        return switch (row.availability()) {
            case UNAVAILABLE -> append(subtitle, labels.unavailable());
            case PARTIAL -> append(subtitle,
                    String.format(labels.partial(), row.source().ready(), row.source().total()));
            case READY -> append(subtitle, labels.ready());
            case ONLINE -> subtitle;
        };
    }

    private static String append(String first, String second) {
        return first.isEmpty() ? second : first + " · " + second;
    }


    static boolean showDeviceDownloads(boolean enabled, int devicePlaylistCount) {
        return enabled && devicePlaylistCount > 0;
    }

    static String mediaId(String account, String id) {
        if (!account.matches("[a-f0-9]{64}") || !id.matches("[A-Za-z0-9_-]{1,128}")) {
            throw new IllegalArgumentException("Invalid AA playlist identity");
        }
        return PREFIX + account + "/" + canonical(id);
    }

    /** Account-scoped stable IDs also reject head-unit cards left over from another selected account. */
    static String parseId(String mediaId, String account) {
        String prefix = PREFIX + account + "/";
        if (account.isEmpty() || !mediaId.startsWith(prefix)) return null;

        String id = mediaId.substring(prefix.length());
        return id.matches("[A-Za-z0-9_-]{1,128}") ? id : null;
    }
}
