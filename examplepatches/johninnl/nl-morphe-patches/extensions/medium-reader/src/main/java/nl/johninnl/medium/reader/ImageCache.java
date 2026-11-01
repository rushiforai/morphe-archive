package nl.johninnl.medium.reader;

import java.io.*;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import nl.johninnl.medium.vendor.okhttp3.*;
import nl.johninnl.medium.privacy.WebPrivacyRules;

/** Bounded private image bytes. No account jar, authorization, shared app client or HTML. */
final class ImageCache {
    interface Decoder { boolean readable(File file); }
    private static final int MAX_IMAGE = 16 * 1024 * 1024;
    private static final long MAX_CACHE = 192L * 1024 * 1024;
    private final File directory;
    private final Object[] locks = new Object[16];
    private final OkHttpClient client;
    private final Decoder decoder;
    private boolean prepared;
    private long epoch;
    ImageCache(File directory) { this(directory, new OkHttpClient.Builder()); }
    ImageCache(File directory, OkHttpClient.Builder transport) { this(directory, transport, ReaderImageDecoder::readable); }
    ImageCache(File directory, OkHttpClient.Builder transport, Decoder decoder) {
        this.directory = directory;
        this.decoder = decoder;
        for (int i = 0; i < locks.length; i++) locks[i] = new Object();
        transport.interceptors().clear(); transport.networkInterceptors().clear();
        client = transport.cookieJar(CookieJar.NO_COOKIES).authenticator(Authenticator.NONE)
            .proxyAuthenticator(Authenticator.NONE).cache(null).followRedirects(false).followSslRedirects(false)
            .retryOnConnectionFailure(false).connectTimeout(12, TimeUnit.SECONDS).readTimeout(12, TimeUnit.SECONDS)
            .callTimeout(12, TimeUnit.SECONDS).build();
    }
    File get(String id, URI source, Cancellation cancellation) throws IOException, ArticleException {
        if (id == null || !id.matches("mrimg_[a-f0-9]{64}")) throw new IOException("Invalid image key");
        synchronized (locks[(id.hashCode() & 0x7fffffff) % locks.length]) {
            cancellation.check();
            long startedEpoch;
            synchronized (this) { prepare(); startedEpoch = epoch; }
            File target = new File(directory, id);
            if (target.isFile() && target.length() > 0 && target.length() <= MAX_IMAGE) {
                if (imageBytes(target) && decoder.readable(target)) { target.setLastModified(System.currentTimeMillis()); return target; }
                Files.deleteIfExists(target.toPath());
            }
            File pending = File.createTempFile("image-", ".part", directory);
            try {
                fetch(source, pending, cancellation);
                cancellation.check();
                synchronized (this) {
                    if (epoch != startedEpoch) throw new IOException("Image cache was cleared during download");
                    Files.move(pending.toPath(), target.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
                    trim(target);
                }
                return target;
            } finally { Files.deleteIfExists(pending.toPath()); }
        }
    }
    synchronized boolean contains(String id) {
        if (id == null || !id.matches("mrimg_[a-f0-9]{64}")) return false;
        File file = new File(directory, id);
        return file.isFile() && file.length() > 0 && file.length() <= MAX_IMAGE;
    }
    synchronized File cached(String id) { return contains(id) ? new File(directory, id) : null; }
    synchronized void clear() throws IOException {
        epoch++;
        File[] files = directory.listFiles(file -> file.isFile() && file.getName().matches("mrimg_[a-f0-9]{64}|image-[0-9]+\\.part"));
        if (files != null) for (File file : files) Files.deleteIfExists(file.toPath());
    }
    private synchronized void prepare() throws IOException {
        if (prepared) return;
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Image cache unavailable");
        // A previous process can die before its atomic rename. No downloads from
        // this cache instance start until this one-time cleanup has completed.
        File[] partials = directory.listFiles(file -> file.isFile() && file.getName().matches("image-[0-9]+\\.part"));
        if (partials != null) for (File file : partials) Files.deleteIfExists(file.toPath());
        trim(null);
        prepared = true;
    }
    private void fetch(URI source, File output, Cancellation cancellation) throws IOException, ArticleException {
        URI current = source;
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(12);
        for (int redirects = 0; redirects <= 4; redirects++) {
            if (current == null || !"https".equalsIgnoreCase(current.getScheme()) || current.getHost() == null ||
                current.getUserInfo() != null || current.getFragment() != null) throw new IOException("Invalid image source");
            if (WebPrivacyRules.blocked(current.toString())) throw new IOException("Blocked tracking image source");
            cancellation.check();
            long remaining = deadline - System.nanoTime();
            if (remaining <= 0) throw new IOException("Image timeout");
            Call call = client.newCall(new Request.Builder().url(current.toASCIIString()).header("Accept", "image/*")
                .header("User-Agent", "MediumNativeReader/0.1").build());
            call.timeout().timeout(remaining, TimeUnit.NANOSECONDS);
            try (Cancellation.Registration registration = cancellation.onCancel(call::cancel); Response response = call.execute()) {
                int status = response.code();
                if (status == 301 || status == 302 || status == 303 || status == 307 || status == 308) {
                    String location = response.header("Location");
                    if (location == null) throw new IOException("Missing image redirect");
                    try { current = current.resolve(location); } catch (IllegalArgumentException invalid) { throw new IOException("Invalid image redirect", invalid); }
                    continue;
                }
                if (status != 200 || response.body() == null) throw new IOException("Image HTTP " + status);
                String type = response.header("Content-Type", "").toLowerCase(Locale.ROOT).split(";", 2)[0].trim();
                if (!Arrays.asList("image/jpeg", "image/png", "image/webp", "image/gif", "image/avif").contains(type)) throw new IOException("Unsupported image type");
                try (InputStream input = response.body().byteStream(); OutputStream file = new FileOutputStream(output)) {
                    byte[] buffer = new byte[8192]; int count, total = 0;
                    while ((count = input.read(buffer)) != -1) {
                        cancellation.check();
                        if (count > MAX_IMAGE - total || System.nanoTime() >= deadline) throw new IOException("Image size or time limit");
                        file.write(buffer, 0, count); total += count;
                    }
                    if (total == 0) throw new IOException("Empty image");
                }
                if (!imageBytes(output) || !decoder.readable(output)) throw new IOException("Invalid image bytes");
                return;
            }
        }
        throw new IOException("Too many image redirects");
    }
    private static boolean imageBytes(File file) throws IOException {
        byte[] bytes = new byte[32]; int length = 0;
        try (InputStream input = new FileInputStream(file)) {
            int count;
            while (length < bytes.length && (count = input.read(bytes, length, bytes.length - length)) != -1) length += count;
        }
        if (length < 8) return false;
        if ((bytes[0] & 255) == 255 && (bytes[1] & 255) == 216 && (bytes[2] & 255) == 255) return true;
        if (Arrays.equals(Arrays.copyOf(bytes, 8), new byte[] {(byte)137,80,78,71,13,10,26,10})) return true;
        String signature = new String(bytes, 0, length, java.nio.charset.StandardCharsets.ISO_8859_1);
        return signature.startsWith("GIF87a") || signature.startsWith("GIF89a") ||
            (signature.startsWith("RIFF") && signature.length() >= 12 && signature.substring(8, 12).equals("WEBP")) ||
            (signature.substring(4, 8).equals("ftyp") && (signature.contains("avif") || signature.contains("avis")));
    }
    private synchronized void trim(File retained) {
        File[] files = directory.listFiles(file -> file.isFile() && file.getName().startsWith("mrimg_"));
        if (files == null) return;
        Arrays.sort(files, Comparator.comparingLong(File::lastModified));
        long bytes = 0; for (File file : files) bytes += file.length();
        int count = files.length;
        for (File file : files) {
            if (bytes <= MAX_CACHE && count <= 512) break;
            if (file.equals(retained)) continue;
            long length = file.length(); if (file.delete()) { bytes -= length; count--; }
        }
    }
}
