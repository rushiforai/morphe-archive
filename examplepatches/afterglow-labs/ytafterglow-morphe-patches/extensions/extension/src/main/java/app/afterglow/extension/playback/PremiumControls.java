package app.afterglow.extension.playback;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.SystemClock;
import android.view.View;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.ui.PremiumControlsSheet;
import app.afterglow.extension.video.PlayerController;
import app.afterglow.extension.video.PlayerType;
import app.afterglow.extension.video.VideoState;

/** Explicit sheet actions share the current native player and never address a preloaded video. */
public final class PremiumControls {
    public interface Transport extends PauseOnOverlay.Controller {
        View afterglow_nextButton();
        String afterglow_transportVideoId();
        Object afterglow_transportPlayer();
        /** Native play/pause button state: -1 unavailable, 0 paused, 1 playing. */
        int afterglow_transportPlaying();
        void afterglow_prepareTransport();
        void afterglow_selectPlaybackSpeed(float speed);
    }
    public interface StableVolume {
        Object afterglow_stablePlayer();
        String afterglow_stableVideoId();
        /** Negative values diagnose unavailable support; 0/1 are the actual off/on state. */
        int afterglow_stableState();
        void afterglow_toggleStableVolume();
    }
    public interface StableVolumeProvider {
        Object afterglow_stableProviderPlayer();
        StableVolume afterglow_createStableVolume();
    }
    private static final List<WeakReference<Transport>> TRANSPORTS = new ArrayList<>();
    private static final List<WeakReference<StableVolume>> VOLUMES = new ArrayList<>();
    private static final List<WeakReference<StableVolumeProvider>> VOLUME_PROVIDERS = new ArrayList<>();
    private PremiumControls() {}

    public static void bindTransport(Transport value) {
        Afterglow.runOnMain(() -> remember(TRANSPORTS, value));
    }
    public static void bindStableVolume(StableVolume value) {
        Afterglow.runOnMain(() -> remember(VOLUMES, value));
    }
    public static void bindStableVolumeProvider(StableVolumeProvider value) {
        Afterglow.runOnMain(() -> {
            remember(VOLUME_PROVIDERS,value);
            DebugLog.write("premium-controls","Stable volume provider captured; retained="+VOLUME_PROVIDERS.size());
        });
    }
    private static <T> void remember(List<WeakReference<T>> list, T value) {
        if (value == null) return;
        list.removeIf(ref -> ref.get() == null || ref.get() == value);
        list.add(new WeakReference<>(value));
        while (list.size() > 8) list.remove(0);
    }
    public static void open(Activity activity) {
        Afterglow.runOnMain(() -> {
            if (!InstalledTweaks.has("overlay-buttons") || !LiteMode.effectiveBool("controlsSheetButton")) return;
            Session session = new Session(activity);
            if(session.active())session.prepareTransport();
            if (session.active()) PremiumControlsSheet.show(activity, session);
        });
    }
    // Filled by the original Morphe Video information helper; no second metadata parser.
    private static String nativeMetadataId() { return ""; }
    private static String nativeTitle() { return ""; }
    private static String nativeChannel() { return ""; }
    // Filled with the installed native speed-menu user-selection observers.
    private static void nativeSpeedSelected(float speed) {}

    private static Activity activityOf(Context context) {
        for (int count = 0; context != null && count < 12; count++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) return null;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) return null;
            context = next;
        }
        return null;
    }
    private static void failure(String action, Throwable error) {
        DebugLog.write("premium-controls", action + " unavailable: " + error.getClass().getSimpleName());
    }

    /** One presentation belongs to one native director/video, including queued fullscreen work. */
    public static final class Session {
        private final Activity activity;
        private final PlayerController player;
        private final String video;
        private final OverlayLockRequest lockRequest = new OverlayLockRequest();
        private OverlayActionController ownedLock;
        private StableVolume ownedVolume;
        private String stableDiagnostic="";
        private WeakReference<View> window = new WeakReference<>(null);
        private boolean closed;

        Session(Activity activity) {
            this.activity = activity;
            player = VideoState.currentController();
            video = VideoState.videoId();
        }
        public String videoId() { return video; }
        public void attachWindow(View view) { window = new WeakReference<>(view); }
        private boolean actionReady() {
            View view = window.get();
            return active() && view != null && view.isAttachedToWindow() && view.hasWindowFocus();
        }
        public boolean active() {
            return !closed && activity != null && activity == Afterglow.mainActivity()
                    && !activity.isFinishing() && !activity.isDestroyed()
                    && player != null && player == VideoState.currentController()
                    && !video.isEmpty() && video.equals(VideoState.videoId())
                    && VideoState.playerType().isMaximizedOrFullscreen()
                    && !VideoState.isShortsPlayerInFront() && !VideoState.isAdPlaying();
        }
        public String title() {
            try { return active() && video.equals(nativeMetadataId()) ? nativeTitle() : ""; }
            catch (Throwable error) { failure("Title", error); return ""; }
        }
        public String channel() {
            try { return active() && video.equals(nativeMetadataId()) ? nativeChannel() : ""; }
            catch (Throwable error) { failure("Channel", error); return ""; }
        }
        private Transport transport() {
            if (!active()) return null;
            for (int i = TRANSPORTS.size() - 1; i >= 0; i--) {
                Transport owner = TRANSPORTS.get(i).get();
                if (owner == null) continue;
                View root = owner.afterglow_overlayRoot();
                if (root != null && root.isAttachedToWindow() && activityOf(root.getContext()) == activity
                        && video.equals(owner.afterglow_transportVideoId())) return owner;
            }
            return null;
        }
        private void prepareTransport() {
            try {
                Transport owner=transport();
                if(owner!=null)owner.afterglow_prepareTransport();
            }catch(Throwable error){failure("Prepare native controls",error);}
        }
        private StableVolume volume() {
            Transport transport = transport();
            if (transport == null) { stableDiagnostic("no current transport"); return null; }
            Object player = transport.afterglow_transportPlayer();
            if (player == null) { stableDiagnostic("no native facade"); return null; }
            if(ownedVolume!=null&&ownedVolume.afterglow_stablePlayer()==player
                    &&video.equals(ownedVolume.afterglow_stableVideoId()))return ownedVolume;
            ownedVolume=null;
            for (int i = VOLUMES.size() - 1; i >= 0; i--) {
                StableVolume owner = VOLUMES.get(i).get();
                if (owner != null && owner.afterglow_stablePlayer() == player
                        && video.equals(owner.afterglow_stableVideoId())) return ownedVolume=owner;
            }
            // Native command handlers are lazy. Opening More renders its state without
            // constructing this handler, so ask its exact native provider on first use.
            int liveProviders=0,matchingProviders=0,createdOwners=0;
            for(int i=VOLUME_PROVIDERS.size()-1;i>=0;i--){
                StableVolumeProvider provider=VOLUME_PROVIDERS.get(i).get();
                if(provider==null)continue;
                liveProviders++;
                if(provider.afterglow_stableProviderPlayer()!=player)continue;
                matchingProviders++;
                StableVolume owner=provider.afterglow_createStableVolume();
                if(owner!=null)createdOwners++;
                if(owner!=null&&owner.afterglow_stablePlayer()==player
                        &&video.equals(owner.afterglow_stableVideoId()))return ownedVolume=owner;
            }
            stableDiagnostic("owner missing; commands="+VOLUMES.size()+", providers="+liveProviders
                    +", matching="+matchingProviders+", created="+createdOwners);
            return null;
        }
        private void stableDiagnostic(String state) {
            if(state.equals(stableDiagnostic))return;
            stableDiagnostic=state;
            DebugLog.write("premium-controls","Stable volume "+state);
        }
        private OverlayActionController overlay() {
            return active() ? OverlayButtons.controllerForSheet(activity) : null;
        }
        public boolean playing() {
            try { Transport owner=transport();return owner!=null&&owner.afterglow_transportPlaying()==1; }
            catch(Throwable error){failure("Play state",error);return false;}
        }
        public boolean canPlay() {
            try {
                Transport owner=transport();
                return owner!=null&&owner.afterglow_transportPlaying()>=0;
            } catch (Throwable error) { failure("Play", error); return false; }
        }
        public boolean togglePlaying() {
            try {
                Transport owner = transport();
                if(!actionReady()||owner==null)return false;
                int state=owner.afterglow_transportPlaying();
                return state>=0&&owner.afterglow_overlaySetPlaying(state==0);
            } catch (Throwable error) { failure("Play", error); return false; }
        }
        public boolean restart() { return actionReady() && VideoState.seekTo(0); }
        public boolean skip(long milliseconds) {
            return actionReady() && (milliseconds == -10000 || milliseconds == 10000)
                    && VideoState.seekToRelative(milliseconds);
        }
        public float speed() { return VideoState.playbackSpeed(); }
        public boolean speed(float value) {
            try {
                if (!actionReady() || value < .25f || value > 5f || !Float.isFinite(value)) return false;
                Transport owner = transport();
                if (owner == null) return false;
                nativeSpeedSelected(value);
                owner.afterglow_selectPlaybackSpeed(value);
                return true;
            } catch (Throwable error) { failure("Speed", error); return false; }
        }
        private View nextButton() {
            Transport owner = transport();
            View button = owner == null ? null : owner.afterglow_nextButton();
            return button != null && button.isAttachedToWindow() && button.isEnabled()
                    && button.hasOnClickListeners() ? button : null;
        }
        public boolean canNext() {
            try { return nextButton() != null; }
            catch (Throwable error) { failure("Next", error); return false; }
        }
        public boolean next() {
            try { View button = nextButton(); return actionReady() && button != null && button.performClick(); }
            catch (Throwable error) { failure("Next", error); return false; }
        }
        public int stableVolume() {
            try {
                StableVolume owner = volume();
                if(owner==null)return -1;
                int state=owner.afterglow_stableState();
                stableDiagnostic("current owner native state="+state);
                return state<0?-1:state;
            }
            catch (Throwable error) { failure("Stable volume", error); return -1; }
        }
        public boolean toggleStableVolume() {
            try {
                StableVolume owner = volume();
                if (!actionReady() || owner == null || owner.afterglow_stableState() < 0) return false;
                owner.afterglow_toggleStableVolume(); return true;
            } catch (Throwable error) { failure("Stable volume", error); return false; }
        }
        public int muted() {
            try { OverlayActionController owner = overlay(); return owner == null ? -1 : owner.afterglow_isMuted() ? 1 : 0; }
            catch (Throwable error) { failure("Mute", error); return -1; }
        }
        public boolean toggleMuted() {
            try {
                OverlayActionController owner = overlay();
                if (!actionReady() || owner == null) return false;
                owner.afterglow_setMuted(!owner.afterglow_isMuted()); return true;
            } catch (Throwable error) { failure("Mute", error); return false; }
        }
        public boolean canLite() { return InstalledTweaks.has("lite-mode"); }
        public boolean lite() { return canLite() && LiteMode.enabled(); }
        public boolean toggleLite() {
            if (!actionReady() || !canLite()) return false;
            AfterglowPrefs.setBool(LiteMode.KEY, !LiteMode.enabled()); return true;
        }
        public int lockState() {
            try { OverlayActionController owner = overlay(); return owner == null ? 0 : owner.afterglow_lockState(); }
            catch (Throwable error) { failure("Lock", error); return 0; }
        }
        public boolean lockPending() { return lockRequest.pending(); }
        public boolean toggleLocked() {
            try {
                OverlayActionController owner = overlay();
                if (!actionReady() || owner == null || lockPending() || owner.afterglow_lockState() == 0) return false;
                if (owner.afterglow_lockState() >= 2) {
                    owner.afterglow_setLocked(false); ownedLock = null; return true;
                }
                lockRequest.begin(owner, video, SystemClock.uptimeMillis());
                if (!Fullscreen.enterFromControlsSheet(activity)) { lockRequest.cancel(); return false; }
                advanceLock(); return true;
            } catch (Throwable error) { lockRequest.cancel(); failure("Lock", error); return false; }
        }
        private void advanceLock() {
            try {
                OverlayActionController owner = overlay();
                int result = lockRequest.advance(owner, VideoState.videoId(), SystemClock.uptimeMillis(),
                        actionReady(), true, VideoState.playerType() == PlayerType.WATCH_WHILE_FULLSCREEN);
                if (result == OverlayLockRequest.APPLY) {
                    // A native or other feature lock acquired while entering fullscreen is not ours.
                    if (owner.afterglow_lockState() == 1) { owner.afterglow_setLocked(true); ownedLock = owner; }
                } else if (result == OverlayLockRequest.WAIT) {
                    Afterglow.runOnMainDelayed(this::advanceLock, 80);
                }
            } catch (Throwable error) { lockRequest.cancel(); failure("Lock", error); }
        }
        public void close() {
            if (closed) return;
            lockRequest.cancel();
            try {
                // Release only this presentation's lock, and never apply an old request to a new video.
                if (ownedLock != null && ownedLock == OverlayButtons.controllerForSheet(activity)
                        && video.equals(ownedLock.afterglow_overlayVideoId()) && ownedLock.afterglow_lockState() >= 2)
                    ownedLock.afterglow_setLocked(false);
            } catch (Throwable error) { failure("Unlock on close", error); }
            ownedLock = null; ownedVolume=null; closed = true;
        }
    }
}
