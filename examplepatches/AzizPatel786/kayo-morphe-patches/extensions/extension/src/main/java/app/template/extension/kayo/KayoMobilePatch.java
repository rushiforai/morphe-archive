package app.template.extension.kayo;

import android.app.Activity;
import android.content.Context;
import android.view.View;

import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.Tracks;
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector;

import java.util.List;

/**
 * Specialized Mobile runtime extension for Kayo Sports ({@code au.com.kayosports}).
 *
 * Isolates all Mobile ExoPlayer v2 ({@code com.google.android.exoplayer2.*}) track selection,
 * multi-audio commentary switching, 80 Mbps initial bandwidth bootstrap, DefaultLoadControl /
 * DefaultLivePlaybackSpeedControl / DefaultRenderersFactory tuning, Picture-in-Picture (PiP),
 * and Live Stream Diagnostics HUD from Android TV ({@link KayoTvPatch}).
 */
@SuppressWarnings("unused")
public final class KayoMobilePatch {

    private static final long INITIAL_BITRATE_ESTIMATE_BPS = 80_000_000L;

    private KayoMobilePatch() {
    }

    public static long getInitialBitrateEstimate() {
        return INITIAL_BITRATE_ESTIMATE_BPS;
    }

    public static void onTrackSelectorInit(DefaultTrackSelector selector) {
        KayoPatch.onTrackSelectorInit(selector);
    }

    public static void onExoPlayerAttached(ExoPlayer player) {
        KayoPatch.onExoPlayerAttached(player);
    }

    public static boolean onTracksChanged(DefaultTrackSelector selector, Tracks tracks) {
        return KayoPatch.onTracksChanged(selector, tracks);
    }

    public static void onTracksUpdated(Tracks tracks) {
        KayoPatch.onTracksUpdated(tracks);
    }

    public static void onSetAudioTrack(DefaultTrackSelector selector, String language) {
        KayoPatch.onSetAudioTrack(selector, language);
    }

    public static boolean shouldIgnoreBitrateLimit() {
        return KayoPatch.shouldIgnoreBitrateLimit();
    }

    public static void onControlsInitialized(View trackSelectorButton) {
        KayoPatch.onControlsInitialized(trackSelectorButton);
    }

    public static boolean overrideTrackSelectorVisibility(boolean originalVisible) {
        return KayoPatch.overrideTrackSelectorVisibility(originalVisible);
    }

    public static boolean onTrackSelectorClicked(View view) {
        return KayoPatch.onTrackSelectorClicked(view);
    }

    public static String spoofPlaybackCapabilities(String original) {
        return KayoPatch.spoofPlaybackCapabilities(original);
    }

    public static void configureDefaultLoadControl(Object loadControl) {
        KayoPatch.configureDefaultLoadControl(loadControl);
    }

    public static void configureLivePlaybackSpeedControl(Object speedControl) {
        KayoPatch.configureLivePlaybackSpeedControl(speedControl);
    }

    public static void configureRenderersFactory(Object renderersFactory) {
        KayoPatch.configureRenderersFactory(renderersFactory);
    }

    public static int[] overrideDefinitionTracks(Object group, int[] tracks) {
        return KayoPatch.overrideDefinitionTracks(group, tracks);
    }

    public static int overrideSelectedIndex(Object trackSelection) {
        return KayoPatch.overrideSelectedIndex(trackSelection);
    }

    public static int overrideIdealSelectedIndex(Object trackSelection) {
        return KayoPatch.overrideIdealSelectedIndex(trackSelection);
    }

    public static boolean onUpdateSelectedTrack(Object trackSelection) {
        return KayoPatch.onUpdateSelectedTrack(trackSelection);
    }

    public static void onUpdateSelectedTrackExit(Object trackSelection) {
        KayoPatch.onUpdateSelectedTrackExit(trackSelection);
    }

    public static int overrideEvaluateQueueSize(Object trackSelection, List<?> queue) {
        return KayoPatch.overrideEvaluateQueueSize(trackSelection, queue);
    }

    public static void showQualityDialog(Context context, Runnable onOpenOriginalTrackSelector) {
        KayoPatch.showQualityDialog(context, onOpenOriginalTrackSelector);
    }

    public static void showAudioTrackDialog(Context context) {
        KayoPatch.showAudioTrackDialog(context);
    }

    public static void toggleDiagnosticsOverlay(Context context) {
        KayoPatch.toggleDiagnosticsOverlay(context);
    }

    public static void showDiagnosticsDialog(Context context) {
        KayoPatch.showDiagnosticsDialog(context);
    }

    public static void enterPipMode(Activity activity) {
        KayoPatch.enterPipMode(activity);
    }
}
