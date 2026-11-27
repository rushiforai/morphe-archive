package app.template.extension.shatteredpixeldungeon;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Copying, reading, writing and deleting save files.
 */
final class FileHelpers {

	private static final int CHUNK = 8192;

	private FileHelpers() {
	}

	/**
	 * Copies [source] to [target]: a file, or a folder with everything in it.
	 */
	static void copy(File source, File target) throws IOException {
		if (source.isDirectory()) {
			if (!target.isDirectory() && !target.mkdirs()) throw new IOException("Could not create " + target);
			File[] children = source.listFiles();
			if (children == null) return;
			for (File child : children) copy(child, new File(target, child.getName()));
			return;
		}
		File parent = target.getParentFile();
		if (parent != null && !parent.isDirectory() && !parent.mkdirs()) throw new IOException("Could not create " + parent);
		try (InputStream in = new FileInputStream(source); OutputStream out = new FileOutputStream(target)) {
			pipe(in, out);
		}
	}

	static void delete(File file) {
		if (file == null) return;
		File[] children = file.listFiles();
		if (children != null) {
			for (File child : children) delete(child);
		}
		file.delete();
	}

	static byte[] read(File file) throws IOException {
		try (InputStream in = new FileInputStream(file)) {
			ByteArrayOutputStream out = new ByteArrayOutputStream((int) Math.max(CHUNK, file.length()));
			pipe(in, out);
			return out.toByteArray();
		}
	}

	/**
	 * Writes [data] to [file] through a temporary file that then replaces it, so the file is never left half-written.
	 */
	static void write(File file, byte[] data) throws IOException {
		File temp = new File(file.getPath() + ".tmp");
		try (OutputStream out = new FileOutputStream(temp)) {
			out.write(data);
		}
		if (!temp.renameTo(file)) {
			file.delete();
			if (!temp.renameTo(file)) throw new IOException("Could not replace " + file);
		}
	}

	static void pipe(InputStream in, OutputStream out) throws IOException {
		byte[] chunk = new byte[CHUNK];
		int count;
		while ((count = in.read(chunk)) > 0) out.write(chunk, 0, count);
	}
}
