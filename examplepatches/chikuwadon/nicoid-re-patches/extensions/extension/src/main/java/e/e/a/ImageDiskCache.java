package e.e.a;

import java.io.*;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Comparator;

/** Encoded public thumbnails in app cache; bounded, expiring and atomically replaced. */
final class ImageDiskCache {
    private static final long AGE = 7L * 24 * 60 * 60 * 1000;
    private static final long LIMIT = 32L * 1024 * 1024;
    private final File directory;
    ImageDiskCache(File parent) { directory = new File(parent, "nicoid-thumbnails"); }
    private File file(String url) throws IOException {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(url.getBytes("UTF-8"));
            StringBuilder name = new StringBuilder(); for (byte b : digest) name.append(String.format(java.util.Locale.ROOT, "%02x", b & 255));
            return new File(directory, name + ".img");
        } catch (java.security.NoSuchAlgorithmException error) { throw new IOException(error); }
    }
    synchronized byte[] get(String url) throws IOException {
        File file = file(url); long now = System.currentTimeMillis();
        if (!file.isFile()) return null;
        long age = now - file.lastModified();
        if (age < 0 || age > AGE || file.length() > 8 * 1024 * 1024) { file.delete(); return null; }
        try (InputStream input = new FileInputStream(file); ByteArrayOutputStream body = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192]; for (int n; (n = input.read(buffer)) != -1;) {
                if (body.size() + n > 8 * 1024 * 1024) { file.delete(); return null; }
                body.write(buffer, 0, n);
            }
            return body.toByteArray();
        }
    }
    synchronized void remove(String url) throws IOException { file(url).delete(); }
    synchronized void put(String url, byte[] data) throws IOException {
        if (data.length == 0 || data.length > 8 * 1024 * 1024) return;
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Thumbnail cache unavailable");
        File target = file(url), temporary = File.createTempFile("image-", ".tmp", directory);
        try {
            try (OutputStream out = new FileOutputStream(temporary)) { out.write(data); }
            if (!temporary.renameTo(target)) { target.delete(); if (!temporary.renameTo(target)) throw new IOException("Thumbnail cache write failed"); }
        } finally { temporary.delete(); }
        trim();
    }
    private void trim() {
        File[] files = directory.listFiles((dir, name) -> name.endsWith(".img")); if (files == null) return;
        Arrays.sort(files, Comparator.comparingLong(File::lastModified)); long total = 0;
        for (File file : files) total += file.length();
        long now = System.currentTimeMillis();
        for (File file : files) if (total > LIMIT || now - file.lastModified() > AGE) { long size = file.length(); if (file.delete()) total -= size; }
    }
}
