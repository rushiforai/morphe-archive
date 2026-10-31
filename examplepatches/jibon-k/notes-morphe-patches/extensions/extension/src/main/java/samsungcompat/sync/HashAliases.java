package samsungcompat.sync;

import java.util.Map;
import java.util.TreeMap;

/**
 * The app re-saves every imported note, so its hash changes without an edit. This maps the new file
 * hash back to the imported one for as long as the file stays unchanged, so the note isn't republished.
 */
public final class HashAliases {
    private final TreeMap<String, String[]> byUuid = new TreeMap<>();

    /** After importing {@code recordHash} into {@code uuid}, the file hashed to {@code fileHash}. */
    public void remember(String uuid, String fileHash, String recordHash) {
        if (fileHash.equals(recordHash)) byUuid.remove(uuid);
        else byUuid.put(uuid, new String[]{fileHash, recordHash});
    }

    /** The hash to report for {@code uuid}; drops the alias once the file has really changed. */
    public String resolve(String uuid, String fileHash) {
        String[] alias = byUuid.get(uuid);
        if (alias == null) return fileHash;
        if (alias[0].equals(fileHash)) return alias[1];
        byUuid.remove(uuid);
        return fileHash;
    }

    public void forget(String uuid) {
        byUuid.remove(uuid);
    }

    /** One {@code uuid fileHash recordHash} line per alias. */
    public String serialize() {
        StringBuilder out = new StringBuilder();
        for (Map.Entry<String, String[]> e : byUuid.entrySet()) {
            out.append(e.getKey()).append('\t').append(e.getValue()[0]).append('\t')
                .append(e.getValue()[1]).append('\n');
        }
        return out.toString();
    }

    public static HashAliases parse(String text) {
        HashAliases aliases = new HashAliases();
        if (text == null) return aliases;
        for (String line : text.split("\n")) {
            String[] parts = line.split("\t");
            if (parts.length == 3) aliases.byUuid.put(parts[0], new String[]{parts[1], parts[2]});
        }
        return aliases;
    }
}
