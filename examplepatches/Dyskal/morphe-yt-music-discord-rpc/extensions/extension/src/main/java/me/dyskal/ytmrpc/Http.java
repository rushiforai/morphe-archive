package me.dyskal.ytmrpc;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import okhttp3.OkHttpClient;
import okhttp3.Response;

/** Shared transport, bounded UTF-8 reads, and numeric Retry-After parsing. */
final class Http {
    // Derived clients share the connection pool and dispatcher, but keep route-specific timeouts.
    // Never follow redirects with OAuth codes, refresh tokens, or bearer credentials.
    static final OkHttpClient CLIENT = new OkHttpClient.Builder()
            .followRedirects(false).followSslRedirects(false).build();

    private Http() { }
    static String readBody(Response response, String operation) throws IOException {
        if (response.body() == null) throw new DiscordFailure(DiscordFailure.Kind.PROTOCOL, operation + " response was empty");
        try (InputStream input = response.body().byteStream()) {
            return readLimited(input, 65_536);
        }
    }

    static String readLimited(InputStream input, int max) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096]; int count;
        while ((count = input.read(buffer)) != -1) {
            if (count > max - output.size()) throw new DiscordFailure(DiscordFailure.Kind.PROTOCOL, "Response exceeds size limit");
            output.write(buffer, 0, count);
        }
        return output.toString("UTF-8");
    }
    static long retryAfterMillis(String header, long min) {
        try { return Math.max(min, (long) (Double.parseDouble(header) * 1000)); }
        catch (Exception ignored) { return min; }
    }
}
