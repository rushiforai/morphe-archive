package dev.materialtidal.extension.tidal.linn.adapter;

import dev.materialtidal.extension.tidal.linn.LinnBroadcastController;

/**
 * Patch-time adapter implementing {@code Lda2;} ({@code BroadcastProvider}).
 */
@SuppressWarnings("unused")
public final class LinnBroadcastProviderAdapter {

    private final LinnBroadcastController controller;

    public LinnBroadcastProviderAdapter(LinnBroadcastController controller) {
        this.controller = controller;
    }

    public void addListenerImpl(Object listener) {
        controller.addListener(listener);
    }

    public void connectImpl(Object item) {
        controller.connect(item);
    }

    public void disconnectImpl(Object callback) {
        controller.disconnect(callback);
    }

    public Object getAllAvailableDevicesImpl() {
        return controller.getAllAvailableDevicesSingle();
    }

    public Object getBroadcastProviderButtonImpl() {
        return controller.getBroadcastButtonAdapter();
    }

    public Object getBroadcastProviderGroupButtonImpl() {
        return null;
    }

    public Object getConnectedItemImpl() {
        return controller.getConnectedItem();
    }

    public Object getVolumeControlImpl() {
        return controller.getVolumeControlAdapter();
    }

    public void init() {
        controller.init();
    }

    public boolean isConnected() {
        return controller.isConnected();
    }

    public boolean isConnecting() {
        return controller.isConnecting();
    }

    public boolean isValidItemImpl(Object item) {
        return controller.isValidItem(item);
    }

    public void startScanning() {
        controller.startScanning();
    }

    public void stopScanning() {
        controller.stopScanning();
    }
}
