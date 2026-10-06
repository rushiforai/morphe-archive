package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.net.Uri;
import android.os.SystemClock;
import android.util.Base64;
import java.io.*;
import java.net.*;
import java.util.*;

/** Source transport only. RebuildSource owns all text/timing decisions. */
final class RawCaptionSource {
  private static final int MAX_SOURCE_BYTES = 16 * 1024 * 1024;
  private static final int MAX_REFERENCE_ATTEMPTS = 3;
  private static final int REFERENCE_DEADLINE_MS = 1500;
  private static final int MAX_REFERENCE_CAPTURE_BYTES = 256 * 1024;
  private static final int MAX_REFERENCE_CAPTURE_PARTS = 3;
  private static final java.util.concurrent.atomic.AtomicInteger REFERENCE_CAPTURES = new java.util.concurrent.atomic.AtomicInteger();

  private static long startupClock() {
    return SystemClock.elapsedRealtime();
  }

  private static void startupStage(Context context, String stage, long began, String detail) {
    long now = startupClock();
    CaptionDiagnostics.mark(
        context,
        "SOURCE_STARTUP_STAGE",
        "stage=" + stage + ";elapsed_realtime_ms=" + now + ";duration_ms=" + (now - began)
            + (detail.isEmpty() ? "" : ";" + detail));
  }

  static final class Source {
    final byte[] body;
    final String contentType, sourceUrl;
    final CaptionDocument.Parsed document;
    final String timingProfile;
    final int timingQuality;
    final RebuildSource timingEvidence;

    Source(LoadedTrack t) {
      this(t,"",0,null);
    }
    Source(LoadedTrack t,String profile,int quality,RebuildSource evidence) {
      body = t.body;
      contentType = t.contentType;
      sourceUrl = t.url;
      document = t.document;
      timingProfile=profile;
      timingQuality=quality;
      timingEvidence=evidence;
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
    long loadStarted = startupClock();
    startupStage(c, "load_begin", loadStarted, "");
    String original = CaptionEngine.sourceCaptionUrl(url),
        preferred = translate ? SourceFormatPolicy.json3(original) : original;
    long deadline = System.nanoTime() + java.util.concurrent.TimeUnit.SECONDS.toNanos(12);
    LoadedTrack t;
    try {
      t = loadTrack(c, preferred, "SOURCE", true, remaining(deadline), control);
    } catch (Exception error) {
      if (preferred.equals(original) || !SourceRecoveryPolicy.formatFallback(error)) {
        startupStage(c, "load_failed", loadStarted, "error=" + error.getClass().getSimpleName());
        throw error;
      }
      startupStage(c, "format_retry", loadStarted, "error=" + error.getClass().getSimpleName());
      t = loadTrack(c, original, "SOURCE", true, remaining(deadline), control);
    }
    if (publish)
      publishSharedTimeline(PageCaptionController.videoIdFromUrl(url), t.document.cues());
    startupStage(c, "load_end", loadStarted, "bytes=" + t.body.length);
    return new Source(t);
  }

  static Source reference(Context c, String url, DeepSeekApiClient.RequestControl control)
      throws Exception {
    return reference(c,url,null,control);
  }

  static Source reference(Context c,String url,RebuildSource primary,DeepSeekApiClient.RequestControl control)
      throws Exception {
    String video = PageCaptionController.videoIdFromUrl(url), language = query(url, "lang");
    long deadline=System.nanoTime()+java.util.concurrent.TimeUnit.MILLISECONDS.toNanos(REFERENCE_DEADLINE_MS);
    Source best=null;int bestQuality=0,attempts=0;String bestDetail="";
    // Only signed native descriptors for this video/language; no synthesized unsigned track URLs.
    outer: for (String candidate : NativeAsrTrackReference.candidates(video, language)) {
      if (!WordTimingReference.sameLanguage(language, query(candidate, "lang"))) continue;
      if (CaptionEngine.sourceCaptionUrl(url).equals(candidate)) continue;
      for(SourceFormatPolicy.Profile profile:SourceFormatPolicy.referenceProfiles(candidate)){
        if(attempts++>=MAX_REFERENCE_ATTEMPTS)break outer;
        checkActive(control);int left=remaining(deadline);
        try {
          LoadedTrack track=loadTrack(c,profile.url,"ASR_REFERENCE",false,left,control);
          RebuildSource evidence=RebuildSource.read(track.body,track.document);
          int quality=primary==null?evidence.timingQualityAgainst(null):evidence.timingQualityAgainst(primary);
          int matched=primary==null?0:primary.matchedWordCount(evidence);
          String detail="profile="+profile.name+";quality="+quality+";matched_words="+matched+";"+evidence.timingCapabilities();
          CaptionDiagnostics.mark(c,"ASR_REFERENCE_CANDIDATE",detail);
          if(quality>bestQuality){
            bestQuality=quality;best=new Source(track,profile.name,quality,evidence);bestDetail=detail;
          }
          // A direct word source is the strongest possible evidence; no later coarse candidate can
          // improve it, and the bounded budget must not turn into a serial 1.5s wait.
          if(quality>=3)break outer;
        } catch(Exception failure) {
          CaptionDiagnostics.mark(c,"ASR_REFERENCE_CANDIDATE_FAILED",
              "profile="+profile.name+";reason="+CaptionDiagnostics.errorDetail(failure));
          if(System.nanoTime()>=deadline)break outer;
        }
      }
    }
    if(best==null||bestQuality<=0){
      CaptionDiagnostics.mark(c,"ASR_REFERENCE_UNAVAILABLE",
          "attempts="+Math.min(attempts,MAX_REFERENCE_ATTEMPTS)+";reason=no_usable_timing");
      return null;
    }
    CaptionDiagnostics.mark(c,"ASR_REFERENCE_SELECTED",
        "attempts="+Math.min(attempts,MAX_REFERENCE_ATTEMPTS)+";quality="+bestQuality+";"+bestDetail);
    return best;
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
    long cacheStarted = startupClock();
    startupStage(context, "cache_lookup_begin", cacheStarted, "kind=" + diagnosticPrefix);
    String cacheKey =
        cacheAsPrimary ? SourceCaptionCache.key(url) : SourceCaptionCache.referenceKey(url);
    SourceCaptionCache.Entry cached = SourceCaptionCache.get(context, cacheKey);
    startupStage(context, "cache_lookup_end", cacheStarted,
        "kind=" + diagnosticPrefix + ";hit=" + (cached != null));
    if (cached != null) {
      try {
        long parseStarted = startupClock();
        LoadedTrack valid = new LoadedTrack(cached.body, cached.contentType, url);
        startupStage(context, "parse_end", parseStarted,
            "kind=" + diagnosticPrefix + ";from_cache=true;bytes=" + cached.body.length);
        CaptionDiagnostics.mark(
            context,
            diagnosticPrefix + "_CACHE_HIT",
            (cacheAsPrimary ? "Reused source caption cache: " : "Reused timing reference cache: ")
                + cached.body.length + " bytes");
        sourceEvidence(context,valid,diagnosticPrefix);
        return valid;
      } catch (Exception invalid) {
        // Older releases cached 200/HTML and malformed tracks before parsing them.
        SourceCaptionCache.remove(context, cacheKey);
        CaptionDiagnostics.mark(context, "SOURCE_CACHE_REJECTED", "unreadable_cached_track");
      }
    }
    CaptionDiagnostics.mark(
        context, diagnosticPrefix + "_FETCH",
        cacheAsPrimary ? "Fetching source captions" : "Fetching ASR timing reference");
    long fetchStarted = startupClock();
    startupStage(context, "fetch_begin", fetchStarted, "kind=" + diagnosticPrefix);
    Fetch fetched =
        fetch(
            context,
            url,
            false,
            System.nanoTime() + java.util.concurrent.TimeUnit.MILLISECONDS.toNanos(budgetMs),
            control);
    startupStage(context, "fetch_end", fetchStarted,
        "kind=" + diagnosticPrefix + ";bytes=" + fetched.body.length);
    long parseStarted = startupClock();
    LoadedTrack valid = new LoadedTrack(fetched.body, fetched.contentType, url);
    startupStage(context, "parse_end", parseStarted,
        "kind=" + diagnosticPrefix + ";from_cache=false;bytes=" + fetched.body.length);
    checkActive(control);
    long cacheWriteStarted = startupClock();
    SourceCaptionCache.put(context, cacheKey, fetched.body, fetched.contentType);
    startupStage(context, "cache_write_end", cacheWriteStarted, "kind=" + diagnosticPrefix);
    CaptionDiagnostics.mark(
        context,
        diagnosticPrefix + "_OK",
        (cacheAsPrimary ? "Source captions: " : "ASR timing reference: ")
            + fetched.body.length + " bytes");
    sourceEvidence(context,valid,diagnosticPrefix);
    return valid;
  }

  private static void sourceEvidence(Context context,LoadedTrack track,String kind) {
    String body=new String(track.body,java.nio.charset.StandardCharsets.UTF_8).trim();
    if(body.startsWith("\uFEFF"))body=body.substring(1).trim();
    String code=sourceLanguage(track.url,track.document);
    if(code.length()>48 || !code.matches("[A-Za-z0-9]{1,8}(?:-[A-Za-z0-9]{1,8})*"))code="UNKNOWN";
    String format=body.startsWith("{")?"json3":body.startsWith("WEBVTT")?"vtt":body.startsWith("<")?"xml":"srt";
    try {
      byte[] hash=java.security.MessageDigest.getInstance("SHA-256").digest(track.body);StringBuilder hex=new StringBuilder();
      for(byte value:hash)hex.append(String.format(java.util.Locale.ROOT,"%02x",value&255));
      CaptionDiagnostics.mark(context,"SOURCE_INPUT_EVIDENCE","kind="+kind+";format="+format
          +";track_kind="+(query(track.url,"kind").equals("asr")?"asr":"manual")
          +";source_code="+code+";bytes="+track.body.length+";sha256="+hex);
      try {
        RebuildSource evidence=RebuildSource.read(track.body,track.document);
        CaptionDiagnostics.mark(context,"SOURCE_TIMING_CAPABILITIES",
            "kind="+kind+";"+evidence.timingCapabilities()+";quality="
                +(kind.equals("ASR_REFERENCE")?evidence.timingQualityAgainst(null):0));
      } catch(Throwable ignored) {}
      captureTimingBody(context,track,kind,hex.toString(),format);
    } catch(java.security.NoSuchAlgorithmException impossible){throw new IllegalStateException(impossible);}
  }

  private static void captureTimingBody(Context context,LoadedTrack track,String kind,String sha,String format){
    if(!DeepSeekConfig.displayTextDebugEnabled(context)||!"ASR_REFERENCE".equals(kind))return;
    int slot=REFERENCE_CAPTURES.getAndIncrement();if(slot>=MAX_REFERENCE_CAPTURE_PARTS)return;
    int captured=Math.min(track.body.length,MAX_REFERENCE_CAPTURE_BYTES),chunk=30000;
    int count=(captured+chunk-1)/chunk;
    for(int part=0;part<count;part++){
      int from=part*chunk,to=Math.min(captured,from+chunk);
      String payload=Base64.encodeToString(java.util.Arrays.copyOfRange(track.body,from,to),Base64.NO_WRAP);
      CaptionDiagnosticArchive.append(context,"timing","{\"channel\":\"timing\",\"kind\":\""
          +kind+"\",\"format\":\""+format+"\",\"sha256\":\""+sha
          +"\",\"totalBytes\":"+track.body.length+",\"capturedBytes\":"+captured
          +",\"partIndex\":"+part+",\"partCount\":"+count+",\"offset\":"+from
          +",\"captureTruncated\":"+(captured<track.body.length)+",\"bodyBase64\":\""
          +payload+"\"}");
    }
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
      Context context, String sourceUrl, boolean refreshed, long deadline,
      DeepSeekApiClient.RequestControl control)
      throws Exception {
    checkActive(control);
    if (!DeepSeekCaptionHook.isYouTubeTimedTextUrl(sourceUrl))
      throw new IllegalArgumentException("invalid_source_url");
    long cookieStarted = startupClock();
    String cookies =
        refreshed ? FreshYouTubeCookies.refresh(deadline, control) : FreshYouTubeCookies.cached();
    startupStage(context, "cookies_end", cookieStarted,
        "refreshed=" + refreshed + ";available=" + !cookies.isEmpty());
    checkActive(control);
    remaining(deadline);
    URL url = new URL(sourceUrl);
    long openStarted = startupClock();
    startupStage(context, "connection_open_begin", openStarted, "refreshed=" + refreshed);
    HttpURLConnection connection = DeepSeekCaptionHook.openWithYouTubeCronet(url);
    boolean cronet = connection != null;
    if (connection == null) connection = (HttpURLConnection) url.openConnection();
    startupStage(context, "connection_open_end", openStarted, "cronet=" + cronet);
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
      long headersStarted = startupClock();
      startupStage(context, "response_headers_begin", headersStarted, "refreshed=" + refreshed);
      int status = connection.getResponseCode();
      startupStage(context, "response_headers_end", headersStarted, "status=" + status);
      checkActive(control);
      remaining(deadline);
      if ((status == 401 || status == 403) && !refreshed) {
        refresh = true;
      } else if (status < 200 || status >= 300)
        throw SourceRecoveryPolicy.http(status, connection.getHeaderField("Retry-After"));
      else {
        java.io.ByteArrayOutputStream bytes = new java.io.ByteArrayOutputStream();
        connection.setReadTimeout(remaining(deadline));
        long bodyStarted = startupClock();
        startupStage(context, "response_body_begin", bodyStarted, "");
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
        startupStage(context, "response_body_end", bodyStarted, "bytes=" + bytes.size());
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
      startupStage(context, "auth_retry", startupClock(), "status=401_or_403");
      return fetch(context, sourceUrl, true, deadline, control);
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
