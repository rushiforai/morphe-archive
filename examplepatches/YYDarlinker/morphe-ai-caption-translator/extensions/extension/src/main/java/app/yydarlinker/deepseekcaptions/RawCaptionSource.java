package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.net.Uri;
import java.io.*;
import java.net.*;
import java.util.*;

/** Source transport only. RebuildSource owns all text/timing decisions. */
final class RawCaptionSource {
  private static final int MAX_SOURCE_BYTES = 16 * 1024 * 1024;

  static final class Source {
    final byte[] body;
    final String contentType, sourceUrl;
    final CaptionDocument.Parsed document;

    Source(LoadedTrack t) {
      body = t.body;
      contentType = t.contentType;
      sourceUrl = t.url;
      document = t.document;
    }
  }

  static Source load(Context c, String url) throws Exception {
    return load(c, url, false, true, null);
  }

  static Source load(Context c, String url, boolean publish) throws Exception {
    return load(c, url, publish, true, null);
  }

  static Source load(Context c, String url, boolean publish, boolean translate) throws Exception {
    return load(c, url, publish, translate, null);
  }

  static Source load(
      Context c,
      String url,
      boolean publish,
      boolean translate,
      DeepSeekApiClient.RequestControl control)
      throws Exception {
    String original = CaptionEngine.sourceCaptionUrl(url),
        preferred = translate ? SourceFormatPolicy.json3(original) : original;
    long deadline = System.nanoTime() + java.util.concurrent.TimeUnit.SECONDS.toNanos(12);
    LoadedTrack t;
    try {
      t = loadTrack(c, preferred, "SOURCE", true, remaining(deadline), control);
    } catch (Exception error) {
      if (preferred.equals(original) || !SourceRecoveryPolicy.formatFallback(error)) throw error;
      t = loadTrack(c, original, "SOURCE", true, remaining(deadline), control);
    }
    if (publish)
      publishSharedTimeline(PageCaptionController.videoIdFromUrl(url), t.document.cues());
    return new Source(t);
  }

  static Source reference(Context c, String url, DeepSeekApiClient.RequestControl control)
      throws Exception {
    String video = PageCaptionController.videoIdFromUrl(url), language = query(url, "lang");
    // Only signed native descriptors for this video/language; no synthesized unsigned track URLs.
    for (String candidate : NativeAsrTrackReference.candidates(video, language)) {
      if (!WordTimingReference.sameLanguage(language, query(candidate, "lang"))) continue;
      if (CaptionEngine.sourceCaptionUrl(url).equals(candidate)) continue;
      return new Source(
          loadTrack(c, SourceFormatPolicy.json3(candidate), "ASR_REFERENCE", false, 1500, control));
    }
    return null;
  }

  static boolean publishSharedTimeline(String id, List<CaptionDocument.Cue> cues) {
    return SemanticCaptionTimeline.replace(id, cues);
  }

  static String sourceLanguage(String url, CaptionDocument.Parsed ignored) {
    return query(url, "lang");
  }

  private static String query(String url, String key) {
    try {
      String x = Uri.parse(url).getQueryParameter(key);
      return x == null ? "" : x;
    } catch (Exception e) {
      return "";
    }
  }

  private static LoadedTrack loadTrack(
      Context context,
      String url,
      String diagnosticPrefix,
      boolean cacheAsPrimary,
      int budgetMs,
      DeepSeekApiClient.RequestControl control)
      throws Exception {
    checkActive(control);
    String cacheKey =
        cacheAsPrimary ? SourceCaptionCache.key(url) : SourceCaptionCache.referenceKey(url);
    SourceCaptionCache.Entry cached = SourceCaptionCache.get(context, cacheKey);
    if (cached != null) {
      try {
        LoadedTrack valid = new LoadedTrack(cached.body, cached.contentType, url);
        CaptionDiagnostics.mark(
            context,
            diagnosticPrefix + "_CACHE_HIT",
            (cacheAsPrimary ? "复用原始字幕缓存 " : "复用时间锚缓存 ") + cached.body.length + " bytes");
        return valid;
      } catch (Exception invalid) {
        // Older releases cached 200/HTML and malformed tracks before parsing them.
        SourceCaptionCache.remove(context, cacheKey);
        CaptionDiagnostics.mark(context, "SOURCE_CACHE_REJECTED", "unreadable_cached_track");
      }
    }
    CaptionDiagnostics.mark(
        context, diagnosticPrefix + "_FETCH", cacheAsPrimary ? "正在获取原始字幕" : "正在获取自动生成字幕时间锚");
    Fetch fetched =
        fetch(
            url,
            false,
            System.nanoTime() + java.util.concurrent.TimeUnit.MILLISECONDS.toNanos(budgetMs),
            control);
    LoadedTrack valid = new LoadedTrack(fetched.body, fetched.contentType, url);
    checkActive(control);
    SourceCaptionCache.put(context, cacheKey, fetched.body, fetched.contentType);
    CaptionDiagnostics.mark(
        context,
        diagnosticPrefix + "_OK",
        (cacheAsPrimary ? "原始字幕 " : "时间锚 ") + fetched.body.length + " bytes");
    return valid;
  }

  static void checkActive(DeepSeekApiClient.RequestControl control) throws InterruptedException {
    if (Thread.currentThread().isInterrupted() || (control != null && control.isCancelled()))
      throw new InterruptedException("source_cancelled");
  }

  static int remaining(long deadline) throws java.net.SocketTimeoutException {
    long left = java.util.concurrent.TimeUnit.NANOSECONDS.toMillis(deadline - System.nanoTime());
    if (left <= 0) throw new java.net.SocketTimeoutException("source_deadline");
    return (int) Math.min(Integer.MAX_VALUE, Math.max(1, left));
  }

  private static Fetch fetch(
      String sourceUrl, boolean refreshed, long deadline, DeepSeekApiClient.RequestControl control)
      throws Exception {
    checkActive(control);
    if (!DeepSeekCaptionHook.isYouTubeTimedTextUrl(sourceUrl))
      throw new IllegalArgumentException("invalid_source_url");
    String cookies =
        refreshed ? FreshYouTubeCookies.refresh(deadline, control) : FreshYouTubeCookies.cached();
    checkActive(control);
    remaining(deadline);
    URL url = new URL(sourceUrl);
    HttpURLConnection connection = DeepSeekCaptionHook.openWithYouTubeCronet(url);
    if (connection == null) connection = (HttpURLConnection) url.openConnection();
    boolean refresh = false;
    try (NetworkDeadline guard = new NetworkDeadline(connection, deadline)) {
      if (control != null) control.onConnection(connection);
      checkActive(control);
      connection.setConnectTimeout(Math.min(5_000, remaining(deadline)));
      connection.setReadTimeout(remaining(deadline));
      connection.setInstanceFollowRedirects(true);
      connection.setUseCaches(false);
      connection.setRequestProperty("User-Agent", FreshYouTubeCookies.userAgent());
      connection.setRequestProperty("Accept", "*/*");
      connection.setRequestProperty("Accept-Encoding", "identity");
      connection.setRequestProperty("Referer", "https://www.youtube.com/");
      if (!cookies.isEmpty() && cookies.indexOf('\r') < 0 && cookies.indexOf('\n') < 0)
        connection.setRequestProperty("Cookie", cookies);
      checkActive(control);
      connection.setReadTimeout(remaining(deadline));
      int status = connection.getResponseCode();
      checkActive(control);
      remaining(deadline);
      if ((status == 401 || status == 403) && !refreshed) {
        refresh = true;
      } else if (status < 200 || status >= 300)
        throw SourceRecoveryPolicy.http(status, connection.getHeaderField("Retry-After"));
      else {
        java.io.ByteArrayOutputStream bytes = new java.io.ByteArrayOutputStream();
        connection.setReadTimeout(remaining(deadline));
        try (InputStream input = connection.getInputStream()) {
          byte[] buffer = new byte[8192];
          while (true) {
            checkActive(control);
            connection.setReadTimeout(remaining(deadline));
            int n = input.read(buffer);
            if (n < 0) break;
            if (bytes.size() + n > MAX_SOURCE_BYTES)
              throw new SourceRecoveryPolicy.Failure("source_too_large", false, 0, null);
            bytes.write(buffer, 0, n);
          }
        }
        checkActive(control);
        remaining(deadline);
        if (bytes.size() == 0)
          throw new SourceRecoveryPolicy.Failure("empty_response", true, 0, null);
        String type = connection.getContentType();
        return new Fetch(bytes.toByteArray(), type == null ? "application/octet-stream" : type);
      }
    } finally {
      // Also disconnect failures in headers/open/read, not just a successful response body.
      connection.disconnect();
      if (control != null) control.onConnection(null);
    }
    if (refresh) {
      checkActive(control);
      remaining(deadline);
      return fetch(sourceUrl, true, deadline, control);
    }
    throw new IllegalStateException("source_unavailable");
  }

  private static final class LoadedTrack {
    final byte[] body;
    final String contentType;
    final String url;

    final CaptionDocument.Parsed document;

    LoadedTrack(byte[] body, String contentType, String url) throws Exception {
      this.document = CaptionDocument.parse(body, contentType);
      if (document.cues().isEmpty())
        throw new SourceRecoveryPolicy.Failure("source_empty", false, 0, null);
      this.body = body;
      this.contentType = contentType;
      this.url = url;
    }
  }

  private static final class Fetch {
    final byte[] body;
    final String contentType;

    Fetch(byte[] body, String contentType) {
      this.body = body;
      this.contentType = contentType;
    }
  }
}
