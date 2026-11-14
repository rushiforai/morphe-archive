package app.template.extension.trivia;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

final class ImdbTriviaPage {
    static final String TAG = "IMDbTrivia";
    static final int PREVIEW_SIZE = 3;
    private static final long PRELOAD_TIMEOUT_MS = 8_000L;
    private static final long PRELOAD_HOLD_MS = 5_000L;
    private static final long TIMEOUT_MS = 35_000L;

    private static final Executor PARSER = Executors.newSingleThreadExecutor();

    interface Listener {
        default void preview(Result result) {}
        void done(Result result);
    }

    static final class Item {
        final String id;
        final String category;
        final String text;
        final String html;
        final boolean spoiler;

        Item(String category, String text, String html, boolean spoiler) {
            this.category = category;
            this.text = text;
            this.html = html;
            this.spoiler = spoiler;
            String identity = category + "\u0000" + spoiler + "\u0000" + text;
            id = UUID.nameUUIDFromBytes(identity.getBytes(StandardCharsets.UTF_8)).toString();
        }
    }

    static final class Result {
        final String imdbId;
        final String status;
        final long fetchedAt;
        final List<Item> items;

        Result(String imdbId, String status, List<Item> items) {
            this.imdbId = imdbId;
            this.status = status;
            fetchedAt = SystemClock.elapsedRealtime();
            this.items = Collections.unmodifiableList(items);
        }
    }

    static String source(String imdbId) {
        return "https://www.imdb.com/title/" + imdbId + "/trivia/";
    }

    // Snapshot only explicit trivia sections. The page's own button handlers request more
    // entries. Every click is followed by a wait for the relevant group count to increase.
    private static final String SNAPSHOT = """
            (() => {
              const sections = [...document.querySelectorAll('[data-testid^="sub-section-"]')];
              const groups = Object.create(null);
              const targets = [];
              const limit = window.__morpheTriviaPreviewLimit || 0;
              const preview = !limit && window.__morpheTriviaPreview ? undefined : [];
              const previewGroups = [];
              let disabled = false;
              for (const section of sections) {
                const key = section.getAttribute('data-testid').slice('sub-section-'.length);
                const cards = [...section.querySelectorAll('[data-testid="item-id"] .ipc-html-content-inner-div')];
                const populated = cards.filter(card => card.textContent.trim());
                groups[key] = populated.length;
                if (preview && populated.length) previewGroups.push({key, populated});
                const button = section.querySelector('.pagination-container [class*="single-page-see-more-button"] button');
                if (button?.disabled) disabled = true;
                else if (button) targets.push([key, button]);
              }
              const spoiler = document.querySelector('.splr_show button');
              if (spoiler?.disabled) disabled = true;
              else if (spoiler) targets.unshift(['@spoilers', spoiler]);

              const attempts = window.__morpheTriviaAttempts ||= Object.create(null);
              for (const [key, attempt] of Object.entries(attempts)) {
                const grew = key === '@spoilers'
                  ? Object.keys(groups).some(group => group.endsWith('--spoilers'))
                  : (groups[key] || 0) > attempt.count;
                if (grew) delete attempts[key];
              }
              const waiting = window.__morpheTriviaWaiting;
              if (waiting && (!attempts[waiting.key] || Date.now() - waiting.at >= 4000)) {
                window.__morpheTriviaWaiting = null;
              }

              const sum = Object.values(groups).reduce((a, b) => a + b, 0);
              if (limit) previewGroups.sort((a, b) =>
                Number(a.key.endsWith('--spoilers')) - Number(b.key.endsWith('--spoilers')));
              let slots = limit || Infinity;
              for (const {key, populated} of previewGroups) {
                if (!slots) break;
                const cards = populated.slice(0, slots);
                preview.push({key, texts: cards.map(card => ({text: card.innerText.trim(), html: card.innerHTML}))});
                slots -= cards.length;
              }
              if (!limit && preview?.length) window.__morpheTriviaPreview = true;
              const remaining = 24 - (window.__morpheTriviaClicks || 0);
              const clicksByGroup = window.__morpheTriviaClicksByGroup ||= Object.create(null);
              const target = targets.filter(([key]) => (attempts[key]?.countOfClicks || 0) < 2)
                .sort((a, b) => (clicksByGroup[a[0]] || 0) - (clicksByGroup[b[0]] || 0))[0];
              const readyForPagination = !limit && window.__morpheTriviaMayClick !== false;
              if (readyForPagination && target && (sum || target[0] === '@spoilers') && remaining > 0
                  && !window.__morpheTriviaWaiting) {
                const key = target[0];
                clicksByGroup[key] = (clicksByGroup[key] || 0) + 1;
                attempts[key] = {count: groups[key] || 0, countOfClicks: (attempts[key]?.countOfClicks || 0) + 1};
                window.__morpheTriviaWaiting = {key, at: Date.now()};
                window.__morpheTriviaClicks = (window.__morpheTriviaClicks || 0) + 1;
                target[1].click();
              }
              const unresolved = Object.keys(attempts).length > 0;
              const main = document.querySelector('main');
              const empty = !!main && !sum && !spoiler && !unresolved
                && /no trivia|does not have any trivia/i.test(main.innerText);
              const stalled = disabled || unresolved || (targets.length > 0 && !target);
              // A temporarily absent control isn't proof that the source is exhausted.
              const completion = readyForPagination && !target && !window.__morpheTriviaWaiting && (sum || empty)
                ? JSON.stringify({groups, empty, stalled}) : null;
              if (completion !== window.__morpheTriviaCompletion) {
                window.__morpheTriviaCompletion = completion;
                window.__morpheTriviaCompletionSince = Date.now();
              }
              const readyToFinish = completion !== null && Date.now() - window.__morpheTriviaCompletionSince >= 250;
              const nav = typeof performance === 'undefined' ? null : performance.getEntriesByType('navigation')[0];
              return JSON.stringify({responseStartMs: nav?.responseStart, responseEndMs: nav?.responseEnd, groups, entries: sum, empty, preview: preview?.length ? preview : undefined,
                stalled, readyToFinish,
                pagesRequested: window.__morpheTriviaClicks || 0,
                waiting: !!window.__morpheTriviaWaiting, hasMore: !!target});
            })()
            """;


    private static final String EXTRACT = """
            (() => JSON.stringify([...document.querySelectorAll('[data-testid^="sub-section-"]')]
              .map(section => ({
                key: section.getAttribute('data-testid').slice('sub-section-'.length),
                texts: [...section.querySelectorAll('[data-testid="item-id"] .ipc-html-content-inner-div')]
                  .map(card => ({text: card.innerText.trim(), html: card.innerHTML})).filter(card => card.text)
              }))))()
            """;

    private final String imdbId;
    private final String source;
    private final WebView web;
    private final Listener listener;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final long started = SystemClock.elapsedRealtime();
    private boolean preloadOnly;
    private boolean paused;
    private boolean inspecting;
    private final Runnable poll = this::inspect;
    private final Runnable deadline = () -> {
        if (preloadOnly) finish("preload_timeout", Collections.emptyList());
        else collect("timeout");
    };
    private final Runnable expirePreview = () -> finish("preloaded", Collections.emptyList());
    private JSONObject snapshot = new JSONObject();
    private final AtomicInteger resourceDispatches = new AtomicInteger();
    private final AtomicInteger mainFrameDispatches = new AtomicInteger();
    private volatile String mainFrameAcceptLanguage;
    private final long webViewMs;
    private long documentMs = -1;
    private long previewMs = -1;
    private long allowPaginationAt;
    private long jsRoundTripMs;
    private long parseMs;
    private int jsCalls;
    private boolean collecting;
    private boolean closed;

    ImdbTriviaPage(ViewGroup parent, String imdbId, Listener listener, boolean preloadOnly) {
        this.imdbId = imdbId;
        this.source = source(imdbId);
        this.listener = listener;
        this.preloadOnly = preloadOnly;
        web = new WebView(parent.getContext().getApplicationContext());
        web.setVisibility(View.INVISIBLE);
        web.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        parent.addView(web, new ViewGroup.LayoutParams(1, 1));
        webViewMs = SystemClock.elapsedRealtime() - started;
    }

    void start() {
        web.getSettings().setAllowFileAccess(false);
        web.getSettings().setAllowContentAccess(false);
        web.getSettings().setJavaScriptEnabled(true);
        web.getSettings().setBlockNetworkImage(true);
        web.getSettings().setDomStorageEnabled(true);
        web.setWebViewClient(new WebViewClient() {
            @Override public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
                resourceDispatches.incrementAndGet();
                if (request.isForMainFrame()) {
                    mainFrameDispatches.incrementAndGet();
                    mainFrameAcceptLanguage = request.getRequestHeaders().get("Accept-Language");
                }
                return null;
            }

            @Override public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return request.isForMainFrame() && !source.equals(request.getUrl().toString());
            }

            @Override public void onPageCommitVisible(WebView view, String url) {
                if (source.equals(url) && !closed && !collecting && !paused) {
                    documentMs = SystemClock.elapsedRealtime() - started;
                    // Initial HTML can render before IMDb attaches its pagination handlers.
                    allowPaginationAt = started + documentMs + 900;
                    handler.removeCallbacks(poll);
                    handler.post(poll);
                }
            }

            @Override public void onReceivedHttpError(WebView view, WebResourceRequest request,
                                                      WebResourceResponse error) {
                if (request.isForMainFrame()) {
                    finish("http_" + error.getStatusCode(), Collections.emptyList());
                } else if (!collecting && snapshot.optInt("pagesRequested") > 0
                        && "caching.graphql.imdb.com".equals(request.getUrl().getHost())) {
                    collect("pagination_http_" + error.getStatusCode());
                }
            }

            @Override public void onReceivedError(WebView view, WebResourceRequest request,
                                                   WebResourceError error) {
                if (request.isForMainFrame()) {
                    finish("network_" + error.getErrorCode(), Collections.emptyList());
                }
            }

            @Override public boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
                finish("renderer_closed", Collections.emptyList());
                return true;
            }
        });
        handler.postDelayed(deadline, preloadOnly ? PRELOAD_TIMEOUT_MS : TIMEOUT_MS);
        allowPaginationAt = SystemClock.elapsedRealtime() + 1200;
        // IMDb localizes the page from this header; keep its section markup predictable.
        Map<String, String> requestHeaders = new LinkedHashMap<>();
        requestHeaders.put("Accept-Language", "en-US,en;q=0.9");
        web.loadUrl(source, requestHeaders);
        handler.postDelayed(poll, 1200);
    }

    void continueLoading() {
        if (closed || !preloadOnly) return;
        preloadOnly = false;
        paused = false;
        handler.removeCallbacks(expirePreview);
        handler.removeCallbacks(deadline);
        handler.removeCallbacks(poll);
        handler.postDelayed(deadline, TIMEOUT_MS);
        handler.post(poll);
    }

    private void inspect() {
        if (closed || collecting || paused || inspecting) return;
        if (!source.equals(web.getUrl())) {
            handler.postDelayed(poll, 300);
            return;
        }
        long sent = SystemClock.elapsedRealtime();
        boolean limited = preloadOnly;
        inspecting = true;
        web.evaluateJavascript("window.__morpheTriviaMayClick = " + (sent >= allowPaginationAt)
                + "; window.__morpheTriviaPreviewLimit = " + (limited ? PREVIEW_SIZE : 0)
                + "; " + SNAPSHOT, value -> {
            inspecting = false;
            if (closed || collecting) return;
            jsCalls++;
            jsRoundTripMs += SystemClock.elapsedRealtime() - sent;
            try {
                Object decoded = new JSONTokener(value).nextValue();
                if (decoded instanceof String) snapshot = new JSONObject((String) decoded);
            } catch (JSONException error) {
                finish("parse_error", Collections.emptyList());
                return;
            }
            Object initial = snapshot.remove("preview");
            if (initial instanceof JSONArray) {
                if (limited && preloadOnly) {
                    paused = true;
                    handler.removeCallbacks(deadline);
                    handler.postDelayed(expirePreview, PRELOAD_HOLD_MS);
                }
                PARSER.execute(() -> {
                    try {
                        List<Item> items = normalize((JSONArray) initial);
                        handler.post(() -> {
                            if (closed || items.isEmpty()) return;
                            previewMs = SystemClock.elapsedRealtime() - started;
                            listener.preview(new Result(imdbId, "loading", items));
                            if (limited) Log.i(TAG, "preload_preview id=" + imdbId
                                    + " entries=" + items.size() + " elapsedMs=" + previewMs);
                        });
                    } catch (JSONException ignored) {
                        // The final extraction still has a chance to succeed.
                    }
                });
            }
            if (paused) return;
            if (snapshot.optBoolean("readyToFinish")) {
                if (snapshot.optBoolean("empty")) finish("empty", Collections.emptyList());
                else collect(snapshot.optBoolean("stalled") ? "pagination_stalled" : "observed");
                return;
            }
            if (snapshot.optInt("entries") > 0 && !snapshot.optBoolean("waiting")
                    && snapshot.optInt("pagesRequested") >= 24 && snapshot.optBoolean("hasMore")) {
                collect("page_limit");
                return;
            }
            handler.removeCallbacks(poll);
            handler.postDelayed(poll, 300);
        });
    }

    private void collect(String status) {
        if (closed || collecting) return;
        collecting = true;
        if (!source.equals(web.getUrl())) {
            finish(status, Collections.emptyList());
            return;
        }
        handler.removeCallbacksAndMessages(null);
        handler.postDelayed(() -> finish("extract_timeout", Collections.emptyList()), 3000);
        long sent = SystemClock.elapsedRealtime();
        web.evaluateJavascript(EXTRACT, value -> {
            if (closed) return;
            jsCalls++;
            jsRoundTripMs += SystemClock.elapsedRealtime() - sent;
            PARSER.execute(() -> {
                long parseStart = SystemClock.elapsedRealtime();
                try {
                    Object decoded = new JSONTokener(value).nextValue();
                    if (!(decoded instanceof String)) throw new JSONException("Missing trivia payload");
                    List<Item> items = normalize(new JSONArray((String) decoded));
                    handler.post(() -> {
                        parseMs = SystemClock.elapsedRealtime() - parseStart;
                        finish(items.isEmpty() && "observed".equals(status) ? "parse_error" : status, items);
                    });
                } catch (JSONException error) {
                    handler.post(() -> finish("parse_error", Collections.emptyList()));
                }
            });
        });
    }

    static List<Item> normalize(JSONArray sections) throws JSONException {
        Map<String, Item> unique = new LinkedHashMap<>();
        for (int i = 0; i < sections.length(); i++) {
            JSONObject section = sections.getJSONObject(i);
            String key = section.getString("key");
            boolean spoiler = key.endsWith("--spoilers");
            String category = spoiler ? key.substring(0, key.length() - "--spoilers".length()) : key;
            if (category.isEmpty()) category = "uncategorized";
            JSONArray entries = section.getJSONArray("texts");
            for (int j = 0; j < entries.length(); j++) {
                Object entry = entries.get(j);
                JSONObject rich = entry instanceof JSONObject ? (JSONObject) entry : null;
                String text = (rich == null ? entries.getString(j) : rich.getString("text")).trim();
                if (text.isEmpty()) continue;
                Item item = new Item(category, text, rich == null ? "" : rich.optString("html"), spoiler);
                if (!unique.containsKey(item.id)) unique.put(item.id, item);
            }
        }
        return new ArrayList<>(unique.values());
    }

    private void finish(String status, List<Item> items) {
        if (closed) return;
        try {
            snapshot.put("imdbId", imdbId);
            snapshot.put("status", status);
            snapshot.put("method", "public_page_webview");
            snapshot.put("items", items.size());
            snapshot.put("webViewInstances", 1);
            snapshot.put("webViewResourceDispatches", resourceDispatches.get());
            snapshot.put("webViewMainFrameDispatches", mainFrameDispatches.get());
            snapshot.put("mainFrameAcceptLanguage", mainFrameAcceptLanguage);
            snapshot.put("webViewMs", webViewMs);
            snapshot.put("documentCommitMs", documentMs);
            snapshot.put("previewMs", previewMs);
            snapshot.put("jsCalls", jsCalls);
            snapshot.put("jsRoundTripMs", jsRoundTripMs);
            snapshot.put("finalParseMs", parseMs);
            snapshot.put("elapsedMs", SystemClock.elapsedRealtime() - started);
            Log.i(TAG, snapshot.toString());
        } catch (JSONException error) {
            Log.e(TAG, "Could not encode trivia diagnostics", error);
        }
        close();
        listener.done(new Result(imdbId, status, items));
    }

    void moveTo(ViewGroup host) {
        if (closed || web.getParent() == host) return;
        if (web.getParent() instanceof ViewGroup) ((ViewGroup) web.getParent()).removeView(web);
        host.addView(web, new ViewGroup.LayoutParams(1, 1));
    }

    void close() {
        if (closed) return;
        closed = true;
        handler.removeCallbacksAndMessages(null);
        if (web.getParent() instanceof ViewGroup) ((ViewGroup) web.getParent()).removeView(web);
        web.destroy();
    }
}
