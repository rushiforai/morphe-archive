package io.github.daydreamfix.ext;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/**
 * YouTube refuses video downloads for links handed to the old VR client unless they carry a token
 * the app can't make. The app's signed-in request stays as it is (title, history, recommendations);
 * only the video links in its answer are swapped for ones fetched anonymously as a client that has
 * no such rule. If that fetch fails for any reason the original answer is kept.
 */
public final class PlayerClient {
    private static final int RESPONSE_STREAMING_DATA = 4, REQUEST_VIDEO_ID = 2;
    private static final String UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 15_7_3) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Safari/605.1.15";

    private PlayerClient() {}

    /** Runs when the app reads the answer to a request, before it looks at the bytes. */
    public static void onResponse(Object request, Object response) {
        try {
            if (!String.valueOf(Reflect.call(request, "e")).contains("/v1/player")) return;
            byte[] answer = (byte[]) Reflect.get(response, "b");
            byte[] asked = (byte[]) Reflect.call(request, "g");
            if (answer == null || asked == null) return;
            java.util.Map<?, ?> headers = (java.util.Map<?, ?>) Reflect.call(request, "f");
            Object visitor = headers == null ? null : headers.get("X-Goog-Visitor-Id");
            Reflect.set(response, "b", swapLinks(asked, answer, visitor == null ? null : visitor.toString()));
        } catch (RuntimeException e) {
            android.util.Log.w("DaydreamStream", "links not swapped: " + e.getClass().getSimpleName());
        }
    }

    /** Returns the answer with its video links replaced, or the answer itself if that isn't possible. */
    private static byte[] swapLinks(byte[] request, byte[] response, String visitorId) {
        try {
            String video = videoId(request);
            // Not every answer carries links, some are just refusals: leave those alone.
            if (video == null || field(response, RESPONSE_STREAMING_DATA) == null) return response;
            byte[] links = fetchLinks(video, visitorId);
            return links == null ? response : replaceField(response, RESPONSE_STREAMING_DATA, links);
        } catch (IOException | RuntimeException e) {
            android.util.Log.w("DaydreamStream", "links not swapped: " + e.getClass().getSimpleName());
            return response;
        }
    }

    private static byte[] fetchLinks(String video, String visitorId) throws IOException {
        ByteArrayOutputStream client = new ByteArrayOutputStream(96);
        putString(client, 12, "Apple");
        putString(client, 13, "RealityDevice17,1");
        putVarint(client, 16L << 3);
        putVarint(client, 101);
        putString(client, 17, "1.02");
        putString(client, 18, "visionOS");
        putString(client, 19, "26.5.23O471");
        ByteArrayOutputStream context = new ByteArrayOutputStream(128);
        putBytes(context, 1, client.toByteArray());
        ByteArrayOutputStream body = new ByteArrayOutputStream(128);
        putBytes(body, 1, context.toByteArray());
        putString(body, REQUEST_VIDEO_ID, video);
        HttpURLConnection c = (HttpURLConnection) new URL("https://youtubei.googleapis.com/youtubei/v1/player?alt=proto").openConnection();
        try {
            c.setConnectTimeout(8000);
            c.setReadTimeout(8000);
            c.setDoOutput(true);
            c.setRequestProperty("Content-Type", "application/x-protobuf");
            c.setRequestProperty("User-Agent", UA);
            c.setRequestProperty("X-YouTube-Client-Name", "101");
            c.setRequestProperty("X-YouTube-Client-Version", "1.02");
            if (visitorId != null) c.setRequestProperty("X-Goog-Visitor-Id", visitorId);
            try (OutputStream o = c.getOutputStream()) { body.writeTo(o); }
            if (c.getResponseCode() != 200) {
                android.util.Log.w("DaydreamStream", "links refused: " + c.getResponseCode());
                return null;
            }
            ByteArrayOutputStream all = new ByteArrayOutputStream(65536);
            try (InputStream in = c.getInputStream()) {
                byte[] b = new byte[16384];
                for (int n; (n = in.read(b)) > 0; ) all.write(b, 0, n);
            }
            return field(all.toByteArray(), RESPONSE_STREAMING_DATA);
        } finally {
            c.disconnect();
        }
    }

    private static String videoId(byte[] request) {
        byte[] v = field(request, REQUEST_VIDEO_ID);
        return v == null ? null : new String(v, StandardCharsets.UTF_8);
    }

    /** First length-delimited field with this number, or null. */
    private static byte[] field(byte[] in, int number) {
        int[] p = {0};
        while (p[0] < in.length) {
            long tag = varint(in, p);
            int wire = (int) (tag & 7);
            if ((int) (tag >>> 3) == number && wire == 2) {
                int len = (int) varint(in, p);
                return Arrays.copyOfRange(in, p[0], p[0] + len);
            }
            skip(in, p, wire);
        }
        return null;
    }

    private static byte[] replaceField(byte[] in, int number, byte[] value) {
        ByteArrayOutputStream out = new ByteArrayOutputStream(in.length + value.length);
        int[] p = {0};
        while (p[0] < in.length) {
            int start = p[0];
            long tag = varint(in, p);
            skip(in, p, (int) (tag & 7));
            if ((int) (tag >>> 3) != number) out.write(in, start, p[0] - start);
        }
        putBytes(out, number, value);
        return out.toByteArray();
    }

    private static void putString(ByteArrayOutputStream out, int n, String s) {
        putBytes(out, n, s.getBytes(StandardCharsets.UTF_8));
    }

    private static void putBytes(ByteArrayOutputStream out, int n, byte[] b) {
        putVarint(out, ((long) n << 3) | 2);
        putVarint(out, b.length);
        out.write(b, 0, b.length);
    }

    private static void skip(byte[] in, int[] p, int wire) {
        switch (wire) {
            case 0: varint(in, p); break;
            case 1: p[0] += 8; break;
            case 2: { int len = (int) varint(in, p); p[0] += len; break; }
            case 5: p[0] += 4; break;
            default: throw new IllegalArgumentException("wire " + wire);
        }
        if (p[0] > in.length) throw new IllegalArgumentException("truncated");
    }

    private static long varint(byte[] in, int[] p) {
        long v = 0;
        for (int s = 0; s < 64; s += 7) {
            byte b = in[p[0]++];
            v |= (long) (b & 0x7f) << s;
            if (b >= 0) return v;
        }
        throw new IllegalArgumentException("varint");
    }

    private static void putVarint(ByteArrayOutputStream out, long v) {
        while ((v & ~0x7fL) != 0) { out.write((int) (v & 0x7f) | 0x80); v >>>= 7; }
        out.write((int) v);
    }
}
