package dev.materialtidal.extension.tidal.linn.adapter;

import dev.materialtidal.extension.tidal.linn.LinnTidalBridge;

/**
 * Patch-time adapter implementing {@code Lea2;} ({@code BroadcastProviderButton}).
 */
@SuppressWarnings("unused")
public final class LinnBroadcastButtonAdapter {

    public int getConnectedAnimDrawableResId() {
        return LinnTidalBridge.nativeGetDrawableResId(2);
    }

    public int getConnectedDrawableResId() {
        return LinnTidalBridge.nativeGetDrawableResId(0);
    }

    public int getConnectingDrawableResId() {
        return LinnTidalBridge.nativeGetDrawableResId(1);
    }
}
