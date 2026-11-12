package app.spicetify.extension.spotify.localserver;

import java.io.*;
import java.net.*;
import java.util.*;
import java.util.function.BooleanSupplier;
import java.util.regex.*;

final class StrictRangeReader {
    interface Scope { URI resolve(URI base, String href); }
    interface StatusCheck { void check(int status) throws IOException; }
    private static final Pattern CONTENT_RANGE = Pattern.compile("bytes ([0-9]+)-([0-9]+)/([0-9]+)");
    private final Scope scope;
    private final String authorization;
    private final BooleanSupplier active;
    private final StatusCheck statusCheck;
    private final boolean pinVersion;
    private final Map<URI, Validator> validators = new HashMap<>();

    StrictRangeReader(Scope scope, String authorization, BooleanSupplier active, StatusCheck statusCheck, boolean pinVersion) {
        this.scope = scope; this.authorization = authorization; this.active = active;
        this.statusCheck = statusCheck; this.pinVersion = pinVersion;
    }
    private void check(long deadline) throws IOException {
        if (!active.getAsBoolean() || Thread.currentThread().isInterrupted() || System.nanoTime() > deadline)
            throw new IOException("Server access was cancelled.");
    }
    int read(URI target, long length, String etag, long offset, int size, byte[] data) throws IOException {
        long deadline = System.nanoTime() + 15_000_000_000L;
        check(deadline);
        if (offset < 0 || size < 0 || size > data.length) throw new IOException("Invalid read bounds.");
        if (offset >= length || size == 0) return 0;
        int wanted = (int) Math.min(Math.min(size, 256 * 1024), length - offset);
        long end = offset + wanted - 1;
        URI uri;
        try { uri = scope.resolve(target, target.toASCIIString()); }
        catch (IllegalArgumentException ex) { throw new IOException("The track is outside the configured server."); }
        Validator saved = validators.get(target);
        for (int redirect = 0; redirect < 4; redirect++) {
            check(deadline);
            HttpURLConnection connection = (HttpURLConnection) uri.toURL().openConnection();
            try {
                connection.setConnectTimeout(10000); connection.setReadTimeout(10000);
                connection.setInstanceFollowRedirects(false); connection.setUseCaches(false);
                connection.setRequestProperty("User-Agent", "Morphe/1");
                connection.setRequestProperty("Accept-Encoding", "identity");
                connection.setRequestProperty("Range", "bytes=" + offset + "-" + end);
                if (authorization != null) connection.setRequestProperty("Authorization", authorization);
                if (saved != null) connection.setRequestProperty(saved.etag ? "If-Match" : "If-Unmodified-Since", saved.value);
                else if (strongEtag(etag)) connection.setRequestProperty("If-Match", etag);
                int status = connection.getResponseCode();
                check(deadline);
                statusCheck.check(status);
                if (status == 301 || status == 302 || status == 303 || status == 307 || status == 308) {
                    String location = connection.getHeaderField("Location");
                    if (location == null) throw new IOException("The server sent a redirect without a location.");
                    try { uri = scope.resolve(uri, location); }
                    catch (IllegalArgumentException ex) { throw new IOException("The server redirected outside the configured folder."); }
                    continue;
                }
                if (status != 206) throw new IOException("The server must support byte range requests (HTTP 206).");
                Matcher range = CONTENT_RANGE.matcher(String.valueOf(connection.getHeaderField("Content-Range")));
                try {
                    if (!range.matches() || Long.parseLong(range.group(1)) != offset || Long.parseLong(range.group(2)) != end
                            || Long.parseLong(range.group(3)) != length) throw new IOException("The server returned an incorrect byte range.");
                } catch (NumberFormatException ex) { throw new IOException("The server returned an invalid byte range."); }
                String encoding = connection.getHeaderField("Content-Encoding");
                if (encoding != null && !encoding.equalsIgnoreCase("identity")) throw new IOException("Compressed byte ranges are not supported.");
                if (connection.getContentLengthLong() != -1 && connection.getContentLengthLong() != wanted) throw new IOException("The range length does not match.");
                Validator received = pinVersion ? Validator.from(connection) : null;
                if (saved != null && !saved.equals(received)) throw new IOException("The audio file changed. Scan the library again.");
                try (InputStream in = connection.getInputStream()) {
                    int read = 0;
                    while (read < wanted) {
                        check(deadline); int count = in.read(data, read, wanted - read);
                        if (count < 0) throw new EOFException("Truncated audio range.");
                        read += count;
                    }
                    check(deadline);
                    if (received != null) validators.put(target, received);
                    return read;
                }
            } finally { connection.disconnect(); }
        }
        throw new IOException("Too many redirects.");
    }
    private static boolean strongEtag(String value) { return value != null && value.length() >= 2 && value.startsWith("\"") && value.endsWith("\""); }
    private static final class Validator {
        final boolean etag; final String value;
        Validator(boolean etag, String value) { this.etag = etag; this.value = value; }
        static Validator from(HttpURLConnection connection) throws IOException {
            String etag = connection.getHeaderField("ETag");
            if (strongEtag(etag)) return new Validator(true, etag);
            String modified = connection.getHeaderField("Last-Modified");
            if (modified != null && connection.getHeaderFieldDate("Last-Modified", -1) >= 0) return new Validator(false, modified);
            throw new IOException("The server must report an audio file version (ETag or Last-Modified).");
        }
        @Override public boolean equals(Object other) { return other instanceof Validator && etag == ((Validator) other).etag && value.equals(((Validator) other).value); }
        @Override public int hashCode() { return Objects.hash(etag, value); }
    }
}
