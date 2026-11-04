package app.wordfeudwordfinder.extension.words;

import app.wordfeudwordfinder.extension.core.BuildInfo;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Sends words the Wordfeud server rejected to the report worker (tools/report-worker), which forwards them to the
 * project's repository for review (wordlists/&lt;code&gt;/remove.txt on a wordlist/&lt;code&gt; branch). Only
 * {@code {"ruleset":n,"words":[...],"patch":"x.y.z"}} is sent: no user name, game, cookie or device id. One
 * attempt per report, in the background; failures are ignored. Off when the build has no report address
 * ({@code wordReportUrl} in gradle.properties).
 */
public final class WordReporter {
    /** Sends one JSON body; may throw. */
    public interface Sink {
        void post(String url, String json) throws IOException;
    }

    static final int TIMEOUT_MS = 10_000;

    private final String url;
    private final Sink sink;
    private final Executor executor;

    public WordReporter(String url, Sink sink, Executor executor) {
        this.url = url == null ? "" : url;
        this.sink = sink;
        this.executor = executor;
    }

    /** The reporter of this build: the generated report address, HTTPS POST on a background thread. */
    public static WordReporter fromBuild() {
        return new WordReporter(WordListManifest.REPORT_URL, WordReporter::httpPost, backgroundExecutor());
    }

    public boolean enabled() {
        return url.startsWith("https://");
    }

    /** Reports {@code words} for {@code rulesetId}; returns immediately. Never throws. */
    public void report(int rulesetId, List<String> words) {
        if (!enabled() || words == null || words.isEmpty()) return;
        final String json;
        try {
            json = body(rulesetId, words, BuildInfo.PATCH_VERSION);
        } catch (Exception e) {
            return;
        }
        try {
            executor.execute(() -> {
                try {
                    sink.post(url, json);
                } catch (Throwable ignored) {
                    // best effort: a lost report only means the word is not reviewed
                }
            });
        } catch (RuntimeException ignored) {
            // executor rejected the task
        }
    }

    static String body(int rulesetId, List<String> words, String patch) throws Exception {
        JSONObject o = new JSONObject();
        o.put("ruleset", rulesetId);
        JSONArray a = new JSONArray();
        for (String w : words) a.put(w);
        o.put("words", a);
        o.put("patch", patch);
        return o.toString();
    }

    private static Executor backgroundExecutor() {
        ThreadPoolExecutor ex = new ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS, new LinkedBlockingQueue<>(16), r -> {
            Thread t = new Thread(r, "wfwf-report");
            t.setDaemon(true);
            t.setPriority(Thread.MIN_PRIORITY);
            return t;
        });
        ex.allowCoreThreadTimeOut(true);
        return ex;
    }

    /** HTTPS POST of a JSON body; no redirects, no caches, the response is read and discarded. */
    static void httpPost(String url, String json) throws IOException {
        URL u = new URL(url);
        if (!"https".equals(u.getProtocol())) throw new IOException("not https");
        byte[] payload = json.getBytes(StandardCharsets.UTF_8);
        HttpURLConnection c = (HttpURLConnection) u.openConnection();
        try {
            c.setInstanceFollowRedirects(false);
            c.setConnectTimeout(TIMEOUT_MS);
            c.setReadTimeout(TIMEOUT_MS);
            c.setUseCaches(false);
            c.setRequestMethod("POST");
            c.setDoOutput(true);
            c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            c.setFixedLengthStreamingMode(payload.length);
            try (OutputStream out = c.getOutputStream()) {
                out.write(payload);
            }
            c.getResponseCode();
            try (InputStream in = c.getResponseCode() < 400 ? c.getInputStream() : c.getErrorStream()) {
                if (in != null) {
                    byte[] buf = new byte[256];
                    while (in.read(buf) != -1) {
                        // discard
                    }
                }
            }
        } finally {
            c.disconnect();
        }
    }
}
