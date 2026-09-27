package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import android.media.session.*;
import android.os.*;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.util.*;
import java.util.concurrent.*;

/**
 * Generation-safe orchestration. Every block has one owner and an immutable accepted event plan.
 */
final class RebuildController {
  private static final java.util.concurrent.atomic.AtomicLong IDS =
      new java.util.concurrent.atomic.AtomicLong();
  static final int WAITING = 0, RUNNING = 1, READY = 2, FAILED = 3;
  private static final Handler MAIN = new Handler(Looper.getMainLooper());
  private static final ExecutorService IO =
      Executors.newCachedThreadPool(
          r -> {
            Thread t = new Thread(r, "CaptionRebuildIO");
            t.setDaemon(true);
            return t;
          });
  private static final ExecutorService CACHE =
      Executors.newSingleThreadExecutor(
          r -> {
            Thread t = new Thread(r, "CaptionRebuildCache");
            t.setDaemon(true);
            return t;
          });
  private static final RebuildClock CLOCK = new RebuildClock();
  private static volatile Session active;
  private static volatile String video = "";
  private static WeakReference<Activity> activity = new WeakReference<>(null);
  private static boolean tickPosted;
  private static volatile boolean compact;
  private static long restoreUntil;

  static final class Session {
    final long id = IDS.incrementAndGet();
    final Context context;
    final String owner, identity, target;
    final DeepSeekConfig.Snapshot config;
    final boolean sourceOnly;
    volatile String url;
    volatile boolean visible, cancelled, loading, terminal;
    volatile long sourceRetry, position, providerRetry;
    volatile String status = "";
    int sourceFailures, repairCount;
    volatile int generation;
    volatile long renderRevision;
    String cacheKey = "", lastShown = "";
    String fallbackReason = "";
    long fallbackStart = -1;
    boolean everReady;
    String displayedEvent = "", withheldEvent = "";
    RawCaptionSource.Source raw;
    RebuildSource source;
    List<RebuildPlanner.Block> blocks;
    RebuildProtocol.Plan[] plans, pendingPlans;
    int[] states, attempts;
    long[] retryAt;
    String[] reasons;
    Job[] jobs;
    boolean[] cacheChecked;
    final Set<HttpURLConnection> connections = Collections.synchronizedSet(new HashSet<>());

    Session(
        Context c,
        String u,
        String o,
        String key,
        String target,
        DeepSeekConfig.Snapshot cfg,
        boolean original,
        boolean show) {
      context = c;
      url = u;
      owner = o;
      identity = key;
      this.target = target;
      config = cfg;
      sourceOnly = original;
      visible = show;
    }

    void cancel() {
      synchronized(this){endFallback(this,position,"session_end");}
      cancelled = true;
      generation++;
      synchronized (connections) {
        for (HttpURLConnection c : connections)
          try {
            c.disconnect();
          } catch (Exception ignored) {
          }
        connections.clear();
      }
    }
  }

  static final class Job implements DeepSeekApiClient.RequestControl {
    final long traceId = IDS.incrementAndGet();
    final Session session;
    final int index;
    final boolean priority;
    volatile HttpURLConnection connection;
    volatile boolean cancelled, sent;

    Job(Session s, int i) {
      this(s, i, false);
    }

    Job(Session s, int i, boolean focus) {
      session = s;
      index = i;
      priority = focus;
    }

    public boolean isCancelled() {
      return cancelled || !current(session);
    }

    public void onConnection(HttpURLConnection c) {
      if (connection != null) session.connections.remove(connection);
      connection = c;
      if (c != null) {
        session.connections.add(c);
        if (isCancelled()) c.disconnect();
      }
    }

    public void onRequestBodySent() {
      sent = true;
    }

    void trace(String stage,String detail) {
      CaptionDiagnostics.mark(session.context,stage,"session="+session.id+";request="+traceId+";block="+index+";"+detail);
    }

    public void onQualityEvidence(org.json.JSONObject source, String response, String metadata) {
      if (!DeepSeekConfig.displayTextDebugEnabled(session.context)) return;
      org.json.JSONObject evidence = source;
      try {
        evidence = new org.json.JSONObject(source.toString());
        if (index >= 0 && session.blocks != null) {
          RebuildPlanner.Block block = session.blocks.get(index);
          org.json.JSONArray times = new org.json.JSONArray();
          for (int i = block.from; i <= block.to; i++) {
            RebuildSource.Word w = session.source.words.get(i);
            times.put(
                new org.json.JSONArray()
                    .put(i)
                    .put(w.start)
                    .put(w.end)
                    .put(w.cue)
                    .put(w.precision));
          }
          evidence.put("diagnostic_only_source_times", times);
          evidence.put("diagnostic_only_request_purpose", priority ? "focus" : "prefetch");
        }
      } catch (Exception ignored) {
      }
      CaptionQualityTrace.record(
          session.context,
          session.config.apiKey,
          traceId,
          evidence,
          response,
          metadata + ";session=" + session.id + ";block=" + index);
    }
  }

  static synchronized boolean current(Session s) {
    return s != null && active == s && !s.cancelled && (video.isEmpty() || video.equals(s.owner));
  }

  static boolean visible() {
    Session s = active;
    return current(s) && s.visible;
  }

  static String activeUrl() {
    Session s = active;
    return current(s) ? s.url : "";
  }

  static void activity(Activity a) {
    activity = new WeakReference<>(a);
    CaptionOverlay.setActivity(a);
    tick();
  }

  static synchronized void video(String id) {
    if (id == null || id.trim().isEmpty()) return;
    id = id.trim();
    boolean changed = !id.equals(video);
    video = id;
    if (changed) {
      CLOCK.reset(SystemClock.elapsedRealtime());
      Session s = active;
      if (s != null && !id.equals(s.owner)) stop();
    }
    SemanticCaptionTimeline.onVideoId(id);
  }

  static synchronized void stop() {
    Session s = active;
    active = null;
    if (s != null) s.cancel();
    CaptionOverlay.clear();
    CaptionMusicSuppressor.kick();
  }

  static void player(String type) {
    String t = type == null ? "" : type.toUpperCase(Locale.ROOT);
    boolean small =
        t.contains("MINIM")
            || t.contains("HIDDEN")
            || t.contains("DISMISSED")
            || t.contains("PICTURE_IN_PICTURE");
    if (compact && !small) restoreUntil = SystemClock.elapsedRealtime() + 3000;
    compact = small && !CaptionSurface.isShorts();
    CaptionOverlay.setPlayerType(type);
  }

  static String restore(String url) {
    Session s = active;
    if (!current(s)
        || s.sourceOnly
        || !s.visible
        || !CaptionChoice.translates()
        || (!compact && SystemClock.elapsedRealtime() > restoreUntil)) return url;
    String owner = PageCaptionController.videoIdFromUrl(url);
    return DeepSeekCaptionHook.isYouTubeTimedTextUrl(url)
            && (owner.isEmpty() || owner.equals(s.owner))
        ? TargetLanguage.withCode(url, s.target)
        : url;
  }

  static void observe(String url) {
    /* NativeCaptionBridge owns explicit selection. Network prefetch is not a user command. */
  }

  static void refresh(Context c) {
    Session s = active;
    if (s == null) return;
    boolean show = s.visible, original = s.sourceOnly;
    String url = s.url;
    stop();
    if (DeepSeekConfig.enabled(c)) activate(c, url, original, show);
  }

  static void prewarm(Context c, String url) {
    if (c == null
        || !CaptionChoice.isOn()
        || !CaptionChoice.translates()
        || !DeepSeekConfig.isReady(c)) return;
    if (active != null) return;
    String target = DeepSeekConfig.defaultTargetLanguage(c);
    if (!target.isEmpty()) activate(c, TargetLanguage.withCode(url, target), false, false);
  }

  static void activate(Context c, String url, boolean original, boolean show) {
    if (c == null || !DeepSeekCaptionHook.isYouTubeTimedTextUrl(url)) return;
    DeepSeekConfig.Snapshot cfg = DeepSeekConfig.load(c);
    if (!cfg.enabled) return;
    String owner = PageCaptionController.videoIdFromUrl(url);
    if (owner.isEmpty()) owner = video;
    if (owner.isEmpty() || !video.isEmpty() && !owner.equals(video)) return;
    TargetLanguage language =
        original ? TargetLanguage.fromCode(CaptionChoice.language()) : TargetLanguage.fromUrl(url);
    String target = language == null ? (original ? "source" : "") : language.code;
    if (target.isEmpty()) return;
    String key =
        RebuildCache.hash(
            CaptionEngine.sourceCaptionUrl(url)
                    .replaceAll("([?&])(?:expire|signature|sig)=[^&]*", "$1")
                + "|"
                + cfg.fingerprint()
                + "|"
                + RebuildCache.hash(cfg.apiKey)
                + "|"
                + target
                + "|"
                + original);
    Session s;
    synchronized (RebuildController.class) {
      if (!video.isEmpty() && !video.equals(owner)) return;
      Session prev = active;
      // Track identity uses cache identity, not an expiring signature.
      try {
        key =
            SourceCaptionCache.key(CaptionEngine.sourceCaptionUrl(url))
                + "|"
                + cfg.fingerprint()
                + "|"
                + RebuildCache.hash(cfg.apiKey)
                + "|"
                + target
                + "|"
                + original;
      } catch (Exception ignored) {
      }
      if (current(prev) && prev.identity.equals(key)) {
        prev.url = url;
        prev.visible |= show;
        if (prev.source == null && prev.sourceFailures > 0) {
          prev.terminal = false;
          prev.sourceRetry = 0;
        }
        s = prev;
      } else {
        if (prev != null) prev.cancel();
        s = new Session(c.getApplicationContext(), url, owner, key, target, cfg, original, show);
        active = s;
        CaptionOverlay.clear();
      }
    }
    s.position = position();
    if (!original && !cfg.ready()) {
      s.terminal = true;
      s.status = CaptionStrings.get(c, "configure_api");
    }
    CaptionDiagnostics.mark(
        c,
        "CAPTION_REBUILD_R2",
        "engine="+RebuildProtocol.VERSION+";session="+s.id+";video="+s.owner+";"+(original ? "source_passthrough" : "single_pass_events;source_owned_time;no_legacy_core"));
    kick(s);
    scheduleTick();
  }

  static void time(long ms) {
    long now = SystemClock.elapsedRealtime();
    boolean seek = CLOCK.update(ms, now);
    Session s = active;
    if (!current(s)) return;
    synchronized (s) {
      if(seek){endFallback(s,s.position,"seek"); CaptionDiagnostics.mark(s.context,"REBUILD_SEEK","session="+s.id+";from="+s.position+";to="+ms); }
      s.position = CLOCK.presentation(now);
      if (seek) {
        s.generation++;
        s.lastShown = "";
        s.displayedEvent=""; s.withheldEvent="";
        if (s.jobs != null)
          for (Job j : s.jobs)
            if (j != null && !j.sent && s.blocks != null && !covers(s.blocks.get(j.index), ms)) {
              j.cancelled = true;
              if (j.connection != null) j.connection.disconnect();
            }
      }
    }
    if (seek) CaptionOverlay.hide();
    kick(s);
    scheduleTick();
  }

  private static long position() {
    long now = SystemClock.elapsedRealtime();
    Activity a = activity.get();
    try {
      MediaController c = a == null ? null : a.getMediaController();
      PlaybackState state =
          c == null || !a.getPackageName().equals(c.getPackageName()) ? null : c.getPlaybackState();
      if (state != null)
        return CLOCK.position(
            now,
            state.getPosition(),
            state.getLastPositionUpdateTime(),
            state.getPlaybackSpeed(),
            state.getState());
    } catch (Exception ignored) {
    }
    return CLOCK.position(now, -1, 0, 0, 0);
  }

  private static boolean paused() {
    try {
      Activity a = activity.get();
      MediaController c = a == null ? null : a.getMediaController();
      PlaybackState s = c == null ? null : c.getPlaybackState();
      return s != null && s.getState() == PlaybackState.STATE_PAUSED;
    } catch (Exception e) {
      return false;
    }
  }

  private static void scheduleTick() {
    synchronized (RebuildController.class) {
      if (tickPosted || active == null) return;
      tickPosted = true;
    }
    MAIN.postDelayed(RebuildController::tick, 80);
  }

  private static void tick() {
    synchronized (RebuildController.class) {
      tickPosted = false;
    }
    Session s = active;
    if (!current(s)) return;
    // Surface detection must also run while a former miniplayer has hidden the overlay.
    CaptionOverlay.refreshSurface();
    synchronized (s) {
      s.position = position();
    }
    kick(s);
    scheduleTick();
  }

  private static void kick(Session s) {
    if (!current(s)) return;
    boolean load = false;
    synchronized (s) {
      if (s.source == null
          && !s.loading
          && !s.terminal
          && SystemClock.elapsedRealtime() >= s.sourceRetry) {
        s.loading = true;
        load = true;
      }
    }
    if (load) IO.submit(() -> load(s));
    if (s.blocks != null && !s.terminal && !s.sourceOnly && s.visible) schedule(s);
    render(s);
  }

  private static void load(Session s) {
    Job control = new Job(s, -1, false);
    try {
      RawCaptionSource.Source raw =
          RawCaptionSource.load(s.context, s.url, false, !s.sourceOnly, control);
      if (!current(s)) return;
      long phase=SystemClock.elapsedRealtime();
      RebuildSource source = RebuildSource.read(raw.body, raw.document);
      CaptionDiagnostics.mark(s.context,"REBUILD_SOURCE_PHASE","phase=rebuild;ms="+(SystemClock.elapsedRealtime()-phase));
      phase=SystemClock.elapsedRealtime();
      if (!s.sourceOnly) {
        int precise = 0;
        for (RebuildSource.Word w : source.words)
          if (w.precision != RebuildSource.Precision.ESTIMATED) precise++;
        if (precise * 10 < source.words.size() * 8)
          try {
            RawCaptionSource.Source ref = RawCaptionSource.reference(s.context, s.url, control);
            if (ref != null) source = source.align(RebuildSource.read(ref.body, ref.document));
          } catch (Exception ignored) {
            RawCaptionSource.checkActive(control);
          }
      }
      CaptionDiagnostics.mark(s.context,"REBUILD_SOURCE_PHASE","phase=reference;ms="+(SystemClock.elapsedRealtime()-phase));
      phase=SystemClock.elapsedRealtime();
      List<RebuildPlanner.Block> blocks = RebuildPlanner.plan(source);
      CaptionDiagnostics.mark(s.context,"REBUILD_SOURCE_PHASE","phase=planner;ms="+(SystemClock.elapsedRealtime()-phase));
      phase=SystemClock.elapsedRealtime();
      String key = RebuildCache.identity(source, s.config, s.target);
      RebuildProtocol.Plan[] plans = new RebuildProtocol.Plan[blocks.size()];
      int[] states = new int[blocks.size()];
      int restored = 0;
      boolean[] checked=new boolean[blocks.size()];
      long focus=position();int focusIndex=0;
      for(RebuildPlanner.Block b:blocks)if(b.start<=focus)focusIndex=b.index;
      for (RebuildPlanner.Block b : blocks) {
        if(b.index!=focusIndex && b.index!=focusIndex+1)continue;
        checked[b.index]=true;
        if (!current(s)) return;
        plans[b.index] = s.sourceOnly ? null : RebuildCache.read(s.context, key, source, b);
        if (plans[b.index] != null) {
          states[b.index] = READY;
          restored++;
        }
      }
      CaptionDiagnostics.mark(s.context,"REBUILD_SOURCE_PHASE","phase=cache;ms="+(SystemClock.elapsedRealtime()-phase));
      synchronized (s) {
        if (!current(s)) return;
        s.raw = raw;
        s.source = source;
        s.cacheKey = key;
        s.plans = plans;
        s.pendingPlans = new RebuildProtocol.Plan[plans.length];
        s.states = states;
        s.attempts = new int[blocks.size()];
        s.retryAt = new long[blocks.size()];
        s.reasons = new String[blocks.size()];
        Arrays.fill(s.reasons, "");
        s.jobs = new Job[blocks.size()];
        s.cacheChecked=checked;
        s.loading = false;
        s.status = "";
        s.everReady = restored > 0;
        s.blocks = blocks;
      }
      int precise = 0;
      for (RebuildSource.Word w : source.words)
        if (w.precision != RebuildSource.Precision.ESTIMATED) precise++;
      CaptionDiagnostics.mark(
          s.context,
          "REBUILD_SOURCE_READY",
          "words="
              + source.words.size()
              + ";measured_or_aligned="
              + precise
              + ";estimated="
              + (source.words.size() - precise)
              + ";coarse_reconstructed="
              + source.coarseCueReconstructed
              + ";coarse_cues="
              + source.coarseCueCount
              + ";blocks="
              + blocks.size()
              + ";cache_hits="
              + restored);
      TokenCostAudit.recordUnitCacheOutcome(Math.min(2,blocks.size()-focusIndex), restored, false);
      RawCaptionSource.publishSharedTimeline(s.owner, raw.document.cues());
      kick(s);
    } catch (Exception e) {
      if (!current(s)) return;
      SourceRecoveryPolicy.Failure f = SourceRecoveryPolicy.classify(e);
      synchronized (s) {
        s.loading = false;
        s.sourceFailures++;
        s.terminal = !f.retryable;
        s.sourceRetry =
            SystemClock.elapsedRealtime()
                + SourceRecoveryPolicy.delay(s.sourceFailures, f.retryAfterMs);
        s.status =
            CaptionStrings.get(s.context, s.terminal ? "source_unavailable" : "source_retry");
      }
      CaptionDiagnostics.mark(
          s.context, "REBUILD_SOURCE_ERROR", f.category + ";attempt=" + s.sourceFailures);
      render(s);
    }
  }

  private static int blockAt(Session s, long time) {
    if (s.blocks == null) return -1;
    int lo = 0, hi = s.blocks.size() - 1;
    while (lo <= hi) {
      int m = (lo + hi) >>> 1;
      if (s.blocks.get(m).start <= time) lo = m + 1;
      else hi = m - 1;
    }
    return hi;
  }

  private static boolean covers(RebuildPlanner.Block b, long time) {
    return time >= b.start && time < b.end;
  }

  private static void schedule(Session s) {
    List<Job> start = new ArrayList<>();
    long now = SystemClock.elapsedRealtime();
    synchronized (s) {
      if (!current(s) || s.blocks == null || now < s.providerRetry) return;
      int index = blockAt(s, s.position);
      if (index < 0) index = 0;
      else if (!covers(s.blocks.get(index), s.position) && index + 1 < s.blocks.size()) index++;
      int running = 0;
      for (int st : s.states) if (st == RUNNING) running++;
      int backgroundRunning = 0;
      for (Job j : s.jobs)
        if (j != null && s.states[j.index] == RUNNING && !covers(s.blocks.get(j.index), s.position))
          backgroundRunning++;
      boolean allowAhead =
          (s.plans[index] != null
              || s.states[index] == FAILED
              || (s.jobs[index] != null && s.jobs[index].sent))
              && backgroundRunning == 0
              && !paused()
              && CLOCK.fresh(now);
      for (int i = index; i < s.blocks.size() && running < 2; i++) {
        RebuildPlanner.Block b = s.blocks.get(i);
        if (b.start > s.position + 30000) break;
        if (i > index && !allowAhead) break;
        if (s.states[i] != WAITING || s.retryAt[i] > now) continue;
        int maxAttempts =
            s.attempts[i] == 2
                    && s.plans[i] == null
                    && RebuildReview.structuralRetry(s.reasons[i])
                    && s.repairCount < RebuildReview.MAX_SESSION_REPAIRS
                ? 3
                : 2;
        if (s.attempts[i] >= maxAttempts) {
          s.states[i] = s.plans[i] == null ? FAILED : READY;
          continue;
        }
        if (s.attempts[i] > 0) {
          if (s.repairCount >= RebuildReview.MAX_SESSION_REPAIRS) {
            s.states[i] = s.plans[i] == null ? FAILED : READY;
            continue;
          }
          s.repairCount++;
        }
        s.attempts[i]++;
        s.states[i] = RUNNING;
        boolean focus = i == index;
        Job job = new Job(s, i, focus);
        s.jobs[i] = job;
        start.add(job);
        running++;
        if (i > index || !s.everReady) break;
      }
    }
    for (Job j : start) {
      RebuildPlanner.Block b = s.blocks.get(j.index);
      CaptionDiagnostics.mark(
          s.context,
          "REBUILD_REQUEST",
          "session="
              + s.id
              + ";request=" + j.traceId
              + ";block="
              + b.id()
              + ";purpose="
              + (j.priority ? "focus" : "prefetch")
              + ";position="
              + s.position
              + ";range="
              + b.start
              + "-"
              + b.end);
      IO.submit(() -> translate(j));
    }
  }

  private static void translate(Job job) {
    Session s = job.session;
    RebuildPlanner.Block b = s.blocks.get(job.index);
    RebuildProtocol.Plan accepted = null;
    try {
      boolean restoredFromCache=false;
      if(s.cacheChecked!=null && !s.cacheChecked[job.index]) {
        s.cacheChecked[job.index]=true;
        accepted=RebuildCache.read(s.context,s.cacheKey,s.source,b);
        restoredFromCache=accepted!=null;
        TokenCostAudit.recordUnitCacheOutcome(1,restoredFromCache?1:0,false);
        if(restoredFromCache)CaptionDiagnostics.mark(s.context,"REBUILD_CACHE_RESTORED","session="+s.id+";block="+b.index+";network_calls=0");
      }
      if(accepted==null) accepted =
          RebuildApi.translate(
              s.source, b, s.config, s.target, job, job.priority, s.reasons[job.index]);
      synchronized (s) {
        if (!current(s) || job.cancelled) return;
        if(restoredFromCache)s.attempts[job.index]=Math.max(0,s.attempts[job.index]-1);
        CaptionOverlay.LayoutBudget currentLayout=CaptionOverlay.budget();
        java.util.function.Predicate<String> currentFits=currentLayout==null?null:currentLayout::fits;
        RebuildProtocol.Plan candidate=accepted;
        accepted = RebuildReview.prefer(s.plans[job.index],candidate,currentFits,s.position);
        RebuildProtocol.Plan old=s.plans[job.index];
        if(old!=null && accepted==old && candidate!=old && RebuildReview.score(old.issues)>0)
          CaptionDiagnostics.mark(s.context,"REBUILD_REPAIR_NO_PROGRESS",
              "session="+s.id+";request="+job.traceId+";block="+b.index+";old_risks="+RebuildReview.score(old.issues)+";candidate_risks="+RebuildReview.score(candidate.issues));
        RebuildProtocol.Event onScreen=old==null?null:old.at(s.position);
        String onScreenId=onScreen==null?"":job.index+":"+onScreen.from+"-"+onScreen.to;
        if(old!=null && accepted!=old && onScreen!=null && onScreenId.equals(s.displayedEvent) && !RebuildReview.blocked(old,onScreen,currentFits))
          s.pendingPlans[job.index]=accepted;
        else s.plans[job.index] = accepted;
        boolean review=RebuildReview.shouldRepair(accepted,s.attempts[job.index],s.repairCount,s.position,b.end,currentFits);
        s.states[job.index] = review ? WAITING : READY;
        if(review) {
          s.reasons[job.index]=RebuildReview.repair(accepted,s.position);
          s.retryAt[job.index]=SystemClock.elapsedRealtime()+1200;
        }
        s.jobs[job.index] = null;
        s.everReady = true;
      }
      for(RebuildReview.Issue issue:accepted.issues)
        CaptionDiagnostics.mark(s.context,"REBUILD_QUALITY_WARNING","session="+s.id+";request="+job.traceId+";block="+b.index+";advisory=true;repair_candidate="+issue.repair+";"+issue.describe());
      if(DeepSeekConfig.displayTextDebugEnabled(s.context)) for(RebuildProtocol.Event event:accepted.events) {
        int count=(int)event.text.codePoints().filter(c->!Character.isWhitespace(c)).count();
        double cps=count*1000.0/Math.max(1,event.end-event.start);
        if(count>48 || cps>12)CaptionDiagnostics.mark(s.context,"REBUILD_READABILITY_WARNING","block="+b.index+";range="+event.from+"-"+event.to+";duration="+(event.end-event.start)+";characters="+count+";cps="+String.format(Locale.ROOT,"%.2f",cps)+";advisory_only=true");
      }
      RebuildProtocol.Plan save = accepted;
      CACHE.submit(() -> RebuildCache.write(s.context, s.cacheKey, b, save));
      CaptionDiagnostics.mark(
          s.context,
          "REBUILD_EVENTS_ACCEPTED",
          "block="
              + b.index
              + ";events="
              + accepted.events.size()
              + ";session="+s.id+";request="+job.traceId+";review_risks="+RebuildReview.score(accepted.issues)
              + ";attempts="
              + s.attempts[b.index]);
    } catch (Exception e) {
      if (!current(s)) return;
      synchronized (s) {
        s.jobs[job.index] = null;
        if (job.cancelled) {
          if (!job.sent) {
            if (s.attempts[job.index] > 1) s.repairCount = Math.max(0, s.repairCount - 1);
            s.attempts[job.index] = Math.max(0, s.attempts[job.index] - 1);
          }
          s.states[job.index] = WAITING;
          s.retryAt[job.index] = SystemClock.elapsedRealtime() + 500;
        } else {
          String code =
              e instanceof RebuildProtocol.Invalid
                  ? ((RebuildProtocol.Invalid) e).code
                  : e instanceof RebuildApi.Failure
                      ? ((RebuildApi.Failure) e).code
                      : e.getClass().getSimpleName();
          s.reasons[job.index] = code + (e instanceof RebuildProtocol.Invalid && !((RebuildProtocol.Invalid)e).detail.isEmpty() ? "; "+((RebuildProtocol.Invalid)e).detail : "");
          boolean fatal = e instanceof RebuildApi.Failure && ((RebuildApi.Failure) e).configuration;
          if (fatal) {
            s.terminal = true;
            s.status = "字幕 API 配置错误：" + code;
          }
          boolean filtered =
              e instanceof RebuildApi.Failure
                  && "content_filter".equals(((RebuildApi.Failure) e).code);
          boolean structuralRetry =
              s.plans[job.index] == null
                  && s.attempts[job.index] < 3
                  && RebuildReview.structuralRetry(code)
                  && s.repairCount < RebuildReview.MAX_SESSION_REPAIRS;
          s.states[job.index] =
              fatal || filtered || (!structuralRetry && s.attempts[job.index] >= 2)
                  || s.attempts[job.index] >= 3
                  || s.repairCount >= RebuildReview.MAX_SESSION_REPAIRS
                  ? FAILED
                  : WAITING;
          long delay = e instanceof RebuildApi.Failure ? ((RebuildApi.Failure) e).delay : 0;
          s.retryAt[job.index] = SystemClock.elapsedRealtime() + Math.max(1200, delay);
          if (code.equals("http_429") || code.startsWith("http_5"))
            s.providerRetry =
                Math.max(s.providerRetry, SystemClock.elapsedRealtime() + Math.max(5000, delay));
          CaptionDiagnostics.mark(
              s.context,
              "REBUILD_EVENTS_REJECTED",
              "block="
                  + b.index
                  + ";reason="
                  + code
                  + ";session="+s.id+";request="+job.traceId
                  + ";detail="+CaptionQualityTrace.redact(s.reasons[job.index],s.config.apiKey,400)
                  + ";attempts="
                  + s.attempts[b.index]
                  + ";session_repairs="
                  + s.repairCount);
          // A malformed repair must not destroy an already structurally validated candidate.
          if(s.plans[job.index]!=null && !fatal) s.states[job.index]=READY;
        }
      }
    } finally {
      if (current(s)) kick(s);
    }
  }

  private static String original(Session s, long time, boolean label) {
    if (s.raw == null) return "";
    CaptionDocument.Cue latest = null;
    for (CaptionDocument.Cue c : s.raw.document.cues())
      if (time >= c.startMs && time < c.endMs && (latest == null || c.startMs >= latest.startMs))
        latest = c;
    return latest == null ? "" : (label ? "[原文 / Original] " : "") + latest.text;
  }

  private static void endFallback(Session s,long position,String cause) {
    if(!s.fallbackReason.isEmpty())CaptionDiagnostics.mark(s.context,"REBUILD_FALLBACK_END",
        "session="+s.id+";start="+s.fallbackStart+";end="+position+";cause="+cause+";reason="+CaptionQualityTrace.redact(s.fallbackReason,s.config.apiKey,400));
    s.fallbackReason="";s.fallbackStart=-1;
  }

  static boolean lateUnreadable(RebuildProtocol.Event e,long position) {
    return position-e.start>1000 && e.end-position<1000 && e.text.codePointCount(0,e.text.length())>12;
  }
  private static void render(Session s) {
    if (!current(s) || !s.visible) return;
    String text = "", source = "";
    String fallbackReason = "";
    boolean status = false;
    int generation;
    long revision, selectedAt;
    String eventId = "none";
    long eventStart = -1, eventEnd = -1;
    synchronized (s) {
      generation = s.generation;
      selectedAt = s.position;
      if (s.source == null) {
        text = s.status.isEmpty() ? "字幕准备中…" : s.status;
        status = true;
      } else if (s.sourceOnly) text = original(s, s.position, false);
      else if (s.terminal) {
        text = s.status;
        status = true;
      } else {
        int i = blockAt(s, s.position);
        if (i >= 0 && covers(s.blocks.get(i), s.position)) {
          if(s.pendingPlans!=null && s.pendingPlans[i]!=null) {
            RebuildProtocol.Event previous=s.plans[i]==null?null:s.plans[i].at(s.position);
            String previousId=previous==null?"":i+":"+previous.from+"-"+previous.to;
            if(previous==null || !previousId.equals(s.displayedEvent)) {s.plans[i]=s.pendingPlans[i];s.pendingPlans[i]=null;}
          }
          RebuildProtocol.Plan p = s.plans[i];
          RebuildProtocol.Event e = p == null ? null : p.at(s.position);
          if (e != null) {
            eventId = i + ":" + e.from + "-" + e.to;
            eventStart = e.start;
            eventEnd = e.end;
            text = RebuildReview.uncertainNumbers(p,e) ? "〔原字幕数字存疑〕"+e.text : e.text;
            CaptionOverlay.LayoutBudget currentLayout=CaptionOverlay.budget();
            boolean blocked = RebuildReview.blocked(p,e,currentLayout==null?null:currentLayout::fits);
            boolean late = !eventId.equals(s.displayedEvent) && (eventId.equals(s.withheldEvent) ||
                lateUnreadable(e,s.position));
            if(blocked || late) {
              text = s.states[i]==READY || s.states[i]==FAILED ? "字幕暂不可用" : "字幕校正中…";
              status=true; fallbackReason=blocked?"event_review":"late_unreadable";
              if(late && !eventId.equals(s.withheldEvent))CaptionDiagnostics.mark(s.context,"REBUILD_LATE_UNREADABLE","session="+s.id+";event="+eventId+";remaining="+(e.end-s.position));
              if(late)s.withheldEvent=eventId;
            } else s.displayedEvent=eventId;
            source = "[原文 / Original] " + s.source.text(e.from, e.to);
          } else if (p == null) {
            text = s.states[i]==FAILED ? "字幕暂不可用" : "字幕翻译中…";
            status = true;
            source = text;
            fallbackReason = s.states[i]==FAILED ? "failed:"+s.reasons[i]
                : s.attempts[i]>1 ? "retrying" : "pending_translation";
          }
        }
      }
      if(!fallbackReason.equals(s.fallbackReason)) {
        endFallback(s,s.position,"state_change");
        s.fallbackReason=fallbackReason;s.fallbackStart=s.position;
        if(!fallbackReason.isEmpty())CaptionDiagnostics.mark(s.context,"REBUILD_FALLBACK_BEGIN",
            "session="+s.id+";position="+s.position+";reason="+CaptionQualityTrace.redact(fallbackReason,s.config.apiKey,400));
      }
      String signature = (status ? "status:" : "caption:") + eventId + "|" + text + "|" + source;
      if (signature.equals(s.lastShown)) return;
      s.lastShown = signature;
      revision = ++s.renderRevision;
    }
    CaptionOverlay.RenderGuard guard =
        () -> current(s) && s.generation == generation && s.renderRevision == revision && s.visible;
    String fallback = source;
    if (status) CaptionOverlay.showStatus(text, guard);
    else if (text.isEmpty()) CaptionOverlay.hide(guard);
    else
      CaptionOverlay.showEvent(
          text, guard, () -> s.sourceOnly ? fallback : "", s.id + ":" + generation + ":" + eventId);
    if (DeepSeekConfig.displayTextDebugEnabled(s.context))
      CaptionDiagnostics.mark(
          s.context,
          "REBUILD_SELECTED",
          "id="
              + s.id
              + ":"
              + generation
              + ":"
              + eventId
              + ";time="
              + selectedAt
              + ";range="
              + eventStart
              + "-"
              + eventEnd
              + ";text="
              + CaptionQualityTrace.redact(text, s.config.apiKey, 500));
  }
}
