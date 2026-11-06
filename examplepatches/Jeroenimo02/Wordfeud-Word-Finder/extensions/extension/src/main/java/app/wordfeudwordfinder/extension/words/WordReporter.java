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
 * Sends word reports to the report worker (tools/report-worker), which forwards them to the project's repository
 * for review on a wordlist/&lt;code&gt; branch: words the Wordfeud server rejected (type "remove", to
 * wordlists/&lt;code&gt;/remove.txt) and words that were played but are missing from our list (type "add", to
 * add.txt). Only {@code {"type":"remove"|"add","ruleset":n,"words":[...],"patch":"x.y.z"}} is sent: no user name,
 * game, cookie or device id. At most {@link #MAX_WORDS} words per request. One
 * attempt per report, in the background; failures are ignored. Off when the build has no report address
 * ({@code wordReportUrl} in gradle.properties).
 */
public final class WordReporter {
    /** Sends one JSON body; may throw. */
    public interface Sink {
        void post(String url, String json) throws IOException;
    }

    static final int TIMEOUT_MS = 10_000;
    /** The worker accepts at most this many words per report. */
    static final int MAX_WORDS = 8;

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

    /** Reports words the server rejected for {@code rulesetId}; returns immediately. Never throws. */
    public void report(int rulesetId, List<String> words) {
        send("remove", rulesetId, words);
    }

    /** Reports played words that are missing from our list for {@code rulesetId}; returns immediately. */
    public void reportAdditions(int rulesetId, List<String> words) {
        send("add", rulesetId, words);
    }

    private void send(String type, int rulesetId, List<String> words) {
        if (!enabled() || words == null || words.isEmpty()) return;
        for (int i = 0; i < words.size(); i += MAX_WORDS) {
            post(type, rulesetId, words.subList(i, Math.min(words.size(), i + MAX_WORDS)));
        }
    }

    private void post(String type, int rulesetId, List<String> words) {
        final String json;
        try {
            json = body(type, rulesetId, words, BuildInfo.PATCH_VERSION);
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

    /**
     * The daily usage ping ({@link UsagePing}): {@code {"type":"ping","patch":"x.y.z","rulesets":[...]}}. Runs
     * {@code onSent} after a successful request and {@code onDone} afterwards in every case. Never throws.
     */
    public void ping(java.util.Collection<Integer> rulesets, Runnable onSent, Runnable onDone) {
        final String json;
        try {
            JSONObject o = new JSONObject();
            o.put("type", "ping");
            o.put("patch", BuildInfo.PATCH_VERSION);
            JSONArray a = new JSONArray();
            for (Integer r : rulesets) a.put(r.intValue());
            o.put("rulesets", a);
            json = o.toString();
        } catch (Exception e) {
            onDone.run();
            return;
        }
        if (!enabled()) {
            onDone.run();
            return;
        }
        try {
            executor.execute(() -> {
                try {
                    sink.post(url, json);
                    onSent.run();
                } catch (Throwable ignored) {
                    // not sent: tried again the next time Wordfeud shows games
                } finally {
                    onDone.run();
                }
            });
        } catch (RuntimeException e) {
            onDone.run();
        }
    }

    static String body(String type, int rulesetId, List<String> words, String patch) throws Exception {
        JSONObject o = new JSONObject();
        o.put("type", type);
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
            int status = c.getResponseCode();
            try (InputStream in = status < 400 ? c.getInputStream() : c.getErrorStream()) {
                if (in != null) {
                    byte[] buf = new byte[256];
                    while (in.read(buf) != -1) {
                        // discard
                    }
                }
            }
            if (status < 200 || status >= 300) throw new IOException("status " + status);
        } finally {
            c.disconnect();
        }
    }
}
