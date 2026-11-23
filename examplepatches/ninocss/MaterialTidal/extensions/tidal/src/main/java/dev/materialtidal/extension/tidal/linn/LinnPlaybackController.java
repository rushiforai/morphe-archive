package dev.materialtidal.extension.tidal.linn;

import android.content.Context;
import android.net.wifi.WifiManager;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.util.Log;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import dev.materialtidal.extension.tidal.linn.adapter.LinnPlaybackAdapter;

/**
 * Playback engine implementing TIDAL's {@code Playback} ({@code Litd;}) contract over
 * Linn OpenHome {@code Product:1}, {@code Playlist:1}, and {@code Time:1}.
 */
public final class LinnPlaybackController {

    private static final String TAG = "MaterialTidalLinn";
    private static final int PREVIOUS_RESTART_THRESHOLD_MS = 5000;

    public interface ExternalEventListener {
        void onExternalStandbyOrSourceSwitch();

        void onConnectionError();
    }

    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final LinnVolumeController volumeController;
    private final ExternalEventListener externalListener;
    private final LinnPlaybackAdapter playbackAdapter;
    private final LinnHttpStreamProxy streamProxy = new LinnHttpStreamProxy();
    private final ExecutorService commandExecutor = Executors.newSingleThreadExecutor();
    private final ExecutorService transportExecutor = Executors.newSingleThreadExecutor();
    private final ExecutorService preloadExecutor = Executors.newSingleThreadExecutor();
    private final ScheduledExecutorService pollerExecutor = Executors.newSingleThreadScheduledExecutor();
    private final AtomicInteger loadGeneration = new AtomicInteger(0);

    private volatile Object playQueue;
    private volatile LinnDevice activeDevice;
    private volatile int playlistSourceIndex = -1;
    private volatile boolean active;
    private volatile boolean skipRemotePauseOnDeactivate;

    private volatile long activatedAtMs = 0L;
    private volatile long lastLocalTransportActionMs = 0L;
    private volatile int observedPlayingGen = -1;
    private volatile int consecutiveExternalSwitchPolls = 0;
    private volatile boolean pausedViaStop = false;

    private volatile String currentState = "IDLE";
    private volatile String currentQualityLabel = "LOSSLESS";
    private volatile String currentCodec = "FLAC";
    private volatile int currentBitDepth = 16;
    private volatile int currentSampleRate = 44100;
    private volatile int currentDurationMs = 0;

    private volatile int currentOhTrackId = 0;
    private volatile String currentQueueUid = "";
    private volatile boolean currentStreamIsDash = false;
    private volatile int dashSeekOffsetSec = 0;

    private volatile int preloadedOhTrackId = 0;
    private volatile String preloadedQueueUid = "";

    private volatile int lastPolledPosMs = 0;
    private volatile long lastPolledWallMs = 0L;
    private volatile boolean lastIsPlaying = false;
    private volatile int consecutivePollErrors = 0;

    private ScheduledFuture<?> pollTask;
    private PowerManager.WakeLock wakeLock;
    private WifiManager.WifiLock wifiLock;

    public LinnPlaybackController(
            LinnVolumeController volumeController,
            ExternalEventListener externalListener
    ) {
        this.volumeController = volumeController;
        this.externalListener = externalListener;
        this.playbackAdapter = new LinnPlaybackAdapter(this);
    }

    public LinnPlaybackAdapter getPlaybackAdapter() {
        return playbackAdapter;
    }

    public Object getPlayQueue() {
        ensurePlayQueue();
        return playQueue;
    }

    public void setPendingDevice(LinnDevice device) {
        setPendingDevice(device, -1);
    }

    public void setPendingDevice(LinnDevice device, int sourceIndex) {
        this.activeDevice = device;
        this.playlistSourceIndex = sourceIndex;
    }

    public Object getVolumeProvider() {
        return active ? volumeController.getOrCreateVolumeProvider() : null;
    }

    public String getStateName() {
        return currentState;
    }

    public Integer getCurrentBitDepth() {
        return active ? currentBitDepth : null;
    }

    public Integer getCurrentSampleRate() {
        return active ? currentSampleRate : null;
    }

    public String getCurrentCodec() {
        return active ? currentCodec : null;
    }

    public boolean isHiResLosslessQuality() {
        return active && ("HI_RES_LOSSLESS".equals(currentQualityLabel)
                || currentBitDepth > 16
                || currentSampleRate > 48000);
    }

    public boolean isLosslessQuality() {
        return active && "LOSSLESS".equals(currentQualityLabel) && !isHiResLosslessQuality();
    }

    public boolean isHighQuality() {
        return active && "HIGH".equals(currentQualityLabel);
    }

    public boolean isLowQuality() {
        return active && "LOW".equals(currentQualityLabel);
    }

    public int getCurrentMediaDurationMs() {
        return Math.max(0, currentDurationMs);
    }

    public int getCurrentMediaPositionMs() {
        int base = lastPolledPosMs;
        if ("PLAYING".equals(currentState) && lastPolledWallMs > 0L) {
            long delta = Math.max(0L, System.currentTimeMillis() - lastPolledWallMs);
            base += (int) delta;
        }
        int dur = currentDurationMs;
        if (dur > 0 && base > dur) {
            return dur;
        }
        return Math.max(0, base);
    }

    public void onActivated(int positionMs, Object previousPlayback) {
        long now = System.currentTimeMillis();
        active = true;
        skipRemotePauseOnDeactivate = false;
        activatedAtMs = now;
        lastLocalTransportActionMs = now;
        observedPlayingGen = -1;
        consecutiveExternalSwitchPolls = 0;
        pausedViaStop = false;
        ensurePlayQueue();

        boolean shouldAutoPlay = true;
        if (previousPlayback != null) {
            String prevState = LinnTidalBridge.nativeGetPlaybackStateName(previousPlayback);
            shouldAutoPlay = "PLAYING".equals(prevState) || "PREPARING".equals(prevState);
            Object prevQueue = LinnTidalBridge.nativeGetPlaybackQueue(previousPlayback);
            if (prevQueue != null && prevQueue != playQueue) {
                LinnTidalBridge.nativeQueueInitFrom(playQueue, prevQueue, Math.max(0, positionMs));
            }
        }
        Log.i(TAG, "onActivated posMs=" + positionMs + " autoPlay=" + shouldAutoPlay
                + " playlistIdx=" + playlistSourceIndex);

        acquireLocks();
        try {
            streamProxy.start();
        } catch (Exception e) {
            Log.e(TAG, "Failed to start local HTTP proxy", e);
        }

        lastPolledPosMs = Math.max(0, positionMs);
        lastPolledWallMs = now;
        lastIsPlaying = false;
        consecutivePollErrors = 0;

        final boolean autoPlayFinal = shouldAutoPlay;
        final int startPosFinal = Math.max(0, positionMs);
        // Defer UI/state notifications until AudioPlayer.switchToExternalPlayback finishes assigning AudioPlayer.l.
        mainHandler.post(() -> {
            if (!active) return;
            Object currentItem = LinnTidalBridge.nativeQueueGetCurrentItem(playQueue);
            Log.i(TAG, "onActivated main post currentItem=" + (currentItem != null));
            if (currentItem != null) {
                syncDurationFromQueueItem(currentItem);
                notifyItemUpdatedOnMain();
                loadAndStartItem(currentItem, startPosFinal, autoPlayFinal);
            } else {
                updateState("PAUSED");
            }
            startPoller();
        });
    }

    public void onPlayQueuePrepared(Object queue, boolean autoPlay) {
        Log.i(TAG, "onPlayQueuePrepared active=" + active + " sameQueue=" + (queue != null && queue == playQueue)
                + " autoPlay=" + autoPlay);
        if (!active || queue == null || queue != playQueue) {
            return;
        }
        runOnMain(() -> {
            if (!active || queue != playQueue) {
                return;
            }
            Object item = LinnTidalBridge.nativeQueueGetCurrentItem(playQueue);
            Log.i(TAG, "onPlayQueuePrepared loading currentItem=" + (item != null) + " autoPlay=" + autoPlay);
            lastLocalTransportActionMs = System.currentTimeMillis();
            pausedViaStop = false;
            notifyItemUpdatedOnMain();
            if (item != null) {
                loadAndStartItem(item, 0, autoPlay);
            }
        });
    }

    public void onPlayQueueCleared(Object queue) {
        if (active && queue != null && queue == playQueue) {
            Log.i(TAG, "onPlayQueueCleared: stopping playback");
            onActionStop();
        }
    }

    public void onDeactivated() {
        Log.i(TAG, "onDeactivated skipRemotePause=" + skipRemotePauseOnDeactivate);
        active = false;
        pausedViaStop = false;
        lastIsPlaying = false;
        loadGeneration.incrementAndGet();
        stopPoller();
        resetProgressOnMain();

        LinnDevice dev = this.activeDevice;
        streamProxy.cancelAllStreams();
        streamProxy.stop();
        releaseLocks();

        if (dev != null && !skipRemotePauseOnDeactivate) {
            transportExecutor.execute(() -> {
                try {
                    LinnOpenHomeClient.playlistPause(dev);
                } catch (Exception ignored) {
                }
            });
        }
        skipRemotePauseOnDeactivate = false;
        clearPreloadState();
        currentState = "IDLE";
    }

    public void onActionPlay() {
        Log.i(TAG, "onActionPlay active=" + active + " state=" + currentState
                + " pausedViaStop=" + pausedViaStop + " ohId=" + currentOhTrackId);
        if (!active) return;
        LinnDevice dev = activeDevice;
        if (dev == null) return;
        lastLocalTransportActionMs = System.currentTimeMillis();

        if (pausedViaStop || currentOhTrackId <= 0) {
            pausedViaStop = false;
            ensurePlayQueue();
            Object item = LinnTidalBridge.nativeQueueGetCurrentItem(playQueue);
            if (item != null) {
                loadAndStartItem(item, Math.max(0, lastPolledPosMs), true);
            }
            return;
        }

        final int playGen = loadGeneration.get();
        transportExecutor.execute(() -> {
            if (!active || loadGeneration.get() != playGen) {
                return;
            }
            try {
                if (LinnConfig.isAutoWakeAndSwitchEnabled() && dev.supportsProduct()) {
                    int idx = LinnOpenHomeClient.ensureAwakeAndPlaylistSource(dev);
                    if (idx >= 0) {
                        playlistSourceIndex = idx;
                    }
                }
                LinnOpenHomeClient.playlistPlay(dev);
                observedPlayingGen = playGen;
                lastPolledWallMs = System.currentTimeMillis();
                lastIsPlaying = true;
                updateState("PLAYING");
                notifyItemUpdatedOnMain();
                startProgressOnMain(getCurrentMediaPositionMs(), getCurrentMediaDurationMs());
                Log.i(TAG, "Playlist.Play OK pos=" + lastPolledPosMs + "ms");
            } catch (Exception e) {
                Log.w(TAG, "onActionPlay failed: " + e.getMessage());
            }
        });
    }

    public void onActionPause() {
        Log.i(TAG, "onActionPause active=" + active + " state=" + currentState);
        if (!active) return;
        LinnDevice dev = activeDevice;
        if (dev == null) return;

        String prevState = currentState;
        lastLocalTransportActionMs = System.currentTimeMillis();
        pausedViaStop = false;
        if ("PREPARING".equals(prevState)) {
            loadGeneration.incrementAndGet();
        }
        lastPolledPosMs = getCurrentMediaPositionMs();
        lastIsPlaying = false;
        updateState("PAUSED");
        resetProgressOnMain();
        updateProgressOnMain(lastPolledPosMs, getCurrentMediaDurationMs());

        final int pauseGen = loadGeneration.get();
        transportExecutor.execute(() -> {
            if (loadGeneration.get() != pauseGen) {
                return;
            }
            boolean needStopFallback = false;
            try {
                LinnOpenHomeClient.playlistPause(dev);
                try {
                    Thread.sleep(200);
                } catch (InterruptedException ignored) {
                    Thread.currentThread().interrupt();
                }
                if (loadGeneration.get() != pauseGen) {
                    return;
                }
                String ts = LinnOpenHomeClient.playlistTransportState(dev);
                Log.i(TAG, "Post-pause TransportState=" + ts);
                if ("Playing".equalsIgnoreCase(ts) || "Buffering".equalsIgnoreCase(ts)) {
                    needStopFallback = true;
                }
            } catch (Exception e) {
                Log.w(TAG, "Playlist.Pause failed (" + e.getMessage() + "), trying Stop fallback");
                needStopFallback = true;
            }
            if (needStopFallback && loadGeneration.get() == pauseGen) {
                try {
                    LinnOpenHomeClient.playlistStop(dev);
                    streamProxy.cancelAllStreams();
                    pausedViaStop = true;
                    Log.i(TAG, "Pause-via-Stop executed cleanly (resume will seek to " + lastPolledPosMs + "ms)");
                } catch (Exception e2) {
                    Log.w(TAG, "Pause-via-Stop fallback failed: " + e2.getMessage());
                }
            }
        });
    }

    public void onActionTogglePlayback() {
        Log.i(TAG, "onActionTogglePlayback active=" + active + " state=" + currentState);
        if ("PLAYING".equals(currentState) || "PREPARING".equals(currentState)) {
            onActionPause();
        } else {
            onActionPlay();
        }
    }

    public void onActionNext() {
        Log.i(TAG, "onActionNext active=" + active + " state=" + currentState);
        if (!active) return;
        lastLocalTransportActionMs = System.currentTimeMillis();
        pausedViaStop = false;
        ensurePlayQueue();
        Object nextItem = LinnTidalBridge.nativeQueueMoveNext(playQueue);
        notifyItemUpdatedOnMain();
        if (nextItem != null) {
            loadAndStartItem(nextItem, 0, true);
        } else {
            onActionPause();
        }
    }

    public void onActionPrevious(boolean forcePrevious) {
        int curPos = getCurrentMediaPositionMs();
        Log.i(TAG, "onActionPrevious active=" + active + " force=" + forcePrevious + " posMs=" + curPos);
        if (!active) return;
        lastLocalTransportActionMs = System.currentTimeMillis();
        pausedViaStop = false;
        if (!forcePrevious && curPos > PREVIOUS_RESTART_THRESHOLD_MS) {
            onActionSeekTo(0);
            return;
        }
        ensurePlayQueue();
        Object prevItem = LinnTidalBridge.nativeQueueMovePrevious(playQueue);
        notifyItemUpdatedOnMain();
        if (prevItem != null) {
            loadAndStartItem(prevItem, 0, true);
        } else {
            onActionSeekTo(0);
        }
    }

    public void onActionPlayPosition(int position, boolean removeActives, boolean autoPlay) {
        Log.i(TAG, "onActionPlayPosition active=" + active + " pos=" + position + " autoPlay=" + autoPlay);
        if (!active) return;
        lastLocalTransportActionMs = System.currentTimeMillis();
        pausedViaStop = false;
        ensurePlayQueue();
        Object item = LinnTidalBridge.nativeQueueGoTo(playQueue, position, true);
        notifyItemUpdatedOnMain();
        if (item != null) {
            loadAndStartItem(item, 0, autoPlay || "PLAYING".equals(currentState));
        }
    }

    public void onActionSeekTo(int positionMs) {
        Log.i(TAG, "onActionSeekTo active=" + active + " posMs=" + positionMs + " dash=" + currentStreamIsDash);
        if (!active) return;
        LinnDevice dev = activeDevice;
        if (dev == null) return;
        int targetMs = Math.max(0, positionMs);
        lastLocalTransportActionMs = System.currentTimeMillis();
        boolean wasPlaying = lastIsPlaying || "PLAYING".equals(currentState) || "PREPARING".equals(currentState);
        lastPolledPosMs = targetMs;
        lastPolledWallMs = System.currentTimeMillis();

        if (pausedViaStop && !wasPlaying) {
            updateState("PAUSED");
            updateProgressOnMain(targetMs, getCurrentMediaDurationMs());
            return;
        }

        updateState("SEEKING");
        updateProgressOnMain(targetMs, getCurrentMediaDurationMs());

        if (currentStreamIsDash) {
            Object item = LinnTidalBridge.nativeQueueGetCurrentItem(playQueue);
            if (item != null) {
                loadAndStartItem(item, targetMs, wasPlaying);
            }
            return;
        }

        int gen = loadGeneration.get();
        commandExecutor.execute(() -> {
            if (!active || loadGeneration.get() != gen) return;
            try {
                LinnOpenHomeClient.playlistSeekSecondAbsolute(dev, targetMs / 1000);
                lastPolledPosMs = targetMs;
                lastPolledWallMs = System.currentTimeMillis();
                String resumed = lastIsPlaying ? "PLAYING" : "PAUSED";
                updateState(resumed);
                if (lastIsPlaying) {
                    startProgressOnMain(targetMs, getCurrentMediaDurationMs());
                } else {
                    updateProgressOnMain(targetMs, getCurrentMediaDurationMs());
                }
                Log.i(TAG, "Playlist.SeekSecondAbsolute(" + (targetMs / 1000) + ") OK");
            } catch (Exception e) {
                Log.w(TAG, "onActionSeekTo failed: " + e.getMessage());
            }
        });
    }

    public void onActionStop() {
        Log.i(TAG, "onActionStop active=" + active);
        lastLocalTransportActionMs = System.currentTimeMillis();
        lastIsPlaying = false;
        lastPolledPosMs = 0;
        pausedViaStop = false;
        currentOhTrackId = 0;
        loadGeneration.incrementAndGet();
        clearPreloadState();
        resetProgressOnMain();
        updateState("STOPPED");
        LinnDevice dev = activeDevice;
        if (dev != null) {
            transportExecutor.execute(() -> {
                try {
                    LinnOpenHomeClient.playlistStop(dev);
                    Log.i(TAG, "Playlist.Stop OK");
                } catch (Exception e) {
                    Log.w(TAG, "Playlist.Stop failed: " + e.getMessage());
                }
                streamProxy.cancelAllStreams();
            });
        }
    }

    public void onTaskRemoved() {
        stopImmediatelyOnShutdown("onTaskRemoved");
    }

    public void stopImmediatelyOnShutdown(String reason) {
        final LinnDevice dev = this.activeDevice;
        final boolean wasActive = this.active;
        Log.i(TAG, "Shutdown stop (" + reason + ") active=" + wasActive + " hasDev=" + (dev != null));
        active = false;
        pausedViaStop = false;
        lastIsPlaying = false;
        loadGeneration.incrementAndGet();
        stopPoller();
        streamProxy.stop();
        releaseLocks();
        clearPreloadState();
        currentState = "STOPPED";
        resetProgressOnMain();

        if (wasActive && dev != null) {
            Thread stopThread = new Thread(() -> {
                try {
                    LinnOpenHomeClient.playlistStopFast(dev);
                    Log.i(TAG, "Shutdown Playlist.Stop OK");
                } catch (Exception e) {
                    Log.w(TAG, "Shutdown Playlist.Stop failed, trying Pause: " + e.getMessage());
                    try {
                        LinnOpenHomeClient.playlistPauseFast(dev);
                    } catch (Exception ignored) {
                    }
                }
            }, "LinnShutdownStop");
            stopThread.setDaemon(true);
            stopThread.start();
            try {
                stopThread.join(1200);
            } catch (InterruptedException ignored) {
                Thread.currentThread().interrupt();
            }
        }
    }

    private void loadAndStartItem(Object queueItem, int startPosMs, boolean autoPlay) {
        int gen = loadGeneration.incrementAndGet();
        lastLocalTransportActionMs = System.currentTimeMillis();
        clearPreloadState();
        syncDurationFromQueueItem(queueItem);
        updateState("PREPARING");
        resetProgressOnMain();
        updateProgressOnMain(startPosMs, getCurrentMediaDurationMs());

        commandExecutor.execute(() -> loadItemBlocking(queueItem, startPosMs, autoPlay, gen));
    }

    private void loadItemBlocking(Object queueItem, int startPosMs, boolean autoPlay, int gen) {
        LinnDevice dev = this.activeDevice;
        if (!active || dev == null || loadGeneration.get() != gen) {
            return;
        }
        String[] meta = LinnTidalBridge.nativeReadQueueItemMetadata(queueItem);
        if (meta == null || meta.length < 8) {
            updateState("PAUSED");
            return;
        }
        String trackId = meta[0];
        String title = meta[1];
        String artist = meta[2];
        String album = meta[3];
        String coverUuid = meta[4];
        int metaDurationMs = parseIntSafe(meta[5], 0);
        String uid = meta[7];

        try {
            if (LinnConfig.isAutoWakeAndSwitchEnabled() && dev.supportsProduct()) {
                int idx = LinnOpenHomeClient.ensureAwakeAndPlaylistSource(dev);
                if (idx >= 0) {
                    playlistSourceIndex = idx;
                }
            }

            LinnTidalStreamResolver.ResolvedStream stream = LinnTidalStreamResolver.resolve(trackId);
            if (!active || loadGeneration.get() != gen) {
                return;
            }

            try {
                LinnOpenHomeClient.playlistStop(dev);
            } catch (Exception ignored) {
            }
            streamProxy.cancelAllStreams();
            int startSec = Math.max(0, startPosMs / 1000);
            LinnHttpStreamProxy.Registration reg = streamProxy.registerStream(dev, stream, startSec);

            String didl = LinnDidlMetadataBuilder.buildDidlLite(
                    trackId, title, artist, album, coverUuid,
                    metaDurationMs, reg.url, stream.mimeType, stream.sampleRate, stream.bitDepth
            );

            LinnOpenHomeClient.playlistDeleteAll(dev);
            int newId = LinnOpenHomeClient.playlistInsert(dev, 0, reg.url, didl);
            if (!active || loadGeneration.get() != gen) {
                return;
            }
            if (newId > 0) {
                LinnOpenHomeClient.playlistSeekId(dev, newId);
            }
            if (!stream.isDash && startSec > 2) {
                LinnOpenHomeClient.playlistSeekSecondAbsolute(dev, startSec);
            }

            currentOhTrackId = newId;
            currentQueueUid = uid != null ? uid : trackId;
            currentStreamIsDash = stream.isDash;
            dashSeekOffsetSec = reg.seekOffsetSec;
            currentQualityLabel = stream.audioQuality != null ? stream.audioQuality : "LOSSLESS";
            currentCodec = (stream.mimeType != null && stream.mimeType.contains("mp4")) ? "AAC" : "FLAC";
            currentBitDepth = stream.bitDepth > 0 ? stream.bitDepth : 16;
            currentSampleRate = stream.sampleRate > 0 ? stream.sampleRate : 44100;
            if (metaDurationMs > 0) {
                currentDurationMs = metaDurationMs;
            } else if (stream.totalDurationSec > 0) {
                currentDurationMs = (int) Math.round(stream.totalDurationSec * 1000.0);
            }

            pausedViaStop = false;
            lastLocalTransportActionMs = System.currentTimeMillis();

            if (autoPlay) {
                LinnOpenHomeClient.playlistPlay(dev);
                observedPlayingGen = gen;
                lastPolledPosMs = startPosMs;
                lastPolledWallMs = System.currentTimeMillis();
                lastIsPlaying = true;
                updateState("PLAYING");
                notifyItemUpdatedOnMain();
                startProgressOnMain(lastPolledPosMs, currentDurationMs);
                Log.i(TAG, "Playing on Linn ohId=" + newId + " title=" + title
                        + " quality=" + currentQualityLabel + " " + currentBitDepth + "bit/" + currentSampleRate
                        + "Hz dash=" + currentStreamIsDash);
                preloadExecutor.execute(() -> preloadNextTrackBlocking(gen));
            } else {
                LinnOpenHomeClient.playlistPause(dev);
                lastPolledPosMs = startPosMs;
                lastPolledWallMs = System.currentTimeMillis();
                lastIsPlaying = false;
                updateState("PAUSED");
                notifyItemUpdatedOnMain();
                updateProgressOnMain(lastPolledPosMs, currentDurationMs);
                Log.i(TAG, "Loaded paused on Linn ohId=" + newId + " quality=" + currentQualityLabel);
            }
        } catch (Exception e) {
            Log.e(TAG, "loadItemBlocking failed for track " + trackId, e);
            if (active && loadGeneration.get() == gen) {
                updateState("PAUSED");
                resetProgressOnMain();
            }
        }
    }

    private void preloadNextTrackBlocking(int expectedGen) {
        LinnDevice dev = this.activeDevice;
        if (!active || dev == null || loadGeneration.get() != expectedGen || currentOhTrackId <= 0) {
            return;
        }
        String repeatMode = LinnTidalBridge.nativeQueueGetRepeatModeName(playQueue);
        if ("SINGLE".equals(repeatMode)) {
            return;
        }
        Object nextItem = LinnTidalBridge.nativeQueuePeekNext(playQueue);
        if (nextItem == null) {
            return;
        }
        String[] meta = LinnTidalBridge.nativeReadQueueItemMetadata(nextItem);
        if (meta == null || meta.length < 8) {
            return;
        }
        String nextTrackId = meta[0];
        String nextUid = meta[7] != null && !meta[7].isEmpty() ? meta[7] : nextTrackId;
        if (nextUid.equals(preloadedQueueUid) && preloadedOhTrackId > 0) {
            return;
        }
        try {
            LinnTidalStreamResolver.ResolvedStream stream = LinnTidalStreamResolver.resolve(nextTrackId);
            if (!active || loadGeneration.get() != expectedGen) {
                return;
            }
            if (preloadedOhTrackId > 0) {
                try {
                    LinnOpenHomeClient.playlistDeleteId(dev, preloadedOhTrackId);
                } catch (Exception ignored) {
                }
            }
            LinnHttpStreamProxy.Registration reg = streamProxy.registerStream(dev, stream, 0);
            int nextDurMs = parseIntSafe(meta[5], 0);
            String didl = LinnDidlMetadataBuilder.buildDidlLite(
                    nextTrackId, meta[1], meta[2], meta[3], meta[4],
                    nextDurMs, reg.url, stream.mimeType, stream.sampleRate, stream.bitDepth
            );
            int nextOhId = LinnOpenHomeClient.playlistInsert(dev, currentOhTrackId, reg.url, didl);
            if (nextOhId > 0 && active && loadGeneration.get() == expectedGen) {
                preloadedOhTrackId = nextOhId;
                preloadedQueueUid = nextUid;
            }
        } catch (Exception ignored) {
        }
    }

    private void startPoller() {
        stopPoller();
        pollTask = pollerExecutor.scheduleWithFixedDelay(this::pollOnce, 1000, 1000, TimeUnit.MILLISECONDS);
    }

    private void stopPoller() {
        ScheduledFuture<?> task = pollTask;
        pollTask = null;
        if (task != null) {
            task.cancel(true);
        }
    }

    private void pollOnce() {
        LinnDevice dev = this.activeDevice;
        if (!active || dev == null || "PREPARING".equals(currentState) || "SEEKING".equals(currentState)) {
            return;
        }
        long now = System.currentTimeMillis();
        if (LinnConfig.isAutoWakeAndSwitchEnabled()
                && dev.supportsProduct()
                && playlistSourceIndex >= 0
                && now - activatedAtMs >= 10000L
                && now - lastLocalTransportActionMs >= 5000L) {
            try {
                boolean standby = LinnOpenHomeClient.isStandby(dev);
                int srcIdx = LinnOpenHomeClient.getSourceIndex(dev);
                if (standby || (srcIdx >= 0 && srcIdx != playlistSourceIndex)) {
                    consecutiveExternalSwitchPolls++;
                    Log.w(TAG, "External standby/source change candidate (" + consecutiveExternalSwitchPolls
                            + "/3): standby=" + standby + " srcIdx=" + srcIdx + " expected=" + playlistSourceIndex);
                    if (consecutiveExternalSwitchPolls >= 3) {
                        skipRemotePauseOnDeactivate = true;
                        active = false;
                        if (externalListener != null) {
                            externalListener.onExternalStandbyOrSourceSwitch();
                        }
                        return;
                    }
                } else {
                    consecutiveExternalSwitchPolls = 0;
                }
            } catch (Exception e) {
                Log.w(TAG, "Product poll error (ignored): " + e.getMessage());
            }
        }

        if (dev.supportsVolume()) {
            try {
                int vol = LinnOpenHomeClient.getVolume(dev);
                volumeController.syncFromDevice(vol, false);
            } catch (Exception e) {
                Log.w(TAG, "Volume poll error (ignored): " + e.getMessage());
            }
        }

        String transport;
        int ohId;
        try {
            transport = LinnOpenHomeClient.playlistTransportState(dev);
            ohId = LinnOpenHomeClient.playlistId(dev);
            consecutivePollErrors = 0;
        } catch (Exception e) {
            consecutivePollErrors++;
            Log.w(TAG, "OpenHome playlist poll error (" + consecutivePollErrors + "/10): " + e.getMessage());
            if (consecutivePollErrors >= 10) {
                Log.w(TAG, "10 consecutive OpenHome playlist poll errors, disconnecting", e);
                active = false;
                if (externalListener != null) {
                    externalListener.onConnectionError();
                }
            }
            return;
        }

        int timeDurationSec = 0;
        int timeSeconds = Math.max(0, lastPolledPosMs / 1000);
        try {
            LinnOpenHomeClient.TrackTime time = LinnOpenHomeClient.getTime(dev);
            timeDurationSec = time.durationSec;
            timeSeconds = time.seconds;
        } catch (Exception e) {
            Log.w(TAG, "Time poll error (ignored): " + e.getMessage());
        }

        if (preloadedOhTrackId > 0 && ohId == preloadedOhTrackId && now - lastLocalTransportActionMs >= 2500L) {
            handleGaplessAdvance(ohId);
            return;
        }

        int reportedSec = currentStreamIsDash ? (dashSeekOffsetSec + timeSeconds) : timeSeconds;
        int reportedMs = reportedSec * 1000;
        if (timeDurationSec > 0 && currentDurationMs <= 0) {
            currentDurationMs = timeDurationSec * 1000;
        }

        boolean withinLocalDebounce = (now - lastLocalTransportActionMs) < 2500L;
        int curGen = loadGeneration.get();

        if ("Playing".equalsIgnoreCase(transport)) {
            observedPlayingGen = curGen;
            if (!withinLocalDebounce) {
                lastPolledPosMs = reportedMs;
                lastPolledWallMs = now;
                if (!lastIsPlaying) {
                    lastIsPlaying = true;
                    updateState("PLAYING");
                    startProgressOnMain(reportedMs, currentDurationMs);
                }
                checkPreloadConsistency();
            }
        } else if ("Paused".equalsIgnoreCase(transport)) {
            if (!withinLocalDebounce) {
                lastPolledPosMs = reportedMs;
                lastPolledWallMs = now;
                if (lastIsPlaying) {
                    lastIsPlaying = false;
                    updateState("PAUSED");
                    resetProgressOnMain();
                    updateProgressOnMain(reportedMs, currentDurationMs);
                }
            }
        } else if ("Stopped".equalsIgnoreCase(transport)) {
            if (!withinLocalDebounce && lastIsPlaying && !pausedViaStop && observedPlayingGen == curGen) {
                runOnMain(this::handleNaturalTrackStop);
            }
        } else if ("Buffering".equalsIgnoreCase(transport)) {
            lastPolledPosMs = reportedMs;
            lastPolledWallMs = now;
        }
    }

    private void handleGaplessAdvance(int newOhId) {
        int gen = loadGeneration.get();
        runOnMain(() -> {
            if (!active) return;
            Object nextItem = LinnTidalBridge.nativeQueueMoveNext(playQueue);
            currentOhTrackId = newOhId;
            dashSeekOffsetSec = 0;
            currentStreamIsDash = false;
            preloadedOhTrackId = 0;
            preloadedQueueUid = "";
            lastPolledPosMs = 0;
            lastPolledWallMs = System.currentTimeMillis();

            if (nextItem != null) {
                syncDurationFromQueueItem(nextItem);
                String[] meta = LinnTidalBridge.nativeReadQueueItemMetadata(nextItem);
                if (meta != null && meta.length >= 8) {
                    currentQueueUid = meta[7];
                    preloadExecutor.execute(() -> {
                        try {
                            LinnTidalStreamResolver.ResolvedStream info = LinnTidalStreamResolver.resolve(meta[0]);
                            currentQualityLabel = info.audioQuality;
                            currentBitDepth = info.bitDepth;
                            currentSampleRate = info.sampleRate;
                            currentCodec = (info.mimeType != null && info.mimeType.contains("mp4")) ? "AAC" : "FLAC";
                            currentStreamIsDash = info.isDash;
                        } catch (Exception ignored) {
                        }
                        notifyItemUpdatedOnMain();
                        startProgressOnMain(0, currentDurationMs);
                        preloadNextTrackBlocking(gen);
                    });
                }
            }
        });
    }

    private void checkPreloadConsistency() {
        String repeatMode = LinnTidalBridge.nativeQueueGetRepeatModeName(playQueue);
        Object peek = "SINGLE".equals(repeatMode) ? null : LinnTidalBridge.nativeQueuePeekNext(playQueue);
        String wantedUid = "";
        if (peek != null) {
            String[] meta = LinnTidalBridge.nativeReadQueueItemMetadata(peek);
            if (meta != null && meta.length >= 8) {
                wantedUid = meta[7] != null && !meta[7].isEmpty() ? meta[7] : meta[0];
            }
        }
        if (!wantedUid.equals(preloadedQueueUid)) {
            final int gen = loadGeneration.get();
            final String oldPreloadUid = preloadedQueueUid;
            final int oldPreloadOhId = preloadedOhTrackId;
            if (!oldPreloadUid.isEmpty() || !wantedUid.isEmpty()) {
                preloadExecutor.execute(() -> {
                    LinnDevice dev = this.activeDevice;
                    if (dev != null && oldPreloadOhId > 0) {
                        try {
                            LinnOpenHomeClient.playlistDeleteId(dev, oldPreloadOhId);
                        } catch (Exception ignored) {
                        }
                        preloadedOhTrackId = 0;
                        preloadedQueueUid = "";
                    }
                    preloadNextTrackBlocking(gen);
                });
            }
        }
    }

    private void handleNaturalTrackStop() {
        String repeatMode = LinnTidalBridge.nativeQueueGetRepeatModeName(playQueue);
        if ("SINGLE".equals(repeatMode)) {
            Object cur = LinnTidalBridge.nativeQueueGetCurrentItem(playQueue);
            if (cur != null) {
                loadAndStartItem(cur, 0, true);
                return;
            }
        }
        Object nextItem = LinnTidalBridge.nativeQueueMoveNext(playQueue);
        notifyItemUpdatedOnMain();
        if (nextItem != null) {
            loadAndStartItem(nextItem, 0, true);
        } else {
            lastIsPlaying = false;
            lastPolledPosMs = 0;
            updateState("PAUSED");
            resetProgressOnMain();
        }
    }

    private void syncDurationFromQueueItem(Object queueItem) {
        String[] meta = LinnTidalBridge.nativeReadQueueItemMetadata(queueItem);
        if (meta != null && meta.length >= 6) {
            currentDurationMs = parseIntSafe(meta[5], 0);
        }
    }

    private void clearPreloadState() {
        preloadedOhTrackId = 0;
        preloadedQueueUid = "";
    }

    private void ensurePlayQueue() {
        if (playQueue == null) {
            playQueue = LinnTidalBridge.nativeCreateLocalPlayQueue();
        }
    }

    private void runOnMain(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            action.run();
        } else {
            mainHandler.post(action);
        }
    }

    private void notifyItemUpdatedOnMain() {
        runOnMain(LinnTidalBridge::nativeNotifyItemUpdated);
    }

    private void startProgressOnMain(int positionMs, int durationMs) {
        runOnMain(() -> LinnTidalBridge.nativeStartProgress(positionMs, durationMs));
    }

    private void updateProgressOnMain(int positionMs, int durationMs) {
        runOnMain(() -> LinnTidalBridge.nativeUpdateProgress(positionMs, durationMs));
    }

    private void resetProgressOnMain() {
        runOnMain(LinnTidalBridge::nativeResetProgress);
    }

    private void updateState(String stateName) {
        currentState = stateName;
        runOnMain(() -> LinnTidalBridge.nativeNotifyPlaybackState(stateName));
    }

    private void acquireLocks() {
        try {
            Context app = LinnTidalBridge.nativeGetAppContext();
            if (app == null) return;
            PowerManager pm = (PowerManager) app.getSystemService(Context.POWER_SERVICE);
            if (pm != null && (wakeLock == null || !wakeLock.isHeld())) {
                wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "MaterialTidal:LinnOpenHome");
                wakeLock.setReferenceCounted(false);
                wakeLock.acquire();
            }
            WifiManager wm = (WifiManager) app.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
            if (wm != null && (wifiLock == null || !wifiLock.isHeld())) {
                wifiLock = wm.createWifiLock(WifiManager.WIFI_MODE_FULL_HIGH_PERF, "MaterialTidal:LinnWifi");
                wifiLock.setReferenceCounted(false);
                wifiLock.acquire();
            }
        } catch (Throwable ignored) {
        }
    }

    private void releaseLocks() {
        try {
            if (wakeLock != null && wakeLock.isHeld()) {
                wakeLock.release();
            }
            wakeLock = null;
        } catch (Throwable ignored) {
        }
        try {
            if (wifiLock != null && wifiLock.isHeld()) {
                wifiLock.release();
            }
            wifiLock = null;
        } catch (Throwable ignored) {
        }
    }

    private static int parseIntSafe(String text, int fallback) {
        if (text == null || text.isEmpty()) {
            return fallback;
        }
        try {
            return Integer.parseInt(text.trim());
        } catch (NumberFormatException e) {
            return fallback;
        }
    }
}
