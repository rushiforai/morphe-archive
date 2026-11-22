import java.util.HashMap;
import java.util.Map;

import com.sbs.ondemand.model.playback.PlaybackStreamProvider;
import dev.supperelias2.sbs.morphe.MorpheSettings;
import dev.supperelias2.sbs.morphe.playback.PlaybackHooks;

/** Semantic JVM checks of the actual runtime helper, with no Android SDK. */
public final class PlaybackHooksTest {
    private static int assertions;

    private static final class Flow {
        Object value;
        Flow(Object value) { this.value = value; }
        public Object getValue() { return value; }
    }

    private static final class Player {
        long position = 20_000;
        long duration = 600_000;
        boolean playing = true;
        float speed = 1f;
        public long getCurrentPosition() { return position; }
        public long getDuration() { return duration; }
        public boolean isPlaying() { return playing; }
        public void setPlaybackSpeed(float speed) { this.speed = speed; }
    }

    private static final class StreamManager {
        int mappings;
        public long getStreamTimeMsForContentTimeMs(long position) { mappings++; return position + 5_000; }
        public long getContentTimeMsForStreamTimeMs(long position) { mappings++; return position - 5_000; }
    }

    private static final class Ads {
        Object streamManager;
        final Flow _isAdPlaying = new Flow(false);
    }

    private static final class Controller {
        Object currentProvider = new PlaybackStreamProvider.AkamaiHLSProvider();
        final Flow _isMediaLive = new Flow(false);
        final Flow _currentContentId = new Flow("episode-one");
        Object parentViewModel;
    }

    private static final class Events {
        Long introEnd = 60_000L;
        Long recapEnd = 10_000L;
        final Map<String, Long> markers = new HashMap<>();
        Events() {
            markers.put("openingCreditsBegin", 10_000L);
            markers.put("openingCreditsEnd", 60_000L);
            markers.put("recapBegin", 0L);
            markers.put("recapEnd", 10_000L);
        }
        private long getEndEventTime(String type) { return markers.getOrDefault(type, Long.MAX_VALUE); }
        private long getStartEventTime(String type) { return markers.getOrDefault(type, Long.MAX_VALUE); }
        private boolean shouldShowSkipButton(String begin, String end, long position) {
            Long start = markers.get(begin);
            Long finish = markers.get(end);
            return start != null && finish != null && start <= position && position <= finish;
        }
    }

    private static final class Manager {
        Object parentViewModel;
        final Player _player = new Player();
    }

    private static final class ViewModel {
        final Controller playbackController = new Controller();
        final Events playbackEventViewModel = new Events();
        final Ads adsController = new Ads();
        final Manager playerManager = new Manager();
        boolean isSeekInProgress;
        int introSkips;
        int recapSkips;
        ViewModel() {
            playerManager.parentViewModel = this;
            playbackController.parentViewModel = this;
        }
        public void skipIntro() {
            introSkips++;
            playerManager._player.position = PlaybackHooks.skipTarget(this, playbackEventViewModel.introEnd);
            PlaybackHooks.noteIntroSkipped(this);
        }
        public void skipRecap() {
            recapSkips++;
            playerManager._player.position = PlaybackHooks.skipTarget(this, playbackEventViewModel.recapEnd);
            PlaybackHooks.noteRecapSkipped(this);
        }
    }

    private static void eq(String reason, Object expected, Object actual) {
        assertions++;
        if (!expected.equals(actual)) throw new AssertionError(reason + ": expected " + expected + ", got " + actual);
    }

    private static void skipPolicy() {
        MorpheSettings.VALUES.clear();
        ViewModel vm = new ViewModel();
        eq("direct null IMA uses marker", 60_000L, PlaybackHooks.skipTarget(vm, 60_000L));
        eq("direct analytics content position", 20_000L, PlaybackHooks.contentPosition(vm));
        StreamManager stale = new StreamManager();
        vm.adsController.streamManager = stale;
        eq("direct ignores stale IMA", 60_000L, PlaybackHooks.skipTarget(vm, 60_000L));
        eq("direct position ignores stale IMA", 20_000L, PlaybackHooks.contentPosition(vm));
        eq("stale manager never called", 0, stale.mappings);
        vm.playbackController.currentProvider = new PlaybackStreamProvider.GoogleDAIProvider();
        eq("DAI preserves mapping", 65_000L, PlaybackHooks.skipTarget(vm, 60_000L));
        eq("DAI analytics uses content time", 15_000L, PlaybackHooks.contentPosition(vm));
        vm.adsController.streamManager = null;
        eq("DAI absent manager rejects instead of zero", -1L, PlaybackHooks.skipTarget(vm, 60_000L));
        vm.playbackController.currentProvider = new PlaybackStreamProvider.AkamaiHLSProvider();
        eq("negative marker rejected", -1L, PlaybackHooks.skipTarget(vm, -1L));
        eq("zero marker rejected", -1L, PlaybackHooks.skipTarget(vm, 0L));
        eq("missing marker rejected", -1L, PlaybackHooks.skipTarget(vm, Long.MAX_VALUE));
        eq("stale marker rejected", -1L, PlaybackHooks.skipTarget(vm, 50_000L));
        vm.playbackEventViewModel.markers.put("openingCreditsBegin", 60_000L);
        eq("empty segment rejected", -1L, PlaybackHooks.skipTarget(vm, 60_000L));
        vm.playbackEventViewModel.markers.put("openingCreditsBegin", 10_000L);
        vm.playerManager._player.duration = 60_000;
        eq("marker at media end rejected", -1L, PlaybackHooks.skipTarget(vm, 60_000L));
        vm.playerManager._player.duration = -9223372036854775807L;
        eq("unknown duration rejects", -1L, PlaybackHooks.skipTarget(vm, 60_000L));
        vm.playerManager._player.duration = 600_000;
        vm.playbackController._isMediaLive.value = true;
        eq("live rejected", -1L, PlaybackHooks.skipTarget(vm, 60_000L));
        vm.playbackController._isMediaLive.value = false;
        vm.adsController._isAdPlaying.value = true;
        eq("ad rejected", -1L, PlaybackHooks.skipTarget(vm, 60_000L));
        vm.adsController._isAdPlaying.value = false;
        vm.playbackController.currentProvider = new Object();
        eq("unknown provider rejected", -1L, PlaybackHooks.skipTarget(vm, 60_000L));
        MorpheSettings.VALUES.put("fix_skip", false);
        eq("disabled fix retains null-manager zero", 0L, PlaybackHooks.skipTarget(vm, 60_000L));
        vm.adsController.streamManager = stale;
        eq("disabled fix retains original mapping", 65_000L, PlaybackHooks.skipTarget(vm, 60_000L));
    }

    private static void autoSkipPolicy() {
        MorpheSettings.VALUES.clear();
        ViewModel vm = new ViewModel();
        PlaybackHooks.attach(vm);
        PlaybackHooks.onContentTime(vm.playbackEventViewModel);
        eq("autoskip default is off", 0, vm.introSkips);
        MorpheSettings.VALUES.put("auto_skip_intro", true);
        PlaybackHooks.onContentTime(vm.playbackEventViewModel);
        eq("valid intro skipped", 1, vm.introSkips);
        eq("intro ends at marker", 60_000L, vm.playerManager._player.position);
        vm.playerManager._player.position = 20_000;
        PlaybackHooks.onContentTime(vm.playbackEventViewModel);
        eq("rewind never triggers another intro skip", 1, vm.introSkips);
        vm.playbackController._currentContentId.value = "episode-two";
        PlaybackHooks.onContentTime(vm.playbackEventViewModel);
        eq("next media may skip intro", 2, vm.introSkips);
        MorpheSettings.VALUES.put("auto_skip_recap", true);
        vm.playerManager._player.position = 1_000;
        PlaybackHooks.onContentTime(vm.playbackEventViewModel);
        eq("recap independent of intro", 1, vm.recapSkips);
        vm.playerManager._player.position = 1_000;
        PlaybackHooks.onContentTime(vm.playbackEventViewModel);
        eq("recap rewind does not retrigger", 1, vm.recapSkips);
        vm.playbackController._currentContentId.value = "episode-three";
        vm.playbackEventViewModel.markers.clear();
        vm.playerManager._player.position = 20_000;
        PlaybackHooks.onContentTime(vm.playbackEventViewModel);
        eq("no metadata means no skip", 2, vm.introSkips);
        ViewModel guarded = new ViewModel();
        PlaybackHooks.attach(guarded);
        guarded.isSeekInProgress = true;
        PlaybackHooks.onContentTime(guarded.playbackEventViewModel);
        eq("manual seek suppresses auto", 0, guarded.introSkips);
        guarded.isSeekInProgress = false;
        guarded.playerManager._player.playing = false;
        PlaybackHooks.onContentTime(guarded.playbackEventViewModel);
        eq("paused media does not auto seek", 0, guarded.introSkips);
        guarded.playerManager._player.playing = true;
        PlaybackHooks.noteIntroSkipped(guarded);
        PlaybackHooks.onContentTime(guarded.playbackEventViewModel);
        eq("manual skip followed by rewind suppresses auto", 0, guarded.introSkips);
        guarded.playbackController._currentContentId.value = "new-after-manual";
        MorpheSettings.VALUES.put("fix_skip", false);
        PlaybackHooks.onContentTime(guarded.playbackEventViewModel);
        eq("auto requires corrected runtime skip", 0, guarded.introSkips);
    }

    private static void seekPolicy() {
        MorpheSettings.VALUES.clear();
        eq("back defaults to 15 seconds", 15_000, PlaybackHooks.backMillis());
        eq("forward defaults to 15 seconds", 15_000, PlaybackHooks.forwardMillis());
        MorpheSettings.VALUES.put("seek_back_seconds", 10);
        MorpheSettings.VALUES.put("seek_forward_seconds", 30);
        eq("disabled interval setting retains 15", 15_000, PlaybackHooks.backMillis());
        MorpheSettings.VALUES.put("seek_intervals", true);
        eq("back configured", 10_000, PlaybackHooks.backMillis());
        eq("forward configured", 30_000, PlaybackHooks.forwardMillis());
        eq("live-forward seconds agree", 30L, PlaybackHooks.forwardSeconds());
        eq("back PiP description agrees", "Rewind 10 seconds", PlaybackHooks.backDescription());
        eq("forward PiP description agrees", "Forward 30 seconds", PlaybackHooks.forwardDescription());
        MorpheSettings.VALUES.put("seek_back_seconds", -100);
        MorpheSettings.VALUES.put("seek_forward_seconds", Integer.MAX_VALUE);
        eq("negative back setting safe", 15_000, PlaybackHooks.backMillis());
        eq("overflowing forward setting safe", 15_000, PlaybackHooks.forwardMillis());
    }

    private static void speedPolicy() {
        MorpheSettings.VALUES.clear();
        ViewModel vm = new ViewModel();
        MorpheSettings.VALUES.put("playback_speed", 1.5f);
        PlaybackHooks.applySpeed(vm.playerManager);
        eq("saved speed requires master toggle", 1f, vm.playerManager._player.speed);
        MorpheSettings.VALUES.put("playback_speed_enabled", true);
        for (float speed : new float[]{0.5f, 0.75f, 1f, 1.25f, 1.5f, 1.75f, 2f}) {
            MorpheSettings.VALUES.put("playback_speed", speed);
            PlaybackHooks.applySpeed(vm.playerManager);
            eq("valid saved speed " + speed, speed, vm.playerManager._player.speed);
        }
        MorpheSettings.VALUES.put("playback_speed", Float.NaN);
        PlaybackHooks.applySpeed(vm.playerManager);
        eq("invalid speed defaults normal", 1f, vm.playerManager._player.speed);
        MorpheSettings.VALUES.put("playback_speed", 1.5f);
        PlaybackHooks.applySpeed(vm.playerManager);
        vm.playbackController._isMediaLive.value = true;
        PlaybackHooks.applySpeed(vm.playerManager);
        eq("live resets speed", 1f, vm.playerManager._player.speed);
        vm.playbackController._isMediaLive.value = false;
        vm.playbackController.currentProvider = new PlaybackStreamProvider.GoogleDAIProvider();
        PlaybackHooks.applySpeed(vm.playerManager);
        eq("DAI remains normal", 1f, vm.playerManager._player.speed);
        vm.playbackController.currentProvider = new PlaybackStreamProvider.AkamaiHLSProvider();
        PlaybackHooks.applySpeed(vm.playerManager);
        PlaybackHooks.beforeProviderChange(vm.playbackController);
        eq("provider transition resets old player", 1f, vm.playerManager._player.speed);
        PlaybackHooks.applySpeed(vm.playerManager);
        PlaybackHooks.normalSpeed(vm.playerManager);
        eq("ad transition resets speed", 1f, vm.playerManager._player.speed);
        vm.adsController._isAdPlaying.value = true;
        PlaybackHooks.applySpeed(vm.playerManager);
        eq("ad state stays normal", 1f, vm.playerManager._player.speed);
        eq("speed preference remains saved independently", 1.5f, MorpheSettings.VALUES.get("playback_speed"));
    }

    public static void main(String[] args) {
        skipPolicy();
        autoSkipPolicy();
        seekPolicy();
        speedPolicy();
        System.out.println("PlaybackHooks semantic checks passed: " + assertions + " assertions");
    }
}
