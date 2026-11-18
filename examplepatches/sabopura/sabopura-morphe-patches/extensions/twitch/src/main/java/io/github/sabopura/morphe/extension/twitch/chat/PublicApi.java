package io.github.sabopura.morphe.extension.twitch.chat;

import android.os.Handler;
import android.os.Looper;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.*;

/** Separate, anonymous public-data client. Never reuses Twitch cookies, interceptors or tokens. */
public final class PublicApi {
    public static final Handler UI = new Handler(Looper.getMainLooper());
    private static final int MAX_RESPONSE_BYTES = 4 * 1024 * 1024;
    /** Shared by every chat and danmaku download; idle threads exit. */
    private static final ThreadPoolExecutor WORK = pool(4, 128, "ChatPublicData");
    /** Alejo's pronoun service can take tens of seconds to answer; on its own thread it never holds up emotes or badges. */
    private static final ThreadPoolExecutor PRONOUNS = pool(1, 64, "ChatPronouns");

    private PublicApi() {}

    private static ThreadPoolExecutor pool(int threads, int queue, String name) {
        ThreadPoolExecutor pool = new ThreadPoolExecutor(threads, threads, 30, TimeUnit.SECONDS,
                new ArrayBlockingQueue<>(queue), r -> {
                    Thread t = new Thread(r, name);
                    t.setDaemon(true);
                    return t;
                });
        pool.allowCoreThreadTimeOut(true);
        return pool;
    }

    public static boolean submit(Runnable work) {
        return submit(WORK, work);
    }

    static boolean submitPronouns(Runnable work) {
        return submit(PRONOUNS, work);
    }

    private static boolean submit(ThreadPoolExecutor pool, Runnable work) {
        try {
            pool.execute(work);
            return true;
        } catch (RejectedExecutionException e) {
            return false;
        }
    }

    public static String get(String address) throws IOException {
        return new String(request(address, null, "application/json", MAX_RESPONSE_BYTES), StandardCharsets.UTF_8);
    }

    /** Anonymous GET of an https URL; redirects are refused and the body is capped. */
    public static byte[] fetch(String address, String accept, int limit) throws IOException {
        return request(address, null, accept, limit);
    }

    /** Public Twitch metadata only. Client-ID identifies the app and is not a login credential. */
    public static String twitchMetadata(String body) throws IOException {
        return post("https://gql.twitch.tv/gql", body);
    }

    private static String post(String address, String body) throws IOException {
        return new String(request(address, body, "application/json", MAX_RESPONSE_BYTES), StandardCharsets.UTF_8);
    }

    private static byte[] request(String address, String body, String accept, int limit) throws IOException {
        URL url = new URL(address);
        if (!"https".equals(url.getProtocol()) || url.getUserInfo() != null)
            throw new IOException("Invalid public URL");
        HttpURLConnection c = (HttpURLConnection) url.openConnection();
        c.setConnectTimeout(8000);
        c.setReadTimeout(10000);
        c.setInstanceFollowRedirects(false);
        c.setRequestProperty("User-Agent", "SabopuraChat/1.0");
        c.setRequestProperty("Accept", accept);
        try {
            if (body != null) {
                c.setRequestMethod("POST");
                c.setDoOutput(true);
                c.setRequestProperty("Content-Type", "application/json");
                if ("gql.twitch.tv".equals(url.getHost()))
                    c.setRequestProperty("Client-ID", "kd1unb4b3q4t58fwlpcbzcbnm76a8fp");
                byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
                c.setFixedLengthStreamingMode(bytes.length);
                try (java.io.OutputStream out = c.getOutputStream()) {
                    out.write(bytes);
                }
            }
            int status = c.getResponseCode();
            if (status < 200 || status >= 300) throw new IOException("HTTP " + status);
            try (InputStream in = c.getInputStream()) {
                return readLimited(in, limit);
            }
        } finally {
            c.disconnect();
        }
    }

    public static byte[] readLimited(InputStream in, int limit) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] b = new byte[8192];
        int n;
        while ((n = in.read(b)) != -1) {
            if (out.size() + n > limit) throw new IOException("Response exceeds " + limit + " bytes");
            out.write(b, 0, n);
        }
        return out.toByteArray();
    }
}
