import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.HexFormat;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Read every packaged ELF's PT_LOAD alignment. ZIP alignment is checked separately by zipalign. */
public final class NativePageCheck {
    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("usage: NativePageCheck <apk> <report.json>");
        List<String> libraries = new ArrayList<>();
        HashSet<String> names = new HashSet<>();
        try (ZipFile apk = new ZipFile(args[0])) {
            var entries = apk.entries();
            while (entries.hasMoreElements()) {
                ZipEntry entry = entries.nextElement();
                if (!names.add(entry.getName())) throw new IOException("duplicate ZIP entry: " + entry.getName());
                if (entry.isDirectory()) continue;
                try (InputStream stream = apk.getInputStream(entry)) {
                    byte[] magic = stream.readNBytes(4);
                    if (magic.length != 4 || magic[0] != 0x7f || magic[1] != 'E' || magic[2] != 'L' || magic[3] != 'F') {
                        // SoLoader also packages metadata with a .so suffix. Content, not the
                        // filename, establishes ELF. A damaged former ELF still fails the delta.
                        continue;
                    }
                    byte[] identity = stream.readNBytes(12);
                    if (identity.length != 12) throw new IOException("truncated ELF identity: " + entry.getName());
                    boolean wide = identity[0] == 2;
                    if ((!wide && identity[0] != 1) || (identity[1] != 1 && identity[1] != 2) || identity[2] != 1)
                        throw new IOException("unsupported ELF format: " + entry.getName());
                    byte[] header = new byte[wide ? 64 : 52];
                    System.arraycopy(magic, 0, header, 0, 4);
                    System.arraycopy(identity, 0, header, 4, 12);
                    byte[] rest = stream.readNBytes(header.length - 16);
                    if (rest.length != header.length - 16) throw new IOException("truncated ELF header: " + entry.getName());
                    System.arraycopy(rest, 0, header, 16, rest.length);
                    ByteBuffer elf = ByteBuffer.wrap(header).order(header[5] == 1 ? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN);
                    long offset = wide ? elf.getLong(32) : Integer.toUnsignedLong(elf.getInt(28));
                    int size = Short.toUnsignedInt(elf.getShort(wide ? 54 : 42));
                    int count = Short.toUnsignedInt(elf.getShort(wide ? 56 : 44));
                    long tableSize = (long) size * count;
                    if (offset < header.length || size < (wide ? 56 : 32) || count == 0 || count == 65535 || tableSize > 1024 * 1024 ||
                            offset > entry.getSize() || tableSize > entry.getSize() - offset)
                        throw new IOException("invalid/unsupported ELF program table: " + entry.getName());
                    stream.skipNBytes(offset - header.length);
                    byte[] table = stream.readNBytes((int) tableSize);
                    if (table.length != tableSize) throw new IOException("truncated ELF program table: " + entry.getName());
                    ByteBuffer programs = ByteBuffer.wrap(table).order(elf.order());
                    List<Long> alignments = new ArrayList<>();
                    boolean aligned = true;
                    for (int index = 0; index < count; index++) {
                        int start = index * size;
                        if (programs.getInt(start) != 1) continue;
                        long alignment = wide ? programs.getLong(start + 48) : Integer.toUnsignedLong(programs.getInt(start + 28));
                        long fileOffset = wide ? programs.getLong(start + 8) : Integer.toUnsignedLong(programs.getInt(start + 4));
                        long virtualAddress = wide ? programs.getLong(start + 16) : Integer.toUnsignedLong(programs.getInt(start + 8));
                        if (alignment <= 0 || (alignment & (alignment - 1)) != 0 || fileOffset < 0 || virtualAddress < 0 ||
                                fileOffset % alignment != virtualAddress % alignment)
                            throw new IOException("invalid ELF load segment: " + entry.getName());
                        alignments.add(alignment);
                        if (alignment < 16384) aligned = false;
                    }
                    if (alignments.isEmpty()) throw new IOException("ELF has no PT_LOAD segments: " + entry.getName());
                    MessageDigest digest = MessageDigest.getInstance("SHA-256");
                    try (InputStream bytes = new DigestInputStream(apk.getInputStream(entry), digest)) {
                        bytes.transferTo(java.io.OutputStream.nullOutputStream());
                    }
                    if (entry.getMethod() != ZipEntry.STORED && entry.getMethod() != ZipEntry.DEFLATED)
                        throw new IOException("unsupported native ZIP compression: " + entry.getName());
                    libraries.add("{\"path\":" + quote(entry.getName()) + ",\"sha256\":\"" + HexFormat.of().formatHex(digest.digest()) +
                            "\",\"compressed\":" + (entry.getMethod() != ZipEntry.STORED) + ",\"loadAlignments\":" + alignments +
                            ",\"elfAligned\":" + aligned + "}");
                }
            }
        }
        Files.writeString(Path.of(args[1]), "{\"libraries\":[" + String.join(",", libraries) + "]}", StandardCharsets.UTF_8);
        System.out.println("[native] inspected " + libraries.size() + " ELF entries");
    }

    private static String quote(String text) {
        StringBuilder result = new StringBuilder("\"");
        for (char c : text.toCharArray()) {
            if (c == '\\' || c == '"') result.append('\\').append(c);
            else if (c < 32) result.append(String.format("\\u%04x", (int) c));
            else result.append(c);
        }
        return result.append('"').toString();
    }
}
