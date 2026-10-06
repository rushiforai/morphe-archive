package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import android.graphics.*;
import android.graphics.drawable.GradientDrawable;
import android.os.*;
import android.text.*;
import android.util.TypedValue;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import java.util.function.Supplier;

/** One event in one view. Layout never edits a translation or creates new timeline events. */
final class CaptionOverlay {
  interface RenderGuard {
    boolean isValid();
    default void onApplied() {}
    default long displayPosition(long supplied) { return supplied; }
    default String identity(){return "";}
    default String session(){return "";}
    default long windowStart(){return -1;}
    default long windowEnd(){return -1;}
    default String blankReason(){return "";}
    /** Credential identity known when this guard was bound; never resolved on the render path. */
    default CaptionCredentialRef credential(){return CaptionCredentialRef.NONE;}
  }

  private static final Handler MAIN = new Handler(Looper.getMainLooper());
  private static final java.util.concurrent.atomic.AtomicLong COMMAND =
      new java.util.concurrent.atomic.AtomicLong();
  private static WeakReference<Activity> activityRef = new WeakReference<>(null);
  private static WeakReference<FrameLayout> hostRef = new WeakReference<>(null),
      anchorRef = new WeakReference<>(null);
  private static CaptionHorizontalPlacement horizontalPlacement;
  private static WeakReference<TextView> textRef = new WeakReference<>(null);

  /** Immutable geometry; background translation can measure without touching Views. */
  static final class LayoutBudget {
    final int width;
    final float minimumPx, preferredPx;
    final CaptionRenderSpec renderSpec;
    LayoutBudget(int w,float px) { this(w,px,px); }
    LayoutBudget(int w,float px,float preferred) { this(w,px,preferred,CaptionRenderSpec.LEGACY); }
    LayoutBudget(int w,float px,float preferred,CaptionRenderSpec spec) {
      width=w; minimumPx=px; preferredPx=preferred; renderSpec=spec;
    }
    LayoutBudget withSpec(CaptionRenderSpec spec) {
      return renderSpec==spec ? this : new LayoutBudget(width,minimumPx,preferredPx,spec);
    }
    boolean fits(String value) {
      return value.isEmpty() || renderSpec.fits(value,minimumPx,width,2);
    }
    boolean fitsPreferred(String value) {
      return value.isEmpty() || renderSpec.fits(value,preferredPx,width,2);
    }
    boolean canPresent(RebuildProtocol.Event event) {
      return canPresent(event,renderSpec);
    }
    boolean canPresent(RebuildProtocol.Event event,CaptionRenderSpec spec) {
      return !RebuildPageLayout.plan(event.text,event.start,event.end,this,spec).isEmpty();
    }
    int preferredColumns() { return Math.max(1,(int)(width/Math.max(1,preferredPx))); }
    int approximateColumns() { return Math.max(1,(int)(width/Math.max(1,minimumPx))); }
  }

  private static volatile LayoutBudget layoutBudget;

  static LayoutBudget budget() {
    return layoutBudget;
  }

  private static String pendingText = "", pendingIdentity = "", lastNotice = "";
  private static String lastBlankIdentity;
  private static CaptionRenderSpec pendingRenderSpec=CaptionRenderSpec.LEGACY;
  private static String lastPresentationNotice="";
  private static android.os.LocaleList legacyPaintLocales;
  private static boolean targetPaintLocalesApplied;
  private static long pendingStart = -1, pendingEnd = -1, pendingPosition = -1;
  private static List<RebuildPageLayout.Page> pendingPages = Collections.emptyList();
  private static int shownPage = -1;
  private static RebuildDisplayMerge.Merged pendingCandidate;
  private static String plannedIdentity="", plannedText="", lastDisplayResult="", lastMergeNotice="";
  private static long plannedStart,plannedEnd;
  private static int plannedWidth;
  private static float plannedSize;
  private static CaptionRenderSpec plannedSpec;
  private static List<RebuildPageLayout.Page> plannedPages=Collections.emptyList();
  static long planningCalls;
  private static boolean reconcilingDisplayTime;

  private static List<RebuildPageLayout.Page> currentPlan(LayoutBudget budget,CaptionRenderSpec spec) {
    if(!plannedIdentity.equals(pendingIdentity) || !plannedText.equals(pendingText)
        || plannedStart!=pendingStart || plannedEnd!=pendingEnd || plannedWidth!=budget.width
        || plannedSize!=budget.preferredPx || !spec.sameMeasurement(plannedSpec)) {
      plannedIdentity=pendingIdentity;plannedText=pendingText;plannedStart=pendingStart;plannedEnd=pendingEnd;
      plannedWidth=budget.width;plannedSize=budget.preferredPx;plannedSpec=spec;planningCalls++;
      plannedPages=RebuildPageLayout.plan(pendingText,pendingStart,pendingEnd,budget,spec);
    }
    return plannedPages;
  }
  private static boolean previousShorts, previousFullScreen;
  private static boolean pendingStatus, pendingWaiting;
  /** Display permission and compact quarantine live in the one player authority, not in this class. */
  private static boolean suppressed(){return !CaptionPlayerAuthority.displayPermitted()
      && CaptionPlayerAuthority.state()!=CaptionPlayerAuthority.UNKNOWN;}
  private static boolean guardedExpansion(){return CaptionPlayerAuthority.state()==CaptionPlayerAuthority.COMPACT
      || CaptionPlayerAuthority.state()==CaptionPlayerAuthority.TRANSITIONING_TO_REGULAR;}
  private static RenderGuard currentGuard;
  private static Supplier<String> fallback;
  private static Rect previous = new Rect();
  private static int normalVideoWidth;
  private static int previousScreenWidth;
  private static boolean referenceShorts, referenceLandscape;
  private static long lastScan, lastLayout;
  private static boolean dirty = true;
  // One frame-aligned UI request. Never postpone model authority, clear or compact quarantine.
  private static volatile long playerRenderEpoch;
  /** Render invalidation only. The real player type is owned by CaptionPlayerAuthority. */
  static long playerDispatchIdentity(){return playerRenderEpoch;}
  private static Runnable playerRenderTask;
  private static WeakReference<View> playerFrameClock = new WeakReference<>(null);
  private static boolean playerRenderPending, applyingPlayerRender;
  static long deferredRenderCount, deferredRenderNanos;
  private static long renderStartedUptime;

  private static void invalidatePlayerRender() {
    playerRenderEpoch++;
    View clock=playerFrameClock.get();
    if(clock!=null && playerRenderTask!=null)clock.removeCallbacks(playerRenderTask);
    if(playerRenderTask!=null)MAIN.removeCallbacks(playerRenderTask);
    playerRenderTask=null;playerFrameClock.clear();playerRenderPending=false;
  }
  static void requestPlayerRender() {
    if(suppressed() || guardedExpansion()
        || pendingText.isEmpty()&&pendingIdentity.isEmpty())return;
    // An authoritative player transition supersedes a queued render: the obsolete callback is dropped
    // and exactly one new frame-aligned render is requested for the new mode.
    if(playerRenderTask!=null)invalidatePlayerRender();
    Activity owner=activityRef.get();
    if(owner==null || owner.isFinishing() || owner.isDestroyed() || owner.getWindow()==null)return;
    View clock=owner.getWindow().getDecorView();
    final long epoch=playerRenderEpoch;
    playerRenderPending=true;
    playerRenderTask=()->{
      // A stale callback has no attach/render/hide side effects, including on a newer Session.
      if(epoch!=playerRenderEpoch || activityRef.get()!=owner || owner.isFinishing() || owner.isDestroyed())return;
      playerRenderTask=null;playerFrameClock.clear();playerRenderPending=false;
      if(suppressed() || guardedExpansion() || currentGuard!=null&&!currentGuard.isValid()
          || pendingText.isEmpty()&&pendingIdentity.isEmpty())return;
      long started=System.nanoTime();applyingPlayerRender=true;
      try{render();deferredRenderCount++;}finally{applyingPlayerRender=false;deferredRenderNanos+=System.nanoTime()-started;}
      CaptionDiagnostics.mark(owner,"PLAYER_TRANSITION_RENDER_DISPATCH",
          "type="+CaptionPlayerAuthority.playerType()+";state="+CaptionPlayerAuthority.stateName()+";deferred_render_count="+deferredRenderCount+";render_total_us="+(deferredRenderNanos/1000)
          +";geometry_search_count="+CaptionSurface.refreshSearchCount+";native_scan_count="+CaptionMusicSuppressor.scanCount
          +";tree_summary_count="+CaptionMusicSuppressor.treeSummaryCount);
    };
    playerFrameClock=new WeakReference<>(clock);
    clock.postOnAnimation(playerRenderTask);
  }
  private static float downY, initial;
  private static long downAt;
  private static boolean dragging;
  private static final android.view.ViewTreeObserver.OnPreDrawListener WATCH =
      () -> {
        long now = SystemClock.uptimeMillis();
        if (now - lastLayout >= 100 && !guardedExpansion() && !suppressed()
            && (!pendingText.isEmpty() || !pendingIdentity.isEmpty())) {
          lastLayout = now;
          render();
        }
        return true;
      };

  static void setActivity(Activity a) {
    CaptionPlayerAuthority.setOwner(a);
    main(
        () -> {
          if (activityRef.get() != a) {
            invalidatePlayerRender();
            detach();
            normalVideoWidth = 0;
          }
          activityRef = new WeakReference<>(a);
          CaptionSurface.activity(a);
          dirty = true;
          render();
        });
  }

  static void showCaption(String s) {
    show(s, false, null, null);
  }

  static void showCaption(String s, RenderGuard g) {
    show(s, false, g, null);
  }

  static void showCaption(String s, RenderGuard g, Supplier<String> f) {
    show(s, false, g, f);
  }

  static void showStatus(String s) {
    show(s, true, null, null);
  }

  static void showStatus(String s, RenderGuard g) {
    show(s, true, g, null);
  }

  static void showEvent(String s, RenderGuard g, Supplier<String> f, String id) {
    show(s, false, g, f, id);
  }

  static void showEvent(String s, RenderGuard g, Supplier<String> f, String id,
      long start, long end, long position) {
    show(s, false, g, f, id, start, end, position);
  }

  static void showEvent(String s,RenderGuard g,Supplier<String> f,String id,
      long start,long end,long position,CaptionRenderSpec spec) {
    show(s,false,g,f,id,start,end,position,false,spec);
  }

  static void showEvent(String s,RenderGuard g,Supplier<String> f,String id,
      long start,long end,long position,CaptionRenderSpec spec,RebuildDisplayMerge.Merged candidate) {
    show(s,false,g,f,id,start,end,position,false,spec,candidate);
  }

  static void showWaitingEvent(String s, RenderGuard g, String id,
      long start, long end, long position) {
    show(s, false, g, null, id, start, end, position, true);
  }

  static void position(long position) { position(position,null); }

  static void position(long position,RenderGuard owner) {
    if(owner!=null && !owner.isValid())return;
    main(() -> {
      if(owner!=null && !owner.isValid())return;
      long latest=currentGuard!=null && currentGuard.isValid() ? currentGuard.displayPosition(position)
          : owner==null ? position : owner.displayPosition(position);
      long before=pendingPosition;pendingPosition=latest;
      int next=RebuildPageLayout.indexAt(pendingPages,latest);
      boolean timed=pendingStart>=0 && pendingEnd>pendingStart;
      if(next!=shownPage || timed && (latest<pendingStart || latest>=pendingEnd
          || before<pendingStart || before>=pendingEnd)) {
        dirty=true;render();
      }
    });
  }

  private static void show(String s, boolean status, RenderGuard g, Supplier<String> f) {
    show(s, status, g, f, "");
  }

  private static void show(String s, boolean status, RenderGuard g, Supplier<String> f, String id) {
    show(s, status, g, f, id, -1, -1, -1);
  }

  private static void show(String s, boolean status, RenderGuard g, Supplier<String> f, String id,
      long start, long end, long position) {
    show(s, status, g, f, id, start, end, position, false);
  }

  private static void show(String s, boolean status, RenderGuard g, Supplier<String> f, String id,
      long start, long end, long position, boolean waiting) {
    show(s,status,g,f,id,start,end,position,waiting,CaptionRenderSpec.LEGACY);
  }

  private static void show(String s,boolean status,RenderGuard g,Supplier<String> f,String id,
      long start,long end,long position,boolean waiting,CaptionRenderSpec spec) {
    show(s,status,g,f,id,start,end,position,waiting,spec,null);
  }
  private static void show(String s,boolean status,RenderGuard g,Supplier<String> f,String id,
      long start,long end,long position,boolean waiting,CaptionRenderSpec spec,RebuildDisplayMerge.Merged candidate) {
    if (g != null && !g.isValid()) return;
    long command = g == null ? COMMAND.incrementAndGet() : COMMAND.get();
    final long renderEpoch=playerRenderEpoch;
    main(
        () -> {
          if(renderEpoch!=playerRenderEpoch)return;
          if (g != null) {
            if (!g.isValid()) return;
            COMMAND.incrementAndGet();
          } else if (command != COMMAND.get()) return;
          pendingRenderSpec = spec;
          pendingCandidate=candidate;
          pendingText = s == null ? "" : s;
          pendingIdentity = id;
          pendingStart = start;
          pendingEnd = end;
          pendingPosition = g==null ? position : g.displayPosition(position);
          pendingPages = Collections.emptyList();
          shownPage = -1;
          pendingStatus = status;
          pendingWaiting = waiting;
          currentGuard = g;
          fallback = f;
          dirty = true;
          render();
          if (g != null) g.onApplied();
        });
  }

  static void hide() {
    hide(null);
  }

  static void hide(RenderGuard g) {
    if (g != null && !g.isValid()) return;
    long command = g == null ? COMMAND.incrementAndGet() : COMMAND.get();
    final long renderEpoch=playerRenderEpoch;
    main(
        () -> {
          if(renderEpoch!=playerRenderEpoch)return;
          if (g != null) {
            if (!g.isValid()) return;
            COMMAND.incrementAndGet();
          } else if (command != COMMAND.get()) return;
          invalidatePlayerRender();
          pendingText = "";
          pendingCandidate=null;plannedIdentity="";plannedPages=Collections.emptyList();
          pendingStart=-1;pendingEnd=-1;
          pendingIdentity = "";
          pendingPages = Collections.emptyList();
          shownPage = -1;
          fallback = null;
          currentGuard = g;
          hideView();
          if(g!=null){
            pendingIdentity=g.identity();pendingStart=g.windowStart();pendingEnd=g.windowEnd();
            pendingPosition=g.displayPosition(pendingPosition);
            displayResult(activityRef.get(),"empty",g.blankReason(),false,0,0,"");
            pendingIdentity="";pendingStart=-1;pendingEnd=-1; // A diagnostic identity is not a pending render.
          }
          if (g != null) g.onApplied();
        });
  }

  static void clear() {
    clear(null);
  }

  /** Session cleanup cannot invalidate a newer session's queued render command. */
  static void clear(RenderGuard guard) {
    if (guard != null && !guard.isValid()) return;
    long command = guard == null ? COMMAND.incrementAndGet() : COMMAND.get();
    main(
        () -> {
          if (command != COMMAND.get() || guard != null && !guard.isValid()) return;
          pendingText = "";
          pendingCandidate=null;plannedIdentity="";plannedPages=Collections.emptyList();
          pendingStart=-1;pendingEnd=-1;
          pendingIdentity = "";
          pendingPages = Collections.emptyList();
          shownPage = -1;
          invalidatePlayerRender();
          pendingStatus = false;
          fallback = null;
          currentGuard = null;
          normalVideoWidth = 0;
          hideView();
        });
  }

  static void refreshStyle(Context c) {
    main(
        () -> {
          // An explicit user style refresh is not a player notification; apply the latest mode now.
          invalidatePlayerRender();
          dirty = true;
          render();
        });
  }

  /**
   * Geometry refresh only, and never during a player transition: the transition coordinator is the
   * single place that decides when a new surface may be discovered. Shorts keep their existing
   * isolation, which is a surface fact rather than a player-transition fact.
   */
  static void refreshSurface() {
    main(
        () -> {
          CaptionPlayerAuthority.reconcileCurrentPlayerType();
          if(CaptionPlayerAuthority.state()==CaptionPlayerAuthority.COMPACT)
            return;
          boolean surfaceDirty=CaptionPlayerAuthority.consumeSurfaceDirty();
          if (CaptionSurface.isShorts()) {
            // Shorts keeps its existing isolation and is never the compact miniplayer state.
            CaptionPlayerAuthority.noteShortsSurface();
            long now = SystemClock.uptimeMillis();
            if (!surfaceDirty && now >= lastScan && now - lastScan < 500L) return;
            CaptionSurface.refresh();
            lastScan = SystemClock.uptimeMillis();
            CaptionSurface.invalidateGeometry();
            dirty = true;
            render();
            return;
          }
          if(CaptionPlayerAuthority.state()==CaptionPlayerAuthority.TRANSITIONING_TO_REGULAR)return;
          long now = SystemClock.uptimeMillis();
          // The 500 ms throttle bounds repeated expensive searches. A genuinely new authoritative
          // player notification is a real surface change, so it also stamps the window: the search it
          // is allowed to perform replaces the throttled one instead of adding to it.
          if (!surfaceDirty && now >= lastScan && now - lastScan < 500L) return;
          CaptionSurface.refresh();
          lastScan = SystemClock.uptimeMillis();
          CaptionSurface.invalidateGeometry();
          dirty = true;
          render();
        });
  }

  /**
   * Routes a raw player type into the one authority. This method no longer decides anything about
   * display permission, and a caption clear / style change cannot invalidate the notification.
   */
  static void setPlayerType(String type) {
    CaptionPlayerAuthority.onNotification(type, false);
    main(
        () -> {
          if (CaptionPlayerAuthority.state()==CaptionPlayerAuthority.COMPACT
              || CaptionPlayerAuthority.state()==CaptionPlayerAuthority.CLOSED) {
            invalidatePlayerRender();
            hideView();
            displayResult(activityRef.get(),"suppressed","player_suppressed",false,0,0,"");
            return;
          }
          normalVideoWidth=0;
          CaptionSurface.invalidateGeometry();
          dirty=true;
          requestPlayerRender();
        });
  }

  static void beginGuardedExpansion() {
    main(
        () -> {
          invalidatePlayerRender();
          hideView();
        });
  }

  /**
   * The transition coordinator already moved the authority to REGULAR. This only re-enables drawing;
   * it never re-derives a player type and never starts a geometry tail of its own.
   */
  static void restoreAfterGuardedExpansion(String type) {
    CaptionPlayerAuthority.settleRegular();
    main(
        () -> {
          CaptionSurface.invalidateGeometry();
          dirty = true;
          requestPlayerRender();
        });
  }

  private static void main(Runnable r) {
    if (Looper.myLooper() == Looper.getMainLooper()) r.run();
    else MAIN.post(r);
  }

  /**
   * Verification reset of the presentation dedup memory. Production reaches the same effect through
   * the next genuine caption identity; this exists so a cleared session can be observed again.
   */
  static void resetPresentationDedupForTests() {
    lastDisplayResult = "";
    lastNotice = "";
    lastMergeNotice = "";
    lastPresentationNotice = "";
    lastBlankIdentity = null;
    lastScan = -500;
    lastLayout = 0;
    reconcilingDisplayTime = false;
  }
  /** Main-thread constant-time retraction. Accepted plans/cache/positions are deliberately retained. */
  static void denyDisplay(long ownerEpoch) {
    if(Looper.myLooper()!=Looper.getMainLooper()) {
      MAIN.post(() -> denyDisplay(ownerEpoch));
      return;
    }
    if(ownerEpoch!=CaptionPlayerAuthority.ownerEpoch())return;
    invalidatePlayerRender();
    COMMAND.incrementAndGet();
    dragging=false;
    FrameLayout anchor=anchorRef.get();
    TextView text=textRef.get();
    if(text!=null){text.cancelPendingInputEvents();text.clearFocus();}
    if(anchor!=null){
      anchor.cancelPendingInputEvents();anchor.clearFocus();
      anchor.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
      anchor.setVisibility(View.INVISIBLE);
    }
  }

  private static void hideView() {
    if(horizontalPlacement!=null)horizontalPlacement.cancel();
    lastBlankIdentity = null;
    FrameLayout a = anchorRef.get();
    if(a!=null)a.setVisibility(View.GONE);
  }

  /** Read-only bounded evidence: is the current overlay anchor visible right now? */
  static boolean anchorVisible(){
    FrameLayout a=anchorRef.get();
    return a!=null&&a.getVisibility()==View.VISIBLE;
  }

  private static void detach() {
    if(horizontalPlacement!=null)horizontalPlacement.cancel();
    horizontalPlacement=null;
    FrameLayout h = hostRef.get(), a = anchorRef.get();
    if (h != null && h.getViewTreeObserver().isAlive())
      h.getViewTreeObserver().removeOnPreDrawListener(WATCH);
    if (a != null && a.getParent() instanceof ViewGroup) ((ViewGroup) a.getParent()).removeView(a);
    // A detached overlay must never keep a visible state: a later owner renders only after it has
    // proven a permitted player surface, so nothing inherits the previous anchor visibility.
    if (a != null) a.setVisibility(View.GONE);
    hostRef = new WeakReference<>(null);
    anchorRef = new WeakReference<>(null);
    textRef = new WeakReference<>(null);
    previous.setEmpty();
    previousScreenWidth = 0;
    lastScan = -500;
    lastLayout = 0;
    lastNotice = "";
    lastBlankIdentity = null;
    layoutBudget = null;
    pendingPages = Collections.emptyList();
    plannedIdentity="";plannedPages=Collections.emptyList();
    shownPage = -1;
  }

  private static boolean attach(Activity a) {
    FrameLayout h = hostRef.get();
    if (h != null && h.isAttachedToWindow() && anchorRef.get() != null) return true;
    detach();
    View content = a.findViewById(android.R.id.content);
    if (!(content instanceof FrameLayout)) return false;
    h = (FrameLayout) content;
    FrameLayout anchor = new FrameLayout(a);
    // A freshly attached overlay starts hidden. Only a render that passed the authority, guard and
    // geometry checks may make it visible, so a transition can never expose an unverified overlay.
    anchor.setVisibility(View.GONE);
    anchor.setTag("yydarlinker.deepseek.caption.anchor");
    // Only the outer coordinate system is physical LTR; the TextView keeps its target spec.
    anchor.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
    anchor.setClipChildren(false);
    anchor.setClipToPadding(false);
    anchor.setElevation(dp(a, 12));
    TextView text = new TextView(a);
    legacyPaintLocales=text.getTextLocales();targetPaintLocalesApplied=false;
    text.setTag("yydarlinker.deepseek.caption.overlay");
    text.setTextColor(Color.WHITE);
    text.setGravity(Gravity.CENTER);
    text.setIncludeFontPadding(false);
    text.setPadding(dp(a, 6), dp(a, 4), dp(a, 6), dp(a, 4));
    text.setShadowLayer(dp(a, 1), 0, dp(a, 1), 0xD0000000);
    text.setTypeface(Typeface.DEFAULT, Typeface.NORMAL);
    text.setSingleLine(false);
    text.setMaxLines(2);
    text.setEllipsize(null);
    text.setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE);
    text.setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED);
    text.setOnTouchListener((v, e) -> drag(v, e));
    anchor.addView(
        text,
        new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT,
            Gravity.TOP | Gravity.CENTER_HORIZONTAL));
    h.addView(anchor, new FrameLayout.LayoutParams(1, 1));
    hostRef = new WeakReference<>(h);
    anchorRef = new WeakReference<>(anchor);
    textRef = new WeakReference<>(text);
    horizontalPlacement=new CaptionHorizontalPlacement(h,anchor,text);
    h.getViewTreeObserver().addOnPreDrawListener(WATCH);
    dirty = true;
    return true;
  }

  private static void render() {
    renderStartedUptime=SystemClock.uptimeMillis();
    Activity a = activityRef.get();
    if(currentGuard!=null && !currentGuard.isValid()) {
      hideView();displayResult(a,"suppressed","owner_invalid",false,0,0,"");return;
    }
    if(currentGuard!=null)pendingPosition=currentGuard.displayPosition(pendingPosition);
    if(pendingStart>=0 && pendingEnd>pendingStart
        && (pendingPosition<pendingStart || pendingPosition>=pendingEnd)) {
      TextView stale=textRef.get();if(stale!=null)stale.setText("");
      shownPage=-1;hideView();dirty=true;
      displayResult(a,"empty","outside_owned_window",false,0,0,"");return;
    }
    // A time expiry is authoritative even while a geometry frame is queued.
    if(playerRenderPending && !applyingPlayerRender){requestPlayerRender();return;}
    if (a == null
        || a.isFinishing()
        || a.isDestroyed()
        || pendingText.isEmpty() && pendingIdentity.isEmpty()
        || suppressed()
        || guardedExpansion()
        || currentGuard != null && !currentGuard.isValid()) {
      hideView();
      if(a!=null && (suppressed() || guardedExpansion()))displayResult(a,"suppressed","player_suppressed",false,0,0,"");
      return;
    }
    if (!attach(a)) return;
    FrameLayout host = hostRef.get(), anchor = anchorRef.get();
    TextView text = textRef.get();
    // Keep the untouched legacy font defaults; restore them only after an explicit target style.
    if(pendingRenderSpec.legacy && targetPaintLocalesApplied) {
      text.setTextLocales(legacyPaintLocales);targetPaintLocalesApplied=false;
    } else if(!pendingRenderSpec.legacy && !targetPaintLocalesApplied) {
      legacyPaintLocales=text.getTextLocales();targetPaintLocalesApplied=true;
    }
    pendingRenderSpec.apply(text);
    long now = SystemClock.uptimeMillis();
    if (now - lastScan >= 500) {
      CaptionSurface.refresh();
      lastScan = now;
    }
    Rect b = CaptionSurface.videoBounds(host);
    if (b == null || b.width() < 50 || b.height() < 50) {
      layoutBudget = null;
      hideView();
      return;
    }
    boolean shorts = CaptionSurface.isShorts();
    android.util.DisplayMetrics metrics = a.getResources().getDisplayMetrics();
    int screenWidth = metrics.widthPixels;
    // Mode callbacks can precede the orientation layout. Use current screen geometry
    // for the calibrated portrait-details / landscape-full-screen modes.
    boolean fullScreen = !shorts && metrics.widthPixels > metrics.heightPixels;
    if (!dirty
        && b.equals(previous)
        && screenWidth == previousScreenWidth
        && shorts == previousShorts
        && fullScreen == previousFullScreen
        && (anchor.getVisibility() == View.VISIBLE
            || anchor.getVisibility() == View.GONE
                && pendingIdentity.equals(lastBlankIdentity))) return;
    previousShorts = shorts;
    previousFullScreen = fullScreen;
    dirty = false;
    previous.set(b);
    // N36: a new surface may only be committed outside a player transition. The authority is the one
    // place that decides when the geometry is settled, so a transition never reflows this caption.
    // "Proven" means an explicit player authority decision, not merely that nothing has been reported
    // yet: a long-lived session that never receives a player callback keeps the legacy non-compact
    // behaviour, while a real COMPACT / TRANSITIONING window never commits a new surface.
    boolean authorityTransitioning=CaptionPlayerAuthority.state()==CaptionPlayerAuthority.COMPACT
        ||CaptionPlayerAuthority.state()==CaptionPlayerAuthority.TRANSITIONING_TO_REGULAR;
    if(authorityTransitioning&&!CaptionSurface.isShorts()){
      hideView();
      return;
    }
    previousScreenWidth = screenWidth;
    DeepSeekConfig.Snapshot cfg = DeepSeekConfig.displayStyle(a);
    boolean landscapeHost = host.getWidth() > host.getHeight();
    if (normalVideoWidth == 0 || shorts != referenceShorts
        || landscapeHost != referenceLandscape) {
      normalVideoWidth = b.width();
      referenceShorts = shorts;
      referenceLandscape = landscapeHost;
    } else {
      normalVideoWidth = Math.max(normalVideoWidth, b.width());
    }
    float targetGlyphHeight = SubtitleStyleMetrics.renderedGlyphHeightPx(
        cfg.captionSizeTier,screenWidth,fullScreen,b.width(),normalVideoWidth);
    float preferred = SubtitleStyleMetrics.textSizePxForGlyphHeight(text.getPaint(),targetGlyphHeight);
    float minimum = SubtitleStyleMetrics.textSizePxForGlyphHeight(text.getPaint(),
        SubtitleStyleMetrics.renderedGlyphHeightPx(
            0,screenWidth,fullScreen,b.width(),normalVideoWidth));
    int width = Math.max(1, Math.round(b.width() * (CaptionSurface.isShorts() ? .78f : .92f)));
    int inner = Math.max(1, width - text.getPaddingLeft() - text.getPaddingRight());
    CaptionRenderSpec measuredSpec=pendingRenderSpec.withPaint(text);
    layoutBudget = new LayoutBudget(inner,minimum,preferred,measuredSpec);
    float size = preferred;
    String shown = pendingText;
    String mode = pendingStatus ? "status" : "caption";
    boolean ownedCaption = !pendingStatus && !pendingWaiting && !pendingText.isEmpty()
        && pendingStart >= 0 && pendingEnd > pendingStart;
    pendingPages=ownedCaption ? currentPlan(layoutBudget,measuredSpec) : Collections.emptyList();
    boolean candidate=false;
    if(ownedCaption && pendingCandidate!=null) {
      RebuildDisplayMerge.Merged join=pendingCandidate;
      candidate=pendingPosition>=join.right.start && join.end-pendingPosition>=RebuildPageLayout.MIN_PAGE_MS
          && CaptionLanguagePager.wellFormed(join.text,measuredSpec)
          && measuredSpec.fits(join.text,preferred,inner,2);
      if(candidate)pendingPages=Collections.singletonList(new RebuildPageLayout.Page(join.text,join.start,join.end));
      else mergeRejected(a,"candidate_time_or_geometry");
    }
    shownPage=RebuildPageLayout.indexAt(pendingPages,pendingPosition);
    if(shownPage>=0) {
      shown=pendingPages.get(shownPage).text;
      if(pendingPages.size()>1)mode="caption_page";
      if(candidate)mode="caption_merge";
    } else if(!ownedCaption) {
      while(size>minimum && linesPx(shown,size,inner,measuredSpec)>2)size=Math.max(minimum,size-.5f);
    }
    String reason=shown.isEmpty() && currentGuard!=null ? currentGuard.blankReason() : "";
    if(ownedCaption && shownPage<0) {
      shown="";mode="overflow_status";
      reason=pendingPages.isEmpty() ? CaptionLanguagePager.failureReason(pendingText,layoutBudget,measuredSpec)
          : "outside_owned_window";
    } else if(!ownedCaption && linesPx(shown,size,inner,measuredSpec)>2) {
      shown=fallback==null ? "" : fallback.get();mode="original_fallback";
      if(shown==null || linesPx(shown,size,inner,measuredSpec)>2){shown="";mode="overflow_status";}
    }
    text.setTextSize(TypedValue.COMPLEX_UNIT_PX,size);
    text.setSingleLine(false);text.setMaxLines(2);text.setEllipsize(null);
    text.setAutoSizeTextTypeWithDefaults(TextView.AUTO_SIZE_TEXT_TYPE_NONE);
    text.setTextColor(pendingStatus ? 0xE6FFFFFF : Color.WHITE);
    int compact=0;
    if(!shown.isEmpty()) {
      compact=measureComplete(text,shown,size,inner,measuredSpec,ownedCaption);
      if(compact<0 && candidate) {
        // The optional join can never consume the current primary event on an OEM shaping failure.
        mergeRejected(a,"candidate_textview_geometry");candidate=false;
        pendingPages=currentPlan(layoutBudget,measuredSpec);
        shownPage=RebuildPageLayout.indexAt(pendingPages,pendingPosition);
        shown=shownPage<0 ? "" : pendingPages.get(shownPage).text;
        mode=pendingPages.size()>1 ? "caption_page" : "caption";
        compact=shown.isEmpty() ? -1 : measureComplete(text,shown,size,inner,measuredSpec,true);
      }
      if(compact<0){shown="";mode="overflow_status";reason="hard_textview_geometry";}
    }
    String detail =
          "id="
              + pendingIdentity
              + ";mode="
              + mode
              + ";width="
              + inner
              + ";sp=" + size / metrics.scaledDensity
              + ";text_size_px="
              + size
              + ";target_glyph_height_px=" + targetGlyphHeight
              + ";rendered_glyph_target_px=" + targetGlyphHeight * size / preferred
              + ";glyph_height_px=" + SubtitleStyleMetrics.measuredGlyphHeightPx(text.getPaint())
              + ";font_metrics_height_px=" + SubtitleStyleMetrics.fontMetricsHeightPx(text.getPaint())
              + ";screen_width_px=" + screenWidth
              + ";video_width_px=" + b.width()
              + ";normal_video_width_px=" + normalVideoWidth
              + ";size_tier=" + cfg.captionSizeTier
              + ";size_mode=" + (fullScreen ? "full_screen" : "detail")
              + ";detail_glyph_height_px=" + CaptionFontSize.detailGlyphHeightPx(cfg.captionSizeTier)
              + ";full_screen_glyph_height_px=" + CaptionFontSize.fullScreenGlyphHeightPx(cfg.captionSizeTier)
              + ";glyph_height_ratio=" + (fullScreen
                  ? CaptionFontSize.fullScreenRatio(cfg.captionSizeTier)
                  : CaptionFontSize.detailRatio(cfg.captionSizeTier))
              + ";effective_glyph_height_ratio=" + targetGlyphHeight / Math.max(1,screenWidth)
              + ";density=" + metrics.density
              + ";fontScale=" + a.getResources().getConfiguration().fontScale
              + ";lines="
              + (shown.isEmpty()?0:text.getLineCount())
              + (shownPage >= 0 ? ";page=" + (shownPage + 1) + "/" + pendingPages.size()
                  + ";page_range=" + pendingPages.get(shownPage).start + "-"
                  + pendingPages.get(shownPage).end
                  + (pendingEnd - pendingStart < RebuildPageLayout.MIN_PAGE_MS
                       ? ";duration_exception=owned_window_lt_1200" : "")
                   + ";page_basis=" + pendingPages.get(shownPage).timingBasis
                   : ";pagination_unresolved=true");
    detail+=";available_width_px="+inner+";measured_width_px="+Math.max(0,compact);
    if(shown.isEmpty()) {
      text.setText("");hideView();lastBlankIdentity=pendingIdentity;
      if(ownedCaption && !reason.isEmpty())presentationDiagnostics(a,pendingText,preferred,inner,pendingEnd-pendingStart,reason);
      if(mode.equals("overflow_status") && !detail.equals(lastNotice))CaptionDiagnostics.mark(a,"REBUILD_LAYOUT_FALLBACK",detail+";reason="+reason);
      lastNotice=detail;displayResult(a,mode,reason,false,inner,size,detail);return;
    }
    lastBlankIdentity=null;
    GradientDrawable bg=new GradientDrawable();bg.setColor(SubtitleStyleMetrics.alpha(cfg.backgroundOpacity)<<24);
    bg.setCornerRadius(dp(a,4));text.setBackground(bg);
    // Time and owner are sampled again at UI application, after potentially expensive layout.
    if(currentGuard!=null) {
      if(!currentGuard.isValid()){text.setText("");hideView();displayResult(a,"empty","owner_invalid",false,inner,size,detail);return;}
      long latest=currentGuard.displayPosition(pendingPosition);
      if(pendingStart>=0 && pendingEnd>pendingStart && (latest<pendingStart || latest>=pendingEnd)) {
        pendingPosition=latest;text.setText("");shownPage=-1;hideView();dirty=true;
        displayResult(a,"empty","outside_owned_window",false,inner,size,"");return;
      }
      int page=RebuildPageLayout.indexAt(pendingPages,latest);
      boolean correction=ownedCaption && (page!=shownPage || candidate && pendingCandidate.end-latest<RebuildPageLayout.MIN_PAGE_MS);
      pendingPosition=latest;
      if(correction) {
        dirty=true;
        if(!reconcilingDisplayTime){reconcilingDisplayTime=true;try{render();}finally{reconcilingDisplayTime=false;}}
        else {text.setText("");hideView();requestPlayerRender();}
        return;
      }
    }
    int height = text.getMeasuredHeight();
    if(ownedCaption && height>b.height()) {
      text.setText("");hideView();presentationDiagnostics(a,shown,size,inner,pendingEnd-pendingStart,"hard_textview_geometry");
      displayResult(a,"empty","hard_textview_geometry",false,inner,size,detail);return;
    }
    if(candidate && pendingCandidate!=null)detail+=";candidate_from="+pendingCandidate.from+";candidate_to="+pendingCandidate.to
        +";candidate_onset="+pendingCandidate.right.start;
    if(ownedCaption)presentationDiagnostics(a,shown,size,compact-text.getPaddingLeft()-text.getPaddingRight(),
        pendingPages.get(shownPage).end-pendingPages.get(shownPage).start,"");
    boolean landscape = b.width() > b.height();
    float y =
        CaptionSurface.isShorts()
            ? DeepSeekConfig.shortsPosition(a)
            : DeepSeekConfig.captionPositionY(a, landscape);
    int topMargin = Math.max(b.top, Math.min(b.bottom - height, b.top + Math.round(b.height() * y) - height / 2));
    // The surface rectangle is in physical host coordinates, never logical start/end coordinates.
    CaptionHorizontalPlacement.place(host,anchor,b,width,height,topMargin);
    if(anchor.getVisibility() != View.VISIBLE) {
      anchor.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
      anchor.setVisibility(View.VISIBLE);
    }
    final long appliedOwner=CaptionPlayerAuthority.ownerEpoch(), appliedRender=playerRenderEpoch;
    final String appliedIdentity=pendingIdentity;
    final RenderGuard appliedGuard=currentGuard;
    horizontalPlacement.observe(a,b,shorts?"shorts":fullScreen?"fullscreen":"detail",
        appliedGuard==null?"":appliedGuard.session(),appliedOwner,appliedRender,
        ()->appliedOwner==CaptionPlayerAuthority.ownerEpoch() && appliedRender==playerRenderEpoch
            && appliedIdentity.equals(pendingIdentity) && appliedGuard==currentGuard
            && (appliedGuard==null || appliedGuard.isValid()) && !suppressed() && !guardedExpansion());
    if((mode.equals("original_fallback") || mode.equals("overflow_status")) && !detail.equals(lastNotice))
      CaptionDiagnostics.mark(a,"REBUILD_LAYOUT_FALLBACK",detail);
    lastNotice=detail;
    displayResult(a,mode,pendingWaiting ? "pending_translation" : "",true,inner,size,detail);
  }

  /** Complete TextView measure, with at most one retry at the already approved maximum width. */
  private static int measureComplete(TextView text,String shown,float size,int inner,CaptionRenderSpec spec,boolean strict) {
    int padding=text.getPaddingLeft()+text.getPaddingRight();
    int compact=compactWidthPx(shown,size,inner,spec)+padding;
    return measureCompleteAtWidth(text,shown,inner,spec,strict,compact);
  }
  static long textMeasureCalls;
  static int measureCompleteAtWidth(TextView text,String shown,int inner,CaptionRenderSpec spec,boolean strict,int compact) {
    int padding=text.getPaddingLeft()+text.getPaddingRight();
    text.setText(shown);
    for(int pass=0;pass<2;pass++) {
      text.setMaxWidth(compact);text.getLayoutParams().width=compact;
      textMeasureCalls++;
      text.measure(View.MeasureSpec.makeMeasureSpec(compact,View.MeasureSpec.EXACTLY),
          View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
      if(!strict || spec.fits(shown,text.getLayout(),compact-padding,2))return compact;
      if(compact==inner+padding)break;
      compact=inner+padding;
    }
    return -1;
  }
  private static void mergeRejected(Activity a,String why) {
    String key=pendingIdentity+"|"+why;
    if(key.equals(lastMergeNotice))return;lastMergeNotice=key;
    CaptionDiagnostics.mark(a,"REBUILD_DISPLAY_OBSERVATION","id="+pendingIdentity
        +";reason=merge_rejected_keep_primary;detail="+why+";render_position="+pendingPosition);
  }
  private static void displayResult(Activity a,String mode,String reason,boolean visible,int width,float size,String detail) {
    if(a==null)return;
    TextView view=textRef.get();String shown=visible && view!=null ? view.getText().toString() : "";
    String key=pendingIdentity+"|"+mode+"|"+reason+"|"+visible+"|"+shown+"|"+shownPage+"|"+width+"|"+size;
    if(key.equals(lastDisplayResult))return;lastDisplayResult=key;
    String result=(detail.isEmpty()?"id="+pendingIdentity+";mode="+mode:detail)
        +";ui_applied=true;visible="+visible+";reason="+reason+";render_position="+pendingPosition
        +";window="+pendingStart+"-"+pendingEnd+";applied_wall_ms="+System.currentTimeMillis()
        +";applied_uptime_ms="+SystemClock.uptimeMillis()+";dispatch_uptime_ms="+renderStartedUptime
         +";layout_cost_ms="+Math.max(0,SystemClock.uptimeMillis()-renderStartedUptime)+";presentation_revision=n36-player-authority-v1"
        +";text="+shown;
    CaptionCredentialRef credential=currentGuard==null?CaptionCredentialRef.NONE:currentGuard.credential();
    // Records for the same event, page and applied geometry are one stable observation: they merge in
    // the bounded queue and are exported once with their total count, keeping the first display and any
    // real state change exact.
    String recordKey="DISPLAY|"+pendingIdentity+"|"+shownPage+"|"+mode+"|"+reason+"|"+visible+"|"+width+"|"+size;
    if(DeepSeekConfig.displayTextDebugEnabled(a))CaptionDiagnostics.mark(a,"REBUILD_PRESENTED",result,credential,recordKey);
    CaptionDiagnostics.mark(a,"REBUILD_DISPLAY_RESULT",result,credential,recordKey);
  }

  private static void presentationDiagnostics(Activity a,String shown,float size,int width,
      long duration,String reason) {
    String notice=pendingIdentity+"|"+pendingRenderSpec.targetCode+"|"+shown+"|"+size+"|"+width
        +"|"+duration+"|"+reason+"|"+shownPage;
    if(notice.equals(lastPresentationNotice)) return;
    lastPresentationNotice=notice;
    String detail="id="+pendingIdentity+";"+pendingRenderSpec.fields(shown,duration,size,width);
    if(!pendingRenderSpec.legacy && !pendingPages.isEmpty()) detail+=";"+CaptionLanguagePager.seamSummary(pendingText,pendingPages,
        new CaptionOverlay.LayoutBudget(width,size,size,pendingRenderSpec),pendingRenderSpec);
    if(!reason.isEmpty()) CaptionDiagnostics.mark(a,"REBUILD_PRESENTATION_HARD_REJECT",
        detail+";hard_reject=true;reason="+reason);
    else {
      CaptionDiagnostics.mark(a,"REBUILD_PRESENTATION",detail+";hard_reject=false");
      String watch=pendingRenderSpec.watches(shown,duration,size,width);
      if(!watch.isEmpty()) CaptionDiagnostics.mark(a,"REBUILD_PRESENTATION_WATCH",
          detail+";advisory_only=true;watch="+watch+";repair_candidate=false");
    }
  }

  static int compactWidth(Context a, String value, float sp, int maximum) {
    return compactWidthPx(value,TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_SP,sp,a.getResources().getDisplayMetrics()),maximum);
  }

  static int compactWidthPx(String value, float sizePx, int maximum) {
    int target = linesPx(value,sizePx,maximum), low=1, high=maximum;
    while(low<high){int mid=(low+high)/2;if(linesPx(value,sizePx,mid)<=target)high=mid;else low=mid+1;}
    return Math.min(maximum,low+1); // one pixel rounding guard; never omit text
  }

  static int compactWidthPx(String value,float sizePx,int maximum,CaptionRenderSpec spec) {
    if(spec.legacy) return compactWidthPx(value,sizePx,maximum);
    int target=spec.layout(value,sizePx,maximum).getLineCount(),low=1,high=maximum;
    while(low<high) {
      int mid=(low+high)/2;
      if(spec.fits(value,sizePx,mid,target)) high=mid; else low=mid+1;
    }
    int result=Math.min(maximum,low+1);
    return spec.fits(value,sizePx,result,target) ? result : maximum;
  }
  static int linesPx(String value,float sizePx,int width,CaptionRenderSpec spec) {
    return spec.layout(value,sizePx,width).getLineCount();
  }

  static int lines(Context a, String s, float sp, int width) {
    return linesPx(s,TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_SP,sp,a.getResources().getDisplayMetrics()),width);
  }

  static int linesPx(String s, float sizePx, int width) {
    android.text.TextPaint paint = new android.text.TextPaint(Paint.ANTI_ALIAS_FLAG);
    paint.setTypeface(Typeface.DEFAULT);
    paint.setTextSize(sizePx);
    return StaticLayout.Builder.obtain(s, 0, s.length(), paint, Math.max(1, width))
        .setIncludePad(false)
        .setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED)
        .setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE)
        .build()
        .getLineCount();
  }

  private static boolean drag(View v, MotionEvent e) {
    Activity a = activityRef.get();
    if (a == null || previous.height() <= 0 || !anchorVisible()
        || suppressed() || guardedExpansion()) { dragging=false; return false; }
    switch (e.getActionMasked()) {
      case MotionEvent.ACTION_DOWN:
        downY = e.getRawY();
        downAt = SystemClock.uptimeMillis();
        dragging = false;
        initial =
            CaptionSurface.isShorts()
                ? DeepSeekConfig.shortsPosition(a)
                : DeepSeekConfig.captionPositionY(a, previous.width() > previous.height());
        return true;
      case MotionEvent.ACTION_MOVE:
        if (!dragging && SystemClock.uptimeMillis() - downAt >= 350) {
          dragging = true;
          v.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
        }
        if (dragging) {
          float y =
              Math.max(.08f, Math.min(.92f, initial + (e.getRawY() - downY) / previous.height()));
          if (CaptionSurface.isShorts()) DeepSeekConfig.saveShortsPosition(a, y);
          else DeepSeekConfig.saveCaptionPosition(a, previous.width() > previous.height(), y);
          dirty = true;
          render();
        }
        return true;
      case MotionEvent.ACTION_UP:
      case MotionEvent.ACTION_CANCEL:
        dragging = false;
        return true;
      default:
        return false;
    }
  }

  private static int dp(Context c, float x) {
    return Math.round(x * c.getResources().getDisplayMetrics().density);
  }
}
