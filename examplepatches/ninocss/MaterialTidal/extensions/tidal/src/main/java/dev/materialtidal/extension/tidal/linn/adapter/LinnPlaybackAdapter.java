package dev.materialtidal.extension.tidal.linn.adapter;

import dev.materialtidal.extension.tidal.linn.LinnPlaybackController;
import dev.materialtidal.extension.tidal.linn.LinnTidalBridge;

/**
 * Patch-time adapter implementing TIDAL's {@code Litd;} ({@code Playback}) interface.
 */
@SuppressWarnings("unused")
public final class LinnPlaybackAdapter {

    private final LinnPlaybackController controller;

    public LinnPlaybackAdapter(LinnPlaybackController controller) {
        this.controller = controller;
    }

    public Integer getCurrentBitDepth() {
        return controller.getCurrentBitDepth();
    }

    public Integer getCurrentBitRate() {
        return null;
    }

    public String getCurrentCodec() {
        return controller.getCurrentCodec();
    }

    public int getCurrentMediaDuration() {
        return controller.getCurrentMediaDurationMs();
    }

    public int getCurrentMediaPosition() {
        return controller.getCurrentMediaPositionMs();
    }

    public Integer getCurrentSampleRate() {
        return controller.getCurrentSampleRate();
    }

    public Object getPlayQueueImpl() {
        return controller.getPlayQueue();
    }

    public Object getStateImpl() {
        return LinnTidalBridge.nativeMapStateNameToEnum(controller.getStateName());
    }

    public Object getVideoPlayerControllerImpl() {
        return null;
    }

    public Object getVolumeProviderImpl() {
        return controller.getVolumeProvider();
    }

    public boolean isCurrentStreamAudioOnly() {
        return true;
    }

    public boolean isCurrentStreamDolbyAtmos() {
        return false;
    }

    public boolean isCurrentStreamHiResLosslessQuality() {
        return controller.isHiResLosslessQuality();
    }

    public boolean isCurrentStreamHighQuality() {
        return controller.isHighQuality();
    }

    public boolean isCurrentStreamLossless() {
        return controller.isLosslessQuality();
    }

    public boolean isCurrentStreamLowQuality() {
        return controller.isLowQuality();
    }

    public boolean isCurrentStreamMasterQuality() {
        return false;
    }

    public boolean isCurrentStreamOnline() {
        return true;
    }

    public boolean isCurrentStreamPaygatedPreview() {
        return false;
    }

    public boolean isCurrentStreamPreview() {
        return false;
    }

    public boolean isLocal() {
        return false;
    }

    public boolean isRepeatSupported() {
        return true;
    }

    public boolean isSeekingSupported() {
        return true;
    }

    public void onActionNext() {
        controller.onActionNext();
    }

    public void onActionPause() {
        controller.onActionPause();
    }

    public void onActionPlay() {
        controller.onActionPlay();
    }

    public void onActionPlayPosition(int position, boolean removeActives, boolean autoPlay) {
        controller.onActionPlayPosition(position, removeActives, autoPlay);
    }

    public void onActionPrevious(boolean forcePrevious) {
        controller.onActionPrevious(forcePrevious);
    }

    public void onActionSeekTo(int positionMs) {
        controller.onActionSeekTo(positionMs);
    }

    public void onActionStopImpl(Object endReason) {
        controller.onActionStop();
    }

    public void onActionTogglePlayback() {
        controller.onActionTogglePlayback();
    }

    public void onActionWifiQualityChanged() {
    }

    public void onActivatedImpl(int positionMs, Object previousPlayback) {
        controller.onActivated(positionMs, previousPlayback);
    }

    public void onDeactivated() {
        controller.onDeactivated();
    }

    public void onServicePreEnterForeground() {
    }

    public void onServicePreLeaveForeground() {
    }

    public void onTaskRemoved() {
        controller.onTaskRemoved();
    }
}
