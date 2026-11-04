package app.wordfeudwordfinder.extension.core;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/**
 * Small file store rooted at one directory (in the app: {@code <filesDir>/wfwf/}). Not final so tests can simulate
 * I/O errors.
 */
public class Storage {
    private final File root;

    public Storage(File root) {
        this.root = root;
    }

    /** Returns (and creates) a sub directory. */
    public File dir(String name) {
        File d = resolve(name);
        d.mkdirs();
        return d;
    }

    /** Returns the file content, or null when the file does not exist. */
    public String readText(String rel) throws IOException {
        File f = resolve(rel);
        if (!f.isFile()) return null;
        try (InputStream in = new FileInputStream(f)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    /** Writes to {@code <rel>.tmp} and renames over the target, so readers never see a partial file. */
    public void writeTextAtomic(String rel, String text) throws IOException {
        File target = resolve(rel);
        File parent = target.getParentFile();
        if (parent != null) parent.mkdirs();
        File tmp = new File(target.getPath() + ".tmp");
        try (OutputStream out = new FileOutputStream(tmp)) {
            out.write(text.getBytes(StandardCharsets.UTF_8));
            out.flush();
        }
        if (!tmp.renameTo(target)) {
            target.delete();
            if (!tmp.renameTo(target)) {
                tmp.delete();
                throw new IOException("cannot rename to " + target);
            }
        }
    }

    private File resolve(String rel) {
        if (rel.startsWith("/") || rel.contains("..")) throw new IllegalArgumentException("bad path: " + rel);
        return new File(root, rel);
    }
}
