/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.general.offline;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import okhttp3.HttpUrl;

/** The byte identity in a YouTube VOD segment URL, excluding its host, routing and signature. */
record OfflineHlsIdentity(String id, String itag, String encoding, String slice, String sequence,
                          String initialization, String file) {
    static boolean same(String before, String after, boolean byteRange) {
        if (before.equals(after)) return true;
        OfflineHlsIdentity left = parse(before, byteRange);
        return left != null && left.equals(parse(after, byteRange));
    }

    private static OfflineHlsIdentity parse(String url, boolean byteRange) {
        HttpUrl uri = HttpUrl.parse(url);
        if (uri == null || !uri.isHttps() || !uri.host().endsWith(".googlevideo.com")) return null;

        List<String> path = uri.pathSegments();
        if (path.isEmpty() || !"videoplayback".equals(path.get(0))) return null;
        Map<String, String> values = new HashMap<>();
        for (int index = 1; index + 1 < path.size(); index += 2) {
            if (values.put(path.get(index), path.get(index + 1)) != null) return null;
        }
        for (int index = 0; index < uri.querySize(); index++) {
            String value = uri.queryParameterValue(index);
            if (value != null && values.put(uri.queryParameterName(index), value) != null) return null;
        }

        String id = values.get("id");
        String itag = values.get("itag");
        String encoding = values.get("sgovp");
        if (encoding == null && byteRange) encoding = "lmt=" + values.getOrDefault("lmt", "");
        if (id == null || itag == null || encoding == null || !hasRevision(encoding)) return null;

        // Current VOD fragments name their underlying encode in sgovp and their slices in govp/gosq.
        // The EXT-X-MAP can share the first piece's slices but adds is=1 to select only its init bytes.
        String slice = values.getOrDefault("govp", values.get("range"));
        String sequence = values.getOrDefault("gosq", values.get("sq"));
        if (!byteRange && (slice == null || sequence == null)) return null;
        return new OfflineHlsIdentity(id, itag, encoding, slice, sequence, values.get("is"), values.get("file"));
    }

    private static boolean hasRevision(String encoding) {
        for (String field : encoding.split(";")) {
            if (field.startsWith("lmt=")) {
                try {
                    return Long.parseLong(field.substring(4)) > 0;
                } catch (NumberFormatException malformed) {
                    return false;
                }
            }
        }
        return false;
    }
}
