import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

/** Remove old signer alignment declarations before SDK zipalign rebuilds an unsigned archive. */
public final class PrepareNativeZip {
    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("usage: PrepareNativeZip <unsigned.apk> <prepared.apk>");
        var names = new HashSet<String>();
        try (var input = new ZipFile(args[0]);
             var output = new ZipOutputStream(Files.newOutputStream(Path.of(args[1])))) {
            var entries = input.entries();
            while (entries.hasMoreElements()) {
                ZipEntry source = entries.nextElement();
                if (!names.add(source.getName())) throw new IOException("duplicate ZIP entry: " + source.getName());
                var entry = new ZipEntry(source);
                if (entry.getMethod() == ZipEntry.DEFLATED) entry.setCompressedSize(-1);
                // Local-only fields are discarded by rewriting. Remove central-directory copies too.
                if (entry.getMethod() == ZipEntry.STORED && entry.getName().endsWith(".so")) {
                    byte[] extra = entry.getExtra();
                    if (extra != null) {
                        var kept = new ByteArrayOutputStream();
                        for (int p = 0; p < extra.length;) {
                            if (extra.length - p < 4) throw new IOException("truncated ZIP extra field");
                            int id = (extra[p] & 255) | (extra[p + 1] & 255) << 8;
                            int length = (extra[p + 2] & 255) | (extra[p + 3] & 255) << 8;
                            if (length > extra.length - p - 4) throw new IOException("invalid ZIP extra field");
                            if (id != 0xd935) kept.write(extra, p, length + 4);
                            p += length + 4;
                        }
                        entry.setExtra(kept.toByteArray());
                    }
                }
                output.putNextEntry(entry);
                try (var bytes = input.getInputStream(source)) { bytes.transferTo(output); }
                output.closeEntry();
            }
        }
    }
}
