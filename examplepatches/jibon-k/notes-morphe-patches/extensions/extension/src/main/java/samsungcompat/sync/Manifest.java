package samsungcompat.sync;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * Everything one device has published. Each device writes only its own manifest
 * ({@code devices/<deviceId>.json}), so the sync tool never has to merge this file.
 */
public final class Manifest {
    public static final int FORMAT = 1;

    public final String deviceId;
    public final String deviceName;
    public final String appVersion;
    public final long updatedAt;
    public final SortedMap<String, NoteRecord> notes;

    public Manifest(String deviceId, String deviceName, String appVersion, long updatedAt,
                    Map<String, NoteRecord> notes) {
        this.deviceId = deviceId;
        this.deviceName = deviceName == null ? "" : deviceName;
        this.appVersion = appVersion == null ? "" : appVersion;
        this.updatedAt = updatedAt;
        this.notes = Collections.unmodifiableSortedMap(new TreeMap<>(notes));
    }

    public static Manifest empty(String deviceId) {
        return new Manifest(deviceId, "", "", 0, new TreeMap<>());
    }

    public NoteRecord get(String uuid) {
        return notes.get(uuid);
    }

    public String toJson() {
        TreeMap<String, Object> root = new TreeMap<>();
        root.put("format", (long) FORMAT);
        root.put("deviceId", deviceId);
        root.put("deviceName", deviceName);
        root.put("appVersion", appVersion);
        root.put("updatedAt", updatedAt);
        TreeMap<String, Object> list = new TreeMap<>();
        for (NoteRecord n : notes.values()) {
            TreeMap<String, Object> o = new TreeMap<>();
            o.put("hash", n.hash);
            o.put("version", new TreeMap<String, Object>(n.version.asMap()));
            o.put("title", n.title);
            o.put("categoryUuid", n.categoryUuid);
            o.put("createdAt", n.createdAt);
            o.put("modifiedAt", n.modifiedAt);
            o.put("favorite", n.favorite);
            o.put("deleted", n.deleted);
            o.put("deletedAt", n.deletedAt);
            list.put(n.uuid, o);
        }
        root.put("notes", list);
        return Json.write(root);
    }

    /** @throws IllegalArgumentException for malformed input or a newer, unknown format. */
    @SuppressWarnings("unchecked")
    public static Manifest fromJson(String text) {
        Object parsed = Json.parse(text);
        if (!(parsed instanceof Map)) throw new IllegalArgumentException("manifest is not an object");
        Map<String, Object> root = (Map<String, Object>) parsed;
        long format = number(root.get("format"));
        if (format < 1 || format > FORMAT) {
            throw new IllegalArgumentException("unsupported manifest format " + format);
        }
        String deviceId = string(root.get("deviceId"));
        if (deviceId.isEmpty()) throw new IllegalArgumentException("manifest has no deviceId");
        TreeMap<String, NoteRecord> notes = new TreeMap<>();
        Object rawNotes = root.get("notes");
        if (rawNotes instanceof Map) {
            for (Map.Entry<String, Object> e : ((Map<String, Object>) rawNotes).entrySet()) {
                if (!(e.getValue() instanceof Map)) continue;
                Map<String, Object> o = (Map<String, Object>) e.getValue();
                TreeMap<String, Long> counters = new TreeMap<>();
                if (o.get("version") instanceof Map) {
                    for (Map.Entry<String, Object> c : ((Map<String, Object>) o.get("version")).entrySet()) {
                        counters.put(c.getKey(), number(c.getValue()));
                    }
                }
                Object hash = o.get("hash");
                notes.put(e.getKey(), new NoteRecord(e.getKey(),
                    hash instanceof String ? (String) hash : null,
                    VersionVector.of(counters), string(o.get("title")),
                    string(o.get("categoryUuid")), number(o.get("createdAt")),
                    number(o.get("modifiedAt")), Boolean.TRUE.equals(o.get("favorite")),
                    Boolean.TRUE.equals(o.get("deleted")), number(o.get("deletedAt"))));
            }
        }
        return new Manifest(deviceId, string(root.get("deviceName")),
            string(root.get("appVersion")), number(root.get("updatedAt")), notes);
    }

    public List<NoteRecord> records() {
        return new ArrayList<>(notes.values());
    }

    private static long number(Object o) {
        return o instanceof Long ? (Long) o : 0;
    }

    private static String string(Object o) {
        return o instanceof String ? (String) o : "";
    }
}
