package software.santodan.extension.nuviomerged;

import java.io.*;
import java.util.*;
import java.util.function.BiFunction;
import java.util.function.Function;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

/** Dictionary and shared sets avoid rebuilding the same episode history for every catalog ID. */
public final class NuvioMembershipCache {
    private static final int MAGIC = 0x4e4d4301;
    private static final String PREFIX = "NMC1:";
    public final Map<String, Set<Object>> history = new LinkedHashMap<>();
    public final Map<String, Set<String>> siblings = new LinkedHashMap<>();
    public long savedAt;
    private NuvioMembershipCache() {}
    public static boolean encoded(String value) { return value.startsWith(PREFIX); }

    public static String encode(Map<String, Set<Object>> history, Map<String, Set<String>> siblings,
            long savedAt, Function<Object, Long> episode, Runnable check) throws IOException {
        Map<String, Integer> ids = new LinkedHashMap<>();
        for (String id : history.keySet()) { check.run(); ids.computeIfAbsent(id, k -> ids.size()); }
        for (Map.Entry<String, Set<String>> entry : siblings.entrySet()) {
            check.run(); ids.computeIfAbsent(entry.getKey(), k -> ids.size());
            for (String id : entry.getValue()) { check.run(); ids.computeIfAbsent(id, k -> ids.size()); }
        }
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new GZIPOutputStream(bytes), 32768))) {
            out.writeInt(MAGIC); out.writeLong(savedAt); out.writeInt(ids.size());
            for (String id : ids.keySet()) { check.run(); out.writeUTF(id); }
            writeMap(out, history, ids, (stream, item) -> stream.writeLong(episode.apply(item)), check);
            writeMap(out, siblings, ids, (stream, item) -> stream.writeInt(ids.get(item)), check);
        }
        byte[] packed = bytes.toByteArray();
        StringBuilder result = new StringBuilder(PREFIX);
        char[] hex = "0123456789abcdef".toCharArray();
        for (int i = 0; i < packed.length; i++) {
            if ((i & 4095) == 0) check.run();
            result.append(hex[(packed[i] & 255) >>> 4]).append(hex[packed[i] & 15]);
        }
        check.run(); return result.toString();
    }

    private interface Writer<T> { void write(DataOutputStream out, T item) throws IOException; }
    private static <T> void writeMap(DataOutputStream out, Map<String, Set<T>> map, Map<String, Integer> ids,
            Writer<T> writer, Runnable check) throws IOException {
        Map<Set<T>, Integer> groups = new LinkedHashMap<>();
        for (Set<T> set : map.values()) { check.run(); groups.computeIfAbsent(set, k -> groups.size()); }
        out.writeInt(groups.size());
        for (Set<T> group : groups.keySet()) {
            check.run(); out.writeInt(group.size());
            for (T item : group) { check.run(); writer.write(out, item); }
        }
        out.writeInt(map.size());
        for (Map.Entry<String, Set<T>> entry : map.entrySet()) {
            check.run(); out.writeInt(ids.get(entry.getKey())); out.writeInt(groups.get(entry.getValue()));
        }
    }

    public static NuvioMembershipCache read(String encoded, BiFunction<Integer, Integer, Object> episode,
            Runnable check) throws IOException {
        if (!encoded(encoded) || ((encoded.length() - PREFIX.length()) & 1) != 0)
            throw new IOException("Invalid membership cache header");
        byte[] bytes = new byte[(encoded.length() - PREFIX.length()) / 2];
        for (int i = 0; i < bytes.length; i++) {
            if ((i & 4095) == 0) check.run();
            int high = Character.digit(encoded.charAt(PREFIX.length() + i * 2), 16);
            int low = Character.digit(encoded.charAt(PREFIX.length() + i * 2 + 1), 16);
            if (high < 0 || low < 0) throw new IOException("Invalid membership cache encoding");
            bytes[i] = (byte) ((high << 4) | low);
        }
        NuvioMembershipCache result = new NuvioMembershipCache();
        // DataInputStream reads primitive fields in small pieces. Buffer decompressed
        // bytes so every integer byte does not require another inflater/JNI call.
        // Keep NMC1 unchanged: existing device caches need no migration or refresh.
        try (DataInputStream in = new DataInputStream(new BufferedInputStream(
                new GZIPInputStream(new ByteArrayInputStream(bytes)), 32768))) {
            if (in.readInt() != MAGIC) throw new IOException("Invalid membership cache version");
            result.savedAt = in.readLong();
            String[] ids = new String[count(in)];
            for (int i = 0; i < ids.length; i++) { check.run(); ids[i] = in.readUTF(); }
            Map<Long, Object> episodes = new HashMap<>();
            readMap(in, result.history, ids, stream -> {
                long value = stream.readLong();
                return episodes.computeIfAbsent(value, k -> episode.apply((int) (k >> 32), (int) (long) k));
            }, check);
            readMap(in, result.siblings, ids, stream -> ids[index(stream, ids.length)], check);
            if (in.read() != -1) throw new IOException("Trailing membership cache data");
        }
        check.run(); return result;
    }

    private interface Reader<T> { T read(DataInputStream in) throws IOException; }
    private static <T> void readMap(DataInputStream in, Map<String, Set<T>> map, String[] ids,
            Reader<T> reader, Runnable check) throws IOException {
        int size = count(in);
        List<Set<T>> groups = new ArrayList<>();
        for (int i = 0; i < size; i++) {
            check.run(); int members = count(in);
            Set<T> group = new LinkedHashSet<>();
            for (int j = 0; j < members; j++) { check.run(); group.add(reader.read(in)); }
            groups.add(Collections.unmodifiableSet(group));
        }
        int entries = count(in);
        for (int i = 0; i < entries; i++) {
            check.run(); String id = ids[index(in, ids.length)];
            if (map.put(id, groups.get(index(in, groups.size()))) != null)
                throw new IOException("Duplicate membership cache ID");
        }
    }
    private static int count(DataInputStream in) throws IOException {
        int value = in.readInt();
        if (value < 0 || value > 4_000_000) throw new IOException("Invalid membership cache count");
        return value;
    }
    private static int index(DataInputStream in, int size) throws IOException {
        int value = in.readInt();
        if (value < 0 || value >= size) throw new IOException("Invalid membership cache reference");
        return value;
    }
}
