package dev.materialtidal.extension.tidal.linn;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dev.materialtidal.extension.tidal.linn.adapter.LinnVolumeControlAdapter;
import dev.materialtidal.extension.tidal.linn.adapter.LinnVolumeProviderAdapter;

/**
 * Coordinates Linn OpenHome {@code Volume:1} state across TIDAL's Devices sheet SeekBar
 * ({@link LinnVolumeControlAdapter}) and Android hardware volume buttons
 * ({@link LinnVolumeProviderAdapter}).
 */
public final class LinnVolumeController {

    private static final String TAG = "MaterialTidalLinn";

    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final ExecutorService executor = Executors.newSingleThreadExecutor();

    private final Object maxVolumeSubject;
    private final Object updateVolumeSubject;
    private final LinnVolumeControlAdapter volumeControlAdapter;

    private volatile LinnDevice device;
    private volatile int effectiveMax = 100;
    private volatile int currentVolume = 0;
    private volatile boolean listening;
    private volatile long lastLocalWriteMs;
    private volatile LinnVolumeProviderAdapter volumeProvider;
    private Runnable pendingSliderWrite;

    public LinnVolumeController() {
        this.maxVolumeSubject = LinnTidalBridge.nativeCreatePublishSubject();
        this.updateVolumeSubject = LinnTidalBridge.nativeCreateBehaviorSubject();
        this.volumeControlAdapter = new LinnVolumeControlAdapter(this);
    }

    public Object getVolumeControlAdapter() {
        return volumeControlAdapter;
    }

    public Object getMaxVolumeSubject() {
        return maxVolumeSubject;
    }

    public Object getUpdateVolumeSubject() {
        return updateVolumeSubject;
    }

    public Object getOrCreateVolumeProvider() {
        LinnDevice dev = this.device;
        if (dev == null || !dev.supportsVolume()) {
            return null;
        }
        if (volumeProvider == null) {
            volumeProvider = new LinnVolumeProviderAdapter(2, effectiveMax, Math.max(0, currentVolume), this);
        }
        return volumeProvider;
    }

    public void attachDeviceBlocking(LinnDevice dev) {
        this.device = dev;
        this.volumeProvider = null;
        if (dev == null || !dev.supportsVolume()) {
            Log.w(TAG, "attachDeviceBlocking: volume service unavailable");
            return;
        }
        int resolvedMax = 100;
        int resolvedVol = 40;
        try {
            LinnOpenHomeClient.VolumeCharacteristics ch = LinnOpenHomeClient.getVolumeCharacteristics(dev);
            int cur = LinnOpenHomeClient.getVolume(dev);
            resolvedMax = Math.max(1, ch.effectiveMax);
            resolvedVol = clamp(cur, resolvedMax);
            Log.i(TAG, "Volume attached: max=" + resolvedMax + " cur=" + resolvedVol
                    + " (rawMax=" + ch.volumeMax + " limit=" + ch.volumeLimit + ")");
        } catch (Exception e) {
            Log.w(TAG, "Volume initial probe failed (using fallback max=100 cur=40): " + e.getMessage());
        } finally {
            effectiveMax = resolvedMax;
            currentVolume = resolvedVol;
            volumeProvider = new LinnVolumeProviderAdapter(2, resolvedMax, resolvedVol, this);
            mainHandler.post(this::emitSubjects);
        }
    }

    public void attachDevice(LinnDevice dev) {
        this.device = dev;
        this.volumeProvider = null;
        if (dev == null || !dev.supportsVolume()) {
            return;
        }
        executor.execute(() -> attachDeviceBlocking(dev));
    }

    public void detachDevice() {
        this.device = null;
        this.volumeProvider = null;
        mainHandler.removeCallbacksAndMessages(null);
    }

    public void startListening() {
        listening = true;
        Log.i(TAG, "Volume.startListening max=" + effectiveMax + " cur=" + currentVolume);
        if (Looper.myLooper() == Looper.getMainLooper()) {
            emitSubjects();
        } else {
            mainHandler.post(this::emitSubjects);
        }
        LinnDevice dev = this.device;
        if (dev != null && dev.supportsVolume()) {
            executor.execute(() -> {
                try {
                    int cur = LinnOpenHomeClient.getVolume(dev);
                    syncFromDevice(cur, true);
                } catch (Exception e) {
                    Log.w(TAG, "Volume.startListening refresh failed: " + e.getMessage());
                }
            });
        }
    }

    public void stopListening() {
        listening = false;
    }

    /**
     * Called from TIDAL's Devices-sheet SeekBar slider. Debounced by 80ms so dragging feels smooth.
     */
    public void onSliderVolumeChanged(int requestedVol) {
        int clamped = clamp(requestedVol, effectiveMax);
        Log.i(TAG, "Volume slider changed: requested=" + requestedVol + " clamped=" + clamped);
        currentVolume = clamped;
        lastLocalWriteMs = System.currentTimeMillis();
        updateProviderVolume(clamped);

        if (pendingSliderWrite != null) {
            mainHandler.removeCallbacks(pendingSliderWrite);
        }
        pendingSliderWrite = () -> executor.execute(() -> writeVolumeToDevice(clamped));
        mainHandler.postDelayed(pendingSliderWrite, 80);
    }

    /**
     * Called from Android's {@code VolumeProviderCompat.onSetVolumeTo}.
     */
    public void onHardwareSetVolumeTo(int requestedVol) {
        int clamped = clamp(requestedVol, effectiveMax);
        Log.i(TAG, "Hardware SetVolumeTo: requested=" + requestedVol + " clamped=" + clamped);
        applyLocalVolume(clamped);
    }

    /**
     * Called from Android's {@code VolumeProviderCompat.onAdjustVolume} ({@code -1}, {@code +1}, or {@code 0}).
     */
    public void onHardwareAdjustVolume(int direction) {
        if (direction == 0) {
            return;
        }
        int step = effectiveMax <= 50 ? 1 : 2;
        int next = clamp(currentVolume + (direction > 0 ? step : -step), effectiveMax);
        Log.i(TAG, "Hardware AdjustVolume: dir=" + direction + " cur=" + currentVolume + " -> " + next);
        applyLocalVolume(next);
    }

    /**
     * Synchronizes remote knob/remote-control volume changes back to TIDAL UI and system panel.
     */
    public void syncFromDevice(int deviceVolume, boolean force) {
        if (!force && System.currentTimeMillis() - lastLocalWriteMs < 1500) {
            return;
        }
        int clamped = clamp(deviceVolume, effectiveMax);
        if (!force && clamped == currentVolume) {
            return;
        }
        currentVolume = clamped;
        mainHandler.post(() -> {
            updateProviderVolume(clamped);
            emitSubjects();
        });
    }

    private void applyLocalVolume(int clamped) {
        currentVolume = clamped;
        lastLocalWriteMs = System.currentTimeMillis();
        mainHandler.post(() -> {
            updateProviderVolume(clamped);
            emitSubjects();
        });
        executor.execute(() -> writeVolumeToDevice(clamped));
    }

    private void writeVolumeToDevice(int clamped) {
        LinnDevice dev = this.device;
        if (dev == null || !dev.supportsVolume()) {
            Log.w(TAG, "Volume.SetVolume(" + clamped + ") skipped: no volume-capable device");
            return;
        }
        try {
            LinnOpenHomeClient.setVolume(dev, clamped);
            Log.i(TAG, "Volume.SetVolume(" + clamped + ") OK");
        } catch (Exception e) {
            Log.w(TAG, "Volume.SetVolume(" + clamped + ") failed: " + e.getMessage());
        }
    }

    private void emitSubjects() {
        LinnTidalBridge.nativeSubjectOnNextInt(maxVolumeSubject, effectiveMax);
        LinnTidalBridge.nativeSubjectOnNextInt(updateVolumeSubject, currentVolume);
    }

    private void updateProviderVolume(int volume) {
        LinnVolumeProviderAdapter provider = this.volumeProvider;
        if (provider != null) {
            LinnTidalBridge.nativeSetVolumeProviderCurrentVolume(provider, volume);
        }
    }

    private static int clamp(int value, int max) {
        return Math.max(0, Math.min(Math.max(1, max), value));
    }
}
