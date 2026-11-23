package dev.materialtidal.extension.tidal.linn;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dev.materialtidal.extension.tidal.linn.adapter.LinnBroadcastButtonAdapter;
import dev.materialtidal.extension.tidal.linn.adapter.LinnBroadcastItemAdapter;
import dev.materialtidal.extension.tidal.linn.adapter.LinnBroadcastProviderAdapter;

/**
 * Coordinates Linn OpenHome Wi-Fi device discovery, connection lifecycle, and TIDAL's
 * {@code BroadcastManager} ({@code Luz4;}) integration.
 */
public final class LinnBroadcastController implements LinnPlaybackController.ExternalEventListener {

    private static final String TAG = "MaterialTidalLinn";
    private static final LinnBroadcastController INSTANCE = new LinnBroadcastController();

    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final List<Object> listeners = new CopyOnWriteArrayList<>();

    private final LinnVolumeController volumeController = new LinnVolumeController();
    private final LinnPlaybackController playbackController = new LinnPlaybackController(volumeController, this);
    private final LinnBroadcastButtonAdapter buttonAdapter = new LinnBroadcastButtonAdapter();
    private final LinnSsdpDiscovery discovery;

    private volatile LinnBroadcastProviderAdapter providerAdapter;
    private volatile List<LinnBroadcastItemAdapter> cachedItems = new ArrayList<>();
    private volatile LinnBroadcastItemAdapter connectedItem;
    private volatile boolean connecting;

    private LinnBroadcastController() {
        this.discovery = new LinnSsdpDiscovery(this::onDevicesDiscovered);
    }

    public static LinnBroadcastController getInstance() {
        return INSTANCE;
    }

    public synchronized LinnBroadcastProviderAdapter getProviderAdapter() {
        if (providerAdapter == null) {
            providerAdapter = new LinnBroadcastProviderAdapter(this);
        }
        return providerAdapter;
    }

    public Object getBroadcastButtonAdapter() {
        return buttonAdapter;
    }

    public Object getVolumeControlAdapter() {
        return volumeController.getVolumeControlAdapter();
    }

    public void init() {
        discovery.triggerQuickScan();
    }

    public void startScanning() {
        discovery.startScanning();
    }

    public void stopScanning() {
        discovery.stopScanning();
    }

    public void addListener(Object listener) {
        if (listener != null && !listeners.contains(listener)) {
            listeners.add(listener);
        }
    }

    public Object getAllAvailableDevicesSingle() {
        List<Object> list = new ArrayList<>(cachedItems.size());
        list.addAll(cachedItems);
        return LinnTidalBridge.nativeCreateSingleJust(list);
    }

    public Object getConnectedItem() {
        return connectedItem;
    }

    public boolean isConnected() {
        return connectedItem != null && !connecting;
    }

    public boolean isConnecting() {
        return connecting;
    }

    public boolean isValidItem(Object item) {
        return item instanceof LinnBroadcastItemAdapter;
    }

    public void connect(Object rawItem) {
        if (!(rawItem instanceof LinnBroadcastItemAdapter)) {
            return;
        }
        LinnBroadcastItemAdapter item = (LinnBroadcastItemAdapter) rawItem;
        LinnDevice dev = discovery.findByItemId(item.deviceItemId);
        if (dev == null) {
            notifyDisconnected(1);
            return;
        }

        connecting = true;
        connectedItem = item;
        Log.i(TAG, "Connecting to " + dev.getDisplayTitle() + " (" + dev.host + ":" + dev.port + ")");
        notifyConnecting();

        executor.execute(() -> {
            try {
                int playlistIdx = -1;
                if (LinnConfig.isAutoWakeAndSwitchEnabled() && dev.supportsProduct()) {
                    playlistIdx = LinnOpenHomeClient.ensureAwakeAndPlaylistSource(dev);
                }
                Log.i(TAG, "Connect ready: " + dev.getDisplayTitle() + " playlistIdx=" + playlistIdx);
                playbackController.setPendingDevice(dev, playlistIdx);
                volumeController.attachDeviceBlocking(dev);

                mainHandler.post(() -> {
                    connecting = false;
                    connectedItem = item;
                    LinnTidalBridge.switchToLinnPlayback(playbackController.getPlaybackAdapter());
                    notifyConnectedImmediate();
                    Log.i(TAG, "Connected to " + dev.getDisplayTitle());
                });
            } catch (Exception e) {
                Log.e(TAG, "Connect failed for " + dev.getDisplayTitle(), e);
                mainHandler.post(() -> {
                    connecting = false;
                    connectedItem = null;
                    volumeController.detachDevice();
                    notifyDisconnectedImmediate(1);
                });
            }
        });
    }

    public void disconnect(Object disconnectCallback) {
        Log.i(TAG, "Disconnect requested (hasCallback=" + (disconnectCallback != null) + ")");
        connecting = false;
        connectedItem = null;
        volumeController.detachDevice();

        if (disconnectCallback != null) {
            LinnTidalBridge.nativeInvokeDisconnectCallback(disconnectCallback);
        } else {
            LinnTidalBridge.switchToLocalPlayback();
            notifyDisconnected(0);
        }
    }

    public static void onPlayQueuePrepared(Object queue, Object prepareParams) {
        boolean autoPlay = LinnTidalBridge.nativeReadPrepareAutoPlay(prepareParams);
        INSTANCE.playbackController.onPlayQueuePrepared(queue, autoPlay);
    }

    public static void onPlayQueueCleared(Object queue) {
        INSTANCE.playbackController.onPlayQueueCleared(queue);
    }

    public static void onMusicServiceDestroyed() {
        Log.i(TAG, "onMusicServiceDestroyed called");
        INSTANCE.connecting = false;
        INSTANCE.connectedItem = null;
        INSTANCE.volumeController.detachDevice();
        INSTANCE.playbackController.stopImmediatelyOnShutdown("MusicService.onDestroy");
    }

    @Override
    public void onExternalStandbyOrSourceSwitch() {
        mainHandler.post(() -> {
            Log.w(TAG, "Disconnecting due to external standby or source switch");
            connecting = false;
            connectedItem = null;
            volumeController.detachDevice();
            LinnTidalBridge.switchToLocalPlayback();
            notifyDisconnectedImmediate(2);
        });
    }

    @Override
    public void onConnectionError() {
        mainHandler.post(() -> {
            Log.w(TAG, "Disconnecting due to OpenHome connection error");
            connecting = false;
            connectedItem = null;
            volumeController.detachDevice();
            LinnTidalBridge.switchToLocalPlayback();
            notifyDisconnectedImmediate(1);
        });
    }

    /**
     * Invoked from patched {@code Lka2;->c(Ly92;)} to render the custom Linn OpenHome subtitle
     * in TIDAL's Devices bottom sheet without needing resource-ID injection.
     */
    public static void bindCustomSubtitle(Object item, View subtitleView) {
        if (item instanceof LinnBroadcastItemAdapter && subtitleView instanceof TextView) {
            TextView tv = (TextView) subtitleView;
            tv.setText(((LinnBroadcastItemAdapter) item).subtitleText);
            tv.setVisibility(View.VISIBLE);
        }
    }

    private void onDevicesDiscovered(List<LinnDevice> devices) {
        List<LinnBroadcastItemAdapter> items = new ArrayList<>(devices.size());
        for (LinnDevice d : devices) {
            items.add(new LinnBroadcastItemAdapter(d.itemId, d.getDisplayTitle(), -1, d.udn, d.getSubtitle()));
        }
        cachedItems = items;
        notifyDevicesUpdated();
    }

    private void notifyConnectedImmediate() {
        final Object provider = getProviderAdapter();
        for (Object l : listeners) {
            LinnTidalBridge.nativeNotifyListenerConnected(l, provider);
        }
    }

    private void notifyConnected() {
        mainHandler.post(this::notifyConnectedImmediate);
    }

    private void notifyConnecting() {
        final Object provider = getProviderAdapter();
        mainHandler.post(() -> {
            for (Object l : listeners) {
                LinnTidalBridge.nativeNotifyListenerConnecting(l, provider);
            }
        });
    }

    private void notifyDisconnectedImmediate(int reason) {
        final Object provider = getProviderAdapter();
        for (Object l : listeners) {
            LinnTidalBridge.nativeNotifyListenerDisconnected(l, provider, reason);
        }
    }

    private void notifyDisconnected(int reason) {
        mainHandler.post(() -> notifyDisconnectedImmediate(reason));
    }

    private void notifyDevicesUpdated() {
        mainHandler.post(() -> {
            for (Object l : listeners) {
                LinnTidalBridge.nativeNotifyListenerDevicesUpdated(l);
            }
        });
    }
}
