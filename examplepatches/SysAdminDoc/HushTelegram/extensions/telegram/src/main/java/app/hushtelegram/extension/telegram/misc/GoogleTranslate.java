/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.LongSupplier;
import org.json.JSONArray;
import org.json.JSONException;

/**
 * Google's keyless web translate endpoint, the one the browser extensions use. A short text goes
 * in the address and a long one in a form body, since an address can only be so long. The answer
 * is a JSON array: the translated pieces first, then the language it detected in the third slot.
 *
 * <p>The fetch blocks, so it runs on a worker thread only. Each timeout covers one wait, so a
 * service trickling its answer a byte at a time could hold a worker for good. A whole request
 * also has a deadline on the monotonic clock: past it the connection is closed, which wakes the
 * worker, and a read that returns after it stops there.
 */
final class GoogleTranslate {
    private GoogleTranslate() {}

    static final String ENDPOINT = "https://translate.googleapis.com/translate_a/single";
    /** Past this an address risks being refused, so the text goes in the body instead. */
    static final int MAX_ADDRESS = 1800;
    static final int CONNECT_MS = 6000;
    static final int READ_MS = 8000;
    /** The most a whole request may take. Tests shorten it. */
    static long totalMs = 20_000L;
    /** The monotonic clock deadlines are read on. Tests move it by hand. */
    static LongSupplier nanos = System::nanoTime;
    private static final int MAX_ANSWER = 512 * 1024;

    /** What came back: the translation and the language Google says the text was in. */
    static final class Result {
        final String text;
        final String source;

        Result(String text, String source) {
            this.text = text;
            this.source = source;
        }

        /** Whether the text already reads in [target], so there's nothing to show. */
        boolean sameLanguageAs(String target) {
            return sameLanguageAs(target, false);
        }

        /**
         * [exact] is for a language the person picked (#35): Chinese in the other script, or a
         * language's regional or other-script choice, then still gets translated into it.
         */
        boolean sameLanguageAs(String target, boolean exact) {
            if (source.isEmpty()) return false;
            return exact ? code(source).equals(code(target)) : base(source).equals(base(target));
        }

        private static String base(String tag) {
            String code = code(tag);
            int dash = code.indexOf('-');
            return dash < 0 ? code : code.substring(0, dash);
        }

        /** Lower case, with the old codes Google and Java still give Hebrew, Javanese and Indonesian read as today's. */
        private static String code(String tag) {
            String lower = tag.toLowerCase(Locale.ROOT);
            int dash = lower.indexOf('-');
            String language = dash < 0 ? lower : lower.substring(0, dash);
            String rest = dash < 0 ? "" : lower.substring(dash);
            switch (language) {
                case "iw": return "he" + rest;
                case "jw": return "jv" + rest;
                case "in": return "id" + rest;
                default: return lower;
            }
        }
    }

    static String query(String target) {
        return "client=gtx&sl=auto&tl=" + encode(target) + "&dt=t";
    }

    static String address(String target, String text) {
        return ENDPOINT + "?" + query(target) + "&q=" + encode(text);
    }

    static boolean needsBody(String target, String text) {
        return address(target, text).length() > MAX_ADDRESS;
    }

    static String encode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (java.io.UnsupportedEncodingException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    /** Reads the answer: every translated piece joined, and the detected language. */
    static Result parse(String json) throws JSONException {
        JSONArray root = new JSONArray(json);
        JSONArray pieces = root.getJSONArray(0);
        StringBuilder text = new StringBuilder();
        for (int i = 0; i < pieces.length(); i++) {
            JSONArray piece = pieces.optJSONArray(i);
            if (piece != null && !piece.isNull(0)) text.append(piece.getString(0));
        }
        if (text.length() == 0) throw new JSONException("no translated text");
        String source = root.length() > 2 && !root.isNull(2) ? root.optString(2, "") : "";
        return new Result(text.toString(), source);
    }

    static Result fetch(String target, String text) throws IOException, JSONException {
        long deadline = deadline(totalMs);
        boolean body = needsBody(target, text);
        URL url = new URL(body ? ENDPOINT + "?" + query(target) : address(target, text));
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        ScheduledFuture<?> watchdog = closeAt(connection, deadline);
        try {
            connection.setConnectTimeout(CONNECT_MS);
            connection.setReadTimeout(READ_MS);
            // The text goes to Google's translate and nowhere else.
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("User-Agent", "HushTelegram");
            if (body) {
                connection.setRequestMethod("POST");
                connection.setDoOutput(true);
                connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
                try (OutputStream out = connection.getOutputStream()) {
                    out.write(("q=" + encode(text)).getBytes(StandardCharsets.UTF_8));
                }
            }
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("translate answered " + code);
            return parse(read(connection.getInputStream(), MAX_ANSWER, "translate answer too large", deadline));
        } finally {
            watchdog.cancel(false);
            connection.disconnect();
        }
    }

    /** Closes connections that run past their deadline. One daemon thread, started on first use. */
    private static final class Watchdog {
        static final ScheduledThreadPoolExecutor TIMER = new ScheduledThreadPoolExecutor(1, task -> {
            Thread thread = new Thread(task, "hushtelegram-translate-deadline");
            thread.setDaemon(true);
            return thread;
        });

        static {
            // A request that finishes in time takes its timer with it rather than leaving it queued.
            TIMER.setRemoveOnCancelPolicy(true);
        }
    }

    /** When a request starting now has to be done, [totalMs] from now on {@link #nanos}. */
    static long deadline(long totalMs) {
        return nanos.getAsLong() + TimeUnit.MILLISECONDS.toNanos(totalMs);
    }

    /**
     * Closes [connection] at [deadline], which makes a read or connect blocked on it fail. Cancel
     * what comes back once the request is done. {@link AiTranslate} uses it too.
     */
    static ScheduledFuture<?> closeAt(HttpURLConnection connection, long deadline) {
        return Watchdog.TIMER.schedule(connection::disconnect,
                Math.max(0, deadline - nanos.getAsLong()), TimeUnit.NANOSECONDS);
    }

    /**
     * Reads an answer as UTF-8 and closes the stream. Past {@code limit} bytes it stops with
     * {@code tooLarge}, so a service can't fill the phone's memory. Past [deadline] on
     * {@link #nanos} it stops too, since a trickle keeps every read inside the read timeout.
     * {@link AiTranslate} reads with it too.
     */
    static String read(InputStream in, int limit, String tooLarge, long deadline) throws IOException {
        try (InputStream stream = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int n;
            while ((n = stream.read(buffer)) > 0) {
                out.write(buffer, 0, n);
                if (out.size() > limit) throw new IOException(tooLarge);
                if (nanos.getAsLong() - deadline > 0) throw new InterruptedIOException("the answer took too long");
            }
            return out.toString("UTF-8");
        }
    }
}
