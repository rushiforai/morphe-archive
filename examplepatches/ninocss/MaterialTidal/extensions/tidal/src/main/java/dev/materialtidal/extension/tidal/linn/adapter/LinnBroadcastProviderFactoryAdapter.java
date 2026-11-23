package dev.materialtidal.extension.tidal.linn.adapter;

import dev.materialtidal.extension.tidal.linn.LinnBroadcastController;

/**
 * Patch-time adapter implementing {@code Lfa2;} ({@code BroadcastProviderFactory}).
 */
@SuppressWarnings("unused")
public final class LinnBroadcastProviderFactoryAdapter {

    public void addListenerImpl(Object listener) {
        // Availability is always true once the optional Linn patch is enabled.
    }

    public Object getImpl() {
        return LinnBroadcastController.getInstance().getProviderAdapter();
    }

    public boolean isAvailable() {
        return true;
    }

    public void refreshAvailability() {
    }
}
