package fe;

import com.google.android.exoplayer2.PlaybackException;
import com.google.android.exoplayer2.metadata.Metadata;
import java.util.List;

/* loaded from: classes3.dex */
public interface j1 {
    default void onAvailableCommandsChanged(h1 h1Var) {
    }

    default void onCues(List list) {
    }

    default void onDeviceInfoChanged(j jVar) {
    }

    default void onDeviceVolumeChanged(int i5, boolean z11) {
    }

    default void onEvents(l1 l1Var, i1 i1Var) {
    }

    default void onIsLoadingChanged(boolean z11) {
    }

    default void onIsPlayingChanged(boolean z11) {
    }

    default void onLoadingChanged(boolean z11) {
    }

    default void onMediaItemTransition(u0 u0Var, int i5) {
    }

    default void onMediaMetadataChanged(w0 w0Var) {
    }

    default void onMetadata(Metadata metadata) {
    }

    default void onPlayWhenReadyChanged(boolean z11, int i5) {
    }

    default void onPlaybackParametersChanged(g1 g1Var) {
    }

    default void onPlaybackStateChanged(int i5) {
    }

    default void onPlaybackSuppressionReasonChanged(int i5) {
    }

    default void onPlayerError(PlaybackException playbackException) {
    }

    default void onPlayerErrorChanged(PlaybackException playbackException) {
    }

    default void onPlayerStateChanged(boolean z11, int i5) {
    }

    default void onPositionDiscontinuity(int i5) {
    }

    default void onRenderedFirstFrame() {
    }

    default void onRepeatModeChanged(int i5) {
    }

    default void onSeekProcessed() {
    }

    default void onShuffleModeEnabledChanged(boolean z11) {
    }

    default void onSkipSilenceEnabledChanged(boolean z11) {
    }

    default void onSurfaceSizeChanged(int i5, int i11) {
    }

    default void onTimelineChanged(z1 z1Var, int i5) {
    }

    default void onTrackSelectionParametersChanged(tf.u uVar) {
    }

    default void onTracksChanged(b2 b2Var) {
    }

    default void onVideoSizeChanged(xf.p pVar) {
    }

    default void onVolumeChanged(float f11) {
    }

    default void onCues(jf.c cVar) {
    }

    default void onPositionDiscontinuity(k1 k1Var, k1 k1Var2, int i5) {
    }
}
