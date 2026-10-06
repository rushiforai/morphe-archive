package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.view.View;

import java.lang.ref.WeakReference;

/**
 * Keeps extension work out of YouTube's player transition critical path.
 *
 * <p>N36: this class no longer owns player state. It consumes {@link CaptionPlayerAuthority} and owns
 * exactly one revocable read-only probe per owner epoch. Every probe exit path (owner change, decor
 * disappearance, token change, timeout, completion) releases its own slot, and a cleanup only clears
 * the slot it owns, so an old probe can never clear a newer one.</p>
 */
final class CaptionPlayerTransitionGuard {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final String[] PLAYER_IDS = {
            "inset_overlay_view_layout", "player_overlays", "player_overlay", "watch_player"
    };
    private static final int MIN_OBSERVATION_FRAMES = 3;
    private static final int NO_MOTION_FALLBACK_FRAMES = 3;
    private static final int STABLE_FRAMES_REQUIRED = 2;
    private static final int MAX_OBSERVATION_FRAMES = 12;
    private static final int PIXEL_TOLERANCE = 1;
    /** A probe that cannot start must not hold the only restore slot while the owner changes. */
    private static final Runnable NO_OP = () -> {};

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static long ownerEpoch = -1;
    private static long generation;
    private static Probe pendingProbe;
    private static String probeTargetType = "";
    private static boolean probeRestoresOverlay;
    private static WeakReference<View> playerRectView = new WeakReference<>(null);
    static long observedFrameCount, probeNanos;
    private static WeakReference<View> observedPlayerView = new WeakReference<>(null);
    private static WeakReference<View> recoveryLayoutRoot = new WeakReference<>(null);
    private static boolean awaitingPlayerChild;
    /**
     * A real layout event is only a wake-up. Restore permission still requires this owner to expose a
     * proven current player surface, so an unrelated decor relayout cannot award the restore slot.
     */
    private static final View.OnLayoutChangeListener RECOVERY_LAYOUT =
            (v,l,t,r,b,oldL,oldT,oldR,oldB) -> {
                if(!awaitingPlayerChild||pendingProbe!=null)return;
                if(!ownerSurfaceStable())return;
                awardRestore();
            };
    private static void removeRecoveryLayout(){
        View v=recoveryLayoutRoot.get();
        if(v!=null)v.removeOnLayoutChangeListener(RECOVERY_LAYOUT);
        recoveryLayoutRoot.clear();
    }
    /**
     * Waits for one real layout event on the highest view of the current player subtree that is still
     * attached. The decor frame alone is not evidence that the player child came back, so the listener
     * is placed below it whenever a player subtree is still reachable.
     */
    private static void awaitValidLayout(View decorRoot){
        removeRecoveryLayout();
        View target=playerSubtreeRoot(decorRoot);
        if(target==null){awaitingPlayerChild=false;return;}
        recoveryLayoutRoot=new WeakReference<>(target);
        target.addOnLayoutChangeListener(RECOVERY_LAYOUT);
        awaitingPlayerChild=true;
    }

    private static View playerSubtreeRoot(View decorRoot){
        View player=playerRectView.get();
        if(player==null)player=observedPlayerView.get();
        View highest=null;
        for(View current=player;current!=null;current=current.getParent() instanceof View
                ?(View)current.getParent():null){
            if(current==decorRoot)break;
            highest=current;
        }
        return highest==null?decorRoot:highest;
    }

    private CaptionPlayerTransitionGuard() {}

    static void setActivity(Activity activity) {
        removeRecoveryLayout();
        activityRef = new WeakReference<>(activity);
        ownerEpoch = -1;
        revokeProbe();
        awaitingPlayerChild = false;
        playerRectView.clear();
        observedPlayerView.clear();
    }

    /**
     * One player notification on the main thread. Authority merge only plus constant-time bookkeeping;
     * no tree scan, no font measurement, no network and no keystore work happens here.
     */
    static void onPlayerType(String rawType) {
        onPlayerType(rawType, false);
    }

    static void onPlayerType(String rawType, boolean outer) {
        Activity activity = activityRef.get();
        if (activity != null && activity != CaptionPlayerAuthority.activity())
            CaptionPlayerAuthority.setOwner(activity);
        long currentEpoch = CaptionPlayerAuthority.ownerEpoch();
        if (currentEpoch != ownerEpoch) {
            ownerEpoch = currentEpoch;
            revokeProbe();
            awaitingPlayerChild = false;
            playerRectView.clear();
            observedPlayerView.clear();
        }
        boolean installed = listenerInstalled;
        CaptionPlayerAuthority.onNotification(rawType, outer);
        // The authority state change arrives through the listener registration; if the listener is not
        // installed yet (first notification of a cold owner) drive the coordinator directly.
        if (!installed) onAuthorityChanged();
    }

    private static boolean listenerInstalled;
    private static final CaptionPlayerAuthority.Listener AUTHORITY_LISTENER =
            CaptionPlayerTransitionGuard::onAuthorityChanged;
    static void installAuthorityListener(){
        listenerInstalled=true;
        CaptionPlayerAuthority.addListener(AUTHORITY_LISTENER);
    }

    /** Called on the main thread after the authority merged a notification or changed owner/state. */
    static void onAuthorityChanged(){
        // Permission denial retracts an existing paint in this very commit, not at the next tick.
        // Passing the current epoch prevents delayed cleanup of an old owner hiding a newer one.
        if(!CaptionPlayerAuthority.displayPermitted())
            CaptionOverlay.denyDisplay(CaptionPlayerAuthority.ownerEpoch());
        // A cleared authority also clears this coordinator: a stale Activity reference must never be
        // re-declared as the owner of a later session.
        if(CaptionPlayerAuthority.activity()==null){
            activityRef=new WeakReference<>(null);
            ownerEpoch=-1;
            revokeProbe();
            awaitingPlayerChild=false;
            playerRectView.clear();
            observedPlayerView.clear();
            return;
        }
        String type=CaptionPlayerAuthority.playerType();
        int state=CaptionPlayerAuthority.state();
        CaptionMusicSuppressor.pauseDiscoveryForPlayerTransition(true);
        CaptionMusicSuppressor.beginNativeRendererTransition();
        CaptionButtonController.onPlayerTransition(type);
        CaptionLifecycleRestore.onPlayerTransition(type);

        if(state==CaptionPlayerAuthority.COMPACT){
            revokeProbe();
            awaitingPlayerChild=false;
            if(CaptionPlayerAuthority.ownerValid())
                awaitValidLayout(CaptionPlayerAuthority.decorView());
            CaptionMusicSuppressor.endNativeRendererTransition();
            return;
        }
        if(state==CaptionPlayerAuthority.CLOSED||state==CaptionPlayerAuthority.UNKNOWN){
            revokeProbe();
            CaptionMusicSuppressor.endNativeRendererTransition();
            return;
        }
        // TRANSITIONING_TO_REGULAR and REGULAR both rely on real geometry. A REGULAR owner without a
        // compact predecessor still runs one bounded observation so the first paint is not guessed.
        if(state==CaptionPlayerAuthority.REGULAR){
            // No compact predecessor: the authoritative non-compact type is already decisive, so no
            // geometry observation is started. One frame-aligned render keeps the visible caption on
            // the newly reported player mode and the coordinator returns to idle.
            revokeProbe();
            awaitingPlayerChild=false;
            removeRecoveryLayout();
            CaptionOverlay.requestPlayerRender();
            CaptionButtonController.onPlayerStable();
            CaptionMusicSuppressor.endNativeRendererTransition();
            return;
        }
        if(!ownerSurfaceStable())return;
        if(pendingProbe!=null)return;
        startReadOnlyProbe(type,true);
    }

    /** Cached read-only player view, refreshed only when the owner or the cached view is gone. */
    static View playerView(){
        Activity activity=activityRef.get();
        if(activity==null||activity.isFinishing()||activity.getWindow()==null)return null;
        View cached=playerRectView.get();
        if(cached!=null&&cached.isAttachedToWindow()&&cached.isShown())return cached;
        readPlayerRect(activity);
        return playerRectView.get();
    }

    /**
     * A bounded observation may only start when this owner still has proven, current player geometry.
     * The player view is read from the cached discovery and a missing cache means the last real render
     * already hid this surface. There is no per-frame decor walk here.
     */
    private static boolean ownerSurfaceStable(){
        // The same visibility rule the overlay uses, so a hidden player container can never be
        // mistaken for a settled surface and a stale rectangle is never reused.
        return CaptionSurface.visible(playerView());
    }

    private static void revokeProbe(){
        generation++;
        pendingProbe=null;
        probeTargetType="";
        probeRestoresOverlay=false;
        observedPlayerView.clear();
        playerRectView.clear();
    }

    /** The bounded observation completed: hand the display permission decision to the authority. */
    private static void awardRestore(){
        if(pendingProbe!=null)return;
        removeRecoveryLayout();
        awaitingPlayerChild=false;
        CaptionPlayerAuthority.settleRegular();
        CaptionButtonController.onPlayerStable();
        CaptionMusicSuppressor.endNativeRendererTransition();
        Activity activity=activityRef.get();
        if(activity!=null)CaptionDiagnostics.mark(activity,"PLAYER_TRANSITION_STABLE",
            "type="+CaptionPlayerAuthority.playerType()+";state="+CaptionPlayerAuthority.stateName()
                +";geometry_probe_total_us="+(probeNanos/1000)+";overlay_restore="+probeRestoresOverlay
                +";"+CaptionPlayerAuthority.shortId());
    }

    private static void startReadOnlyProbe(String targetType,boolean restoresOverlay){
        final long token=++generation;
        Activity activity=activityRef.get();
        if(activity==null||activity.isFinishing()||activity.getWindow()==null){
            // Missing owner is not permission to display at an unverified location.
            observedPlayerView.clear();
            CaptionMusicSuppressor.endNativeRendererTransition();
            return;
        }
        Probe probe=new Probe(token,targetType,restoresOverlay);
        pendingProbe=probe;
        probeTargetType=targetType;
        probeRestoresOverlay=restoresOverlay;
        android.view.Choreographer.getInstance().postFrameCallback(probe);
    }

    private static void finish(Probe probe,int observedFrames){
        if(probe.token!=generation||pendingProbe!=probe)return;
        long frameSpan=Math.max(0,probe.lastFrameNanos-probe.firstFrameNanos);
        pendingProbe=null;
        removeRecoveryLayout();
        awaitingPlayerChild=false;
        CaptionPlayerAuthority.settleRegular();
        CaptionButtonController.onPlayerStable();
        CaptionMusicSuppressor.endNativeRendererTransition();
        Activity activity=activityRef.get();
        if(activity!=null&&DynamicCaptionController.isVisibleActive()){
            CaptionDiagnostics.mark(activity,"PLAYER_TRANSITION_STABLE",
                "type="+CaptionPlayerAuthority.playerType()+";observed_frames="+observedFrames
                    +";observed_frame_ns="+frameSpan+";geometry_probe_total_us="+(probeNanos/1000)
                    +";overlay_restore="+probe.delayedOverlayRestore+";state="+CaptionPlayerAuthority.stateName()
                    +";"+CaptionPlayerAuthority.shortId());
        }
    }

    /**
     * A proven player snapshot: the view that produced the rectangle plus its current rect. Holding the
     * view keeps the rect and the identity consistent, so a cached rectangle is never paired with a
     * different surface.
     */
    private static final class PlayerSnapshot {
        final View view;
        final Rect rect;
        PlayerSnapshot(View view,Rect rect){this.view=view;this.rect=rect;}
    }

    private static PlayerSnapshot readPlayerRect(Activity activity) {
        View root=activity==null?null:activity.getWindow()==null?null:activity.getWindow().getDecorView();
        if(root==null)return null;
        View cached=playerRectView.get();
        if(cached!=null&&CaptionSurface.visible(cached)){
            Rect rect=new Rect();
            if(cached.getGlobalVisibleRect(rect)&&rect.width()>1&&rect.height()>1)
                return new PlayerSnapshot(cached,rect);
        }
        View previous=observedPlayerView.get();
        if(previous!=null&&CaptionSurface.visible(previous)){
            Rect rect=new Rect();
            if(previous.getGlobalVisibleRect(rect)&&rect.width()>1&&rect.height()>1){
                playerRectView=new WeakReference<>(previous);
                return new PlayerSnapshot(previous,rect);
            }
        }
        View bestView=null;
        Rect best=null;
        long bestArea=-1L;
        for(String name:PLAYER_IDS){
            int id;
            try { id=activity.getResources().getIdentifier(name,"id",activity.getPackageName()); }
            catch(Throwable ignored){ continue; }
            if(id==0)continue;
            View candidate=root.findViewById(id);
            if(!CaptionSurface.visible(candidate))continue;
            Rect rect=new Rect();
            if(!candidate.getGlobalVisibleRect(rect)||rect.width()<=1||rect.height()<=1)continue;
            long area=(long)rect.width()*rect.height();
            if(area>bestArea){bestArea=area;best=rect;bestView=candidate;}
        }
        if(bestView==null)return null;
        playerRectView=new WeakReference<>(bestView);
        observedPlayerView=new WeakReference<>(bestView);
        return new PlayerSnapshot(bestView,best);
    }

    private static boolean nearlySame(Rect a,Rect b){
        if(a==null||b==null)return false;
        return Math.abs(a.left-b.left)<=PIXEL_TOLERANCE&&Math.abs(a.top-b.top)<=PIXEL_TOLERANCE
            &&Math.abs(a.right-b.right)<=PIXEL_TOLERANCE&&Math.abs(a.bottom-b.bottom)<=PIXEL_TOLERANCE;
    }

    private static final class Probe implements Runnable, android.view.Choreographer.FrameCallback {
        final long token;
        final String targetType;
        final boolean delayedOverlayRestore;
        int frames;
        int stableFrames;
        boolean sawMotion;
        long firstFrameNanos,lastFrameNanos;
        Rect previous;

        Probe(long token,String targetType,boolean delayedOverlayRestore){
            this.token=token;
            this.targetType=targetType;
            this.delayedOverlayRestore=delayedOverlayRestore;
        }

        @Override public void doFrame(long frameTimeNanos){
            lastFrameNanos=frameTimeNanos;
            if(firstFrameNanos==0)firstFrameNanos=frameTimeNanos;
            run();
        }

        @Override public void run(){
            if(token!=generation||pendingProbe!=this)return;
            Activity activity=activityRef.get();
            if(activity==null||activity.isFinishing()||activity.getWindow()==null){
                // Owner disappeared mid-observation: release this probe's slot, keep quarantine.
                releaseProbe();
                awaitingPlayerChild=true;
                CaptionMusicSuppressor.endNativeRendererTransition();
                return;
            }
            long started=System.nanoTime();
            PlayerSnapshot snapshot=readPlayerRect(activity);
            probeNanos+=System.nanoTime()-started;
            Rect current=snapshot==null?null:snapshot.rect;
            frames++;observedFrameCount++;
            if(current!=null&&previous!=null){
                if(nearlySame(previous,current))stableFrames++;
                else {sawMotion=true;stableFrames=0;}
            } else stableFrames=0;
            previous=current==null?null:new Rect(current);

            boolean enoughFrames=frames>=MIN_OBSERVATION_FRAMES;
            boolean stable=enoughFrames&&stableFrames>=STABLE_FRAMES_REQUIRED
                &&(sawMotion||frames>=NO_MOTION_FALLBACK_FRAMES);
            if(stable){finish(this,frames);return;}
            if(frames>=MAX_OBSERVATION_FRAMES){
                // End this observation and release the slot. Keep the safe blank surface and wait for a
                // real player-subtree attach/layout or one new authoritative notification; no forced
                // restore at the ceiling and no permanent polling.
                releaseProbe();
                awaitValidLayout(CaptionPlayerAuthority.decorView());
                CaptionMusicSuppressor.endNativeRendererTransition();
                CaptionButtonController.onPlayerStable();
                CaptionDiagnostics.mark(activity,"PLAYER_TRANSITION_SAFE_BLANK",
                    "reason=geometry_not_stable;observed_frames="+frames
                        +";state="+CaptionPlayerAuthority.stateName()+";"+CaptionPlayerAuthority.shortId());
                return;
            }
            android.view.Choreographer.getInstance().postFrameCallback(this);
        }

        private void releaseProbe(){
            if(pendingProbe==this)pendingProbe=null;
        }
    }

    /** Test-only reset so each fixture starts from a clean probe slot. */
    static void resetForTests(){
        removeRecoveryLayout();
        activityRef=new WeakReference<>(null);
        ownerEpoch=-1;
        generation=0;
        pendingProbe=null;
        probeTargetType="";
        probeRestoresOverlay=false;
        awaitingPlayerChild=false;
        playerRectView.clear();
        observedPlayerView.clear();
        observedFrameCount=0;
        probeNanos=0;
        if(listenerInstalled){CaptionPlayerAuthority.removeListener(AUTHORITY_LISTENER);listenerInstalled=false;}
    }

    static boolean probePending(){return pendingProbe!=null;}
    static boolean awaitingPlayerChild(){return awaitingPlayerChild;}
}
