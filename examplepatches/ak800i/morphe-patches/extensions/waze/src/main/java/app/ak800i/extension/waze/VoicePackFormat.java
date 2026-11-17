package app.ak800i.extension.waze;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * The voice pack format. Export writes a zip; import also reads the .tar.gz files that Waze
 * itself shares, whose metadata.json holds the voice name in "set_name".
 *
 * <pre>
 * my-voice.zip
 * ├── voicepack.json      optional metadata
 * ├── TurnLeft.mp3        one file per prompt, named after Waze's prompt id
 * ├── TurnRight.mp3
 * └── ...
 * </pre>
 *
 * Import is lenient: prompt files may sit in any folder of the pack, prompt ids are matched
 * without regard to case, and files that are not Waze prompts or are empty are skipped.
 */
final class VoicePackFormat {
    static final String MANIFEST_NAME = "voicepack.json";
    /** The metadata file in voice packs that Waze itself shares. */
    static final String WAZE_METADATA_NAME = "metadata.json";
    static final String FORMAT_ID = "waze-voicepack";
    static final int FORMAT_VERSION = 1;
    /** Waze limits a voice name to 40 characters. */
    static final int MAX_NAME_LENGTH = 40;

    private static final long MAX_PROMPT_BYTES = 8L * 1024 * 1024;
    private static final int MAX_MANIFEST_BYTES = 256 * 1024;
    private static final int MAX_ENTRIES = 2000;
    private static final Pattern SAFE_ID = Pattern.compile("[A-Za-z0-9_]{1,64}");
    private static final int TAR_BLOCK = 512;

    static final class ImportResult {
        /** The name from the metadata, or null. */
        String name;
        /** Whether the metadata says the pack uses a newer format version than this patch knows. */
        boolean newerFormat;
        final List<String> imported = new ArrayList<>();
        final List<String> skipped = new ArrayList<>();
    }

    private VoicePackFormat() {
    }

    /**
     * Reads a voice pack and writes its prompts to {@code staging} as {@code <promptId>.mp3}.
     *
     * @param promptIds Waze's prompt ids. If empty, any file with a plain id-like name is accepted.
     */
    static ImportResult read(InputStream in, List<String> promptIds, File staging) throws IOException {
        Map<String, String> known = new HashMap<>();
        for (String id : promptIds) known.put(id.toLowerCase(Locale.ROOT), id);

        ImportResult result = new ImportResult();
        String[] wazeName = new String[1];
        int[] entries = new int[1];
        EntryHandler handler = (path, data) -> {
            if (++entries[0] > MAX_ENTRIES) throw new IOException("The pack has too many files");
            if (path.contains("__MACOSX")) return;

            // Only the base name is used, so a pack cannot write outside the staging folder.
            String base = baseName(path);
            if (base.isEmpty() || base.startsWith(".")) return;

            if (base.equalsIgnoreCase(MANIFEST_NAME)) {
                readManifest(readLimited(data, MAX_MANIFEST_BYTES), result);
                return;
            }
            if (base.equalsIgnoreCase(WAZE_METADATA_NAME)) {
                wazeName[0] = readWazeMetadataName(readLimited(data, MAX_MANIFEST_BYTES));
                return;
            }
            String lower = base.toLowerCase(Locale.ROOT);
            if (!lower.endsWith(".mp3")) {
                result.skipped.add(base);
                return;
            }
            String id = resolveId(base.substring(0, base.length() - 4), known);
            if (id == null) {
                result.skipped.add(base);
                return;
            }
            if (result.imported.contains(id)) {
                result.skipped.add(base + " (duplicate)");
                return;
            }
            if (copyLimited(data, new File(staging, id + ".mp3"), MAX_PROMPT_BYTES, base) == 0) {
                result.skipped.add(base + " (empty)");
                return;
            }
            result.imported.add(id);
        };

        BufferedInputStream buffered = new BufferedInputStream(in, 64 * 1024);
        byte[] magic = peek(buffered, 512);
        if (magic.length >= 4 && magic[0] == 'P' && magic[1] == 'K') {
            readZip(buffered, handler);
        } else if (magic.length >= 2 && (magic[0] & 0xff) == 0x1f && (magic[1] & 0xff) == 0x8b) {
            readTar(new BufferedInputStream(new GZIPInputStream(buffered, 64 * 1024), 64 * 1024), handler);
        } else if (isTarHeader(magic)) {
            readTar(buffered, handler);
        } else {
            throw new IOException("Not a .zip or .tar.gz voice pack");
        }
        if (result.name == null) result.name = wazeName[0];
        return result;
    }

    private interface EntryHandler {
        void accept(String path, InputStream data) throws IOException;
    }

    private static byte[] peek(BufferedInputStream in, int count) throws IOException {
        in.mark(count);
        byte[] bytes = new byte[count];
        int total = 0;
        int n;
        while (total < count && (n = in.read(bytes, total, count - total)) != -1) total += n;
        in.reset();
        return total == count ? bytes : java.util.Arrays.copyOf(bytes, total);
    }

    private static void readZip(InputStream in, EntryHandler handler) throws IOException {
        try (ZipInputStream zip = new ZipInputStream(in)) {
            ZipEntry entry;
            while ((entry = zip.getNextEntry()) != null) {
                if (!entry.isDirectory()) handler.accept(entry.getName(), zip);
            }
        }
    }

    /** Reads a ustar, GNU or pax tar stream, as Waze uses for its own shared voices. */
    private static void readTar(InputStream in, EntryHandler handler) throws IOException {
        try (InputStream tar = in) {
            byte[] header = new byte[TAR_BLOCK];
            String longName = null;
            while (readFully(tar, header)) {
                if (isZeroBlock(header)) break;
                if (!isTarHeader(header)) throw new IOException("The tar file is damaged");
                long size = tarSize(header);
                char type = (char) header[156];
                String name = tarName(header);
                if (longName != null) {
                    name = longName;
                    longName = null;
                }
                LimitedInputStream data = new LimitedInputStream(tar, size);
                if (type == 'L') {
                    longName = cString(readLimited(data, MAX_MANIFEST_BYTES), 0, Integer.MAX_VALUE);
                } else if (type == 'x') {
                    longName = paxPath(readLimited(data, MAX_MANIFEST_BYTES));
                } else if (type == '0' || type == '\0' || type == '7') {
                    handler.accept(name, data);
                }
                data.skipRest();
                long padding = (TAR_BLOCK - size % TAR_BLOCK) % TAR_BLOCK;
                skipFully(tar, padding);
            }
        }
    }

    private static boolean isTarHeader(byte[] block) {
        if (block.length < TAR_BLOCK) return false;
        // POSIX ustar and GNU tar both write "ustar" at offset 257.
        if (block[257] == 'u' && block[258] == 's' && block[259] == 't' && block[260] == 'a' && block[261] == 'r') {
            return true;
        }
        // Old V7 tar has no magic; accept it when the header checksum is right.
        long stored;
        try {
            stored = parseOctal(block, 148, 8);
        } catch (IOException e) {
            return false;
        }
        long sum = 0;
        for (int i = 0; i < TAR_BLOCK; i++) sum += (i >= 148 && i < 156) ? ' ' : (block[i] & 0xff);
        return sum == stored && !isZeroBlock(block);
    }

    private static boolean isZeroBlock(byte[] block) {
        for (byte b : block) if (b != 0) return false;
        return true;
    }

    private static String tarName(byte[] header) {
        String name = cString(header, 0, 100);
        String prefix = header[257] == 'u' ? cString(header, 345, 155) : "";
        return prefix.isEmpty() ? name : prefix + "/" + name;
    }

    private static long tarSize(byte[] header) throws IOException {
        if ((header[124] & 0x80) != 0) throw new IOException("A file in the tar is too large");
        return parseOctal(header, 124, 12);
    }

    private static long parseOctal(byte[] bytes, int offset, int length) throws IOException {
        long value = 0;
        boolean digits = false;
        for (int i = offset; i < offset + length; i++) {
            byte b = bytes[i];
            if (b == 0 || (b == ' ' && digits)) break;
            if (b == ' ') continue;
            if (b < '0' || b > '7') throw new IOException("The tar file is damaged");
            value = value * 8 + (b - '0');
            digits = true;
        }
        return value;
    }

    private static String cString(byte[] bytes, int offset, int length) {
        int end = offset;
        int limit = (int) Math.min(bytes.length, (long) offset + length);
        while (end < limit && bytes[end] != 0) end++;
        return new String(bytes, offset, end - offset, StandardCharsets.UTF_8);
    }

    /** The "path" record of a pax extended header, or null. */
    private static String paxPath(byte[] records) {
        String text = new String(records, StandardCharsets.UTF_8);
        for (String line : text.split("\n")) {
            int space = line.indexOf(' ');
            if (space > 0 && line.startsWith("path=", space + 1)) return line.substring(space + 6);
        }
        return null;
    }

    private static boolean readFully(InputStream in, byte[] buffer) throws IOException {
        int total = 0;
        int n;
        while (total < buffer.length && (n = in.read(buffer, total, buffer.length - total)) != -1) total += n;
        if (total == 0) return false;
        if (total < buffer.length) throw new IOException("The tar file is cut off");
        return true;
    }

    private static void skipFully(InputStream in, long count) throws IOException {
        byte[] buffer = new byte[8 * 1024];
        while (count > 0) {
            int n = in.read(buffer, 0, (int) Math.min(buffer.length, count));
            if (n == -1) throw new IOException("The tar file is cut off");
            count -= n;
        }
    }

    /** One tar entry's data; reading stops at the end of the entry. */
    private static final class LimitedInputStream extends InputStream {
        private final InputStream in;
        private long remaining;

        LimitedInputStream(InputStream in, long size) {
            this.in = in;
            this.remaining = size;
        }

        @Override
        public int read() throws IOException {
            byte[] one = new byte[1];
            return read(one, 0, 1) == -1 ? -1 : one[0] & 0xff;
        }

        @Override
        public int read(byte[] b, int off, int len) throws IOException {
            if (remaining <= 0) return -1;
            int n = in.read(b, off, (int) Math.min(len, remaining));
            if (n == -1) throw new IOException("The tar file is cut off");
            remaining -= n;
            return n;
        }

        void skipRest() throws IOException {
            skipFully(in, remaining);
            remaining = 0;
        }

        @Override
        public void close() {
            // The tar stream stays open for the next entry.
        }
    }

    /** Writes the recordings of {@code voices} as a voice pack and returns how many prompts it holds. */
    static int write(OutputStream out, WazeVoices voices, String name, String wazeVersion) throws IOException {
        List<String> ids = voices.recordedPromptIds();
        if (ids.isEmpty()) return 0;
        try (ZipOutputStream zip = new ZipOutputStream(out)) {
            zip.putNextEntry(new ZipEntry(MANIFEST_NAME));
            zip.write(manifest(name, wazeVersion, ids).getBytes(StandardCharsets.UTF_8));
            zip.closeEntry();

            byte[] buffer = new byte[64 * 1024];
            for (String id : ids) {
                zip.putNextEntry(new ZipEntry(id + ".mp3"));
                try (InputStream in = new FileInputStream(voices.recording(id))) {
                    int n;
                    while ((n = in.read(buffer)) > 0) zip.write(buffer, 0, n);
                }
                zip.closeEntry();
            }
        }
        return ids.size();
    }

    static String manifest(String name, String wazeVersion, List<String> ids) {
        try {
            SimpleDateFormat iso = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.ROOT);
            iso.setTimeZone(TimeZone.getTimeZone("UTC"));
            JSONObject app = new JSONObject()
                    .put("package", "com.waze")
                    .put("version", wazeVersion == null ? JSONObject.NULL : wazeVersion);
            return new JSONObject()
                    .put("format", FORMAT_ID)
                    .put("version", FORMAT_VERSION)
                    .put("name", name)
                    .put("createdAt", iso.format(new Date()))
                    .put("app", app)
                    .put("prompts", new JSONArray(ids))
                    .toString(2);
        } catch (JSONException e) {
            throw new IllegalStateException(e);
        }
    }

    static String trimName(String name) {
        if (name == null) return null;
        String trimmed = name.trim();
        if (trimmed.isEmpty()) return null;
        return trimmed.length() > MAX_NAME_LENGTH ? trimmed.substring(0, MAX_NAME_LENGTH).trim() : trimmed;
    }

    /** The voice name from Waze's own metadata.json ({@code set_name}), or null. */
    private static String readWazeMetadataName(byte[] bytes) {
        try {
            return trimName(new JSONObject(new String(bytes, StandardCharsets.UTF_8)).optString("set_name", ""));
        } catch (JSONException e) {
            // Only the name is read from this file, so a broken one is ignored.
            return null;
        }
    }

    private static void readManifest(byte[] bytes, ImportResult result) throws IOException {
        JSONObject json;
        try {
            json = new JSONObject(new String(bytes, StandardCharsets.UTF_8));
        } catch (JSONException e) {
            throw new IOException(MANIFEST_NAME + " is not valid JSON");
        }
        String format = json.optString("format", "");
        if (!format.isEmpty() && !format.equals(FORMAT_ID)) {
            throw new IOException("Not a Waze voice pack (format \"" + format + "\")");
        }
        result.newerFormat = json.optInt("version", FORMAT_VERSION) > FORMAT_VERSION;
        result.name = trimName(json.optString("name", ""));
    }

    private static String resolveId(String id, Map<String, String> known) {
        if (!known.isEmpty()) return known.get(id.toLowerCase(Locale.ROOT));
        // Without Waze's list, accept plain ids but never Waze's own unsaved "_temp" recordings.
        if (!SAFE_ID.matcher(id).matches() || id.toLowerCase(Locale.ROOT).endsWith("_temp")) return null;
        return id;
    }

    private static String baseName(String path) {
        int slash = Math.max(path.lastIndexOf('/'), path.lastIndexOf('\\'));
        return path.substring(slash + 1);
    }

    private static byte[] readLimited(InputStream in, int limit) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[8 * 1024];
        int n;
        while ((n = in.read(buffer)) > 0) {
            if (out.size() + n > limit) throw new IOException(MANIFEST_NAME + " is too large");
            out.write(buffer, 0, n);
        }
        return out.toByteArray();
    }

    /** Copies one prompt and returns its size. An empty prompt is not kept. */
    private static long copyLimited(InputStream in, File to, long limit, String label) throws IOException {
        long total = 0;
        try (OutputStream out = new FileOutputStream(to)) {
            byte[] buffer = new byte[64 * 1024];
            int n;
            while ((n = in.read(buffer)) != -1) {
                total += n;
                if (total > limit) throw new IOException(label + " is larger than 8 MB");
                out.write(buffer, 0, n);
            }
        }
        if (total == 0) to.delete();
        return total;
    }
}
